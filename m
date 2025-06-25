Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 805F7C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 04:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gxLtLJHJekP2m5RDJO4GtXWgXu8wxWquk/PnbuibIg=; b=PHb8c7fZhLTxcbpEsMUdEA1YIW
	xVuPdMM1iLTpxN/XaI5j7DgAPO/r7E5IjIl/o0GlzVFfVUtXjG1eZf/xEfTWJtG24HubCa2TJgWH0
	T2ATOyNCcLRmtYjTH4EGwW91bjbRbdqGbc2bthoeDa+FcVdx3z2FXn7U4nR2IKRiFQa8oe6KjL3el
	rAUNky3wTgW5hQXcVrbUV52d5dWOR7zzAc6Rme6cShPZY0xm1qrqHy5mJO8HWu2xkpqhnJD23E6D7
	gVuwSQ/oKgCaHy5Auknp5zk8OZPyAFIHZDZdf197HTbSQ0kfOe72ueXW17IDjieXgPfWhQzAXhZ2b
	muo6RLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHra-00000007VaY-3ds4;
	Wed, 25 Jun 2025 04:35:58 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHpH-00000007Uu1-3GzD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 04:33:37 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2353a2bc210so54605685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 21:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750826014; x=1751430814; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+gxLtLJHJekP2m5RDJO4GtXWgXu8wxWquk/PnbuibIg=;
        b=v4zCct8bWTJDaAMtsvHhp3pGYmSf+nMIBmRScZ/AwxXK8obJzkznoYhz26+hj5l7ef
         j+3wJLzX4mSgDjAzVtUrlc+fy7p36rhcWi2NWvEfNM6hqUvnhphsByyayHR4KtcVxI3b
         UFl3ShhhZ4AH8rDKQ+bL3qkN2iaeFYYEtFXDZvgBpa4eslLgIcWG68SR08dv3/xO4ag6
         gwplVE8EUmfrnV89O0JOGcN3ESHTPLQ1oLoJWwpoM5rEqbnlVCRS3t5COO9CiRAH//kq
         UJ4rS+CiTQx4X9OEUW5SNP3heHwHg9tSdWRZ2Z/EjYoZf/Rro0qps6MQtv5pcLtb7HFg
         V3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750826014; x=1751430814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gxLtLJHJekP2m5RDJO4GtXWgXu8wxWquk/PnbuibIg=;
        b=rYl15nXmXiZ9sQ1s42gzMKWFwuubKsPrLEQihI5H8X9sjIp2EgKaDl7v5WLAOQbgxu
         EucLPDbQ+RGGhUpPlCAImNa0EmoQdlC4WMNnjiafie9hsSJwuYs0DkM1AS+lUPC88kUC
         L1oxZ+O2zGJc7EXb6okp/sYed1YM7yYjdJh4jHqz8vxx9Q3zDOS9UURTvHaJ2W2be9Pg
         U2SvipMMB9g5STKEK7rkkaRWP0+jhIpsRmZ2ONbAHbhXGWryaE2bSUA/EhKPELaV3p95
         aqFddopREfQWfhyNjBqOnrt/rLYqiDw4TPWH51JH4w4nXmeGaQVYMKsdZiQnFsXR7hvW
         Q8pA==
X-Forwarded-Encrypted: i=1; AJvYcCW6TpXQxekYJvbsYe8EHN4vzZ+R1R6a4AENxFFPy4tBtuQfAiHHsWsQsK04YN4HEfYW898LBFKPgInnxMo9Kt6c@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp2ptesmLgIGQ4VMzH6cP0lvSBPnC/uWCtcqms8C8vQjMQWYrS
	ynI8A18eY5nb/tCq/ehydsKsVelM2+7JBjxTUvodBMgTP9MTnYXRD1MFpYVIieoUsjjrHGjVA50
	WRAG/PvLElOwGS38WaEnM9n5DTfT51ogW9WB5BVUbog==
X-Gm-Gg: ASbGncsr16dYyvHDM+whqqTD6Y8uGfUfBGvdz6uAAukgyqtYBqAJrGAWcshzHwYO8YN
	b8KlpE503sfCSWW96TY+YwJEk3FSow8PFcQljZ33da7c0eyLQ7KTT9y2BOUfjS/nBQkZSCmmZEl
	TwzUoIIgjO33126cXIrEcOFZ7vxhIfoshGsNKebEBCBI9keAXg6DeUjWuC077tWYrrQqmE9/Mu2
	Xv4
