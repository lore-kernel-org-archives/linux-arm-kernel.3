Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41297CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 19:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5iHvWuqXMKqXY5xi5HWO4WJVMOf5QP5qFtqbNbimzII=; b=L9oReUcQ2uJ6Km/Z4Or0msEPwp
	kbY1tCbgKuYIqHyADHeVK96ObRZRS2sUG5ndb5p6e0vNbH1O7ofNtXHsnN5zTAwYpeVLbLLWhfB5e
	NTRThaEhsRHiAKqytT0VEZOeik3K7OIeAXAjxjM934FIb8JD+DAV+9c5g2XQx94cHeJCaHZ3L33J0
	AHT9jIFFdy1RTCeLD3x31mtqbLgOk5GlkQOujc7OXf6yYqtS8yHkYxZOvqROZMtpHFbKSG1IVoUxS
	aNReT1iCYBfnX4bqXEMjBM0GDo90iLBPsQKUHbeXWaS0FQIHMbEbyP6sjBp1/cFAPSadQ0U6zYi9K
	vTmunhUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VEc-000000036AK-2Z0H;
	Wed, 24 Sep 2025 19:33:02 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1VEZ-0000000366l-1ytA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 19:33:02 +0000
Date: Wed, 24 Sep 2025 21:32:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1758742374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5iHvWuqXMKqXY5xi5HWO4WJVMOf5QP5qFtqbNbimzII=;
	b=ZEM96ehZfNKMQ9RPJZFXmoXJ8Fk/dL8ssD8yZTVwrJTEoInjNxItijIGl8OtrfbNlfEQyZ
	jk1KKW07G6hBHf8X7G3kPRtnmUmIml0rWY7oeJPvxA6nOiDn0uifc48w56uARMZxnMOZd2
	wKaMSGKfxG/hUk+DCJF1pHv7OGeu3Dw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: =?utf-8?B?77+91b3vv70=?= <shin.son@samsung.com>
Cc: 'Bartlomiej Zolnierkiewicz' <bzolnier@gmail.com>,
	'Krzysztof Kozlowski' <krzk@kernel.org>,
	"'Rafael J . Wysocki'" <rafael@kernel.org>,
	'Daniel Lezcano' <daniel.lezcano@linaro.org>,
	'Zhang Rui' <rui.zhang@intel.com>,
	'Lukasz Luba' <lukasz.luba@arm.com>,
	'Rob Herring' <robh@kernel.org>,
	'Conor Dooley' <conor+dt@kernel.org>,
	'Alim Akhtar' <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] thermal: exynos_tmu: Support new hardware and
 update TMU interface
Message-ID: <20250924193248.GA34040@l14.localdomain>
References: <20250922041857.1107445-1-shin.son@samsung.com>
 <CGME20250922041902epcas2p3e40ed58737b22b7af9d09f6ba362928d@epcas2p3.samsung.com>
 <20250922041857.1107445-3-shin.son@samsung.com>
 <20250922200430.GA4697@l14.localdomain>
 <000001dc2c24$8be7a090$a3b6e1b0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <000001dc2c24$8be7a090$a3b6e1b0$@samsung.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_123300_547745_EB081CBA 
X-CRM114-Status: GOOD (  33.28  )
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

Hi Shin,

On Tue, Sep 23, 2025 at 09:53:53AM +0900, �ս� wrote:
> Hello Henrik Grimler
> 
> > -----Original Message-----
> > From: Henrik Grimler [mailto:henrik@grimler.se]
> > Sent: Tuesday, September 23, 2025 5:05 AM
> > To: Shin Son <shin.son@samsung.com>
> > Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>; Krzysztof Kozlowski
> > <krzk@kernel.org>; Rafael J . Wysocki <rafael@kernel.org>; Daniel Lezcano
> > <daniel.lezcano@linaro.org>; Zhang Rui <rui.zhang@intel.com>; Lukasz Luba
> > <lukasz.luba@arm.com>; Rob Herring <robh@kernel.org>; Conor Dooley
> > <conor+dt@kernel.org>; Alim Akhtar <alim.akhtar@samsung.com>; linux-
> > pm@vger.kernel.org; linux-samsung-soc@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > kernel@vger.kernel.org
> > Subject: Re: [PATCH v4 2/3] thermal: exynos_tmu: Support new hardware and
> > update TMU interface
> > 
> > Hi Shin,
> > 
> > On Mon, Sep 22, 2025 at 01:18:56PM +0900, Shin Son wrote:
> > > The Exynos tmu driver's private data structure has been extended to
> > > support the exynosautov920 hardware, which requires per-sensor
> > > interrupt enablement and multiple-zone handling:
> > >
> > > - Add 'slope_comp' : compensation parameter below 25 degrees.
> > > - Add 'calib_temp' : stores the fused calibaration temperature.
> > > - Add 'sensor_count' : reflects the maximum sensor numbers.
> > > - Rename 'tzd' -> 'tzd_array' to register multiple thermal zones.
> > >
> > > Since splitting this patch causes runtime errors during temperature
> > > emulation or problems where the read temperature feature fails to
> > > retrieve values, I have submitted it as a single commit. To add
> > > support for the exynosautov920 to the exisiting TMU interface, the
> > > following changes are included:
> > >
> > > 1. Simplify "temp_to_code" and "code_to_temp" to one computation path
> > >    by normalizing calib_temp.
> > > 2. Loop over 'sensor_count' in critical-point setup.
> > > 3. Introduce 'update_con_reg' for exynosautov920 control-register
> > updates.
> > > 4. Add exynosautov920-specific branch in 'exynos_tmu_update_temp'
> > function.
> > > 5. Skip high & low temperature threshold setup in exynosautov920.
> > > 6. Enable interrupts via sensor_count in exynosautov920.
> > > 7. Initialize all new members during 'exynosautov920_tmu_initialize'.
> > > 8. Clear IRQs by iterating the sensor_count in exynosautov920.
> > > 9. Register each zone with 'devm_thermal_of_zone_register()'
> > >    based on 'sensor_count'.
> > >
> > > Signed-off-by: Shin Son <shin.son@samsung.com>

[ ... ]

> > > @@ -952,6 +1183,14 @@ static int exynos_map_dt_data(struct
> > > platform_device *pdev)
> > >
> > >  	data->cal_type = TYPE_ONE_POINT_TRIMMING;
> > >
> > > +	if (data->soc == SOC_ARCH_EXYNOSAUTOV920) {
> > > +		if (of_property_read_u32(pdev->dev.of_node,
> > "samsung,sensors",
> > > +					 &data->sensor_count)) {
> > > +			dev_err(&pdev->dev, "failed to get sensor count\n");
> > > +			return -ENODEV;
> > > +		}
> > > +	}
> > 
> > Do we really need the `if (data->soc == SOC_ARCH_EXYNOSAUTOV920)` here, I
> > am sure there will be more socs that use samsung,sensors. Can't we simply
> > read samsung,sensors for all socs and use EXYNOS_DEFAULT_SENSOR_COUNT if
> > it fails, or would it be potentially dangerous if samsung,sensors is
> > missing for autov920 dtb and default value of 1 is used?
> > 
> > Best regards,
> > Henrik Grimler
> > 
> 
> Yes. Incorrect remote-sensor settings can affect TMU operation. For
> example, when the sensor count is set to 1,
> The thermal zone doesn't function properly and the hardware trip doesn't
> assert on the v920 variant.
> I consider that configuration unsafe, so I added variant-specific handling
> for that SoC.
> Meanwhile, the other variant legitimately uses only a single sensor.

I see, thanks for the explanation!

Best regards,
Henrik Grimler

