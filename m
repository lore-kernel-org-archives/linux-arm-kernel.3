Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602ACC71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 00:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgVYAUuQxNBGpksGSE7ef8CIrk0d79xyGwAbs8yQkls=; b=WbzsfW2MzJTXwiqIVopEM2fywk
	r1QpE5gMCTL93mhJAgZ2js+O2+WUp2vEtaOtx0szUpfqLYw2Qzfsiq/85407IbZoQPv81wFpdIDSt
	+pgk6S9qxLk/+zQTdkwQ1nbKrilNWvswpsPMWPL0njNqmuB+CtYKP8I0O7i2gABgqb1SQiGNrWuEb
	DM/gHNILnd6itdW0TKQw+YXQ8EQxXwBAL1YAH1XSO/AEx6D45UyRFKg25wslqbEjZOBC9D3293BSQ
	nPKkaHYVE0ksPR1PnYq+eVlik1DnUIAWRxC56t/yXjo07BrOFn3P72oEcUAPGh1hKz/RCWNXaGw18
	d1FeoK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRKcG-00000005um3-2ykg;
	Tue, 17 Jun 2025 00:55:56 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRKYw-00000005ud3-1DIU;
	Tue, 17 Jun 2025 00:52:31 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bLpHZ6fCXz9sWq;
	Tue, 17 Jun 2025 02:52:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750121547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgVYAUuQxNBGpksGSE7ef8CIrk0d79xyGwAbs8yQkls=;
	b=CcZBDJeY4BP03GL321ItPOuI1wf2HwjCwPafZOswgrMfVFlCFr+JAj5VmRHsYlf46eF+OM
	VMwhvmXN82IKZcyctbZRJkQ0/vKI1jsGGrcISpUo4RC+KnF8l+ARrhMM3chm6MTjGXs2o7
	BVsdLaxzG/obx+6OX0mtUnjParPLCIFYAtXZF9Xg4VS/zsHP9j3vdGMW8CQrWfK1TstaEV
	k+zbYZP3EjMHkC0iovy2beN1ZKxnJyBf3qysj9yRJa/Z4qw0X6rFX6PW8JEAYZPrh0x1ax
	Fiq461mJExgfh8t0BnfYDX6/Co4Cps9o583DSON3ZMAumQaR47grqAjPI21NMQ==
Message-ID: <4036ada7-faf8-4b23-b6ce-ade5bafbe6ba@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750121545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YgVYAUuQxNBGpksGSE7ef8CIrk0d79xyGwAbs8yQkls=;
	b=xsoxXZHFO40aQyD9DIJkodKMU/z+sX200Zze3DcYXB/8iPi0P+3GBNVeuRhsEImaNDuRlz
	9CAURi80b9MmeSN9GEIBkUFIFwZ6vVGj92QqAWmsEg/htMrKVP58/hX7oq1FN0LA/chEFQ
	kTAp4GCH4kDxQsqC4CDlM1OL/0U0egVvOnO4WLJLT+3owEhM0Tc6BoC1D16GX6sqVAPDQj
	1kfOtzoKqwiP0/7oi5C2zxSOgcKCf/KsM+WuH6ilYde/YeR683Aq0E3X9Sg+TX7I+eZjTM
	qBlUZYE/6J0vy/xjt1f5lmFoRE20D5mf7g7O8GEHkTXOPFx3+p0F8JBOKsrgIA==
Date: Tue, 17 Jun 2025 02:52:22 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] regulator: rpi-panel-v2: Add regulator for 7"
 Raspberry Pi 720x1280
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
References: <20250609000748.1665219-1-marek.vasut+renesas@mailbox.org>
 <20250609000748.1665219-2-marek.vasut+renesas@mailbox.org>
 <fsihsojbs3pex6i6vag4njw27esv257nz3yuacl2bbflyfzfvx@6cc6k7tczdi7>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <fsihsojbs3pex6i6vag4njw27esv257nz3yuacl2bbflyfzfvx@6cc6k7tczdi7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9a510f01bb172c81bdc
X-MBO-RS-META: ihm8obj8xbenxckxjr1zogz6pack7gwp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_175230_501671_2194C5B9 
X-CRM114-Status: GOOD (  11.10  )
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

On 6/11/25 10:30 PM, Uwe Kleine-König wrote:
> Hello Marek,

Hi,

> On Mon, Jun 09, 2025 at 02:06:42AM +0200, Marek Vasut wrote:
>> +static int rpi_panel_v2_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>> +				  const struct pwm_state *state)
>> +{
>> +	struct regmap *regmap = pwmchip_get_drvdata(chip);
>> +	unsigned int duty;
>> +
>> +	if (state->polarity != PWM_POLARITY_NORMAL)
>> +		return -EINVAL;
>> +
>> +	if (!state->enabled)
>> +		return regmap_write(regmap, REG_PWM, 0);
> 
> I would swap these two if blocks to ensure that disable works even if
> the wrong polarity is passed.
I have now sent the conversion to waveform ops patch, so I hope that 
addresses all the topics in this feedback. Thanks!

