Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A029C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sJLTnvgsmSh2wyqfhON/8YMw/+czkU0YdZcT/idsIUo=; b=FpLWedc4kiN4cM77A3l7lBnl4S
	W0GaoGrnwv43NfgwlgHbwRAil0/5l/dODvYC1jwGjChhMR0AGwPXn5Y89upmJ0okeVm+4R/Tz21ku
	GL4W4+MhxwyBXkkRJF8KfoqyiTzX1KK50FR+5iPn2qUJ7qex2iM/1zikexNOVWW9zVdX2DVLf5LXn
	AM8KpZ80e4EFEpy3TYLOtI8WU+RDLLQ7+hGSwk68XhOOK9PND2/w8Y4nbNNVHR7DwOMJN9OxKEwIZ
	hga38Vv8PxD4WWby8n68E2u/A8wCOBYyLkyyl8beRfuNmMTN5gYLifr7nauhX6RmLmszM+tCQp2dT
	euPmlDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCixn-0000000GOut-3FJE;
	Wed, 07 May 2025 17:53:47 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiZL-0000000GLFS-027h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 17:28:32 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-523ee30e0d4so32287e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 10:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746638909; x=1747243709; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sJLTnvgsmSh2wyqfhON/8YMw/+czkU0YdZcT/idsIUo=;
        b=wQl4hfRrd3pL/vcEKM6BDDnJZd7htDSz7O1zVi4h7XjqpROLBNKuLPWCdkeGSTXMIP
         h5/KOqV+NLZ6loY751y7/sZvMhz2fBYuCJ6By6zJxtwFUOYQgHSJEX3cxvlM3FwIUrsL
         KSOeT+AxOll7dxwP4sXOt2IrcUeSvCxSK1gZlZTfkQ41nxMBw8aooEqNI9ENFCbZG0ad
         PNsiziuQXIxMnb6AwcJVujKvNxGbrpP56AbD2KUF+PA812TxF4pn/8Uy2F4KjVz6MLOF
         HEEGBtDoDntRReFiKBIeH3N53mwq48R9QzT00eHODww093xEU5ElA/W5hGvkqY4f6CAD
         O5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746638909; x=1747243709;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sJLTnvgsmSh2wyqfhON/8YMw/+czkU0YdZcT/idsIUo=;
        b=mav9kBCPd500BlgZBAzxzFTkoqYiN744JLTlUh5SWaLhVgiN8/hFsA6Xs5nHuEoqz6
         0KHtLu1cBP956WjUG5MBuWzIZa7VSYXnXF62mdHnid+tF7rb0HoMlzCmzaLRdmvve0JN
         bFihGqinU22SfD9V9USC3Le3rBqahxuNoOrq1rwzOKecC6hWRm6qjRhXp3NbA3g+9WmS
         biA3HvVEl/8YAk+2P31QkGWWY7C0qOKCSfXyIdarK7DUy4SDSgNQbB6dyJ2UiQEFrJek
         GWwz3gPUE0Yk3ViHX68tfp/SfEQfNbmK0nW8Ytwvd70XL/xgzTtO1/TVHvCUC+/giD5i
         6+Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVIMbYAZ0XOzB6FSHWB7dvwwA9ogA7xjnBtcZZh+yJ3AxF+bvKNIn7bjsc5pGEqmeOu1PQipOsOzyescpExkjxT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8ka9jIdB7Nl0SQo7FbnY/JXUt69d+s47hChpXP8/bspQRgUGI
	mIFgEX/NJql/IzIUqiXnM8iEDI1vRWrWD5yEHM9GC8o4605p5Ve2EDVmDGajUA51L4CtSamceBw
	3WnhLINll21ZtSzNyJw2TE6B9PqS4EI0HerNNvg==
X-Gm-Gg: ASbGncvp5zpOo5huna7LbgWeH/yJ/4LPzo+P/tCwsZOLMfz3TFUnCek2nWlWtuhWUg/
	dV4GXROfW2bkq0YLp1W9nOaOkQOPTXfd5hoNMDG51lYjD1PtSq26Tp6HE0j57I/6uYYjLCqTIBg
	6ORxbyGaSCQvlX8ocd590O0uIp/yq2kp3aL+s5oaAXz757vmBknFbHoCEy2v9/XiRV
X-Google-Smtp-Source: AGHT+IG4IZaoNkvRVKDzjVKbKIFzE/3psVUcmLfbZLgj5FXPKyORsxzJGTRDuB6JKK04vnZMts+sE8XiaT4hAEYEAdQ=
X-Received: by 2002:a05:6122:8c03:b0:529:2644:8c with SMTP id
 71dfb90a1353d-52c37ab714emr3191911e0c.8.1746638909299; Wed, 07 May 2025
 10:28:29 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 7 May 2025 22:58:18 +0530
X-Gm-Features: ATxdqUEMZ5W4dbsisOcqI2zyoKIHW94ya2MhqqQpRIXO8khKuthGJXEdEPM65MY
Message-ID: <CA+G9fYvcXTuxC0ncXBQYh8FZE2BxGSuTi6dvN_sWxBRcOAN8tQ@mail.gmail.com>
Subject: next-20250507: arm64 local label `"3" (instance number 1 of a fb
 label)' is not defined
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.or, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Eric Biggers <ebiggers@google.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_102831_047998_ED7E204F 
X-CRM114-Status: UNSURE (   6.55  )
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

Regressions on arm64 lkftconfig failed with gcc-12 on the Linux next-20250507.

First seen on the next-20250507
 Good: next-20250506
 Bad:  next-20250507

Regressions found on arm64:
  - build/gcc-12-lkftconfig-graviton4

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: arm64 local label `"3" (instance number 1 of a fb
label)' is not defined

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log arm64
/tmp/ccRYUGrZ.s: Assembler messages:
/tmp/ccRYUGrZ.s: Error: local label `"3" (instance number 1 of a fb
label)' is not defined
make[5]: *** [scripts/Makefile.build:335:
arch/arm64/lib/crypto/sha256-ce.o] Error 1

## Source
* Kernel version: 6.15.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 08710e696081d58163c8078e0e096be6d35c5fad
* Git describe: next-20250507
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250507/
* Architectures: arm64
* Toolchains: clang-20, gcc-12
* Kconfigs: lkftconfig

## Build arm64
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250507/testrun/28349400/suite/build/test/gcc-12-lkftconfig-graviton4/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250507/testrun/28349400/suite/build/test/gcc-12-lkftconfig-graviton4/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250507/testrun/28349400/suite/build/test/gcc-12-lkftconfig-graviton4/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2wl9II1HZVx3jggzwK4WceUmGrN/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2wl9II1HZVx3jggzwK4WceUmGrN/config

## Steps to reproduce on arm64
 - tuxmake  \
    --runtime podman  \
    --target-arch arm64  \
    --toolchain gcc-12  \
    --kconfig defconfig  \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/graviton3_defconfig
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/lkft.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/lkft-crypto.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/distro-overrides.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/netdev.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/virtio.config
 \
    --kconfig-add CONFIG_SYN_COOKIES=y  \
    --kconfig-add CONFIG_SCHEDSTATS=y debugkernel dtbs dtbs-legacy
headers kernel modules


--
Linaro LKFT
https://lkft.linaro.org

