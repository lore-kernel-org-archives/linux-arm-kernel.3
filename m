Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 11:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G12fhYmzIKFl3YepBT3u3rLYxijgRWdt2EPmMWYyS1g=; b=pHASYONYjNIAsRKGv7sE5pq2S+
	9m5M4g7451AskuuohLmISDeFfTM/251ki2QgA/ocvRag4tkBZJMh+Y7usa8TRsNIpKymtVTqWQxHY
	AhEeFj4AnGJH+cXJOCE4NVB9jv6/zFCYfuh/1zQvQ4uavI1HDqdWZQpi+wUyWFtVgoMH7ly19JEhQ
	5ZBuqfIfUAgvWsQxCdjNcaQ0HNJZ3Qgjhb5fXfJ1hjF9bJKGOHJ8X+pmWTlInC4YH+/PtyXr9vS+Y
	4iH61O0J+i+7FfFwDpqA13yJnIEaNjwT3brfZrG2UD5DEHjyi6aK+1B7OZnNsAzIvuzNaN3sJ7Csf
	okX5/9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3Em-0000000Bskc-0A0n;
	Tue, 24 Dec 2024 11:38:08 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ3Da-0000000BsZA-16ik
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Dec 2024 11:36:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so7195905e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Dec 2024 03:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735040212; x=1735645012; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G12fhYmzIKFl3YepBT3u3rLYxijgRWdt2EPmMWYyS1g=;
        b=SKkQCgqwLc2fZTsTPFfvOlk467GjnheTqNyRtNg62C5jInSpxnExKJ3GCurLJ41/ck
         kN+XfctRyaHyFkpbxKPNlTkvKh/jeMIxR2cgWxXaVRClBaq8YRwMed9R1zMQ7hZVkacl
         xhL9vNmDvAc1Cr/KAhXa6rql46qttSHwzavIZEHo/1C77Luvqi9ja2znuEGnL7UZM+zq
         AxV+++e6rfMa2xXYTL+TT3TNuPAkkmvCHOAVh9ldo7qVk3p4uW8yQXfzmt77JCKs7BKD
         uXrSLjf12sFa5f3cnU0sFZ9pEa3pVC1CDjqQOHwuq1A6X0PdTn+o3B/wIwf6yVlUu2wF
         ylsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735040212; x=1735645012;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G12fhYmzIKFl3YepBT3u3rLYxijgRWdt2EPmMWYyS1g=;
        b=NWsYuxWMgf11nKg1CpHmHcbGoFOdJjvC7Fv5bzcm+fEoF6XqzVCYOtqRmwN2u0o5uQ
         KLspfW37KTgNLpA7GNtEPeTRKOir6bHyzVKkuKlhxb6kJaTRz7u8ft9m9hOoG/gq9V1G
         vphCKpdTieNO3txv26DfI/nHjNUPQNIgz+hxDWLs8NQ9wUbox547+u9X4rzOqPKpX8gO
         gNqUajo5PbtPxUKNxReKXMdLQy47X/C/cJZYupZfsXP+h2Pee0OJ28uHCwwo4SLNLW1a
         a2g7ZJeoI5j8DKb5s1sJ5sUVXdQv3IUcLdbkfBlr/wx+Yq/UwLi5Kdy/hV95CjSZrx7Z
         mxLg==
X-Forwarded-Encrypted: i=1; AJvYcCVWVWQN0oVp+ot+hkwD8080ghaClYsp/qUW5eJ/4D6NhAhPTjDNahsSecoImwyS8NGW57sY91ec0dMs+s4V2HWh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm/JIfmBU6PjEBg6tjG94YY1vYujSNfls/E5XqDJ0sewecj+Fa
	BvjhB/cWpQ83wSj3zzzKbiTZhK9UrRqJVbdtumIdkAAHBCNs2QbUPkaYwp/8cyjz5/U55rE31F5
	KnJ5vZD3slvs1mJFgGY//r1CJ5dn3OsvH
