Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE3ACCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NbJMedQSgMeF1x17YjO/qLNJsjbtU/nMqdfEt6aFy9Y=; b=2voKoW1VP+V+hgHbfs9VHqYnuM
	rY3hyfKzVzcJ6bAYRgcjnoHtcRzw7Ff+jy9mtM3/fXFEI6hwWSJlY4NbUfU56mSc5bCZMPTet6w7e
	nMOH2qvfkm8rWGo93asszDjhTuEWZsVgeI7pbpA2KEmV25SkcfOSBk55X8K6+ldFYUmjIB3HNDvc7
	MEVNIFHVVo+HcZ1THpdJsdYeHOEDqgyaPzLVEn+EmISanMV6fmqG1BH/KglSkSCZvI+BA8NCFYHqy
	42o52i/SLdkSfMVlx+DdmnFHBnFjRdY8HGjK7Daw8TsjWE9KGLuOfxnXPe9R8eXFZHiHnAvxOlgpx
	wrHxekcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78O5-00000007yQl-2U75;
	Fri, 10 Oct 2025 08:22:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78O2-00000007yOY-3nUT
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 08:22:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NbJMedQSgMeF1x17YjO/qLNJsjbtU/nMqdfEt6aFy9Y=; b=gjptNdgIFbUwF03VZMY8jm4Fpj
	uavyLTx4sMwhXE6GsdfcMnqa3Ab+cqaGTadNa05bpJ7NKVHalZo1c9RAiR59SCMsgSmRWpyUfnnHb
	dsFMQUjYKzZr6gX/YJ0kyNSDSL+TqbKd91q0sS+IcfiOun5fpGw8JneyMwTJ8vgt63R0WhcCaaww9
	+PIgNO7x6xJ8QQudpWn9ckHCWmgtGm4r6eUvxsvltEGPVOoHQHYm22PKJJHHwWZdPGENANVWsXlxd
	GFREPZPm/21gb2yTTx8/ydTdA/bvgFJLuHwTDaIsf3PkAouqhdsGSKxImsxROx04Oi1MeoXY67cIA
	sDLEE2Vg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78Nx-000000021E3-0iEY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760084505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NbJMedQSgMeF1x17YjO/qLNJsjbtU/nMqdfEt6aFy9Y=;
	b=BHTwpR6e7wr4ErpXXeyOzQaa3+JiU8c2M+FWKXv7kVdTRl5GD2g5sLQCotbnGJGsYhjKch
	p1SN+tAGF+Wmas4ZUTDTjVGYihQG+uBoUmyRGrksu7rcAbksuJlC2K7lIpWvb0XY7UUZrK
	cDmAogVCXuqAJA6c/SvPUhfsRkFmtZI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760084512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NbJMedQSgMeF1x17YjO/qLNJsjbtU/nMqdfEt6aFy9Y=;
	b=LCrod3UzTKfMtafcmYEosa/CfWxrsjgdfo2zjKdj475p5Tpl13kQf+xNFKxgP1caA3ttT5
	TU1Gd6OzCCLhbZMWv3hZR5FCbmQEtAkIFIM3/7fkYdY9qS7TtcmJHh6piPM5VcfQq8igyX
	P/MolUMxtQfmlmPuumib7YTBUNK7Xig=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-LyXFZlozPY-w4DYJVHunvg-1; Fri, 10 Oct 2025 04:21:44 -0400
X-MC-Unique: LyXFZlozPY-w4DYJVHunvg-1
X-Mimecast-MFC-AGG-ID: LyXFZlozPY-w4DYJVHunvg_1760084503
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-40fd1b17d2bso933371f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Oct 2025 01:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760084503; x=1760689303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbJMedQSgMeF1x17YjO/qLNJsjbtU/nMqdfEt6aFy9Y=;
        b=Cx+WLW+vdT6nzem5ChQo/okp0VF1aFXrnd1WjqYvWVFwxJR93HHk4PjTrYU+QRyXCf
         shzRvsozGoi8HahUIh7aST8KSJ/YfKCSLwhCB7sdtRz9RTDPA+T2h5E/n6VbRAVGbavI
         f7uyq7EAhPXbiRJRxsRlFqMIHMXJCpGWsLfrbjo1cLR0cB/uf7+Vh2FfupWA7mEHdlVG
         9Z8MOPGI0u0YDT2U9WnCnRDPtp87ewau6VDydiQtuuyrxQQ5MBKnLRfehedtFmRrEWFl
         2dJ0ICuC8UvDb+Cq7nZmqEzJqRnIOsN9F+ZuG4Mur3YqPNx6uIlGi8TK65yVuSpiYXtt
         It9A==
X-Forwarded-Encrypted: i=1; AJvYcCVmzSO5WGqvC0lhmsW8t+5fIt38NeZoAfVK7QfKDbxx2uCyB1gw8QTJy9A6B67MUMopnmUns3bIrifN3CBxn2s0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxani2Cmu2PIe3T8eb2IjU4Tstlka3dxEgUoM+OUtI84cKg7zFs
	EM06ZIPtCtRdlFMNrBAZLSD8P+o0ZDGcmX0VBxvvnA54PryGmMpFDENYkM2uRgcJJIr0z1/1+fM
	vJOS0RRfSCQU2XMfzwvh1JqOC8ahnwluEEFTb72TTDapdJMxLbLXRpVzaAToFoXFYnT/utfbkgb
	Qq
