Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916DDC369A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 21:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjAX2sNBU3681HCQX4kVcY41KRirctMYti/FTqvGf3w=; b=LIo03IMfLZxy8U6wmJYCsWAKe9
	aUbY1y23LoX1sYyBUORZuCO9jY2IozT40FsT7PqGm4kh0bzEFZwHsAunVf0sKRqs9KnGtvmxnyj2r
	K8SXdnwi4z/lYNKCYxwAF5nq65uxSVdSSFUUXDP0TsTVw4FA+3dqpcjk399gIBqobJooncpY1M4en
	Wcy//iPnKp25OBmHaZ24Soks4dsFH8sVj2r4sX2DqV+gRk08AyMz5paRrn0zSCPNxEhy7i+Vraz8e
	tQlV3hUR3xfgiQ4WEcfhkSDT6E6vu7KXBRRHvWLktqM1dLVW7bPJ5oHLlFuhHcoz2uT+TJWFgNBAF
	c+yYHEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2GFV-00000005QBt-2eLX;
	Tue, 08 Apr 2025 21:12:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2F4E-00000005HWM-15Sw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 19:57:07 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-227cf12df27so380785ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 12:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744142224; x=1744747024; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jjAX2sNBU3681HCQX4kVcY41KRirctMYti/FTqvGf3w=;
        b=Aw2OSVECaytzhNlAkxpNULKNacoh6oOjmirgqNcISmJ876IM1JYLuyNNDiaoWOPQE4
         m4iGGC1psf5dodzV34RId007yfwhs1jc3oShwvDJMXE7rYU1w8dHUvo+od8tdMV9lwS4
         cSR+KvBRoUW8i0j3m+jcUdu6kLQB9fCgbZNheQaWwWA7v/SSb9GtVH2wh31HNQMrRzqX
         3y3ijky3gY8VaurCIOM+q2C7uaw99NzaDkJ46O9n2Hc+nUmbHA24wSApDTDdMx18lxWV
         J+7eJL/LyZB4B79+3DqhHYGCi2Q3LjSrDkIarO832Xgh8vR2or8mlGqqGXBq6WxrVz5g
         nJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744142224; x=1744747024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjAX2sNBU3681HCQX4kVcY41KRirctMYti/FTqvGf3w=;
        b=Cm9U1Yq/u3CysgR8etDGcgHbH06H20t4JaVaLUYWVjy5DHKOupZ9bp7HScV3uzp/24
         0j1YgESfNkhFXaG2esqICOcljk85APbideCypvR7urZFso4M7vKh5KLGzakcNrJaUaeF
         bfTOkQQ1GqFsKldC7dtYnuNpt8Q5ICcAVApLgRVQSJhfM5QGbECpXKvwYGp6+j0puOlv
         uvFBjDSl0i1cB+BVwmO4ZJGhIbvvrkB3ICO9tUPB1qkWHcow7MbNPh+AOPQ3kZfEquUx
         qvxklkJqp3ClGGk8QMOgH+NYHIYH46sPE7HLgpkRZbheXGGmJUpRL/1d4IfGHj/eesnz
         OWAw==
X-Forwarded-Encrypted: i=1; AJvYcCWHLwK8uedgQk+PEkKewPO9l38q91p56yU1o3H7L3q3NG2AAu5J+cvE6yU6A7SdIs0YWHG8JdQ8VwiD6bJ0g71P@lists.infradead.org
X-Gm-Message-State: AOJu0YxLYgIuFgnp0na5VNwhIxomFdqVFHq2mLM0PxDI+KuqLYjXbrzI
	rSaznTy/Hc460oKk4Bw+qdqrst95wqcK4C9wY7aSrcXDQVbGWzhXO+sIw8ukNg==
