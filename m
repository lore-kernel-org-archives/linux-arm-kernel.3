Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651F1E8FDCC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Stn7BG5p2kiWu3fO1SYV4KqjZkimP4vmWf/OzcEQFxc=; b=uH2ki7l45h9R0ZD93FPXEYHlH/
	+F/pFk8RohW/xghwkwWzEcH2M7mD6DFIDb1n+qw8iibwFrn3EnjZSFC2JO+TY+X49IOaPO+E8qIi7
	U0tdSppaidHzBCwY7m45jiXFm2ThUkTNLB6CBW1x/0gK1Wx3wN+FDQYiQgKmwrgtmKdwdCKBgsvpA
	tpokP63b6Duy4+g9iEmORR/oLXPQDC7ZoPYac36l//emtSHNB4AZVTWa2CepfAd3cGyNFRnrgXFiV
	0o2y22SIIAREmyZ0qxwicXB1DeESY0uZtixqLsdxr5jWhbdz0g9i8X33lDVkOaJSAUE/KmtOB3upz
	cQqXPMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBh-000000021bC-1EpO;
	Sat, 27 Dec 2025 14:22:33 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBd-000000021aH-2bpL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 14:22:31 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7c6da42fbd4so4194983a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 06:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845348; x=1767450148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Stn7BG5p2kiWu3fO1SYV4KqjZkimP4vmWf/OzcEQFxc=;
        b=VgPQWlBcRregWpJI1BpFNZfHJbk+EddvRiRV4aBv8PUjYK5RUkGEYJWwqhwhLBkI/k
         Fgnrx+YxNwMMq8z7+5VlfPPV0VOeblSCSiXyPGlDxhcdvIZy8hQbxpv14u60r919jABw
         SS+0/aOYDaHqDOZcfMB4xrcozXUYG6L/WjkR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845348; x=1767450148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Stn7BG5p2kiWu3fO1SYV4KqjZkimP4vmWf/OzcEQFxc=;
        b=J8eqgHRshuDP1C2mTKgJeP8wnGpRh+PZRXKx6fxDswpIPg33kKDm9ybtkU9yve3anP
         xtEqe+utUSYbbyEmhogWRDAb+kW8JBD9H2DSxyI6X8iO2WAkhLBxwAGDFO4ZRS/EThca
         4Aakb8FFVGXOJwRi4CZorn1wI1s0NbDIFaLzmN7ZergnUU3IT32aWug9oMeNiPjrhbCQ
         vO8RZU6EUyHcYu3kwbyDQ6xB+q5B9ZomKwzFBRxDYx/uDQjqNMY+yeCEiYzu8r181fRt
         09QxA2tdwxeeTyVq+WIxmujaVCcdg/a1rGq5Va7uajpD/JuBG5itSBHTUnLwPGfd7sZq
         ufgQ==
X-Gm-Message-State: AOJu0Yy2aFcv/4kkaomeuJmefkDkha9aKbvxbL5jEnJ6cbJgJchFkAQ/
	VE3rEj8Ps0hWxknd7NyZWnKWk0Q4mz7G5n7Zmb/CZ5jsZEO5NXS9tmjVD9UxEhrhzBmdWVd8yeT
	WAaE=
X-Gm-Gg: AY/fxX4EmkzL4Ee5WLQbr1nFbuiYVxRllzJ6pYFCET00yBgGnJqOaoSeOBO+WKs8Qb0
	NpuZ6iDIiy8zXN4sHHxDtC/9gRMXJGg9FqaueuwleBGjkBqo37BeQ2DimGzTmcZU9K44mEmFyZp
	le8BW4s/5QYJlj6xL7PKfhmY7cxxBcoq7Tiehbxl2b7ZDZXly8CgYpmMpFmulLPyA2fD+tuY/r1
	xi+yo3dsR8l6EbgFgIQabOqZ/6q1Ur5P+Ytv/KX8qFagpu+xhQC7PCAlwc92ug9ruEkYcEjM8A3
	uMDU7mS49D1HFBaHFryhrkSR3tjiSEupdcYuNi3ayfmOJlvLs1lCh75saaNVBfMtarkQqU+Rw1X
	D+culvtQ+2VzfK+C5B9WqhTqMli//4yRd3EIZcamiYIz4Y5IzLR6Yz/6mkZCKS9kskOypcqaeo3
	aWtcfrVF35AHy77Gc=
X-Google-Smtp-Source: AGHT+IGLZpCOF9onuPISW/tPeWU8M37UAPoGGRxrM8fdwUy2auYhL1uc1u62/1fsGdJy6tTGv+8Z1A==
X-Received: by 2002:a05:6808:4a52:10b0:459:b530:28ae with SMTP id 5614622812f47-459b5302fb7mr2050092b6e.63.1766845347754;
        Sat, 27 Dec 2025 06:22:27 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e11sm17352660a34.3.2025.12.27.06.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:22:25 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/6] kbuild: Support a MAKE_FIT_FLAGS environment variable
Date: Sat, 27 Dec 2025 07:21:48 -0700
Message-ID: <20251227142200.2241198-5-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227142200.2241198-1-sjg@chromium.org>
References: <20251227142200.2241198-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_062229_659995_E6BAB503 
X-CRM114-Status: GOOD (  13.86  )
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

In some cases it is useful to be able to pass additional flags to the
make_fit.py script. For example, since ramdisks are typically large,
passing -E to use external data can be helpful.

Add a new MAKE_FIT_FLAGS variable for this.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v7)

Changes in v7:
- Add a new patch with the MAKE_FIT_FLAGS change

 scripts/Makefile.lib | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 28a1c08e3b22..a5641a6538b1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -400,7 +400,7 @@ FIT_COMPRESSION ?= gzip
 
 quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
-- 
2.43.0


