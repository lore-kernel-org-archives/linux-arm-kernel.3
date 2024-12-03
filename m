Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEEEE6C611
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/nDXf9cEZNcrU2bKSXIPLr1H7Y3bQK4ZXvIbat3oFo=; b=fR5y+QEMrgVkIlRj21sqFPfaHn
	AxvYfcomNla3zVgdfmF6cu8IjRFZenA/vM0XVo2SjxWZJaL0JXxorlJRWhHcj1Q2uzQs1h1Os9BRn
	ssr/oZ9hAy6I7RjCVnG6prOsdFJA1d+2n0yY4ffHq5X9uF6D95LXSpg5o5l0j84CC4fonWnqz3t3c
	IVITjtGu4LVJyGNUYRj1/zLlqTFZ2CuPwUalamtjo1Xg128eJeeA5ev9BGZywkEzjpbbJ9SQ8U9b9
	hE3dY4RCKvoee3KDEBTuJ30Pg8gy7X3FzpNDZsbYrP+7+RQIptik3r7aBORb9R5Ysg8I0LijEGu6T
	iO79/U2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tINT8-00000008XvE-0iyb;
	Tue, 03 Dec 2024 07:37:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tINRx-00000008Xif-43L2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 07:36:03 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385de9f789cso2784185f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 23:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733211360; x=1733816160; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F/nDXf9cEZNcrU2bKSXIPLr1H7Y3bQK4ZXvIbat3oFo=;
        b=Yjfat8z77n/ePZdIbPapk0Y268Q0sSktWojQp3drrRl3TWp/cLgfyrUXpzWEbgJlKa
         8u8EXEUR8Dx2vzEsN/gVFUM4ktCHyxq2pAMpQ0TSFfHt7ofrL0WiuclUrKFzdn06f7AP
         H3MbRpWdM2E4aZRX7RHvDlBsCiArcMPfFPAuVze/EN1hXtC2ERxtQxrBj9PzrV4R9tDC
         T1M760Pm7v5NUADzzJbkRKxQpLRhDEuPLMlZCGNeZKp35EJ5XdnKdIkJg0tzp70l2DLy
         MIWSYqcGLOb01ZDi0kl3XmhsDPZ7VKOu7chXuL+PRqcCy/yF4W+fQtsYhaAUYJyBe1PW
         7Pbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733211360; x=1733816160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/nDXf9cEZNcrU2bKSXIPLr1H7Y3bQK4ZXvIbat3oFo=;
        b=f1Db3svh/SOf6biRbOgYPn5z99JhvCyWW9xYKsLnw+crZKg86jAaqmUonznantTss3
         n5vNglsCormcHlNX8WgbQDpW6i9ct51fz5Wa8KcumcaDUmJ7I9iADStp8t61002V7VSG
         nIy0rl7ee0q/Vsm56pAoeK+nTrzDAWpxI+FWHqhBBueJOHReipuw9XPbh5uZMov8XgHu
         XfHDlSu6fiM3BoO3IlM3nfapj2X4klPvx/I/FnUdgr6eEKnSGPOdyNAvF9mwP9SvhKi7
         K91HQYwXQ50zsMVegTbK0n4jxNSb1mRqS/jVZmFoCcKyJSKzJM+Kc63QRaW86m/M+fI0
         NCCg==
X-Forwarded-Encrypted: i=1; AJvYcCVhaXEi5j77DPnPH2x5F9q/4TdDnIFoUOvQ6V3OVMHjwE1QpoNpvOJCRlsmQd/kyvgdIMiTIaHsq77eNC9g/yeg@lists.infradead.org
X-Gm-Message-State: AOJu0YwiBxgYJdc4+D9yzcV668DU7+j59cq7fS2f209i0IYhsBf6334G
	LgFAimjtM8gR/DJbh9+GoUHOX6vFil2tqBhY0xrJoIAXwNw2JGJe
X-Gm-Gg: ASbGnctBzhvWtjaOFwcagU1btPf7qbT/e1fwSGooLoR4tZ6aEsYkLb5gVGss/0YZXb+
	ulNxN0c3FjEkVEczTCX3OhiCZp/GN8rvnYtYXucbzcOnLzPUxRCmQFaDTpTcF/Ivh0xiWUt4rDD
	4ECEyFd7RDLik/frnS7j24dwDvUrDHh/XAT4xxeWoTMdYGCvJUlzw/DIUVUgHj/IikKFyveXCJn
	PTAfqPznX96/a+fgZtu4noEYSo99JsSFy3/TExkAJ17tw==
