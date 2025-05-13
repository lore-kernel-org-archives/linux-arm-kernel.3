Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE45C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NprQZFd0msRuigKqMDzXfWDuMemIh6oSVb1Z2bS8NyY=; b=n8E1se6lN70eKXBy9moezxYBYb
	EaBVSAPaMKzsqFzPOPkQGfzaXmQ/8ZkFrYYEPBZgBlKkOphbvnXXinYu3I3wm89mbC96o+/aiYqwG
	K2TsDbxa+nV1zxexKboBNZ4O7KtzloCMMlOxehCCvpOOzXbCeouTRtXrLAGFvm4COdNPCeGzeeL+w
	NspMQIPMfEwWmNp/fSd1+2nOHzIqk5k6tjAjHDyOpUDzCB5DIxok7Y25zmMkXI2lJZJVPiT8evEiD
	67+04IYckVWB8IY0V4ykU07IzMxly+/J/xUVgwEM5c4zusCJQz2swjVPlyqGXj9JxGshOPFAblwKX
	jRDPOy7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr1y-0000000CgAb-2Eg2;
	Tue, 13 May 2025 14:54:54 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqzo-0000000Cfeq-30Ns
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 14:52:43 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a0b9c371d8so4795160f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747147959; x=1747752759; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NprQZFd0msRuigKqMDzXfWDuMemIh6oSVb1Z2bS8NyY=;
        b=XDmXnidCUAKgmMI3NcELMEFDProy6GfRJaWPqMKpSHUzF7X5wu3tRuOLLZLq4GiKg9
         0CdT1nhfAnkq7Iyzq7k5+WS0VEv0N2y4gmJfxu0nUSbthIPXTNa7eFcC7cJqnL2TXF9S
         ppeHiUDqXf8taYwzOLFViFMoyQwzwcAPJhw1d0VZe7awOd21NTHezxOHasi/yR6X+Awx
         fHCaDJsgPeHCbmkHGh43HVryrWNQwTVbGOletRoht9/wfSpTbpPSvrmy/gt1OD/zMzS0
         tzH1ET4/tsCPfYpBUqyEcdjv9hVVmhSX+0IUp/Izw7l7cKg8ze5pxJuLGT00Vsb3UFUH
         xGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747147959; x=1747752759;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NprQZFd0msRuigKqMDzXfWDuMemIh6oSVb1Z2bS8NyY=;
        b=pbStU4CTh/YNgaIAwlY+qYVXBRxmXlru8RCqBR5qU734HfSz4roLxATetV+s4SuRsK
         Wsobwrb9o9Mf6bms9UkVZlJGvZ2zO9/QQ5NA3+eFRf4WezFzQ9rIfGp42CzA1fICpZ4m
         1v80kOY0JLacFf+A+SAt0wBZtuB+BzL0YlnX4HcuzpJV/azdQnJRRL75BHDmIFr3odS7
         ynzk4ZW7hyc5/6EVRXZdHfgFP2ps+c/tJJS1acV2BXM1ceT63BgXuWyx8uKh20Ku3zgb
         1NtB4fN1l4zPIxoU/IkuN7U5JnrC29qxf5bQxQ2cv3AE9roTXXfMKuCPwHZsRXbq3tf5
         OjpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbIpFxfJKz9Tjvv+MuiVgXyJO2Anc6Gpy1QZ16u6Fvf6Rk8DiyJxnhKggrcU5zh3n208l9L0sR5900zPsVhFFr@lists.infradead.org
X-Gm-Message-State: AOJu0YxvibKeqDtwbGsjzQHi9YHc1BU91TjHKeXXKlDibRHAVb/vDFR0
	0H3nI5W0RSY+39TZTZqUYDjqzwZJYbHcIlSi3sUPUzRhL61GutypgKUc/hUxB1M=
X-Gm-Gg: ASbGncsCKHmjUdm7WCvNYD+7JPbsScAqMmSspQE3J3GVMbn8+9XUgxekKBBYVHZ9AMX
	ijoK71DgO24cxfwYc2qfXT/Vm2IAmIq7vZWkMAOiN+jGvnvUveF3ZrY3wqrHI5Ror1/vgQA34kt
	ioea8LBQj35hUouc2b3q7NV0iGU5Y+ycSYxW8HmjRtqGlQS2BpXMYvCrFW1Ssjwtw5Co1e1VRJO
	rs2auGinnZPguea8NoDcDE3qpVh0cftgmrYjj8kqnbb4r603sLzvfzKG+ULG8qwG2EK7hO8EnOT
	Gpebv6ZoEDs1h+Sf26Oc300wbagmg3PkQ6Df/r5xD9jsfTGC/kd7r91toJwgFR6FLMe1VFA3h0F
	OXJ7ZMPwmjIyg4g==
X-Google-Smtp-Source: AGHT+IGYDcAG8pLfPmYFTyeqzeIaOvsHfnmcsUp0uHL3fXQ+4Wvxm5ZCV+BGXbRBT2JBatXikF9ENg==
X-Received: by 2002:a5d:6a11:0:b0:3a1:faf3:b608 with SMTP id ffacd0b85a97d-3a1faf3b6c6mr10089134f8f.56.1747147959102;
        Tue, 13 May 2025 07:52:39 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ce36sm16710394f8f.71.2025.05.13.07.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:52:38 -0700 (PDT)
Date: Tue, 13 May 2025 16:52:36 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: John Stultz <jstultz@google.com>
Cc: Will McVicker <willmcvicker@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <aCNctHq6K7uqFF05@mai.linaro.org>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCodHATboF2=U2tTwdEkEJ+PsfB2F=fbBrs=J1UzZTEX8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_075240_763409_203E0EBD 
X-CRM114-Status: GOOD (  27.54  )
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

On Tue, Apr 15, 2025 at 05:48:41PM -0700, John Stultz wrote:
> On Tue, Apr 15, 2025 at 9:50 AM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
> > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > From: Donghoon Yu <hoony.yu@samsung.com>
> > >
> > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > source for the arch_timer.
> >
> > From a previous thread where there is no answer:
> >
> > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> >
> > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > a module for the reasons explained in the aforementionned thread.
> 
> I wasn't CC'ed on that, but to address a few of your points:
> 
> > I have some concerns about this kind of changes:
> >
> >   * the core code may not be prepared for that, so loading / unloading
> > the modules with active timers may result into some issues
> 
> That's a fair concern, but permanent modules (which are loaded but not
> unloaded) shouldn't suffer this issue. I recognize having modules be
> fully unloadable is generally cleaner and preferred, but I also see
> the benefit of allowing permanent modules to be one-way loaded so a
> generic/distro kernel shared between lots of different platforms
> doesn't need to be bloated with drivers that aren't used everywhere.
> Obviously any single driver doesn't make a huge difference, but all
> the small drivers together does add up.

Perhaps using module_platform_driver_probe() should do the trick with
some scripts updated for my git hooks to check
module_platform_driver() is not used.

[ ... ]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

