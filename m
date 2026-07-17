Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F10C44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 01:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1uPNpnjtf15pOqkeyn/OTIVkD0Q5Q/QxgSoCVuNMeg0=; b=wtP4Umbh00GRql1wx/dt2DWgpX
	ULt/jzjNam43lqyboRKxd0lM0dCWitkHD1vYeiqf2m0OD8hLkdbc3jKbw9mDrUxBGcD53LjXNNZrM
	qKfe6WccKK+ay5sr+W43Zci2L29LV0eNto6JzaTjCE5v61q93ijkWeBpmDupjFnG5qYiG3fTqJm8c
	j+bs+BEI6dkhM8dyQCwqJhK9yNW3tRz+CaR+ZXIBcrAFfg2Ruk6ZxGd/WkWE+vesLnZkl1EJjyGV0
	A6nYGKXT7NP+nNtaNY9Hd8IieYmV0PgVpyVRNDfqLPb7RPlJvaSuCj0IwXo/bYPPrzIK75If1699P
	q6ASlrlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWW9-00000000qTf-3m5i;
	Fri, 17 Jul 2026 00:33:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWW7-00000000qTJ-3hKi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:33:29 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2ceaf8a1265so67398635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784248406; x=1784853206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uPNpnjtf15pOqkeyn/OTIVkD0Q5Q/QxgSoCVuNMeg0=;
        b=Za8d8sySNHTarE+BXqbE35z6sKZ4YWDezksgXdSS5QyqzfZI5TKh3XoXr7zd4eicbV
         l9wzrpnaEW21mvLl2knb+RBKl72BNMv+mmqPMX6t3Z4DProkR4ICNtzXrZ4k0VTFZPh5
         HubFZQuEJhRibhiiELXMCffd8EhlLNanE+ulL+NKb76xNnr6gBnQZKmCAtK6mDQaqgVR
         iPeU9fO0eAOOWoeePiSUGt8z/niFbegm8o6xkon+RPAzVqD+IwN4Ysnm0ISRRZy9iPeW
         C0+fJkF43D5nX8yVJHiWSEE78xLjc5MhKS8btiAnFhiN21TKEIjUSfTVb7foyZMpyqKL
         FSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784248406; x=1784853206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1uPNpnjtf15pOqkeyn/OTIVkD0Q5Q/QxgSoCVuNMeg0=;
        b=VRg84YuJNyDJeVayzN/1NK46AnoPlhgSqQdKoHx/RpEKbT67ddrt2N95KD6heHhkqE
         Cn/2qIFo1XzLp1sd3om8ViNuTEmq+x80lSWjgZk9tBLmRX/185QEArl7RxAU0NprRNtW
         sUznn2VMvdd1hxf/jwg7VaqvoDwf2E1mRWm+UDrU0+Pz4KWzSxlcZ6EO4p7en3UwfkJh
         ThXM7PR2Mz1ieVCYDHMBH/425xZTYs5s+a3HA3IdQrEaZkePIxHFWFcrFPksVo4LWV/z
         FN0NS7PQjHdOq/uDR24BGzlgwYGBIrAObnSlkxAy7IpzWqT/+pS+fmaUdT75yWzVddTd
         9BiA==
X-Forwarded-Encrypted: i=1; AHgh+RoKwAthrFhbEznA/Th2RkrcSt1qrNfixV6viDnIDDuWx5BvO/UDdpUd/PRtAg8bKa0RGh0NuEtCR4fzOLxdnB6P@lists.infradead.org
X-Gm-Message-State: AOJu0YwtfRVcSxWn70us8IqqLaIih7ipC6bwWCBRS4rh599Ly+Cc6HAT
	nKH1O4xnPJGdHcBa8QRnRhWljsbcFflXoAROG/gutcf0apV1tTvCBuso
X-Gm-Gg: AfdE7clXzS3Wvlxz5Lh65ob2utMfpBS89R9dDhBn+HBTg9KEW3Yoc3B/SZjFWNvXhgW
	57HdkKrgLOiIXOGMTzigoek9ApKCx+o1oG+jZ6zy0Knzhi2Ju5K2K9tVIGelBAb7TG6baKJt/iV
	0BIZDA6dqnnXkB3/p7gcoQrQPWO+gR5ivb9yISwhK8slepyOsyPkpLPCx6EqjIqYmugbc8Z9ccq
	EVo42aQ1+u3n6/Cf4Xv3KA1MTmm/C0EEaqpr4Dh/BcGTYhnPo4DZub+DgfKLUS5abzD8FloTU8+
	f7TBGKneIajoWXavJp16A8s+FX6CzhEl4uQmb10JpoFp1VX0MRcXQQbo/ZWMWKkxvihMz/SLBJn
	wTaj8n9sJD4aKm3wCVckT7pAeFH1Oih8EDm9+P6WXQhQCx5yKApFhXa6tbeBkRElq8iI/SV3KiB
	8UG7GRE3Kg3PvGxVueYL08X2iI4356erRUQ6k6/a9cpo9X8vP2iEx5yw==
X-Received: by 2002:a17:903:3807:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2cf349175f9mr3229355ad.21.1784248406238;
        Thu, 16 Jul 2026 17:33:26 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344f4481sm1139735ad.32.2026.07.16.17.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 17:33:25 -0700 (PDT)
