Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A4CC02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xgSZrYTjR4wYm9y2TJ/8whEMF1KaaIbp8HFp2h/RHw=; b=fjUfOdUrHMZ1jHjTm3YhOv5PsB
	305QfAup+cFyKW/DQkJsCJrK2/8gFILjSVrnr1YyMc7gGSptvHhYrJLVQ6pL2epe7Fw/UvmGpn+Dz
	puKEveSqbur6xOi+QXmCTIh8iCq+jk13+iaKxvHy5/4cb01z+p4Il8Tc3RDlw0EAeAKvNWBSgoAEi
	Uchiqh694+4Ro3aXtCxeYH5l9eckrgVn6IGRhGYZ4nsTUjHJau4clFyDULBwBEUbq1sIeuFB4ZTxD
	dx2/YdokkvY/suKjRQDWAnPqsC2VsjIrsyCq+PZssyTB/3Kf9lL76NcaEX7cIeOW9u0f+pA6LbOJQ
	TPYe0t1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRTM-00000008aUG-0nDf;
	Thu, 30 Jan 2025 10:08:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRRz-00000008aLV-2JMh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 10:07:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso3858255e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 02:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738231626; x=1738836426; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/xgSZrYTjR4wYm9y2TJ/8whEMF1KaaIbp8HFp2h/RHw=;
        b=vfNlhkDtixnuF7Wgfc2hHVx5L/xUWGzuaqmTXSzKf3cHgyPMgBu/8rRJOSXo0mZKrV
         cAevaWGV/SMgUJVN5AxorNpaZCymDTeRc8rcPXBCCbW6egtUpdTbQyTZexcn9waIQo4h
         j6FZICbeRfOZr+IcOIPCZkx8UOMLO3ga8CR9MxtQnuZLE5o4mI1avb1oOSChDr1nsb4m
         lz1Vc5fg//wmerACfm9GcJ0QHxL3g9+AaezfsilMqqsA54x7L0E3IJ+kVDde+SpJjCoK
         +WCtmDPXXyRST6kCgrlPeYzGqlKFuBHDixCWJnb0X355go9gJhIfCm5TfoX/AGTlimGQ
         3REA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738231626; x=1738836426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xgSZrYTjR4wYm9y2TJ/8whEMF1KaaIbp8HFp2h/RHw=;
        b=Y8Be1Z5sDlUZCbq5X6fdaWUjOycMlTeFOo9wQ5pW+FoZfvHoEVKc6+drnUAW7udnXI
         XsIe5sfrNEn8jpVsM0iz/zWI//P3Gknp0kXFElxeLI7xu7MGxPU35oc/BwvLkwJsubbX
         U8MOaQbkQqxh15OE8ojy2YApYJYwpdFGQy/CgkDMBksrwNmKKZh+2a+3OQHnHtzzmhLT
         EHnkuxaGwfV3DQD2zCg8m7+Dd7xEHZA9JB9NAJZUOF+FRyWA2jUUCLHZyAGMp7rEdC7f
         gOh3oJkFvQXFMH4U8ioUOL4U77BKYgAPj33ywLAb0E5iozQo1sHpA1HHAHqcNTdZQuHk
         6y/A==
X-Forwarded-Encrypted: i=1; AJvYcCUphcJj4TeVpxEM503lIC0f+1pS6AqjplHbWTtfbePWonQLTelbBsEVxvQCPujBkDan9btNaYSKXsQQUe8URX1u@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8Zrl979slZREy7tGdNaay1Ul27ftCghX83nNIgL4gRRAFe5Rf
	beeYoXdxW00V5jCYLy3UduPkwuv1Jlb7116UlCNGuadGKM6FViukhEK8Zqxj5mU=
X-Gm-Gg: ASbGncthDUoYacdGrZAPar5lQUFm4AUKDsZPQgnZ6nSOJeAkTmNzwBPmrnT0U+phRcI
	afecMtrtt09xAb3C9CfxH1FS8+TAbnt3fGkQEKIVEa265QPxreQ+5pmYYn9/rbaZpXGkeAIRLih
	5YphnLfxAN+T8hzJ7pEjUYjSLLE/ULrpOEcAdrqrISrw6fT4fVEJh81HoEWRL9YEKiSzX3lYL3z
	5CcKfscItaZnbO1AsK4XsXoFAEyLEJE9baDiAIE9ShbSWcbcccyeYdicp+jOXI+6jZxZgSxZPTA
	FaTlSbQgARuMRV1RjkJLgY4Y8YhuGgz3QvPQWrNKkErX+RmjCJT6+g==
