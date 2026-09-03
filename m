Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CC0C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yM2SvBd8B0ZdcJRRaa1PvZZkDma2EirQ9rf6ZMaxoZw=; b=M0dQB7G1tgq6UapmbFYL01u8Wf
	3H28lujd+gXAJj+tuxSmQ15swi+vxQPW6aALWD6VGiDMjYmcm9QDOSXAJfmGm8APNvy25fRUpMaF4
	w3K6cSTorwLk6/dFvXpTPrSXc5MMDeKJceyFQa8v/6/lXtMvt6YKTACTypkK3cQYuIKWz9Ek+vIN7
	E2pfdEwAr+FYERUo6XmJMRcveqMJ5lpTfi5Qblw4qP7k1JdxhIf2s3TaUmox9mO2HTYcziECc/qAV
	ZFMM1t0aK/JIIa7v4hHGZsah9A1ovmLSHFwY4rvQOjonobygY/NBoYARqZfRGx9fW1f0pWPs7HEQp
	8/ArFViQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DlJ-00000000XJa-2Pwt;
	Thu, 03 Sep 2026 20:10:17 +0000
Received: from mail-pg1-x562.google.com ([2607:f8b0:4864:20::562])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2DlG-00000000XIn-3Uqx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 20:10:16 +0000
Received: by mail-pg1-x562.google.com with SMTP id 41be03b00d2f7-cbee846deecso503275a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 13:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788466214; x=1789071014;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yM2SvBd8B0ZdcJRRaa1PvZZkDma2EirQ9rf6ZMaxoZw=;
        b=no0O4M3qYB4/L9GTJw9InHsvWOBgwfG+tAeqXz+D47sTYc4D4Nzm2bqwfIh4NCiZOl
         HY6NtmhsiHVUPuY54sUUF2XDRx7JT6L+oVtg5TnKXSRo62bbJmjtIH1R+iwKOKYS9PP8
         7L3XZrdRSVsaliqd9kdUX99bjVFofVJlLvTrXB0/uEDeASUxaIXoFswEZvFM0w5k9Usi
         7Caj3QnnjqCRtxkhDJhbfLeOYb8Dl7YOcaVADXSxJ2Kwm5hkzWzZkZ8cD1ybo91DeEj/
         /z9+ag+iig7P8rJI/0LgUQMGqgBbkYUQFnWXzvFQRlOBGUzcuOvdnovJbWyhpIRYKKFm
         uqqg==
X-Forwarded-Encrypted: i=1; AKwUvBy/sQYXf1cDItRrU19hJMuBuvAJ0iMXzZWnp5+48vCGaCvOYfQjjQXfDcrTW5KSMLxB9rOLRcRp6HBsYSxt2+hy@lists.infradead.org
X-Gm-Message-State: AFuF++kgWIuGkAHBiDxpy0Xo8Zuh/IeQcovaS+qZ/9xa8h4jUjyDoGy8
	6Lnhsn/xDjhBDZNvez0i79ogEIip1q8R5zH3a4fPcd4SYZ9I31vh0A3DF0gTd59+I/ZAeNV/Kak
	gl9UFkDozPSqNOC50sJoY9pYE5YzSz7pZ+RTGMUjyLLVAXlrTd6b3oP6ltbxamXxrW6e/a4nbaE
	oHwK1vy0wUYlNioKyiG1S1H9GOf2KqJgli+4Vf9CE3ZsFZIYqwyjAAxq60vYx2Chhk7IC7JZZDN
	sMdHnVf2ttEMlhLy92RguUbzlBWSTjfAdg=
X-Gm-Gg: AYBFou0+zwSenRm0y5eS7YHnhOMPVPhDvyJnoAR9SXL+WradGYx2XH3smHE4suEqQ6L
	co3Sg7buloVCujQqEMS+yya5GZJ9F1xedYbgfdbhBgXcxNthMCJiOBP5nt9c5cfM23hyZoAIsAt
	tXbAOLPPoImy00Twl8yNBf83DWEi3ZG6QFdwNZShpiUdMOFvcOar6GotOgVvQ7zx6AdoF3ENLPZ
	Eo0PxIZI/4NsTj0wWP0zepiyHgaBlfUtfjQ7ZWmKu5qQs4fdJ9j8Vxo50Rffw5jA8gmvfLqDe2F
	QjHpDX1GsOaz5mporSu5iMkMda1r0IJe0WR1SbrIX5TnlNMcEELtnLqHjVsneim2LHoykp9BSQp
	Va+Tx7ljfkroXTxWH8esIk1UwktqjS3P8EJvYi/+0xpr+NraIN8IPsh/No3gRIImSC3oH5841OR
	T0WjLGnF6k66jAdRieDEBEUqUsOuisTk4XNknoxBSPPPY=
