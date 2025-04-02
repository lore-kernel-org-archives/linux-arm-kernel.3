Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BB9C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y+3sJL5+WsmkUHEYm1BzR/GyrjVHVNtLDIyVC85cNdI=; b=LQ5dKLHa4Zmm4kRS0Yswuc57ee
	nh12YD26GMMzQWSJFayGOXvHCeE5ERutxcWs36/I/MZ0ugMfuBjce4icZC2mKC+IRF2NRHGsB6D/L
	Px6zXJcvbv0nsR+DiHo9KjbipKWHLatIkf//HaEvHdC6qfE108clkFsdI+Yxh/9RZ5/O/Bi6+Q2Q7
	hf1SjnOZBIahrgAii1DcBAKrIgBQt6cZu2McWsV52zFoJndGO/Iolq3D8CVlX2pP66nnin7ZKDNDJ
	Us/wQ2NRMk/bawJtanj1ZGVhNrD6XHta0knfoqVJ77HZ7JxBHVK2IrEQXUO/9atLB5ANrzHwbLh6U
	CZ8RxEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxcg-000000069rv-2xet;
	Wed, 02 Apr 2025 12:55:14 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzxXL-000000068Vt-0I25
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:49:44 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-86b9b1def28so6113990241.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 05:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743598181; x=1744202981; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y+3sJL5+WsmkUHEYm1BzR/GyrjVHVNtLDIyVC85cNdI=;
        b=wfv0X0eiO6vwGyjJTsYzTQi87XfQyXPalmh1ejWIy4FuXgs4LM9A5r0uB1APeNY5Rm
         zNVlXTKGeK1N3lKbVKF9NuyHpyLUXvC5HLeVxVqkMrJEuMuGnm+01GeFuM1zUbT7kSia
         AsVkBxHnLe9mu7OV1zr/mVCWiNUCS8O7oPG230WhW/sI/0P09ZTEKN7udhxCYNcaqPe2
         SyEgWtRgHMX64nA+GyGbPeTLg8E3DmewGCJSt9CkLWMcBfjULJzUx+sPbiI0AexIvp1T
         DtzvpY/SDJv3M8tlDuV4+ObXIIOJ8DmigNASWo6dNjyR7kt5XVQ8Y+r4slSkTumzIlAH
         EyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598181; x=1744202981;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+3sJL5+WsmkUHEYm1BzR/GyrjVHVNtLDIyVC85cNdI=;
        b=jTXtTal3he0yK3VCByC57AfCxXY78l3w4x8/x1CXh3Tl7cUwqu65uvxRcXO62k6KOl
         6cAYr9FfzznRdvRmTN0GksSe7GR7Q8zoWkq8L3L0KxK6mu90ppR3V5ieJng/l6zw3z1T
         hgVXlL/prl6/mPbEpGi07SA3Gf3avMv/GA8z0OnE8hYFY7/56th86aP6zLYJ8gQIGjPb
         mG92ViGz/MqWF3tes4KZ4RC8qgssIqqx0OYCJ06yeyyIHqJAyhGoJq6ggslEz6MYOSgh
         JZ8FV4Hp3lJDNmxPJbjzYqUgHZ3fKE86uT0oaQGYAVmqvcEYkysj3jFwpvPnlu8cwN83
         C/hw==
X-Forwarded-Encrypted: i=1; AJvYcCVAbCE1Re3Ij37qC+GI7BpmM77R327uHdL173XtSCRaKoOHsRR21RXr+YrRHy1l54POfvNFG4qBFtdJwcbiaZ+O@lists.infradead.org
X-Gm-Message-State: AOJu0YzvjHRpbw/BG7jONCrF8EnML5i55utqWz7odQUuYkov7yfPA02/
	c+egwQL9DpWVFWzQ7aAIWN8aekSz9SmdNJ6I22mvcrzcZv6w6iZqiofGeDSFtWYI1+sRWtAszKk
	70aNtYd8+nEaZCW1VNCRiksggy14AI0dlQx3g4w==
X-Gm-Gg: ASbGncsmaZAeo04GKTpixSLD2HFM4pZnSPIMvFQbiqT/1wETHtvWrPUqcb6iGDEKZK9
	I3P0YVPnYIpwaUiiyQvmGBxlnD5UYh7KcFA82kt5vOIp1yeYvncFAmBe+3z5E7ae9b5ebs0PkFs
	tCCbNNVNXlWs57FhTIUxd3OYAj34Y9k0+bohn7f1+BP9KdeOodR8O8JYb/vdI=
X-Google-Smtp-Source: AGHT+IEZPV71xCZFRaiMP7CnHUqII0vri11WJXA0JOvFvWq6jg//KmbiEFno6N5n8nVLL7zZFwNgKtdEbJvUoV78150=
X-Received: by 2002:a05:6102:f8f:b0:4c1:9bdb:6188 with SMTP id
 ada2fe7eead31-4c839e38348mr1583448137.13.1743598172341; Wed, 02 Apr 2025
 05:49:32 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 18:19:19 +0530
X-Gm-Features: AQ5f1JrYBDqdwedr2g0EeIuRXqX4Zi5GT7DMBhpK7McR8fimUhQCIrzEPDNgmhA
Message-ID: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
Subject: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_054943_106643_E0429B96 
X-CRM114-Status: UNSURE (   5.55  )
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

Regressions on rk3399-rock-pi-4b, dragonboard-410c and dragonboard-845c
the lto-thing, hardening and lto-full config boot failed with toolchain
clang-nightly on the mainline master branch with no console output.

First seen on the v6.14-12245-g91e5bfe317d8
 Good: v6.14-11270-g08733088b566
 Bad: v6.14-12245-g91e5bfe317d8

Regressions found on rk3399-rock-pi-4b:
  - boot/clang-nightly-lkftconfig-kselftest
  - boot/clang-nightly-lkftconfig-lto-thing
  - boot/clang-nightly-lkftconfig-hardening
  - boot/clang-nightly-lkftconfig-lto-full

Regressions found on dragonboard-410c:
  - boot/clang-nightly-lkftconfig-lto-thing
  - boot/clang-nightly-lkftconfig-lto-full
  - boot/clang-nightly-lkftconfig-hardening

Regressions found on dragonboard-845c:
  - boot/clang-nightly-lkftconfig-hardening
  - boot/clang-nightly-lkftconfig-lto-thing

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: rk3399-rock-pi-4b dragonboard-410c dragonboard-845c
no console output

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
Starting kernel
...
<No console output>


## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
* Git describe: v6.14-12245-g91e5bfe317d8
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/
* Architectures: arm64 (rk3399-rock-pi-4b, dragonboard-410c, dragonboard-845c)
* Toolchains: clang-nightly (Debian clang version 21.0.0 )
* Kconfigs: lto-thing, hardening, lto-full

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdkI9AGWWvuT5OzYdgSgXEeH/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdkI9AGWWvuT5OzYdgSgXEeH/config


--
Linaro LKFT
https://lkft.linaro.org

