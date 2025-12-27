Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB964E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 14:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bmxe0SbWatW9BBBe7yS1jiuJDMZfC/WhN/j+ScxrjJM=; b=aBgAhCrFE61Sj/AuFJbx5hL3Fx
	M4S43up38Gyln1Qy4g01+eBaeD3wMLsarr1Q+zxg9gSpmOcFpUmF/eqTIxcKJ2gYi58beNc+lRi75
	IlvzOTshd+wKuzwqCMQvR67VE8Z47A7tHekmzEkHps30SoVWu1xRsIGzU90+W/BZSEB0CD7mq0Qdh
	2QAzjQj9WMyoyyZKCmLCCj3/z1GJHfOK1yS9aAa9822RVdoCZEIDUPXzFmHWyKTS6TAqSxHo5LoYO
	gbaEeOHNZ/Wo9GxvRZhxJlYyjoKnZEse5i61g78IIUXfRwWo5y5tb2rL+XbEoTX4Sx/pFQpHpHoor
	jsPzYnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBU-000000021YA-06G3;
	Sat, 27 Dec 2025 14:22:20 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBQ-000000021Xa-2rkc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 14:22:18 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7c7660192b0so5320329a34.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 06:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845333; x=1767450133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bmxe0SbWatW9BBBe7yS1jiuJDMZfC/WhN/j+ScxrjJM=;
        b=E3nOJD0mY2cLhIotZZLMnkKzaVXQZGGgUgUvNxay2XkJfSctmdF22QrNGv4CklKchp
         LuvTXI7iBpHlRTOW5IF+FxaECGSXqg+IrwAfe6qsMLFrXmiA60YJZc1bfO4kX1KAOsZc
         2Y5AFBgyXQu9rktsbLQ5g5wbOHJ4+lZN4Yssk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845333; x=1767450133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmxe0SbWatW9BBBe7yS1jiuJDMZfC/WhN/j+ScxrjJM=;
        b=CRd+8xc2uel2EP05bMdFQsDM4VT3q1k2ztQI1sufCRfzFh0/ad9+el0El4HnXI46AQ
         0LoXo1MKi09t8o+mLVL/+j16cMJBoNU/sclhWa+pNTSkFCpPKoPQDc4IMvwVkNV4AxEl
         eJ21Yl6YjO8lV7KzxFTGS+g0cvh/2ipgskpL/Nce9cT49PmsnZol8WdisQ9f44X4ogQg
         A0LAu+qaJJUaBZsZAyRuZtpFHltC3WQlMoFZyyiwSuy+f4EWmZBemuus7PNRDYZrq0IT
         kklc7uGkvTjmaTYWjif2TUmqANvdqhGNIj6IgFKicVrdWzahpp2LDbGeuzqPcgcDEWb0
         iTyw==
X-Gm-Message-State: AOJu0YwIFbjjug/lw+p+Qle+au8yoTMufeeFuxW43pset5IGanaftOXi
	mCD5X6E6isKYImxJ6aRyPCYFzoxhS8Eq9CMLEM1/QDZjbDGrgBbxL6J17Sb4LbBkMG/9yFhdorA
	kyc4=
X-Gm-Gg: AY/fxX5qrhCzbRlwlV05HKNyvUzViaG39rdJWjre5/AxxTMMKnhdlfsod+jYDkRrP79
	rhgqfdTfYIxcaLW6/SYkT3+aGiGln+ZTJS6z6Zmq1wLhUGhKDjIWv95onHni08U9891FFHVUwsi
	BYa/lkBKQphGOcgDF9JuRmYS04IHrqb2wxgdZITSkTaR0I0hHdJo/uzDMe6KgwrTcNhkNO1WhdH
	ocB1TMyFq3pwV2lAkRnaoniROVO93L0qCWPMCnsTx4xxcC8ttzCPGOGTnvcxTkh4w6BAq1NlvCY
	CceojtKDt3RIkZyoF+wEn4Mepe/mmYlPE2KcZr0OClPlUbI0TgFdnW0fI6ERnsOzKyEXKwr34wE
	flcIwgDGKUj5XhZj2jlON2up0BoWX/FwJTzzDhEug/vE1nrixBj9s6/suh0SyiVMR21Hrs2q47N
	SqftO5
X-Google-Smtp-Source: AGHT+IE+SFSIiJ1N9RC4DDY7sw+zm22c+vatbE6mz3IJ0XimO5ulxxHm/md13n6fjSFDBJMddiHQCQ==
X-Received: by 2002:a05:6830:4990:b0:79d:eccc:96eb with SMTP id 46e09a7af769-7cc66a17d4dmr12194665a34.26.1766845333281;
        Sat, 27 Dec 2025 06:22:13 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e11sm17352660a34.3.2025.12.27.06.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:22:11 -0800 (PST)
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
	David Sterba <dsterba@suse.com>,
	Ingo Molnar <mingo@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Nicolas Schier <nsc@kernel.org>,
	Oleh Zadorozhnyi <lesorubshayan@gmail.com>,
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/6] scripts/make_fit: Support ramdisks and faster operations
Date: Sat, 27 Dec 2025 07:21:44 -0700
Message-ID: <20251227142200.2241198-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_062217_049320_06928EE4 
X-CRM114-Status: GOOD (  17.01  )
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

Changes in v8:
- Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'

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

base-commit: c53f467229a78287efa5b9f65bd22de64416660f
branch: fita8

