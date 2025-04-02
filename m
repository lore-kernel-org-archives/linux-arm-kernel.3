Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594FBC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qD/PMOyx9XK9R1d/xQ4M0XKWGpm4ZEHxb/f9TzxVDzc=; b=rx+J7dDMKoihv0EcKWqCNmwsxC
	D48foggpUl8R44VW7/5i3TxPW3G8ajJkuxQXmPCEBeGgBOcup82DmNEi8piN40R2ZsKDkGKDeh5HI
	n/V4n9Y2S3P3gFYN84SFp3DBVT83IJtlQnSlIFWg4HCS+zXkdog+3+c59dQk5UfhaESMdcMN78e1d
	l/cGL81g/wi8oTE4Bp6IU+W5y7G8NkkmPpYgmwrseT7Ug96lb8MDbO6k1EZmUziItdwxsv+5G7Ztz
	9pF89vaWn8hy+TkJy0QmUu1t3T6aU4Z24hGPTfKcobVCzXO7Lp2/7QQOe/EgxPCvVAaUiUmotRbv/
	ftV/gvWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx8M-0000000640y-2t8u;
	Wed, 02 Apr 2025 12:23:54 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx6b-000000063j3-0KFP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:22:06 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-523dc190f95so3347100e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 05:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596521; x=1744201321; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qD/PMOyx9XK9R1d/xQ4M0XKWGpm4ZEHxb/f9TzxVDzc=;
        b=YipduNjittq5z0Tw+y/8x2MhCDmeKzrYwE9OAl63HcAXD3QR2ONTcXWqqhaf3l3Ps7
         Ovwu1ombGEolYxphRLv+Pc/tg7brfpPRGOie2FP6rSyLXh5EZ700rLQNXa78rBvZqD1i
         2IMeJ6+fd1ttMBaCQT7WCyHacL4EgqJ/kmBnqQzM14aAE+F5sc6qVQ9u63Xj6eokV1Xx
         l8s/Qc+LvUEiwMF3S+3gQe7d2wGt6IaKEhLJFpQnWzgtX/9Rrfr/sm21HXgXW9jJXQul
         gsjLy9qbeogUEyZPZG1yVLOyCzLP0bT8HFULcyqRfMN2LKYHj9oPYdnhNk3H3cIh9Uk+
         1I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596521; x=1744201321;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD/PMOyx9XK9R1d/xQ4M0XKWGpm4ZEHxb/f9TzxVDzc=;
        b=q9ByOQ6I2MRKncYVQ8OHc/CGuOfn59tLGnE+9/q1dnlBZkLvcaTpvKORqwpiv+rpaE
         9DcbB4B8jOPuPINBOjli+XeUN6P3TOEgNAKh56DFgj+O48BpaobYSRohfnpr8Xt+KNxd
         vIayRGeXljbbgYsZMQdT3+ivbZQRWdvU2XkaJSLGCRt+L0BRaWRrM90POPL5faJxHc3n
         hPsJy7SfO81ST21F5YuHnLxb5Xc5lZdH324cB/tbK6V7MClhXwnRhsyHzJlVAsTs2ckV
         YSb3lK++ZPGi91RZ/FY2WUo5l46cVRsTkzn58nVDhB5PT85aVHcdo2s7qMs+hFIj9ala
         AJBA==
X-Forwarded-Encrypted: i=1; AJvYcCVXjuaebJGa8z1mxTQc0/+rmt05UU+kwqMNAVM77rezuk0k6oea4hKPs8pbt7bZMYJXNfbN3qT/zv5Hg5M9+p76@lists.infradead.org
X-Gm-Message-State: AOJu0YwplfkSNazc/AInZorFfXM9nqy04W2IwvEDiYm2gX/qff7rLmBI
	wKkJS5iz2j/Y51YxPXTRrC75s4+6FyHwYUIsDIlNJ2nKXwPJ0aE4zgUFXLE2nQapbJCRG/+8TqA
	XZmdbUq7qRD+IfUryFobN9WSjhNhpHPKmygGgqg==
