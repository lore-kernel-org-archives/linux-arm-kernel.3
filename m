Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08D1C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrkUPYLMl9LKtkW3M3SxTjU77noomALRO+sF6HlftGw=; b=anGUwc2u4V6rbR7UtWshiV/gg3
	AwCA47dfcwwZnQ0AqCvCu1m2eX0LshcVeqkEAlRjH9+Qn7U9C1hm5twE+aj36JBClecIJU7PCbIQs
	SL9ijPMO8ZB9Q/5oeL4RdXFKLQp6rtKq1j4Nkhuh0O/T5UvKbuHBqrmjuPK82wn8soZ32dPmhE4x4
	zSuDfE4IOOpwkQ2XXyZnjwND5oic7SN+2P6VoLc+sPEiFuAljhdmcnpss12OW+T2ptSQrBIH3+JDG
	BrEjf5q6So+t1BpDIQ+Q8z/b/L/T8IZm707Th07FitQJT/Lz866ICaAmZnWNTKfPeC9xkPAx3Nnx/
	lUnpBsJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8m2u-00000003WQW-3x7c;
	Mon, 21 Sep 2026 21:59:32 +0000
Received: from mail-ed2-x0f.google.com ([2a00:1450:4864:33::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8m2s-00000003WPn-2RMv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:59:31 +0000
Received: by mail-ed2-x0f.google.com with SMTP id 4fb4d7f45d1cf-6aa1d00daaaso6052731a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790027968; x=1790632768; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TrkUPYLMl9LKtkW3M3SxTjU77noomALRO+sF6HlftGw=;
        b=EECnGagN2r124kridownsGOVuDaehrDtrFDsf/Zz6GnBiuEZJrtp5etDmMr7FfubeH
         aQZj7pMAQuDQ1+k1kwRfbzLqoBx+UawxB6VY+ZDSqWKbhaiLLNMdQg+IboH/HlUUJiXp
         JPHEfSR14zKk4Zp7ZHKaIV496Yk4duG6LCry6Y/yqTyA8s0+mwFx2h5tL2IrxI00ST6L
         0AAAjaC915dBpV+OtTUCtSc4xT04ftc6iUyzLt4YA84Azl6BlnRTWDuNrFcfNgqFsdc6
         jN/9oDH1+f7PY+EVUotZRdipwJqq+jzVGaKAFqfRfBr3fY/NXQP4AHtiCztWlke+NjQs
         lkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027968; x=1790632768;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TrkUPYLMl9LKtkW3M3SxTjU77noomALRO+sF6HlftGw=;
        b=bj99g8YDmCUQPxWkWQPy6e25QHEUJrL14JkfXo+Xc9erYHOZCMLseKnrndHLWu4asF
         f8pTUWaUaX6lyR4Kj+jYbx0jjWb1AH6b7l8HjjivakRbyrxkGdoQpsLiSUIyfHVtNSUu
         L/9AcYK/6/7w+rNaDbSuFjGr/RU/7qlbHtIn0wNMfGOmGXTYFuj8SSnxB6qyb9F+aD3c
         /SLzhBeTRPa/cAr1MQiSTyKgTpr71bV9vQqe67BxJB8ZFJTSsXfNUL0Wspjs/w6dMVK0
         PIwzQpZk+qM1f+t43IrcZS06IFntPPx3dKdCgQ0OU31g5Tt1CIreWA7U8k+0dSympMny
         tEMw==
X-Forwarded-Encrypted: i=1; AKwUvByKwMZjfj1A2gmpTKvzvnSOEf0CJOuLXNi51VZO14Dqj0L+Kv8Tk4Eb9JUa5p+2xAhmyfA1W0iGTWvBPqOyzOGj@lists.infradead.org
X-Gm-Message-State: AFuF++kixdgloU43FLQZnjEebQSCQ4FgrfiMUx6mvXRH52YHQhO4pT5g
	V1404MPRtw0pv36GBi0aKdFuQnSftiz7kVm5/DyDb9TL/3XWhcWGx5BC
X-Gm-Gg: AYBFou1qPo9cuaDAvJgMOEgu78mjgTh9t1irhxyWkB9pL0RfpSIWKUX5JIcL3NK56Cl
	q703wvnooozY0RzSBsL3nhRT+2qsrdoxBOFYmBfJ51PZXKD4vc8Qz7y/YzE6u82pmAmcn3DrZP8
	xj5UIy4Z3urO7ZvWX3tnLRB2SMR8WNY9xCGr3iFJJ5b7w13Zjv+M0GnbF4Wj3JFjUQSRUTq2gDO
	Pn47+oDG+vhHFgdu6KD4wChfcYQ5TyLO8Hg5UPY0p+IBJ7+yo7QuPhE7mY/JrLEchjsH9g/yyNw
	68HdF/x2Meazfyt4kzauoI7A3t7W+2ZMUEtwlzdRhuwhDaS5+gvdagAS/BsjgFmcNCF44Hg0pGb
	lVl2Udk6eYPzo9yxrFVG+9Ulcge5Txr0ELoDtTh9NpFPdB1sc4JOQOSjrSBv8tkLhhauhXYVxZ6
	/Pl1p+KaMXlk5asrJl1WbVRCDn5B4rszbNVWTjhbji5UVw6DlCJj7HemNluL525on4hPkR++nb1
	lnIkOTUU1vfzYIh8W5XQAzfhQ==
X-Received: by 2002:a17:906:99c9:b0:c29:61b9:7b3b with SMTP id a640c23a62f3a-c2a15829440mr1024592366b.49.1790027968392;
        Mon, 21 Sep 2026 14:59:28 -0700 (PDT)
Received: from [192.168.33.7] ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a962c814fsm9185866b.34.2026.09.21.14.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:59:27 -0700 (PDT)
Message-ID: <7980fee5-f70a-426d-8cdc-d51e15323852@gmail.com>
Date: Mon, 21 Sep 2026 23:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 1/2] usb: bcma: add regulator support
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "moderated list:BROADCOM BCM5301X ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20260921214133.16519-1-rosenp@gmail.com>
 <20260921214133.16519-2-rosenp@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20260921214133.16519-2-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_145930_633147_4C23F711 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

W dniu 21.09.2026 o 23:41, Rosen Penev pisze:
> @@ -411,6 +422,14 @@ static int bcma_hcd_probe(struct bcma_device *core)
>   		return dev_err_probe(&core->dev, PTR_ERR(usb_dev->gpio_desc),
>   				     "error obtaining VCC GPIO");
>   
> +	usb_dev->regulator = devm_regulator_get(dev, "vbus");
> +	if (IS_ERR(usb_dev->regulator))
> +		return dev_err_probe(dev, PTR_ERR(usb_dev->regulator), "error obtaining VBUS regulator");

Did you test this for DT without VBUS? You seem to *require* regulator. Shouldn't you make it optional?


> +	err = regulator_enable(usb_dev->regulator);
> +	if (err)
> +		return dev_err_probe(dev, err, "error enabling VCC regulator");
> +

Can't you use one of devm helpers that get and enable regulator for you?

