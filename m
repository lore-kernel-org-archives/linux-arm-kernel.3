Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C7AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Whv3w5+5QDDBIWkUbKKLfY2NqWbDdylwB0SvEbCmtM=; b=QmV6KKCmrFtWIwLcdLbgM9hRIE
	QyN50YVI9XGcR54EqeQL5ajTeRNBdXq1WfLHrJMzwKFPGIfZsSuHefphYVKp3Zsow3Ybfy9uTPVPr
	w6Q1lhwZtEcWZgbBWQAyccPRvBwRiTPPEZmCj0FEbeU6BhYgPotvAilWhtc0q9X18ziv/1dbsEoOD
	VqGfOfMtRVMvcTeFzX/Xi+gQu/2ALLqRXPImniOfcu6cMOnnXhXBbs0zUj5+P91kJTKWYo/Tvpq+y
	vMOepofm1UHlaGT/q6AJMT5k7ogIECqoelOBrS71utoNUt2S66TS2gzZbGbI6c0KOTgrRfZmkTtDD
	8NOfOZlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFGL-00000005EBN-2ozU;
	Mon, 30 Dec 2024 12:52:49 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFFA-00000005E1X-1jib
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:51:37 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53e399e3310so11190174e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 04:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735563094; x=1736167894; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Whv3w5+5QDDBIWkUbKKLfY2NqWbDdylwB0SvEbCmtM=;
        b=dlX0H1OIL5/ejjkIpmfS5TEK6z8psaeorepe5w+2bTjcKfZdusgYxKdoym2OKKbpWL
         Ar8Pv6Wl+kktzNTzOJw+G8CXGtap3pfUJtC5AdMZClqW+iF55U+GyD5omhpmeNaFGkV6
         KsehyRKSULl6TXdvdNru1wmJk6EoPXdr+Hvw0WzedHASYo9CHvHDWh4vZZvUFZyoIb3A
         kaKjyYoU+7oPrMIAUSoeNhDZzQi7ekKPKugi7Cd0UZGUC9zRl9NckfRYD+/lkkfp8tnY
         vUNFkSCUWs6zP4BHI/Z0wBCj2qq9Lb8UVcaAzQuGDYBL40UMr4HAtsJSTJPTKSmwE5ip
         1tyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735563094; x=1736167894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Whv3w5+5QDDBIWkUbKKLfY2NqWbDdylwB0SvEbCmtM=;
        b=Lhj5RZwHOk6Wc9TNY4G14vJLT3lTFoi4Tgxvp4VJxLqvBA9/49UQ7+k4DBaIkTffu4
         c1jVKnto+Dhd9UgtbV8y+xVp+vu1uPiPy6+3fwFWWydQ6cxx/gZM5KpCOkgXiKJa/E1C
         +qx61y4nESGKFYeTsW59bDoUmOtlHLyNF0wq0IfdwlveO6nS3GQdHz5wnm2XNxFhHdZI
         v0Cik7ZFoBs6EHqgjIk+djhmP/do3np3TOwSMD953ght73cPg4WcSTQ5eX4fNZtp5dng
         wI6yWJfK57PRXPBmXBe/zU82stDt45h79wz19qYmL1vp7XV/OYbMowEkATETEblhudth
         8Z0A==
X-Forwarded-Encrypted: i=1; AJvYcCX2owMdyTc5Ss8Yuy8LCq3lAV/5Yrez8Io2WgT5MD5Jopl/sEQ+Io2BlLqNWq1ogdd1sovWaIpm2y/uJezWmy60@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7NISK2chaebi6KXJscnfWY3euhYBwTqHsbp80EaaO1Sisu2p5
	BdL71Vj094k9NYipRF9mRPrT97NfgDnBzwLkH1sqgzDMkPWdbXilgPUebNvUh60=
X-Gm-Gg: ASbGncv8B4tFzDAEi4QQeakYe6kUORxLbONHwYFvqt/mSwlqfdHkVKABPB5IritPJN2
	7AhgYZqX1Qk8QE7xo9osJX1ltXMpNHQk7Vjgwa48uJXaE9HXRLLXQnqQx+dxvjMG1J0ax0cavMo
	YoEUCurHHQ+d6AYv/eQ1qQMvspnUqapf4kENa13CwSHk4WLYK1J06Irc0KaID7xaip3f2pEI610
	flD0u0D0AaPCtFQYKhBfL6K5m2om3+fgOtLgkotRBRatdCBf1FOlKxsNhBWNnAZHYfs8//N22LX
	Hkx32zRxw3kYV4sBoSK4Ieo2BXSk/rwCDDXA
X-Google-Smtp-Source: AGHT+IEW593Bqv5NB/vO2QEA4rz6rsbxfXb7nT58hLPf3Wn4NzBw3y0XPudnrMXfV5cdFkQkrpllxQ==
X-Received: by 2002:a05:6512:1255:b0:540:3550:b0f8 with SMTP id 2adb3069b0e04-542295305b7mr11077421e87.24.1735563094455;
        Mon, 30 Dec 2024 04:51:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223821504sm3074015e87.198.2024.12.30.04.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:51:33 -0800 (PST)
Date: Mon, 30 Dec 2024 14:51:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 12/17] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <tlfkh3vwuwtqiaps3l4krv2grttlbe7ahienvjlglnzzdn3czk@pfdgmrvp65yf>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-13-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-13-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_045136_444284_007E03CF 
X-CRM114-Status: GOOD (  13.40  )
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

On Thu, Dec 26, 2024 at 02:33:08PM +0800, Damon Ding wrote:
> Move drm_of_find_panel_or_bridge() a little later and combine it with
> component_add() into a new function rockchip_dp_link_panel(). The function
> will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> aiding to support for obtaining the eDP panel via the DP AUX bus.
> 
> If failed to get the panel from the DP AUX bus, it will then try the other
> way to get panel information through the platform bus.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

