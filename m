Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110CBCF65F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGwH8iC42eq6G0uqQ4+koCTgx1EDeSLkX8LhPzABChg=; b=UFmutgm4ERADCc2d9f5/wkCq4x
	rhkUvyOfGus3WKBvYSBU2cAz36+CE6g/+l5/a4LgXvlJzz31MNVfrQnY8bgd7P/91XL+F6QMQPvQG
	73li0u0ZmLNWDIWnbVZlcf52SdrJL7mNvb/5onrctVDdPD8jCeJf9Ab7wlS73oJcKhN7KpkHuCfm+
	fmsPhowzcgKJAtHtHLvTqpS1UTTt1mUr87VLZBk/M6TQrQBdTdPItA6nDcx3rhLXQ+FjAUtzKsUHa
	rvW7T6A84X7N/kbXtKaHp24X/w37IiReZlpXEKMBfXEOVRrUKB6xYDBNfNQx87zRl8Zqtxum/6J1b
	/3XN58lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXZ-0000000CVFI-08LL;
	Mon, 26 Jan 2026 12:17:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXG-0000000CUv2-0aVW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9A9044499;
	Mon, 26 Jan 2026 12:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F83C116C6;
	Mon, 26 Jan 2026 12:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429857;
	bh=4TIqGuF2iyYVYwENN7mbjyH/PPVrIV5ghM/SJMxsDIk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EKjAvM0aK44YDcZtBZRR2l7YNBFXPbNHp0f59R2DXNPEmbp38NhexUHaiKwJNDMKZ
	 nW2RpqAL7KoQTpVUiw1eCMbQNnsYjjOgVxL13uyF2IAbfCPW/16ZcIzlif13Vg0i/R
	 8JLbOvP+CNvOCGeF1s4qWJfqHi2Fa30lSMxRGwaplm51YY3KVHG2OSDf8HwPHIu5sF
	 OhzmXOySsvekC/+1sVZ0OJTWcQ0vacR9WpMyGi1TSGfImTAzQTOiaztjNQ38ffhPMN
	 j96AP2Bh1y/stKP/fYxxPypvbVo8Dp+9XfRUZVDk/YVrnUCuGnMZI13C3dOf28A6OH
	 YdFu6x6iOwKWA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXD-00000005hx6-3P9t;
	Mon, 26 Jan 2026 12:17:35 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 18/20] KVM: arm64: Remove all traces of HCR_EL2.MIOCNCE
Date: Mon, 26 Jan 2026 12:16:52 +0000
Message-ID: <20260126121655.1641736-19-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041738_223467_30249F3D 
X-CRM114-Status: GOOD (  11.24  )
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

MIOCNCE had the potential to eat your data, and also was never
implemented by anyone. It's been retrospectively removed from
the architecture, and we're happy to follow that lead.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 1 -
 arch/arm64/tools/sysreg | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index f892098b70c0b..eebafb90bcf62 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -944,7 +944,6 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 		   HCR_EL2_FMO		|
 		   HCR_EL2_ID		|
 		   HCR_EL2_IMO		|
-		   HCR_EL2_MIOCNCE	|
 		   HCR_EL2_PTW		|
 		   HCR_EL2_SWIO		|
 		   HCR_EL2_TACR		|
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 650d7d477087e..724e6ad966c20 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3834,8 +3834,7 @@ Field	43	NV1
 Field	42	NV
 Field	41	API
 Field	40	APK
-Res0	39
-Field	38	MIOCNCE
+Res0	39:38
 Field	37	TEA
 Field	36	TERR
 Field	35	TLOR
-- 
2.47.3


