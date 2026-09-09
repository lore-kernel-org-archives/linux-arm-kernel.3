Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F889C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 20:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7afDL+31SJFMeOGNst+LXN4XK7ERQT0EAu5rJfALKU=; b=TcJRHDNmODxGWkSVMoP6jrbOXD
	XmKugCv3lbPtcLbSzJGAdM6DkrnHedZJTM8tMv5YUbzgq76jAaxaFj0ZlufjKs/lpnUQ/45ipyyQ9
	9a0xBdxA5Ap+3aJRzgQWutdLVJULFOG+A/tnrBdwqKODEirpGFKIE7ImrsTS6Dp2TjJQlPjtueTM7
	PdnfQGGM5GpSYq+IG9HCsIYyCHrSlUHTXteSJ3o2IfdV6QR2Wpl5Ri8/3MwLssSMcmaiJy5vsYWJ4
	m8Xzs/qGS3Nlcw1Y5CSDJY353rotGAj5v1/g+iBoyTWOU544SB6lRA5aep478YEByC4z+DjoMGnwh
	Dqr0qenQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P3b-0000000Cooy-3kYT;
	Wed, 09 Sep 2026 20:38:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4P3Y-0000000CooH-40Zx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 20:38:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so87277365e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 13:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788986287; x=1789591087; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c7afDL+31SJFMeOGNst+LXN4XK7ERQT0EAu5rJfALKU=;
        b=TmZJIy2lPcxYey7ADp+x/1+uTu0IdHdOQNuhNFLy4ptkUqRopgzfI5j3K/11T2OswX
         A+pHSiusExrKm0jMfUsZfK8zidwPFAOlck+FfORvCrRs/52OEXSUJdtK+U4Qpc19ZkJj
         RaTogb7f/WF23zL0jtKpFcQRUr8vOy0ncd340W9xQ9YZ161DHUMn60cRXJdRUrrhCSMM
         wcBo2PZZzjSPKAT9e/XOii3q45RRF7RBZDrlvceACTtOKXG9ReVA0aMAX3HmUMtPWmW8
         aBQ6I8weAHjx7YeNM4HzF0Ev6nzB6XKd8j8I+ETlqeDfVpk4Dx/MIhngZgyN83FlYZ3x
         jaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986287; x=1789591087;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7afDL+31SJFMeOGNst+LXN4XK7ERQT0EAu5rJfALKU=;
        b=DTkAYvTGPi+FJvW/SLfdXQeyU6NMyWdFyWPjsnkmZW+rG4jIPY4GAq7k2IUOzzJLKa
         PwmaODIcFGyL2EQnHrudvwqFX5rffIlVxKuNJUFH22cN4/ERFczvVq0fWTUxhXlMzZD6
         v/J8J35aos4u0BGiITef3FWR6YAyKG7vDbyoBXZg4JvA5xpCWQexbeYB4VfH7JGnOzT+
         hmv9rZMfaOQ40b2YK+I/Jy6lJWFW3QiM2pZZA3C6ITZbFXK+0D1X+BbfOmCOHS22kcqS
         //oIqsPHM1JYKvb/NKrWEIs9HGNl4X5UckEqRxU2PTvquZbp3aSe4On4BGX9y73QJesU
         krsg==
X-Forwarded-Encrypted: i=1; AKwUvBxY7Vfthax/C2s8n97vvpKFynHiwIpXFu9XNnLXgTIvkW85XTt7q9OhtSmz3pWNMoJ9xro9UAJzLBxi9YWtGvKw@lists.infradead.org
X-Gm-Message-State: AFuF++kHrlA9pnvI56IZ1Xa3KrAlbAQww9guky+ihNG4XuFTOAv7HKZQ
	+vih0K5KxNmCgk7dt4JAtcDcKifb4aCdvFoO4mVZ1TxAUY5fLa8VZpSz
