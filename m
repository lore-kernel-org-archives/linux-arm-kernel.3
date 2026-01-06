Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4843CE9D78
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t4rigtaUVzceNduvRfRUzk6xTb5cP2dmlDOzJ8N2oLQ=; b=e7r7Lk8bboOPmuIbzhotkWvRof
	DD7abNy749Zh8k1MR2T3Xpr+/xRnkmex33zVHGeCwrbBQ9L892xmlLp0kc89Z8BNndjY8143ueKE2
	x0CyQKOcCbT8pnf8GGDk1dTXbCN+aDgwwS0+uD3kCXX5N+Nrs+Z/UlWjrzj8RceyVDhMb8oJLgYYK
	qS24sbfMWiXvYrfg6L8cEUC2nXrn10zfJXuO8mr3fPdSJFVVd0Aue5ng8JMloQJCgQSIJjlvtBay0
	3bqrfLTqr8Omh3queihLHIXGP3Re70q3yNCmX4w/r2QZlT8Ggv4pcOe268JClum6T77frEZ8wIYzZ
	F5wC2Xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9uc-0000000DU8L-4BJ1;
	Tue, 06 Jan 2026 16:28:02 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9ua-0000000DU7m-42mW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:28:02 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7c6e815310aso932723a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716879; x=1768321679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4rigtaUVzceNduvRfRUzk6xTb5cP2dmlDOzJ8N2oLQ=;
        b=ab1g9+YymkvrbrBYbuJgSPFhHIwFz+Glbnz82fSeHUt7//LwBB1MUdxdtU9PNx2SNd
         j3du46nilRyBHtTqAhhWIjnc+tIivbhd4WCUdhZOLQM7vEqbkAXk1Kz7NUZCzpiT4cqe
         8/HOsO8ws6pTZIU7sDGLaagBeMf2MQU/j0lEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716879; x=1768321679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4rigtaUVzceNduvRfRUzk6xTb5cP2dmlDOzJ8N2oLQ=;
        b=DwyNXZ1cxxIBdogcqzqmMsYZBm8wNF8/aMGWDy849Q5PnK13/TxJ5JC9cQK773TmMM
         C2zTiBeu9h45F0tPdM8cvEJl6662w1vf6vEgstx82fdgHCDn2avlt5mazk2zPpzrDxhZ
         X4Yv27cjKtqu2nijEhMzFV/+M+u/7MTUcA380Jop+yeVQ1IjRifLwDrXEq51qM7f++QY
         vTi6rbayd2seweseKmO2NpRAhrbpgePWR4bB9VJ5Ul9blJDw+w7I/9pzD3u/bCsW0SiE
         GTHYzzAoTslYOmYZxX3KWfTeN8d3dGJ0REWkcw1Wpl4qXZuPsx1tJDgiNN7sY47kTcKi
         PIDg==
X-Gm-Message-State: AOJu0Yzj8Yu8V4y/5UinPGXwyCRb40+W5ZeK84sPDEjxOsNaShaL4+zG
	yDtEB6SCjv0Mg9YzAja+tlESERKYW7i/D3yKjALuMHfkAYPU4DL5zZZwY6oe/LnGMFCpYSNG2Ix
	X9j0=
X-Gm-Gg: AY/fxX5AhsJeSZ15483Uhie2espUySHpTKGkQroCgRQE/yFtoIUgEJjxljbIPj9flrw
	flBVMdwu5hffCIFpR5tHK9qf3/TVv+9ayEMOxM+WP03VI1l5rF8HYZhQiURwrQpXFoZcXQXT4GY
	lRuhKKW2BEN/zZ2qK6lBXWEWikxWIy1GoLoq3rVvrDTLIiGMcT563vEZqF0b2BNxxIgLThbLqxO
	d+rK0skAqHO2WB6fst3uKB7cYBxvJ8FLRsjATrQIzje4tU3FFHFKTeO/Sk3kHvwrcJWpSOZcmgy
	VPimyED1z8kpN4DUM0+aimq1i8TC3UykEiuXIOCf/G61AnT+OykZwZjDV8Bvay5i1F8jiCMrDqV
	5oclhNzXy+u0uvjiEAS2eEppuWoc7E+Nk5CSNRaZv9uE2ql2w0pfwkdNi8uCMqyst9vhJ1Fft2X
	2yomVt
X-Google-Smtp-Source: AGHT+IF7S2rg0m1Mda0gZnWPSOfNwohMrdwCkO13UjUZrEBZyn1R34tSjJPAZbTcfxGrtDjxpyXlJA==
X-Received: by 2002:a05:6830:3141:b0:7ca:c9db:5436 with SMTP id 46e09a7af769-7ce4662cc2amr2707815a34.8.1767716877599;
        Tue, 06 Jan 2026 08:27:57 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm1630951a34.15.2026.01.06.08.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:27:56 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
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
	Petr Mladek <pmladek@suse.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/6] scripts/make_fit: Support ramdisks and faster operations
Date: Tue,  6 Jan 2026 09:27:30 -0700
Message-ID: <20260106162738.2605574-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082801_006305_C47B8F45 
X-CRM114-Status: GOOD (  17.72  )
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

Changes in v9:
- Rename the variable to FIT_EXTRA_ARGS

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
  kbuild: Support a FIT_EXTRA_ARGS environment variable
  scripts/make_fit: Support a few more parallel compressors
  scripts/make_fit: Compress dtbs in parallel

 scripts/Makefile.lib |   2 +-
 scripts/make_fit.py  | 179 ++++++++++++++++++++++++++++++++++---------
 2 files changed, 145 insertions(+), 36 deletions(-)

-- 
2.43.0

base-commit: 7f98ab9da046865d57c102fd3ca9669a29845f67
branch: fita9

