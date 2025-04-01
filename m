Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570E7C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rzQkn+3Vspwxp8Ah2PANQpg8+55TnFG5qd193VBWCM=; b=cXOSe6g4vSC/8MIuut9zFNnZDn
	vUzZ7DNAcnHMK9J/xoFuExkrQKr2DhjuOIGG8i+d4+z8dJ6xzIUINMxnGTKJj0r7vHeSGVRVcBDdc
	7Ulkg6S9lHEeiq+ahJ9jv66ySfZQpwR3LGQmdCh5fi8LLDbGVBoVz90n0Clc1IwvvQLj6GipXxCIQ
	OOIZA5DBETR247qKP4zLkPEaRL3GNMplYAsIm5aOWY2QcVUilmoCtAejpk2hyXU+fJUJuWJa0RbNW
	MbxP9FwFNsjMGKU//XXYWEGs4jP5v3l/Pqruc75csIJueSA4Hyh6TvXWRGZc3vzjo6lC3ljYW4a2j
	W800S5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeqk-00000003wK4-0FV4;
	Tue, 01 Apr 2025 16:52:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzeov-00000003wAN-1ZJA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 16:50:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-226185948ffso112985475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 09:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743526236; x=1744131036; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2rzQkn+3Vspwxp8Ah2PANQpg8+55TnFG5qd193VBWCM=;
        b=RoixgblJF7cdCNED3rG7erSdkX8o9cWBqrjfNqkI5dUo2mLYU+1/23vvZYwRFoRMiC
         Xo1tPrh/rRDYJMb3jAXHiPAcRetI1G3REIIC1ovqz/L2DxIYL1b2ZnA88c11tLfOjIY5
         HmatEVotlSDatHNY8bBGcnyIVndXP24/SUnw3iPWyxXkVOoEVpgQBYiA/woioCyTblHF
         KolJhXDr2bWedc40nv7dqE1WlteQQqoZwUpsgUvG2a1kgmKfebuKvuZfDr1s9/wir/TK
         HDbEKB2omV32CGevRgK9PGrVSVkzKCgJRTIavaPYSdlxRSxJqw9MCnus3dRnVqTk8tIn
         DJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743526236; x=1744131036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2rzQkn+3Vspwxp8Ah2PANQpg8+55TnFG5qd193VBWCM=;
        b=skr2n40KKM0iMIadh+xeYhYtuNoOnHAPEMXmWXrC9qICm1V6FaqJ1C1u8JqLJNPlCD
         KX6pwTD9G3AUwExVhyzouZal79piFaX+QRZTdw8+0Yxk45hswENXygtby6ducixGT/g2
         0/Rji22UIHy20/XcION1o5n2klJhs0Z48ZUTxP+86jfY7U6Gt8os7L84a7xOHisAxL24
         quqD7TddpjZC4cYEzapl+E+hQompNqLEyRxVIJd94m4+VNIKVtN5Z/uUeQb5ljflQGtu
         S20hNo9MNOrf8PIXDzx5tqfNjlrPsmO0zu3VdBZPoTX8X1UDpkZmhOSwutKO+fm3m7EH
         Goxw==
X-Forwarded-Encrypted: i=1; AJvYcCUo3Kf1Jz9qhbBdsJlgC4LYj3kt7wqS8R/UGDYWMJf6PwySq0lEBhb7irXe3rBA+oPCWhzz0Jlst+E254HyUnzl@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn9vgQ8GnNayBzXq0OeggBR2pNXaZJJvNMlz7/TbXIR6jiGGPT
	4/ucX6XLz1hyUXOz2VdvRMPq1QXk1hekf43IXXq/AcQFUhqT3kyy8hudhNbBiA==
X-Gm-Gg: ASbGncvnyF1dwYzqB4YLyM6xcWVf49soY2ci8kk+cg4HdzgS50vkO7RU4gXmiL8SHn4
	RLSo8Jg6BPgPrRLAiNC96by6KE98ebN7SR1IUC3B94eVhZpo3km/1POoz4x4KVjGtuk7UQ8RoVB
	yalUv9x2KD3OBqPssDO0AU1aFbWIis1Mr4wVEK356uwcuAruf8L/JGPtiStbtMK6vZWANY182o3
	tA46nC6acGDFBRC9xK8e9dcD8IK1C4bX0XjYryshJVl0OV4OpWuypxteUWDpQMIuQWMcM6gI03S
	O7hffM7XO58VYuRgijy1sfFCLkUH4rFFOQdPYjhDhZuxEZg1IWHzl6BrOF11GwFtQmKbrMF4ukK
	BIzctbjcrg2WB1R8=
X-Google-Smtp-Source: AGHT+IHM3XGbPCmTj9kap2GPt7VppdYLhbKxPnzq9elvCQi+To2CYT1dVqErhbVf2M9uMVGsgotWZg==
X-Received: by 2002:a17:903:178b:b0:223:47d9:1964 with SMTP id d9443c01a7336-2292f9e6322mr233271015ad.34.1743526236330;
        Tue, 01 Apr 2025 09:50:36 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106ad9bsm9161077b3a.117.2025.04.01.09.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 09:50:35 -0700 (PDT)
