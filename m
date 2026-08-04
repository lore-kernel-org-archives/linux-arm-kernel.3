Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0271CC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqptnEF5UgYmd45YEaHNyWvrU1VG+w375D9PvPQlhLU=; b=iEW3rDQ9OoEzbQEYL2zR9daokC
	FPaTXMpJ/xjU2ONXveaaqryf9OQt5x7iB/onwfQL7DOUD9PbBIBO863zplozg5QVhAdVKO9ZqNA0p
	WzMIgpLxLZAylPL17BIqKpBwU/YBgujU9QoV8IXSnlZ54D2DiEvam2VAO68mEuqiJU3+KMaT5szeK
	vZqCe3CJCsAHQVsINuS0X5M3F8QViOk0MYYQQQxC7uvIiKYRbYEjvf5QQi3S1fkDOLnaXBO8brzFc
	bdij/O7/tL1sWsknm4VbU7chiPTOTaKpOg89bbuaJRLnrYuYd7Ef6BnWwq5Wdin/SlMTCf0s3sTnZ
	kTGOp2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8F0-000000015OJ-3SXv;
	Tue, 04 Aug 2026 06:03:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr8Ey-000000015No-0iFE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 06:03:05 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso32469465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 23:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785823383; x=1786428183; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dqptnEF5UgYmd45YEaHNyWvrU1VG+w375D9PvPQlhLU=;
        b=rIvJblllYClcChpRCrI7A6BEyHiXsI+QVcXqk95J7yvXgqnQsdCvtCivj+G9rL7Myq
         I/l9hDcERyFebxHpXX0XnZ5ivXBwaOFaxjNlvmdWzzINAfE4xTVx1ncD41s4KGcUjYzT
         +Zx3HGJUH0s8Rzl+9xiYgdfxxm3PsOijrbDy2mKcVJ6Z9Uk3UD4PDfnff/Rm5+s3H6qR
         1HnkOBYkZICVlin3bX5RWmO4D9Irl+m2KJKYWnJr+dJWapnV1Fq0GTGRUv7pOV6AZdNT
         cFRxGBfBAZYK6UwZrBvbRFzqvz2Iy1QCJ/UEwalg23M4wNui0vv+I88HYbizkFq5tfAS
         Ycpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823383; x=1786428183;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dqptnEF5UgYmd45YEaHNyWvrU1VG+w375D9PvPQlhLU=;
        b=oz9pT0DD7EJh5xOhYRmUOwAQHSFEsvpKpfmyu9vH8ObsmgZywFaxXoplBzkvKW6PuP
         cFCjotk1FMvJqy6k1Ue42NrnIfSRd3Yy4J+z1+NecY69Js+AXnOU8mnj0i7eCOfDwbLA
         Ezo1y+G0xxgyFJxvLVDbj6LsfTPWb/39IDV4BSLLzZeTFuJMjG3uJzelWFs0GKrissE8
         pH5jQEofneXw37GA78j3tLwmOMigFoD+7JYofAknwqiJauQYUGdArA2mqe3gxRxE5emU
         H5hPpoM2kNTLgEHP/Wqk/Rt56vJGg7n0e5uKQSnRFKEPZqYoWcPoqklIjmUnmSjY6V6i
         Doyg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0Pw1/27Aq3hCgMWktErtOgidZ4RNivw7X9Ck2Gb5W7S/4vK8f3H4ZqP3y2esozAsg/4kG7O7IKMtzGfpIRnzi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj2tXPk2woUmFgxcjmofEBWQI5yvGhr2PakOaOPXKRyg2QVkek
	6vAh2gan8bfNTQrxBaDsLleYZJVDNr6Sal3zkpOcCDd1Y6DaMDy5SUe/uPt26Q==
X-Gm-Gg: AR+sD13eZBck74ay3k3DYlz3MGqXcc2AW/vCWt2A9csYpnIgbm3spkFd2Qx9Wa5v4gA
	Bo7wkT79Rtt1LFyjlHXeNZ3/ZLmUOVdFGlJZ2WFHGv6HsvL0e+iKU1u5Hl/VdxusgZ38e9keZy5
	d0E4BkCBOiVblLHXx6iP9c1TOfZ7GARQ93IhTYCGemyDrZxIzfANxd547b3nKNBtzYXhSV53cXt
	ZRZcxEte2nXKk2/bShXKNWOJCs3Bn5P7u0xvtGCTSTIIEj0L3SispKeHUsci4kFqIHGKSkf6vTI
	dSjvNV8YWFMsWtlabH+1qIGrdrExd+pQgb32fXOxose/kp0Xd0dWqw8BGoBdLpporByBuEHcMuC
	vOJ2ArkZ2FTs/R+XtVO5Z8sw/KVuCG/qtdRGrmnAwnMS3JZa6RBq0WH6toB7rjoqvE0WylvhUhO
	H9vkgDUgSRg82XABOzWVNNUM/hWkK1yz/ytLTePn5Kzg8sKVHvfRm8EO9iiKuuhE41l4/v5Lugo
	d8Uiu47C4rcfLbSvnfDCF5Q+kUErWPVk8Ao
