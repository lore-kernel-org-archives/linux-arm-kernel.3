Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC25CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qi55o5psDKNexWDsg9drcRiKGnBJjMSdfWzuesdk1og=; b=kLQ9ZWOdJ0TMKpquo9n269jLM0
	dyguALQ9j/5isWuOZQRFTUpn8fsjb5xNxL7O6zpdYIpVzwJA6H3rb1V0jEjcE+34sqgzl6s0XJaWc
	FEtBJZesjfv+I7h5y8u8rItrEe8yUCnhKlWui0zDXtHomC0+CSqJf3Me8H6J2DwlZR086772BIPPL
	XclgBz00Zq7we007iOyfwN9jJbpj1DvgNb7w6qvxuIpnRcrkEwS2mXyVrPFisiPRB3XJ2FT70N5+6
	k7LrWVLbYxhArjxWpmpwxzj2wkBzDGvHAkOWWZ7FAi0FuWDxejDee7X/+oCfkXU9ef+ndR79ijGco
	2usAlbUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWK-00000002oBH-2Zq6;
	Thu, 28 Aug 2025 18:38:48 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urcZq-00000001iaf-2qLU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 13:22:08 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-afee6037847so110698766b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 06:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756387325; x=1756992125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qi55o5psDKNexWDsg9drcRiKGnBJjMSdfWzuesdk1og=;
        b=TTRzoZMU6BXtSA0SbXIpWr/V7oCJ1t6lWEPP6p9h4iu4Zrj97NCxyNpU5a9NzvNN70
         l8hUWUCXBzPiQ1M1KYLo616E3zo1f9y4+WOySmy7kQPxcVlwKcQungi0Q6j1dv4y1cVv
         io5uZJuoZRMrQFNR3JKkZUwpy6KeKljqISS+/Hdy3xfaytq5s08lK3oO6YIj4Ks3uUBP
         RCXOKJKNMcH9NVxE1i6UBXN8Ioemo53pJyIIg4Q5uA4h0Z+RIGkvuVxLPFKGBrf0kVYE
         2LgM/kYoQ6lpYfjqqV4NQt2RmJRVkUpI2nrll8LiPNLGra/fhM9wErB3F7Qtg3u45P6l
         5Ktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756387325; x=1756992125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qi55o5psDKNexWDsg9drcRiKGnBJjMSdfWzuesdk1og=;
        b=Rxlu2Zb73/3xz/+2ybx5VT8kMRh0jdwggQqEyt28cTgNYFW5X5pvFqEIdbAii4mwFi
         1cK1ewaRofudU3Wdr+ss9FZ0exNbMu4NXFNoRNXItSxRCYaqHcohQI8PPOc4dzS5ZxvD
         tmKXjhxh9c7496hdygdUbmzq03tmehZ4+7GSktBkXd0CP22y9n6gsitBy8nlhyjieH3C
         +riaWBjIkIRJd4g76aFiTT1jaRqWD7HBu2wdCvRYG/gxcmbBwh1Bb+tZTUlmMpRbBEPX
         p8aEIXvTUuVyEmprIo5HaFMXh/mSIQZ33UJ7qOTgpdjFiTKc8skj1zutQgXRp4nXHFpZ
         atiw==
X-Forwarded-Encrypted: i=1; AJvYcCUtBGNVXSVkzWsPaFbVMeaKSOeIh3SFK8L3AlSOtiuwcp6yZNOimL5V89Q+/LsZ1iKoGFBqs/iH6khXAGQB1yt3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8zGs9JlET4Hn7jdSUqB1d68KAMhoQVEvKgl8ubDL2m2kvFKaV
	e5pVnNLpgNa4mrdraOg/w9tdw+y4QnX6j/+UfQOBBTz9As2ICEl57i9TL2Y/rrO8Z/Q=
X-Gm-Gg: ASbGncsCQrkI3XPq1hCGpsb0bxx16pLSgpcTjsAhOLx++ol6KjbA4yrLjVPP7pro5vz
	SOUK7bzhkNOmDqv6HrHMz4C4aKM79xC+tZKwOns+pLtvtuTcNu+SFc43P6RDUSHrY2bwcRbYC4h
	sVy1HsC+iPQ3jLyudr1zneI//E+r7eLUxrdI1TwgJAWdOy+nf79qWe0qH2mgEyZDl0dElS1ER01
	spIp7UatlNFB3Cyi5cIs4w2nPvvPgHtDwf6pHSmi7sSncYV5GWCiJ+CMniaUUIIPEbpua9N9ekk
	ZHdYs+c49xdDY6QJ51Px7+yhPF0ggsvJoS6DhO9fPFIFIVE1Ob7qpyzMZRgOo2SbLDq0DyiJ/bD
	P9B7w/muoLizCtsiTXJzeCkJYcUcy9LSNS1pAAhuRKUlxpgZXC/nr0f/K/W4y3K18QuGvUtVVYu
	cD
