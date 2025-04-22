Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6425EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 21:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rO7p2Xz1WnscXWSSH5QPauUlR12Dd0rgVnR8sWH1ffU=; b=PT6513+TbFtODAwEAAxenRwvJQ
	GsejRuaAiJMz0yIFBxVbJTzOepp2jA4+4JcWkfZ2kv7LJFkdum8ObMrLz51gAs0bvgRgqy62DledS
	q8rT31KROrr9b5BUHr2j0OGdIL/Z+odXtiK/RhAD9sFJ5VbBbxh4Vyh8m3UJDUe9/zky9OnchV3R5
	uK9O4EZMWE7+i2vbuEZ9+10AQ2fbqhsd9NhJbW+4ODg4dvZrGXmQJ3HWn42YA12xKI1WCnf04Xc0V
	GkCDQsRafuWcp/JcdqGWcXlYcknK/aDe8qtU7zoGoFJCJDn2fuf7RZe3yqfiPdWFa+EluK+XcnNfE
	cLIzSfag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7LIe-00000008bkk-42Xc;
	Tue, 22 Apr 2025 21:37:04 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7K6W-00000008R0o-3Wch;
	Tue, 22 Apr 2025 20:20:30 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so40147925e9.2;
        Tue, 22 Apr 2025 13:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745353227; x=1745958027; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rO7p2Xz1WnscXWSSH5QPauUlR12Dd0rgVnR8sWH1ffU=;
        b=C2my+JlvnYlscWOr9OPM1jSyiTjaLJJABfXyEoPHBuEokN+4cRDUMpNZA1V6cxUoDg
         p9TaEifPfHqA1iPP00NC2aqJV/GBegNQpzohJRVmm+0fPfv9r1b969LEHKD7hQ8LHdTY
         E4+HQjcov4m4SglHt2V5qHFg0Z5/sFg1kudijwo5758sujBjH3x7rHbz5mRUDFJFHqwT
         mLrfIgpJM34IZWGqATQ3EBcF+7zNhMhxljyuJuJr1hfUP35BeVn+NZnT28dGdTvgTGVI
         FEp0Nce5NIR7ELOWM9kieWN6O5v8XO1sq3DAHZMj7Vu74xkno5XdO0cK/NZ0hMjGk8t4
         cEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745353227; x=1745958027;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rO7p2Xz1WnscXWSSH5QPauUlR12Dd0rgVnR8sWH1ffU=;
        b=j0nE3SXXDWmwJEwEyZ7CwNUg5sGXMJM/maZi+/z2ninxZ/TitEOaQils/oaxFm2Eb8
         dcFiDjHyMs6P1uwdwbyHejvCY9AlM6ezOtOzGgfiVKrzgy5eFd4YXQ+N+RJJVgq97WrO
         ZRjJWp7PaYQ7mr3emop76Lfqx3urhvIghq9lFr89MgDOfFf8EK/0qQjRV0bxSnRlCj07
         rIJ7aiaJj2ih0A8Dli69hLc4ysC49AehBT+TiJXDBI90O6vn2+a6zgMIrSa9DpRB8mSB
         BiPqxkowcUF/FetpgO0sHRMPJ/5aVWPOZMPdN2c2Z3Pdotg+a9UoFyA9ix/5XeFCm6lV
         X8MA==
X-Forwarded-Encrypted: i=1; AJvYcCUgl73JE5FbWJPF6zZmN99DB3QF/HR3zrDoq+grf3Z9c3/DjEz7CKAGuZ1W3xeUScocPnTcpvWMtBu2tQE0Di3P@lists.infradead.org, AJvYcCVNxlvpqDdwqJZi+xtdDH8yEARkbng8J1e9oI/oQ6YaufXiQFFeOfXtrrmUR+Ghwy5iFqlBik94AxEe+thd2H4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwPpkoY1fOw4tnM3blT2xnJt28+T8DNaLSAytJrwJvgW85PlQcI
	Wt/F0E7xYsOAPYvWd4iV6Hn8pgDEeqDps0zRsgxsDIXutsHiy+ln8WS2E7CIen8=
X-Gm-Gg: ASbGnctO/k+Vb+sWf3HwmwRA8Esf2ondb1xi7xz/1kF0ULbSKF+Hv96exqlqqZRSJAJ
	B0sTzy3le6HPhC3yCv1p7q9ttzD9NT70sZCQVzR33D1eEYcQ/F76RSzY/rgc2H+YxSqp4tamYO9
	C86XHaZPJehqjJf7uTOLAAPt+gfFsEpcpmdSeeIS5Y6RY2Pi3E6hyGMZPGElmUv1uT7QuF+tfgM
	DPOz2uZxBKYkScB5vDd7QDY5XE+fKTLcv7zkMQwFYXd/Txd4MiZpiJ5P/f/183Gl9E0IneOYZ8D
	WMQF46TRvT8UF6FRaxgLlygpZ5AKuDAWD2618zoauL3LwbE/Kpmjpjz4AoKRvCIbrFeaL+p2EhN
	XhyYvcW0+i2JLU35ds1du7ZtT3w==
