Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 881EBC36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 22:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WqllMbVSzlYmSg4e9MsN3Hg5U+KXq66OHOKXxPOPhW8=; b=Quef/iwVok46qHZwD/v0jdOHxm
	SK0fPQlbUyPHQywh4rLv6TTpnbLkwAX+NN/Mdv0Hp2HiBVk9oPzKmsuAQr3u+sxaSX2Wi46x19OIL
	pqmkWh7ppx9Rx30+81HOnMLM9a3ecWHXHa4pBje2W5IsqfJ8wDwHh7muQQmm2d0gmpuzncwzP148E
	tL5Cyn5m3fPN8cSBxA+89g1uvXn0UbIfmidSiQQg776mtx0eTrF1D01iIXJvo37TiZ8E3QMQCn1RO
	hyKnskd7qjEqaR3lOuItaIMbhJWkR5+WV34ZeNv67SjGaCHn0xIAclimMDdVnWIK4wdbZlQdl8J8V
	WSjw3h5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u069J-00000007IZJ-062s;
	Wed, 02 Apr 2025 22:01:29 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u067W-00000007I7F-08Xn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 21:59:39 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2254e0b4b79so3332595ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743631176; x=1744235976; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WqllMbVSzlYmSg4e9MsN3Hg5U+KXq66OHOKXxPOPhW8=;
        b=Zv+2aDfkclqLT7aavrU+tA5WUn5fw9bvoh98mDvMVOCiuOFJsOAcv6a2EyAMvoxTn4
         tCmfkIlrlpwFWTkA4aFCZHAW/NSS1A6WYjUN0mB2FAscWBX64qSsoCgNmvMGBkcDo5Jl
         Aq3tvNtju/kdl1K6tFCFqwemoAdbbadQ47tk9vs2lwxfWkyvdtkZr4B4nf/3An/O56wx
         QgsiJslo1A9SUARw1nkfe/8+60E9pmDhfXLrtXwK5oXZbRR+/imYPT5+nwnmwlzYn8d1
         ZvDHDLxXroARklADRbATlQ5hrbxn9LNrZJKCb6KBaBimQCpu+glXQgUo4lXKxnV6khC8
         gUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743631176; x=1744235976;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqllMbVSzlYmSg4e9MsN3Hg5U+KXq66OHOKXxPOPhW8=;
        b=HjFXIr17YmXY6GWcruWGzN7APbFA+MymHGFup3lmTuHzAtCKIWHWBaknhuBaTqK5vt
         9mBLpsjTSrB0FFnJXJXqFElRZRwUrbv4Vn0STi9dGUWTdg9C4/A+lR9IUNhXw80tinFA
         cuh05yv9CDi2laxt4meoXdz+wG+lebDjHN0pAsUVsOyRFb7pp+7kHGhJ/H/Ph9uQxOZY
         B2/CQK4FDmBe1GLHJ/AldocHOTAPRFtHmuXAVfQHNsnIQ9h++klSConq5kpUIY+LtKs2
         xOPN4B2+DJ6YZCNmVtfhHAMcyd1yy4nN8oQuHlbzcIa4sUXk3jnkEG4Pw2Iww6wY5aAK
         btFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVKnh+QnROvm/hW1UyEFH1GPC1qU1RdZsPV/CJTdjk4JWwKbF6HkaYZcWebrK6J3QCb7rKd1O7KewwDNWIQwrS@lists.infradead.org
X-Gm-Message-State: AOJu0Yycpo29tYDDHL7TOZPzcghpaa3iBl2fLTvcT/+vedTNoeS2uroU
	NM87J7VbbiE4hvCvmWe2pQ0cymK1u9KhQW+z0PSbxjR/nUcog8UFhD/Vz8WzEA==
