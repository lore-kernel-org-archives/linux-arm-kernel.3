Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2717606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 08:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pX3pJuhl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D0mujMOQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iaCdCVyt1C7egWZ6jI8Y0J3eVgASMFjDhFgq4khrhao=; b=pX3pJuhlIq8cV6
	a6gA4wra8lsfFY/hV+gBAlZFVYv8sYZDGZWuTrkbzjoWNBx7EvmXCJ3NXhHiDriE5i1iS1UQAKi7P
	ru9tvB63N4LoFYFkNJbEuMlurBdjKsQfVifWg/U7O2IQPYj2hk0ibBBklObIMT+cKQt5/XrlCb1p5
	JkCzi4GWVqxXfE3eYiiryrC9Nq2abF0lRzVbgrrmN49LsH2S/NQYxGJlbfXSrMvQrNSOjWLY4OqAX
	GFFM+/IRihCqlLw7FsrnMJWo/njeM4d+r8DS2/FYBZcdL1AYMY/1gg/OuCE6vZ/egomA6ZQuNC/wm
	DoT0Gys37tsMiK8BQ9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFz7-00000001wVu-2vCP;
	Mon, 26 Oct 2026 08:23:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLFz5-00000001wVd-3B7m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 08:23:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C27642DB1;
	Mon, 26 Oct 2026 08:23:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1496A1F031E2;
	Mon, 26 Oct 2026 08:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793002991;
	bh=iaCdCVyt1C7egWZ6jI8Y0J3eVgASMFjDhFgq4khrhao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D0mujMOQvxaakhh5DiXKDIQkG60Tnho4R78TJjGDJj/hVjKK6za+eim4Yz1RQ1306
	 N0bUuIm3HpxA3AkavvniuvVNgJHF3X5tgGL1/78fVzXU49yVURcdoM7Cm+5v7TtEY9
	 Ayx5V+3duCxEXAxyPhPeQaPN482cTXsRMPMsh0YkCDbi42/uTIjqf73r6cOdF+AzaN
	 OAUdaTtO/5jdCOJdoDCuitb/5xTcCOjQ9aWojn9NYzhU87i4JDzbLLShWa9eyluGxS
	 9JRV5ZPzd/aWptPW9jrXPzqEMUSV12ALQDwwoja30ilmw8S/z+0saz0aX6aV8bZisW
	 Pr0qEeUAhilGw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1xLFz3-00000007A40-1Ich;
	Mon, 26 Oct 2026 08:23:09 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 2/2] KVM: arm64: Reenable MTE tag checking on exit from guest when running VHE
Date: Mon, 26 Oct 2026 08:23:05 +0000
Message-ID: <20261026082305.2515705-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026082305.2515705-1-maz@kernel.org>
References: <20261026082305.2515705-1-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, fuad.tabba@linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Once we're back from running a guest, it is important to set TCO to
zero so that MTE is functional again.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 4c965f9b1e1de..73c2dd61e6c69 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -193,6 +193,13 @@ static void __deactivate_traps(struct kvm_vcpu *vcpu)
 	if (!arm64_kernel_unmapped_at_el0())
 		host_vectors = __this_cpu_read(this_cpu_vector);
 	write_sysreg(host_vectors, vbar_el1);
+
+	/*
+	 * We're now able to take MTE exceptions, make sure the VBAR_EL2 is
+	 * set to the correct value.
+	 */
+	if (mte_disable_tco_entry(current))
+		isb();
 }
 NOKPROBE_SYMBOL(__deactivate_traps);
 
-- 
2.47.3


