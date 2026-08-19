Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4E9C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j2QFmIqsPMjSEaMKX7xQH3oClX6HCcn2Fx3TkiBSFCE=; b=Hs6EnNoJWAzmlrVddlmvbdn4CV
	dPN2r8AyURXGy2h27CXzlqQTumamqo91gyvP3lg3MqoXQimKQ/SBxJ0cKaea05MRDhsOjEbyyEmwO
	Xi5lxjDrSjlzKNOT90xghiBRN+lrt7j/GHoezw4JeCWv4GSYdV4G3PFKkYa3Seo9putPRybC9Rank
	fk480U6hh64HYruhuDF7BBHN8azZeEZ9yzreZ4MhUfvfPtELAd6qb6QdrjHpcIFz4TMTZGhGgcEUG
	qQODRjupXoCX6NexBnPH76XQDe/eSDUq2pzlnWFKwdIWuGYgqaqUv7vqDnMN9IHt43Me6ITOFYCCI
	qZIcA+vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjQX-0000000ADNf-351X;
	Wed, 19 Aug 2026 16:46:09 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjQT-0000000ADLv-3ldJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:46:08 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1070982a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787157964; x=1787762764; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j2QFmIqsPMjSEaMKX7xQH3oClX6HCcn2Fx3TkiBSFCE=;
        b=PhG3VwLWR8T5qu0IHb7upfuV/N6Io31sebamGDsqs3Jr5lV5J7ikC7gnP79WN1AUE8
         OZzNk4q7gxA+c1Kfk6rkappDJMHYH/rwKjjD2teVj5PlcG/9Bj5ZZd+Z/Tyjq8s2Q5pM
         cDPkUG3OyXF4HywFttAC5dOSLsR7peZH9PCc4F4N9WFAFMTIYpqJsdVnvsH2zDXkl3ng
         MMhZPYAU2HYETTKPrfPybU1aQSkoOzdZuz0JsXty0TkPmN+8rzsAToS2fu92sWVUG4+/
         CgGBiKBa4DsAHvdPeDMs+gbp5r8SqJjP0h6JHJljZGB4kvhAXtwMqtZYklJHIRPXAMGw
         d8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157964; x=1787762764;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j2QFmIqsPMjSEaMKX7xQH3oClX6HCcn2Fx3TkiBSFCE=;
        b=qLYswoh+Iqs4Fgja3G205/BrPEHLbhw/IZnPecMlFLgrVyX0hXtmJU8yCrVCucH1GZ
         hPgMsemS9S6TySH5X41Y9qKinXEtcKlr/QfppD9XzdUMcZ29K0lN/C3Buye21O8c8aLO
         SFATPVz2Q9cAd1jHZpdAEX4m/vCO/np2dZsb1I236AGWugmNNNDjts/3UGOEcL9eHUdF
         tWnLcxnwEuW+aJAeo5orEwi0G/d+gO1hDt44mhPqyxVp+LJA9h7Qr0Y3NBaMk4NJBM/e
         6l7jaUSDeGRstELlz+CQowISEKelpOEc5KYFdok9ApWhNw2BnVGoNHgTFh3qKXeTWCeP
         vDZw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Y+OTXv77AX0C0cMPm6faNErXglfPbiLBSMpBWMWLAMCj0wVdYCGcdwgApntxbgviLdz05MLj+GHLELwc3Pti@lists.infradead.org
X-Gm-Message-State: AFuF++nTL/zIC0KKzbZVGqC5eTlJiZhHoo/c4ADadkldfAQqpd8MpWf9
	wrzmdHH/2qvMqXc82psrcmryAw7xHYdvg+X5NF27W8ysA9duOxTDd584QH3wSLyYL98=
