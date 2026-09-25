Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBAEC98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 19:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWDSKWZuEkPlk2u1p84ALBilVUhoSm1EjrDy3t/LqSE=; b=O+NlSx1a4zJbTVdhnm0/PFecT6
	x1XJ4rXXY1OkFIrxiO8LdWfHDsVdwiJEElJoyeKfDbS+9AmQ5stEcmatbnUx55opu9FiFVD2YrDc2
	wgHsQjvtQrjl/3PgS8w2oNI8RJy3be9m0/bFkrt65nr7n2fqTfXKHyMqbhv2P0gucByaixDLhgQNL
	cpOw7I1zS5JWBXHsXDo3lhYzg0clXiv98pBnQ6/HshRpebDRBn2O9skN4Sj042MZAHn4PWSjhL+7E
	WkmXGrbMVl5fccYiPZnX6HIGb8dAesiHG5185xXWqNnXqOWye4s0M12h0JFUcgFLnQFLWPn4xcYGa
	90J6WddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABaD-0000000EGLk-2tuO;
	Fri, 25 Sep 2026 19:27:45 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABaA-0000000EGLJ-2tlH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 19:27:43 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-341d0522b4dso1402379eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 12:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364462; x=1790969262; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RWDSKWZuEkPlk2u1p84ALBilVUhoSm1EjrDy3t/LqSE=;
        b=Oix2nsjjn7rXPrkH5a3PCgKKIj43BOu+nQImaeGMlGKimz1r3jJUEbmLLGy9+9pKcT
         qf/bmY2e1yOYIJj1cQ6ISlRayqlT8XnLbhStf+OmjEZrvwrovo1HJNjf9bGdmwbu2gWi
         bml2iz5dMg9irt0YR3Wi4YR0oxBDNBTN4SZRDR6Rgf9k7hrA2m3xhOXPcoeL4ZBizH2k
         X3kVNAPETw/nfzgUMWhHnQ8C1DKxFnXkh3M2RFJb7efVuFA+fG5vjVkHDYNAH6hs36gV
         sGxj9KIRMaDdSi6U5Mkaye7F5+KOMj/DynNmXi3bA2DH+D/1nX765T5UwepIOIsGF76N
         KDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364462; x=1790969262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RWDSKWZuEkPlk2u1p84ALBilVUhoSm1EjrDy3t/LqSE=;
        b=lmxa0df2iPAVmkVbVcrwtqVfDX6fn/gqgvkmZ0iuWdlOGiOz3QHn2uukkoUiRav8Ap
         zSByTE/04A5bBAf3EqqWFwfJZmBIjbdKskAPsQFfKdEQXxTqxkadmiWTPSEVLGuPaRth
         SDTsnAMf+KCX0VQCVJRghgW6m9D9juZB4UNxgO8ZYGuIqEP9O5BGNDVO1LbIxJLc34H1
         PGXgly7IHh7H77bW3B5gfkrCgkUBOBZ8zzE2yOSPWPauhROuAcmabxqd4jHgL8ddKFJ5
         scZbt2ZGnCaUSCwIpjZy/S76rYFGsDyIfUeG91FBFXXsd7QVqecns2p0t/eyDld04KkI
         7Lpg==
X-Forwarded-Encrypted: i=1; AKwUvBzewsXqndvDaO+0nFRTUeuTnWqoTOIpesrGLPt1GrtJYfV0TvDVDqSObhZ0WkykWBTpnYFbNF8gek3mXaWvn9To@lists.infradead.org
X-Gm-Message-State: AFuF++maTIwvLFm7O7S6oJLV50R0E9efYZsS7vpr7cHr9XK94ukp+kvr
	/ckbmLwl0vHIcqKx4R1jCGRVwYPu0Oz/JcqGHV1yx/AHsvGtinOMj6I4
X-Gm-Gg: AYBFou2gfbeqA99IYsufPvZGGncI/OZWJ9pLsRv1TaX0c7NXrHzUs1M7dnTN76rED+3
	YI93jqR/XmkwJxeiFcxP2RkPTaKXf5zBvQzRRGPOBnvC+pbzgzELMhzcB5Fano/WMcA+sVFANjv
	HMC0wt4J7S9tkNqooeuL6pRjv3SsOpfCgjdpowfVw2Tx4Ao2W87EnUc5XFtZjzTMD6wTrAtpCj4
	tABTG5CmNgakcbFl4xGbhF8TgSe7ANCIue5i+Wgch9NY1Brj6gKWpjw7F+z/kWquZiiPEfVDlcO
	y/RXCE2B5NvqJtTEAQlOS+kXEMrxB3tRrRtjkk1vy7w65VfFjWw3nSizrwQ7PiRnHr7cU6uk0hA
	p7Q9lp6RM0JeaLG3gljOnuOO93JQtCgLWlGBeQxnhdaYW66dxCFY8nJQX1ffyaQNfsSpowHIDu4
	yEfC2MdnK34fOjUUOhNOrBlyW174Sb/PBrt805YG93akSJsNHUfo6mJY2O8tg2WIl1DJihvnn1Z
	dTZjt08Spcv7UZTaKMp6lDOZ6RFqhKCpUzpKs8=
