Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3F1D5CC87
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94qiCXWUuDIydTk8X4LSwVPIw3rMHWBfIZEjN6jzQTM=; b=oEpR2hAlrex31LEDU3sOlMrZTj
	EYsc651xYpPPEgkGeAub5S880VSFer+r6k8R/48TcfCyvTbS3poJviQ1pIGe9hJLjtZVaNVckc/aB
	x56LE+9OU+8jbx4dc6bibqbmpEy8O1/+n74fEGMJHTuwvsSX5xg2Y7VoqDLQfWq1cAVDbHnJ02fwZ
	zK1Kv/8JEksu18YAQ7GEmCOjr+JFXx/RL67mWwRQxQAcTfFqGtf9UubWX0In28WIQ54gNnNIdjEWz
	pLwBayIN5QSyH9Wr+XJeYlk1SV0Zn+PEknx7QKCZBDv2RgD3C5ZhcgrqsdfNftal5Je/Mg0y92vSe
	QMdrJoPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t65ub-0000000HXyu-3f8x;
	Wed, 30 Oct 2024 10:26:49 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65mg-0000000HWXK-2Qz4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:18:39 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-37d458087c0so476544f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730283516; x=1730888316; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=94qiCXWUuDIydTk8X4LSwVPIw3rMHWBfIZEjN6jzQTM=;
        b=MXZViov+ztF9pdGhWp7wBDi1i40iexSr1uvM5TCj9gi4S32izsKx20KtjVD4vNUtrL
         off3xEAc0N2MGeLNlsne1Vo6PYnOI6nxihxeKepfb3+UOFmfWYTZMv5qdKnaGUYWBs8V
         Y++O10iBBMiHo8p0mtvOzBmZl6beAZnHvmpsc3MiyG/hDEngaM3+NO9LNoS/q3z2PbBr
         KffNe3IEbE/c2/orGap7psHTDIWPiFC88SDJQS0j44lt0Sqg7vrN+mAYh0VqssHbiy0F
         N4vaAebhR5U8CgBvPuyrSKNaSMO3r6F+aTH08+UZKJlEzW+RlKvDbtNgYTRgFgAS90Q2
         AOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730283516; x=1730888316;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94qiCXWUuDIydTk8X4LSwVPIw3rMHWBfIZEjN6jzQTM=;
        b=iCOLGwNBbe/AX6UtMQOCqPASYyP3pS1zAs95IyonKnkstcbcamdbOIO95KWxBkkz48
         qhCC3tTeLM9J8XNWmhsyh2SptbSGEZU1pjY5rIL+uOD1OFdVL0EqR3XkPs9VxvD/Figz
         BRZdb3/jWjOaMs34n60Ta0l0t6ZF8GhnNpxiW8qel6WSROqH7owFefOWePIYBYTqNEzM
         xkTMumsaeXqno4wv2fgxaKMoWoO1VgoxO5LlHs17TB7uY2rEJtAuCxCf1WQp36YcJrPL
         +CrdIqJAGkb2e6T2xsVEIA0nL0eYnT2kCzoWvZiebSLgdnRwN1bnWt+Ev2mlv9o030gC
         OKOQ==
X-Gm-Message-State: AOJu0YzfGxrOjHR5rRNhcRViPXLSsg/QfY+9YsFcSR7DgInIqyMag53j
	KRF5vGub5A4a/UcYmF8Du41uTL3tDgBn2JPVYmFfWFKCLFw+Z0CKaCInzqOBZV0erC8cT17YhfS
	/MtgzbXzSaSPImueIaFPNlzohBMcSCrc7GmB4xHIejJFSH+juRL+4MlPk/WnsmrkQQDcQVqnCAf
	WcnaB1bKnyijQ3TxMn/4meX0ueqq88irL0cD8ViZWy
X-Google-Smtp-Source: AGHT+IGgZ0OVXp37+8lR94Wvdy5onp5gAtpP8orinG9/1ZVyPMEa++a9r+U9/Ky9ZN9he1zyQEnHX9oP
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:adf:ee0e:0:b0:37d:3878:ff42 with SMTP id
 ffacd0b85a97d-381b97ee8ffmr2531f8f.5.1730283515784; Wed, 30 Oct 2024 03:18:35
 -0700 (PDT)
Date: Wed, 30 Oct 2024 11:18:08 +0100
In-Reply-To: <20241030101803.2037606-10-ardb+git@google.com>
Mime-Version: 1.0
References: <20241030101803.2037606-10-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441; i=ardb@kernel.org;
 h=from:subject; bh=+QSrRJ4X17z2RWinz87UiXL8BkQ2pVlA6A7QdKOdXQc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIV2J/dGURw+Pr1WzLuW0DhebMaGOi/GdYk5ZvZjG40duz
 L8EU5s6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwEQKNjL8d+ZfneP6eJnzfTPJ
 BLYfizuv/fe2Onfz2p0yJsuvOo6x9xkZpize3nbJzPLyKhHxxisTPeu/aiYZTZp5IUhcOOVRm/8 vVgA=
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030101803.2037606-14-ardb+git@google.com>
Subject: [RFC PATCH 4/8] arm64: Kconfig: eliminate 4k/48-bit VA combination
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_031838_644525_DC8DA843 
X-CRM114-Status: GOOD (  12.15  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Now that LPA2 is supported seamlessly, using alternatives patching where
appropriate to fall back to 48-bit virtual addressing when running with
4k page size on hardware that lacks LPA support, there is no longer a
need to keep the separate 48-bit VA size configurations. Note that LPA2
support can be overridden at boot time by passing arm64.nolva on the
command line, and given that no LPA2 hardware exists yet in the field,
now is a good time to make this change.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6a73fd61b4aa..099b1a825b9f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -382,9 +382,8 @@ config PGTABLE_LEVELS
 	default 3 if ARM64_4K_PAGES && ARM64_VA_BITS_39
 	default 3 if ARM64_16K_PAGES && ARM64_VA_BITS_47
 	default 3 if ARM64_64K_PAGES
-	default 4 if ARM64_16K_PAGES && (ARM64_VA_BITS_48 || ARM64_VA_BITS_52)
-	default 4 if ARM64_VA_BITS_48
-	default 5 if ARM64_4K_PAGES && ARM64_VA_BITS_52
+	default 4 if ARM64_16K_PAGES
+	default 5 if ARM64_4K_PAGES
 
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
@@ -1361,7 +1360,7 @@ config ARM64_VA_BITS_47
 
 config ARM64_VA_BITS_48
 	bool "48-bit"
-	depends on !PAGE_SIZE_64KB
+	depends on PAGE_SIZE_16KB
 
 config ARM64_VA_BITS_52
 	bool "52-bit"
-- 
2.47.0.163.g1226f6d8fa-goog


