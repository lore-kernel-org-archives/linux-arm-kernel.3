Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9E0C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRUWTVvPr1yAn+DH33u9nddl4ICwL7m9XNyge0uZ0XA=; b=i6wXGjBAW+I3baDYoenxALCEek
	8sij4j9gZej1K68UpGkyqbEjocKql1OZt8FMi4t5eJltMyaO0siGl/h9WNiOXT0e7+hYGAiLfzPth
	RR5XdLyAvDN4DVXN5oZ8bG9QE9PeJpkpVhuVbkNk50Ibf1L2ow4vRR4EbDZ2SyAryywsINg3dVdYb
	D0Dq2ehU6bfLe9QJutec8JdBWev/+mESzGRIKCQeZqpJ6i4zpJySpXIjGW3QxSc2N9Q5Q0Yhv4Hry
	1MCYbOpkvQoHOJXYgUhpbnK8BkSitsoYVPWd9J0SYXYRDATtC7UM1ngc+9ynjoIeiXpTYpEJoztBj
	zM1eBsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrar-00000004HAd-29eA;
	Tue, 24 Jun 2025 00:32:57 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnkz-00000003vN3-1nFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 20:27:10 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-31223a4cddeso3466269a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 13:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750710428; x=1751315228; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TRUWTVvPr1yAn+DH33u9nddl4ICwL7m9XNyge0uZ0XA=;
        b=X039vVvAdCeNsde0T9cbpO+PVTv2mPk5SdxtABRyJvozHvc0kZYGQfkhYxJ7GG4w+g
         TZJ5Sd0R/hN1g4xuZzdbpCBt2facZYOUB0kw0zqa2sTfRBLlf1u/ktU2m/QjNqEsVUNk
         4dSQOpShI0eM1FRq5VuJZ4SD/Nu2K9faG7OG+Zu8sT/7noA1pB9LQe+m/4U7aUlgoxCT
         t30fubX3c1lp1lHgg+NGHa6oV9TC2b89QlZrK+yZ/AJaki8JADdqOebx4j1WuRfR6ZVB
         wvafgruUG7DS4lSWgJorQk2B6Tdb4FiE/abRifF9WGZV8tUfFXNBr8FbAqJhOZL7Svce
         YJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750710428; x=1751315228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRUWTVvPr1yAn+DH33u9nddl4ICwL7m9XNyge0uZ0XA=;
        b=OoEMUuINHZTst0XdAe6wVumihN/hEG3ZWqQV5b5N6Y/+cbGwHXusFiuNqmMme9XRon
         H6B75cfzqzj6K5e85gf1+nX6tRtYolsBxXpeFKup7Ug3nE1s/4IY5o3xP8erYInbg0ee
         qHkte5ZQgGYy7uOQgvpCs4iIxIdQTxdpfu8NeLcy7P3cwhXFG4OaDV6vN4p+IDwR6MTC
         NGB19b5irvZv1NoQce60pOikzEXgsUWNkIEKVNfFBIXnn4lcgHSIjJc9hxnK+0TBq7U6
         bbwWag0bNsO1ztdmhqDpQOhbklPp+j/0s5lnEnOw9v7k94ujldt9hEUwskT2zG6WLs+Q
         t2Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWBlsf8deAJFrIvgcK5j1QSPevFfF4JPnd1cHgwmdE0r6Wr3vbY2emyw8z9dO7JVjdrI9+SQ5oGc6EpEnUZBtw/@lists.infradead.org
X-Gm-Message-State: AOJu0YxfIoNVF1trgfd3+x6UUG3SiLsMJ2h5CIsBAFt2rcN7t4UidEdi
	rsxwIw6chOXkEhdQ1OEdwnpkHIIVadSFNFgGIe59OPeUuM18tcr6xit2jfPYFJ3I+ZuDI0Myox8
	jIVcCRYQVWdL3DWw0k6tM1ip7/KL8fOuCk4WkbSHaojiuZrXei4JfBixamg==