X-Google-Smtp-Source: AGHT+IGjzycD3I8jpbmQVU59Xd7O/26hTjS+y9agnGzek0/A/beiz9E8xi5Rv70X95Pxh+1hKUOYSQ==
X-Received: by 2002:a17:907:9403:b0:afe:f92d:9178 with SMTP id a640c23a62f3a-afef92d9a2cmr10323866b.60.1756387324635;
        Thu, 28 Aug 2025 06:22:04 -0700 (PDT)
Received: from [192.168.1.36] (p4fc3dd6f.dip0.t-ipconnect.de. [79.195.221.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe81890cd7sm865837266b.109.2025.08.28.06.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 06:22:03 -0700 (PDT)
Message-ID: <88ee0a26-8d64-4060-b703-40156cd011a7@linaro.org>
Date: Thu, 28 Aug 2025 15:22:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 03/10] power: reset: reboot-mode: Add support for 64
 bit magic
Content-Language: en-US
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Vinod Koul <vkoul@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Stephen Boyd <swboyd@chromium.org>, Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Elliot Berman <quic_eberman@quicinc.com>,
 Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-3-37d29f59ac9a@oss.qualcomm.com>
From: Casey Connolly <casey.connolly@linaro.org>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-3-37d29f59ac9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_062206_719351_A1EB91B2 
X-CRM114-Status: GOOD (  28.87  )
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

Hi Shivendra,

On 15/08/2025 16:35, Shivendra Pratap wrote:
> Current reboot-mode supports a single 32-bit argument for any
> supported mode. Some reboot-mode based drivers may require
> passing two independent 32-bit arguments during a reboot
> sequence, for uses-cases, where a mode requires an additional
> argument. Such drivers may not be able to use the reboot-mode
> driver. For example, ARM PSCI vendor-specific resets, need two
> arguments for its operation – reset_type and cookie, to complete
> the reset operation. If a driver wants to implement this
> firmware-based reset, it cannot use reboot-mode framework.
> 
> Introduce 64-bit magic values in reboot-mode driver to
> accommodate dual 32-bit arguments when specified via device tree.
> In cases, where no second argument is passed from device tree,
> keep the upper 32-bit of magic un-changed(0) to maintain backward
> compatibility.

How about adding a n_magic_args property to struct reboot_mode_driver?
Then in struct mode_info change magic to be a u32 array of a fixed
length (currently two in-keeping with the DT bindings).

Parsing the DT values then gets simpler (u32_array) and the magic value
can be passed into the ->write() cb as a pointer since all the
reboot_mode drivers already know how big the array is. Unpopulated DT
values would just be 0.

Kind regards,

> 
> Update the current drivers using reboot-mode for a 64-bit magic
> value.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/nvmem-reboot-mode.c  | 13 +++++++++----
>  drivers/power/reset/qcom-pon.c           | 11 ++++++++---
>  drivers/power/reset/reboot-mode.c        | 19 +++++++++++++------
>  drivers/power/reset/syscon-reboot-mode.c | 11 ++++++++---
>  include/linux/reboot-mode.h              |  3 ++-
>  5 files changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> index 41530b70cfc48c2a83fbbd96f523d5816960a0d1..5d73dde585b1fd438b1847f884feb37cd9e4dd5c 100644
> --- a/drivers/power/reset/nvmem-reboot-mode.c
> +++ b/drivers/power/reset/nvmem-reboot-mode.c
> @@ -16,15 +16,20 @@ struct nvmem_reboot_mode {
>  	struct nvmem_cell *cell;
>  };
>  
> -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>  {
> -	int ret;
>  	struct nvmem_reboot_mode *nvmem_rbm;
> +	u32 magic_32;
> +	int ret;
> +
> +	if (magic > U32_MAX)
> +		return -EINVAL;
> +
> +	magic_32 = magic;
>  
>  	nvmem_rbm = container_of(reboot, struct nvmem_reboot_mode, reboot);
>  
> -	ret = nvmem_cell_write(nvmem_rbm->cell, &magic, sizeof(magic));
> +	ret = nvmem_cell_write(nvmem_rbm->cell, &magic_32, sizeof(magic_32));
>  	if (ret < 0)
>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
>  
> diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
> index 7e108982a582e8243c5c806bd4a793646b87189f..d0ed9431a02313a7bbaa93743c16fa1ae713ddfe 100644
> --- a/drivers/power/reset/qcom-pon.c
> +++ b/drivers/power/reset/qcom-pon.c
> @@ -27,17 +27,22 @@ struct qcom_pon {
>  	long reason_shift;
>  };
>  
> -static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int qcom_pon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>  {
>  	struct qcom_pon *pon = container_of
>  			(reboot, struct qcom_pon, reboot_mode);
> +	u32 magic_32;
>  	int ret;
>  
> +	if (magic > U32_MAX || (magic << pon->reason_shift) > U32_MAX)
> +		return -EINVAL;
> +
> +	magic_32 = magic << pon->reason_shift;
> +
>  	ret = regmap_update_bits(pon->regmap,
>  				 pon->baseaddr + PON_SOFT_RB_SPARE,
>  				 GENMASK(7, pon->reason_shift),
> -				 magic << pon->reason_shift);
> +				 magic_32);
>  	if (ret < 0)
>  		dev_err(pon->dev, "update reboot mode bits failed\n");
>  
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index 9bb97bcd33cd3d58c75c791e9b568024e810e5b0..ac81b8b0a9b7fc31f8ef21024333a050087ce90f 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -19,12 +19,11 @@
>  
>  struct mode_info {
>  	const char *mode;
> -	u32 magic;
> +	u64 magic;
>  	struct list_head list;
>  };
>  
> -static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
> -					  const char *cmd)
> +static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
>  {
>  	const char *normal = "normal";
>  	struct mode_info *info;
> @@ -66,7 +65,7 @@ static int reboot_mode_notify(struct notifier_block *this,
>  			      unsigned long mode, void *cmd)
>  {
>  	struct reboot_mode_driver *reboot;
> -	unsigned int magic;
> +	u64 magic;
>  
>  	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
>  	magic = get_reboot_mode_magic(reboot, cmd);
> @@ -89,6 +88,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
>  	struct mode_info *next;
>  	struct property *prop;
>  	size_t len = strlen(PREFIX);
> +	u32 magic_arg1;
> +	u32 magic_arg2;
>  	int ret;
>  
>  	if (!np)
> @@ -108,12 +109,18 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
>  			goto error;
>  		}
>  
> -		if (of_property_read_u32(np, prop->name, &info->magic)) {
> -			pr_err("reboot mode %s without magic number\n", info->mode);
> +		if (of_property_read_u32(np, prop->name, &magic_arg1)) {
> +			pr_err("reboot mode without magic number\n");
>  			kfree(info);
>  			continue;
>  		}
>  
> +		if (of_property_read_u32_index(np, prop->name, 1, &magic_arg2))
> +			magic_arg2 = 0;
> +
> +		info->magic = magic_arg2;
> +		info->magic = (info->magic << 32) | magic_arg1;
> +
>  		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
>  		if (!info->mode) {
>  			ret =  -ENOMEM;
> diff --git a/drivers/power/reset/syscon-reboot-mode.c b/drivers/power/reset/syscon-reboot-mode.c
> index e0772c9f70f7a19cd8ec8a0b7fdbbaa7ba44afd0..3cbd000c512239b12ec51987e900d260540a9dea 100644
> --- a/drivers/power/reset/syscon-reboot-mode.c
> +++ b/drivers/power/reset/syscon-reboot-mode.c
> @@ -20,16 +20,21 @@ struct syscon_reboot_mode {
>  	u32 mask;
>  };
>  
> -static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot,
> -				    unsigned int magic)
> +static int syscon_reboot_mode_write(struct reboot_mode_driver *reboot, u64 magic)
>  {
>  	struct syscon_reboot_mode *syscon_rbm;
> +	u32 magic_32;
>  	int ret;
>  
> +	if (magic > U32_MAX)
> +		return -EINVAL;
> +
> +	magic_32 = magic;
> +
>  	syscon_rbm = container_of(reboot, struct syscon_reboot_mode, reboot);
>  
>  	ret = regmap_update_bits(syscon_rbm->map, syscon_rbm->offset,
> -				 syscon_rbm->mask, magic);
> +				 syscon_rbm->mask, magic_32);
>  	if (ret < 0)
>  		dev_err(reboot->dev, "update reboot mode bits failed\n");
>  
> diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
> index 98f68f95c9e8460be23282c51ef7fcbed73887bd..370228b5161963aac1d75af752ada0e8282b1078 100644
> --- a/include/linux/reboot-mode.h
> +++ b/include/linux/reboot-mode.h
> @@ -3,11 +3,12 @@
>  #define __REBOOT_MODE_H__
>  
>  #include <linux/mutex.h>
> +#include <linux/types.h>
>  
>  struct reboot_mode_driver {
>  	struct device *dev;
>  	struct list_head head;
> -	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
> +	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
>  	struct notifier_block reboot_notifier;
>  	/*Protects access to reboot mode list*/
>  	struct mutex rb_lock;
> 

-- 
// Casey (she/her)


