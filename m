Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FBC5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPuCm+rqdGwG3G8jrDZZDGo/23fVRFHxYRG9lMWLEJA=; b=ijNdwlncld4mQ9eh3e6qXZG4qO
	kT6ulCxT+mHX6Wf7zd1x7+6fIiCCQfqZSzFlLjateuRTQxUjjSCnxOBRwAZE9hGOpuyWHA0cXsG0j
	oRWq+lWxI52JAn9swyzGVnR1OFXCwv9QDX8tnDZrSaOM4l1MC77dLQfY97CiqNJ0lXbYv6snjXhy9
	gCFjPDEgaxHCgdhK5l3URXKJh281fDo2TPLZgZjpWGG/UoSEQACbBRxL5HuYeoOcSBUwiKKr+K/8t
	ogWRqPzRayytCAY54oB+9E7I9/Q34nSwi34w0FxV28juFQ9CIl93wVyi06bs1N3uCkJ7GMkH5ebE+
	IwWEmMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qzN-00000007hMM-3mlD;
	Wed, 16 Apr 2025 00:50:53 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qxU-00000007hAs-3rDc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:48:59 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-54acc04516cso1507253e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744764534; x=1745369334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jPuCm+rqdGwG3G8jrDZZDGo/23fVRFHxYRG9lMWLEJA=;
        b=ADNzMRK6qFquiDexiBFhAKsYQmCmUKiHGnu6K/HJ57lJbz8rWvxNs2eXp6QeF8ne8x
         PeviEZpVvus3EtmBjVRqekZBsEF7nPHccIKDg+i0wud0ZOeF1yihzcLkKhc46nNcbuam
         nsHqbeGuKmsPjJnSc3nf7F7+Xlf/8Bfmn3BeJW54tW8wBj371tJjN0ydZA48UFuRRYUb
         mTQbsttY06kLjsc3NRMKifI6yNWg9QDm9pp6oKFW/VbEfpGQOWjH1hZfpti2eUtsgxax
         DHuBlSKMybI4YBO1vzKeP54zuU8yPsd4m5t+633fKXqPeN+L6FKP3LOlYRaB0ImvsIfQ
         Wflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744764534; x=1745369334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPuCm+rqdGwG3G8jrDZZDGo/23fVRFHxYRG9lMWLEJA=;
        b=UmHU6ndc/vVSXtlyGQWO+qYeQYSXI8yKbX25zIEjWQX4auelt4YJVb3nRrlPd6jE+q
         IonI7GMUCchsXcwqaXiH6qStvXoeisEIKdF0dR8YiSQCk39CRhF4n5RNxoOk1CY+Mods
         jBPVU8Rc4QyQ1a0nLrSNnnFMpKyCLZl5CeKlNVtJnT5TqfqmyNStDsTbaMtCmeLIiYQx
         Wd8+cfTC/cwctTGY7F38o2Iuj2CIJLacRbfyXCRt+/1l1JJnfJCX7+8gwqyYucBMxNF5
         QKxxQ98pvvr9PN9gVewz/GlE3wCEiDFfsXza5AeqmDB/GKQCr2J1uFeHNkULfpiXApzt
         i/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWmT6NnL0r9H64z+yaAG65JUarkq06MGfGAp3KcvtJ2CU86+CcHIVRsNTQITSKF952lDxOzftyKZ3yWIxUfhWkT@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmq8AQ29pn7ijalteKrecKFVD21pLknuacQr9+zvgn+Psu/Qam
	rnC95cqDtIkFFbj32OayhZXeuW26/hcoDuomxi0HUPkWEMxlhR1nZvc3bAObnnStR2rRdS2BrJZ
	5lNxUyuApBN2zeUqQEHYd3dh7RXevYOyBy5o=
