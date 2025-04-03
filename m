Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6600EC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 18:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09ptcXZfcBhfJGnGO0uRHBsRknDiljVX3LNPLnOx7vU=; b=ukfPHE0lrTr44waWWZC9r3UpGi
	BIBPa9hgUG+JRDirVqEyx0n/EbX6MCurIYj7Axk02bChCAJWa0M2H6ZY9NcuBPNCdqoygG74DsmiQ
	GwGnHjQ3NExZRmaHklMVDym7ZaVnLuQ9/ZLROrg/XA4cd7zhv4LZ3Vky2bm/ilrs2Jgwmx52Q6UTI
	1dAOmhIff7WbTsH7Bj1q5iVOY/R2ZOLYV4dnr6Z/pLoRsEah1AmNBCYov8QFj2AdDOtUqcaEo9mpt
	HqEAToqP+0E4i4T40xtEVnRzJMumaxsOAEMcEc4tfYtZc6FSM2K4uhFwUGk+ppSQoHH4AnCpTuIJs
	guxh57MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PVg-00000009bRu-2R9n;
	Thu, 03 Apr 2025 18:41:52 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0PTN-00000009b4f-1TsI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 18:39:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-739be717eddso1007125b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Apr 2025 11:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743705569; x=1744310369; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=09ptcXZfcBhfJGnGO0uRHBsRknDiljVX3LNPLnOx7vU=;
        b=ZCH+EYfq6oTINvL7yeO2Y6eEeu028bco0Oe1RUH0CnU4A2vONO3LXy9QA+KJJ8EMPd
         kD8J9YwNjF6kNU6facGAXoKOMZkcPBEagYWUUmxV9HY9FjTC/s5N7pPGiQqZuLIllxQo
         +Fht8FID1ZpIvYSv4TadILNtCnWO1KVP4ZQZqblclxIFoYVkaqo5uhYaQNQYUbchvP0L
         MMpJjuLxpILLUJnVgJ6Cpy+kjhNLBc0EYMaewDBD08g8km+ja3viJknpf5FJUvkRakyg
         Hd1Mgqs8Oqn84f2PEqeZEI0BlTgI2u7CSgYzBQmuv4ax3Ge0oxAYHuX0KGn4yUD92Q0V
         eNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743705569; x=1744310369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09ptcXZfcBhfJGnGO0uRHBsRknDiljVX3LNPLnOx7vU=;
        b=pQFusgoWU0F8RlYA8JIwUOz5jtKYgmfIEDqMGoS5DjCjbvadjGF3AvoP6CXMXWAYqv
         byfoGBjYDDj0w+zHSUHckTOXq52DD4pRwHhI0vVKlIjHcK9aqT3OWNUttt7ElNrughBN
         Lu0jsXqSF6Z4cxHGSy8fd7wsuoctmyruiC36MlexL7e7/0CTsZVe+F7pIPH2mLCODaHe
         VYKYDunx0FDeEkSfEKAHB9jvwov6ou2StAAj+L1alvWp+ef+EySAQlPDdGJlrXNTlAAq
         KAUAavZ5yb58wTJiJlhVxmADYzkfnwjoeQk5KMPOKGYp3ynp5PXTwqym9jOpFPUIpeHp
         CczA==
X-Forwarded-Encrypted: i=1; AJvYcCWFepyMB17yz6JQoQPMNmaa991ID8nJvlUOZAiOMahul2TyHUE2Fnn4GYiH7gLUCEjXEEhWNQhJIgeiEXRJszVQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Y9zyG7IvNF5Ev4mEjUwWF5BDrkU+3ZoXxzt45tVfpg4IKnlK
	bqZIycSFTrZsS2BAqaZXN49D4YHTZKNJV6VUOzYEEgRyICc89FuFEHXC30bg+g==
X-Gm-Gg: ASbGncsIg+3MGG28UzGMEwdWNlG1T7UvREXRzwCMyfpl7jQe6uwHKbNb9wc0jj72J+/
	EQ8Y5Gchldj6pXqHQTF/5Kli8q2UsxLO1V/WIX+nD6fIrxC/jgVg6Jr0t9rKJBm5u25ovSAYRu0
	6wLK+oZt9AW65MC25ST77GBJ12rMcx+KZ4FY6FtOSzw5/C48HY+FCZcJDUnuBumW1WYjl8uwuE3
	BMCb+EbzcmoO1Aa6ReutUgPt2uxg1U6rx4ei7mlshB7g/dZAIjxsUbDV2Z1x0uC5+Mzn0mGFj6I
	cdnAVdAdJ2046djPlTcxNV02g+sAGC2iEwtM4TM22MCgMLdJwAUiDq7sK+yAbe6IR4tUP+IeZ6Q
	MFLKGGvAkKWArwGxpoejH6VaFQQ==
