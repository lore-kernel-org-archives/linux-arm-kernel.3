Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE93C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=butRTHsBJ2pEvuCSNRfssVLhbOWxLJT6ptxawTuvEik=; b=ACkiTMsRKG3KxKWH7GVjqBE9ea
	ndSYjChIrpoF6uET4YL4aM6+I7Mna1mcC3+DDB2VDcbUv9uJdC8uzQnJP5HtIzwQ+9EEYtHFQ1YiO
	gtVWHIIOR6UbqqoN0bNkmkOZsuZTKluiroy8OMAJl9PFTw3vthcZyGwmj7TRirC1c/Xt/NJbH6Xn+
	G42T/p7cyseKDIWOuVTJ0vHiYHPQNSd6+UDMCHdvCw6xKetqLLJnjDenNJcmAGmfSfI3vN/9afiUO
	khekc89nHFZK76RUpw009a+c9DDWCFKZf5By357cLnQNyr/yKZpblfewx/jo44zyspayI0q8yYfyQ
	da+CUpEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDQQx-00000004G3e-1O2P;
	Fri, 09 May 2025 16:18:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOSY-00000003uHl-3Aj9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:12:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 128656111F;
	Fri,  9 May 2025 14:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC66EC4CEE4;
	Fri,  9 May 2025 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746799937;
	bh=RifdIHYgrPYypE5hz/Vh43kD0MeXbhXJUcAPqgNfYPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQfjmaPMFpGQW37aYk0DOToMF7soOmRPt0Il0514LrTQ3YRddYF7Q2FKDCAhQXTpG
	 FGVTCQFfSyz7VTWwQLQH3vAsh4DYm7+XAd0m1i2i72CiRMo70h40AdzaMLdL0xBwrF
	 xheTevbJX0hx32okk0+ezgnTaKPR6lP3tWBbMmvzYVlSqKqeDis0y1OkV9+lffy1HV
	 fHzlFuGHxF9/cix992lX6B+DiCwf+kpwhsfyzRuLyaxVsJdy9j2s+3oQGNqnLwbNF2
	 Hgxr2Fj5THutJep623Hjq4UdUX9XeK7r8gEgPMdGqimF+juJjpu8qXdEDOp/Tp6v8b
	 B6an5erIAOpbw==
Date: Fri, 9 May 2025 15:12:12 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 5/9] mfd: bcm590xx: Add PMU ID/revision parsing
 function
Message-ID: <20250509141212.GE2492385@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-bcm59054-v8-5-e4cf638169a4@gmail.com>
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

On Wed, 30 Apr 2025, Artur Weber wrote:

