Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB3BD116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2bFlIh8I9NZQcRpDPD+Djsorg8bRceb3xQr+grKSRk=; b=CD9t6z6MUbAYCTr9rtuooFr6tr
	xxw7JVCkS1340WuFEQVA/6xCK7ZqmLvhuEfGiEdH3X8n9wWfM4g/Nk4JHDE+2Yr4v57xOuiHcP0oX
	p4YVhMDPpWNKcQqLnz90g+UFP2tSI+Uzi9hVF+O8/XzcShJSqGNgRX3DzsQJrZbQqf+w14jPQm5ww
	/8z/n6jKGae0Lm++bVNuR6JaJNZzOwBN0hBzGbIXHPx1rSDPHK7SdxFCTRcpbWYNoEzj7fJkG3JY5
	rqEgxzZV+ESBiokTYnlAcJW5jn8qJnMGDEfRAc4h6nFTFNokCmhZ3xodztFUdFqzbr5sgy6dUh+fK
	wlRhJRlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtZ4-00000000842-16Ei;
	Fri, 28 Nov 2025 08:10:50 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOtZ1-0000000083B-2CiD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 08:10:48 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477aa218f20so9489065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764317445; x=1764922245; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+2bFlIh8I9NZQcRpDPD+Djsorg8bRceb3xQr+grKSRk=;
        b=M12DisTtjleZee6VzpMTDfzgN44jmSB/4Cumn6Jw9pCBaIyOvCrkq9hSRfVmbv5qzf
         M7+xeiaTsxDObpiawHUYVGBmCciEtCjor5uaTjnFOPoSmSWfTi6K+oQHAz+bro4wW9ZF
         hFH4cED3pwxMEHo6UwZEI6rRcslVMrlgfMko6ZuaklDvtldRS8OvBA7W3mL1h1WNOuG6
         qUHkAWRDIFIwcrbpUbxio4o87ZTbYFt0vMtVCoMY103o9eFdU1bJhsPcAXPFkNLvJZk5
         huOofRTBnwocjbSiHIVf4aPuKxGY40Xpae2MJ4JAhvoS7oiqjL+qRMpLzXw8QTHZzp9B
         YoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764317445; x=1764922245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2bFlIh8I9NZQcRpDPD+Djsorg8bRceb3xQr+grKSRk=;
        b=r55jkeshbGIBx2qx39c8Q5gYOCCZl2XWr7s8w30rBWGha/49T63lGHsURuq79Nh0bL
         Pvzj5c4/xZ8sHcHANrai5eJ94MSt/S/aUv5bMZ8kU8nJrzSIcAfc2Yu3jZQaIZBI+Dh7
         KYD46z9qeq56GWaMArpqN29DEZfbkNBR3EOGp7yOzDl0Z6D5l2Du3DAYMxfO3/wZIynh
         w9wCw14l/TeGs+HMjt/Uxso5SwwmmiT7z337/W0okPEXW8geuM8Ama5GVU1qzAPNn080
         NT/85KTSwZ/sOeSETu53KlWSAGnedqwiWz4w4Enx68YxLrg2SFQWW+KdgSR92j35K5qv
         sgGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1kafAGUwE1j+IhQrqBcVBl5HYt7hDtKRDbIn6TCYoIb2K3geCO1HOHOezThALltHC9IRZ9/p2zDtjxhO2Qro2@lists.infradead.org
X-Gm-Message-State: AOJu0YxIbytVgzikUweQKVjbLMv2ROjEhDYczLs0l9avHd9ccCjZHK1U
	PCKDpTYUMRIrz5VGTpr2PN78CjYHF2oc8qm2QHKLoJLhO63q9CtPkljppoMFOcsccJw=
X-Gm-Gg: ASbGncshuB9keHbHI+iBEnQngn5UjJBHtokpL/1qIsVRlP/7iUU26drs8OBsuOvh6PF
	R/9DUEPXJ1hgbdobZcXeqK1UwMOtoQpmBy8i3RjCu6iL6lcdgQ5Fj45JZZhh4wVNd64vCYr08mc
	bo+N7nxkSgfsJ7p7mpH5MDawPcl94tJ+pUodTlbpLyNMp2a3R8yuRJfWOh2vdUlzpPVHkuCKPd3
	152F66ZbjVtffNPnYlPmZaKFajVBieXyXENBe9ZLjfPOqSpC2vIA6ZYtby9OIv1gBpXwwrFIr60
	lF4O/eoCTdTgKaedroJ/yGlmJRq2WBmX7WfT6PDRzIYFrmioloI81e0+ftSz3+fJXvGNkO3lcZA
	BPmvN927V0F/3Le+6okUNFGUntntK1Dla3xB9y6xOudbVEi0UtK+GaMdXaDtZ2aCYt4M+jf8wKE
	jAZRN94c9yTjD/WCe7
