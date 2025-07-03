Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829EEC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 10:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ln7w123Xm0+UnmLB5NRtAXsDB0I6SV63N44OwAB8Cw=; b=hZpwzVHhwgUy9cCvOr8zFvfsWh
	Tps0sRFAU5WQ1mxh1jsRz5yo6i2lLFAzqQ3M1pCqhggw25re2c6kU2FoESL4lHxOof+Rr15mO/dUl
	fdZHNM6xrBJwGnUmfd81AVIpVpsK1w0jRkpdRGFaVthW/aQRTThn0SduB8NBf+XrSHKNC6TiutLMW
	LHJQxOlCbwks75zc+EVumx1N5b6cm2qNMGBQQwQFwruUBBPhKE21H1RIbm11smwi5Zo6AG5DgHc3c
	AcmorincMzAIuZi1pz1R0XIdfYIefQ/jbYPqMZKnJeB0lLGAnRReFoQIbMr2RAk65L3tUNt21H8xu
	d3siBYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHX7-0000000B3UY-0g9X;
	Thu, 03 Jul 2025 10:51:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXH8l-0000000Aysl-2BPe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09D1D5C4A0F;
	Thu,  3 Jul 2025 10:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B51BC4CEE3;
	Thu,  3 Jul 2025 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751538362;
	bh=snToJzWBwiqETy97af5AraNsbwKzWEb8CWlj1NZAE/Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CPSdufooijXPxj+sZpjO1Uil8oQYybqMJbePojr2rdcDe4QCrcNTQCtadUI8kw563
	 wCL7QxFtuV+1+YNbspnIrunssDUZcdFH4kfDd0srBLPoOTyjStaUzhwkqE5bzrc9GQ
	 iHjc4jUuCk0C2zUClMqmtW5grZZE2I+T+6zh7s+F39CIEpaX59L59vu0DoxPAkyyUO
	 0pFEYMCzwDbAXTisLNTxwR/1a598AlaulURXrs7HTcg2QSFVJh4m0ietkgcVW7hmFe
	 crSXB4XU4fUQhOw/mqVtbP9c/hTxADuIdwhwZCJXYiaCIqND/zdomjtlv30Wr5hE1W
	 SMTi1JtGmBQ6g==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 03 Jul 2025 12:24:59 +0200
Subject: [PATCH v7 09/31] arm64/sysreg: Add ICC_CR0_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-gicv5-host-v7-9-12e71f1b3528@kernel.org>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
In-Reply-To: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_032603_604713_55918EB3 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

Add ICC_CR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 78a51fbf3a99..ebbb22ed2301 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3519,6 +3519,14 @@ Res0	14:12
 Field	11:0	AFFINITY
 EndSysreg
 
+Sysreg	ICC_CR0_EL1	3	1	12	0	1
+Res0	63:39
+Field	38	PID
+Field	37:32	IPPT
+Res0	31:1
+Field	0	EN
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0


