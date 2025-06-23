Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41376C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 01:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKugEmOPj2OnBJsKBHzxcLtnIp31cFhUKP6WHxuOkns=; b=lJ2OWbJE7Yw6k/l+trTqLqgrpu
	yCSfyXFM0at0y6I0Jz4b2P/4qk6UWf4nMrmb9agbXSOYmn2mcDZD0aqNSnt6hFuIgL6glfdrxHwK3
	NqsS8zNfEaBGAzdohbkb9dWaqG3FyILEQPsCI/kMJXxjD5cQNN/w/tsnPFnoWrFpTZ8B2/751Ax30
	KIiH5M87F/kZRuB65Wz2Rjky6DuVNqpz3er2NFEDuZcgXYw8Mhna1i6Z+m4R5UjTpYJxiTyWkGjXa
	WoHqOL8zRtcNaj/dsXc7u6BJnyNRHCskZKz4/7zH6HULbEoMPyTFYE3OeH0fChlgpuBPAfHwgG/fp
	7/+ES/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscE-00000004NaP-1wJ0;
	Tue, 24 Jun 2025 01:38:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTmea-00000003nDN-3nau
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 19:16:30 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-23649faf69fso46201345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 12:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750706188; x=1751310988; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wKugEmOPj2OnBJsKBHzxcLtnIp31cFhUKP6WHxuOkns=;
        b=cL4tNExq2JEoZaWLG8DZKbf/2+VvQcd43nrjstjBloJBvSNQe0h6BP6tiJsC955mHD
         zA3II+m052mNavhhrfgLWmrd8Rr185S5ndmnUNn7W/KZPstYtd03n9o5Usoc4S0nDxyj
         1P4f6Cm8bzbYQ1PxeUyHf8rTX7wmMb1/JzTM/qPSR2MFPJcrrQ1Zurj4p2XQ+4rcIuw8
         nvg6cxHORmqV9AHC1XPqIKOcJs90fqtYq7ODIOmcf0dQfsXQ3yQ4O+3Z0/ITEqIlB6zb
         lndfDUhMlevcX2pYYvUUisWcsQFII0MRugirNywq/dDytSecATQuz96RnNzQxbAWgUTP
         Jn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750706188; x=1751310988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKugEmOPj2OnBJsKBHzxcLtnIp31cFhUKP6WHxuOkns=;
        b=kq740+pSgcZEFTajDsmhxiRCfVJhkPT3YgJL/DYDPduT+6X5ZJEbBmLJlnsU2UQbPR
         oDv0lxo/lQztmCQjZOFINgHp7CsiZh+LqQexf9RuyiIDQs9aNqBFSzgdijK1GiqWkJVe
         D+EmdGVfKavN2OV5JApMHKPAn4tmE3TtcCz2VNiaptaWMu0+Z9kXe6NaR0riOSLtODk5
         qD5YYyRUI7trEFvpn9zr4aLs1dhvuDLb8jvq51SMHDr/5S9Q5npImeUiCaNlSEGUE0dF
         dt3hNTUaRT1U0wSDRU9gmQrA0SVneSUCgcyoC5dhKEcJ3+U4ec3uWC3jaaPonuR2cl9v
         gP7w==
X-Forwarded-Encrypted: i=1; AJvYcCVUA9iwdfmbeXdDz3UKjaH7zGxAFUmJTqZNi++pFfZ5C1QeFyBpmyT/IZ62naLBqbbIuulmLKXJUV2w7oRqy4E5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3/1nA+lzRlXqFViq8n5mZLvCGEr0WgPQcMmk5L4fHlEBYg+mL
	JgRRIrz+dFMS33Rd+w9b2oN8o/kgKGGuSBVGxmbvnAoezhAwqWNMe/OLXkFojjsdTFKImqjs7UX
	MtH/URuXPIGUX2VOamsuHpIhV/pFWhhfJbT757/8Ypg==
X-Gm-Gg: ASbGncvJ8kQX1SzulLUJ9EWqKiUKHsEYhwwJ3Q4nTAJma15CBH2wSF3s7VRCOUX27V7
	w04gl1DUH3+YFN7KI6o7Dl98Apk1QBY+A+U8B/SnaBGpPmsTFdU6Y1A6YjHTaJ8VGsyijLxOQHV
	wCbbTwtmtS6tJEfbzk5AoTFuK7TNSq8eM62wvGj74PmPSHMbC6tuS9BTznSfcPMQCobg8h0Y0lC
	eQX