X-Google-Smtp-Source: AGHT+IG1KyMFpNfsa8g5lwEoCzkFattulfz3yPh36W1lbzjbEMttPBKcz1auUhyGCxe1asfnZ5I/UQ==
X-Received: by 2002:a05:600c:1d1e:b0:436:a3a3:a70c with SMTP id 5b1f17b1804b1-438dc4214c3mr43534915e9.28.1738231625956;
        Thu, 30 Jan 2025 02:07:05 -0800 (PST)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245efbcsm17275025e9.33.2025.01.30.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 02:07:05 -0800 (PST)
Date: Thu, 30 Jan 2025 11:07:03 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	geert+renesas@glider.be, magnus.damm@gmail.com,
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
	ulf.hansson@linaro.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
Message-ID: <Z5tPR_tv7vWDkUI7@mai.linaro.org>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_020707_600984_314771CF 
X-CRM114-Status: GOOD (  39.06  )
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

On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
> Hi, Daniel,
> 
> On 29.01.2025 19:24, Daniel Lezcano wrote:
> > Hi Claudiu,
> > 
> > On Fri, Jan 03, 2025 at 06:38:01PM +0200, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
> >> clocks are managed through PM domains. These PM domains, registered on
> >> behalf of the clock controller driver, are configured with
> >> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
> >> clocks are enabled/disabled using runtime PM APIs.
> >>
> >> During probe, devices are attached to the PM domain controlling their
> >> clocks. Similarly, during removal, devices are detached from the PM domain.
> >>
> >> The detachment call stack is as follows:
> >>
> >> device_driver_detach() ->
> >>   device_release_driver_internal() ->
> >>     __device_release_driver() ->
> >>       device_remove() ->
> >>         platform_remove() ->
> >> 	  dev_pm_domain_detach()
> >>
> >> In the upcoming Renesas RZ/G3S thermal driver, the
> >> struct thermal_zone_device_ops::change_mode API is implemented to
> >> start/stop the thermal sensor unit. Register settings are updated within
> >> the change_mode API.
> >>
> >> In case devres helpers are used for thermal zone register/unregister the
> >> struct thermal_zone_device_ops::change_mode API is invoked when the
> >> driver is unbound. The identified call stack is as follows:
> >>
> >> device_driver_detach() ->
> >>   device_release_driver_internal() ->
> >>     device_unbind_cleanup() ->
> >>       devres_release_all() ->
> >>         devm_thermal_of_zone_release() ->
> >> 	  thermal_zone_device_disable() ->
> >> 	    thermal_zone_device_set_mode() ->
> >> 	      rzg3s_thermal_change_mode()
> >>
> >> The device_unbind_cleanup() function is called after the thermal device is
> >> detached from the PM domain (via dev_pm_domain_detach()).
> >>
> >> The rzg3s_thermal_change_mode() implementation calls
> >> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
> >> accessing the registers. However, during the unbind scenario, the
> >> devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
> >> Consequently, the clocks are not enabled, as the device is removed from
> >> the PM domain at this time, leading to an Asynchronous SError Interrupt.
> >> The system cannot be used after this.
> > 
> > I've been through the driver before responding to this change. What is the
> > benefit of powering down / up (or clock off / on) the thermal sensor when
> > reading the temperature ?
> > 
> > I can understand for disable / enable but I don't get for the classic usage
> > where a governor will be reading the temperature regularly.
> 
> I tried to be as power saving as possible both at runtime and after the IP
> is not used anymore as the HW manual doesn't mentioned anything about
> accuracy or implications of disabling the IP clock at runtime. We use
> similar approach (of disabling clocks at runtime) for other IPs in the
> RZ/G3S SoC as well.
> 
> > 
> > Would the IP need some cycles to capture the temperature accurately after the
> > clock is enabled ?
> 
> There is nothing about this mentioned about this in the HW manual of the
> RZ/G3S SoC. The only points mentioned are as described in the driver code:
> - wait at least 3us after each IIO channel read
> - wait at least 30us after enabling the sensor
> - wait at least 50us after setting OE bit in TSU_SM
> 
> For this I chose to have it implemented as proposed.

IMO, disabling/enabling the clock between two reads through the pm runtime may
not be a good thing, especially if the system enters a thermal situation where
it has to mitigate.

Without any testing capturing the temperatures and compare between the always-on
and on/off, it is hard to say if it is true or not. Up to you to test that or
not. If you think it is fine, then let's go with it.
 
> If any, the HW manual is available here
> https://www.renesas.com/en/document/mah/rzg3s-group-users-manual-hardware?r=25458591
> (an archive is here; the manual is in Deliverables/r01uh1014ej0110-rzg3s.pdf)
> 
> Thank you for your review,
> Claudiu
> 
> > 
> >> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
> >> be used in the upcomming RZ/G3S thermal driver.
> >>
> >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