X-Gm-Gg: ASbGncsPN3mD38kzmlO1wSmu5muq8O/A2FyNMj2yJgQduf5uIIEMrexEY2jp+jkFNR4
	gLgW+cH0dfPhASXEJIR7tSYCLJm/tbHAxZga/SoQYwHph2uTU+rIO0kKcarTZHyTMIpwBIbtWsj
	XDPAppbs/cXnqhYrOYRbp/yZJEskWIb3rnWLoyJpCu7+o/PSXQRddMwBU8gkc=
X-Google-Smtp-Source: AGHT+IGZd1b5fqfa6pHXvxexGDlAKss+FYCovowlkAi3Xj1GtUKyZmc4loNHv1qXkrx3HBYz8r1MbDuMAFYoP6L8Qfw=
X-Received: by 2002:a05:6122:1ad0:b0:525:9440:243c with SMTP id
 71dfb90a1353d-5274cfb95a2mr1043348e0c.11.1743596521224; Wed, 02 Apr 2025
 05:22:01 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 17:51:48 +0530
X-Gm-Features: AQ5f1JqYWbXD84vj9qiHXH7fpaSiEYXFSjnm4-yFz-CnOCSphgOZJOvkdDjcXGE
Message-ID: <CA+G9fYuQHeGicnEx1d=XBC0p1LCsndi5q0p86V7pCZ02d8Fv_w@mail.gmail.com>
Subject: clang-nightly: ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!
To: clang-built-linux <llvm@lists.linux.dev>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, samba-technical@lists.samba.org, 
	linux-cifs@vger.kernel.org
Cc: Steve French <sfrench@samba.org>, bharathsm@microsoft.com, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Shyam Prasad N <sprasad@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_052205_141841_FF7B402C 
X-CRM114-Status: UNSURE (   6.03  )
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

Regressions on arm, powerpc, s390 defconfig builds failed with
toolchain clang-nightly on the mainline master branch.

First seen on the v6.14-12245-g91e5bfe317d8
 Good: v6.14-11270-g08733088b566
 Bad: v6.14-12245-g91e5bfe317d8

Regressions found on arm:
  - build/clang-nightly-nhk8815_defconfig

Regressions found on powerpc:
  - build/clang-nightly-lkftconfig-lto-full
  - build/clang-nightly-ppc64e_defconfig
  - build/clang-nightly-lkftconfig-lto-thing
  - build/clang-nightly-defconfig
  - build/clang-nightly-lkftconfig-hardening

Regressions found on s390:
  - build/clang-nightly-lkftconfig-lto-thing
  - build/clang-nightly-lkftconfig-lto-full
  - build/clang-nightly-defconfig
  - build/clang-nightly-lkftconfig-hardening


Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: arm powerpc s390 modpost "wcslen" fs smb client
cifs.ko undefined

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log

ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!

## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
* Git describe: v6.14-12245-g91e5bfe317d8
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/
* Arcitures: arm, powerpc, s390
* Toolchains: clang-nightly

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27856145/suite/build/test/clang-nightly-nhk8815_defconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27856145/suite/build/test/clang-nightly-nhk8815_defconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27856145/suite/build/test/clang-nightly-nhk8815_defconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdO7KHQCCZBICM0MvpaTUbLm/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdO7KHQCCZBICM0MvpaTUbLm/config

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm --toolchain
clang-nightly --kconfig nhk8815_defconfig LLVM=1 LLVM_IAS=1
 - tuxmake --runtime podman --target-arch powerpc --toolchain
clang-nightly --kconfig defconfig LLVM=1 LLVM_IAS=0
LD=powerpc64le-linux-gnu-ld
 - tuxmake --runtime podman --target-arch s390 --toolchain
clang-nightly --kconfig defconfig LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org

