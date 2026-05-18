Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE4DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 22:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HvAeM3G6bmkfm6f0wgfGcfgEROVq1lUgw+e1xbuFGjg=; b=srO//VUR9+Ot73vu+6LyBdC4JG
	x1emeU0UiCDZLtUiqIlcj/xI5mwF0U5zMy112rEzJ1podPcemxbUozSszqfxrCvNCfwQK/T8VkHZo
	fe+Vjp6EEaylc1kblyQTorm0dxHbytwHDX90Gf8ne8hF6FmGYo0Uwi0KbscZR+DrSpxokZ7TgKAu9
	DB47mJXJjSc2cxoBZPK1COIuX/2Crf3GmwN7sY1oTNa/6JKqzXFXwYK2+tlzNNeecu607IAc0OwVX
	9CsdiebJAdGCUyuC321mFZTIksCeeYpC2IHK2YlnsT7cUHVhDLULU/jLIKFTkVwWNY3RymkymMg20
	LTnwI1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP6Hl-0000000H4lB-1Rjn;
	Mon, 18 May 2026 22:18:05 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP6Hi-0000000H4kB-0FiG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 22:18:03 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2f7020a928eso4072456eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 15:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779142681; x=1779747481; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HvAeM3G6bmkfm6f0wgfGcfgEROVq1lUgw+e1xbuFGjg=;
        b=fYjFhCDtYFEx6aAkz1RpcQDOE9nAPmdSwU4RdkIWDmXaaYgfzN7Ep7ZCV7X6yYdDLw
         eP8zwn8+A8iXAnXLqlPCox85HgnY7qcNQUK39DDQU1AJllLL24BiwGtTppP2/L8ht5XX
         g0hsoWqwCpHKLv2WrEfvqLDZGhqhIf5JIKmNZukpEx+n7aHNSHGxZ0DYNzX33ijnJrFq
         uop0VIG2Rljf3AgvyufvcxBsHI4b/uXzUB9lfK+G2wqMlIThNALfRV3bix6pQ9d2QrJI
         kqYNHMQtjgHS443w6+o0h7+kDcm/YyStC3VAYEeZN3hRoDhAJZ7mNzb6Nuon6qjFb8rb
         sUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142681; x=1779747481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HvAeM3G6bmkfm6f0wgfGcfgEROVq1lUgw+e1xbuFGjg=;
        b=GwJjiPouGnorwMMIARkrvVliDIHn1CHgsY5rIUvNM2TwEVLCSq8aV6vkLv9ef4Qg+s
         VLPMP1rps/iqmEKIzyVeCdrcICPY/HHlPMH/em3ChqyLH7Ocl5sTregYnwZjrrD2b3rX
         aG45owVrztb3OoxPOaBQat9SD7PC2C1o2rO3eSi/B9jzZXxxP2yUo8axTUVyb41fS4UT
         dBmJwsgGhMXl6c0te3mlFAV+9oStkZKX8afGSb3vSRvIBfQeQc4e8nZAiV35KOYieicZ
         zyQ+OHQRcGddVfln3T34Mb1E5HELvzod2E8A0PIzmNDigRm2WJ38QLjOp2acyu1JTFN+
         ZFwg==
X-Forwarded-Encrypted: i=1; AFNElJ8vNHF3wcn48FKnsF4/CoW0tIgaWImpOvClPg0BJX/DZNYiDZCnKwedIJNNdEGtiSVzJCEiVYxCXHABxpNER7An@lists.infradead.org
X-Gm-Message-State: AOJu0YwObc077K+vrb5Ey23lrOwqLWCEXbCL2DuA5R7nvALSMWUXzUF6
	ZeM7cuznMECOsBUU3acsxY0Tu+C2BbY/kHLG3iUXCi3++RZHccGg/yVY
X-Gm-Gg: Acq92OGJw28Ve6XoYpqLtBMmewpIUuDVeDhP4bkP69gEFv9Z9Os37WFhMBXGcRVFlso
	FpEXsnJoLHI4DaSATjayFEPNUofP9qYv3HaCTyFjOAj8VtDEbRwrKc+pBt6sYmz26gRTBCnFcsf
	3YaCHJYmBtkDpqQZ1jdE75l5Bo+7hT1MZgggjWzoDwFBPRFz6xEBia4FaRTG5zbjtvyEbiiDu+1
	vQTrsir65GUU7wNoWn+Rnes44VTjUcONLPEPcU88lVwvlkEPu26X/7+CL/i5J9u/eFM3EXTOVie
	jBmqXGu8Q8avyX0nN74TUh4c5nNUt7bXCb2ckEQoNOJNMIn03uWiiA1YP6DaB0DQEqVEB+OQyWU
	qUpC2JTOSEPTHUZD1INJxr1Gl5jfukO8b8wn+AXBQ6SWlxEj38Hs08ZvKjgmmtVt0CllkGt3D/l
	eenZfhQ7wQV5f96hecNdtAZ31O2C6Kk/JJwovJSf6YM/s9Ixw=
X-Received: by 2002:a05:7300:fb83:b0:2ed:2942:34ab with SMTP id 5a478bee46e88-3039818afb2mr7606381eec.3.1779142680596;
        Mon, 18 May 2026 15:18:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6c3sm18171998eec.19.2026.05.18.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:18:00 -0700 (PDT)
Date: Mon, 18 May 2026 15:17:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: bcm2835: raspberrypi-firmware: Add voltage
 domain IDs
Message-ID: <a3eba071-d969-4498-baae-77cee9b2ed78@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-2-chakrabortyshubham66@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_151802_100113_F1D04085 
X-CRM114-Status: GOOD (  19.84  )
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

On Sun, May 17, 2026 at 01:34:43PM +0530, Shubham Chakraborty wrote:
> Add Raspberry Pi firmware voltage domain identifiers for the mailbox
> property interface.
> 
> Also add the voltage request structure used with
> RPI_FIRMWARE_GET_VOLTAGE so firmware clients can share the common API
> definition from the firmware header.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

I'll need an Acked-by: from a maintainer to apply this patch,
or some other maintainer will have to pick it up.

Thanks,
Guenter

> ---
>  include/soc/bcm2835/raspberrypi-firmware.h | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
> index e1f87fbfe554..975bef529854 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -156,6 +156,31 @@ enum rpi_firmware_clk_id {
>  	RPI_FIRMWARE_NUM_CLK_ID,
>  };
>  
> +enum rpi_firmware_volt_id {
> +	RPI_FIRMWARE_VOLT_ID_CORE = 1,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_C = 2,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_P = 3,
> +	RPI_FIRMWARE_VOLT_ID_SDRAM_I = 4,
> +	RPI_FIRMWARE_NUM_VOLT_ID,
> +};
> +
> +/**
> + * struct rpi_firmware_get_voltage_request - Firmware request for a voltage
> + * @id:		ID of the voltage being queried
> + * @value:	Voltage in microvolts. Set by the firmware.
> + *
> + * Used by @RPI_FIRMWARE_GET_VOLTAGE.
> + */
> +struct rpi_firmware_get_voltage_request {
> +	__le32 id;
> +	__le32 value;
> +} __packed;
> +
> +#define RPI_FIRMWARE_GET_VOLTAGE_REQUEST(_id)	\
> +	{					\
> +		.id = cpu_to_le32(_id),		\
> +	}
> +
>  /**
>   * struct rpi_firmware_clk_rate_request - Firmware Request for a rate
>   * @id:	ID of the clock being queried

