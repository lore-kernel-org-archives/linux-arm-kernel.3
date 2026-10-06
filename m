Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B9BCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=59tTbEd7XKwQNSi2VwG8oe01VNjOQRuofqVVGEih6F4=; b=mBovuiRRZUv4kBp0srqvv5Mhlo
	ctuG+IkJSSlozVLNcEWdou/PFK35z9mL3HNTOdCVXr9tDma88+I12CktV57BrTGhMyWHswnSI2E4p
	XVlzO/S35GJvUk/hLKC08kVsjDRMYk6QRsHgD/7Wpi/a4ka7OpBghYb6lCzU9bi11pDM1RpP5OkQq
	P2D0Mt/GoVAstWuDZAveD5CUmf12Q93jiCB0P+YnvWGP0dKuiKz79vErjMzjveUMGBwIuPOI2Xbdi
	UA6FbcM96HK216ekR9pGi4Csg7ds7xn8UftWdvY19+7kiGykmcIY/UJHJ3w97pUH624/8oJnFkMjd
	agHgTj6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5Z8-00000000trT-3pCl;
	Tue, 06 Oct 2026 13:50:46 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5Z3-00000000tpe-1g8h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:50:42 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48b042c0728so235275f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791294638; x=1791899438; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59tTbEd7XKwQNSi2VwG8oe01VNjOQRuofqVVGEih6F4=;
        b=Ql7hYE2tXVXQB/kasQvJ1Le0SVlvXDwMGoRvFqI2h1kMwK3EummzksT5FFkgKkQsNU
         vaa2Oo119wBEzACwafgHGDdoMS8k/y0p1XTNVTXpTE6bQh/kQdkHNPAHltKqZggeMT+v
         aWqrJrLSvoIwXVqiVQYyNmCumPPCEkoW9GMjcJFDcI0846op9eJhIhhT+Y2mOTgTpct2
         /joFN8in1Obh3M0bbfDqlo4Y1FqgT04WhKKdGJhkOEPqwrtYM7ushMAJfi5PY4eb0L5B
         /6U9ZQ2Oyioiq+SC+Bi3tKSTSb+a7vFw8TkbhycW0qiQ0Ftfl/BwuoTPAfssIu8S8zD6
         WaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791294638; x=1791899438;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59tTbEd7XKwQNSi2VwG8oe01VNjOQRuofqVVGEih6F4=;
        b=JSNIiW7Pj7vkUJXRp8Y2hSZwbZVdau0tOT4C2ZLAT5uo1Le2K2TV5xYf9IqEs/Uoha
         BIapt66zElnkSiy5yKIFO6RITCORbDbEYD1lJu4oJbJ/vaSonIcT2OqdwAsp1E7gX0WE
         VQa/PGD3smrAmmqfrhFaHTkFRLbpR/JQNTdxpSHMA2D1vvp6NXleqSouX+bTmz9JUEKy
         QDzHl11TIkN/DJoHLpKNWuwOhVCeO43S7C2hjWgyFnZQbFCn0F2bGgsCtudusNCWlw4q
         e4hoUsAqsGXq1LYO9z4Mm5AtXv5a3+6cQd7GoZFhucJBc4SJs6BwFlIVtm64fe26LKN0
         /kNA==
X-Forwarded-Encrypted: i=1; AKwUvBwP4TQpoWRwrQR86QPDb3xjdsWahYNMu8z8Ixm3Gr/pD0waUtd7ybaQQ0pQK5fieYuBFSHWlBfGQhnr6wjJ9c6J@lists.infradead.org
X-Gm-Message-State: AFq9FYLDN22/0cZVm60LdD8bu4/wbtE3Lttc8Wnc1C4Elf50ID0Gu3dg
	ho9lxxMNqnPOZkoVsUwUvsH9ykxegM7XBNSlT08vRsoTpEHWfzdmZfhwQFIKWpDk8Hk=
