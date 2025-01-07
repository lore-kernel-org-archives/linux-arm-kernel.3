Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC1CE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 17:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AnFDI1orT78UbMz4dvewuX8lguog+6111daL66A0sXs=; b=rrzCxRPhgxc2YRvqzXrY/f/vnz
	9gGuXtmwe6SAAYdmxzAj5t2vF0JIG2AavqEaM0ut3I7LSfGB1uK2thVHYUudl47LPDyX4sL7OHCXc
	1k2VL2dD31GfGqRvpRvcW4pvoCBNYN7AhXB53HSbk9nxGq+4jNs+Ox5cFrlwXl2KebQ7t/hhJ5vT2
	jthy1zDRGCPxXKk8DDiELjCvXY2AHD07Qg5AbPMU48tH/3GaAZFqEDblBoC+QMSf4J+/nvGKCqO1F
	vsbaw5ut6DHRs5L8sgvJHH+wDcRBPMSVWR56vRnTRH49a5KbJ5ZYxsuzH7WGrGNXGgkTHl8hWpsal
	ZEC541YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDdJ-00000005u4N-2noR;
	Tue, 07 Jan 2025 17:44:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVDLv-00000005qxn-1w6L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 17:26:55 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21644aca3a0so56511335ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 09:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736270811; x=1736875611; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AnFDI1orT78UbMz4dvewuX8lguog+6111daL66A0sXs=;
        b=PbmplfOPnWmRkz4Q2RI8fTAC2B+k0BOb/YxfoJfTUnRpfb6ofojxpLzy59LfHDoyjd
         I1qUjnTgzwONlUrqKERfH9jpS3gIsHOG+f06CvlXniIY9Wwr6Iv/4+l3YR7lTrIr+T9k
         XO5LJo9pjN1wm7lDU/9RxJoT9bdoqFV97BcJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270811; x=1736875611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnFDI1orT78UbMz4dvewuX8lguog+6111daL66A0sXs=;
        b=X2pmF9LotKlYMb9A0EKzI/lzZbbVH5FEAJYnh+dRKfJV2DSTsIJKbkc/5hqa/2jL4W
         L55hl4I24Ck0Bd1j+u4uoZobSC2O56kBlQjKPja8C+azM5Fykok6AqnUxDjeSSJ1j1Hl
         OSziof+xc5DpqYbluUqSObv3S18SHY2vppwRdLhFQAYkTOZUvvonWMrjmzExxmgXWucE
         kgIhOBpyd3lBDmQ5zSREy9+TREffetfenl7/7CZ/L4a9cwG+wnQLR62b6xnTfcHNGkMl
         q/QMfBusQD3ASG/psicmKxiQMpT+ubVMyKRrSWKGM097jFtb0vDLcHDGrHF18voriwkZ
         n8CA==
X-Forwarded-Encrypted: i=1; AJvYcCUN+mrpx3gRs2/cgcKjBTJfiCSl/M2/hZhnGSjVs/w9NsYSmyUcj+2YTNyQEGeotCTb1KNXMlG37NLtkU1jDULu@lists.infradead.org
X-Gm-Message-State: AOJu0YwBrweDdtEi9GGNtfy6tDT6JKTT7MxmdBDsLAL7z1G9afbM8f9R
	yepi7pbS1qIHoucwOFlbiiJyYWLF2IhMyGMxgbA+hDqRvOHMnx88tHRRV7q7+g==
X-Gm-Gg: ASbGncu2NYQXdB5He2u8px74m8P4AZiMFsqZKiuTF26WDE8pO7BMNUwpuD31lSiLfsu
	ax5OtwLqRPhDIXffIlCwBd19ioTviSEj0uqQR/7FVrJ1AJNfjlXZMb+Kh4oHPBrop8mDhoW7Wph
	fKEO/CmQjyVH/kta6k496u4vkNw81qRJX6F4wMnSbmcR5Y6aO8Qk+q1kFpTOOY9daVAnTtFu3F1
	QD9XxpwVc51wBr5WduKaTHx9alrgF1q/qMBJPfjwJD7VFxARTZ28L1nUAN04cuejTy6eB+mWWNp
	2giWwDgF+dKVc89jex3y
X-Google-Smtp-Source: AGHT+IEPaGgB9Qa+1DpEpRgPYql8+QmamIMyRh5C1Rx/DzqtHoRCh+8H9eqIioceJgqABRLUqu9iOw==
X-Received: by 2002:a17:902:c408:b0:216:4d1f:5c83 with SMTP id d9443c01a7336-219e6f26814mr803886345ad.47.1736270810779;
        Tue, 07 Jan 2025 09:26:50 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdeccsm314093865ad.144.2025.01.07.09.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:26:49 -0800 (PST)
Message-ID: <e2d33d2f-6b30-495e-a089-b1185b22130f@broadcom.com>
Date: Tue, 7 Jan 2025 09:26:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Bara <benjamin.bara@skidata.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Del Regno <angelogioacchino.delregno@collabora.com>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_092651_503745_A6AD3448 
X-CRM114-Status: GOOD (  10.41  )
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

On 1/7/25 05:10, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/usb/aspeed,usb-vhub.yaml         | 40 +++++++++----------
>   .../devicetree/bindings/usb/brcm,bdc.yaml     | 14 +++----

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> # brcm,bdc.yaml
-- 
Florian