X-Google-Smtp-Source: AGHT+IHVNGxLHdQSfNonRBBq78f347/I8I+ulkCPlaTONnGVXYiUFj038obXmFsDqBT8iAGXzvuP8A==
X-Received: by 2002:a05:600c:1d1d:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-477c01ec3f5mr247354265e9.33.1764317445111;
        Fri, 28 Nov 2025 00:10:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47911143bb6sm83247115e9.3.2025.11.28.00.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:10:43 -0800 (PST)
Date: Fri, 28 Nov 2025 11:10:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 06/11] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <aSlY_w-nXA38PrBO@stanley.mountain>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_001047_605724_185BC63C 
X-CRM114-Status: GOOD (  14.62  )
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

On Wed, Nov 12, 2025 at 09:16:52PM +1000, James Calligeros wrote:
> +static int macsmc_hwmon_populate_sensors(struct macsmc_hwmon *hwmon,
> +					 struct device_node *hwmon_node)
> +{
> +	struct device_node *key_node __maybe_unused;

The for_each_child_of_node_with_prefix() macros declare key_node so this
declaration is never used so far as I can see.  I thought Sparse had a
warning where we declared shadow variables where two variables have the
same name but it doesn't complain here. #strange

> +	struct macsmc_hwmon_sensor *sensor;
> +	u32 n_current = 0, n_fan = 0, n_power = 0, n_temperature = 0, n_voltage = 0;
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
                                                       ^^^^^^^^

regards,
dan carpenter

> +		n_current++;
> +	}
> +
> +	if (n_current) {
> +		hwmon->curr.sensors = devm_kcalloc(hwmon->dev, n_current,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->curr.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "current-") {
> +			sensor = &hwmon->curr.sensors[hwmon->curr.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_C_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_C_LABEL;
> +
> +				hwmon->curr.count++;
> +			}
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
> +		n_fan++;
> +	}
> +
> +	if (n_fan) {
> +		hwmon->fan.fans = devm_kcalloc(hwmon->dev, n_fan,
> +					       sizeof(struct macsmc_hwmon_fan), GFP_KERNEL);
> +		if (!hwmon->fan.fans)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "fan-") {
> +			if (!macsmc_hwmon_create_fan(hwmon->dev, hwmon->smc, key_node,
> +						     &hwmon->fan.fans[hwmon->fan.count]))
> +				hwmon->fan.count++;
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
> +		n_power++;
> +	}
> +
> +	if (n_power) {
> +		hwmon->power.sensors = devm_kcalloc(hwmon->dev, n_power,
> +						    sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->power.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "power-") {
> +			sensor = &hwmon->power.sensors[hwmon->power.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_P_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_P_LABEL;
> +
> +				hwmon->power.count++;
> +			}
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
> +		n_temperature++;
> +	}
> +
> +	if (n_temperature) {
> +		hwmon->temp.sensors = devm_kcalloc(hwmon->dev, n_temperature,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->temp.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "temperature-") {
> +			sensor = &hwmon->temp.sensors[hwmon->temp.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_T_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_T_LABEL;
> +
> +				hwmon->temp.count++;
> +			}
> +		}
> +	}
> +
> +	for_each_child_of_node_with_prefix(hwmon_node, key_node, "voltage-") {
> +		n_voltage++;
> +	}
> +
> +	if (n_voltage) {
> +		hwmon->volt.sensors = devm_kcalloc(hwmon->dev, n_voltage,
> +						   sizeof(struct macsmc_hwmon_sensor), GFP_KERNEL);
> +		if (!hwmon->volt.sensors)
> +			return -ENOMEM;
> +
> +		for_each_child_of_node_with_prefix(hwmon_node, key_node, "volt-") {
> +			sensor = &hwmon->temp.sensors[hwmon->temp.count];
> +			if (!macsmc_hwmon_create_sensor(hwmon->dev, hwmon->smc, key_node, sensor)) {
> +				sensor->attrs = HWMON_I_INPUT;
> +
> +				if (*sensor->label)
> +					sensor->attrs |= HWMON_I_LABEL;
> +
> +				hwmon->volt.count++;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}


