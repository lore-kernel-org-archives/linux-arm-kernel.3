Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0779BC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 17:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YmZh6k4S4A2gKPdCb+Hixcu2ZSXle/HXIt3s9AusCA=; b=ytBjNWyacKo3XGHqYLzMZ+DjNN
	GYESiEpdS2Ae2R3S/qe1ibLRCnEsAAtMnDb011EY+ZaLRDiVHTASFDIX5wdIYANbXKPi334SwFoB4
	HfoqG/aqvszXqwBNdHBOnLAeGj4d1aE+o+/HLVl2BmMZ43OWKj6JACLL1MUo+rNpIu2N2qIcsx064
	FdKFIuW9ni+foIIDwVXXiGo+3QvTGI4xLBl3OAUOOSe/B+kn4mSLebWjDu0KXYsadXqmndaQe4toh
	UzDISw/urW7venksXEKi7SF1huCEqmvG7SLD2SycGn1ZAX48TL+AFWKk6dKWJfDUDA+vvz8R4MVK6
	s8ixi9wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01r0-00000006kue-25mY;
	Wed, 02 Apr 2025 17:26:18 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u01pE-00000006kZr-1ItS;
	Wed, 02 Apr 2025 17:24:30 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so293846d6.0;
        Wed, 02 Apr 2025 10:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614667; x=1744219467; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YmZh6k4S4A2gKPdCb+Hixcu2ZSXle/HXIt3s9AusCA=;
        b=SzXlIz0epKWeRxuKl0qoD98/PWJ17GGgyG9hsr2+qHoMjylcQI3M7CRrVAEpX31nb7
         cFxTW+/ncMq+YGf8vPMMNOFjEcy0gvjIZzyf1P59RZwAFvDFT+Cf9+onpGmSjGvkfeU7
         S5aFxM6PiS7ehW5KbOGKekT3FqJ5kY4bzeJMhgsgzhlDGarjlfVajGhfXlsPNaPdb1eQ
         Ojo3K+tQUJ+cqYdLnv6MqW9xLS8Rt2rAe5rgIagpU7v1rWiAt9V+X101R9wqyBIiH9+3
         aDRnlzouy+qnhSBoaOXVFUnW11NqQpzvtbZWUKdzkGP58S1wHvEx3FnQH0eOWbfZzv8E
         xuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614667; x=1744219467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YmZh6k4S4A2gKPdCb+Hixcu2ZSXle/HXIt3s9AusCA=;
        b=okN5SAdTT7xEvuA521lpNfyPQcscgSsazgvBQbTxAqeX4L3qExE0qNDRVj7bTdqP3R
         SnLLgUyrUhOPWi3mIVvFc3LoSPn90X8zbA/5GVFdYq12zRTvLAt1bc2ojxck20NTceqQ
         GwQ47hiCU39oWiBxhXN8Btbifmxi4NrIGf2Hk+1XIpiiOU5LjdglxwX/QzDOfXJVVUuQ
         5/+UgvSbhXhII/J1lJvuJLzNmk9n/Z2KfNyMvXc7QbwZY9FqLAomR0x+QYJFKt3Fp1PI
         3nIZGdcOY6ZT2w1DV64e5auyqdsa4660Qp9EJ6DVWE0ZMhHg+WrFfyYYouT5xbt2nBH9
         Zx7w==
X-Forwarded-Encrypted: i=1; AJvYcCX+1sTTVYxS/uMRE3HI/uGQSP0yycPb0UiVFJpC6dqlGkn2vNsxQ4hWRXl8EIZ3M4KKUM6xwo4KbpyX2bbZL6i6@lists.infradead.org, AJvYcCX8ubzfDKt5rAMt7Ik1q2yQBpMZzsgbhEdQknPPXVSuRqg74FvoouYZYqIKuODuiOVnBFVBy67HPdUNGIEg/Q0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3rMtSUMrN2SiAz6Ncfzyq1a9PFAAT1lKShMCcLW9uTv0xTnpC
	1yJHv+kbf/eqt/zufgDHAHiMoZ1kcYYcZfG7co75wMq4+x5/QUE=
X-Gm-Gg: ASbGncsqk6x+dw1pikKenu0k+cfngaJF/+j8V35RCDNvVYqGC9D3jVH6tafEm99SmU3
	A4960NexOsoZHIDXAlbEoN4kWTGJziv/pzIxuWYpdHS6nY6GDgkNXUjksl39av9s5WL7sK5LXmr
	TAzIAJU9UJxqtewpYH+xFRKREq8kl/weJCTOiLC0qJ0s+L986HhkoZ0a/mgtchTfGORY/5rZS+d
	ekYtDan74W6TSCLzEY/ZKFfUfYM8pMTZgskN8c/9ct3F8kuCdzOGdXmDQVoF35zwfSqP3Y76pZ6
	IV5pcUf93/nL4m6I/CGIXTv/qZrxsyhv602pSQ9BXVZWMLeGQNIYvA2JxrO6k9ziuiy+WEY+Dwx
	An0ot1I9DpXPh
