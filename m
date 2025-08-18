Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1F3CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Igvk6AvqPGpyFLK199vT9ThDTTRRAoLheaWbPVeRxBM=; b=Z7ZBKg1s1gwTs2UGT8wa0/sFf1
	4OQR5vCivhaCktqOmz4u7Xh3NFcA6ndc0RGGxclEhQ72s1uxvsv+1nFPuBWGu12ycQv9hg/EAOVMh
	fjUNjD661a3cQg2cz8RY3n3OMF3BNyjaQeiR5WmNOLr4EBOaTzHaJ4LS8hsXIBmukbx4o+vsd3Mui
	9mXciGSy33wvfdTMy+mhCwVCxZpswmyHNfPr8FjV3XX42gQ/SeH5xn/bKQwbkJu/iRE8+PQGiGsva
	TH72csQPYqIJm62bHzz9KZLFleFa7ly5NLaP7z6/JtXF9lddCsBbtSAsEiCe4iqBgMmYqw3jAnajC
	K+R5jffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4ht-00000008NIi-2jJU;
	Mon, 18 Aug 2025 18:35:45 +0000
Received: from mail-oo1-xc63.google.com ([2607:f8b0:4864:20::c63])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4Ba-00000008H2R-38xl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 18:02:24 +0000
Received: by mail-oo1-xc63.google.com with SMTP id 006d021491bc7-61c0b19b14bso357126eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 11:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755540142; x=1756144942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Igvk6AvqPGpyFLK199vT9ThDTTRRAoLheaWbPVeRxBM=;
        b=w5iGHfIe/yyaPp04hfpbZNa3uxxrkSXs0kbuMvyQOzvjwkJd77hggeMpLPKPsN6R/F
         pyr121WzY6nWNTGP/5qB/6WEFw85EpffDdEA42aw4SH1zhW6pFKpbvrF1A81bfzgloNM
         pqRsa0+0Zwy7eEDrWEDo8sdaemspLDOHeiHXNvsaDMuNfMyUfungzin84Po3g4wdcEOf
         6yb4d352xNpAxidKThV6ssMpW2CPmjsYr87MaY9czvhL+0rpHoTYAEYCwVOYrT66m407
         TIlgYM6RYH+CtmHmPW3SH6v4fVjIGX4A4hIICrFiQyoJF1RyIq4wyg00CJrbX9twUE7O
         elrg==
X-Forwarded-Encrypted: i=1; AJvYcCUBG+asGL2VyQ2E0SUKfE3bLih4QTu+csWY6Y3jgCB3dXOswHdyx1Op83ou3AodA/vr/VDJoy5GmgZ5Od8wiR+O@lists.infradead.org
X-Gm-Message-State: AOJu0Yx14HOKEWCOmFfS8XgDK6e+2QQsnkD1oLjavNDpoRAiD3xwE+mH
	H3lSFBC+Ag0JaPn0O0NnEl79rVB+E7C0w+irNRBGKurjcT8z05PBFSdT6ekcQ1E1SEvbrechwIW
	oAHAojNhEZflnaV8KmSSKE7xTsFX7IiKqtDfeGeq1njBWCqnSk8tVcTSgHFz/TXpxO2/wSliPCQ
	AjRXKElG1Y28eYNB0p2nU//LmIuTo9tCpda2PDo8HTMmvARGh+E3CM4yjs+uwFfSOOGDmxbm4yM
	rn1RokBJV2BWL4wZhj3r18kFA6RkRkGCEg=