Date: Tue, 1 Apr 2025 09:50:31 -0700
From: William McVicker <willmcvicker@google.com>
To: John Stultz <jstultz@google.com>
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
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Donghoon Yu <hoony.yu@samsung.com>,
	Youngmin Nam <youngmin.nam@samsung.com>
Subject: Re: [PATCH v1 2/6] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
Message-ID: <Z-wZV3RCXKPzpZGl@google.com>
References: <20250331230034.806124-1-willmcvicker@google.com>
 <20250331230034.806124-3-willmcvicker@google.com>
 <CANDhNCrxTTkeq3ewos=07jD67s3t6rXOv=u=_qV6d+JEVoXeUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCrxTTkeq3ewos=07jD67s3t6rXOv=u=_qV6d+JEVoXeUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_095037_418369_52DC08B6 
X-CRM114-Status: GOOD (  36.52  )
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

On 03/31/2025, John Stultz wrote:
> On Mon, Mar 31, 2025 at 4:00 PM 'Will McVicker' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > When using the Exynos MCT as a sched_clock, accessing the timer value
> > via the MCT register is extremely slow. To improve performance on Arm64
> > SoCs, use the Arm architected timer instead for timekeeping.
> 
> This probably needs some further expansion to explain why we don't
> want to use it for sched_clock but continue to register the MCT as a
> clocksource (ie: why not disable MCT entirely?).

Using the MCT as a sched_clock was originally added for Exynos4 SoCs to improve
the gettimeofday() syscalls on ChromeOS. For ARM32 this is the best they can do
without the Arm architected timer. ChromeOS perf data can be found in [1,2]

[1] https://lore.kernel.org/linux-samsung-soc/CAJFHJrrgWGc4XGQB0ysLufAg3Wouz-aYXu97Sy2Kp=HzK+akVQ@mail.gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/CAASgrz2Nr69tpfC8ka9gbs2OvjLEGsvgAj4vBCFxhsamuFum7w@mail.gmail.com/

I think it's valid to still register the MCT as a clocksource to make it
available in case someone decides they want to use it, but by default it
doesn't make sense to use it as the default clocksource on Exynos-based ARM64
systems with arch_timer support. However, we can't disable the Exynos MCT
entirely on ARM64 because we need it as the wakeup source for the arch_timer to
support waking up from the "c2" idle state, which is discussed in [3].

[3] https://lore.kernel.org/linux-arm-kernel/20210608154341.10794-1-will@kernel.org/

> 
> > Note, ARM32 SoCs don't have an architectured timer and therefore
> > will continue to use the MCT timer. Detailed discussion on this topic
> > can be found at [1].
> >
> > [1] https://lore.kernel.org/all/1400188079-21832-1-git-send-email-chirantan@chromium.org/
> 
> That's a pretty deep thread (more so with the duplicate messages, as
> you used the "all" instead of a specific list). It might be good to
> have a bit more of a summary here in the commit message, so folks
> don't have to dig too deeply themselves.

Ah, sorry about the bad link. The above points should be a good summary of that
conversation with regards to this patch.

> 
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > ---
> >  drivers/clocksource/exynos_mct.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
> > index da09f467a6bb..05c50f2f7a7e 100644
> > --- a/drivers/clocksource/exynos_mct.c
> > +++ b/drivers/clocksource/exynos_mct.c
> > @@ -219,12 +219,12 @@ static struct clocksource mct_frc = {
> >         .resume         = exynos4_frc_resume,
> >  };
> >
> > +#if defined(CONFIG_ARM)
> 
> I'd probably suggest adding a comment here explaining why this is kept
> on ARM and not on AARCH64 as well.

Sure, I can add my comments above here in v2.

> 
> >  static u64 notrace exynos4_read_sched_clock(void)
> >  {
> >         return exynos4_read_count_32();
> >  }
> >
> > -#if defined(CONFIG_ARM)
> >  static struct delay_timer exynos4_delay_timer;
> >
> >  static cycles_t exynos4_read_current_timer(void)
> > @@ -250,12 +250,13 @@ static int __init exynos4_clocksource_init(bool frc_shared)
> >         exynos4_delay_timer.read_current_timer = &exynos4_read_current_timer;
> >         exynos4_delay_timer.freq = clk_rate;
> >         register_current_timer_delay(&exynos4_delay_timer);
> > +
> > +       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
> >  #endif
> >
> >         if (clocksource_register_hz(&mct_frc, clk_rate))
> >                 panic("%s: can't register clocksource\n", mct_frc.name);
> >
> > -       sched_clock_register(exynos4_read_sched_clock, 32, clk_rate);
> >
> >         return 0;
> 
> Otherwise, this looks ok to me.
> 
> thanks
> -john

Thanks for taking the time to review!

Regards,
Will