X-Gm-Gg: AYBFou042/pe0+mhI0gyM7j9RDkNGJr2/KGCuCpDa5+n6hIGr3PFXfIhBUGocXPRmrQ
	EDKF8zq1mgopa/lCY+50IBNj4lWQXG3W8LN50KrduARO95g/BWwt/T6ZYFOJvVOidPKEroMnwbr
	mJj+R7ZdVUY356RTljdKWv1dWcKd7ZEoQCDMovoJqrW/8nJLiF8pv1oRSEJp9PzAsL0PHrSJRFi
	EpYxp3ieE1BPXeeI8FLPUW3xZRe3XR5g5wGrhntHsME16zvOWMVt4KoBNv3PSyw8oy1f6RF8Cm8
	k+eF1DXvf2c4I5VFQbtj0minO+8hpauUXiafqVONJ+6sOjjsoUxtLnwn3f9mQKi3DHrsFypFszU
	m5fgbwEDZotEikzzbtYEqkCygOZcs+IbqKgLE0v/LQHYShsWZkJv8aC5TbaGmm5aXHT/2r2zd1v
	JuNMTtdPZTmqlwz44dBV/iyDtj7gD6eGyOlKv27OXiROCNBaPgSrQXMYhxwx9mRZ3N1zr8BBvmb
	rE8U5jX
X-Received: by 2002:a05:6000:608:b0:48b:d17:139c with SMTP id ffacd0b85a97d-48c6d1aebfbmr2875717f8f.51.1791294637769;
        Tue, 06 Oct 2026 06:50:37 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c714220e6sm204373f8f.3.2026.10.06.06.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 06:50:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 6 Oct 2026 15:54:22 +0200
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>, mbrugger@suse.com,
	Sean Young <sean@mess.org>, Julian Braha <julianbraha@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v12 0/2] Add RP1 PWM controller support
Message-ID: <asT9ji8v8gw8XfcB@apocalypse>
References: <cover.1790686331.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1790686331.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_065041_454414_1DB4071D 
X-CRM114-Status: GOOD (  26.63  )
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

Hi Uwe,

since all of the patches have received at least one Reviewed/Tested-By
and Sashiko doesn't seem to complain anymore, could we go on with
this patchset?

Many thanks,
Andrea

On 15:02 Tue 29 Sep     , Andrea della Porta wrote:
> This patchset adds support for the PWM controller found on the
> Raspberry Pi RP1 southbridge. This is necessary to operate the
> cooling fan connected to one of the PWM channels.
> 
> The tachometer pin for the fan speed is managed by the firmware 
> running on the RP1's M-core. It uses the PHASE2 register
> to report the RPM, which will be exported by this driver via
> a function. A subsequent patch will add the function to read the
> speed to this driver and a new device and driver to read the RPM
> and export this value via hwmon.
>  
> Subsequent patches will also add the CPU thermal zone, which
> acts as a consumer of the PWM device.
> 
> Best regards,
> Andrea
> 
> 
> CHANGES in V12:
> 
> - added a comment to better explain why we don't need to save and
>   restore config registers upon suspend/resume, hopefully Sashiko
>   will stop complaining about that.
> - the RMW access to teh global control register is not synchronized
>   via spinlock.
> - patch 3 from previous release:
>   "arm64: dts: broadcom: rpi-5: Add RP1 PWM node"
>   has been dropped from this patchset since it's already applied
>   to Florian's devicetre-arm64/next branch.
> 
> Link to V11:
> https://lore.kernel.org/all/cover.1790606188.git.andrea.porta@suse.com/
> 
> 
> Naushir Patuck (2):
>   dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
>   pwm: rp1: Add RP1 PWM controller driver
> 
>  .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
>  drivers/pwm/Kconfig                           |   7 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-rp1.c                         | 428 ++++++++++++++++++
>  4 files changed, 502 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-rp1.c
> 
> -- 
> 2.35.3
> 

