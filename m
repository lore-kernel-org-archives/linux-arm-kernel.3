Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A12CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xw5SJ5ouCRYB/b5GcNxozXNcJ8qmSd+3bPwo/jj3Nqc=; b=u677r4nzk9s8CRaqeLv3dy14x4
	/UDEOs5p96XdBl8jtZ6WK+cIz/EEcEpRRJfUUPTboUJ7G5eEN2w4mQCej9FTH5OleFPNFmmjErvLe
	R8mGCYAs6s7XRJlJwufq1ztRzNtC/NAA9SbG6wwWtTQ8TBfVa0B6HtVEPnPhpof7TPzQMRTp13gow
	bEjQoR9O9iF2OK+8ldNfvNPJWg6imvbpQFZnmm4n4esRKXBC0C4xKK4/Lms5ZTmkVetzOsgplE659
	rHHbGBDp/Qcf41KSLtPzA3/12syto0JWIHbnsJbEPS6mS4SkIPCPkZoccT425EUkLGiehxiM7yuS9
	rt9QviDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxUl-00000003jnY-3xry;
	Thu, 07 May 2026 12:06:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxUh-00000003jlp-3z54
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:06:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-449cdc12a8aso80563f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778155577; x=1778760377; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xw5SJ5ouCRYB/b5GcNxozXNcJ8qmSd+3bPwo/jj3Nqc=;
        b=RuIw70aPruUkCw2VczMZCCDlR911SMvGEGYIigXBvDuMyrc/2D6DDx+122bOa83nb3
         dfAVR0f+/8ojYxT2PCv1vRF4xh7vidht+VfBJYxy1TPWgu9TmWVry5KQrX7G8ADdxKiH
         O94vovkiBYMaBn22r1xUCJhndcxYtJj6gFrM9QP3xYjNyuMMxY0lsLkLdrtj4e34ZurJ
         Gj1IKt4cCRDyegSkuHi/D6IrphMfo6oqCa4hBtzhmFRfUpsBX8WPQ0+SMCBwS4bxNkLW
         4oYubj1wRFgWnfNZtZcOgn/Gbeg+D7ZTIa7oijfzk8r/x+pVP5r66VxWcO9vnNzqCMq7
         JqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155577; x=1778760377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw5SJ5ouCRYB/b5GcNxozXNcJ8qmSd+3bPwo/jj3Nqc=;
        b=rE6KiyrhrfyURlq/N3i9zzS/g7uoqTGlaTuadjlIP/r6q/R5rZFQzJgW2s+0JLX8VZ
         6g7tnZE4zcUTcI9+tKccu449GetSY39J9DiA2IgKeG13+SpKXM8jTcU6Q+bomlqW/dLt
         td/3sy5d3pRupD4+KdcQNPWYma4OpcR0ke4cUfxaP7Ls9+HmHMuF0zqH2l1jmT+Jqb1+
         iCXGgVPIYRXmUNonB+CK9wdmqV2MT/DV5dtSh7zaqb2EBL6iFpCwnSQGDc1hQrYVw1IU
         Kq13iQBTxiB0b7svuE8qvlrR5j4froj/5wbFwRE3Mx1gAcJROv5pFFdDVdfAo6jWXaXE
         kbNA==
X-Forwarded-Encrypted: i=1; AFNElJ89XtQUKr3jYVv7sPQ7Vz1mPHV6iROn/Y6ovBTgbHvB3UWdN7845XxFxSe36oAVCWXbLgvENLx8ekEDd5/w7JAL@lists.infradead.org
X-Gm-Message-State: AOJu0YzZkiMsx5la4Lex1RggOjEh9C/mvMGFYegU/B43Sk2HS0D17mo9
	o7GVNAzBPHn4WWs9J6qTLbJXnIae72jCZM6vAeEZqvHv1KvpHO9YZ4A3
X-Gm-Gg: AeBDieupBS8OXqt9/sk9hHdnub9IT1eXmiwUI+dlR9DEy4RdNeAJ4mTXdswIKwwgpXI
	FtrsWxfXj/2yZi4IiH20b9/ixXA504v91JSf2nUtopmQJ1B/VU3eFnzYOGq+xnMsw3l2Shcix52
	XI3GcQAEPXbjmYYl6aGkKcrU//yNdIpx0O3mFwoFWDuaNePiZ/UpAU8PSL+gApqb5h03gyN1vn6
	VTqjhbOJs8Ytl70lu8R9ZB6gjjTsRPhsHTYlepwF0+iPWUQBrhCTsjQiKgeIfoiPRNvC4mT3Xug
	8SdPPp+PLfVZxs6iMZxJXuO/+chXcihV4zPXdH9fGqFBqHLy2e+673zWrr7ibOed9lumJWIUaLr
	3K8jwujCzlv3chHoTf83nosoLCt57toIjBiqEPU4QKyCDHkFKpufvDoK4fSYR9XEmjvoOQNF5Rr
	qiBhwxJkdKRygauSU/FdaDPuBgoC5rRb0xmPCJ