X-Google-Smtp-Source: AGHT+IGmBmm3C/2jLNoVcpiFNaVQBfRpos13JsgNqrg+d7vr+5IZSCkCD3uFqGqFACXb0v+yv5GQTA==
X-Received: by 2002:a05:6000:4029:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-39efba454demr12515857f8f.24.1745353226923;
        Tue, 22 Apr 2025 13:20:26 -0700 (PDT)
Received: from ?IPV6:2a02:8010:6606:0:c8cf:b8a9:b26:a03f? ([2a02:8010:6606:0:c8cf:b8a9:b26:a03f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bef1sm16008927f8f.49.2025.04.22.13.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 13:20:26 -0700 (PDT)
Message-ID: <1997854d-c501-493b-91d5-c3640137f7a6@gmail.com>
Date: Tue, 22 Apr 2025 21:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port
 functionality
To: John Clark <inindev@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 mjuszkiewicz@redhat.com, sebastian.reichel@collabora.com, jonas@kwiboo.se
References: <20250419023715.16811-1-inindev@gmail.com>
 <bda07179-1ff4-46e4-9dda-ece9c63fd613@gmail.com>
 <20250422000748.59664-1-inindev@gmail.com>
Content-Language: en-GB
From: Hugh Cole-Baker <sigmaris@gmail.com>
In-Reply-To: <20250422000748.59664-1-inindev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_132028_900335_F2C36783 
X-CRM114-Status: GOOD (  23.46  )
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

On 22/04/2025 01:07, John Clark wrote:
> On Tue, Apr 22, 2025 at 00:12:02 +0100, Hugh Cole-Baker <sigmaris@gmail.com> wrote:
>> Hi John,
>>
>> On 19/04/2025 03:37, John Clark wrote:
>>> The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
>>> regulator disabled, gpio-58 out lo) due to misconfiguration. The
>>> original setup with regulator-always-on and regulator-boot-on forced
>>> the port on, masking the issue, but removing these properties revealed
>>> that the fusb302 driver was not enabling the regulator dynamically.
>>>
>>> Signed-off-by: John Clark <inindev@gmail.com>
>>> ---
>>>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 21 ++++++++++---------
>>>  1 file changed, 11 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> index cecfb788bf9e..8f2bd30786d9 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>>> @@ -174,8 +174,6 @@ vbus5v0_typec: regulator-vbus5v0-typec {
>>>  		gpio = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
>>>  		pinctrl-names = "default";
>>>  		pinctrl-0 = <&typec5v_pwren>;
>>> -		regulator-always-on;
>>> -		regulator-boot-on;
>>>  		regulator-name = "vbus5v0_typec";
>>> @@ -465,24 +461,30 @@ regulator-state-mem {
>>>  &i2c6 {
>>> -	clock-frequency = <200000>;
>>>  	status = "okay";
>>>
>>> -	fusb302: typec-portc@22 {
>>> +	usbc0: usb-typec@22 {
>>>  		compatible = "fcs,fusb302";
>>>  		connector {
>>>  			compatible = "usb-c-connector";
>>>  			data-role = "dual";
>>>  			label = "USB-C";
>>> -			power-role = "source";
>>> +			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
>>> +			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
>>> +			power-role = "dual";
>>> +			op-sink-microwatt = <1000000>;
>>> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>>>  			source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
>>> +			try-power-role = "source";
>>> +			typec-power-opmode = "3.0A";
>>
>> According to the manufacturer wiki [1] "Power Output Capacity" table, the USB-C
>> port maximum output is 5V/2A. So I think "1.5A" would be a better value here.
>>
>> [1]: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6
> 
> Hi Hugh,
> 
> Thank you for your feedback and for referencing the manufacturer’s wiki. To clarify, the line in question:
> 
> source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
> 
> was not modified in my patch. This value, which sets the USB-C port’s source capability to 5V/2A, is unchanged from the existing device tree.

source-pdos is OK, I was referring to the typec-power-opmode = "3.0A" line just
above where I commented. As I read it, that'd mean the board would advertise
via the CC pins that it could source 5V/3A when USB PD is not in use.
The wiki says it can only source up to 5V/2A.

br, Hugh

> 
> Furthermore, the schematic for the NanoPC-T6 and the vendor’s upstream Linux device tree (e.g., FriendlyARM’s kernel at https://github.com/friendlyarm/kernel-rockchip/blob/nanopi6-v6.1.y/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L346) also specify the source capability as 5V/2A. Given this consistency across the schematic and vendor sources, I believe 2A is an appropriate value for this configuration.
> 
> Please let me know if you have further concerns or suggestions!
> 
> Best regards,
> John Clark