X-Gm-Gg: ASbGncvnOTKOlPJ2gAKZxGr4QXIYZtuZrfZ4S/UdY9lAP7Lr18MSMFLDqYhmHX1cS/D
	3ZplP/YCjd9NDuxUggjzQWhXrS/tVZ4YR7oShXcLCXzSl9Dj549UlIXGJBUmAgKpYCsCYb/Xkca
	mHZLIKmbMJ/bu8Ap89IbAH9pqqIsjUpUZsFsmdfnESsfZv0obZkfEtmrBcvg23OiVUMMfGI0nGA
	JhhzWBQaklS70U+qiCCEhHAK9I1+7FmyHsMgWebIk4UhUDrI+fCRbKulbp1YbDg0ABz0JmJDbLW
	rGm8hTAlXM8XDWsjFaVMxhgw2PTH3CkuDPF6XruVMZMj5c+Y+bxJgfpOwtd5oo04HNfUpSBTUXn
	joVQcjzVpxN7/i30=
X-Google-Smtp-Source: AGHT+IHteXxFO7jbKx3k3Jy9PnUQzjVaQtKgEm+NOfEcxdPjDfCVTFwPG/5wPWOnq7Eh2M3nBNvUdw==
X-Received: by 2002:a17:902:ea03:b0:223:536d:f67b with SMTP id d9443c01a7336-2292f9f607fmr329229995ad.38.1743631176289;
        Wed, 02 Apr 2025 14:59:36 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c2791sm636175ad.80.2025.04.02.14.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 14:59:35 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:59:31 -0700
From: William McVicker <willmcvicker@google.com>
To: Youngmin Nam <youngmin.nam@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Will Deacon <willdeacon@google.com>
Subject: Re: [PATCH v1 4/6] arm64: dts: exynos: gs101: Add 'local-timer-stop'
 to cpuidle nodes
Message-ID: <Z-2zQ-PcvxFTBc6M@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <CGME20250331230151epcas2p486a7c6d7153737f4168cfef74249742f@epcas2p4.samsung.com>
 <20250331230034.806124-5-willmcvicker@google.com>
 <Z+y4zxfifkQqLxKF@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+y4zxfifkQqLxKF@perf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_145938_075076_A892AB71 
X-CRM114-Status: GOOD (  24.01  )
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

Hi Youngmin,

On 04/02/2025, Youngmin Nam wrote:
> On Mon, Mar 31, 2025 at 04:00:26PM -0700, Will McVicker wrote:
> > From: Will Deacon <willdeacon@google.com>
> > 
> > In preparation for switching to the architected timer as the primary
> > clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> > property to indicate that an alternative clockevents device must be
> > used for waking up from the "c2" idle state.
> > 
> > Signed-off-by: Will Deacon <willdeacon@google.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > index 3de3a758f113..fd0badf24e6f 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
> >  				idle-state-name = "c2";
> >  				compatible = "arm,idle-state";
> >  				arm,psci-suspend-param = <0x0010000>;
> > +				local-timer-stop;
> >  				entry-latency-us = <70>;
> >  				exit-latency-us = <160>;
> >  				min-residency-us = <2000>;
> > @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
> >  				idle-state-name = "c2";
> >  				compatible = "arm,idle-state";
> >  				arm,psci-suspend-param = <0x0010000>;
> > +				local-timer-stop;
> >  				entry-latency-us = <150>;
> >  				exit-latency-us = <190>;
> >  				min-residency-us = <2500>;
> > @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
> >  				idle-state-name = "c2";
> >  				compatible = "arm,idle-state";
> >  				arm,psci-suspend-param = <0x0010000>;
> > +				local-timer-stop;
> >  				entry-latency-us = <235>;
> >  				exit-latency-us = <220>;
> >  				min-residency-us = <3500>;
> > -- 
> > 2.49.0.472.ge94155a9ec-goog
> > 
> Hi Will.
> 
> Are you using this property in production?
> If so, have you noticed any performance improvements?

On Pixel 6, I have only recently switched to using the arch_timer as the
default clocksource. I haven't noticed any major perf improvements to the main
benchmarks, but also haven't seen any regressions. Based on the ChromeOS perf
analysis in [1,2], there was a significant perf difference found.

[1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/

If it helps, I found that Pixel 8 and 9 devices (didn't check Pixel 7)
are already using the arch_timer with this 'local-timer-stop' as the default
clocksource in the production kernel.

Thanks,
Will

[...]

