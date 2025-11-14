Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217D7CE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g04XP369OdIGlU7nO8ZhA20Z4uYWbY8J/2UrhgEgmF8=; b=4v1rlknPUV5bIwjbiEDfp5LB/y
	BBUK0jg3YhzF8O4YyXcXy86/jq5tMITuullaBEx7yOqw/uIceWcbRimU5ZA7+l+vgmoFIIVTfkn+n
	xc71K5gR8/nQxdHEBemSNFWrZiHJ3+ts0L1vZ+JHlWR0dj8MtSiqGmli2iByItQZkjZLpL7Mls+dJ
	hz5GDpHmjEYAm0Ert3nqt4epO53dhUw34bZgQmWbzGoGXSX0H7GZl880VK8YHFdITnSt+Ean6xwna
	vYf0OBPkBYQ/w+0Uf7dQ0OtzbTdl5Zhc8qRZs3GWYy1ZfEcfOlIWSoGnyw5XLLDqWRW8oiZ1uZsT4
	dA8FmcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumi-0000000CMz1-3w5z;
	Fri, 14 Nov 2025 14:28:20 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumb-0000000CMtK-1TRv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:28:14 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-9486354dcb2so86657639f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130491; x=1763735291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g04XP369OdIGlU7nO8ZhA20Z4uYWbY8J/2UrhgEgmF8=;
        b=gvqvVEbNfamzTgbXVpkxFWtQOrkgy0pgl8C4duBJ657fLx8bkZMNCs31DDXxdIRDxR
         L3CrX+gx0URTMsBgoHHcT62bMP4uq1vppZHzpdjtXLspVRy0KsGn+9NZjJETIUoeHTAw
         VR3RTKabXzPCJIFthBExQObL8pcg3h5dH0wbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130491; x=1763735291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g04XP369OdIGlU7nO8ZhA20Z4uYWbY8J/2UrhgEgmF8=;
        b=JL0GZ5T4a3Rn/4iLxui6FlN82vlicUlqJcd4jjx0dqknSyUQYQjN+g9+QhkLnr57Md
         POeIWdl4bif+PPiY9dFmaOw8cKhJPJppLO+otDBtq+jH7cqRADKIFIxA9/LHs15OVGMg
         UA1jr5NlXDW/EBd05UoQ/iTuchgFQcCe2w/nMq/r1D38UBAhm/MCqkwG7WUIQ4Fhvp12
         dV82ibsGs/ABzy53zDkw/Go3s5Qm5Y6nOjmaifgSQfoQDbw10OSe9VzKKzWgkrvibv6V
         tEMFS4k5HsMdUqoQl/9clDTR7pSlLp9Dyw01jnBqQL9wDOtuJKACIcUiPg2ZblM7eLwd
         UHYQ==
X-Gm-Message-State: AOJu0YyhFY3CkgjWCLbV5gJ+kftcnwBGWaczh/aOBsLEt5FpP5NQbvVK
	lO6tl2NOyJXMcVcIsCkiFYNi+ZdmCAc1M8AQaMda42xVylzYRf5btZK2coWS5RgyXH42yd6YaNY
	uPyE=
X-Gm-Gg: ASbGncvh90DT29RnTEeNfA+rbmPSUG/gliV6DfM+4BFyViz3i3aSsBdI7IfJWgZYmFN
	lj4X+WRyPZIZ4lju8nIjHWUa1dSW0j6HxW88qtzMyTbEpli2ly17vkjPq0W1EFyG0n5hA8yQA6C
	aEx+FVLb9Cx/uhaU58WV6X1Ex2OV/evEzWnYaOxEZ+005jaXlh0ppF/apl/mgAcRcE4Hm9GHZTC
	Kz48RbfA8BaqIF5vtR6XYHDGhDvHilo1XDlksEktvlGyQJeqJ8fmQqbeE2EcPZFigOL+2jXWNJH
	etN3zLkctiN9DFwMh6Nzm0p1BE0K4HBfoSL7RIN5q3Oy0jLYea103A+9XwTha2tDqAetE4z4sM2
	mo/ceM6Hd6wQQPtyWPn2eE1uZYwvscRnX+TbQhNZxFoPzAo1xNnaDr4JOeBlkhf+ryjjTFGjaVe
	p130fBOzCSPlMW1dM=
X-Google-Smtp-Source: AGHT+IH9WRXDGpQxQ/K/6unFcP6iH5jd3lNOXJwjoIeZqn0+/6i1yonIkDQHVVuUwWSwfsG4BW0P5Q==
X-Received: by 2002:a05:6e02:2389:b0:433:330a:a572 with SMTP id e9e14a558f8ab-4348c8e3e5amr60110435ab.13.1763130491388;
        Fri, 14 Nov 2025 06:28:11 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:10 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Tamir Duberstein <tamird@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 5/8] kbuild: Split out module targets into a variable
Date: Fri, 14 Nov 2025 07:27:31 -0700
Message-ID: <20251114142741.1919072-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062813_391295_AD076A17 
X-CRM114-Status: GOOD (  11.31  )
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


