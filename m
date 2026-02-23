Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F75EC1128
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 20:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5RZgQiN9LRRPBUwx9tg90lOISfa/rsQmb3YEFiGi18=; b=Zou0c1/BZlJTkzXsw2eajAGaSB
	dT/4/JUzgTZMicYq6mKw3UyOMC42/UCLo+p5vZIb3W52Nv4Ayd6i+V9ZyreGsMYEMxxqXyLs0aiNI
	cHrLd41/vaweWJZySLdrpTWZC0/Z/R4sVSDqodh7aFnvdeKtyDs1pWuRektCCEAtksbo8Sibf72eu
	4ePAyaH1Ws9DdH9lhtOHDznYCH/7BW16ZZarx/J6YE/KSR7ny+vRs03clrLz6L6Q+bFSRCTYdYwfJ
	iDbl5uLqf++biono7xKaj1AYQa+b0G+Wk0hiha70F6SXnYdti1wiX3Adf6C2LEhNPdbrLufWqxfRE
	bM//Dm4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucKK-00000000z3k-0W8u;
	Mon, 23 Feb 2026 20:14:44 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucKH-00000000z3L-2VMN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 20:14:42 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-65a380b554bso9327231a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 12:14:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771877679; cv=none;
        d=google.com; s=arc-20240605;
        b=PG13LrIJ3onH9I3v6562fWSPfawga3IqKG+qHP1vXqZbSMNVAekkqxOYCnNhR5V8IB
         +Wnosnsbk+u8/6x2YphDloewFzNP5rNpNVf6VWoRv+fmayn7SLIvbg3zXjSztGk97fm7
         28ip6v6+2TY26tTFUanpRk8/bPB5tEQYWyRwxffBPaea4D0Dd/nqXiBFBUwmgaQhrIl1
         bfGqCYxqOTkvRQkNp85oIZAqIvzDyy2uh8rB6Nbrw0uYd/PUR9qa/qKYqYkEE+uIIdAF
         4zujK2h4gqXiT9QstlS+Zd7T4oX51dwzcWLV1JJct48y9NkFrZNypX7zYPFbIcRz10Z+
         UYrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5RZgQiN9LRRPBUwx9tg90lOISfa/rsQmb3YEFiGi18=;
        fh=GZV8IfvTWykNpAyScKWI/Te2Ti+KQXP69F3yDv4eU5o=;
        b=NcaHu0KDL/DWDcrrOhJfcp/u2Oe4tA4xsY3MXt7WinTk7bpvbjG8UAxHnscHw9UPZg
         ISYuPmiU5+yJo1B3fr7pJrsLNsaou9vgtaglVKKjNAV0/G/SfFWDsxj90afrkPoR9ow8
         aRrCkmPVL8KVlSNSuTSyLRWWUumH7sHpqApbP+/26JvmhdsD8woXDS9vtJ/hLo7KST1w
         YOP0hq3s2ErZoy2mDK4C27PJbjzrFYq6ClC5L6phGczgFRTmTarRqRaeUiXAZxi1zPD6
         CDaTgtcPCGEG+HG3rv6iYCE1Bef370aAWZhDBCVxUY+4WQOHXhceBO4QZf9x1Q5UlXJR
         qZog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771877679; x=1772482479; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5RZgQiN9LRRPBUwx9tg90lOISfa/rsQmb3YEFiGi18=;
        b=m26R/iE4Jq44GLYbqgbYTIe8mXnuBf7sN8Qw2alr1hGKbxiWwOn8AYgcr99ygp87Rg
         6tadj/BDR2gP/Gn4Dka1FPCFYVQOyjFr5tVEzD1dQFkVu67SqsCteRk8WyLBLvv0SfNr
         V6djTGKgG5BFSf5QACgfdMZjjFQTlURLye0xGOGVyDwnyHCLxv/9KcTZEvdpIf4hgEdl
         pwshz5Q4QoiYJ8+oSek+/Kd7ikAv2wBzH5oUJ1D3dyBq3dcHVmEECm7SPMlftZ0cbVpM
         wVh6/0t+QxbhxVgiS5E7lGim5vxIXwrVuI0/MMufYsjL5qVVSZVpY6TnBllGzdMBBpgD
         Oh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771877679; x=1772482479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5RZgQiN9LRRPBUwx9tg90lOISfa/rsQmb3YEFiGi18=;
        b=wK7RZ2cCFWaP3741gQio7oFf51Mevny3WGuocTtqHGofLJuCaF2VVPzFGnave8JNqo
         DEZM8/GSSXhbbvNAJI+Hq2U1OFDy6922hi6XIO8UueJ4lsZNdgJjI8/lwVE2Pm+8Z3LY
         Q9KfKL4qSyDQf6ogDtc3nGvrDY4irYIVgcC8hxXthaezIAxdf/+4z0pSTfZ4wft2obLY
         wjxup9sG1jCTDhz308JI2hblAgNXbkHCBpHUc6tBQDAmLE3DpxFMVsEGcZ7Z2z/HzR+U
         W9q6FX0q2fV581Rfq77Ic424Eg/Yw6G7cdzwk02pAydmGlld8NSYzi+6j7N/k0MD32aj
         bgTg==