X-Google-Smtp-Source: AGHT+IH3MGbhTuI1FbARZl3vLVS1C9R/JP4x30AOvtcPiId8Pg7qUuDnHa1haYpOhfTLgsrRi8Fy+Q==
X-Received: by 2002:a05:6000:1446:b0:385:ee3f:5cc6 with SMTP id ffacd0b85a97d-385fd4395c7mr1016165f8f.58.1733211359516;
        Mon, 02 Dec 2024 23:35:59 -0800 (PST)
Received: from debian ([2a00:79c0:61a:d00:767b:89df:6940:5136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e8783843sm8848706f8f.4.2024.12.02.23.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 23:35:58 -0800 (PST)
Date: Tue, 3 Dec 2024 08:35:56 +0100
From: Dimitri Fedrau <dima.fedrau@gmail.com>
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
Message-ID: <20241203073556.GA3936@debian>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_233602_005919_AB22C0E5 
X-CRM114-Status: GOOD (  25.36  )
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

Hi Antoine,

Am Mon, Dec 02, 2024 at 02:07:15PM +0100 schrieb Thomas Antoine via B4 Relay:
> From: Thomas Antoine <t.antoine@uclouvain.be>
> 
> The Maxim max77759 fuel gauge has the same interface as the Maxim max1720x
> except for the non-volatile memory slave address which is not available.
> No slave is available at address 0xb of the i2c bus, which is coherent
> with the following driver from google: line 5836 disables non-volatile
> memory for m5 gauge.
> 
> Link: https://android.googlesource.com/kernel/google-modules/bms/+/1a68c36bef474573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
> 
> Add support for the max77759 by allowing to use the non-volatile
> memory or not based on the chip. Value for RSense comes from the following
> stock devicetree:
> 
> Link: https://android.googlesource.com/kernel/devices/google/gs101/+/33eca36d43da6c2b6a546806eb3e7411bbe6d60d/dts/gs101-raviole-battery.dtsi
> 
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
>  drivers/power/supply/max1720x_battery.c | 71 +++++++++++++++++++++++++++------
>  1 file changed, 59 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/power/supply/max1720x_battery.c b/drivers/power/supply/max1720x_battery.c
> index 33105419e2427bb37963bda9948b647c239f8faa..faf336938dd4306dd2ceeb0a84b90ca80ad41a9f 100644
> --- a/drivers/power/supply/max1720x_battery.c
> +++ b/drivers/power/supply/max1720x_battery.c
> @@ -13,6 +13,7 @@
>  #include <linux/nvmem-provider.h>
>  #include <linux/power_supply.h>
>  #include <linux/regmap.h>
> +#include <linux/types.h>
>  
No need to include it, it is done by <linux/i2.c> which includes
<linux/device.h> which includes <linux/types.h>
>  #include <linux/unaligned.h>
>  
> @@ -39,6 +40,7 @@
>  #define MAX172XX_DEV_NAME_TYPE_MASK	GENMASK(3, 0)
>  #define MAX172XX_DEV_NAME_TYPE_MAX17201	BIT(0)
>  #define MAX172XX_DEV_NAME_TYPE_MAX17205	(BIT(0) | BIT(2))
> +#define MAX172XX_DEV_NAME_TYPE_MAX77759	0
>  #define MAX172XX_QR_TABLE10		0x22
>  #define MAX172XX_BATT			0xDA	/* Battery voltage */
>  #define MAX172XX_ATAVCAP		0xDF
> @@ -46,6 +48,7 @@
>  static const char *const max1720x_manufacturer = "Maxim Integrated";
>  static const char *const max17201_model = "MAX17201";
>  static const char *const max17205_model = "MAX17205";
> +static const char *const max77759_model = "MAX77759";
>  
>  struct max1720x_device_info {
>  	struct regmap *regmap;
> @@ -54,6 +57,21 @@ struct max1720x_device_info {
>  	int rsense;
>  };
>  
> +struct chip_data {
> +	u16 default_nrsense; /* in regs in 10^-5 */
> +	u8 has_nvmem;
> +};
> +
> +static const struct chip_data max1720x_data  = {
> +	.default_nrsense = 1000,
> +	.has_nvmem = 1,
> +};
> +
> +static const struct chip_data max77759_data = {
> +	.default_nrsense = 500,
> +	.has_nvmem = 0,
> +};
> +
You can get rid of chip_data by reading rsense from DT and moving
has_nvmem to max1720x_device_info. By doing so you don't have to rely on
default values. Either it is specified by DT or by rsense value in
nvmem.

Best regards,
Dimitri Fedrau

