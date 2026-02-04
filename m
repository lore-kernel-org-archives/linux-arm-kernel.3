Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4035E9D40F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dP9+SSaF4S/xGob3h6+xhj4HHf6/W4fGZ/oR1PAFXQ=; b=mr1Cd/fl8XdcQLqFtI+8JQL1GA
	5SLncwxw+Rr4JS/5whzZQoWwjQEhu4i6LvL5jY586LLtS4ncmhZH1gqLE5mL5JfBkhyGsa/YBLmYj
	RSkP9HnjHSBTmDOrAV7L7REt9/1MBHG8iwNAOkzBDcOwNA1xg4TnXfK8pItw/DgYokOqyj/nVH97d
	ZCZbdfXbYEZn7WNp1ETOyq+RzxQxraactXe3Nei64lzz36SinC57it/Q7aRA5VDO2Z7Ds7lhBtw+P
	mYsNMIfEKn7p6MuSJKU+1lO7zKHjPQQLnoj+gC6nX6RMfoWUkMSxUNmviIhbC1t3Jd1LQ1j7Kvpy2
	WS8LaKNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnh93-00000008tge-1oN9;
	Wed, 04 Feb 2026 17:58:29 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnh90-00000008tfW-1O34
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 17:58:27 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a7bced39cfso1269635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 09:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1770227905; x=1770832705; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dP9+SSaF4S/xGob3h6+xhj4HHf6/W4fGZ/oR1PAFXQ=;
        b=VO199pvnrnavVArTTYXAMPXQt7NA01ih8nY9E9o0CJRjRGxnbLy2M1SxyoKtKq+tfj
         qnQhmqtiRDMt0Y4jyoTcndARGxwOZ6Z4J6dBZ8vvkSBAvH1kKivYcne6D+C0h7ZcHTPK
         1DeCnFnfyY0kapUMNgd44FG3+T8bQlq0x4Ly7QI8Xm8ofi4YDNswVVkhTd3+u2IB8+y0
         1Zx9qKMa9gQUE6rMUU5RzwcrPwZEB5qseoJmiHRi9t8ByO3FZBDHmJfdE1zb/A3qltWr
         /GWPL7n2nNZRBh1IsRVt/MhVp7r80gTf+P5jDBPrmW+ZpMXwln0GDMO9ZA5lwEnOchnY
         roUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227905; x=1770832705;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dP9+SSaF4S/xGob3h6+xhj4HHf6/W4fGZ/oR1PAFXQ=;
        b=g8VtWfY7/SauMCbEVres88XwO9MG/uAxlZSrZFvezdTth9SGDRHog5P9cxLOh8OKo4
         R4OFWToLVgwvZ3OmeEPSunVzlkCbSj1V1fqIQw9hTkpcJyBLQvCks+BEtf+LgvD8zeoA
         jfF2DZeywPTHPBqe+7n9E35Re/p1xMnlHT1t8upMdpy4/BdQwhHxiE5cXGg6yjIpkj7f
         kMti1/FX/hlAlUTfYe/qk1V6y1zSS3pv4neofoiYqsSHeM/QslZU6N7yxZvdT0hRooCv
         G5xeGmMuPlBpTEAQL8IQ43OchqlrzMEguxFIxtBAWgRb+3DJTZGQVvDNVvQVmeC8jEa+
         i7fw==
X-Forwarded-Encrypted: i=1; AJvYcCUm9ccty2Rk2/NViGZOSJkYnoUc0KNZ/3LsLb4WVbv36HCHEca7BncONB/KPPhXVw0JIF+NTkWLzs1qpk9F5e74@lists.infradead.org
X-Gm-Message-State: AOJu0YxCHJYDiuHUXJgQQVf7mw6oxe8dw6n0VujEsOxU+iXkPybAtIw/
	Bd2SbPp/YC1XVw1JwBSAbnpd5rbpM+ybNSFVdeoVl7Qnc2JuhVXx2dn7FPkP+qRCU6Y=
X-Gm-Gg: AZuq6aJwFQw9bkCP/xkFpEWXxPPOtPBylwuQDXdayCWQgomR+CrtnE5D3wjFKa0/dA0
	uQ11t9IUEuXXV0XNvfFLKfrkhw086d5+6Lx/RzlRHJzU2cXqB60MACB9nvyuUD/IOMFm12g/mOR
	dL/8uK+aMz8xhFy09GvnpXCY6fZ3MWxYieAYOW5rdRAIKLlc1Gom75tF1Ge/xQiir1/3Zqs3+tf
	oGcXuis/vjXZQLO7ujAK9KYq2Ap4LSjDFne/JA3jg+00yvSZe3Qkftkz8sdIBzAeiCYIjXufYm3
	O1rjyvPdRTuVOYUEaaoq/ZIVVxUNrGmJ5nvE/CTvn43gpvxTySn2MAPRuN6wbo6bBIMl9S/ynuq
	B/wAHMx60sVqn/pvGom39MN01Agp4fBm/3sB/MGDRIxdSigSx8Ek0A48PiyccBM+ZmfDEt5KZBc
	sFOhjD+Nlb/LXD3T0+jTx1DH3vDAelkXBBdxE=
X-Received: by 2002:a17:903:1a86:b0:29e:e925:1abb with SMTP id d9443c01a7336-2a933e44bd1mr39524525ad.27.1770227905009;
        Wed, 04 Feb 2026 09:58:25 -0800 (PST)