X-Google-Smtp-Source: AGHT+IGtaQJcYYKVhLp/50lPmuB48IV2mPVXAbLY+hiIPV/anQZIZHdY1a23C23NRxSz7f54xc9tE/nROguaPMm8/Tw=
X-Received: by 2002:a17:902:ec91:b0:235:7c6:ebbf with SMTP id
 d9443c01a7336-23824047541mr35763975ad.35.1750826014327; Tue, 24 Jun 2025
 21:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250623130611.896514667@linuxfoundation.org> <CA+G9fYvpJjhNDS1Knh0YLeZSXawx-F4LPM-0fMrPiVkyE=yjFw@mail.gmail.com>
 <2025062425-waggle-jaybird-ef83@gregkh>
In-Reply-To: <2025062425-waggle-jaybird-ef83@gregkh>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 25 Jun 2025 10:03:22 +0530
X-Gm-Features: Ac12FXyd0V9F7KS0Td9Q-UYWV_cQw3EQwUvR1Vc5-PgNTQkt74Bhnhzxgl5WlkY
Message-ID: <CA+G9fYvNTO2kObFG9RcOOAkGrRa7rgTw+5P3gmbfzuodVj6owQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250624_213335_830988_CD129B43 
X-CRM114-Status: GOOD (  28.03  )
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

On Tue, 24 Jun 2025 at 15:55, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jun 24, 2025 at 12:46:15AM +0530, Naresh Kamboju wrote:
> > On Mon, 23 Jun 2025 at 18:40, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > This is the start of the stable review cycle for the 5.4.295 release.
> > > There are 222 patches in this series, all will be posted as a response
> > > to this one.  If anyone has any issues with these being applied, please
> > > let me know.
> > >
> > > Responses should be made by Wed, 25 Jun 2025 13:05:50 +0000.
> > > Anything received after that time might be too late.
> > >
> > > The whole patch series can be found in one patch at:
> > >         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.295-rc1.gz
> > > or in the git tree and branch at:
> > >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> > > and the diffstat can be found below.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Regressions on arm defconfig builds with gcc-12 and clang failed on
> > the Linux stable-rc 5.4.295-rc1.
> >
> > Regressions found on arm
> > * arm, build
> >   - clang-20-axm55xx_defconfig
> >   - clang-20-defconfig
> >   - clang-20-lkftconfig
> >   - clang-20-lkftconfig-no-kselftest-frag
> >   - clang-nightly-axm55xx_defconfig
> >   - clang-nightly-defconfig
> >   - clang-nightly-lkftconfig
> >   - gcc-12-axm55xx_defconfig
> >   - gcc-12-defconfig
> >   - gcc-12-lkftconfig
> >   - gcc-12-lkftconfig-debug
> >   - gcc-12-lkftconfig-kasan
> >   - gcc-12-lkftconfig-kunit
> >   - gcc-12-lkftconfig-libgpiod
> >   - gcc-12-lkftconfig-no-kselftest-frag
> >   - gcc-12-lkftconfig-perf
> >   - gcc-12-lkftconfig-rcutorture
> >   - gcc-8-axm55xx_defconfig
> >   - gcc-8-defconfig
> >
> > Regression Analysis:
> >  - New regression? Yes
> >  - Reproducibility? Yes
> >
> > Build regression: stable-rc 5.4.295-rc1 arm kvm init.S Error selected
> > processor does not support `eret' in ARM mode
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> >
> > ## Build errors
> > arch/arm/kvm/init.S: Assembler messages:
> > arch/arm/kvm/init.S:109: Error: selected processor does not support
> > `eret' in ARM mode
> > arch/arm/kvm/init.S:116: Error: Banked registers are not available
> > with this architecture. -- `msr ELR_hyp,r1'
> > arch/arm/kvm/init.S:145: Error: selected processor does not support
> > `eret' in ARM mode
> > arch/arm/kvm/init.S:149: Error: selected processor does not support
> > `eret' in ARM mode
> > make[2]: *** [scripts/Makefile.build:345: arch/arm/kvm/init.o] Error 1
> >
> > and
> > /tmp/cc0RDxs9.s: Assembler messages:
> > /tmp/cc0RDxs9.s:45: Error: selected processor does not support `smc
> > #0' in ARM mode
> > /tmp/cc0RDxs9.s:94: Error: selected processor does not support `smc
> > #0' in ARM mode
> > /tmp/cc0RDxs9.s:160: Error: selected processor does not support `smc
> > #0' in ARM mode
> > /tmp/cc0RDxs9.s:296: Error: selected processor does not support `smc
> > #0' in ARM mode
> > make[3]: *** [/builds/linux/scripts/Makefile.build:262:
> > drivers/firmware/qcom_scm-32.o] Error 1
>
> That's odd, both clang and gcc don't like this?  Any chance you can do
> 'git bisect' to track down the offending commit?

The git bisection pointing to,

  kbuild: Update assembler calls to use proper flags and language target
  commit d5c8d6e0fa61401a729e9eb6a9c7077b2d3aebb0 upstream.

- Naresh

>
> thanks,
>
> greg k-h

