Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2F5C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 17:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=apyazMEhQSo8qF0MeJDavXOSu4X41kdb0EVpzv+wKjs=; b=J08NXCa3SKCPW+wgv0DvNIIL3h
	RwkF+36PfwfZFXO9diAtiA73Uj0Cil0vqwmN+kq0I9ture3XibIfIKF2X1uZHNvB2pxasmHfjga3l
	Z8QYsUwkb8BECQ6RkhnbidmBSw7IHub75O24y7OHycavE6Y396yymhrwK4rF+qGKFwGcAQxc7En+1
	eCkkWthYLBBGqIDTPvGBHCsvNf8sZAerOs1jaGpR/K4GsofLKWO0Mz9pgAi/XQG/Gf4RvD9IqJy+B
	jueINKK4W4bVKtG5KIVRu5MZ1ASt1oCbgWkxJispoWQfgWzDAbQwfsZFZHjpNFPR4NByJTuEWxYfz
	YZBMkHEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBpa-00000007UHb-00uz;
	Wed, 29 Jan 2025 17:26:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBnp-00000007TuD-2fY9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 17:24:38 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso51692095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 09:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738171475; x=1738776275; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=apyazMEhQSo8qF0MeJDavXOSu4X41kdb0EVpzv+wKjs=;
        b=wUJ10eDu+qzC2rYIwi5OCvHvhAZcyS+J7sG8OYSuISILWzS5RfpYaScIZN0pK/H194
         Orsk7rP4FVSfHjR1KWNTrKLeQwXxJsRp2DWJqr7ibcDPz0BDOlYaDCCJOPf224p74/d4
         YsJm/nTqGM8Oe4vY4uWG4Gmfbw0UAGrp3hSF+WPByCbZiA0ONJBOnDmMRmeyWBjXNXeR
         FeodYxGOAzKYZMAwH+jUtLIZ5dCk1zkYwZdBwNH9KXdJ7AhyrGb52RInBP+PJBNXWRoA
         6OhVm4SaNTWCwb+e6ETaYXqaq6aZJaaJc6xHgfnUdpaxiEOxZkp7VmQKCJB1NLluiZLW
         U3JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171475; x=1738776275;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apyazMEhQSo8qF0MeJDavXOSu4X41kdb0EVpzv+wKjs=;
        b=XofUX/A2ZXgXbAOklI4lJXml7t5mTDmV8dyiyGtEcyRKy3yD7pzeUJ/8FnlJV2aQZN
         FZlNBpIwhccnZfVCt/3i1fKjwHOr0iAkZbd5+K9+x4uuLQ+K9SlS/jRMYMqf7Gd8yO17
         RFrK6M6lf6z+YLYVtUwnF7r2z67e8l4nrbLVTmXHMvahH2j5k7il9Km5AaSaEs8XUA2l
         nk7ZYKkyE/qFm/+Trb070kH/hKdYvo561xom0h4JXaMQPBJ44N7qvBe5SdFC+W+noPtZ
         ZDZZjksBsb/SR22l8xAmgIesmTJ9aWMeo3B8BKVx8x5czGTsO7FZ7IpP5ZOov4SUX3vG
         XuLw==
X-Forwarded-Encrypted: i=1; AJvYcCXRCautyGxHfBeC4T1NEgl4L69uPlDnuxVoGpjv7XeNVyF2PnBsNfMPiT6PK2jydj+77Qsh9isahthqd+oBkiMF@lists.infradead.org
X-Gm-Message-State: AOJu0YyLwM4yUq8XWaenPQnjIKL3HLPDRueDy8/xDR0c0uf+lUtwpfPd
	jZVlj3TOp/jfKjuKXSOvJ60itPvX4VQTJPEvHsYfKuh6Uk9KOT/OwVEAOg/agZ0=
X-Gm-Gg: ASbGncuL9k3CRqRIhBEJ6Y8BBELvSVsQWR0X8vNg5YGlgTBMDUlAVPZQdFssqdvcF8B
	VdV9N+PUfhWMJypYg/gzvTCPiglHQaW8GThaLn8waVWcopLfwiiWmPTa6AJWh3bpGyfxiPPMVS4
	1cUJMlOZcORuoBb0Et1lYJRLTMy8FJIoQQ0i4oqj/NfRz5PzMwsdX7TU3WVtu57ZcZabnXSGP1L
	z1/JbCOEjvZTNXSSJwqwKhfVH/tSDXq8hL4Np37zGsMu8Lea7jhNi0SbOZQrVQBER+ZXNQ6MSjy
	IDH7DZgb4h99eSOG68dQ7wLkR2yTTOxsD3eMSPGPP1EVg3RPAxUcig==
X-Google-Smtp-Source: AGHT+IFnDe4/dtbPIGLCw/sImkenHK2DDv+ULBhTplI9CVAjt0kVdyPwIrTWfCJBnrEnbirx/h0Z9Q==
X-Received: by 2002:a05:600c:4e01:b0:435:136:75f6 with SMTP id 5b1f17b1804b1-438dc34b179mr38832105e9.0.1738171475469;
        Wed, 29 Jan 2025 09:24:35 -0800 (PST)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc518ddsm31002665e9.37.2025.01.29.09.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 09:24:34 -0800 (PST)
Date: Wed, 29 Jan 2025 18:24:32 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
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
Message-ID: <Z5pkUNNvsWPjRQvy@mai.linaro.org>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_092437_694428_BB21CD9A 
X-CRM114-Status: GOOD (  22.04  )
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

Hi Claudiu,

On Fri, Jan 03, 2025 at 06:38:01PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
> clocks are managed through PM domains. These PM domains, registered on
> behalf of the clock controller driver, are configured with
> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
> clocks are enabled/disabled using runtime PM APIs.
> 
> During probe, devices are attached to the PM domain controlling their
> clocks. Similarly, during removal, devices are detached from the PM domain.
> 
> The detachment call stack is as follows:
> 
> device_driver_detach() ->
>   device_release_driver_internal() ->
>     __device_release_driver() ->
>       device_remove() ->
>         platform_remove() ->
> 	  dev_pm_domain_detach()
> 
> In the upcoming Renesas RZ/G3S thermal driver, the
> struct thermal_zone_device_ops::change_mode API is implemented to
> start/stop the thermal sensor unit. Register settings are updated within
> the change_mode API.
> 
> In case devres helpers are used for thermal zone register/unregister the
> struct thermal_zone_device_ops::change_mode API is invoked when the
> driver is unbound. The identified call stack is as follows:
> 
> device_driver_detach() ->
>   device_release_driver_internal() ->
>     device_unbind_cleanup() ->
>       devres_release_all() ->
>         devm_thermal_of_zone_release() ->
> 	  thermal_zone_device_disable() ->
> 	    thermal_zone_device_set_mode() ->
> 	      rzg3s_thermal_change_mode()
> 
> The device_unbind_cleanup() function is called after the thermal device is
> detached from the PM domain (via dev_pm_domain_detach()).
> 
> The rzg3s_thermal_change_mode() implementation calls
> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
> accessing the registers. However, during the unbind scenario, the
> devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
> Consequently, the clocks are not enabled, as the device is removed from
> the PM domain at this time, leading to an Asynchronous SError Interrupt.
> The system cannot be used after this.

I've been through the driver before responding to this change. What is the
benefit of powering down / up (or clock off / on) the thermal sensor when
reading the temperature ?

I can understand for disable / enable but I don't get for the classic usage
where a governor will be reading the temperature regularly.

Would the IP need some cycles to capture the temperature accurately after the
clock is enabled ?

> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
> be used in the upcomming RZ/G3S thermal driver.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