X-Gm-Gg: ASbGncu+lCoYFX7586P6D2J+VISp/EoLfuJF3qdMY43RtjTo8VJluCGk1fvOHnaKM86
	xn9aZri1UlDE8ZH1qc3FNz4RsSGShPfRvfnMb5wc=
X-Google-Smtp-Source: AGHT+IFoTIGJCOBSwdNj3PsVBd1aDzF45pQrM8dBttLUc6tJkIuXq0HQT8vHJGCemklnevWasOC0rE6XgesVcLOu3Ww=
X-Received: by 2002:a05:600c:524a:b0:434:f22e:a5be with SMTP id
 5b1f17b1804b1-43668bab835mr55147365e9.8.1735040211982; Tue, 24 Dec 2024
 03:36:51 -0800 (PST)
MIME-Version: 1.0
From: Itai Handler <itai.handler@gmail.com>
Date: Tue, 24 Dec 2024 13:36:41 +0200
Message-ID: <CAFpOueSJFyAa2q=0S5Ch6cCy_ORKBV8Y-FUTq6bTky37LJ7M_A@mail.gmail.com>
Subject: Issues with kexec on arm64
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_033654_310893_E4181F8B 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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

[Sorry about my previous e-mail on this subject. It got corrupted.
Please ignore it.]

Hello,

I'm encountering kernel panics / system hangs when attempting to
kexec a vmlinux file on arm64 architecture.

It happens both on qemu and on real hardware.