X-Gm-Gg: AR+sD134zh0jUJEie4bDrkSoS69Z4JIEUI6BRa7E3Duad0p4LCOlA2O+fFqzGVMoDki
	yCA/Va8X6CQc7vU2Z4L8Crp1KTSowq9uldFMmFlHfH7ZzdXNWWXLGS//otlfpmHe63846yKO4uU
	RZ+oOwZUg0L0d1pKHoYVdf2csVdWX6CQVKVc3c1dD8+hwnr7Vxid+EAmTuejgBjG9OzYn4TXiW/
	fRGaFSOlgyO1Evhct4/pcaQKo6ZDp85kRyZpLr2PfhpoKClguChtjVfpjKPag3Os/gMEhg2lfud
	46KMw0jt8BMH7lOAzpmVN5Mw5ZxUwg/zcLVHpjegL+C9adnwcfwOXC7VdIiO0jZ2IJsYz3Gf+Km
	nGRj+NY51Ahp3zLfAGHgavwyHZAFi/15L9ceCDY3f/A+l1rxVbRfRO3Z8TYRShD9jUMwj1yukJs
	V6Qw7SW20Z9eXBrki358P80UF2EchH1nXeKjqnpcKRDb0mLal41nxiDieofkZ+
X-Received: by 2002:a17:90b:4a4b:b0:38f:240d:b857 with SMTP id 98e67ed59e1d1-39580a4d03cmr10751457a91.2.1787157964497;
        Wed, 19 Aug 2026 09:46:04 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957f7c962csm3180844a91.0.2026.08.19.09.46.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 09:46:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Aug 2026 09:46:01 -0700
Message-Id: <DKT2MHJFPM96.3Q0I52V3283ER@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Andi Shyti"
 <andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260818-i2c-xiic-restore-runtime-pm-teardown-v3-1-5fd315b078e1@nexthop.ai> <aoVRETUfgS4FwMnq@ashevche-desk.local> <aoVRpS7EmL3YYBWH@ashevche-desk.local>
In-Reply-To: <aoVRpS7EmL3YYBWH@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_094605_959237_87391225 
X-CRM114-Status: GOOD (  18.40  )
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

On Tue Aug 18, 2026 at 11:48 PM PDT, Andy Shevchenko wrote:
> On Wed, Aug 19, 2026 at 09:45:41AM +0300, Andy Shevchenko wrote:
>> On Tue, Aug 18, 2026 at 08:35:10AM -0700, Abdurrahman Hussain wrote:
>
> ...
>
>> >  	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
>> >  	pm_runtime_use_autosuspend(dev);
>> > -	ret =3D devm_pm_runtime_set_active_enabled(dev);
>> > -	if (ret)
>> > -		return ret;
>> > +	/*
>> > +	 * Enable runtime PM by hand: devm_pm_runtime_set_active_enabled()
>> > +	 * tears down in an order that races the devm-enabled clock release =
and
>> > +	 * makes clk_core_disable() WARN (see xiic_i2c_remove()).
>> > +	 */
>> > +	pm_runtime_set_active(dev);
>> > +	pm_runtime_enable(dev);
>> > =20
>> >  	/* SCL frequency configuration */
>> >  	i2c->input_clk =3D clk_get_rate(i2c->clk);
>>=20
>> >  	ret =3D devm_request_threaded_irq(dev, irq, NULL, xiic_process,
>> >  					IRQF_ONESHOT, pdev->name, i2c);
>> >  	if (ret)
>> > -		return ret;
>> > +		goto err_pm_disable;
>>=20
>> This might be problematic now. You need to unwind the IRQ request in non=
-devm
>> manner as well. Scenario is that IRQ comes exactly after PM is disabled
>> in the error path. Is it a problem today? What about tomorrow (assuming =
some
>> new chips / code is added)?
>
> (To be clear: I'm talking about next call(s) that may fail, like xiic_rei=
nit()
>  later in the probe.)
>
>> The rule of thumb is that, no devm_*() call should be followed by a goto=
.

Makes sense. I haven't hit it on our hardware yet, but I understand the
concern: once the probe unwinds runtime PM by hand via goto, the
devm-registered handler stays live across that teardown (and across any
future failing step added after it). I'll switch to
request_threaded_irq()/free_irq() and free it explicitly in the probe
error path and in remove() for v4.

Thanks for careful review!

Best regards,
Abdurrahman