X-Google-Smtp-Source: AGHT+IHKo1uB12F2qz0Bx8hQv5MdUl4S9SkNNYXXluY/VdcwwTA2jfjTiNcrEuMi7fkWuEP6PC+AGA==
X-Received: by 2002:a05:6a21:338e:b0:1ee:e655:97ea with SMTP id adf61e73a8af0-2010474336emr652313637.41.1743705568300;
        Thu, 03 Apr 2025 11:39:28 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc3fd70csm1548787a12.56.2025.04.03.11.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:39:27 -0700 (PDT)
Date: Thu, 3 Apr 2025 11:39:23 -0700
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
Message-ID: <Z-7V27GKU85vba0B@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <CGME20250331230151epcas2p486a7c6d7153737f4168cfef74249742f@epcas2p4.samsung.com>
 <20250331230034.806124-5-willmcvicker@google.com>
 <Z+y4zxfifkQqLxKF@perf>
 <Z-2zQ-PcvxFTBc6M@google.com>
 <Z+4Hve9pQoLeh9sZ@perf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z+4Hve9pQoLeh9sZ@perf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_113929_392514_3996E4BC 
X-CRM114-Status: GOOD (  33.96  )
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

On 04/03/2025, Youngmin Nam wrote:
> On Wed, Apr 02, 2025 at 02:59:31PM -0700, William McVicker wrote:
> > Hi Youngmin,
> > 
> > On 04/02/2025, Youngmin Nam wrote:
> > > On Mon, Mar 31, 2025 at 04:00:26PM -0700, Will McVicker wrote:
> > > > From: Will Deacon <willdeacon@google.com>
> > > > 
> > > > In preparation for switching to the architected timer as the primary
> > > > clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> > > > property to indicate that an alternative clockevents device must be
> > > > used for waking up from the "c2" idle state.
> > > > 
> > > > Signed-off-by: Will Deacon <willdeacon@google.com>
> > > > [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> > > > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > > > ---
> > > >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > > index 3de3a758f113..fd0badf24e6f 100644
> > > > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > > > @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
> > > >  				idle-state-name = "c2";
> > > >  				compatible = "arm,idle-state";
> > > >  				arm,psci-suspend-param = <0x0010000>;
> > > > +				local-timer-stop;
> > > >  				entry-latency-us = <70>;
> > > >  				exit-latency-us = <160>;
> > > >  				min-residency-us = <2000>;
> > > > @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
> > > >  				idle-state-name = "c2";
> > > >  				compatible = "arm,idle-state";
> > > >  				arm,psci-suspend-param = <0x0010000>;
> > > > +				local-timer-stop;
> > > >  				entry-latency-us = <150>;
> > > >  				exit-latency-us = <190>;
> > > >  				min-residency-us = <2500>;
> > > > @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
> > > >  				idle-state-name = "c2";
> > > >  				compatible = "arm,idle-state";
> > > >  				arm,psci-suspend-param = <0x0010000>;
> > > > +				local-timer-stop;
> > > >  				entry-latency-us = <235>;
> > > >  				exit-latency-us = <220>;
> > > >  				min-residency-us = <3500>;
> > > > -- 
> > > > 2.49.0.472.ge94155a9ec-goog
> > > > 
> > > Hi Will.
> > > 
> > > Are you using this property in production?
> > > If so, have you noticed any performance improvements?
> > 
> > On Pixel 6, I have only recently switched to using the arch_timer as the
> > default clocksource. I haven't noticed any major perf improvements to the main
> > benchmarks, but also haven't seen any regressions. Based on the ChromeOS perf
> > analysis in [1,2], there was a significant perf difference found.
> > 
> > [1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
> > [2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/
> > 
> > If it helps, I found that Pixel 8 and 9 devices (didn't check Pixel 7)
> > are already using the arch_timer with this 'local-timer-stop' as the default
> > clocksource in the production kernel.
> > 
> > Thanks,
> > Will
> > 
> > [...]
> > 
> 
> Hi Will,
> 
> Thanks for sharing the status of Pixel devices.
> 
> I agree that using the arch_timer as a clock source device brings significant benefits.
> The links you shared are definitely related to that.
> 
> However, I would also like to know whether arch_timer is used as a clock event device in Pixel production.

For Pixel 8 and 9, the arch_timer is used as both the clocksource and
clockevent device which is what my series is proposing for Pixel 6 upstream.
The MCT device is solely being used as the alternative clockevents device for
waking up from the "c2" state. The reason for using the arch_timer as the
clockevents device is because we were seeing hrtimer stability issues where
a 10ms interval timer would delay about 300ms-1s before starting the callback.
This resulted in several media-related latency issues.

Thanks,
Will

[...]

