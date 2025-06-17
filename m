Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D81C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 20:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FZMVpOFfGrhpy+BqhR0VNAbAHsN1QmMl8cHtZNMGX+0=; b=fZD/pvKVKagZ/qem2qmJAJkiO4
	VoXGS+2qQFzgPdHHnaXMj4/l0CejvoOZBRsH5h1CM4VB56zWWHQF7YvCLOqkPZ1VnS2A88BjkQs/b
	LXlpZ+pM0T/KjSktQTbRGvPKMgolV16UQ2kQiz3QPs63ARjY3SjJgNH49b2yx6k6T5jQiFay3AgWW
	0jz1YwcNdml+67ZsFfDMNluUv5765C2npQU+nPwmdlrPH5D2vc7QR4q++tUpi0/ZLQsULdom/YV64
	HoKT4zBSiFjc9EAyO/+bvnx9FF0bPNXhzcrag3ZbDW+y1uzkKnvoUIlDGd00zHKsFFbcsdDxLnRth
	3hV+QNAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcZf-00000008JQp-3fc8;
	Tue, 17 Jun 2025 20:06:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRcXT-00000008JFE-2At6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 20:04:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 917D04A564;
	Tue, 17 Jun 2025 20:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42536C4CEE3;
	Tue, 17 Jun 2025 20:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750190650;
	bh=pGjplF3VV7f7WBNYLa3u+BbCGJciyZq1HNlyXp3mq4g=;
	h=Date:From:To:Cc:Subject:From;
	b=nFoLuLhi7ViutAtgg+glKMXV6bKjaxoHVsC3uK+dwzUebTq8BI19iUouQlQY2tj+c
	 e+6Bmf1fK0m4x6NegQ1y8ZQ5SBqGbszHJLxjhdPGYIj4y10XCJQDhmgX8t7sjHI/1y
	 p+5vVxigSyKwvPFICIEteKCoOq8X9w7sTdEQtyS0qNwWeB8JJwcmvtre5/eRXMqcFJ
	 xde65K5abt5viLM9vvf1YRCVx1/QMojLkHI7y9WKqCTZeprLqOEZiDzFLTHPzgeTo/
	 U/BbEEb49YphiO+3xiGa+hp0SNmi1/6Ebg8lVXMcmLbcPij78qQNntmOH20KhIF/DK
	 0hHX/yP5agzpg==
Date: Tue, 17 Jun 2025 13:04:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>
Subject: as-instr in Kbuild broken for arch/arm
Message-ID: <20250617200406.GA3636948@ax162>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_130411_597346_50553D53 
X-CRM114-Status: GOOD (  13.47  )
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

Hi Masahiro,

I backported commit d5c8d6e0fa61 ("kbuild: Update assembler calls to use
proper flags and language target") to 5.4 due to an upstream clang
change that necessitates this [1] but it causes a failure for as-instr
with arm [2] because arch/arm/Makefile uses '-include asm/unified.h' for
KBUILD_AFLAGS but LINUXINCLUDE is not present in the as-instr command,
resulting in

  <built-in>:1:10: fatal error: 'asm/unified.h' file not found
      1 | #include "asm/unified.h"
        |          ^~~~~~~~~~~~~~~
  1 error generated.

There does not appear to be any uses of as-instr within Kbuild (as
opposed to Kconfig) for arch/arm after commit 541ad0150ca4 ("arm: Remove
32bit KVM host support") in 5.7 but as far as I can tell, it is still
possible to hit this issue in upstream if one were to be added.

I see two obvious solutions but I am not sure what you would prefer.

1. Add LINUXINCLUDE to the as-instr invocation, which would ensure
relative '-include' flags can always be interpreted correctly, but I am
unsure if this has other implications.

diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index ef91910de265..3dc814f0cae8 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -38,7 +38,7 @@ as-option = $(call try-run,\
 # Usage: aflags-y += $(call as-instr,instr,option1,option2)
 
 as-instr = $(call try-run,\
-	printf "%b\n" "$(1)" | $(CC) -Werror $(CLANG_FLAGS) $(KBUILD_AFLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
+	printf "%b\n" "$(1)" | $(CC) -Werror $(CLANG_FLAGS) $(LINUXINCLUDE) $(KBUILD_AFLAGS) -Wa$(comma)--fatal-warnings -c -x assembler-with-cpp -o "$$TMP" -,$(2),$(3))
 
 # __cc-option
 # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)

2. Turn 'asm/unified.h' into an absolute path, which easily fixes this
particular instance but does not prevent it from occurring again. It
seems unlikely that it would because '-include' does not appear to be
too common across the tree but I am always leery of silent failures like
this.

diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 4808d3ed98e4..e31e95ffd33f 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -149,7 +149,7 @@ endif
 # Need -Uarm for gcc < 3.x
 KBUILD_CPPFLAGS	+=$(cpp-y)
 KBUILD_CFLAGS	+=$(CFLAGS_ABI) $(CFLAGS_ISA) $(arch-y) $(tune-y) $(call cc-option,-mshort-load-bytes,$(call cc-option,-malignment-traps,)) -msoft-float -Uarm
-KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include asm/unified.h -msoft-float
+KBUILD_AFLAGS	+=$(CFLAGS_ABI) $(AFLAGS_ISA) -Wa,$(arch-y) $(tune-y) -include $(srctree)/arch/arm/include/asm/unified.h -msoft-float
 KBUILD_RUSTFLAGS += --target=arm-unknown-linux-gnueabi
 
 CHECKFLAGS	+= -D__arm__

[1]: https://lore.kernel.org/20250604233141.GA2374479@ax162/
[2]: https://lore.kernel.org/CACo-S-1qbCX4WAVFA63dWfHtrRHZBTyyr2js8Lx=Az03XHTTHg@mail.gmail.com/

Cheers,
Nathan

