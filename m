Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF46ECA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24qH0Sswquq+jWyuu2MbZpKldoNeCC2aANfHuwWayUg=; b=B1E4XDy42gktyoYbSUNfHg/Uaf
	jeBiUjz3LNGIKRnVdFeahuhcGNhlKGsPsRuGelfHkb+p0yxA/jdNwwkvziOwMWaJpEpXm3kFmqe2s
	3qVhF/QiS5q78XK8R7RpavNE+VPOmxVdT4Rr6HlHgkKq4OygRkLdQPNyp3KjgD3g4A8IJ6ccbrZFr
	50LvLw5jR3jaJSNdOyHVDlzASDsW93Y1PNZxxMiJAS7OxNbEyfjLebWTlVFOZYTX0ymXMci/OV1AZ
	kwwio53J/RPD47d/t9KnB5pnVVWtLLF0gH/h+jnNB+yg3bDSeTFHe8Z7Zet0+A37UlpRD0Zbh0RSk
	2A9oTJtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDh3-0000000EE0W-3kJ2;
	Mon, 01 Sep 2025 23:12:09 +0000
Received: from mail-yw1-x1162.google.com ([2607:f8b0:4864:20::1162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6n4-0000000DBAW-3QbJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:49:56 +0000
Received: by mail-yw1-x1162.google.com with SMTP id 00721157ae682-72267c0505fso20805887b3.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 08:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756741793; x=1757346593;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=24qH0Sswquq+jWyuu2MbZpKldoNeCC2aANfHuwWayUg=;
        b=vW6Jeyl3O4ShUqdz+5qfmxcQ/LhaKTNSEXaY/kkldc3aN4vApmxZABwcoJ3pNDAltl
         jcoRrZLuRPL0ezEz/IGGXfVvHPQQb+3SVIYySo5zbIVWJhcfzkL19yPRusQXPvIxrcGl
         b/A2AZK7YdspBVO7+ncr9Di8NXDhNu2J0u+DNPGT8eVhOYg1aTbrP3VjrrQlzBti93Nj
         z1/Y9QU1c+yvE5D3ifQX09zXMreorymd1RB9EC3BYekb0hM8UPXyJOze4iExF9rmD0EL
         SW3EjQT/loL6Favs71mm6w2OXCq4aNUdCPAraWQQlGTllUL4j6GXy1qyBgEWXAdSjfK/
         7ESA==
X-Gm-Message-State: AOJu0YzbznvvoL+0Q4l7nnNaJX6G7zmmjafB26zf/66D3dfE1pbmftci
	deITtRdiAKaHq67N1JrNQVzN/65nrNrL9lZYqQJVgWTRC8kZBdn1/KAdLYhUbbzrLhebr8Hmxc2
	MstecoYEHfp9ogVl/Cb/C3N2RvkUQWI7tncUTftB+Bwghn2uVZUdcqvTXC1sVdI0ZuaG9fb7HU5
	SnzgmhObAytRmQypuAlo2UVyQ77AOOVLq0F1OFph4ZdX8d/Oj6j1jQInYWHMvuMbJ6qA2TR5co9
	UgelEj9LQRiZCkdKXsE70bXsCo/Is1XzfM=
X-Gm-Gg: ASbGncubwzINbHc27K3mYQeAuQs31u6FPsUasiCt7AhAEpTjUqc3HoEkoBbjWhDdLCJ
	tMJzou7BzvodXtKJ8ej2ffuf/stLOLHhcfEj5YWb9cMQrZQ2M9gEwSQYSXvNP0DR5bi1ENiYqWF
	ecJy8+Ptx6Wn1TMcHkK5q/psn3fuGSog+kIQKq2+DSyl+Mf3OEaEww6Ohj2tM47/O7Sxx59V/B4
	/WA/RFfBifSagCxMaEqc14iQIBqnRM9MsypmnzDdFFjI3L1jU2COw74jzVAG7K1lxi37R3ohaAU
	5LnHDMoqYXKyIETFHHClkSoCt2kOE3qdCvhsvxB9lrGow9ACAO8q8ru5ny7mJ5MhSwMcWg/7KYE
	39Y6xPS4HWAZIiXkk/jDAuVPKyBMtTaeFs+JE0pCqIzGWdCugFmAl6i+urWU2UCFBrVcJ9rQpTI
	TjrQ7g
X-Google-Smtp-Source: AGHT+IHK4Z3iKCdyY1uKz6QrP4KTABo3N92iy2NnKZWQ7SODp1LSotoC7uR21vRvV2UbGZOEsPnH9RfYqcOS
X-Received: by 2002:a05:690c:7244:b0:71f:eb2b:83e0 with SMTP id 00721157ae682-7227635f8femr85452377b3.13.1756741793042;
        Mon, 01 Sep 2025 08:49:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7227d5d1f0asm3513027b3.6.2025.09.01.08.49.52
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:49:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so4133106b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 08:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756741792; x=1757346592; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=24qH0Sswquq+jWyuu2MbZpKldoNeCC2aANfHuwWayUg=;
        b=DNGFgSk++CKRWcCz+VuafbCWOqPmOcNigSRiikvYMhRY96APfy6Uy0/EFbmcaFHqsU
         Kd7r8O+2h8h5Ukg7c+QQzfiQBtkC5JOdE6tExF/Jc5Q8Lg8jOFiBuw1HUueMMRqn8G1q
         b5X8w6mTDyXnxWP7Jz+zyUHtdB8P0J96Hck90=
X-Received: by 2002:a05:6a21:32a7:b0:243:ba10:66c7 with SMTP id adf61e73a8af0-243d6e02262mr12329323637.24.1756741791809;
        Mon, 01 Sep 2025 08:49:51 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a7:b0:243:ba10:66c7 with SMTP id adf61e73a8af0-243d6e02262mr12329299637.24.1756741791373;
        Mon, 01 Sep 2025 08:49:51 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd0e1cfbbsm9883575a12.23.2025.09.01.08.49.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:49:50 -0700 (PDT)
Message-ID: <2c5daf76-ed0b-486d-9f8f-dcaf35365042@broadcom.com>
Date: Mon, 1 Sep 2025 08:49:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] ARM: dts: bcm6846: Add I2C bus block
To: Linus Walleij <linus.walleij@linaro.org>,
 William Zhang <william.zhang@broadcom.com>,
 Anand Gore <anand.gore@broadcom.com>, Kursad Oney
 <kursad.oney@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org
References: <20250901-bcmbca-i2c-dts-v1-0-ad81f60d4276@linaro.org>
 <20250901-bcmbca-i2c-dts-v1-4-ad81f60d4276@linaro.org>
Content-Language: en-US
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
In-Reply-To: <20250901-bcmbca-i2c-dts-v1-4-ad81f60d4276@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_084955_000379_95BA49F6 
X-CRM114-Status: GOOD (  17.52  )
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



On 9/1/2025 5:50 AM, Linus Walleij wrote:
> The BCM6846 has a STB I2C block.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>   arch/arm/boot/dts/broadcom/bcm6846.dtsi | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
> index f5591a45d2e4ad64d8f95680aea327771825252b..ac5c810a92d76f1130d0caf0286d6401e0e7bbe6 100644
> --- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
> @@ -242,6 +242,15 @@ mdio: mdio@2060 {
>   			status = "disabled";
>   		};
>   
> +		i2c0: i2c@2100 {
> +			compatible = "brcm,brcmstb-i2c";

Historically the BCA SoCs have byte-sized FIFOs rather than word-sized 
FIFOs which is why the compatible string "brcm,brcmper-i2c" was defined. 
I assume this was changed at some point and this works correctly with 
the "brcm,brcmstb-i2c" compatible string.

Was there any I2C peripheral you could interface with?

> +			reg = <0x2100 0x60>;
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>   		pl081_dma: dma-controller@59000 {
>   			compatible = "arm,pl081", "arm,primecell";
>   			// The magic B105F00D info is missing
> 

-- 
Florian


