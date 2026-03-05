Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DA5EEF323
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BhfVEWF9EotYdDAuGOeZFsZqpxjQ+hginmFnoYV66/A=; b=sUal0R+Senm1ZAfZnw9RkFz/qc
	ZUs6MHBOa6mOqRXHZlleVagOJbUCpizaLfmsqUQY1KDoXnw2qJnUJL0jic3g9BzBZxsdSm8L0Z+AI
	OwvRob1Sr6iEgQlPKIMiM+j/2dygVLpCoh5Zb82GBbIR5g38/UM9cbegN/7pK9V+6ofGypU5fHmgr
	2XFNJq4A1RS98QsbYPAmngkTpDLAqymEY9oQ+YL6lmpeAE6VPt8l7zvgKxXiyZFK7bbWjsvhOMy91
	PCHdpIXUKTLfhhhhd9pLtupV/SkVnfEJkVVMDC1KTk7aYle8YMkfWN+SfqhTk6wwoUsvtc9qRIW+N
	dMOnCceg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Gf-00000001E0t-0fEC;
	Thu, 05 Mar 2026 08:41:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Gb-00000001DzL-2OUM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:41:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 95A714E4255A;
	Thu,  5 Mar 2026 08:41:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 652745FDEB;
	Thu,  5 Mar 2026 08:41:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D69A210369535;
	Thu,  5 Mar 2026 09:41:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772700065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BhfVEWF9EotYdDAuGOeZFsZqpxjQ+hginmFnoYV66/A=;
	b=UGHpfrqcv0lxYln2H1MPd18cC0Cdw+hs6OoXLQR7DzwZDlIQVPS1q6PquJFtL2WPJF2K94
	f+/jHe0rMRKoEaEyOkmrXjXFNBuzcSWLlsD9mvnFE6wlQOf3Kmm7CEN3x5+jW726ZNVeHb
	jtiZDh5bemxcztr2JFdKLgI0Teij7+mMHKzyN3qVVKh15s6KhmBurCytEj15NMgrnVAjTv
	zzZRJhAjTdaBL35lrCDMESfU/xbD3LtjxVeipser4QMWUfaL4x8LCiBhzvTG4+JUGcpoy/
	AOTIArULIe14c1YrM0KCICSQUQO8EdVvnmLcEaazZlfE80JqIK6pbj2LA8lJgg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, linux-rtc@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, "moderated list:ARM/Marvell Kirkwood and
 Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open
 list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rtc: armada38x: zalloc + calloc to single allocation
In-Reply-To: <20260304225329.24510-1-rosenp@gmail.com>
References: <20260304225329.24510-1-rosenp@gmail.com>
Date: Thu, 05 Mar 2026 09:41:03 +0100
Message-ID: <871phyfz34.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_004109_761128_7B39A25D 
X-CRM114-Status: GOOD (  13.28  )
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

Rosen Penev <rosenp@gmail.com> writes:

> Use a flexible array member to simplify allocation.
>

I must admit that I didn't know struct_size(), it is a nice helper!

Reviewed-by: Gregory CLEMENT <gregory.clement@bootlin.com>

Thanks,

Gregory
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/rtc/rtc-armada38x.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/rtc/rtc-armada38x.c b/drivers/rtc/rtc-armada38x.c
> index 713fa0d077cd..245290ae1a8d 100644
> --- a/drivers/rtc/rtc-armada38x.c
> +++ b/drivers/rtc/rtc-armada38x.c
> @@ -72,8 +72,8 @@ struct armada38x_rtc {
>  	spinlock_t	    lock;
>  	int		    irq;
>  	bool		    initialized;
> -	struct value_to_freq *val_to_freq;
>  	const struct armada38x_rtc_data *data;
> +	struct value_to_freq val_to_freq[];
>  };
>=20=20
>  #define ALARM1	0
> @@ -490,18 +490,13 @@ static __init int armada38x_rtc_probe(struct platfo=
rm_device *pdev)
>  {
>  	struct armada38x_rtc *rtc;
>=20=20
> -	rtc =3D devm_kzalloc(&pdev->dev, sizeof(struct armada38x_rtc),
> +	rtc =3D devm_kzalloc(&pdev->dev, struct_size(rtc, val_to_freq, SAMPLE_N=
R),
>  			    GFP_KERNEL);
>  	if (!rtc)
>  		return -ENOMEM;
>=20=20
>  	rtc->data =3D of_device_get_match_data(&pdev->dev);
>=20=20
> -	rtc->val_to_freq =3D devm_kcalloc(&pdev->dev, SAMPLE_NR,
> -				sizeof(struct value_to_freq), GFP_KERNEL);
> -	if (!rtc->val_to_freq)
> -		return -ENOMEM;
> -
>  	spin_lock_init(&rtc->lock);
>=20=20
>  	rtc->regs =3D devm_platform_ioremap_resource_byname(pdev, "rtc");
> --=20
> 2.53.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

