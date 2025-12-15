Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3DCD59D99
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 10:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zUe+EAE2SPiv7I6VGGrHkxtD3ndMq2VfMf1iJyqGTQM=; b=c7FrSv0sYgeRHDPCr9QRCb+R4V
	b6AiAO0G+pyW6xtEzPq1Pu82O6o8MA6DhTUDR2sNVpQwbgIpWqBXXSyaUYmqi7YfTbmf42WIJ4oLI
	D4bAo6CTLNgYkBiMH4eggV0AMYyC6XEKIusKZXGGg7Ub6Sz1ZnThBkGYaqrec+KANUTl5nozAszGg
	BmqX3u2JamJG3B6+/ueJcQoiwxAki0mMZTxblvZZTOFzWn/qbiT3HY4XPddyCK0uOtk3+JZeXJThH
	dCU2hOlG0LWjsdhm2wvUrxtokO1kjqJg0UGxsTQyjPooZ4ob2hSqoi9bsuHnEDzIG2b5WWCwqRRya
	Clyr+jSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6CV-00000003U6e-0RmY;
	Mon, 15 Dec 2025 10:53:11 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6CS-00000003U5j-1Pra
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 10:53:09 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so5752848a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 02:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765795985; x=1766400785; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUe+EAE2SPiv7I6VGGrHkxtD3ndMq2VfMf1iJyqGTQM=;
        b=CsQlYJktAJQTiY0ut2+nB7FKpnie2ZeMXZqlrLnpwZiw897UrQfaBkOInCYhSJbpIo
         po/fd222/0oh+E/hx/qO7iuh4c4DKX9mAnBcrETn6nohuEkQBUgUVPkifTTdGvmST6Q1
         ghFVecs1MaAPYaXYu1NnoQQtjByieLspJSjAacHs4WrOqMr9k0ZeAyDpHx4Kp/Ul2Mmv
         XZf7zpCa+UoGDagti+m34tqPJKcMb4QfM8DVg1CnGn8O/vLLNoKy8rrc6TWYIO3tIu2s
         2SsuIP64GTHujmToJjCa19rVejSaKYeskCp/D8ZG/1tnFc5anr1j9nSvfL/wtPJ0+8Uh
         g8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795985; x=1766400785;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUe+EAE2SPiv7I6VGGrHkxtD3ndMq2VfMf1iJyqGTQM=;
        b=HVxFVJ02DP2svKWch5msA4TAVJnQc3PUUsTeMdN7IPi0xTXy3YPBYB/V+rvQYDXnSr
         XJwbWbffOCLRl/5dhtLHJlhv0pKQOO1NxzSD5n53S3LbvipCYeK+kXJMsreENXyxnKeh
         Pl1u+dFCBGyYHE5rmjfB1gJ1karVMAypulGnh/BWpun56syb2IcC0Y7mKeegHWB64xqY
         I3qdVtzf0jdSYiqTUE2vCGmctsJVI2jnYRnAKiSuxwbi7gQGtO7AHcdYsxgDHgvthH2t
         Kb985h6L4GvXPwxHXrAtocDH7sQJuK5QFiEzYrxGVC5gg6qCiW7m9a6NjTF/NdftsQRM
         IEfA==
X-Forwarded-Encrypted: i=1; AJvYcCWa3gCmvhcIq0e1gXwNkbt3wUDvdENRA+Jfoj5qnX06KXoZ5Iq0ziooivh556TAyw/xy4erUvZaSQouaKkDts6d@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1/GK1aTDa9rJE9hxGD2Cx/pRTiuobEirCGfSbloKgtH80eR62
	EJHLUu/IkJvfS3uhPpL9ldnxLnDEicIVt/CAEqs+3lifqT9+Jka16N1Q
X-Gm-Gg: AY/fxX7y4YEZ31RhgwFtYTeq2erGSXDuTxerx/7I7IIt+9wiuhESveZnna/TNJxsYaC
	XWJbazA/7ra6SG27yp7Ix1+dv66mxu+wVN9uZYxV0QZNSsezxed8t0SDUi1qR351nZUoq6fvX+Z
	qaOT78J6F5sDWDVQWGVvi1xu/PCTOzLRFKQAzR1sGNfeTjKULzU7ncnthcwAQCsaQxZ88OvStqt
	tLCwelM5oeTG52LqE8fbl78O+/iroqpCNQgGd37sKLFwMXx7MgDJOLNFJWXJcR3dj04VaX31HN2
	RggGS2vJd3uAY6vUCpTTScknCzMnC5ufO0lwMOeetWw8MipnF6NCICWrz+TxJipnW5fAQ0sAw88
	vSMQSnLzvk2KyYUz3bNuMafk3BWX05cF8OLarPl5i64wfb5ovKti510fqZqDipJF0H8Rie8ik4Q
	t0ErfKJ5/uOkkb6+34lQ==
X-Google-Smtp-Source: AGHT+IHQaUbyuIBHaup4o4JPs479YX310x1U5GJT7nC5JbUCCXXFujhyKYNJmlWKJ25qA/DRS5VM+w==
X-Received: by 2002:a17:907:9494:b0:b73:6534:5984 with SMTP id a640c23a62f3a-b7d2364c4e1mr1105313066b.16.1765795985215;
        Mon, 15 Dec 2025 02:53:05 -0800 (PST)
Received: from [192.168.33.7] ([89.151.31.85])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b7cfa2e70c2sm1345912866b.15.2025.12.15.02.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Dec 2025 02:53:04 -0800 (PST)
Message-ID: <424704d3-eb9a-4af3-828c-96645e347907@gmail.com>
Date: Mon, 15 Dec 2025 11:53:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: mediatek: mt7623: fix efuse fallback
 compatible
To: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240617094634.23173-1-zajec5@gmail.com>
 <20240617094634.23173-2-zajec5@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20240617094634.23173-2-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_025308_394746_3158C182 
X-CRM114-Status: GOOD (  16.38  )
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

W dniu 17.06.2024 o 11:46, Rafał Miłecki pisze:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Fix following validation error:
> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: compatible: 'oneOf' conditional failed, one must be fixed:
>          ['mediatek,mt7623-efuse', 'mediatek,mt8173-efuse'] is too long
>          'mediatek,mt8173-efuse' was expected
>          'mediatek,efuse' was expected
>          from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: efuse@10206000: Unevaluated properties are not allowed ('compatible' was unexpected)
>          from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
> 
> Fixes: 43c7a91b4b3a ("arm: dts: mt7623: add efuse nodes to the mt7623.dtsi file")
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

I noticed this patch got missed.

With AngeloGioacchino's review, can we have it accepted now?


> ---
>   arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
> index 9c5a52ce9351..748f9b366897 100644
> --- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
> @@ -328,7 +328,7 @@ sysirq: interrupt-controller@10200100 {
>   
>   	efuse: efuse@10206000 {
>   		compatible = "mediatek,mt7623-efuse",
> -			     "mediatek,mt8173-efuse";
> +			     "mediatek,efuse";
>   		reg = <0 0x10206000 0 0x1000>;
>   		#address-cells = <1>;
>   		#size-cells = <1>;


