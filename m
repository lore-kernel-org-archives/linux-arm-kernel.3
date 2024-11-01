Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6250FE6F066
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjnycSKe7PLm9xEIfiXtceGbvBfhF7/8n6iYzZypH+Y=; b=0Pu9YSprAqz41gRVfUZmpPXlN/
	RRsb3utDvcUWxXFQ25zI4swnkbqr9u6hvqOg0JZxTwazQzhJEBEo99dsjt5Dq7YKhAlHUR+lKGZjb
	a4RH/7HADMbrcOMCMHtNUo4/5Z7bUwhvqZnGaSFa6WYqPK+VG98sexMNyXYX/y9oe/tS8ftc3O+pe
	4yhTAaPtIBMFTkwHau7eWR3PPwyYv9gA0v42ZmpzgVxvT7pk2wwbVt9RWh0GkRgKURBmFa6hIg2Cs
	HsAdr99jRPw+jBhThswLRkJmeDj5PfgCGpRhvF0NMztBJVTwF7eeXNRCTitqL3+NbsoSvRAOPa2MO
	pmFMZL8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tJ1-00000007Sdi-3YP4;
	Fri, 01 Nov 2024 15:11:20 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tHK-00000007SLT-0jSC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:09:36 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-72041ff06a0so1792780b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730473772; x=1731078572; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gjnycSKe7PLm9xEIfiXtceGbvBfhF7/8n6iYzZypH+Y=;
        b=S3B+TUNESzuIRmVjFhqv/PdhnGk6evb/CFSE4kiWQ3A4I1skCZx4jn0NN6Gn7usIoD
         IQF0j8WZsfWqDu3jfqFi6kG2Am9gfp8oBHNMu3NByYXRGK4kGuhdxu88SWMTPWVWEgtX
         OX21t2WAo6dkW560RCZX026TgDMqZSTxAGnxBU22KsH1pWgq0s5UUVkRQdLZtpsVjToL
         PyirUhJdyqM4E7+GOib6JtrQTTCo3ajzQ20CxL540fssNZ8ZqgaIKRnPPIqoBLWieyz7
         3JhsTyt60HA89j3OmUzMYLjhjUOtVyfTPuQWq+ywiM4Yeh2255McBzDlRT3Ht2EYceuP
         llyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730473772; x=1731078572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gjnycSKe7PLm9xEIfiXtceGbvBfhF7/8n6iYzZypH+Y=;
        b=jxgNaxXxEyDUumg6x3JAdRtShvZtrJF41Auz0gtNCM0Sr1ltajVjZQS4ylzYhkiHQb
         ceVSjHxpPEBB2N21lH9Kv1Svb9GmTjZowyKhxORWfWpvRDpFOSAe5d0zb7QC6utTCYFw
         IgLutqYjbOXg1gLjFFDJc3AgQ5RZ2Azr0DyF8LPpa7iXQ8AJYRmwJwLai+sAjKhZFnGi
         KzcTs0Paj5GuCwDTAvoIFaMaWJGsRxC2MR1mO2zEHxvLlhXpL3WD6p8W+pv87fHoJGy5
         yGLFlh0LvM0ZzhMjh8K0nKBmwpUNht1FtJTG7DNLp7X77u82V+kAjUV5PeXpxXb5dV0v
         xMpg==
X-Forwarded-Encrypted: i=1; AJvYcCWR3/7J6AtZ9dCjRX2a72x8Xkmwby2SIgr2SVyUugdQ5LSjWoVnN1khiq1lPCxoOfI0cQgsWnIQuppTfcrV07Re@lists.infradead.org
X-Gm-Message-State: AOJu0YzAORjiv02JcKDXuDNdmjsMBgOhJv6u5LJv6+0+MPzSHJ23H34O
	kZeio7uKjVaeRSa+8nyqeW1nJylbqsvmWmo1uc6gDaeZOVVT9DXX
X-Google-Smtp-Source: AGHT+IGj1ICWG+enL/mz+nRHk/RtiB2DmVTTu6rkphqnle4KBHonuvB3QqFfG5gzDuZ4/b49o0GKyg==
X-Received: by 2002:a05:6a00:3c91:b0:720:75c2:7a92 with SMTP id d2e1a72fcca58-720c98d32b7mr5329009b3a.15.1730473772025;
        Fri, 01 Nov 2024 08:09:32 -0700 (PDT)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c38c7sm2745972b3a.125.2024.11.01.08.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 08:09:31 -0700 (PDT)
Message-ID: <b0e81bfe-f7d3-475c-95af-7824d60deed9@gmail.com>
Date: Fri, 1 Nov 2024 23:09:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH asahi-soc/dt 04/10] arm64: dts: apple: t7000: Add PMGR
 node
To: Rob Herring <robh@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241029010526.42052-1-towinchenmi@gmail.com>
 <20241029010526.42052-5-towinchenmi@gmail.com>
 <CAL_JsqLv2DJOsL=3bxf229ZdArL1TqArw+9cLtmjYMkm5yfZ7Q@mail.gmail.com>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <CAL_JsqLv2DJOsL=3bxf229ZdArL1TqArw+9cLtmjYMkm5yfZ7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_080934_240743_6A9B182F 
X-CRM114-Status: GOOD (  13.82  )
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



On 1/11/2024 21:04, Rob Herring wrote:
> On Mon, Oct 28, 2024 at 8:06 PM Nick Chan <towinchenmi@gmail.com> wrote:
>>
>> This adds the PMGR node and all known power state subnodes. Since there
>> are a large number of them, let's put them in a separate file to include.
>>
>> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
>> ---
>>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>>  arch/arm64/boot/dts/apple/t7000-handheld.dtsi |   4 +
>>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
>>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>>  arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
>>  arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++++++++
>>  arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
>>  7 files changed, 672 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/apple/t7000-6.dtsi b/arch/arm64/boot/dts/apple/t7000-6.dtsi
>> index f60ea4a4a387..77d74d6af1c4 100644
>> --- a/arch/arm64/boot/dts/apple/t7000-6.dtsi
>> +++ b/arch/arm64/boot/dts/apple/t7000-6.dtsi
>> @@ -48,3 +48,7 @@ switch-mute {
>>                 };
>>         };
>>  };
>> +
>> +&framebuffer0 {
>> +       power-domains = <&ps_disp0 &ps_mipi_dsi>;
>> +};
>> diff --git a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
>> index 8984c9ec6cc8..566346be5b53 100644
>> --- a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
>> +++ b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
>> @@ -10,6 +10,10 @@
>>   */
>>
>>  / {
>> +       aliases {
>> +               framebuffer0 = &framebuffer0;
> 
> Looks like an unrelated change. Also, not a standard alias name. So please drop.
Alright, (for other SoCs as well) the next version will not have any
"framebuffer0"
aliases additions.

> 
> Rob

Nick Chan