X-Received: by 2002:a05:6000:4517:b0:448:71e8:4b3b with SMTP id ffacd0b85a97d-451a71f62e6mr3350578f8f.5.1778155577326;
        Thu, 07 May 2026 05:06:17 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d403:cf00:be4e:5cc8:5753:4a2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm21613178f8f.28.2026.05.07.05.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 05:06:16 -0700 (PDT)
Date: Thu, 7 May 2026 15:06:14 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: David Carlier <devnexen@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Hector Martin <marcan@marcan.st>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: apple: atc: Fix typec switch/mux leak and UAF on
 unbind
Message-ID: <20260507120614.jlygedfycdjxbvoo@skbuf>
References: <20260420231014.35462-1-devnexen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420231014.35462-1-devnexen@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_050620_017702_35AFA9CC 
X-CRM114-Status: GOOD (  23.36  )
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

Sashiko says:

commit 13bcb3149b5056d5815f8cd52f9e018076602989
Author: David Carlier <devnexen@gmail.com>
phy: apple: atc: Fix typec switch/mux leak and UAF on unbind

This commit addresses a typec switch and mux leak during unbind by
saving the registered devices and unregistering them via
devm_add_action_or_reset. It also drops unused struct fields.

> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index e9d106f135c51..4156fabad742c 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
[ ... ]
> @@ -2066,15 +2063,25 @@ static int atcphy_sw_set(struct typec_switch_dev *sw, enum typec_orientation ori
>  	return 0;
>  }
>
> +static void atcphy_typec_switch_unregister(void *data)
> +{
> +	typec_switch_unregister(data);
> +}
> +
>  static int atcphy_probe_switch(struct apple_atcphy *atcphy)
>  {
> +	struct typec_switch_dev *sw;
>  	struct typec_switch_desc sw_desc = {
>  		.drvdata = atcphy,
>  		.fwnode = atcphy->dev->fwnode,
>  		.set = atcphy_sw_set,
>  	};
>
> -	return PTR_ERR_OR_ZERO(typec_switch_register(atcphy->dev, &sw_desc));
> +	sw = typec_switch_register(atcphy->dev, &sw_desc);
> +	if (IS_ERR(sw))
> +		return PTR_ERR(sw);
> +
> +	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_switch_unregister, sw);
>  }

Could this lead to a use-after-free if consumers still hold a reference to
the switch or mux?

When the driver unbinds, devm cleanup runs and frees the apple_atcphy
structure. The devm action calls typec_switch_unregister(), which drops the
sysfs representation but doesn't free the device object if a consumer (like
TCPM or a Type-C port driver) still holds a reference.

If the consumer is not unbound concurrently, it retains the reference and
remains active. Unregistering the switch does not clear its .set callback.
If a cable replug or orientation change occurs, the consumer could call
typec_switch_set(), which would invoke atcphy_sw_set().

Since atcphy_sw_set() extracts the freed apple_atcphy pointer from drvdata
and attempts to acquire its mutex, could this result in a use-after-free?
[ ... ]

> @@ -2146,15 +2153,25 @@ static int atcphy_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *sta
>  	return atcphy_configure(atcphy, target_mode);
>  }
>
> +static void atcphy_typec_mux_unregister(void *data)
> +{
> +	typec_mux_unregister(data);
> +}
> +
>  static int atcphy_probe_mux(struct apple_atcphy *atcphy)
>  {
> +	struct typec_mux_dev *mux;
>  	struct typec_mux_desc mux_desc = {
>  		.drvdata = atcphy,
>  		.fwnode = atcphy->dev->fwnode,
>  		.set = atcphy_mux_set,
>  	};
>
> -	return PTR_ERR_OR_ZERO(typec_mux_register(atcphy->dev, &mux_desc));
> +	mux = typec_mux_register(atcphy->dev, &mux_desc);
> +	if (IS_ERR(mux))
> +		return PTR_ERR(mux);
> +
> +	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_mux_unregister, mux);
>  }

Are we exposed to the same issue here with typec_mux_unregister()?
If a consumer still holds a reference to the mux device after the driver
unbinds and devm frees apple_atcphy, could an alt-mode transition invoke
atcphy_mux_set() and access the freed memory?

[human]

Basically it is stating that consumers will continue to hold a reference
to the Type-C mux and switch even if you go to the extent of unregistering
them from the framework. This is a known problem in many subsystems;
even the PHY framework suffers from it.
https://lore.kernel.org/linux-phy/aZejMSJ9qqRWb2pX@google.com/

I don't know how the Type-C framework deals with this, so maybe you can
clarify in your commit message what kind of problems the deregistration
will get rid of, and what kind of problems it won't.

How do the cable replug or alt mode changes trigger calls to
atcphy_sw_set() and atcphy_mux_set()? A call stack would help.

Ideally you want to help the reviewer understand that the change is
obviously correct and takes into consideration all relevant factors.

