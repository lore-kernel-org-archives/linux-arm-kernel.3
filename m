Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56699D7877A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IW9hLRAylg+ln+0KOywBCYwaZACv/9u6gJMVewYJ5y8=; b=fAwQYpNV3ilFDERoVy8bsDvSaW
	2N2ZhM3Nz0midBlHloJ9apVhXHk0kE9JSQIXMq+QkXig36RRjZISvtgmZtF+YMCmQr16TA2/J23hz
	nh5/3CL5NIC/jkAKukrXFgR9Wnjq9ChNHH0AqHWLIc9hAvcaaMJLstG5EXPQvxrUgyyZrnDTMt+Wm
	uHkA2C2MaHON1UTh/puMH5h7WPJUMhXLd3mO6P21Im7ohGvrdFFaw4OLdHjPE+w7uL8N5v6WtA6am
	hWOrd55NOMjQYLW8HO/Zw7w4DhP6YrhUfxYLUlx5So93DCrswWd4lSNXmxf/7+oWWO1phhUJaPzNp
	r+LJDTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8Y7-00000000Gcj-08E0;
	Thu, 21 Nov 2024 14:52:51 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8XA-00000000GPW-0BiB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 14:51:53 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e38261653aaso880524276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Nov 2024 06:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732200710; x=1732805510; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IW9hLRAylg+ln+0KOywBCYwaZACv/9u6gJMVewYJ5y8=;
        b=LNEN9C9jWhY2TEzXoIJQCS9MsgTDY7PJwURu4QKXTYw2Eb9BAUlSaqJRInLMMrZNw8
         PzGNmd8TQ8NXITfYV2hyqIKI1XN/IuLirBzW2rKRK7hJkce0hvc2q20MIvxrInm3zwZ3
         mpneNUpqq+5fVNxd0iYOeNdCf8YBEOUrSDb8z2a2x6PZP3HXOhaVSTrbedgSn2l3NAIK
         qF4rI2DsYiBoMIPENqmku8si70LenNqI7dK37TyTglk+YE+nMYfXIF6uFRaI8ii8lyEj
         XYVO8mbqOzpTseskKjqMoo1/whb+XCaFGGbcUd7s6NSHJs0lOZnBLhZFWX7kCBiBlN6U
         e5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732200710; x=1732805510;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IW9hLRAylg+ln+0KOywBCYwaZACv/9u6gJMVewYJ5y8=;
        b=sicJwoyrEFxzp246aFLnP40I8R/gknZXfHz9bFR99b5l+q7CDX+w6v7h4cR/8mG/Wa
         9Cz5RU77QiilED8mbrEDON7c3tcqP/swM5XUZRNcjEo+HoTKPMKIGRwoFhvJd+Ec6mP5
         anmqy4FXoTpPmg0nAUABar+koWiXOrFkw2QCyksC64lMGSzmGGj7TIXGz4SyoHJbClZ2
         JsOYwvO/u6YYUbUsyAa4r7EKZbcmAOvkMjF5zjiW1rwAmqv7XYfr4Bs49Mm0+Z4fO4ff
         TOGWSip7gn+0/ebz5fqTNsPXWiwpSUnJyZNru+ZxE4ZB3Kk/w5PQmseJzqh1+RTMtnZg
         Il1g==
X-Forwarded-Encrypted: i=1; AJvYcCWv2snI/yJ+9g793TJMhzj/orfrR4E3mu4L4XXEsksT+FdFJtOrRNShI6RHSnaaZW+Uwf7V0IKz8CA1mdc5bckB@lists.infradead.org
X-Gm-Message-State: AOJu0YwUWGg21GG5l1cy08lgf7Xv02cQVoxew4V29uc8O9UsbywxBkiP
	UQXqILca6lexa07c6yB2v3uuvhXoTnhXsrNuH++Vve3Gq1D1MZOojjd5fMzyhlkjpDRlTAgKZ2b
	Ku2ttFOhxkz5djKBmc6n6gayvntI+ZM6JyFGjZg==