X-Received: by 2002:a05:7300:ae23:b0:342:890a:40a8 with SMTP id 5a478bee46e88-342890a4389mr792661eec.30.1790364461569;
        Fri, 25 Sep 2026 12:27:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:375:19cf:5fee:be32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm7801383eec.29.2026.09.25.12.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:27:40 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:27:37 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v7 1/4] Input: stmfts - wait for controller ready after
 reset
Message-ID: <arbJrK9zfoO1dGzy@google.com>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-1-4a53381cd038@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-1-4a53381cd038@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_122742_741381_429F5192 
X-CRM114-Status: GOOD (  21.92  )
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

Hi David,

On Mon, Sep 07, 2026 at 12:50:19PM +0200, David Heidelberg via B4 Relay wrote:
>  
> -static void stmfts_reset(struct stmfts_data *sdata)
> +static int stmfts_reset(struct stmfts_data *sdata)
>  {
>  	gpiod_set_value_cansleep(sdata->reset_gpio, 1);
>  	msleep(20);
>  
> +	reinit_completion(&sdata->cmd_done);
>  	gpiod_set_value_cansleep(sdata->reset_gpio, 0);
> -	msleep(50);
> +	enable_irq(sdata->client->irq);
> +
> +	if (!wait_for_completion_timeout(&sdata->cmd_done,
> +					 msecs_to_jiffies(STMFTS_RESET_TIMEOUT_MS)))
> +		return -ETIMEDOUT;
> +
> +	return 0;
>  }
>  
>  static int stmfts_configure(struct stmfts_data *sdata)
>  {
>  	int err;
>  
>  	err = stmfts_command(sdata, STMFTS_SYSTEM_RESET);
>  	if (err)
> @@ -593,42 +602,47 @@ static int stmfts_power_on(struct stmfts_data *sdata)
>  		return err;
>  
>  	/*
>  	 * The datasheet does not specify the power on time, but considering
>  	 * that the reset time is < 10ms, I sleep 20ms to be sure
>  	 */
>  	msleep(20);
>  
> -	if (sdata->reset_gpio)
> -		stmfts_reset(sdata);
> +	if (sdata->reset_gpio) {
> +		err = stmfts_reset(sdata);
> +		if (err) {
> +			dev_err(&sdata->client->dev,
> +				"controller not ready after reset: %d\n", err);
> +			goto err_disable_irq;
> +		}
> +	} else {
> +		enable_irq(sdata->client->irq);
> +		msleep(50);
> +	}
>  
>  	err = stmfts_read_system_info(sdata);
>  	if (err)
> -		goto err_disable_regulators;
> -
> -	enable_irq(sdata->client->irq);
> -
> -	msleep(50);
> +		goto err_disable_irq;


I think the logic is becoming quite convoluted here, and factored out
stmfts_reset() does not help. How about we make it look like this:

static int stmfts_power_on(struct stmfts_data *sdata)
{
	int err;

	if (sdata->reset_gpio) {
		gpiod_set_value_cansleep(sdata->reset_gpio, 1);
		/* a short delay before powering up */
		usleep_range(1000, 1500);
	}

	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
				    sdata->supplies);
	if (err)
		return err;

	if (sdata->reset_gpio) {
		reinit_completion(&sdata->cmd_done);

		/*
		 * The datasheet does not specify the power on time, but
		 * considering that the reset time is < 10ms, sleep for 20ms
		 * to be sure before releasing reset line.
		 */
		msleep(20);
		gpiod_set_value_cansleep(sdata->reset_gpio, 0);

		enable_irq(sdata->client->irq);

		if (!wait_for_completion_timeout(&sdata->cmd_done,
						 msecs_to_jiffies(STMFTS_RESET_TIMEOUT_MS))) {
			dev_err(&sdata->client->dev, "controller not ready after reset");
			err = -ETIMEDOUT;
			goto err_disable_irq;
		}
	} else {
		/*
		 * We do not know the real controller state (was it powered
		 * off or reset). Let's hope that this is enough time to
		 * initialize.
		 */
		msleep(70);

		enable_irq(sdata->client->irq);
	}

	err = sdata->ops->configure(sdata);
	if (err)
		goto err_disable_irq;

	/*
	 * At this point no one is using the touchscreen
	 * and I don't really care about the return value
	 */
	(void)i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_IN);

	return 0;

err_disable_irq:
	disable_irq(sdata->client->irq);

	regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies), sdata->supplies);
	return err;
}


Thanks.

-- 
Dmitry

