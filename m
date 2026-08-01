Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD04C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 22:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLoW75OeyWjCn5mDPhOVH7SIR/aVWGMDXLzfTVWEJBI=; b=zziOMWnZBySicRoYzzleUmxKKa
	jFaKCd4Jezv+7bs2+4dRP29hVulkOdf6vfrytWGcKzD+f3nvVWKVfRinxNyWteEuqKe05ut8TWaGt
	CIfDIFXqv5w4r7Rl8ad85F01eJVRmvhY3yogfC0ILLkZy6rgWEBsK6m9g9WtgwgyNIDm7PfaN3oUe
	SABHMjEQtx1BiqP7fgXfssqajmrV8+hpRnuR9wybcN0hK+JjBekoZantFwez9naUEpBpXL1BJGOj5
	UQyPnjuOLjbdCtET4n96lbHJGaNpaJVXOkRhpnZG+riRZFmsazVqV6VsI7UGgb1urhOKq93u8iOCQ
	VAkPrM5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHrH-0000000F9tJ-21GO;
	Sat, 01 Aug 2026 22:07:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqHrE-0000000F9st-2F5N
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 22:07:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 34E174E41078;
	Sat,  1 Aug 2026 22:06:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 079A06029E;
	Sat,  1 Aug 2026 22:06:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77D2211C171DE;
	Sun,  2 Aug 2026 00:06:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785622014; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=aLoW75OeyWjCn5mDPhOVH7SIR/aVWGMDXLzfTVWEJBI=;
	b=lzihplHdvydJH/091E/Cch/Ix9xYTjr/DAo4r5EjdA0yD+khNcV+3KsvIk2Q8KQUUYlHGo
	e+6A7uJ/41+F2VP+zcQLxSdjrVXapxvj18T+U+hAHnkWQGi3Cmww8bgohlyPz5y7RiNXJl
	XK7imxuZftWFkN/Q1YXkNt4PxgoCIdk4xp3dpjCFW7Ak0pNC3Q500kZor/A/28MtjECYpV
	RyHHh/4sVGypHjeleizjW4SA+cD87D9mdRHthsNCoMko3u+qw0oDS72McStmQ6pusVD2EI
	0X4mLDxgqGy+i1vs/8IvtvS3q/b9rJy4o5qiYopWBHAUMT9CPl+LLg+Xbx9O4Q==
Date: Sun, 2 Aug 2026 00:06:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Langer <michael.brainbug.langer@googlemail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] rtc: s35390a: Fix alarm not disabling
Message-ID: <20260801220650361c83dd@mail.local>
References: <20260801-rtc_s35390a_int1-v2-0-f10c99ad1d6c@posteo.de>
 <20260801-rtc_s35390a_int1-v2-3-f10c99ad1d6c@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-rtc_s35390a_int1-v2-3-f10c99ad1d6c@posteo.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_150704_731753_77AE8B81 
X-CRM114-Status: GOOD (  18.99  )
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

On 01/08/2026 18:43:02+0000, Markus Probst wrote:
> Implement alarm_irq_enable callback to disable alarm if requested.
> On reenable restore last used alarm time.
> 
> Fixes: 542dd33a4925 ("drivers/rtc/rtc-s35390a.c: add wakealarm support for rtc-s35390A rtc chip")
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  drivers/rtc/rtc-s35390a.c | 28 +++++++++++++++++++++++-----
>  1 file changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
> index 4cfe7034c516..fbf5471eb3d0 100644
> --- a/drivers/rtc/rtc-s35390a.c
> +++ b/drivers/rtc/rtc-s35390a.c
> @@ -64,6 +64,7 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
>  
>  struct s35390a {
>  	struct i2c_client *client[8];
> +	struct rtc_time tm_alarm;
>  	int twentyfourhour;
>  };
>  
> @@ -320,6 +321,9 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	err = s35390a_set_reg(s35390a, S35390A_CMD_INT2_REG1, buf,
>  								sizeof(buf));
>  
> +	if (!err)
> +		s35390a->tm_alarm = alm->time;
> +
>  	return err;
>  }
>  
> @@ -379,6 +383,19 @@ static int s35390a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
>  	return 0;
>  }
>  
> +static int s35390a_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
> +{
> +	struct s35390a *s35390a = dev_get_drvdata(dev);
> +	struct rtc_wkalrm alm;
> +
> +	alm.enabled = enabled;
> +
> +	if (enabled)
> +		alm.time = s35390a->tm_alarm;
> +
> +	return s35390a_rtc_set_alarm(dev, &alm);

You should do the opposite, set_alarm needs to call
s35390a_rtc_alarm_irq_enable instead or simply set S35390A_CMD_STATUS2
here.

> +}
> +
>  static int s35390a_rtc_ioctl(struct device *dev, unsigned int cmd,
>  			     unsigned long arg)
>  {
> @@ -410,11 +427,12 @@ static int s35390a_rtc_ioctl(struct device *dev, unsigned int cmd,
>  }
>  
>  static const struct rtc_class_ops s35390a_rtc_ops = {
> -	.read_time	= s35390a_rtc_read_time,
> -	.set_time	= s35390a_rtc_set_time,
> -	.set_alarm	= s35390a_rtc_set_alarm,
> -	.read_alarm	= s35390a_rtc_read_alarm,
> -	.ioctl          = s35390a_rtc_ioctl,
> +	.read_time		= s35390a_rtc_read_time,
> +	.set_time		= s35390a_rtc_set_time,
> +	.set_alarm		= s35390a_rtc_set_alarm,
> +	.read_alarm		= s35390a_rtc_read_alarm,
> +	.alarm_irq_enable	= s35390a_rtc_alarm_irq_enable,
> +	.ioctl			= s35390a_rtc_ioctl,
>  };
>  
>  static int s35390a_nvmem_read(void *priv, unsigned int offset, void *val,
> 
> -- 
> 2.54.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

