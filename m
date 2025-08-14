Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D320DCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 21:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=go6eRriSop6jyDbpiKAFbPrUEOvNEwILI+MgN3l7jpc=; b=3IMLc3U1amE3e8Zk60YlCyXynG
	jUj/6igUetWSEcdSRrkjdoKL6Ya2huYaXo00XVqs0t0G3vQIZzX/88ra5p6ynGqnbNUKJQgcztPjK
	ZgbAFzGqEu6a165ljw1+Phc2J3Oa4jb8Tz8U+1EJTA8moGu84LO7uwuqT/1ruZs63+E92/Bw/AgFQ
	3nBRpahXKHuIxlE6ZEn2TqplmRc6/9AHtYdwTmXwm5b2lmuaY5H7A+zPpVa3vfL0mZk6AAYliXGhv
	HT8q5P1hAW2ixMp6iPNpk3YTEXer5N9DqTZ5Md1AgfM9PGMzAkbSj7IgVcpIVLK9wJDVoTEQDgT2w
	9iN87lHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfKO-00000000Zr1-46xJ;
	Thu, 14 Aug 2025 21:17:41 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umfGI-00000000ZTX-0ikd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 21:13:27 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-7e87036b8aeso172562085a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 14:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755206004; x=1755810804; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=go6eRriSop6jyDbpiKAFbPrUEOvNEwILI+MgN3l7jpc=;
        b=UvVYrQwsvlDzRRrEel5XM08VjvTUN+rYvs66ry7Mnq85w5m5Kr2CpIJACATNTEGFvI
         VQB6JYgX595nghsifG+MCRwVe3YyFecdR0Jwqv93h2vpxy903QRpT9x/xeyYcZ0LtMRd
         Yn+xonBpc0m51yUzgozMdr1CgkTPBKTr1jdY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755206004; x=1755810804;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=go6eRriSop6jyDbpiKAFbPrUEOvNEwILI+MgN3l7jpc=;
        b=ongO82kb7xmguOX6xye731/Ef64ldfJNO7Yr0DpGQl8yL08i9ekOFoyH2w/o5DQNX1
         ONN6yS30HREJ7Tlk6+r58KpcVOsbh0u1hMUU5ysalQX8HsGPJHHwc73BPOJ4D6zcCs+Q
         +1nGwtmQVewWJ1BEepl3w1c3maST7TYxuATS2qEesxLV/tDKd+Zi8DZ3DDACC9rmLfjz
         ccl845mGpbwbR/10BlncGhMQ85MD1rvlw5IsCoL0dnxEkhWR+b2numbO6XFfcK31UjrJ
         3GxbaXplOrXfCLMEtFbeaRBmlOn5UWGJ/6FWr9k1C7nxaelh09Rl6KuAWtYBvUJ+P7mr
         B2yg==
X-Forwarded-Encrypted: i=1; AJvYcCXFySauy57//tvuYEIg63bDo1J5J7I3Wxmqetr+gDs8i2pNt5ZDKY9xhccuaFom0X/RaxCMSfnijOaZn7iEzs1j@lists.infradead.org
X-Gm-Message-State: AOJu0YxnoQx0CKl+e8FdeeVBm+VXHC993YMsKzlJUAAmJWmDrj08DhSw
	4KIs1mLYDeAZeBDz6vZjxNDKoYq0mjkGd5Vg0U3WzEiiz3IXCLmJuBaLn4ybvrep2Wf/d/HYQ35
	lw/E=
X-Gm-Gg: ASbGncuqTzocucqSZVon21gagRuG7j6CSuKtvk7vf1+sgE2NmeqXuw8QuqQaSHzfE76
	An8gefbOnyrizWCR7Bxuw3o/F2JT2pFo0l4GHkosZi+FNQL5BmhVuZ8dArbk4J1ojKTsu7/AwKK
	esHfMRa9zD41vZvuR2ieurqMhnXxszoLT26jywjrcdBzyI6UJqy5Yb5kRq5JRlPTg72gDIyi3vN
	V0uW4m0ApXRXglb+8S0LmSD+sQ9uywtQEV49ayyR1+bPsee2xTFE2qmpuhkpqyRnI5mwdgtIW/5
	oPhqjyYSFwyQww+lkFpiLtoWAoj3nnikt2zL0AYg4yGVsJ7Hpgp6ulDGmRv5EO+SFBInFiPBvk9
	DU9iM4C12wC+nu+09oAbiRaHCAA7I/jlYPmvXCn0de5zaoPoZKyrPJf4sRaBKgGkuVOS4Z1DaHp
	q2
X-Google-Smtp-Source: AGHT+IGnKX0P+cBhDx+oEOh1GjhckkG5v4P91VAJ7M+Ugrd13JqlOpMfeaiPErfl8Hjebws/7LpLpA==
X-Received: by 2002:a05:6214:508f:b0:707:7e60:ef4b with SMTP id 6a1803df08f44-70ba482e504mr5406426d6.49.1755206004164;
        Thu, 14 Aug 2025 14:13:24 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70adc1cbf81sm18572876d6.7.2025.08.14.14.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 14:13:23 -0700 (PDT)
Message-ID: <f8529fab-d455-470e-b05b-9b5069091dc2@broadcom.com>
Date: Thu, 14 Aug 2025 14:13:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: Add ixp4xx Actiontec MI424WR device trees
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org>
 <20250814-ixp4xx-mi424wr-dts-v1-3-b7c10f3c4193@linaro.org>
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
In-Reply-To: <20250814-ixp4xx-mi424wr-dts-v1-3-b7c10f3c4193@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_141326_215573_FCFFA50B 
X-CRM114-Status: GOOD (  13.48  )
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

On 8/14/25 09:40, Linus Walleij wrote:
> The Actiontex MI424WR is a pretty widespread home router, made
> in many different revisions.
> 
> Revisions A, C and D are based on IXP42x. We add a device tree
> for the A/C variant and one for the D variant as these differ in
> the location of the WAN PHY on the MDIO bus, and the ethernet
> interfaces for the WAN PHY and the DSA switch are switched around.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

[snip]

> +			gpio1: gpio@1,0 {
> +				/* MMIO GPIO at CS1 */
> +				compatible = "brcm,bcm6345-gpio";

Is that really the compatible string we want to use here?
-- 
Florian


