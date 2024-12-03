Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C43E6C619
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfKWy1F7pYEgwpS+G6giCP7uqJsq7NFXHIZFcYCqRdo=; b=oCJ0mvXfjAqTdNYgaXrKki1BoU
	7QpCeMvfCTgiOTfkC3DTI2yb3HQZ4PuUwpkB5vIEmjbKWKJ+DNvj7ClOE/lNGbKS6IDTmO+KKUrD4
	Zkl5IbmRovNDQGdsf7RYnyH5Lb+Lh4RO5P0S5XtKtl8IylKOtGIO/rWZAOZYE4/zrgnY2JtiuNuam
	k18oXazd52OO3et5xKus6xttcBZD+miiVqQdIRPWHgkr6HQvzxH0ITrIiNdNMV8J8/GUgEJui5o5Z
	AseKOcTkyx22RaUfsF7V0mC3O+aVusBflPIo4FInIl4S3/axiFuk+1a+k4JinoyS0Bb7qVvBnDtGV
	9rDVTdtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOQf-00000008igF-33Yb;
	Tue, 03 Dec 2024 08:38:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOPf-00000008iPL-0ZLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 08:37:44 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-434b3e32e9dso44623855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 00:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733215060; x=1733819860; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BfKWy1F7pYEgwpS+G6giCP7uqJsq7NFXHIZFcYCqRdo=;
        b=a+6oeyWifKMymnppIdOFABCK4Bhj4XdX5aV0IeIKDttfEdpmHRhH+GTX71+HzM2Mv2
         cIAFnwYP5dVCxbAxeNevsXeZA+qVSPtCS/5bi3ClZrXchliuqswjCQ21WZiepmiosv3H
         naZ6DUbvCdq9IIQJAK0H3fNEADXIvBs0Wp10V8tHJL0/xTYlOdh1jiydVbhA5WrxIo53
         oOETUBDNxQzndoWPdFFgNCZo2/1hfvc8a50VXFaxU9I7VMu29bH0WTnHu6Yx/roXMKAw
         fcxJ9PCMzcXFt9NI2eM+wbuF7s8QVcEEgq73YCceWfdTS+6cHhq58vt/YZKNnnwLKeWN
         Q1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733215060; x=1733819860;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BfKWy1F7pYEgwpS+G6giCP7uqJsq7NFXHIZFcYCqRdo=;
        b=AJdRPg0IHuDcAeKgiQSrs24lQrAbMRSOUaRRyDAzEQfp1CgxlwmA0JjNaZ7VYnp7fl
         SgSB/+IefWI1mGEIpGe5uyGFl5nYTEii8h9yLCQlLtApUGugPgj1xvSDBI2B3hQ/knPm
         xEHuNN9frRw+qmyoC3jMNLk0JdC/VLWLhDehCBDUYieU+srRKsovc+SQ/1NmIt01P6lm
         RDGKjUUufXRZ5/hmbdpqOwJICl5eAK70FJ6hdcsn9SQPHATGMdaQEsGrB/0h5G/FNRQ5
         i8WxVaGnYPAmGCCSoJ1a9URGGlGt+R+8EagecensfsVd48CzKyafirXQxtrl+XLqN/97
         2Izg==
X-Forwarded-Encrypted: i=1; AJvYcCWb2KOAxKAE/XtHhQaS2VXeQlVmWWF+kOSvj90fn20pqdM78a+QMBQbMYH8lXPUFK4hmREy/T1hJx9S7O8hP+Bm@lists.infradead.org
X-Gm-Message-State: AOJu0YypuIlrVBRNZictzUMxbDQVKhF7W9S1vOhWH9wF2YmgqsOzGn/s
	ymN3s9l55KClszHSGTEYz+V7P+jreoYLZeHbebcfLBbapOIAKhH2nkfQ57sRyak1HP0ulxK65Rq
	o
X-Gm-Gg: ASbGncuCEEkylN6I/mgzp3zIev4PpjlpT/E5/XRSFHz4yyx/IqbBXeLSkQsyWokLtZj
	eJgf1fzr2kkmdLetSQHVjMrMAKYb6Qr15ru+1l/hV8QLEUnkeLvkrP7J9JzNnv4RtoNA9hvuw68
	pJO+N6+sOaN5kWLYbfp3VSH/W1ubpKZQxkzN0rP+3Ap84HxgrJZ2+MaAM/oV1I/03rzTrar2nHq
	g97oTQYy+fczea75p7tG5K2AczAyBX4pHZhv6uc13Viu6UpMnRbDmjPFxA=
X-Google-Smtp-Source: AGHT+IE3H3bcSinK5Q3eRdpnA47MzQBNmGfvbe9r3ouVy8hLnAWthl84xXpTMD1MB7r7vaAGmTp6AQ==
X-Received: by 2002:a5d:598c:0:b0:385:ea2b:12cc with SMTP id ffacd0b85a97d-385fd3e779bmr1474754f8f.13.1733215059572;
        Tue, 03 Dec 2024 00:37:39 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f32837sm184681645e9.33.2024.12.03.00.37.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 00:37:39 -0800 (PST)
Message-ID: <b1e053da-04dd-4b66-86c4-60e1d6b5a5a2@tuxon.dev>
Date: Tue, 3 Dec 2024 10:37:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: microchip: sam9x75_curiosity: Add power
 monitor support
Content-Language: en-US
To: Mihai.Sain@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241122080523.3941-1-mihai.sain@microchip.com>
 <20241122080523.3941-3-mihai.sain@microchip.com>
 <2d8dd1c8-fd4b-4dc1-ba62-312ac86335a6@tuxon.dev>
 <PH8PR11MB68043702680864433060E9B482352@PH8PR11MB6804.namprd11.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <PH8PR11MB68043702680864433060E9B482352@PH8PR11MB6804.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_003743_363977_FCF344FF 
X-CRM114-Status: GOOD (  13.03  )
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

Hi, Mihai,

On 02.12.2024 10:32, Mihai.Sain@microchip.com wrote:
> Hi Claudiu,
> 
>>> +             channel@2 {
>>> +                     reg = <0x2>;
>>> +                     shunt-resistor-micro-ohms = <10000>;
>>> +                     label = "VDDOUT4";
>>
>> On the schematics at [1] this seems to be named DCDC4. Is there a mistake on
>> [1] or this patch needs adjustments? If so, I can do it while applying.
> 
> I just wanted to use a more friendly name for buck4, since this regulator is not used.

For consistency with the rest of the channel names and the fact that we
describe the HW though device tree, I would keep the schematics naming
("DCDC4" in this case). No need to re-send, I can adjust while applying.
Just let me know if all good with you, too.

Thank you,
Claudiu

> 
>>
>> Thank you,
>> Claudiu
>>
>> [1]
>> https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocumen
>> ts/UserGuides/SAM9X75-Curiosity-User-Guide-DS60001859.pdf
>>
> 
> Regards,
> Mihai