X-Gm-Gg: ASbGncvJAzuw7ho1i2tL2aXYZ0Mq7z1Y6uyZmsrcCdBndTIcTFP82J1/nc6eGdLViaL
	sMHVi4T447MTITyIGbRv/5eN+/NMk7QD19zB4iaWAxBUh21evEgp2Pw1r0spD8MpDKuDO3Vc/5N
	d+jhQsPK+qxgKTLsaqmPqX/B8tas0WqpPWZ9qnXWVt4DeV/uX3vANujC6fRlV3em4Nwy7RW0NSx
	wdOxu/G05eXgBob+/EXsqO8usfK7g+uPEgRSK2eoMitMBqHdTUCRlF+NHOOO9XnbpRG1hhYNEKK
	3QoKxeca+MtLqSLYVlpj0+6jo6b644OkI89CRQXL7Blj8ZK/Pra3M13lnJ3OkSSf7HcdJmWerx+
	quMvqJGCD8Ujhfig=
X-Google-Smtp-Source: AGHT+IG/aixR6L8wT+D56lcGE9b7SLefmOG0gGQfiOnOqHm+lRiKkcPryTAOxW4tpKPSv5Ftu+jjDw==
X-Received: by 2002:a17:902:ef02:b0:223:4d5e:7592 with SMTP id d9443c01a7336-22ab5eaa24emr63238645ad.21.1744142224358;
        Tue, 08 Apr 2025 12:57:04 -0700 (PDT)
Received: from google.com (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0b2f71sm11294568b3a.130.2025.04.08.12.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 12:57:03 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:57:00 -0700
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/7] clocksource/drivers/exynos_mct: Don't register as
 a sched_clock on arm64
Message-ID: <Z_V_jKD0CekA41po@google.com>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-3-willmcvicker@google.com>
 <CANDhNCpGxedaxjZ=6Trai3exbQGf7WRJUeTC1jqoHOhup2mNLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCpGxedaxjZ=6Trai3exbQGf7WRJUeTC1jqoHOhup2mNLg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_125706_297220_5B3D01DD 
X-CRM114-Status: GOOD (  22.77  )
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

On 04/02/2025, John Stultz wrote:
> On Wed, Apr 2, 2025 at 4:34 PM 'Will McVicker' via kernel-team
> <kernel-team@android.com> wrote:
> >
> > To use the MCT as a sched_clock, the timer value has to be accessed vi
> > an MCT register which is extremely slow. To improve performance on Arm64
> > SoCs, use the Arm architected timer as the default clocksource. Note, we
> 
> Nit:  sched_clock is sort of separate from the "default clocksource",
> and after this patch we still register MCT as a clocksource, so this
> doesn't sound quite right.
> 
> I'd probably reword this slightly to:
> "The MCT register is unfortunately very slow to access, but importantly
> does not halt in the c2 idle state.  So for ARM64, we can improve
> performance by not registering the MCT for sched_clock, allowing the
> system to use the faster ARM architected timer for sched_clock instead.
> 
> The MCT is still registered as a clocksource, and a clockevent in order
> to be a wakeup source for the arch_timer to exit the "c2" idle state.
> 
> Since ARM32 SoCs don't have an architected timer, the MCT must continue
> to be used for sched_clock. Detailed discussion on this topic can be
> found at [1]. "

Thanks John for the suggestion! I'll give more time for review feedback before
sending the v3 with this update.

Regards,
Will

> 
> > can't completely disable the MCT on Arm64 since it needs to be used as
> > the wakeup source for the arch_timer to exit the "c2" idle state.
> >
> > Since ARM SoCs don't have an architectured timer, the MCT will continue
> > to be the default clocksource. Detailed discussion on this topic can be
> > found at [1].
> >
> > [1] https://lore.kernel.org/linux-samsung-soc/1400188079-21832-1-git-send-email-chirantan@chromium.org/
> >
> > Signed-off-by: Donghoon Yu <hoony.yu@samsung.com>
> > Signed-off-by: Youngmin Nam <youngmin.nam@samsung.com>
> > [Original commit from https://android.googlesource.com/kernel/gs/+/630817f7080e92c5e0216095ff52f6eb8dd00727
> > Signed-off-by: Will McVicker <willmcvicker@google.com>
> > Reviewed-by: Youngmin Nam <youngmin.nam@samsung.com>
> 
> Otherwise, looks good.
> Acked-by: John Stultz <jstultz@google.com>
> 
> thanks
> -john