X-Forwarded-Encrypted: i=1; AJvYcCWYq0mDvrlzkOuiEJAYclxcoEGwF/4acgnFkQQR8JD/y4KFeFZNduz+7OHQht6lArUJrAhnRLtlh0f+2Y+XVQno@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6RPC6e9YD2yCZ9CwE4/MvJeyk6ddPRJ7GVO+V5JbSM/Xkx5Sk
	6FVE5YGdTbgm+3kD40SEZhvqo0i0oJ6VvAK/QgWvkxv4dwQZEKOJfcVMGe7DCn5tGv6Kkp0mOfJ
	2ehtChmAQwS49ZUtcSdoac2Ii24QxUtntZ2/w8uY=
X-Gm-Gg: AZuq6aLr6m/huVPwIkYPfRHBH9Q5V8VhL7/OXYg1PROOjjWwxiGUondebIXIUH6PAqL
	13dDXABadNbAicA0U0EejAmRpngskWwPyIICi/WPSMUahwOtZyKEdN/8gwzHNAtcu9wkbRledzY
	waD72qtfnxEVtgQGC2DisAmYNoiEeLUYY3fgjffl49eZKDCUdJJZBvRW0XPpJKvoIzHCm20YAa4
	Py7JbT3Zk4zqgMCXEpr4hnCQIGgBQvrPrzhpjqMsHSNiNDEU5oQf0+E7Gq6Pwf6u8wIeCUgbgEK
	j5lDnhXitidFNS+DwFzUjJZXzK61GtQRmFZz
X-Received: by 2002:a17:906:eec4:b0:b91:949a:721 with SMTP id
 a640c23a62f3a-b91949a077emr32138766b.50.1771877678105; Mon, 23 Feb 2026
 12:14:38 -0800 (PST)
MIME-Version: 1.0
References: <20260123093322.1327389-1-richard.genoud@bootlin.com>
In-Reply-To: <20260123093322.1327389-1-richard.genoud@bootlin.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 23 Feb 2026 12:14:26 -0800
X-Gm-Features: AaiRm50Ga4oMdcVdPVuyNBi2IGP1JlBI-F2cv9ZWk5n7MHWt5lEEKQ1itdDrDwA
Message-ID: <CANDhNCrSjp1F0PifJXmxrAbRiTC=d_ZXeiiT5kGuM=gNke7ebA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Introduce Allwinner H616 PWM controller
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Kocialkowski <paulk@sys-base.io>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_121441_662074_5BB39B6E 
X-CRM114-Status: GOOD (  28.87  )
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

On Fri, Jan 23, 2026 at 1:33=E2=80=AFAM Richard Genoud
<richard.genoud@bootlin.com> wrote:
>
> Allwinner H616 PWM controller is quite different from the A10 one.
>
> It can drive 6 PWM channels, and like for the A10, each channel has a
> bypass that permits to output a clock, bypassing the PWM logic, when
> enabled.
>
> But, the channels are paired 2 by 2, sharing a first set of
> MUX/prescaler/gate.
> Then, for each channel, there's another prescaler (that will be bypassed
> if the bypass is enabled for this channel).
>
> It looks like that:
>             _____      ______      ________
> OSC24M --->|     |    |      |    |        |
> APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
>            |_____|    |______|    |________|
>                           ________
>                          |        |
>                       +->| /div_k |---> PWM_clock_x
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_x
>                       |   |______|
> PWM_clock_src_xy -----+   ________
>                       |  |        |
>                       +->| /div_k |---> PWM_clock_y
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_y
>                           |______|
>
> Where xy can be 0/1, 2/3, 4/5
>
> PWM_clock_x/y serve for the PWM purpose.
> PWM_bypass_clock_x/y serve for the clock-provider purpose.
> The common clock framework has been used to manage those clocks.
>
> This PWM driver serves as a clock-provider for PWM_bypass_clocks.
> This is needed for example by the embedded AC300 PHY which clock comes
> from PMW5 pin (PB12).
>
> Usually, to get a clock from a PWM driver, we use the pwm-clock driver
> so that the PWM driver doesn't need to be a clk-provider itself.
> While this works in most cases, here it just doesn't.
> That's because the pwm-clock request a period from the PWM driver,
> without any clue that it actually wants a clock at a specific frequency,
> and not a PWM signal with duty cycle capability.
> So, the PWM driver doesn't know if it can use the bypass or not, it
> doesn't even have the real accurate frequency information (23809524 Hz
> instead of 24MHz) because PWM drivers only deal with periods.
>
> With pwm-clock, we loose a precious information along the way (that we
> actually want a clock and not a PWM signal).
> That's ok with simple PWM drivers that don't have multiple input clocks,
> but in this case, without this information, we can't know for sure which
> clock to use.
> And here, for instance, if we ask for a 24MHz clock, pwm-clock will
> requests 42ns (assigned-clocks doesn't help for that matter). The logic
> is to select the highest clock (100MHz) with no prescaler and a duty
> cycle value of 2/4 =3D> we have 25MHz instead of 24MHz.
> And that's a perfectly fine choice for a PMW, because we still can
> change the duty cycle in the range [0-4]/4.
> But obviously for a clock, we don't care about the duty cycle, but more
> about the clock accuracy.
>
> And actually, this PWM is really a PWM AND a real clock when the bypass
> is set.

During my free/personal time this weekend I was tinkering with Orange
Pi Zero 2w and was able to use this patch series (along with an
hdmi-phy patch and some dts changes) to get HDMI working on the
device.
I'm eager to see these land!

Tested-by: John Stultz <jstultz@google.com>

thanks
-john

