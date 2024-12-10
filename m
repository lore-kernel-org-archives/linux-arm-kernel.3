Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78FDE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3LcvQjrTDMU2Xstb8PTcViDl9lW1bNhQu6ciqVQKbE=; b=FcBnZP+d91T82Argt0SbMI2oXX
	8nKvjwfJMeKzIzSb1GeDjNOi+CPFaOb8cDX7PEjzwH9JfRG4JV/1yacALkIHOhe+9doJUJi6om/2M
	8/ZNofbHXbLWHn+VgIK5NMEnN1XPJBIJZjDTOA1UWJfdPwqUP7X+tbZ/FNcEzwaQSbNp2+Rf4rmgm
	YdO227b+IUikdVhPp41ksAERd9j8XLZRoR9kYGXVUMSlw0aU7Kz2pOo5SYC0NkYArw7MJLpkS9NMU
	ebRLTWrVYZ8hqgWHbPdlCuiNYu0M2GWcuxH4qzMT/MZv5XVtklxkcXH1tXh3ldELjELN3oXwkHSqL
	r4TerhUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKoeG-00000009m5w-3zTl;
	Tue, 10 Dec 2024 01:02:48 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKodD-00000009lyv-39OQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 01:01:45 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-53df80eeeedso4867278e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 17:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733792502; x=1734397302; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L3LcvQjrTDMU2Xstb8PTcViDl9lW1bNhQu6ciqVQKbE=;
        b=Oh6E0liO0aPSe+tYS7W8cPq+2Qw4VKSclH0sT9BK3bHFGfXeiiMyZ3lPxsVoLQ6mxG
         Cn5y1CkD9okx3p9OkiKRwvgFbdzRGBC87u8gfUosudJVsn/0/G37NjfrOSQ0TXDmnRqM
         bE+Y6Rbp4w/lVMygEWNLpBBqoAXx0KOciqZrP0L+YutjAfak4nFMldLy/rgldmXvdv0B
         2K4hg+lTa/ZTBuL+i+eQqiuar6NjrZpkkd47RNqq+lNLbI9ilMDK/1vGr76ECqTWWInm
         /20e4dIZZdbkkKpwUpvqaNlaDuo53HpBbT5NtpLvbkKuHa38NsL1/NwMfU9yeDbMLT5J
         N0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733792502; x=1734397302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3LcvQjrTDMU2Xstb8PTcViDl9lW1bNhQu6ciqVQKbE=;
        b=jXh35DtFngAQ932g4yNE44MO9V2gdfHEM+zrJvrBdPxaPk2Ssgp/QLHoXGsRWukafW
         3AjPziYfVCDueRbBk0mn39RRoWqj0Iz20XE8NmW0YvRcz+3iW7jrBiYfW++ezEAZCxMw
         RI+3qN+RzVS9vRwWmXuo3rBTlp5Q+7ZCS+hyJv9ygZRG2Rj+LkomBViCnSYlRXyzL7Cc
         OTVvPq0qDgXIdiftK8sibGNNmM342bXVyR85lh8l1HPIdJYx+2fq6kJm2RuoCiQa0bgB
         bWNVk47ncU2fV6sZlOMDGxWs9+ayB7h6aC4Zluqinm6NUuP8sn6pHmU/yLekTEBQbdCa
         4zpA==
X-Forwarded-Encrypted: i=1; AJvYcCX8umpRQ0JD95PNt3eyVUGQnBol3j8luDzfEsVBX+PzgisRQwYUR9trG7S6sn2jSQV22BMDxirT/WBrHr1QLIRv@lists.infradead.org
X-Gm-Message-State: AOJu0YwbIK7ONO18U9m7WReYM+jIWParD6kx2FscfSiiFolquP9j55A9
	1Px/jjqJoE36FWlBpIAR3UKrR28VMalPPNGeYliuD5nOfGD6+YgUbke4ghQyAAg=