X-Gm-Gg: ASbGncuMwO9Q9j+/XbnGuWj56l+gFiOhq626WWePswlS+//clOgA8JWR9bIV4CYaqOM
	M7rrk6KAFBiB+MNNnuF8nAWf5PVBqVPSR2rM+AzfGVXLskvYqju70N/uAb2ZBm/4Nk7fcgb9XvM
	hbCmr75YpPQRbtmhGEjWgdcmc1WxrmZ2/aQLMDn9F669emFXiKEdCMDvcnY7l4HkBodvMaMJCeQ
	cre
X-Google-Smtp-Source: AGHT+IH/jRTZELaiRlcOXYueghlWrSKvl+Er6wcSXSYeSJ4Ygh1TNzIY808loskXKKypj3EiWW7XbMMUZvUaCEZC52s=
X-Received: by 2002:a17:90a:c10f:b0:312:e91c:e340 with SMTP id
 98e67ed59e1d1-3159d8f92a0mr17862431a91.35.1750710428532; Mon, 23 Jun 2025
 13:27:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250623130626.716971725@linuxfoundation.org>
In-Reply-To: <20250623130626.716971725@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jun 2025 01:56:56 +0530
X-Gm-Features: Ac12FXzbqaWlyV-mY2jBAeAf_VzRigYao0-wWRbsMa_bGEBBFai-0Z6bbuS6vrY
Message-ID: <CA+G9fYt2e-ZGhU57oqWwC1_t2RPgxLCJFVC0Pa8-fYPkZcUvVQ@mail.gmail.com>
Subject: Re: [PATCH 5.10 000/355] 5.10.239-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Julien Thierry <jthierry@redhat.com>, James Morse <james.morse@arm.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_132709_477976_1E1FE102 
X-CRM114-Status: GOOD (  18.85  )
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

On Mon, 23 Jun 2025 at 18:39, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.10.239 release.
> There are 355 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Jun 2025 13:05:51 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.10.239-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on arm64 tinyconfig builds with gcc-12 and clang failed on
the Linux stable-rc 5.10.239-rc1.

Regressions found on arm
* arm64, build
  - clang-20-allnoconfig
  - clang-20-tinyconfig
  - gcc-12-allnoconfig
  - gcc-12-tinyconfig
  - gcc-8-allnoconfig
  - gcc-8-tinyconfig


Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: stable-rc 5.10.239-rc1 arm64 insn.h error use of
undeclared identifier 'FAULT_BRK_IMM'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Build errors
arch/arm64/include/asm/insn.h:573:9: error: use of undeclared
identifier 'FAULT_BRK_IMM'
  573 |         return AARCH64_BREAK_FAULT;
      |                ^
arch/arm64/include/asm/insn.h:26:54: note: expanded from macro
'AARCH64_BREAK_FAULT'
   26 | #define AARCH64_BREAK_FAULT    (AARCH64_BREAK_MON |
(FAULT_BRK_IMM << 5))
      |                                                      ^
arch/arm64/include/asm/insn.h:583:9: error: use of undeclared
identifier 'FAULT_BRK_IMM'
  583 |         return AARCH64_BREAK_FAULT;
      |                ^
arch/arm64/include/asm/insn.h:26:54: note: expanded from macro
'AARCH64_BREAK_FAULT'
   26 | #define AARCH64_BREAK_FAULT    (AARCH64_BREAK_MON |
(FAULT_BRK_IMM << 5))
      |                                                      ^
2 errors generated.


## Source
* Kernel version: 5.10.239-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: 7b5e3f5b0ebc00e3fd81739cee4390854bf954b5
* Git describe: v5.10.238-356-g7b5e3f5b0ebc
* Project details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.10.y/v5.10.238-356-g7b5e3f5b0ebc/
* Architectures: arm64
* Toolchains: gcc-12, clang-20
* Kconfigs: tinyconfig, allnoconfig

## Build arm64
* Build log: https://qa-reports.linaro.org/api/testruns/28836206/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.10.y/v5.10.238-356-g7b5e3f5b0ebc/build/clang-20-tinyconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYOGFXQjUoxSVcOdLsYPowznR/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYOGFXQjUoxSVcOdLsYPowznR/config

--
Linaro LKFT
https://lkft.linaro.org

