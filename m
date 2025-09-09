Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36831CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rFL+r1YKn0vpD5aAkD3QIB0bodgwk/WBTAvgFy59FM=; b=NgxEKHuLu3IN6WL7hr2vc5938U
	B3FB9KMz5EdrCfWLM6zCQmeMP0EV0LDC2dB+YhMivqOCOk3MS7KgwmtnaQgQ4i8qXscMRu/7IjOAk
	/faQ52ZO00RPhX8SUR/aDN4xoGqVYAeueWjgCdvYzLoXLu6qcFUnY2tSHj2iTZVgXDVQmvji4HZCR
	Xe5bcNjWgPRRXQzZzDFKljMQhrAVJJEciGn4kkRWHwQZF1eDWrgnS8BSqNkEjqyypztTWrFLbv1Gq
	2oz8XtxTHt2O5JkJQH3eOf50gV58vLSrYON2zpNCG3T5/5UrhVyShJhBVv7i/PGSNS32S69fh/Dy8
	sdgjAzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yI-00000008rRo-0dWg;
	Tue, 09 Sep 2025 17:17:34 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxhk-000000079cg-48r7;
	Tue, 09 Sep 2025 12:44:14 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e014bf8ec1so3787814f8f.1;
        Tue, 09 Sep 2025 05:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757421851; x=1758026651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9rFL+r1YKn0vpD5aAkD3QIB0bodgwk/WBTAvgFy59FM=;
        b=c9RUCCb93IEaFbYLRXnxPmQrgykcSJm5RSMRGV3OEfLwEeQAhJYvoeqrMbg7JVObbQ
         vhT2Y23ON2tnBti/2j/xC2/FvckFkuE89Gm2SKqgCoOxNU6p46OVjdHnNKl4qI9I5KNj
         kEZ0P20s+9blctph45i83Kx1f5R2zFgwoAYJJkJmpQK5AEDpZ+PL8vQpC/3/Ufz8fsOz
         ctcgPt31CphfPMXx/G2G8aAuo7MjqKZPWY0pWpDvVYO8aDREjWLQxb9//Erev8U+4Kn7
         8rwE7ujFAMoYJ/ZSFtfc8qXkv79dOSpECmZVk40Eiir383UeK1YbMshjkhXmR9cn5l5P
         lb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421851; x=1758026651;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rFL+r1YKn0vpD5aAkD3QIB0bodgwk/WBTAvgFy59FM=;
        b=UaaXczhybqZiwFvVmZJDjCusjorovRBe01BmTeT+3J1NqgBOeBaU+8YzhphNFKV/Nx
         Ne/cwzK1Eq7pM0I4Zn2+IXMt55EIuaFzHgPRiNDTHcliQqA45DbmMhh2bOxzBCEnyVbF
         kSR2btuoCNs07re2T3f3MpgAtmrwIRjrO5DeVpD48mUlyPgO7Xsi59JKFvmVE5LWLFfP
         BM/1PZdRj/iEJfQtwz7magw6tNCJyQp1dkrZeaqKX3SDvVXCnbgwjkoLpQZJooRdEqSa
         2Fy/fqxnm6NDKyfE7Awpki59ZuTIpTub9tb3LfUiHgX4t+WcnfoiZ4pW4CmAVtdH/hXS
         56kg==
X-Forwarded-Encrypted: i=1; AJvYcCX+52athyDYjbwgp8qUKBjLvQvSnsuNofJVlpaJX8lu0EHBx+ylWtpGWyMjZWpt3i3PErCfxV1XRdoroXTsO2nU@lists.infradead.org, AJvYcCXbgoRqcixveGth7dhC/c26y8dnuICZtefsfNWNBG0EokkaGReSgT8q0gvXbfeKwNCQVoHhfn2XPu7OU5KyiUA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnn6kBFvVTF/cdwSuZg3vDLZ+gvn8FsXrK28FcI3QGB/6dYujx
	XxSxTAEtgYg6j11Q+Q3Lr8E7mtczq944ekAE9cHZBIQAXF0C5GP5o1Uf+OG5TQ==
X-Gm-Gg: ASbGncsLjgGBtUULw4zRS8VMjygttb5C6ENSoq6I/yHS3zu5K+ZcdixWrxam6+TjwmD
	3lCQ2boLXjnyGjJxLaC0fEwsKvGAM2pYNj2x/HzW0IXwHXn+qchdLhTrbT0pj6FTUDUo+c2uHkp
	6yQaxmg9ykk1g8oP22eyYH0thdRIAAWW6sf4HF6QJHKY/1gFh4lbCJwnVvjGAh+92TrDL7jCyrP
	PHnpdoD7OfQjt1i30WLKWIFN2YUuHrvVDAV8iFo+8tEpDP8dQ/dXUxPnTWL5GTQxP9i73/VtprY
	VLETBc4oSutmpH8Dk66JvHntUJ+rLW8b9l3UxM67p4q5v1aEeXWRv97ofOXZPJEAChO8Ydy03ic
	7PooSkJp8dR3gX9uSdHnF9+st4ywiV9I=
X-Google-Smtp-Source: AGHT+IECKaIItMJhCB5fQPHsblBR/qDAMst2rQYDXJkJFXWQA4pISJ09+ACkbU0uH4JhyolNWy5pkg==
X-Received: by 2002:a5d:5d05:0:b0:3e1:da2f:af23 with SMTP id ffacd0b85a97d-3e636d8fb4fmr8567851f8f.9.1757421850822;
        Tue, 09 Sep 2025 05:44:10 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e752238820sm2534337f8f.35.2025.09.09.05.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:44:09 -0700 (PDT)
Message-ID: <4d6fcd11-a724-44ec-a183-cd1afe959bed@gmail.com>
Date: Tue, 9 Sep 2025 14:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8395-nio-12l: Enable UFS
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250905-radxa-nio-12l-ufs-v1-1-e2468bfd2c69@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250905-radxa-nio-12l-ufs-v1-1-e2468bfd2c69@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_054413_051818_14311728 
X-CRM114-Status: GOOD (  14.61  )
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



On 05/09/2025 15:21, Julien Massot wrote:
> UFS is the primary storage for the Radxa NIO 12L. Enable it
> now that the ufshci and ufsphy nodes are available in the
> common mt8195 dtsi.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Queued, thanks.

Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> index 329c60cc6a6be0b4be8c0b8bb033b32d35302804..4cbd78c126f6b56f1833d220f7a7fbc7e4320cbb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
> @@ -990,6 +990,16 @@ &uart1 {
>   	status = "okay";
>   };
>   
> +&ufshci {
> +	vcc-supply = <&mt6359_vemc_1_ldo_reg>;
> +	vccq2-supply = <&mt6359_vufs_ldo_reg>;
> +	status = "okay";
> +};
> +
> +&ufsphy {
> +	status = "okay";
> +};
> +
>   &ssusb0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&usb3_port0_pins>;
> 
> ---
> base-commit: 6c68f4c0a147c025ae0b25fab688c7c47964a02f
> change-id: 20250905-radxa-nio-12l-ufs-c817a864fb42
> 
> Best regards,