X-Received: by 2002:a17:903:185:b0:2ca:52ce:6f91 with SMTP id d9443c01a7336-2d0522983b5mr136311625ad.27.1785823382566;
        Mon, 03 Aug 2026 23:03:02 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa492c74sm98315ad.54.2026.08.03.23.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 23:03:02 -0700 (PDT)
Message-ID: <db91085b-ae1e-4cfd-8f8e-89c379684303@gmail.com>
Date: Tue, 4 Aug 2026 14:02:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] i2c: ma35d1: Add Nuvoton MA35D1 I2C driver support
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20260727081859.1737223-1-zychennvt@gmail.com>
 <20260727081859.1737223-3-zychennvt@gmail.com>
 <ampnhe-GqNoQwmJZ@zenone.zhora.eu>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <ampnhe-GqNoQwmJZ@zenone.zhora.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_230304_209673_E913510A 
X-CRM114-Status: GOOD (  19.61  )
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


Hi Andi,

Andi Shyti 於 2026/7/30 上午 05:06 寫道:
> Hi Zi-Yu,
> 
> ...
> 
>> +static void ma35d1_i2c_stop(struct ma35d1_i2c *i2c, int ret)
>> +{
>> +	ma35d1_i2c_write_ctl(i2c, MA35_CTL_STO_SI);
> 
> I think there is a valid review from sashiko here.
> 
Address sashiko's review, I will introduce a new helper to handle
bus errors and spurious interrupts based on the current state, while
keeping ma35d1_i2c_stop() unchanged and used exclusively during
active transfers.

>> +	if (ret)
>> +		i2c->err = ret;
>> +
>> +	ma35d1_i2c_controller_complete(i2c);
>> +}
> 
> ...
> 
>> +static irqreturn_t ma35d1_i2c_irq(int irqno, void *dev_id)
>> +{
>> +	struct ma35d1_i2c *i2c = dev_id;
>> +	unsigned long status;
>> +
>> +	status = readl(i2c->regs + MA35_STATUS0);
>> +
>> +	if (status == MA35_BUS_ERROR) {
>> +		dev_err(i2c->dev, "Bus error during transfer\n");
>> +		ma35d1_i2c_stop(i2c, -EIO);
>> +		goto out;
>> +	}
>> +
>> +	if (ma35d1_is_controller_status(status))
>> +		ma35d1_i2c_irq_controller_trx(i2c, status);
>> +	else
>> +		ma35d1_i2c_irq_target_trx(i2c, status);
> 
> Why are these functions void? We should at least print an error
> in case of failures.
> 
Agree.
Changed the return types of both TRX helper functions to irqreturn_t.
On unhandled/unknown status codes, will return IRQ_NONE.

>> +
>> +out:
>> +	return IRQ_HANDLED;
>> +}
> 
> ...
> 
>> +static int ma35d1_i2c_probe(struct platform_device *pdev)
>> +{
>> +	struct ma35d1_i2c *i2c;
>> +	struct resource *res;
>> +	int ret, clkdiv;
>> +	u32 val;
>> +	unsigned int busfreq;
> 
> you can immediately initialize busfreq here.
Sure.

> 
>> +	struct device *dev = &pdev->dev;
> 
> nit: can you please sort the declaration by line length, in a
> reverse christmast tree shape?
Sure.
> 
>> +	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
>> +	if (!i2c)
>> +		return -ENOMEM;
> 
> ...
> 
>> +	ret = devm_add_action_or_reset(dev, ma35d1_i2c_pm_cleanup, dev);
>> +	if (ret)
>> +		goto rpm_put;
>> +
>> +	writel(MA35_CTL_I2CEN | MA35_CTL_INTEN, i2c->regs + MA35_CTL0);
>> +	writel(FIELD_PREP(MA35_CLKDIV_MSK, clkdiv), i2c->regs + MA35_CLKDIV);
>> +
>> +	ret = devm_request_irq(dev, i2c->irq, ma35d1_i2c_irq, 0, dev_name(dev),
>> +			       i2c);
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "cannot claim IRQ %d\n", i2c->irq);
>> +		goto rpm_put;
> 
> The actions in rpm_put are executed twice, considering
> devm_add_action_or_reset.
> 
Agree.
Removed the redundant rpm_put label and changed error paths to return
ret directly, leaving PM cleanup to devm_add_action_or_reset().

All these changes will be included in v8.

> Thanks,
> Andi
> 
>> +	}

Best regards,
Zi-Yu

