Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D3CCF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPirOi0w0Cb/s6FnCbMEuNgCnH0qPfOw0gyvUWbzUDU=; b=jWfb0OLAalo4ySD9Uc/Z0eKKvD
	zVUFmIpP0xfZa5+DslBiu+4pry2hWELPOzKjXWuXuqaFpx358qgUHOTd+/qpNqbY6IXIYXazrFLnc
	W7d2Bp2AVVujBisviFwlWrYycxgrP1GhvWfDG9Vn1TgD+VkQItLZNVpYm9kKf1yP8x1LwImPgHoT1
	tInM7/8SpAAsn0+V4YBwH55X3U2vysOjBUSqdEeKI9aQfcesPu4FBvJe9nDpDbbmxkfkFQnsViU8c
	/LJVhOiWYYjqt7dih1D5KIFnvBxXkQJEbfDxFxEg+Zg+4o89B9PfR3uFpjWnI6HX+A54mbBLka02d
	pJXbCCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmhF-00000004Tqp-2R2h;
	Wed, 19 Nov 2025 18:14:25 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmh6-00000004ThY-3mOm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:14:17 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-43380a6fe8cso476455ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576055; x=1764180855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPirOi0w0Cb/s6FnCbMEuNgCnH0qPfOw0gyvUWbzUDU=;
        b=DEHjzIMkhcZ92obvOpFjeW0Dfg4cMr7ZVmJ1nJVjKJ6RFZu9uojEnUb/gjDRAzBub3
         Fh9KRYjcvoq0tRR/FbiMbw/uCkdd+jDtqh5JthK74+4r+3HmkQjFrAAouhgdjq/bl7SS
         w2mLRqPm7uvTU1YCLOwvYWHK71semD8UTb7YQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576055; x=1764180855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPirOi0w0Cb/s6FnCbMEuNgCnH0qPfOw0gyvUWbzUDU=;
        b=s5rCPrhuq7w/Auj6Rc2jlg3p/HT4ic49xhjujrIm2QiZo5R9OaweQ+mjjiS7E2jri3
         9ooZqd+pVMtFwWC3ICMiqftRDyrHYuZ/2KGNXfbiTbQnMRqijsvgIt0OrOZuoWBUy+58
         p4/j0y77OY7iTpD5/W2xX3vGUi+TnB7sY4jtC1HNutN/vMIFRdnl1ZTDfLbosMxMf5j7
         Ln8jijkjP6B0xTfm7+rg3rOzH0+7qx5gEDYuu3VmC7W7NYS7aVC60ZwZDzuDZG6MQ9LH
         MLMcSNBr7PqiRHPX2qQE3Sk7M2BNAv6o6qpFQp0gJTNSQcbGXZofOlm+OjAI3snIqa4G
         h9DQ==
X-Gm-Message-State: AOJu0Yz4RAfiiO1E/DOSx+O/28CpRHpplgMayxcpriJpzNGf1cFeLa/C
	i1LWwmeHBH7TvF0tPoI9AAdc5yVFHnuGKJ17o3YEZXBdUK2lDNsfba4QOmYJlq4y0G/kaA4xPHP
	WpIk=
X-Gm-Gg: ASbGncsoiFKeF8ujz8JeBkw5LJR+MxIKi9guaA3VP3JD7WWumR9FiDtLNpxpcaYxgTf
	eTP7cGnIfSfe6KUlEI87sI95/y9FcCXM0Rzvt3DeJWzcfWRY4RHpxHtzi7hnojpUsdeRiHhmV7Y
	i62YVtSeJLx8KxwttsJqI0OhtfVteLmXTUbArjonk/wILckTraHsQQwTsPO35nnRltOxK9sxN2b
	2oS8+RL/w6QdT1WbVFlHVYvBirKT3JjEBNsBkaO++t2e6/KKlz5cRa34SP11/dHmMKA0ImzbxyB
	9sSBtTrUFAqVNKDCA4sJnMivOrtVokPXP0D4JPfF4KiG0QaGk5oHuT5kfp//gu4VjEgmMT2Ivqf
	reS/v3dS5YAHa7YntK6wkudp7RvEfE4kAl/IYVcQVC2TuPtebHHgDbgDSggj8ZOxg3DXRhsQMsh
	reJDAW
X-Google-Smtp-Source: AGHT+IEqawcvOIPqsXpALDErL/1Go+TjtEXbiX8/+Jw/9VSxcMjIN9Ju3r68ajG6bVKTrOJBVHHikA==
X-Received: by 2002:a05:6e02:3398:b0:433:7f13:3a8c with SMTP id e9e14a558f8ab-435a902d081mr4341845ab.16.1763576054629;
        Wed, 19 Nov 2025 10:14:14 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:12 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Tamir Duberstein <tamird@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v6 5/8] kbuild: Split out module targets into a variable
Date: Wed, 19 Nov 2025 11:13:26 -0700
Message-ID: <20251119181333.991099-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_101416_937255_D24AFEB0 
X-CRM114-Status: GOOD (  12.00  )
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

Add a modules-targets variable to list the targets which cause modules
to be built, since we want to add a conditional target.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v5)

Changes in v5:
- Add a new patch to split out module targets into a variable

 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 638bc09a546a..8cd46222fc48 100644
--- a/Makefile
+++ b/Makefile
@@ -772,7 +772,12 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
+modules-targets := all
+modules-targets += modules
+modules-targets += nsdeps
+modules-targets += compile_commands.json
+modules-targets += clang-%
+ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
   KBUILD_MODULES := y
 endif
 
-- 
2.43.0