X-Google-Smtp-Source: AGHT+IFMVDYLTn3P+AqF4w5EM6NFHR4DM/rUbBAs9Vcoe+DJhPsyf1ed5wxi6pxvZTB9jpF+/uNqvQ==
X-Received: by 2002:a05:6214:258f:b0:6e8:f770:5045 with SMTP id 6a1803df08f44-6eed6271744mr284133846d6.28.1743614666448;
        Wed, 02 Apr 2025 10:24:26 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:edfc:c609:ae5:4b2c? ([2a02:810b:f13:8500:edfc:c609:ae5:4b2c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9643d6asm77042556d6.28.2025.04.02.10.24.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 10:24:26 -0700 (PDT)
Message-ID: <680a40a8-07c1-4dde-93b2-337ab15f7afe@gmail.com>
Date: Wed, 2 Apr 2025 19:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] drm/rockchip: inno-hdmi: Convert to drm bridge
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
References: <20250402123150.238234-1-andyshrk@163.com>
 <20250402123150.238234-8-andyshrk@163.com>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250402123150.238234-8-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_102428_355965_844D599D 
X-CRM114-Status: GOOD (  20.12  )
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


Hi Andy,

> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - First included in v3
> - Link to V2: https://lore.kernel.org/dri-devel/20250325132944.171111-1-andyshrk@163.com/
> 
>   drivers/gpu/drm/bridge/Kconfig                |   7 +
>   drivers/gpu/drm/bridge/Makefile               |   1 +
>   .../inno_hdmi.c => bridge/inno-hdmi.c}        | 924 ++++++++++--------
>   drivers/gpu/drm/rockchip/Kconfig              |   1 +
>   drivers/gpu/drm/rockchip/Makefile             |   2 +-
>   drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c | 187 ++++
>   drivers/gpu/drm/rockchip/inno_hdmi.h          | 349 -------
>   include/drm/bridge/inno_hdmi.h                |  33 +
>   8 files changed, 741 insertions(+), 763 deletions(-)
>   rename drivers/gpu/drm/{rockchip/inno_hdmi.c => bridge/inno-hdmi.c} (52%)
>   create mode 100644 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c
>   delete mode 100644 drivers/gpu/drm/rockchip/inno_hdmi.h
>   create mode 100644 include/drm/bridge/inno_hdmi.h
>

...

> +#define m_RX_DONE			(1 << 0)
> +
> +#define HDMI_CEC_TX_INT			0xda
> +#define HDMI_CEC_RX_INT			0xdb
> +#define HDMI_CEC_BUSFREETIME_L		0xdc
> +#define HDMI_CEC_BUSFREETIME_H		0xdd
> +#define HDMI_CEC_LOGICADDR		0xde
> +
>   struct inno_hdmi_i2c {
>   	struct i2c_adapter adap;
>   
> @@ -68,41 +395,18 @@ struct inno_hdmi_i2c {
>   
>   struct inno_hdmi {
>   	struct device *dev;
> -
> +	struct drm_bridge bridge;
>   	struct clk *pclk;
>   	struct clk *refclk;
>   	void __iomem *regs;
>   	struct regmap *grf;
>   
> -	struct drm_connector	connector;
> -	struct rockchip_encoder	encoder;
> -
>   	struct inno_hdmi_i2c *i2c;
>   	struct i2c_adapter *ddc;
> -
> -	const struct inno_hdmi_variant *variant;
> +	const struct inno_hdmi_plat_data *plat_data;
> +	unsigned int colorimetry;

thanks a lot for doing the bridge conversion for this driver.
Please keep the custom connector state which was introduced after Maxim's
review during the last rework of this [0] driver. The colorimetry is not
part of the device, but of the connector and thus should not be part of the
device struct.
It's, however, likely that the common (hdmi-)connector framework will once
hold its own colorimetry property and then the custom connector state in
this driver can go away, but until than we have to keep it here.

Thanks,
Alex

[0]
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ceeb0f0104a62c867656c2730a51df47e7350b8f


>   };
>   
> -struct inno_hdmi_connector_state {
> -	struct drm_connector_state	base;
> -	unsigned int			colorimetry;
> -};
> -
> -static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
> -{
> -	struct rockchip_encoder *rkencoder = to_rockchip_encoder(encoder);
> -
> -	return container_of(rkencoder, struct inno_hdmi, encoder);
> -}
> -
> -static struct inno_hdmi *connector_to_inno_hdmi(struct drm_connector *connector)
...