Message-ID: <c95a8d31-f84a-471c-b216-f4cac5faf464@gmail.com>
Date: Fri, 17 Jul 2026 08:33:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 cwweng@nuvoton.com, Trevor Gamblin <tgamblin@baylibre.com>
References: <20260617025925.2539334-1-cwweng.linux@gmail.com>
 <20260617025925.2539334-3-cwweng.linux@gmail.com>
 <alj1UapHAq9f_MiF@monoceros>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <alj1UapHAq9f_MiF@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_173327_961644_1FAA6957 
X-CRM114-Status: GOOD (  21.76  )
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


Uwe Kleine-König 於 2026/7/16 下午 11:29 寫道:
> Hello,
>
> On Wed, Jun 17, 2026 at 10:59:25AM +0800, Chi-Wen Weng wrote:
>> +#include <linux/bits.h>
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/math64.h>
>> +#include <linux/mod_devicetable.h>
> Please don't include that file, <linux/platform_device.h> should pull in
> the things you need from that file.
>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pwm.h>
>> +
>> +#define MA35D1_REG_PWM_CTL0			0x00
>> +#define MA35D1_REG_PWM_CTL1			0x04
>> +#define MA35D1_REG_PWM_CNTEN			0x20
>> +#define MA35D1_REG_PWM_PERIOD(ch)		(0x30 + 4 * (ch))
>> +#define MA35D1_REG_PWM_CMPDAT(ch)		(0x50 + 4 * (ch))
>> +#define MA35D1_REG_PWM_WGCTL0			0xb0
>> +#define MA35D1_REG_PWM_WGCTL1			0xb4
>> +#define MA35D1_REG_PWM_POLCTL			0xd4
>> +#define MA35D1_REG_PWM_POEN			0xd8
>> +
>> +#define MA35D1_PWM_CTL1_CNTMODE_MASK(ch)	BIT(16 + (ch))
>> +#define MA35D1_PWM_CTL1_OUTMODE_MASK(ch)	BIT(24 + ((ch) / 2))
>> +
>> +#define MA35D1_PWM_WGCTL_ACTION_MASK		0x3
>> +#define MA35D1_PWM_WGCTL_ACTION_LOW		1
>> +#define MA35D1_PWM_WGCTL_ACTION_HIGH		2
> If you make this:
>
> 	#define MA35D1_PWM_WGCTL_ACTION(ch)		GENMASK(2 * (ch) + 2, 2 * (ch))
> 	#define MA35D1_PWM_WGCTL_ACTION_LOW		1
> 	#define MA35D1_PWM_WGCTL_ACTION_HIGH		2
>
> you can drop the static inlines below.
>
>> +
>> +#define MA35D1_PWM_WGCTL_ZERO_HIGH(ch)		\
>> +	(MA35D1_PWM_WGCTL_ACTION_HIGH << (2 * (ch)))
>> +#define MA35D1_PWM_WGCTL_CMP_UP_LOW(ch)		\
>> +	(MA35D1_PWM_WGCTL_ACTION_LOW << (2 * (ch)))
>> +
>> +#define MA35D1_PWM_CNTEN_EN(ch)			BIT(ch)
>> +#define MA35D1_PWM_POEN_EN(ch)			BIT(ch)
>> +#define MA35D1_PWM_POLCTL_INV(ch)		BIT(ch)
>> +
>> +#define MA35D1_PWM_MAX_CMPDAT			0xffff
>> +#define MA35D1_PWM_MAX_PERIOD			0xfffe
>> +#define MA35D1_PWM_MAX_PERIOD_CYCLES		(MA35D1_PWM_MAX_PERIOD + 1)
> This is irritating with similar names and different values/semantic.
>
>> +#define MA35D1_PWM_NUM_CHANNELS			6
>> +
>> [...]
>> +static int nuvoton_pwm_probe(struct platform_device *pdev)
>> +{
>> [...]
>> +	nuvoton_pwm_init(nvtpwm);
> This clobbers what the hardware is doing. The idea here is to not modify
> the hardware settings at probe time to keep e.g. a backlight configured
> as it was setup by the bootloader and only modify on explicit calls to
> .apply().
>
>> +
>> +	chip->ops = &nuvoton_pwm_ops;
>> +	chip->atomic = true;
>> +
>> +	ret = devm_pwmchip_add(dev, chip);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Unable to add PWM chip\n");
>> +
>> +	return 0;
>> +}
> Best regards
> Uwe

Hi Uwe,

Thanks for the review.

On the include, I will drop <linux/mod_devicetable.h> as
<linux/platform_device.h> already provides what is needed here.

For the WGCTL helpers, I will rework this to avoid the extra static inline
helpers and compute the 2-bit action field mask/value locally when 
configuring
a channel. The WGCTL action field is 2 bits wide, so I will use the bit 
range
[2 * ch + 1 : 2 * ch] for the mask.

I will also rename the maximum value definitions to make the semantics 
clearer.
The intent is to keep PERIOD below the 16-bit register field maximum so that
CMPDAT can be programmed greater than PERIOD to generate a 100% duty cycle.

Most importantly, you are right about the probe-time initialization. The 
driver
should not reconfigure CTL1/WGCTL for all channels during probe, as that can
disturb a PWM output already configured and enabled by firmware, such as a
backlight.

In the next version I will remove the controller initialization from 
probe().
Instead, the driver will configure only the channel being changed from the
.apply() callback. The disable path will only clear POENn and CNTENn and 
will
not touch the waveform/control configuration.

Best regards,
Chi-Wen

