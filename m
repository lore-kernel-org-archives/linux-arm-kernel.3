Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE218D41C3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 14:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pI2y6BFvW1TWHJx+6LPqMMaL607vPHNU2vdbH+Al0/Q=; b=N8sPWEDPz0e0YuVjCM+0tti6iu
	ELdx/1PTpfjDWp+mw2z4faR+W0L5l5iCDC2qK7RP9tLexY7oqo3LQVqDpjjl1hz4LtrKU5pICB4uw
	l1MdvUYq7JhI+EZT78/Wkv7OoUQAiIQAxUT+ws1hgucqH86cwiHXm2JXDR2KJPaeauQVWlRsSrAjE
	3qdC3fd8naz4HoZ7WH7iU5gDBRfTEIype7BTtcKog1ezTgatjshmljdCuC5rS06DnkKHR4uVkQiBt
	jvpxe5e+hLVj/Nw4SkhbScs2hxXkoGaoKPTICQJID3B1nBfdvUgad7a3na2KQZq7VD3/KMzPo29Uz
	Vu/O703g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGg-0000000GgkD-3TMN;
	Thu, 11 Dec 2025 14:03:42 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vThGe-0000000Ggjp-09jF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 14:03:41 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-450c9057988so59579b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 06:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765461818; x=1766066618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pI2y6BFvW1TWHJx+6LPqMMaL607vPHNU2vdbH+Al0/Q=;
        b=mXuZMGmNuDrWtHjL5kp2MSviZ0cmGHv080oe52N6Q/gEdrMMhdawgK/HPZFiUx2dh7
         PoH3poGvxTj+TnzuraA20p3oXxx3JqKh46r+6GWkcJ6UtQJsQmaxtz7pUFLhj+mcZbki
         JJFc03OTHOoEVW+uTgGaGcgShKgtNiOwPFSh4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461818; x=1766066618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pI2y6BFvW1TWHJx+6LPqMMaL607vPHNU2vdbH+Al0/Q=;
        b=uWenUIIaFqhIo3LSE7wzmS2ZkbPmYZx9yOLPRRe/hUDdkwHYAU++x4+w0Oc1InE+x9
         QTGbdZm39m9LLpybg2KNv5uXPi6DfcYUsOAjIOE/B2lw4lZZWZHO0DnUBPjrNn3PkMG5
         4GguFXQW6Hw7H1QBM08c9p6bjbEInxkBZAVtSQjx2uuPwAxKrs54YtKtsq8gP/JlmSHg
         iLH207PQgKCRIzIhL00b37Ih0yocQn+hNUjtacNNDBtK7jbwQXFDXk+6jHPdEFAKxiNb
         +SuHJfP6Ch6J5onLtJmTU94XXPr8L5lS1HSCjhKlISaKNw/M8P048pDqtg9LYo3k1ySd
         eqlw==
X-Gm-Message-State: AOJu0Yz2T2msvJ5ZSNkYG5LZeCSiS0Wle2ULEOTHk4joIA7EDLPLzgMD
	80opcmzY1qXKmWIhl9RVWmNHgGFFGkrEDqALRb8C++ga9f+Z3VC2Q6bxYwTFe1bm7j0fWeTVsZL
	EsX0=
X-Gm-Gg: AY/fxX7rRvGr2jmlruxk63rCrOA2b+0qY7b3PEHmab02mD6tlhf26pyxbHpvYmFlRGJ
	rqKzPihAK1zZuaMlAyGuQVbtZ15RMFdal2RNw3xdhGTAZ0UbNVuwG+2VGSkW0QgDMBhNJyF4ORy
	lG2wUyPgEX+kb3JnQWwvKclGaNpCDTo6aoDlt5TI93yMEqoNSrs5Dz/6uEYu9hoXsc8Pz8g57Ar
	QtSeHWX1N9MEvBUKqVSaNtWmEeDuD3p9oVJVskeNYev8LHlaAuNH3xVnDdjObJBnD1d57/bM2LJ
	rubsnE/9wlit8LRg80LBHAtLuRe9itFXthGYyozX7JWrYVcTLbmRsqDzvj2yiVDEAe6HkLM7t9G
	gvLl1komzBgzmdvsuXNynOdBWSQm7ch5j14S1u+hOFp+5y6EBivZ1VQo2/ySo9qfUYhQ/7ZRwlC
	tQeyoG
X-Google-Smtp-Source: AGHT+IEeqf2BDvpVvHHiEISJZWNNPZ46TDprBL7FKkRqM2MxlxWb4MUQ6LUmRZU+HB32yfA2vvselA==
X-Received: by 2002:a05:6808:308b:b0:450:3b8b:b472 with SMTP id 5614622812f47-4558696ffe7mr3083529b6e.63.1765461818240;
        Thu, 11 Dec 2025 06:03:38 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm1130030b6e.22.2025.12.11.06.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:03:36 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	David Sterba <dsterba@suse.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nsc@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/6] scripts/make_fit: Support ramdisks and faster operations
Date: Thu, 11 Dec 2025 07:02:57 -0700
Message-ID: <20251211140309.1910613-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_060340_101287_44E0E996 
X-CRM114-Status: GOOD (  16.68  )
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
FIT, provided as a parameter.

It also includes a few performance improvement, so that building a FIT
from ~450MB of kernel/module/devicetree files only takes a few seconds
on a modern machine.

For this version I have dropped inclusion of built modules, as there is
still more discussion to happen in that area.

Changes in v7:
- Add a note about the " -> ' change
- Add a new patch with the MAKE_FIT_FLAGS change
- Mention xz as well, in the commit message
- Drop patch 'scripts/make_fit: Provide a way to add built modules'
- Drop patch 'kbuild: Split out module targets into a variable'
- Drop patch 'kbuild: Allow adding modules into the FIT ramdisk'

Changes in v6:
- Drop the load address for ramdisk, as it is not needed
- Bring back the ramdisk 'compression' property, set to 'none'

Changes in v5:
- Fix 'use' typo

Changes in v4:
- Update the commit message

Changes in v3:
- Move the ramdisk chunk into the correct patch
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message

Changes in v2:
- Don't compress the ramdisk as it is already compressed

Simon Glass (6):
  scripts/make_fit: Speed up operation
  scripts/make_fit: Support an initial ramdisk
  scripts/make_fit: Move dtb processing into a function
  kbuild: Support a MAKE_FIT_FLAGS environment variable
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 scripts/Makefile.lib |   2 +-
 scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
 2 files changed, 145 insertions(+), 36 deletions(-)

-- 
2.43.0

base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
branch: fita7