X-Gm-Gg: ASbGnct9BuUDfsK84oVxToXI0q71wNWptsP3TCdjwXXwSPpXROv77yGJpaNWOEU1BU/
	5yebYGatz0cxPy5H1FLJm0IpSKXAteq5469pHPxXqaHGWM8ZQOM/5/rDh1jjYc3ph
X-Google-Smtp-Source: AGHT+IH/zeBRHfSwhp5oRXvCEbbAPacPm8jOYa4uMae3tXMP2WsluSNrPTDCyNM9hJkYNCNSFOV2bTGYXYi1Tw0myk4=
X-Received: by 2002:a05:6902:2b86:b0:e38:4d62:5a92 with SMTP id
 3f1490d57ef6-e38cb7170d9mr5809581276.42.1732200710049; Thu, 21 Nov 2024
 06:51:50 -0800 (PST)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 21 Nov 2024 20:21:38 +0530
Message-ID: <CA+G9fYurbY3B6ahZ+k+Syp5bZ3a+YQdeX8DRb6Twi4BDEFbUsw@mail.gmail.com>
Subject: next-20241121: arm64: of_pci_supply_present (drivers/pci/of.c:746) -
 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000058
To: PCI <linux-pci@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_065152_103050_59842AF4 
X-CRM114-Status: UNSURE (   7.39  )
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

The juno-r2, qemu-arm64 and qemu-armv7 boot failed on the Linux-next tree.
Please find the crash log below.

First seen on the next-20241121 tag.
Good: next-20241120
Bad:  next-20241121

Juno-r2, qemu-arm64:
* boot/gcc-13-lkftconfig
* boot/clang-nightly-lkftconfig
* boot/gcc-13-lkftconfig-perf

qemu-armv7:
* boot/gcc-13-lkftconfig
* boot/clang-19-lkftconfig


