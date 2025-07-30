Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D59C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 21:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTZ24rJm+Pue1YLQjE0bpMb81Dlei+K5VJgH8GnuVPg=; b=j4T8Kcz9V/0PGEPb+PCmCaZ2FJ
	Z4O855ZfhctSl4aRq55LABNg8KFYQ++btUYcvdMubX8V1Fzfg699hbWRLNxtkcts39yXqr5z8YcwK
	r+l69SZuC4pN7dw2vXKRLK2E2v0i+8er+hOIXP2A6f5FO5pOi1iy2ufAMAljlzV2KQsb8gfCXcwg+
	9ksOIaQ7qgGyMZGMQTNpiVbwCbVauu554o4IkM2wRYOD3GF4/9W+o3qL21fysSv3F3ImQplj1xji2
	njkNZakd/rv9O6SAqdhP0+uUgyyCqe4T0VeepMw9o/RKMy6ElZ5Ds9mVopPIiK58R03uY5cfP2XW3
	yy8MTDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhEYQ-00000002V8n-0F6p;
	Wed, 30 Jul 2025 21:41:42 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhE9W-00000002T0r-0IMc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 21:15:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b79bd3b1f7so65661f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 14:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753910156; x=1754514956; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTZ24rJm+Pue1YLQjE0bpMb81Dlei+K5VJgH8GnuVPg=;
        b=mhqf2Rxa5voQLJjmR6VAv39svPB2E8LmkN7WHfY9incmmteNXMoDXdeqcyoUVwIRIU
         M7IUOzcm1kleB44CnlT1H1ZomjDtPbjbzZGTUiLOTxBbxzb9IbTHeCmBRdXscZLqJbg+
         pOlt7h22h5FbREIgNZMpqaHyiNh41HOpaKO4odm72FEoP+fAj5vb6gQo+7epm2hgtS6k
         b+KTzHV6AZcE7Ku/uESaNXh5TQly6mR5lFy3Mk37omZvBkWsrB+DkQYvTzdjIWhX4T/W
         BmsaVkZtWkFgrvte8IgDM177KGCeItZHTep5KpTAe6Y6ugsVa/iogAP1TijK1rsmx+vQ
         h2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910156; x=1754514956;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTZ24rJm+Pue1YLQjE0bpMb81Dlei+K5VJgH8GnuVPg=;
        b=VxvQHzJGREuPupCcjXFReM8QR56SRZo/lS1J6IOpzvdTVtPgAKweExuQZ61qmy/LCF
         AqxclkXBkrdYjAMeIcNS58sXNCl04ZtljCdXAfTiDCK4/Zv4NUljNaebcR3RW5VsnX7y
         LCD0Qx1ndQRfiQgQ9arbhmMdqq1352fkZsA40vvWxnhzi9D6AdEJNW43JLsMytZ6L0/I
         OoZSvDx8bphdBTwSch4TRSNe6MWJjCakwjj5j74BF+J6AmTUyRlLXJhClGTlIloD7g1B
         CYZDXoTY4PseJ1q7OWhHYJhyqvJf/CCBK06OHfSYPmaewc3g0F7uvHiWdvugeyJu/Xun
         kPIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfrngIq79QnEb998T+8Ryvwm1S1egtdW7sBQdqxFtKnG7lF2i5MGlU3YorIAPgli75oui4B8cxy+pBb2PZKAgS@lists.infradead.org
X-Gm-Message-State: AOJu0YxE9SpJq2Enl6wTKjcHzQGHS/66lW0qh/uEhvfweBLdYm4wwyL/
	tgcAufU3sdgDuSI6qohudtf5VGyolzeZaGthhfLyZKjemmjetU9pIXJgUJY+Iv1iJJA=
X-Gm-Gg: ASbGncv+NqeqMYFB59HnnLegbdVMi5clghtl+K9h5a/YDlRC0V/l8QORCUcj79j5hH+
	+mztyh7rXDsFYQ6h8JLOJuPtyFZLxctld2lLjb3IdQNlySHXiwtEEdkbS3Lfn8DH3eOP/dNP/+4
	UjgIn/9ktzBOuAWgZvYYHxPiKl1/YDnntHq5qLwcbEcaPUFC/KKgOzQaGXNS5YEqNfuJc7aUhuI
	HOzLU/ba/EmBkYdiNC8F92/G/QiFckOCjkUWKo3X9/K+gDmwe7SlI1S/qHU8TKMLDTnfZzDPOSA
	fgoRRSJTAp3ivLRtR6B9JI56aNpUDqH/MV+HrfTU9zw+t/ugyXOzL76TcO7yrzPF2nvqSi8CVJ+
	RDC984PE1rJcylSFCciTdLdYpEHpQjZP5A1D5BFvhrSfs7KtmuXzYBs56rna45g==
X-Google-Smtp-Source: AGHT+IHQkznpibqUF8XL+omLAf+uDsGuaH8lAZ0YQHFkhu+hPUSUSN7QyTWCfS2BgMUd882X/GeefQ==
X-Received: by 2002:a05:6000:1a8d:b0:3b7:8481:e365 with SMTP id ffacd0b85a97d-3b794fbe269mr3794834f8f.10.1753910156462;
        Wed, 30 Jul 2025 14:15:56 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm122454f8f.39.2025.07.30.14.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 14:15:55 -0700 (PDT)
Message-ID: <87d40626-8789-4e71-8ac3-fa8fff0a7435@linaro.org>
Date: Wed, 30 Jul 2025 23:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: s32g274-rd2: Enable the STM timers
To: Frank Li <Frank.li@nxp.com>
Cc: mbrugger@suse.com, chester62515@gmail.com,
 ghennadi.procopciuc@oss.nxp.com, shawnguo@kernel.org,
 s.hauer@pengutronix.de, s32@nxp.com, kernel@pengutronix.de,
 festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
 Thomas Fossati <thomas.fossati@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
 <20250730195022.449894-3-daniel.lezcano@linaro.org>
 <aIp+4mWS1k73Vf/A@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <aIp+4mWS1k73Vf/A@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_141558_109005_AC21A2F0 
X-CRM114-Status: GOOD (  15.75  )
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

On 30/07/2025 22:21, Frank Li wrote:
> On Wed, Jul 30, 2025 at 09:50:15PM +0200, Daniel Lezcano wrote:
>> Enable the timers STM0 -> STM3 on the s32g274-rd2
>>
>> The platform has 4 CPUs and the Linux STM timer driver is per
>> CPU. Enable 4 timers which will be used, other timers are useless for
>> the Linux kernel and there is no benefit to enable them.
> 
> S32 have not ARM local timer? It is quite strange!

I'm not saying there is no architected timers but there are the STM. May 
be I can reword the sentence to prevent this ambiguity.

>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>> Cc: Thomas Fossati <thomas.fossati@linaro.org>
>> ---
>>   arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
>> index b5ba51696f43..505776d19151 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
>> +++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
>> @@ -40,6 +40,22 @@ &uart1 {
>>   	status = "okay";
>>   };
>>
>> +&stm0 {
>> +	status = "okay";
>> +};
>> +
>> +&stm1 {
>> +	status = "okay";
>> +};
>> +
>> +&stm2 {
>> +	status = "okay";
>> +};
>> +
>> +&stm3 {
>> +	status = "okay";
>> +};
>> +
>>   &usdhc0 {
>>   	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>>   	pinctrl-0 = <&pinctrl_usdhc0>;
>> --
>> 2.43.0
>>


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