X-Gm-Gg: ASbGncsK8jxjoeLSh6JxtLQL7rLmlxS+BFu+HWgdFnEGjt0c8ekf4huw0zjMaNHSFg8
	iq+RVF2Gdgukp8MKEXk+x2waA9o6DSX3hDNvLab94ZKsi+iTdJrPAzT21AN/C/Kq4Icqkqjb52Q
	uhAQ+x24A4DWFi8P5wJNhVxJHYYwYUEX55f3OCj2Lz5evX0PQgrpj9W3Wdbhm0FNnvM2trh3bN9
	4C7FZKkZAhWPXjCRaQ4vk/rAjv//ibnsVp6TryTP7BF4kDIKDOwoNuqCjhQhfDisFeRcs0Zfcv2
	zWZZsJlrLojpWXdQ7gJnmJp2INaKjrGAVw==
X-Google-Smtp-Source: AGHT+IGILM694LFfCANVTXh/z3425jGIXUHVbOTTzyrGuCY/MpJfTZw0o+GZqr4bkrlnIoLzl3nnUg==
X-Received: by 2002:a05:6512:3b89:b0:53e:239b:6097 with SMTP id 2adb3069b0e04-54024115ffdmr968809e87.50.1733792501835;
        Mon, 09 Dec 2024 17:01:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3ab8dd61sm919009e87.44.2024.12.09.17.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 17:01:40 -0800 (PST)
Date: Tue, 10 Dec 2024 03:01:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Yan <andyshrk@163.com>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Daniel Semkowicz <dse@thaumatec.com>, Diederik de Haas <didi.debian@cknow.org>, 
	andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	jernej.skrabec@gmail.com, jonas@kwiboo.se, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, neil.armstrong@linaro.org, 
	quentin.schulz@cherry.de, rfoss@kernel.org, robh@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
Message-ID: <ay5hbnqqjhopaqof6z7j2rzm2bc6xa2vbzan2ak3if6wzmyip2@kqh7gtrajnm2>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <20241209150619.33998-1-dse@thaumatec.com>
 <D67AV178CEBD.3QA9VD4ZPRNQ1@cknow.org>
 <2203458.KiezcSG77Q@diego>
 <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e015ea9.960.193ae0c236a.Coremail.andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_170144_359390_B911BDE3 
X-CRM114-Status: GOOD (  22.35  )
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

On Tue, Dec 10, 2024 at 08:50:51AM +0800, Andy Yan wrote:
> 
> 
> Hi,
> 
> At 2024-12-10 07:12:26, "Heiko Stübner" <heiko@sntech.de> wrote:
> >Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de Haas:
> >> Hi,
> >> 
> >> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> >> > On 03.12.24 21:54, Heiko Stuebner wrote:
> >> > > This series adds a bridge and glue driver for the DSI2 controller found
> >> > > in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> >> > > 
> >> >
> >> > I did more tests with different LVDS displays. I tested following
> >> > configurations with DSI/LVDS bridge:
> >> > - 1024x600@60.01
> >> > - 1024x768@60.02
> >> > - 1280x800@60.07
> >> > - 1366x768@60.06
> >> >
> >> > All of them worked without issues, except 1366x768.
> >> > With this resolution, video is blurry, and offset incorrectly
> >> > to the left. There are also repeating errors on the console:
> >> >
> >> >   rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp3
> >> >
> >> > In correct operation with other resolutions, there is no error.
> >> > I am not sure if this is a problem in your series or rather in VOP2
> >> > driver.
> >
> >This really sounds like something is wrong on the vop side.
> >The interrupt is part of the vop, the divisable by 4 things likely too.
> 
> This is a hardware limitation on vop side:
> The horizontal resolution must be 4 pixel aligned.

Then mode_valid() and atomic_check() must reject modes that don't fit.

> 
> 
> 

-- 
With best wishes
Dmitry

