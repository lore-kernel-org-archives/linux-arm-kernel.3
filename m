Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E857CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 21:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMOAgauWLKcjkb+U/xWaCLqqN4luQqsPYL/lLL4gNZw=; b=F7raDTt8vwfgW7Jox/vh0WP5RN
	AGxFtIncwRofXVBbG+pTEIg1qNUyqnta5XFX3nSTupBn5UeYlsqGY19AxCIWhHh0bTwz2J2Hsm7C+
	KDeLn1j7iqYxembu3KPFdzaeo4lT2KRF9qY9JvZD7ydyxTrmLR/bDwII8A65Flp701jTkEpS1vAqa
	YaUfVRxV1nx2gYSYEWWk3kpRJP+DLWnTsNGEc641tCQZTSF5pm/w2EoxziOghApEVXCuVPa5gW7J8
	L64rD33mwmqq8ZzcKUwRU3CnhoPdFgV7iRMU/vQOhaMiVJKbXwwiHnPmXX++Js82wqjEdZq2bCFtW
	ayZm/DFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tvk-0000000DLyD-2lZt;
	Thu, 25 Sep 2025 21:55:12 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1tvi-0000000DLwO-2aBs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 21:55:11 +0000
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 53BC67A0101;
	Thu, 25 Sep 2025 17:55:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 25 Sep 2025 17:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758837309; x=1758923709; bh=bMOAgauWLK
	cjkb+U/xWaCLqqN4luQqsPYL/lLL4gNZw=; b=mvPiaNjTzrFL+61SkDWbx9SCfv
	hPTmHAD/hk4It/ATfu8CBaFgzXSH/9mGw0BqyeYbkMQSiDloJxcF14aKhQONsuFs
	ERditP54PMjXJky0GxtsMnKjKJMEZoT3lPyMmiTcIU7srYAoJXQjluMJkulr4Etj
	DTpUdAOJLyY6BfQ6R7WXQamyCbyIEzFvVxIt0DApRvHyIZ2wfdwZux9j2Yq213np
	ZvHkkLOgBl4YN8IwlByGi4TAgFPi85h4Dp9VuvXbDYKLZ9KUphPLdAhFI0wAcnYv
	rsTyz0U9Fz2ceelQrA0Holm1iH4R7EwpaT7HN3GkH86mzfH+xA6RQv4TbqJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758837309; x=1758923709; bh=bMOAgauWLKcjkb+U/xWaCLqqN4luQqsPYL/
	lLL4gNZw=; b=b2do54+vKyq1phrs1mpReDnkQKGpSIam/qC38X8X0CdmicQ9mZt
	QqFoGpXr4wHmUuqlprfk9SCjcbEXZYVK5TUugt4fAzHnExryPbBUKq4dmRYZ3h/9
	KyobM08DCGBpSS30vQMOfIJw6boaxDDKFyqTVbfOrM0GtuoRswWJP9bTKwxJaU9r
	rMaL052wYyC7ihOsAs5i9IF28MpA/Oee83apOgyaNQmdj2tpG9eg50cm3wsvWGG/
	qnTZZnc5Ouqx0Ic7i8MHu6sIykO0IpAzRpO4EsFwsMtiUBJ1/3rryCEPWdY60OOX
	dvLgSH7+saVqpOr+G+Md0hJ3KJm25R6wfRQ==
X-ME-Sender: <xms:PLrVaIrTPmPJ3971omYrZ1pujtgv575cuh3ErpFSUDcX3Xquov6S5A>
    <xme:PLrVaMX0GWxHI2qoDd_-FPsBOmeKJcHZsnKF72Eh7aH0Fwfqr3njYk4PaXle9NtoX
    zk58gA0biXvPkHrbFkRkNKUvppuOkK1PUSdQa1hihHR14bbo2mnBW4>
X-ME-Received: <xmr:PLrVaO8fBShtiuUuD362fc5nJOYNcrlAwoD0J81KXcuCE9sFhPQVy9FQOgAPmoe2jApg1WES2jCYhwyFaZSLMQRMoyqNQLHVGrs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
    evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomhdprhgtphhtthhopehsvh
    gvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiif
    vghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoh
    eplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:PLrVaMYLn9JUJM_ziUL1BOsHZNGsyxVeoQH6kc9Iwfi3657xzVwFxg>
    <xmx:PLrVaOd9L-EPMtZoFyrRJW7zFxeNKEhwFWdvi6_n8sJg4uKGbTKEpw>
    <xmx:PLrVaOpGFPl5jC2x7-AQQREcWYLbIAhBQCYXB4c41srp3gCO2pPdoQ>
    <xmx:PLrVaNAhH1tArwE4HOiEpUZOAH3bFTRjT7vM5DviueEhpRbE5FbZ0g>
    <xmx:PbrVaKsC1CxH40hlHhVkaoYmnet_8jX5zibwFc8iyMd98aYB4hHwPWlF>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 17:55:07 -0400 (EDT)
Date: Thu, 25 Sep 2025 23:55:06 +0200
From: Janne Grunau <j@jannau.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 08/11] mfd: macsmc: Wire up Apple SMC HID subdevice
Message-ID: <20250925215506.GD637503@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-8-ce5e99d54c28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-8-ce5e99d54c28@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_145510_705132_84C07217 
X-CRM114-Status: GOOD (  15.80  )
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

On Wed, Aug 27, 2025 at 09:22:42PM +1000, James Calligeros wrote:
> Add the new SMC HID function to the mfd device
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  drivers/mfd/macsmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> index 286dc150aa6cfdd6d29f769094278daaddabe7c3..893fc47d62b2c956d966d1841895a3fa2b9a3005 100644
> --- a/drivers/mfd/macsmc.c
> +++ b/drivers/mfd/macsmc.c
> @@ -45,6 +45,7 @@
>  #define SMC_TIMEOUT_MS		500
>  
>  static const struct mfd_cell apple_smc_devs[] = {
> +	MFD_CELL_NAME("macsmc-hid"),

I think it would make sense to use MFD_CELL_OF and device nodes for all
macsmc even though it's in the case of macsmc-input (or -hid) not
strictly necessary

>  	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
>  	MFD_CELL_OF("macsmc_hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
>  	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

Janne