> The BCM590xx PMUs have two I2C registers for reading the PMU ID
> and revision. The revision is useful for subdevice drivers, since
> different revisions may have slight differences in behavior (for
> example - BCM59054 has different regulator configurations for
> revision A0 and A1).
> 
> Check the PMU ID register and make sure it matches the DT compatible.
> Fetch the digital and analog revision from the PMUREV register
> so that it can be used in subdevice drivers.
> 
> Also add some known revision values to bcm590xx.h, for convenience
> when writing subdevice drivers.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v8:
> - Change PMU ID print from dev_info to dev_dbg
> - Unwrap some lines and let them go up to 100 chars
> - Drop comment above bcm590xx_parse_version (keep the comments inside
>   the function, they make it a bit more clear what's happening since
>   it's doing two separate things)
> 
> Changes in v7:
> - Return -ENODEV on PMU ID mismatch
> - Drop "Check your DT compatible" from ID mismatch error message
> 
> Changes in v6:
> - Adapt to PMUID being passed as device type value
> - Rename rev_dig and rev_ana to rev_digital and rev_analog
> - Rewrite commit message
> 
> Changes in v5:
> - Add REG_ prefix to register offset constant names
> 
> Changes in v4:
> - Added this commit
> ---
>  drivers/mfd/bcm590xx.c       | 55 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/bcm590xx.h | 14 +++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/mfd/bcm590xx.c b/drivers/mfd/bcm590xx.c
> index 4620eed0066fbf1dd691a2e392e967747b4d125b..12d0db4237e79fcfcb2af4a0d93961b6239a3863 100644
> --- a/drivers/mfd/bcm590xx.c
> +++ b/drivers/mfd/bcm590xx.c
> @@ -17,6 +17,15 @@
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
>  
> +/* Under primary I2C address: */
> +#define BCM590XX_REG_PMUID		0x1e
> +
> +#define BCM590XX_REG_PMUREV		0x1f
> +#define BCM590XX_PMUREV_DIG_MASK	0xF
> +#define BCM590XX_PMUREV_DIG_SHIFT	0
> +#define BCM590XX_PMUREV_ANA_MASK	0xF0
> +#define BCM590XX_PMUREV_ANA_SHIFT	4
> +
>  static const struct mfd_cell bcm590xx_devs[] = {
>  	{
>  		.name = "bcm590xx-vregs",
> @@ -37,6 +46,48 @@ static const struct regmap_config bcm590xx_regmap_config_sec = {
>  	.cache_type	= REGCACHE_MAPLE,
>  };
>  
> +/* Map PMU ID value to model name string */
> +static const char * const bcm590xx_names[] = {
> +	[BCM590XX_PMUID_BCM59054] = "BCM59054",
> +	[BCM590XX_PMUID_BCM59056] = "BCM59056",
> +};
> +
> +static int bcm590xx_parse_version(struct bcm590xx *bcm590xx)
> +{
> +	unsigned int id, rev;
> +	int ret;
> +
> +	/* Get PMU ID and verify that it matches compatible */
> +	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUID, &id);
> +	if (ret) {
> +		dev_err(bcm590xx->dev, "failed to read PMU ID: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (id != bcm590xx->pmu_id) {
> +		dev_err(bcm590xx->dev, "Incorrect ID for %s: expected %x, got %x.\n",
> +			bcm590xx_names[bcm590xx->pmu_id], bcm590xx->pmu_id, id);
> +		return -ENODEV;
> +	}
> +
> +	/* Get PMU revision and store it in the info struct */
> +	ret = regmap_read(bcm590xx->regmap_pri, BCM590XX_REG_PMUREV, &rev);
> +	if (ret) {
> +		dev_err(bcm590xx->dev, "failed to read PMU revision: %d\n", ret);
> +		return ret;
> +	}
> +
> +	bcm590xx->rev_digital = (rev & BCM590XX_PMUREV_DIG_MASK) >> BCM590XX_PMUREV_DIG_SHIFT;
> +
> +	bcm590xx->rev_analog = (rev & BCM590XX_PMUREV_ANA_MASK) >> BCM590XX_PMUREV_ANA_SHIFT;
> +
> +	dev_dbg(bcm590xx->dev, "PMU ID 0x%x (%s), revision: digital %d, analog %d",
> +		 id, bcm590xx_names[id],
> +		 bcm590xx->rev_digital, bcm590xx->rev_analog);

Nit: This would fit on the line above.

> +
> +	return 0;
> +}
> +
>  static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>  {
>  	struct bcm590xx *bcm590xx;
> @@ -78,6 +129,10 @@ static int bcm590xx_i2c_probe(struct i2c_client *i2c_pri)
>  		goto err;
>  	}
>  
> +	ret = bcm590xx_parse_version(bcm590xx);
> +	if (ret)
> +		goto err;
> +
>  	ret = devm_mfd_add_devices(&i2c_pri->dev, -1, bcm590xx_devs,
>  				   ARRAY_SIZE(bcm590xx_devs), NULL, 0, NULL);
>  	if (ret < 0) {
> diff --git a/include/linux/mfd/bcm590xx.h b/include/linux/mfd/bcm590xx.h
> index 8d146e3b102a7dbce6f4dbab9f8ae5a9c4e68c0e..fbc458e94bef923ca1b69afe2cac944adf6fedf8 100644
> --- a/include/linux/mfd/bcm590xx.h
> +++ b/include/linux/mfd/bcm590xx.h
> @@ -17,6 +17,16 @@
>  #define BCM590XX_PMUID_BCM59054		0x54
>  #define BCM590XX_PMUID_BCM59056		0x56
>  
> +/* Known chip revision IDs */
> +#define BCM59054_REV_DIGITAL_A1		1
> +#define BCM59054_REV_ANALOG_A1		2
> +
> +#define BCM59056_REV_DIGITAL_A0		1
> +#define BCM59056_REV_ANALOG_A0		1
> +
> +#define BCM59056_REV_DIGITAL_B0		2
> +#define BCM59056_REV_ANALOG_B0		2
> +
>  /* max register address */
>  #define BCM590XX_MAX_REGISTER_PRI	0xe7
>  #define BCM590XX_MAX_REGISTER_SEC	0xf0
> @@ -30,6 +40,10 @@ struct bcm590xx {
>  
>  	/* PMU ID value; also used as device type */
>  	u8 pmu_id;
> +
> +	/* Chip revision, read from PMUREV reg */
> +	u8 rev_digital;
> +	u8 rev_analog;
>  };
>  
>  #endif /*  __LINUX_MFD_BCM590XX_H */
> 
> -- 
> 2.49.0
> 

-- 
Lee Jones [李琼斯]