Received: from smtpclient.apple ([50.47.115.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93394e84asm29646375ad.47.2026.02.04.09.58.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:58:24 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v10 1/7] i2c: xiic: switch to devres managed APIs
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <20260204100034.000050b2@huawei.com>
Date: Wed, 4 Feb 2026 09:58:14 -0800
Cc: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9BCFA228-EC6D-4084-A63E-060917C948E0@nexthop.ai>
References: <20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai>
 <20260204-i2c-xiic-v10-1-c2b996425235@nexthop.ai>
 <20260204100034.000050b2@huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_095826_383640_4E7CCDDD 
X-CRM114-Status: GOOD (  21.10  )
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



> On Feb 4, 2026, at 2:00=E2=80=AFAM, Jonathan Cameron =
<Jonathan.Cameron@huawei.com> wrote:
>=20
> On Wed, 04 Feb 2026 07:01:58 +0000
> Abdurrahman Hussain via B4 Relay =
<devnull+abdurrahman.nexthop.ai@kernel.org> wrote:
>=20
>> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>=20
>> Simplify the error code paths by switching to devres managed helper
>> functions.
>>=20
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>=20
> A quick drive by review whilst I have a coffee...
>=20
> 1st one is a taste thing. Second one is kind of a bug - be it one that
> I think is probably harmless.
>=20
>> ---
>> drivers/i2c/busses/i2c-xiic.c | 29 ++++++++++++-----------------
>> 1 file changed, 12 insertions(+), 17 deletions(-)
>>=20
>> diff --git a/drivers/i2c/busses/i2c-xiic.c =
b/drivers/i2c/busses/i2c-xiic.c
>> index 28015d77599d..16ff83fe280b 100644
>> --- a/drivers/i2c/busses/i2c-xiic.c
>> +++ b/drivers/i2c/busses/i2c-xiic.c
>> @@ -1423,6 +1423,7 @@ MODULE_DEVICE_TABLE(of, xiic_of_match);
>>=20
>> static int xiic_i2c_probe(struct platform_device *pdev)
>> {
>> + struct device *dev =3D &pdev->dev;
>> struct xiic_i2c *i2c;
>> struct xiic_i2c_platform_data *pdata;
>> const struct of_device_id *match;
>> @@ -1461,7 +1462,10 @@ static int xiic_i2c_probe(struct =
platform_device *pdev)
>> snprintf(i2c->adap.name, sizeof(i2c->adap.name),
>>  DRIVER_NAME " %s", pdev->name);
>>=20
>> - mutex_init(&i2c->lock);
>> + ret =3D devm_mutex_init(dev, &i2c->lock);
>> + if (ret)
>> + return ret;
>> +
>> spin_lock_init(&i2c->atomic_lock);
>>=20
>> i2c->clk =3D devm_clk_get_enabled(&pdev->dev, NULL);
>> @@ -1472,8 +1476,9 @@ static int xiic_i2c_probe(struct =
platform_device *pdev)
>> i2c->dev =3D &pdev->dev;
>> pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
>> pm_runtime_use_autosuspend(i2c->dev);
>> - pm_runtime_set_active(i2c->dev);
>> - pm_runtime_enable(i2c->dev);
>> + ret =3D devm_pm_runtime_set_active_enabled(dev);
>> + if (ret)
>> + return ret;
>>=20
>> /* SCL frequency configuration */
>> i2c->input_clk =3D clk_get_rate(i2c->clk);
>> @@ -1489,7 +1494,7 @@ static int xiic_i2c_probe(struct =
platform_device *pdev)
>>=20
>> if (ret < 0) {
>> dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
>> - goto err_pm_disable;
>> + return ret;
>> }
>>=20
>> i2c->singlemaster =3D
>> @@ -1508,16 +1513,14 @@ static int xiic_i2c_probe(struct =
platform_device *pdev)
>> i2c->endianness =3D BIG;
>>=20
>> ret =3D xiic_reinit(i2c);
>> - if (ret < 0) {
>> - dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");
>> - goto err_pm_disable;
>> - }
>> + if (ret)
>> + return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
>>=20
>> /* add i2c adapter to i2c tree */
>> ret =3D i2c_add_adapter(&i2c->adap);
>> if (ret) {
>> xiic_deinit(i2c);
>> - goto err_pm_disable;
>> + return ret;
>> }
>>=20
>> if (pdata) {
>> @@ -1529,12 +1532,6 @@ static int xiic_i2c_probe(struct =
platform_device *pdev)
>> dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
>> (unsigned long)res->start, irq, i2c->i2c_clk);
>>=20
>> - return 0;
>> -
>> -err_pm_disable:
>> - pm_runtime_disable(&pdev->dev);
>> - pm_runtime_set_suspended(&pdev->dev);
>> -
>> return ret;
> Trivial but if you are respinning...
> If you get here we know ret must be 0, so make that explicit to the =
reader as it
> was before with
> return 0;
>=20
> Otherwise they need to look up a few lines to realize that is true.

Thanks! Will fix in v11.

>=20
>> }
>>=20
>> @@ -1555,8 +1552,6 @@ static void xiic_i2c_remove(struct =
platform_device *pdev)
>> xiic_deinit(i2c);
>>=20
>> pm_runtime_put_sync(i2c->dev);
>> - pm_runtime_disable(&pdev->dev);
>> - pm_runtime_set_suspended(&pdev->dev);
>> pm_runtime_dont_use_autosuspend(&pdev->dev);
>=20
> Take a look at docs for the devm_runtime_enable() that is called
> by the cleanup for devm_pm_runtime_set_active_enabled()
>=20
> Short story, it will call pm_runtime_dont_use_autosuspend() for you

Thank you for the feedback Jonathan! Will fix in v11.


