Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A21CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 06:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=; b=X7HlBZT2ICjsYHamDxU/6ltg3y
	9gDL2rgxRiBTSaJ59FpAG26/o7h0MsLHgCab617t68JAp3JL9kgD2mg8Uyfx7akFVjbV1XD/5Nmp2
	rOFpoUcegzqV7wOtaTJoNH7NRfJCNJMxX+6oNfHzLlUxPzCmHePBl/m7QkFTtUTpA79vMlaa7ScDp
	4KpWFL5cnk0eZgQEbZCC4gtyHDaxZSFDAexsATbKbbtiKfF3+G6k0TRGnXpQQA5iLUtJJMWKuF3be
	e9SeH9hCmPSo+Pd2KinUHPk6r+b2t8Pw1Ph8KfCJMiTH3wkx8gC9DPoIgHN7Myy2sDFyeuS+eanRk
	xnwwkIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMbM-0000000AiaW-3MJb;
	Sun, 19 Oct 2025 06:09:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAMbK-0000000AiZm-0ZH6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 06:09:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so31296385e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 23:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760854143; x=1761458943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
        b=P03z5OtYxnTNKJPmSc2tY3Kg2VoA6NC869Fdrc7BrXtKABasNzJYrkiiWx241yEFa+
         AC4NxB3Tt6EL5EIGszjxAfKPGmeDDs/oRWKVTebIgTnXgFPxMd4I4wWSLMhQT3L4Z1gZ
         yd/fEANImMeYvKMBQylXiLj252NDNPYAPUJUYyD0gHKEW+NaVGeEDP5NdpwJ/cL99f93
         mBMD+Gdjk0bDLxMYSo96Z37ESDC/DT1IeOA+V6IJgCakXro66omNNtQW/AlyQA/i/NCf
         Ot7F1sINs9rrvuZR6wO4keEl91MNxCJWpp3hLnuXib7mIdaJGiu7uNr+/KUtTGzE5jiD
         kUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760854143; x=1761458943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYC/hQuGeMEF947/LuK3VJRiyEjbNIGm04998G60uow=;
        b=vABpyseF/ooLwlnY425E/Bc5Xo5xKcPujrZOij94qSsPjNz5daJGbR5a8g6J/YTPPS
         6XHgYtNfWtQ1PIjE5i6IqGP18NMuI986RZjXNW2Fb3ZICtuiIHp0a7YlC32rz86c3u48
         7kGxamTLaeJLGl6qSCO87CIXlk2iynMrwG4SC2YAy0ON3TFWcMJsb1C7C0l3lzBGu41S
         mDJqpTHF0rLEXGm1+7H4H3wgO/rOczKE6RwOJwlpW75ulzwSqrmulIyWTKlWxNtdFkyN
         syZJlOnyNeSQT/B0e+VXriu6e/SMfytPsgv7PlXrXUB5qiAtMUbBmtuHlquP0zf7F7Gh
         8mYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyaxo+5zEXSQS3q66VH9G6+Pbps0I6LXaU38vEboM+FFM1mp7I70Wib2J3GWHU9OOd6luU6do6l0nUYPLznlvP@lists.infradead.org
X-Gm-Message-State: AOJu0YzzygLSDSWoBzPz39GDAXfD+LzGJaZM7sqaK0AlcwMoNrvvC3N/
	HJuonq1SgdOHbvKoSjcufgLqovcIKMSCy3b6Z75GCPhpCvvFTYDKC35R
X-Gm-Gg: ASbGncsD0bZofdyKZvZ9nYgwwwl0a49dqICIIIp+A3QsE7Jv0forZiKLka5IZOvU7bZ
	b/woxOhrxPrIdvwRfqluVlLC4H9gyQZCj82zl7SX6sLaB7KF/yAHTTYrjUCaRy1Rgl0rgOzEwyi
	U5d6acJqIYRsxpDlKVSJPlbS52rS4CxpnqXMpbaLpcBEdN83Xm+IMqLBVRtBW9EjlJhk9yNWdga
	QfjEgtr11G50kM5sCphrZ6en8qbY5oAms5buOQTHyZGUDCxL1Bwja/3xd7SZWZ5AXsAz1dPjd2w
	X7DCx2iKAwRBs/TquxP+VJr0Ec5KonQcnd9c1Np6pHueS+xstBvyTK9te48dpnXWERsumOOfQjG
	ZolSc/fqUP2jmZQdjCeb56AA254cyNkSJinYoQL3uyp7h0hymyOuRBWTQ2KsYZDtJrukdpvtk4w
	GR
