Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCCA8C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Apr 2025 04:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+XAO5wt0ktJuJ5hEdlkeCvL90T0dhvyuQigSTjc3SHA=; b=gOETqrduxsmktpENl6X4HwHpnH
	MJWbcNXmji4MCmeYvkKFFY7viLvOuQhT1bV8aGn+8rFEvExTwJvTRqaRBQ0T0GjM2yZbxJtzbT7wn
	SMOiB4aEoa4dQn6BIaS3M5Ql3i9z13cWUwI/JruKsXkhwEXkzcFqzCQu0Kql0uSktlV/lIgaOFZeU
	knI/OM5rtwf0DfR3iOjmoUAeF7c5K/9Y1DjN7hzrFzEPi+koG6HeknJQ1jQNPZuDPjnDjfTR1rnSj
	vZj4wcosyf0MfZCmW0lESoXkimT0wOkkQ43yp1YsvSBJq6YPWNoiME1djkugR+P4Cf9DezrxCDiV4
	C4UuF6Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3pRD-0000000GoRL-13E1;
	Sun, 13 Apr 2025 04:59:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3pNd-0000000GnfO-3bBx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Apr 2025 04:55:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D74CDA40709;
	Sun, 13 Apr 2025 04:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35EB2C4CEDD;
	Sun, 13 Apr 2025 04:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520139;
	bh=KIyhx1f4Q7uvfnMxlwu8uJX8GawuhnAXHEOquMlum8c=;
	h=From:To:Cc:Subject:Date:From;
	b=Yc/ME7eQGv8kGFM/ofAJq9o/X0+8PKRBpM3Wp5A+5TdNIaSiKI9px1zivC+4ScNOE
	 edV34Vx6yTLrfmA6YUyw5zdvhZoT23tXp10pvsPW7szRHx12TRNTLtMyrg/X+YqTQp
	 jPiyzNsejFq70gbzcjMylWY8tJzHDhjL2q/fGBAsYQXAqZ2lgNWp+Z5QIIiFeUDz9X
	 CnonudAtwDp1I5jboQgmoWL3IVF/z/968+wE/w6DgOrbLOQRwJzSSFg5+BjyipQWSY
	 Ur5ba8acNYG7o1Ehc6NJ+tF4e1U7N1lHgTSXt2pPaKe9V+6IC59DbmTmOx1mKwPWgl
	 jY4IW/oULs7Zw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 0/9] Remove per-architecture poly1305 shash glue code
Date: Sat, 12 Apr 2025 21:54:12 -0700
Message-ID: <20250413045421.55100-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_215541_962625_E68A2767 
X-CRM114-Status: GOOD (  10.59  )
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

This series removes the per-architecture poly1305 shash glue code and
re-implements the poly1305 shashes on top of the Poly1305 library
functions.  This ends up being much simpler, and it is how it should
have been done originally.  This follows similar changes to crc32,
crc32c, and chacha20.

This series also makes the Poly1305 library be optimized on PowerPC.
Previously the PowerPC-optimized Poly1305 code only supported shash.

Eric Biggers (9):
  crypto: powerpc/poly1305 - implement library instead of shash
  crypto: poly1305 - centralize the shash wrappers for arch code
  crypto: arm/poly1305 - remove redundant shash algorithm
  crypto: arm64/poly1305 - remove redundant shash algorithm
  crypto: mips/poly1305 - drop redundant dependency on CONFIG_MIPS
  crypto: mips/poly1305 - remove redundant shash algorithm
  crypto: x86/poly1305 - remove redundant shash algorithm
  crypto: x86/poly1305 - don't select CRYPTO_LIB_POLY1305_GENERIC
  crypto: poly1305 - remove rset and sset fields of poly1305_desc_ctx

 arch/arm/crypto/Kconfig                 |   6 -
 arch/arm/crypto/poly1305-glue.c         | 170 ++----------------------
 arch/arm64/crypto/Kconfig               |   6 -
 arch/arm64/crypto/poly1305-glue.c       | 143 ++------------------
 arch/mips/crypto/Kconfig                |   6 -
 arch/mips/crypto/poly1305-glue.c        | 120 +----------------
 arch/powerpc/crypto/Kconfig             |  11 +-
 arch/powerpc/crypto/poly1305-p10-glue.c | 134 ++++++-------------
 arch/x86/crypto/Kconfig                 |   8 --
 arch/x86/crypto/poly1305_glue.c         |  99 ++------------
 crypto/Makefile                         |   3 +-
 crypto/poly1305.c                       | 153 +++++++++++++++++++++
 crypto/poly1305_generic.c               | 149 ---------------------
 include/crypto/poly1305.h               |  13 +-
 lib/crypto/poly1305.c                   |   2 -
 15 files changed, 242 insertions(+), 781 deletions(-)
 create mode 100644 crypto/poly1305.c
 delete mode 100644 crypto/poly1305_generic.c


base-commit: 3be3f70ee95da03a87d94c4a714ee679a5c7b34d
-- 
2.49.0