X-Gm-Gg: ASbGncsN7PwinMIzRHWYkw1EjAPPo07W+a1sSoWFCS5s9zBYspsm2+K0BUNzIgrPCW0
	KTyQoaxxZ5APPwS9Kp1L+jF4qNZ/5/pS30EFXbWoAZ0Pfkd1WO4qVMM77h8K2JzQlDaJ9wpvv3/
	FhmNaVPMJaSIWR5X4FkQ1mSAnRJv21l0A/MfSF9cE5uesXbeA0X/Ed
X-Google-Smtp-Source: AGHT+IHevqlecv2dltxTa35zkiIafMdIo1CxrQCwSubeqYYZhYuVA/55pwvpTD7H4AMyPSPDjg8VZ0rmS3Zb3gvZUq0=
X-Received: by 2002:a05:6512:3b95:b0:549:8f15:db2f with SMTP id
 2adb3069b0e04-54d6051d882mr218881e87.31.1744764534024; Tue, 15 Apr 2025
 17:48:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com> <Z_6OZHYfC0bC5289@mai.linaro.org>
In-Reply-To: <Z_6OZHYfC0bC5289@mai.linaro.org>
From: John Stultz <jstultz@google.com>
Date: Tue, 15 Apr 2025 17:48:41 -0700
X-Gm-Features: ATxdqUEyC1e7tjK1ExejSG-_0fQdpJiMuKIAs5FGSCRFBKdclyuFULIgWiZplgs
Message-ID: <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Donghoon Yu <hoony.yu@samsung.com>, Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Youngmin Nam <youngmin.nam@samsung.com>, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_174856_957778_F7B92E3C 
X-CRM114-Status: GOOD (  31.83  )
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

On Tue, Apr 15, 2025 at 9:50=E2=80=AFAM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> >
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource an=
d
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
>
> From a previous thread where there is no answer:
>
> https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.o=
rg/
>
> I don't feel comfortable with changing the clocksource / clockevent drive=
rs to
> a module for the reasons explained in the aforementionned thread.

I wasn't CC'ed on that, but to address a few of your points:

> I have some concerns about this kind of changes:
>
>   * the core code may not be prepared for that, so loading / unloading
> the modules with active timers may result into some issues

That's a fair concern, but permanent modules (which are loaded but not
unloaded) shouldn't suffer this issue. I recognize having modules be
fully unloadable is generally cleaner and preferred, but I also see
the benefit of allowing permanent modules to be one-way loaded so a
generic/distro kernel shared between lots of different platforms
doesn't need to be bloated with drivers that aren't used everywhere.
Obviously any single driver doesn't make a huge difference, but all
the small drivers together does add up.

>  * it may end up with some interactions with cpuidle at boot time and
> the broadcast timer

Do you have more details as to your concerns here? I know there can be
cases of issues if the built in clockevent drivers are problematic and
the working ones don't load until later, you can have races where if
the system goes into idle before the module loads it could stall out
(there was a recent issue with an older iMac TSC halting in idle and
it not reliably getting disqualified before it got stuck in idle).  In
those cases I could imagine folks reasonably arguing for including the
working clock as a built in, but I'm not sure I'd say forcing
everything to be built in is the better approach.

> * the timekeeping may do jump in the past [if and] when switching the
> clocksource

? It shouldn't. We've had tests in kselftest that switch between
clocksources checking for inconsistencies for awhile, so if such a
jump occurred it would be considered a bug.

>  * the GKI approach is to have an update for the 'mainline' kernel and
> let the different SoC vendors deal with their drivers. I'm afraid this
> will prevent driver fixes to be carry on upstream because they will stay
> in the OoT kernels

I'm not sure I understand this point?  Could you expand on it a bit?
While I very much can understand concerns and potential downsides of
the GKI approach, I'm not sure how that applies to the submission
here, as the benefit would apply to classic distro kernels as much as
GKI.

I realize in the time since I started this reply, Will has already
covered much of the above! So apologies for being redundant.  That
said, there are some non-modularization changes in this series that
should be considered even if the modularization logic is a continued
sticking point.
-john