X-Google-Smtp-Source: AGHT+IEZ5upR5rvq2pYeoFEK0g1VqqLoHFsnsUnK8lryUbaHf4IrN1h8fWBgNccm4eIUhXw2FJ5z5w==
X-Received: by 2002:a05:600c:820f:b0:471:176d:bf8a with SMTP id 5b1f17b1804b1-4711791cd3dmr68834905e9.35.1760854143309;
        Sat, 18 Oct 2025 23:09:03 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4710cdb9d4dsm83976805e9.5.2025.10.18.23.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Oct 2025 23:09:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ebiggers@kernel.org
Cc: ardb@kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 15/19] lib/crc32: make crc32c() go directly to lib
Date: Sun, 19 Oct 2025 09:08:45 +0300
Message-ID: <20251019060845.553414-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20241202010844.144356-16-ebiggers@kernel.org>
References: <20241202010844.144356-16-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_230906_186981_D4C75EC0 
X-CRM114-Status: GOOD (  15.34  )
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

Eric Biggers <ebiggers@kernel.org>:
> Now that the lower level __crc32c_le() library function is optimized for

This patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
solves actual bug I found in practice. So, please, backport it
to stable kernels.

I did bisect.

It is possible to apply this patch on top of v6.12.48 without conflicts.

The bug actually prevents me for using my system (more details below).

Here is steps to reproduce bug I noticed.

Build kernel so:

$ cat /tmp/mini
CONFIG_64BIT=y
CONFIG_PRINTK=y
CONFIG_SERIAL_8250=y
CONFIG_TTY=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_RD_GZIP=y
CONFIG_BINFMT_ELF=y
CONFIG_BINFMT_SCRIPT=y
CONFIG_PROC_FS=y
CONFIG_SYSFS=y
CONFIG_DEVTMPFS=y
CONFIG_MODULES=y
CONFIG_BTRFS_FS=m
CONFIG_MODULE_COMPRESS=y
CONFIG_MODULE_COMPRESS_XZ=y
CONFIG_MODULE_COMPRESS_ALL=y
CONFIG_MODULE_DECOMPRESS=y
CONFIG_PRINTK_TIME=y
$ make allnoconfig KCONFIG_ALLCONFIG=/tmp/mini
$ make

Then create initramfs, which contains statically built busybox
(I used busybox v1.37.0 (Debian 1:1.37.0-6+b3)) and modules we just created.

Then run Qemu using command line similar to this:

qemu-system-x86_64 -kernel arch/x86/boot/bzImage -initrd i.gz -append 'console=ttyS0 panic=1 rdinit=/bin/busybox sh' -m 256 -no-reboot -enable-kvm -serial stdio -display none

Then in busybox shell type this:

# mkdir /proc
# busybox mount -t proc proc /proc
# modprobe btrfs

On buggy kernels I get this output:

# modprobe btrfs
[   19.614228] raid6: skipped pq benchmark and selected sse2x4
[   19.614638] raid6: using intx1 recovery algorithm
[   19.616569] xor: measuring software checksum speed
[   19.616937]    prefetch64-sse  : 42616 MB/sec
[   19.617270]    generic_sse     : 41320 MB/sec
[   19.617531] xor: using function: prefetch64-sse (42616 MB/sec)
[   19.619731] Invalid ELF header magic: != ELF
modprobe: can't load module libcrc32c (kernel/lib/libcrc32c.ko.xz): unknown symbol in module, or unknown parameter

The bug is reproducible on all kernels from v6.12 until this commit.
And it is not reproducible on all kernels, which contain this commit.
I found this using bisect.

This bug actually breaks my workflow. I have btrfs as root filesystem.
Initramfs, generated by Debian, doesn't suit my needs. So I'm going
to create my own initramfs from scratch. (Note that I use Debian Trixie,
which has v6.12.48 kernel.) During testing this initramfs in Qemu
I noticed that command "modprobe btrfs" fails with error given above.
(I not yet tried to test this initramfs on real hardware.)

So, this bug actually breaks my workflow.

So, please backport this patch (i. e. 38a9a5121c3b ("lib/crc32: make crc32c() go directly to lib"))
to stable kernels.

I tested that this patch can be applied without conflicts on top of v6.12.48,
and this patch indeed fixes the bug for v6.12.48.

If you want, I can give more info.

It is possible that this is in fact bug in busybox, not in Linux.
But still I think that backporting this patch is good idea.

This busybox thread my be related:
https://lists.busybox.net/pipermail/busybox/2023-May/090309.html

-- 
Askar Safin