X-Google-Smtp-Source: AGHT+IGrFhsWx2APvDHc9B+I1PGJySlyZAw1hj5EW5+boxTCTPHRxriv2teURnE3JpRUpFRPlT0ckZzm8x0oUDOBFUE=
X-Received: by 2002:a17:902:e842:b0:234:b41e:37a4 with SMTP id
 d9443c01a7336-237d977534dmr170095205ad.6.1750706187876; Mon, 23 Jun 2025
 12:16:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250623130611.896514667@linuxfoundation.org>
In-Reply-To: <20250623130611.896514667@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jun 2025 00:46:15 +0530
X-Gm-Features: Ac12FXz30P3_qgT_WSMm7LFk36zn-jf-1_pKeKeTrImJ1UENQPJh4UpyKNWKP7U
Message-ID: <CA+G9fYvpJjhNDS1Knh0YLeZSXawx-F4LPM-0fMrPiVkyE=yjFw@mail.gmail.com>
Subject: Re: [PATCH 5.4 000/222] 5.4.295-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	kvmarm@lists.cs.columbia.edu, akpm@linux-foundation.org, linux@roeck-us.net, 
	shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
	pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, 
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Julien Thierry <julien.thierry.kdev@gmail.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_121628_949414_35B6CE8E 
X-CRM114-Status: GOOD (  19.69  )
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

On Mon, 23 Jun 2025 at 18:40, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.4.295 release.
> There are 222 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Jun 2025 13:05:50 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.295-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Regressions on arm defconfig builds with gcc-12 and clang failed on
the Linux stable-rc 5.4.295-rc1.

Regressions found on arm
* arm, build
  - clang-20-axm55xx_defconfig
  - clang-20-defconfig
  - clang-20-lkftconfig
  - clang-20-lkftconfig-no-kselftest-frag
  - clang-nightly-axm55xx_defconfig
  - clang-nightly-defconfig
  - clang-nightly-lkftconfig
  - gcc-12-axm55xx_defconfig
  - gcc-12-defconfig
  - gcc-12-lkftconfig
  - gcc-12-lkftconfig-debug
  - gcc-12-lkftconfig-kasan
  - gcc-12-lkftconfig-kunit
  - gcc-12-lkftconfig-libgpiod
  - gcc-12-lkftconfig-no-kselftest-frag
  - gcc-12-lkftconfig-perf
  - gcc-12-lkftconfig-rcutorture
  - gcc-8-axm55xx_defconfig
  - gcc-8-defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: stable-rc 5.4.295-rc1 arm kvm init.S Error selected
processor does not support `eret' in ARM mode

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


## Build errors
arch/arm/kvm/init.S: Assembler messages:
arch/arm/kvm/init.S:109: Error: selected processor does not support
`eret' in ARM mode
arch/arm/kvm/init.S:116: Error: Banked registers are not available
with this architecture. -- `msr ELR_hyp,r1'
arch/arm/kvm/init.S:145: Error: selected processor does not support
`eret' in ARM mode
arch/arm/kvm/init.S:149: Error: selected processor does not support
`eret' in ARM mode
make[2]: *** [scripts/Makefile.build:345: arch/arm/kvm/init.o] Error 1

and
/tmp/cc0RDxs9.s: Assembler messages:
/tmp/cc0RDxs9.s:45: Error: selected processor does not support `smc
#0' in ARM mode
/tmp/cc0RDxs9.s:94: Error: selected processor does not support `smc
#0' in ARM mode
/tmp/cc0RDxs9.s:160: Error: selected processor does not support `smc
#0' in ARM mode
/tmp/cc0RDxs9.s:296: Error: selected processor does not support `smc
#0' in ARM mode
make[3]: *** [/builds/linux/scripts/Makefile.build:262:
drivers/firmware/qcom_scm-32.o] Error 1


## Source
* Kernel version: 5.4.295-rc1
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* Git sha: 7ff2d32362e444f6459597db979cab7af498cdf3
* Git describe: v5.4.294-223-g7ff2d32362e4
* Project details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.4.y/v5.4.294-223-g7ff2d32362e4/
* Architectures: arm
* Toolchains: gcc-13
* Kconfigs: defconfig

## Build arm
* Build log: https://qa-reports.linaro.org/api/testruns/28837192/log_file/
* Build log 2: https://qa-reports.linaro.org/api/testruns/28841756/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-stable-rc-linux-5.4.y/v5.4.294-223-g7ff2d32362e4/build/gcc-12-axm55xx_defconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYHH1epMqFqeFlNFUWiMeDjEz/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yuYHH1epMqFqeFlNFUWiMeDjEz/config


--
Linaro LKFT
https://lkft.linaro.org

