Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43240CF58C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q0H4D6A5/Fz6+ZVWISfjUYImiLMbW+d5U+Obqut6PQU=; b=QFdTQ6sxtgr+GfUlS+WpsvFowr
	imVfs023zJELpi1cJlhCa9miP6kqYzfVDqL8fG85zl0Kc/2jh7ZV5UrCxtRBEeO6yiZU5NeEV9d7K
	Dh4T0Nf9Zt6XRWh9H9hjW4pnQXN/+ViRKgJA35x30c0XocB/V47W5aeHy18f9xc+yvoNgrDVEIueX
	YyQFePP1Pv80IPxapg6WzvM/271Rmwb6mdu1JxzXsgGbwbVAbR2kMp3s41AbLRpm2XQR92zRAoUue
	KrfC4ZuhB3IcxPu87+kah/3sebgzwNZrnwwdLvXbcIg70Qrr8wX0E4EyWPm6ZgqzYQkucW00D3/IT
	TiLVicJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmgt-00000004TUu-0HbE;
	Wed, 19 Nov 2025 18:14:03 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmgq-00000004TRr-0eUZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:14:01 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-433217b58d9so301205ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576037; x=1764180837; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0H4D6A5/Fz6+ZVWISfjUYImiLMbW+d5U+Obqut6PQU=;
        b=ablqtj2vipPj6Q4xEg+KgVO5bfMttOJ5pVa4xJvE+5+9U+4qhOWrYd3m4NF+zSZX98
         Wjy+J3Sqiv2/2o0L3ySpZ7TRWdlzR5x6Ib8tm4Jog0iQMwd44KGokNgfT9mTtqz6quR1
         RMoAqqmNG6/gpWGFiqWNCwVaS+n4D60/kYTvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576037; x=1764180837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0H4D6A5/Fz6+ZVWISfjUYImiLMbW+d5U+Obqut6PQU=;
        b=BMekbeK6hu4WQfYwdqMlqgbVw3MEYCfv4rbhmL73k73Z6AgpXmwSWjIh4ZW5OQs+7g
         6wm6IiW7OiqTl53hTJz8pE9AI6mRTEgc6tLJ1nq83Qm2rfQUV3MDJQw5ww8O8F5RwZUv
         Sg0XzKdCoP+FkxLJid18r4IDahxkfupUDQT3NdFgMl/PlFvgjaHCTA5Ujct+/Ja2CZIE
         RFRsgLh4hVxQiZl1tjVHpWCChDpPLuJFKaWgGC4hFdjM56yMzRyx8DLosnVVFkllJSAK
         VxmrENXxeghQeRltiVrmiFRXMIRgnSK46jdoXOKRlYIxJi9t+wc8OQVEMc0rw3uNWRnA
         Zy+A==
X-Gm-Message-State: AOJu0YwHmPDX4dumUwX8FncrGqzg3G21Ojk0I38fhymjuS74oJZInuL9
	MVX0nfiC+yirDxsbS2SaA81tt7xZlgycE+ZAlsROrFTadJ75rq8AA6hpSGIZzMg2Vbnz3u8BT8U
	cLh0=
X-Gm-Gg: ASbGncsGOxUnTIDfAjHPQkuOi/b20mW08j+TZjiVqkqbErZv1PAufThBmRsbJ6yldjy
	ikfQtefzmCd2FoYoIwHm6PqaZID+am+CAcULsZ267FVFU5RsvZLl7IA2XPHAMqd6m75lt+v7N+5
	mzWoxGS41LDnipTZrlpt30eOj6wenP4aCokyuzpdOEM0pcUJ+GtK3hod6gxnVo4r3NQ0izOoX4B
	wGMv5lkeyJIPKfjCBcRVrzZWh3wLfWLBq0zMIP++YGuFQ0H3ZUIR/dtq49wyw05ZPDpJpN7j+qI
	ezK1ZrSLtkt9N5Ydh0p6lBowjGy2cNENVKMv1W7sezEJeJx7i0OIkWYQh3edTJtKOFRSgw/Kodx
	7+xIFnwAellOfbvx+WqvVaa3sxuLvAt6QV9vrb7Q4+r2GKxzTZlIShVAmYjcwm9RXf+5vCR7AiT
	8KeY4B
X-Google-Smtp-Source: AGHT+IE/2JEiabneT+vq3UyMtVUuWtIZXvc2b4MEv6Jrjx/DrjNxhr8iITGjEUqkm6x1qj9D1rKrZQ==
X-Received: by 2002:a05:6e02:3789:b0:433:29a9:32db with SMTP id e9e14a558f8ab-435a9073140mr4249655ab.24.1763576036980;
        Wed, 19 Nov 2025 10:13:56 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:13:56 -0800 (PST)
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
	Ard Biesheuvel <ardb@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v6 0/8] scripts/make_fit: Support ramdisks and faster operations
Date: Wed, 19 Nov 2025 11:13:21 -0700
Message-ID: <20251119181333.991099-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_101400_508946_AF1D5A75 
X-CRM114-Status: GOOD (  19.60  )
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

This series updates 'make image.fit' to support adding a ramdisk to the
FIT, either one provided as a parameter or one created from all the
kernel modules.

It also includes a few performance improvement, so that building a FIT
from ~450MB of kernel/module/devicetree files only takes a few seconds
on a modern machine.

Note: I included support for using the existing cpio script as suggested
by Ahmad, but a fallback remains in case that is not available.

https://lore.kernel.org/lkml/CAFLszThpTg-FBoNG_tQ0xve0LkYWER85EJeHuem-_JUD8J1Ocw@mail.gmail.com/

Changes in v6:
- Using the modules.order file instead of 'find'
- Use gen_initramfs.sh where available
- Mention that FIT_MODULES just needs to be non-empty
- Make use of modules.order instead of using 'find'

Changes in v5:
- Fix 'use' typo
- Add a new patch to split out module targets into a variable
- Build modules automatically if needed (fix from Nicolas Schier)

Changes in v4:
- Update the commit message
- Provide the list of modules from the Makefile
- Reduce verbosity (don't print every module filename)
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

Changes in v3:
- Move the ramdisk chunk into the correct patch
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message
- Add a way to add built modules into the FIT

Changes in v2:
- Don't compress the ramdisk as it is already compressed

Simon Glass (8):
  scripts/make_fit: Speed up operation
  scripts/make_fit: Support an initial ramdisk
  scripts/make_fit: Move dtb processing into a function
  scripts/make_fit: Provide a way to add built modules
  kbuild: Split out module targets into a variable
  kbuild: Allow adding modules into the FIT ramdisk
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 Makefile             |   8 +-
 arch/arm64/Makefile  |   1 +
 scripts/Makefile.lib |   6 +-
 scripts/make_fit.py  | 293 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 269 insertions(+), 39 deletions(-)

-- 
2.43.0

base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
branch: fita6

