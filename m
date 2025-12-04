Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B693CD1D892
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 09:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFa1DW99j6gVNZW6g0YLnZP+nQt7kAceUNNMyS/mDgU=; b=aLmO1x8GuxdjJn+DMa0gy/t7MA
	kG1tlJv+Ir9aNF+4dtQMT+BQ2JCuCBIJrsRyd91QI4XiqqTKGN/gmMW50BLdY1d2M2/1VWd42CweR
	M7yOmk3VHjUqyv3V+jxAeklxJXgKgbmEuQHyPMt0YNyO2h9fsJJbupbCGtu7Kf93QwEXndivpGyGY
	/9tLBNl8AiFv9gYmoxiqTTnHS3KX+PCaCmz4e3p/6bQC58mIKrnl7sVYSOP/t3PzvbP3hcY6pdU8u
	jTgGvWcg/mCX6VIG0+vNFKRqnt5NGEFBtxwEvWC1GFKJmrMCzd+DQmRdtdFFzEi84dcyZZvAhT6Li
	5a7Xv2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5x3-00000007mtf-3xMH;
	Thu, 04 Dec 2025 09:48:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR5wz-00000007mp2-3m2L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 09:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D7404444F;
	Thu,  4 Dec 2025 09:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCD5C19421;
	Thu,  4 Dec 2025 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764841717;
	bh=si+8MTGO26F/F4k3uMd0juQ9tO6Gxb5QxflpsHGJ3G0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z4bU6XTcdt+v3Kdol3M/Ni3Kd3j/0yJoYVLUn0MstA+PTCT1eXJcCxGzfq+eI/axC
	 eW6qRv6dEd+M1j6y7jsm+TCv40RS+kJ01gAXFPyZ9tJAg8LWbK3rXLwYwwqH4Sls4N
	 9BppbVn8/nblB4QsNI1t0AuW//7z/EXp0ieJ769DpE493ByBA2Z24WHHPO+tWgyrfI
	 3RQXTOBPhqEbuGH+HblKV/8KBlPxkxmY0eJ6k2Ycw5NIhylTsJ3gC6WHAIJHxqYmad
	 QCAHdz5XgxcW1QLzbtmo1rzQNbaQw/8mcK2VBUFJ6q7pvHRcqge3qEL1DcSWJknEq6
	 rsPrnzMTPcwcQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vR5ww-0000000AP90-1fVv;
	Thu, 04 Dec 2025 09:48:34 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v3 1/9] arm64: Repaint ID_AA64MMFR2_EL1.IDS description
Date: Thu,  4 Dec 2025 09:47:58 +0000
Message-ID: <20251204094806.3846619-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251204094806.3846619-1-maz@kernel.org>
References: <20251204094806.3846619-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_014838_005001_BC05B5C9 
X-CRM114-Status: GOOD (  12.25  )
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

ID_AA64MMFR2_EL1.IDS, as described in the sysreg file, is pretty horrible
as it diesctly give the ESR value. Repaint it using the usual NI/IMP
identifiers to describe the absence/presence of FEAT_IDST.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/sys_regs.c | 2 +-
 arch/arm64/tools/sysreg            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
index 82da9b03692d4..107d62921b168 100644
--- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
+++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
@@ -134,7 +134,7 @@ static const struct pvm_ftr_bits pvmid_aa64mmfr2[] = {
 	MAX_FEAT(ID_AA64MMFR2_EL1, UAO, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, IESB, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, AT, IMP),
-	MAX_FEAT_ENUM(ID_AA64MMFR2_EL1, IDS, 0x18),
+	MAX_FEAT_ENUM(ID_AA64MMFR2_EL1, IDS, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, TTL, IMP),
 	MAX_FEAT(ID_AA64MMFR2_EL1, BBM, 2),
 	MAX_FEAT(ID_AA64MMFR2_EL1, E0PD, IMP),
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 1c6cdf9d54bba..3261e8791ac03 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2257,8 +2257,8 @@ UnsignedEnum	43:40	FWB
 	0b0001	IMP
 EndEnum
 Enum	39:36	IDS
-	0b0000	0x0
-	0b0001	0x18
+	0b0000	NI
+	0b0001	IMP
 EndEnum
 UnsignedEnum	35:32	AT
 	0b0000	NI
-- 
2.47.3


