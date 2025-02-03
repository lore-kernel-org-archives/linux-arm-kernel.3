Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F131DC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 00:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tef/SY+dNrcrhFH8DnMIlZUrQsnCvNl44AY1dT726XY=; b=znWjjnVF7snZ9WUQvtEpGWxRvF
	G59BDhj/3pRnW9QP1+QpVWJUJgt9OSKphamtXGZGY3aJfsaLazf8h3LM8Paon6V3jk6+d5tUWF7ni
	pym5dqnB8QoieXglRgTF5qfFkrZhlVtNFOq+xnM5T3c79+XiJNE+b3bEyL95s8D9mc4HtrdM8Ceus
	Yj8G/Q5HDQdM7clud1i85fFRPMGsk4xrX/ogRv4nWL+U4fYGXMn5yq+st+Lhb9E6VTeUCt78cVonq
	y/LlMLMCP+vb/F4UshWmSlMJcWK+8Skup5t+wXHnyg77Tcdv0j0SkN28A46FqYNRWR0KiDkOsWX13
	FZ8d+Tgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tekZu-0000000ELgO-2Wi0;
	Mon, 03 Feb 2025 00:44:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tekYZ-0000000ELIv-2bL5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 00:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DF6FB5C610A;
	Mon,  3 Feb 2025 00:42:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A62C4CED2;
	Mon,  3 Feb 2025 00:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738543398;
	bh=V8wrbmv6+iU82R3xdPrcgfmHhCpNAQtvlPJUttOpxTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RkUzq0+shuRFTcI2VpNYT4svHSo2rOdw8L1hZKiMwZcgKwXfeZzpJGGWA140p0oP8
	 MS+rKCcRRYqVeg2+xjXlyIYJ4KhVIehW6Y3TbcBB14GLPJQsWncO1lrvqhh8B+IbdK
	 hPMILjYi/BosJtzaiHuNGQBmbIbQi16fWsQplDYZaZ8yeBtQ/z5fkctxVxkDLUusrK
	 UKX6wf7OV/7pZ+7QAX1rBrkXL4dbTd6CT/y0C1W+2XWn9sDPU5Gy5cv4JdvBl+m7am
	 qqVeoW+7g0T1uLg6lDNOL/HI9075HZQUepvXEVU4w6oCAFteqO3MtijLXXFtQ6w1rQ
	 Yl3UqCd20c7Yw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Sun, 02 Feb 2025 18:42:55 -0600
Subject: [PATCH v19 01/11] perf: arm_pmuv3: Call kvm_vcpu_pmu_resync_el0()
 before enabling counters
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250202-arm-brbe-v19-v19-1-1c1300802385@kernel.org>
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
In-Reply-To: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_164319_715853_3868FC8F 
X-CRM114-Status: GOOD (  10.80  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Counting events related to setup of the PMU is not desired, but
kvm_vcpu_pmu_resync_el0() is called just after the PMU counters have
been enabled. Move the call to before enabling the counters.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/perf/arm_pmuv3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
index 0e360feb3432..9ebc950559c0 100644
--- a/drivers/perf/arm_pmuv3.c
+++ b/drivers/perf/arm_pmuv3.c
@@ -825,10 +825,10 @@ static void armv8pmu_start(struct arm_pmu *cpu_pmu)
 	else
 		armv8pmu_disable_user_access();
 
+	kvm_vcpu_pmu_resync_el0();
+
 	/* Enable all counters */
 	armv8pmu_pmcr_write(armv8pmu_pmcr_read() | ARMV8_PMU_PMCR_E);
-
-	kvm_vcpu_pmu_resync_el0();
 }
 
 static void armv8pmu_stop(struct arm_pmu *cpu_pmu)

-- 
2.47.2


