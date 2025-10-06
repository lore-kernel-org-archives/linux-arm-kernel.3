Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422A3CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 11:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A1b4UieRxnHeJDLUzPk+Z3+ZvYx2PdGFKhNe67w07jY=; b=hf/LyUcVoeYwyYq6SrrLwy3Pn6
	2W+wna3j5U+zb+v/BlzJeUAp9W9zzU2zhd/LSt/lHcoHe4uZspoEdRKsyN+MRq5Af64aM3gVzuJH0
	9mlnTum6e1BK8FMj/a4KBVw/k8NuHAp52kRHVMYsheiVM+9edORaHkBJUn0elqf6kn4CIQycXHpmd
	2PYIA4j02zQrcKGONhvVNAvDnOSG6R3oDAu4zzY9pume3hA9fJEJ+VaMQ4eoA5JJpOeFiEYk2inGt
	baTCbaQSFFChbLY96L746lmo8yIYgXIPTD2IrbglwQIA6C2bwyl7xYjxsONI0PxEVCYijoBGJ7H5H
	nq28C3Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jQ1-0000000HTyi-3EZ2;
	Mon, 06 Oct 2025 11:30:17 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5jPy-0000000HTyO-26nR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 11:30:15 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b554bb615dcso3526170a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 04:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759750213; x=1760355013; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A1b4UieRxnHeJDLUzPk+Z3+ZvYx2PdGFKhNe67w07jY=;
        b=MuLSUZqguaecKIegODEUN+Dd1zpnzd/0qyMcq9AEmX+qQg80Zx4MYXHpEMmHxDDhST
         8APEKYCAa5maQR8uXHX81c+ES0KUpsIGESGz2vxtV4YYu6wzVCNQ2gTvJc3ooccYfWEl
         IfDDlKACewfmsnkqsjR3vBGqsNIH7t5pXHrifVnebY3ToMkRfkGlXLoh0TYT+IxiORqD
         R1PXsIauYxeqMaDLXyhQlc3chota7tpZX8+HaBeC72JDYO9lycQDjRhTpK28hGW86UlC
         e44+xo9NwFYPVjT8r58l8J5rj7HJKSA7DSklymRwX4iZaII8pgAZkWjri+9Xl3Rdszb5
         k2RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759750214; x=1760355014;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A1b4UieRxnHeJDLUzPk+Z3+ZvYx2PdGFKhNe67w07jY=;
        b=RYqCY8lPuiZw8nNaTzfkIRpfEvhtfqnBFHA04E5yUO4s3qEo3W8CWGzfdjqanDMHty
         wQGBA+RfpY5vVXxpBn5oe9JEW/HAancd7nCUalGFO9n15lNKimIMU5nFA9IYYqxs5tBX
         ioshwT9O1+s/86D5yP8R6PGm1xOMdAP3LP8bjm8iCxTep4SIlKw+jTjQuBNVbVLoE692
         aYUF5WMkGOW3cJXFgbGELwBBviTaMd2hOuxvmVLoHNsDYnpO8rxpWhKXb+d7JbMMHzJ8
         gZ8U4PqsMisaAtxj0oH8s0KtRNeieHEs7FneVJL+Rk4NyXTKkDc4U6yFtbhATuFvSjzf
         Rk6w==
X-Forwarded-Encrypted: i=1; AJvYcCWLgwcpIJruy42+WEX5E+m/943ClOTb6wFT/CgnoFSEJoMT9qmSv0TD4GNrI4PbVnhuYzI6y+Lo9EgXBRtnUUSY@lists.infradead.org
X-Gm-Message-State: AOJu0YwMRAqXWRJRS3yiUuf+7+IoTa+GXsi66sLRkN/Q2zjubQ0ANna7
	JCtB8NKObEnNSPM3P8nGxa96tMJ5u13dZnt4hVGB7JkMV2hjV9zcKSmdOFWocgrOj/e45gkC8c6
	RBh+xknc20I01goHB/tR9aYiJHfHL5101xOmDwDySmbNX/KrTAvvetf4FMg==
X-Gm-Gg: ASbGncvYFqWw45/bS0aSTBKd0tQuowUHwSzxqU5Vq992U8qO3IEJkRh1FRY+RM73boA
	kKlryzQK2fJGaQRPyHIoYtSKkEMO9I0/YdLSL8W1/bd7M9J+YBAs6IoobfWIbVCX7D38Sa/Nt7F
	IqORpJPxMlmB25PBNIiqVhJ+OmoLMwtWTS3pXh8hMn7Y9G5eq17lIPEtNGwsMPpBKyHbkF4+St9
	21tuYlxRfWoxUv5ZhOyRCKy3bvwDsy8qat/J5MkZ6KI30YpsDNMAq+rCFSK29WoySRwTLNP7Efd
	Xuv9hEd6Yj52SFOqH1AQME4=
X-Google-Smtp-Source: AGHT+IE7/BR9FHufOHH3BLOQUgqTtS1rfbVXN5odMkAwRA+sZP80yDXLfwd06HD6VkaXe09XBa5fi7EiEGqxb/9Ze6U=
X-Received: by 2002:a17:903:178e:b0:274:6d95:99d2 with SMTP id
 d9443c01a7336-28e9a6a90e8mr136255395ad.39.1759750213517; Mon, 06 Oct 2025
 04:30:13 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Oct 2025 17:00:02 +0530
X-Gm-Features: AS18NWAcN9W702ErPzrjZGWWRgZjF5wGQGJwFYbwG9GAp2PHp_NMPerrOOnYfiE
Message-ID: <CA+G9fYu-5gS0Z6+18qp1xdrYRtHXG_FeTV0hYEbhavuGe_jGQg@mail.gmail.com>
Subject: next-20251002: arm64: gcc-8-defconfig: Assembler messages: Error:
 unknown architectural extension `simd;'
To: inux-rdma@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Patrisious Haddad <phaddad@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_043014_555736_8ACFA9E3 
X-CRM114-Status: UNSURE (   5.25  )
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

[Resending with typo correction in the subject next tag]

The arm64 defconfig builds failed on the Linux next-20251002 tag build due
to following build warnings / errors with gcc-8 toolchain.

* arm64, build
  - gcc-8-defconfig

First seen on next-20251002
Good: next-20250929
Bad: next-20251002..next-20251003

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: next-20251002: arm64: gcc-8-defconfig: Assembler
messages: Error: unknown architectural extension `simd;'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

### Build error log
/tmp/cclfMnj9.s: Assembler messages:
/tmp/cclfMnj9.s:656: Error: unknown architectural extension `simd;'
make[8]: *** [scripts/Makefile.build:287:
drivers/net/ethernet/mellanox/mlx5/core/wc.o] Error 1

Suspecting commit,
$ git blame -L 269 drivers/net/ethernet/mellanox/mlx5/core/wc.c
fd8c8216648cd8 (Patrisious Haddad 2025-09-29 00:08:08 +0300 269)
         (".arch_extension simd;\n\t"
fd8c8216648cd net/mlx5: Improve write-combining test reliability for
ARM64 Grace CPUs

## Source
* Kernel version: 6.17.0
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
* Architectures: arm64
* Toolchains: gcc-8
* Kconfigs: defconfig

## Build
* Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/build.log
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20251003/build/gcc-8-defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHcFKTLSBTOxNIJqF9vJqcxt/config

## Steps to reproduce
  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig



--
Linaro LKFT