X-Received: by 2002:a17:90b:43:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-39b26141c79mr1742911a91.11.1788466211948;
        Thu, 03 Sep 2026 13:10:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39b1600a403sm1451017a91.4.2026.09.03.13.10.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:10:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91037946caeso3113956d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788466211; x=1789071011; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yM2SvBd8B0ZdcJRRaa1PvZZkDma2EirQ9rf6ZMaxoZw=;
        b=VyAM/gEVkvdstb/aAgCVwRpPzyM/vX4EfrYpGmyrMGjbpiTEZNH6BqaVO89k4eQNWy
         yEu7T3ufoRVDy+5nJq+gpELIel3Xdg/0ksGwU95aMScHO1u4rsyH77CvFa+X2bYOqrpu
         LeCy8eskKjIQ9XfHDAzUfBf2K3CHco+OSz/zI=
X-Forwarded-Encrypted: i=1; AKwUvBx8nOZZ1ldIIUNid/wLblgH16wxSJHdvZB48PDpNS8bWyLKemdfir98wY99CaYrms8EzJQGPZMzTfS0OicOc0fD@lists.infradead.org
X-Received: by 2002:a05:6214:410:b0:910:3179:7342 with SMTP id 6a1803df08f44-9103eefd244mr19674176d6.5.1788466210676;
        Thu, 03 Sep 2026 13:10:10 -0700 (PDT)
X-Received: by 2002:a05:6214:410:b0:910:3179:7342 with SMTP id 6a1803df08f44-9103eefd244mr19673486d6.5.1788466209956;
        Thu, 03 Sep 2026 13:10:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406871b6sm2886536d6.32.2026.09.03.13.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 13:10:09 -0700 (PDT)
Message-ID: <754d7b80-c776-4c38-bc47-301a3e69fa7d@broadcom.com>
Date: Thu, 3 Sep 2026 13:10:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: broadcom: bcm2712: Add USB OTG port
To: Andrea della Porta <andrea.porta@suse.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>,
 Phil Elwell <phil@raspberrypi.com>, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20260802145109.728793-1-pbrobinson@gmail.com>
 <20260802145109.728793-4-pbrobinson@gmail.com> <apl57BlWIkOWjWAu@apocalypse>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <apl57BlWIkOWjWAu@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_131014_892475_1CAC538C 
X-CRM114-Status: GOOD (  16.30  )
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

On 9/3/26 06:45, Andrea della Porta wrote:
> Hi Peter,
> 
> On 15:50 Sun 02 Aug     , Peter Robinson wrote:
>> The Raspberry Pi 5 has a USB2 OTG port wired up to the
>> Type-C that uses the same IP in earlier generations so
>> wire this up so it can be used.
>>
>> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
>> Cc: Florian Fainelli <florian.fainelli@broadcom.com>
>> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com
>> ---
>>   .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    |  6 +++++
>>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 25 +++++++++++++++++++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
>> index d998bfae91acb..e5030da60f9e7 100644
>> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
>> @@ -3,6 +3,7 @@
>>   
>>   #include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/input/input.h>
>> +#include <dt-bindings/power/raspberrypi-power.h>
>>   #include "bcm2712.dtsi"
>>   
>>   / {
>> @@ -239,6 +240,11 @@ bluetooth: bluetooth {
>>   	};
>>   };
>>   
>> +&usb {
>> +	power-domains = <&power RPI_POWER_DOMAIN_USB>;
>> +	status = "okay";
>> +};
>> +
>>   &hvs {
>>   	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
>>   	clock-names = "core", "disp";
>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> index c73ed9e066662..f650a5cd8462d 100644
>> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> @@ -55,6 +55,13 @@ clk_sw_baud: clk-sw-baud {
>>   			clock-frequency = <96000000>;
>>   			clock-output-names = "sw-baud";
>>   		};
>> +
>> +		clk_usb: clk-usb {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <480000000>;
>> +			clock-output-names = "otg";
>> +		};
>>   	};
>>   
>>   	cpus: cpus {
>> @@ -693,6 +700,19 @@ v3d: gpu@1002000000 {
>>   			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
>>   				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
>>   		};
>> +
>> +		usb: usb@100480000 {
> 
> Please fill in the missing 0 in the unit number. Apart from that, LGTM.

Took care of that while applying, good catch!
-- 
Florian