X-Gm-Gg: AYBFou2KIadqjlDx1E7T15qFVHq1YfV6A3GdF14YI82+pGE1ImseUOAzO1xuug+h2gy
	xsTKqkyC12aL/bhocJ7jSn//wj/LpxzIyzXoKaN1Djatg/CzqYoVMuhgl4Ufln5Czd+qQEONqFT
	XwuH4ZfvuwPeV62lffbilEGb/AaFIaD4Yk4cShWoS3V5emQzVn1d1yijDkRORH1uK1rJqIOmhZt
	KEBivvJs93/5qkYAUTxp2tDkSNom5/2slgGMsJcXQuU96iurn9eAM1LCM10QXjXA6kPhIsetxgN
	uYfzgedOom2OHG+jU8KLEVKbbGQHmQvzkxziv0aeF10FhgQnIwt2es+Qplul/fr8+BQ2DrxXbOC
	BBY9iGuYlAjXxSPl53vzyRlWLoyZIWja6joP/ygCDO2QJAH27ok0QHoGuKUJMQ5WDWKYIVZHw7t
	1LRFLCLOg5B15tyTdbPSz2TiooPsvhQrrfy2pOXEkBGQFaLJleWHZ2v6jWK8PE9gJp0qlhw1hRJ
	AtvULVqKqo9iEiQUhJ6tWHpRcaZGkPrjSTMP+tahYo=
X-Received: by 2002:a05:600c:3b02:b0:49c:fa21:1c7d with SMTP id 5b1f17b1804b1-49cfa211d76mr359028785e9.18.1788986286889;
        Wed, 09 Sep 2026 13:38:06 -0700 (PDT)
Received: from [192.168.0.40] (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20daed90sm6913595e9.2.2026.09.09.13.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 13:38:06 -0700 (PDT)
Message-ID: <af6cf493-c84e-41a1-a4d0-0460101f33a6@gmail.com>
Date: Wed, 9 Sep 2026 22:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add Raspberry Pi 5 RTC binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Jonathan Bell <jonathan@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>,
 linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260909141300.1368790-1-sander.speetjens@gmail.com>
 <20260909141300.1368790-2-sander.speetjens@gmail.com>
 <4c237cd8-024f-405e-a00e-e22ff9529d08@kernel.org>
 <8cd19ae8-372b-444b-bd2a-dc01221b5896@kernel.org>
Content-Language: en-US
From: Sander Speetjens <sander.speetjens@gmail.com>
In-Reply-To: <8cd19ae8-372b-444b-bd2a-dc01221b5896@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_133809_035962_1E31BCCA 
X-CRM114-Status: GOOD (  16.11  )
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

 > And more important, where is any interface to actually control the RTC?
 > I see nothing, so your firmware is? Then this is not a separate device
 > and you just added DTS for your driver, which is a no go (see writing
 > bindings).

The RTC is a physical, battery-backed RTC, but the Raspberry Pi
firmware exposes its register interface exclusively through the
firmware mailbox.

I initially used a firmware phandle so that the RTC driver could obtain
the existing rpi_firmware instance.

Based on your comment, I think it would be more appropriate to model
the RTC as a child device of rpi-firmware. The driver could then obtain
the firmware interface from its parent, rather than adding a phandle
solely for driver plumbing.

This would also mean moving the binding to
arm/bcm/raspberrypi,bcm2835-firmware.yaml.

Best regards,
Sander

On 9/9/26 17:54, Krzysztof Kozlowski wrote:
> On 09/09/2026 17:47, Krzysztof Kozlowski wrote:
>> On 09/09/2026 16:12, Sander Speetjens wrote:
>>> +
>>> +  firmware:
>> There is no such generic property. You need vendor prefix. Wasn't this
>> already discussed for Rpi? I feel like every time contributors send
>> downstream DTS ignoring what was discussed upstream.
>>
>>
>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>> +    description:
>>> +      Phandle to the Raspberry Pi firmware device.
>> You said nothing more than property name and type. Explain what for.
>>
> And more important, where is any interface to actually control the RTC?
> I see nothing, so your firmware is? Then this is not a separate device
> and you just added DTS for your driver, which is a no go (see writing
> bindings).
>
> Best regards,
> Krzysztof