Boot crash log on arm64:
-----------
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
[    0.000000] Linux version 6.12.0-next-20241121 (tuxmake@tuxmake)
(aarch64-linux-gnu-gcc (Debian 13.3.0-5) 13.3.0, GNU ld (GNU Binutils
for Debian) 2.43.1) #1 SMP PREEMPT @1732169734
...
[    2.118104] pci_bus 0000:08: resource 0 [io  0x2000-0x2fff]
[    2.123710] pci_bus 0000:08: resource 1 [mem 0x50100000-0x501fffff]
[    2.130054] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000058
[    2.138868] Mem abort info:
[    2.141672]   ESR = 0x0000000096000004
[    2.145435]   EC = 0x25: DABT (current EL), IL = 32 bits
[    2.150765]   SET = 0, FnV = 0
[    2.153832]   EA = 0, S1PTW = 0
[    2.156994]   FSC = 0x04: level 0 translation fault
[    2.161888] Data abort info:
[    2.164781]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    2.170283]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    2.175351]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    2.180680] [0000000000000058] user address but active_mm is swapper
[    2.187055] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    2.193333] Modules linked in:
[    2.196393] CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.12.0-next-20241121 #1
[    2.204151] Hardware name: ARM Juno development board (r2) (DT)
[    2.210078] pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.217053] pc : of_pci_supply_present (drivers/pci/of.c:746)
[    2.221685] lr : pci_bus_add_device (drivers/pci/bus.c:408 (discriminator 1))
[    2.226135] sp : ffff800082f5ba70
[    2.229450] x29: ffff800082f5ba70 x28: ffff8000827ce000 x27: ffff8000823e0118
[    2.236607] x26: ffff8000822f65c8 x25: ffff8000823be4f0 x24: ffff00082111a428
[    2.243762] x23: ffff0008218a8800 x22: 0000000000000000 x21: ffff000800a230c8
[    2.250916] x20: ffff000800a8a400 x19: ffff000800a23000 x18: ffffffffffffffff
[    2.258069] x17: 00000000f3b41269 x16: 000000006984274c x15: ffff800082f5b8c0
[    2.265224] x14: ffff800102f5ba47 x13: ffff800082f5ba4b x12: ffff800080b5dee0
[    2.272378] x11: ffff8000800171b0 x10: 000000000000002e x9 : ffff80008084b910
[    2.279532] x8 : ffff800082f5b8e8 x7 : 0000000000000000 x6 : 0000000000000001
[    2.286685] x5 : ffff000800a3a850 x4 : 0000000000000000 x3 : 0000000000000198
[    2.293839] x2 : 0000000000000000 x1 : ffff000800a8a400 x0 : 0000000000000000
[    2.300992] Call trace:
[    2.303438] of_pci_supply_present+0x18/0x78 P
[    2.308065] pci_bus_add_device+0x90/0x208 L
[    2.312515] pci_bus_add_device (drivers/pci/bus.c:408 (discriminator 1))
[    2.316616] pci_bus_add_devices (drivers/pci/bus.c:435 (discriminator 2))
[    2.320718] pci_host_probe (drivers/pci/probe.c:3362
drivers/pci/probe.c:3132)
[    2.324472] pci_host_common_probe
(drivers/pci/controller/pci-host-common.c:80)
[    2.328924] platform_probe (drivers/base/platform.c:1404)
[    2.332595] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:658)
[    2.336176] __driver_probe_device (drivers/base/dd.c:800)
[    2.340540] driver_probe_device (drivers/base/dd.c:830)
[    2.344730] __driver_attach (drivers/base/dd.c:1217)
[    2.348572] bus_for_each_dev (drivers/base/bus.c:370)
[    2.352413] driver_attach (drivers/base/dd.c:1235)
[    2.355994] bus_add_driver (drivers/base/bus.c:675)
[    2.359835] driver_register (drivers/base/driver.c:246)
[    2.363677] __platform_driver_register (drivers/base/platform.c:868)
[    2.368391] gen_pci_driver_init
(drivers/pci/controller/pci-host-generic.c:87)
[    2.372495] do_one_initcall (init/main.c:1266)
[    2.376338] kernel_init_freeable (init/main.c:1327 (discriminator
1) init/main.c:1344 (discriminator 1) init/main.c:1363 (discriminator
1) init/main.c:1577 (discriminator 1))
[    2.380705] kernel_init (init/main.c:1470)
[    2.384200] ret_from_fork (arch/arm64/kernel/entry.S:863)
[ 2.387784] Code: d503233f a9be7bfd 910003fd a90153f3 (f9402c13)
All code
========
   0: d503233f paciasp
   4: a9be7bfd stp x29, x30, [sp, #-32]!
   8: 910003fd mov x29, sp
   c: a90153f3 stp x19, x20, [sp, #16]
  10:* f9402c13 ldr x19, [x0, #88] <-- trapping instruction

Code starting with the faulting instruction
===========================================
   0: f9402c13 ldr x19, [x0, #88]
[    2.393886] ---[ end trace 0000000000000000 ]---
[    2.398565] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    2.406234] SMP: stopping secondary CPUs
[    2.410169] Kernel Offset: disabled
[    2.413658] CPU features: 0x080,00020c3c,00800000,0200421b
[    2.419150] Memory Limit: none
[    2.422207] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---


Links:
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241121/testrun/25983314/suite/boot/test/gcc-13-lkftconfig-rcutorture/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241121/testrun/25978784/suite/boot/test/gcc-13-lkftconfig/log
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241121/testrun/25978784/suite/boot/test/gcc-13-lkftconfig/details/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241121/testrun/25978784/suite/boot/test/gcc-13-lkftconfig/history/


Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2p9DUGD8S9fakSvceaAXMeGBRs7/

Steps to reproduce:
------------
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2p9DVXtRiqTj7VZO9wnFlkwmU8g/reproducer
- https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/2p9DVXtRiqTj7VZO9wnFlkwmU8g/tux_plan

metadata:
----
Linux version: 6.12.0-next-20241121
git repo: https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git
git sha: decc701f41d07481893fdea942c0ac6b226e84cd
kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2p9DUGD8S9fakSvceaAXMeGBRs7/config
build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2p9DUGD8S9fakSvceaAXMeGBRs7/
toolchain: gcc-13 and clang-19
config: gcc-13-lkftconfig
arch: arm64 and armv7

--
Linaro LKFT
https://lkft.linaro.org