X-Gm-Gg: ASbGnctYzex/69uXuDoDiq+k9zsleb6z5OQ36Wzw0Xm/54cRAQJvYhHVvTkVxdWrRDT
	Ut2wIoJtxazynIA2Y08n3arXGmMWINjglLQiCE7UrULZ2+YRHdYvJOPjCAY1DDMUtg5Qqjh4OnC
	5DtM9lvgt7bDpfM8x6wXXX03XSfpc4mtUWPobK/o9qkiSuBRb+vSH1MCFtEC3trHDGeo75dYjlU
	mt5bnAlKhdWsGsAmIMNjMpm5eGfEGRHOfaymEWxchb3hfYu8Gajdxegl92fHQcgylVJMAZeEnLa
	hlySKOPFD7lElPL2zZs4BimC9t1v/yZO2joA434Z2kvvT5VvfxQLbjFmyVpRACzBGQj/41TMb01
	dHRpe1aM51DAKmQ==
X-Received: by 2002:a05:6000:2910:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-4266e8db2abmr6017880f8f.62.1760084502780;
        Fri, 10 Oct 2025 01:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtaiyaP4ciHOEVEUj0fw2KNuY3ZMQkjybKrv/92syV0a+JBFL/CPIzPSOnaTNXUhiK7HidDA==
X-Received: by 2002:a05:6000:2910:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-4266e8db2abmr6017864f8f.62.1760084502351;
        Fri, 10 Oct 2025 01:21:42 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583424sm2946970f8f.21.2025.10.10.01.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 01:21:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] treewide: drop outdated compiler version remarks in Kconfig help texts
Date: Fri, 10 Oct 2025 10:21:38 +0200
Message-ID: <20251010082138.185752-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NgeQQAlYwP33rNibU3iCJXQ6U33kOXaT__pGOTgmAmo_1760084503
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_092157_869895_631E903D 
X-CRM114-Status: GOOD (  19.05  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

As of writing, Documentation/Changes states the minimal versions of GNU C
being 8.1, Clang being 15.0.0 and binutils being 2.30. A few Kconfig help
texts are pointing out that specific GCC and Clang versions are needed, but
by now, those pointers to versions, such later than 4.0, later than 4.4, or
clang later than 5.0, are obsolete and unlikely to be found by users
configuring their kernel builds anyway.

Drop these outdated remarks in Kconfig help texts referring to older
compiler and binutils versions. No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
Andrew, please pick this quick tree-wide help text clean-up patch.
Thanks.

 arch/Kconfig      | 19 ++++++++-----------
 arch/arm/Kconfig  |  2 --
 lib/Kconfig.debug |  3 +--
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 74ff01133532..602ede49daf9 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -232,17 +232,14 @@ config HAVE_EFFICIENT_UNALIGNED_ACCESS
 config ARCH_USE_BUILTIN_BSWAP
 	bool
 	help
-	  Modern versions of GCC (since 4.4) have builtin functions
-	  for handling byte-swapping. Using these, instead of the old
-	  inline assembler that the architecture code provides in the
-	  __arch_bswapXX() macros, allows the compiler to see what's
-	  happening and offers more opportunity for optimisation. In
-	  particular, the compiler will be able to combine the byteswap
-	  with a nearby load or store and use load-and-swap or
-	  store-and-swap instructions if the architecture has them. It
-	  should almost *never* result in code which is worse than the
-	  hand-coded assembler in <asm/swab.h>.  But just in case it
-	  does, the use of the builtins is optional.
+	  GCC and Clang have builtin functions for handling byte-swapping.
+	  Using these allows the compiler to see what's happening and
+	  offers more opportunity for optimisation. In particular, the
+	  compiler will be able to combine the byteswap with a nearby load
+	  or store and use load-and-swap or store-and-swap instructions if
+	  the architecture has them. It should almost *never* result in code
+	  which is worse than the hand-coded assembler in <asm/swab.h>.
+	  But just in case it does, the use of the builtins is optional.
 
 	  Any architecture with load-and-swap or store-and-swap
 	  instructions should set this. And it shouldn't hurt to set it
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e3f93b690f4..9b4024b277d4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1159,8 +1159,6 @@ config AEABI
 	  disambiguate both ABIs and allow for backward compatibility support
 	  (selected with CONFIG_OABI_COMPAT).
 
-	  To use this you need GCC version 4.0.0 or later.
-
 config OABI_COMPAT
 	bool "Allow old ABI binaries to run with this kernel (EXPERIMENTAL)"
 	depends on AEABI && !THUMB2_KERNEL
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 8aaaf72ec4f7..29e11893c873 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -342,8 +342,7 @@ config DEBUG_INFO_COMPRESSED_ZLIB
 	depends on $(cc-option,-gz=zlib)
 	depends on $(ld-option,--compress-debug-sections=zlib)
 	help
-	  Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
-	  5.0+, binutils 2.26+, and zlib.
+	  Compress the debug information using zlib.
 
 	  Users of dpkg-deb via debian/rules may find an increase in
 	  size of their debug .deb packages with this config set, due to the
-- 
2.51.0


