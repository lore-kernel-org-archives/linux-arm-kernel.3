Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84B5CF539F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ner+W9iFECTALUgzAo9ZISM4cjKDl3QCIkCPVFIwJIY=; b=W0gxsnPdzaR8vT6RVTnH/+HEFu
	/1d7S3pqhs7uUSD/UQiG2ZpgGvfL+lEsyoZb9GL1miiZB87zeQeTbGa/UH66Gc7vwGV71/EomObt7
	GGoG2OipE7h+nnOq1Q+AQ+QGxAwQpg7A6SC2NN8fTiMmw1brxQ/PegUgPONmgpw5iejL62Z8la4Ak
	5f+ia/wGEfkOsXpo0v1IbsBm2Wb6ULlpdQmRkUKmoI+vxgZUo3YBIlMuSsCl8/2fH+/HNaw15SSpE
	LScGa9K0t23cqZ1LoPtCQ93gB+tLd01faqPaStBFyxML3bBlOHb+GcQDpCkG/LmagA/05DeqUknAo
	aNJUQqvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3cwK-0000000EsrM-3JBB;
	Wed, 23 Oct 2024 15:06:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckE-0000000EpI3-0DFR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 03DF95C5E80;
	Wed, 23 Oct 2024 14:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5619CC4CEF1;
	Wed, 23 Oct 2024 14:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695233;
	bh=+Mi+ChfY8Q2QN7X3Fm7RfJa/0ezUgsD5Bs2HZBlFNkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HIB96ixSHSSM0tdvFnXb8249wKGJkZ3TRIu9QVw54vzFAfRKDmUgMFLtnMS9wFyIP
	 399w8CqiQRzfpcqfwVJ3afQcr5HxkJR1S6EfIXDOm5wkSYz8pd2WVpvxpy8fMw3a4W
	 DCrx19mAfrpFl5ES6ad8ngbe65tM8f16SIGUMASc+DE0k/3vRca09zVn2W1AXySsdb
	 /UXh0OvRmAm00rhVi1uxFARVF9HnRBRm8PFJulmqzDjdqYcsrNhoxb6G/6K+62AgVJ
	 qijWgi9qOVu/xLmb2yhr4jnbI95g4IlngtWoIWzDeEYgFdFT3Dhr472x/D9MScwQQT
	 uwdYc0oY18ZtA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckB-0068vz-Fs;
	Wed, 23 Oct 2024 15:53:51 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 10/37] arm64: Define ID_AA64MMFR1_EL1.HAFDBS advertising FEAT_HAFT
Date: Wed, 23 Oct 2024 15:53:18 +0100
Message-Id: <20241023145345.1613824-11-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075354_149818_3126F396 
X-CRM114-Status: UNSURE (   9.58  )
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

This definition is missing, and we are going to need it to sanitise
TCR2_ELx.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 3c812fd28eca2..8db4431093b26 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1688,6 +1688,7 @@ UnsignedEnum	3:0	HAFDBS
 	0b0000	NI
 	0b0001	AF
 	0b0010	DBM
+	0b0011	HAFT
 EndEnum
 EndSysreg
 
-- 
2.39.2


