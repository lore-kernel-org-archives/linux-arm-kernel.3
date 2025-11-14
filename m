Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7EECE7B13
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LaRuk9UO1iAqBvlrA4UzPK6vezrUTGPRno5ObeOs0zk=; b=AovPCWMjoL+ackOM2z/kELCk44
	kBsmwnM6UiEFEFOagZLH1QK7ybnmbvluBXCrreP/eBQ0L9CQdc3CXp+czNIIkMdwjoJ30egfSpct0
	wRggeuoQIwmp470LohvF0vLS3mUdYlLf4Lqf2LvYg25fOKF2BkRMROQBLm4H/bX7kLCpFisHyO8Xg
	NtAHjWCtj5zLP+QH1jT0vWuBb3r6NxvKBwwA9UHHPdRD1JiWFkHH3muOdRPTU9IP0d0qsqnzcOjsu
	+hN6c3GM5o9oBHUpCgXfSJli0W1WwUoWW7BrwfE8z/bc9oXIsdlPrBBWegLGznV4PhSFSBP81DXgl
	yElp1U9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumT-0000000CMp1-1kkb;
	Fri, 14 Nov 2025 14:28:05 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumR-0000000CMo6-0IHr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:28:04 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-9486354dcb2so86651639f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130481; x=1763735281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LaRuk9UO1iAqBvlrA4UzPK6vezrUTGPRno5ObeOs0zk=;
        b=YD7sNDSys7mf/bFdQHbGOehoCd+cHHyeZa6yD/AaPQVQt+ewBlzIMDL07rfBrARpZ9
         14JUb4AlNfkmR2T6jKwVvy0bKR2qM1YXvZV1MZBAGBLqIyjZQ87rBzkicwT3JQ4N+kGW
         UPfAdMFQbumd5R0/RLeLHR4Acj8CkRIxAy+pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130481; x=1763735281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaRuk9UO1iAqBvlrA4UzPK6vezrUTGPRno5ObeOs0zk=;
        b=vNZkCWDxSPfR6fwfgb3sdJqJdk627A+Kbl3V9FRhAUjZ23KeBN9cMWlMJYmc4J2UFB
         t1nwJ8+DCYoMQXPdeTUd7Fb/O5a/9h8F+I2LnSRi6w2fKVNEnXEDE0byiGwUgUL0vXFZ
         SkgjxXof0A+GpsxOQT8VZXQHdYCOu0wfAl4hbwCC/IpZZmqG3t+YYgz0cezNEvjVm5HV
         eGP58R2yiMExW7hoecnvG414ewKuSHIgYghaTj0fmzfnNnzpzUlY71C9zxs2UQYTtBDW
         713grzCzjJ7UvkbG6vUhsVw5y2VphSHQdZT1b/C+vtKdtwZFOOl97LoVR/eI6ztFkkGf
         6fRA==
X-Gm-Message-State: AOJu0Yx2RHbKxHgaa2FWqsLWebxjdulXvJD+vCn6l8lh+jdqDSdyrxK2
	PaxbhO0ef/hpFVCKz/ADmQWH6uGCDQnCT9Pn6vIzDUWMXMDE91k8HoWTXBCAUw+NflEg3Vfg8Ic
	wuFo=
X-Gm-Gg: ASbGncu/j1q9M2PiuuE7u0K9BJ3p6K2Oshm0vrylmM8iH+egJluSzPkbBKg3T2OvXoF
	84xpA9tOWRMU+tdH75zv4RBe5c+1UMr6QCv9wNhp39Hhox06UVrH4gXf0BFKLb/RZbXmoxa037F
	Bu/hcUgbr22FJSSyF+55h0v33K6YbHgbUbk2Y1Fvea2dc/640TW6iqRxYbBjEkUeS8x8Iz9NHCB
	PCHmQQV+N1WhkcG6VtvW3hSxaBsv5Su5C+6dp6qFYa0/ah8rX4DTZsyNR9/QWWf8/zR+Pr2qmK9
	KmliAotUIW6RNffQIo+Xolb925qIlIdXYe6NgdPT3N71k3Qggd6VcSgzJeAv08cn5z9uj0MlPej
	hUKgmCCv0+NK7s5UtJkCyE1SV88OnLmXb4oJpfkMnRU4beq9m6N7Quol+1haU+me3KuNHTlDM+p
	j0e8Tl
X-Google-Smtp-Source: AGHT+IEELYloZwlPDfzBUS2CIFoqpVbdAlJTEoxSRiFLxI6XsjRz4z61w7km+eDQVxqihK9V+Z/gwA==
X-Received: by 2002:a05:6e02:3812:b0:433:7b22:c2cd with SMTP id e9e14a558f8ab-4348c8be2b8mr48366475ab.8.1763130480703;
        Fri, 14 Nov 2025 06:28:00 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:00 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
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
	Parth Pancholi <parth.pancholi@toradex.com>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 0/8] scripts/make_fit: Support ramdisks and faster operations
Date: Fri, 14 Nov 2025 07:27:26 -0700
Message-ID: <20251114142741.1919072-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062803_146993_9E3FCA85 
X-CRM114-Status: GOOD (  17.30  )
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
 scripts/Makefile.lib |  10 +-
 scripts/make_fit.py  | 264 +++++++++++++++++++++++++++++++++++++------
 4 files changed, 243 insertions(+), 40 deletions(-)

-- 
2.43.0

base-commit: 4a71531471926e3c391665ee9c42f4e0295a4585
branch: fita5