X-Gm-Gg: ASbGnctID5GZB9KnNao8oTF0s7wbuigsgDfXrJOBe6O7pC9U+zQfBTK8jjs1MRy4qly
	6d1jyS9ALnBNWVmlUTBxASigtb5+jXhWOy5zhudgL2uliMci1iDlOsqKRYk5DIoE/lM2/j3vbuY
	qDqC5FU76sgmi5EErdIj8Th22kldEW8SqaHPiRfIB1ByK18ZqL+24KUsoNY1UG2VPsURhPxXglr
	zxv+KoWjlXwp0oPwjZ7kW3akpOBCtjZtIimbveqy6Blu6nuzM6PvXeuifQDoU1h+A7ZpRqotO1+
	So3ZKkPxclQocvVUfBR4fC6XNzQTqbZSD/ygTBspsrBkNELNnYRVQhz9huVaN++1daAd5WO0JI/
	MLyp33D/i9sLYxi6O+KnyHEkQ6Jmwoos9ooobex88fkrPKBqbMf9CIQeUl/dPNDec9W1GfkqJU+
	EhDw0f5kg=
X-Google-Smtp-Source: AGHT+IHbeJLir0g3OWqdC59SxXhWXnOP9owUP9IIL2OOBWtkhmRMENEzbAdfTIpJjXLw3Kq68cBEi+pcvCe8
X-Received: by 2002:a05:6870:ce82:b0:2ff:a996:3b50 with SMTP id 586e51a60fabf-310be64624amr5833241fac.22.1755540141525;
        Mon, 18 Aug 2025 11:02:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-50c948ce13dsm518579173.5.2025.08.18.11.02.21
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 Aug 2025 11:02:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b109c7e901so131599391cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 11:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755540140; x=1756144940; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Igvk6AvqPGpyFLK199vT9ThDTTRRAoLheaWbPVeRxBM=;
        b=Rl04K0RGsbgTPdZ09zE00CaBageKVsI7GZQeNlOlXB5b/y+z622Ji4EIcFIfWvRk7l
         mlIQUF7PSAjJyjtVx55vJb3GAQtAcH5bXU3fFBoe1cj0Rl8wtAdw24+1ovGcyu2eh6DO
         wzbNR4jp/im4NI1cG2ExMV3KaVSidnTpS5ZFA=
X-Forwarded-Encrypted: i=1; AJvYcCX5PGGFhazUKmjqNJoZyNGLgATwfeQ0/BGf6d2eEAMNE8p2hFBboUyLYvgZ2gxwDg2B+VCuHkyxb2R7Bfbvh56o@lists.infradead.org
X-Received: by 2002:a05:622a:d0:b0:4b0:6965:dd97 with SMTP id d75a77b69052e-4b12a75d90bmr125817691cf.44.1755540140289;
        Mon, 18 Aug 2025 11:02:20 -0700 (PDT)
X-Received: by 2002:a05:622a:d0:b0:4b0:6965:dd97 with SMTP id d75a77b69052e-4b12a75d90bmr125816951cf.44.1755540139671;
        Mon, 18 Aug 2025 11:02:19 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b120b96b1asm52522561cf.26.2025.08.18.11.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 11:02:18 -0700 (PDT)
Message-ID: <4c454b3c-f62c-4086-a665-282aa2f4a0e1@broadcom.com>
Date: Mon, 18 Aug 2025 11:02:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add ethernet support for RPi5
To: Stanimir Varbanov <svarbanov@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Phil Elwell
 <phil@raspberrypi.com>, Jonathan Bell <jonathan@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250815135911.1383385-1-svarbanov@suse.de>
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
In-Reply-To: <20250815135911.1383385-1-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_110222_933176_109AFB60 
X-CRM114-Status: GOOD (  14.21  )
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

On 8/15/25 06:59, Stanimir Varbanov wrote:
> Hello,
> 
> Few patches to enable support of ethernet on RPi5.
> 
>   - first patch is setting upper 32bits of DMA RX ring buffer in case of
>     RX queue corruption.
>   - second patch is adding a new compatible in cdns,macb yaml document
>   - third patch adds compatible and configuration for raspberrypi,rp1-gem
>   - forth and fifth patches are adding and enabling ethernet DT node on
>     RPi5.
> 
> Comments are welcome!

netdev maintainers, do you mind if I take patches 2, 4 and 5 via the 
Broadcom ARM SoC tree to avoid generating conflicts down the road? You 
can take patches 1 and 3. Thanks
-- 
Florian