These issues occur on all kernels from v4.19 to the latest mainline.
A sample panic output looks as follows:
  kernel BUG at arch/arm64/mm/mmu.c:217!
  Internal error: Oops - BUG: 00000000f2000800 [#1] SMP
  CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0 #292
  Hardware name: linux,dummy-virt (DT)
  pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
  pc : __create_pgd_mapping+0xe8/0x3b0
  lr : __create_pgd_mapping+0x44/0x3b0
  sp : fffffe00804d3c20
  x29: fffffe00804d3c20 x28: fffffe0080620000 x27: fffffffefdbc0000
  x26: fffffe0080300000 x25: 0000000040010000 x24: fffffffefdbc8020
  x23: fffffe0080010000 x22: 0000000000000040 x21: fffffe0080010000
  x20: fffffe0080300000 x19: 0040000000000783 x18: 0000000000000000
  x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
  x14: fffffffefdde0000 x13: fffffe00804d3c78 x12: 0000000000001d68
  x11: 0000000000001d64 x10: fffffe00804d3c2c x9 : fffffffefdde0000
  x8 : 0000000040420000 x7 : 0000000000001d68 x6 : 0000000000000000
  x5 : fffffe00a0010000 x4 : 0000000000001004 x3 : fffffe0480010000
  x2 : fffffe00804f7ec0 x1 : 0000000000000000 x0 : 0000000000000000
  Call trace:
   __create_pgd_mapping+0xe8/0x3b0
   map_kernel_segment+0x74/0xb0
   paging_init+0xec/0x4f8
   setup_arch+0x234/0x52c
   start_kernel+0x64/0x500
   __primary_switched+0xb4/0xbc
  Code: f9400300 92400400 f1000c1f 54000060 (d4210000)
  ---[ end trace 0000000000000000 ]---
  Kernel panic - not syncing: Oops - BUG: Fatal exception

I bisected those panics to 8eb7e28d4c642c310f25c18f80a44dd4b01c694e
("arm64/mm: move runtime pgds to rodata"), which was added on v4.19.

I also reconstructed the full call trace (by adding "noinline" to the
relevant functions):
  alloc_init_cont_pte+0x6c/0x1e0
  init_pmd+0x154/0x1c8
  alloc_init_cont_pmd+0x11c/0x174
  alloc_init_pud+0xc4/0x148
  __create_pgd_mapping+0xa8/0x130
  map_kernel_segment+0xc8/0x168
  map_kernel+0x98/0x1a8
  paging_init+0x7c/0x418
  setup_arch+0x224/0x570
  start_kernel+0x5c/0x4f0

My understanding is that the panic occurs inside alloc_init_cont_pte,
at the BUG_ON(pmd_bad(..)) line.

kexec-tools version: 2.0.29
qemu version: 8.1.94 (v8.2.0-rc4)

The .config files are created using the following script:
  make tinyconfig
  # --- Options to enable ---
  scripts/config --enable CONFIG_EXPERT
  scripts/config --enable CONFIG_TTY
  scripts/config --enable CONFIG_PRINTK
  scripts/config --enable CONFIG_BUG
  scripts/config --enable CONFIG_STACKTRACE
  scripts/config --enable CONFIG_BINFMT_ELF
  scripts/config --enable CONFIG_BINFMT_SCRIPT
  scripts/config --enable CONFIG_PROC_FS
  scripts/config --enable CONFIG_BLOCK
  scripts/config --enable CONFIG_BLK_DEV
  scripts/config --enable CONFIG_BLK_DEV_NULL_BLK
  scripts/config --enable CONFIG_BLK_DEV_INITRD
  scripts/config --enable CONFIG_PANIC_ON_OOPS
  scripts/config --enable CONFIG_DEVTMPFS
  scripts/config --enable CONFIG_DEVTMPFS_MOUNT
  scripts/config --enable CONFIG_NET
  scripts/config --enable CONFIG_PCI
  scripts/config --enable CONFIG_PCI_HOST_GENERIC
  scripts/config --enable CONFIG_VIRTIO_MENU
  scripts/config --enable CONFIG_VIRTIO_BLK
  scripts/config --enable CONFIG_VIRTIO_PCI
  scripts/config --enable CONFIG_NET_9P
  scripts/config --enable CONFIG_NET_9P_VIRTIO
  scripts/config --enable CONFIG_9P_FS
  scripts/config --enable CONFIG_CONFIGFS_FS
  scripts/config --enable CONFIG_SUSPEND
  scripts/config --enable CONFIG_PROC_KCORE
  scripts/config --enable CONFIG_KEXEC
  scripts/config --enable CONFIG_SERIAL_AMBA_PL011
  scripts/config --enable CONFIG_SERIAL_AMBA_PL011_CONSOLE
  scripts/config --enable CONFIG_POSIX_TIMERS
  scripts/config --enable CONFIG_KALLSYMS
  scripts/config --enable CONFIG_ARM64_64K_PAGES
  # --- Options to disable ---
  scripts/config --disable CONFIG_IPV6
  scripts/config --disable CONFIG_WIRELESS
  scripts/config --disable CONFIG_SWAP
  make olddefconfig

To run the qemu VM I use the following script:
  APPEND="earlycon console=ttyAMA0 loglevel=8"
  qemu-system-aarch64 \
    -M virt \
    -cpu cortex-a53 \
    -smp 4 \
    -m 4096 \
    -kernel ~/vmshare/Image \
    -initrd ~/vmshare/rootfs.cpio \
    -nographic \
    -append "${APPEND}" \
    -fsdev local,id=vmshare,path=$HOME/vmshare,security_model=mapped,multidevs=remap
\
    -device virtio-9p-pci,fsdev=vmshare,mount_tag=vmshare \

I built the root filesystem using buildroot 2024.08.2, using the following
defconfig:
  BR2_aarch64=y
  BR2_ARM64_PAGE_SIZE_64K=y
  BR2_KERNEL_HEADERS_4_19=y
  BR2_PACKAGE_HOST_GDB=y
  BR2_GDB_VERSION_15=y
  BR2_PACKAGE_KEXEC=y
  BR2_PACKAGE_KEXEC_ZLIB=y
  BR2_TARGET_ROOTFS_CPIO=y
  BR2_PACKAGE_HOST_KMOD=y

To kexec the file I use the following command:
  kexec -d -c -l /media/vmshare/vmlinux \
    --initrd=/media/vmshare/rootfs.cpio \
    --reuse-cmdline \
    && kexec -d -e

Thanks,
Itai Handler

