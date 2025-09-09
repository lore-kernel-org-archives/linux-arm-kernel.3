Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521A8CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbcerATz7q19yBkJf35/2/GZ8hE2xuowfEYu+de9/0Y=; b=yTrO9Z8yV0W1ZHmm6MNl2dwYS6
	jvEVmTdV0lq1XOF4Lw1iqZcNqdZFxesKPv7BiHU2wJZrqA9mk3V5kRRPUTg8JyzqiZBj5j2siOt8t
	42+XXqqP/83juIYouUZQvtXUjUqLVGRBVXCpdrmT2yY5aUcVRdJrHcqtmpqGYcvoyVJ9d1v4Es5FN
	zmI+7MKPXW3UYqettCVqocM9DisFvX+2lE3WRyHqk67J6Erp8kN9HAl/rHWi3tNBvFlrBy0VNRSAY
	/G1ifibaPjLzN38bk5zAMk30Rnsfcu0QBxJCsQsgCHGBt2htsc64Fmgf//pzPqe2GE3rZXBBIVaFs
	CIM1360w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1yB-00000008rGt-47Rs;
	Tue, 09 Sep 2025 17:17:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxah-0000000779I-1e2T;
	Tue, 09 Sep 2025 12:36:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45dd7b15a64so36820315e9.0;
        Tue, 09 Sep 2025 05:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757421413; x=1758026213; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nbcerATz7q19yBkJf35/2/GZ8hE2xuowfEYu+de9/0Y=;
        b=MlRnVp0fPP08KHGMJ4fMWedTqUaf5Y9eSSw59iM4+5Erj5ghSDCNGww5zVxnOED2o8
         3+0VymiRXGyXOnm/GKSCG4/W4KDyQdnAFG5oir7rMTdw34t1KvadkUTuVjwAACd4L/L6
         9hsEWorBQr5yDO0bP2bI0JQf+uJKXmg6bu10TsUNIG9yuEvzOsE4L8YDC1LL9WOBeY61
         yZFNgFPmEt1xq+Zj8LkyEWeoLdw0A+WFgjD3KrY83zUBV5U04+UIK6FB1XoggzaC0Xy/
         jjeDxPGEAtxwGVzNCfc1wwHI6ByCsUjS7zZD+Tn+ohLfIxwA69tiEuUN5POI0MudW9Jl
         BrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421413; x=1758026213;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbcerATz7q19yBkJf35/2/GZ8hE2xuowfEYu+de9/0Y=;
        b=Khh5HE3yTQccAk+egSqs5JP6tI4jzwmDgzAlcHwMHN7777SK7D8KwLss6yCFLFcYe1
         YN62iJGKXgSxfRnZ7qZClr9YkQLv+tZ7gRxnjEPzMdK7LKTrq9H03Zim//Ct2IuOfQ62
         z5dnsb7yDF4czhmUEoDu5277bDaWVNf0JT2kAMBt2nXoTjLcvlyDertWQ9g9ye4e86oq
         +4vTv+cp/YuFb2ItPjVkEY6e/yGDCJUbAB43Dib6tEukMcUNZggmhiRVNSaP3reUzcQx
         QZLkE4Jfl+U6l10jh7CHl0h6vP7uGRP6ImE0o6L9PfG9A01KEVHgO1wjuBrz+M6RGf57
         kWiA==
X-Forwarded-Encrypted: i=1; AJvYcCUV4qQYv5b3vSRXDJfgzNOWFEJqZP5J5XFosPgKMfOa3FXwwcaPLkZwj8K0xrvcR42huDaA1L0n6uGcbA+MUK0W@lists.infradead.org, AJvYcCUlWstNdLfT9MYvatKIMDfqh+n0U7UybRj7vqecue9o/MOWDhgK+PT8Jrks3OURnwxqr3xbfAvAyf7CvJeA0GA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy91caeGEX8qnAZIUSIk4AwqAcR/eF2HjdG7xbr54LG8t/pPTZ
	UQwsUHHFNrX4TNMwWZRq9j6Ro3GLHQLTWPQUjnVZ3tBAi925l8rV7YqgU9Astw==
X-Gm-Gg: ASbGncv7HwsCjeCm58cSOn/5SMLpDg95B4DwomLnT+pfmK7QkrqhkC2MJQntk96s8XQ
	zBl6VUXzr1B+DrBYvY88+A0USiqtcVHCKJIaaUhKlFDdmp5Terp5gP38KMpUmMNsJb1cCndB2Ax
	XdowaISh1Zas62O5BHM54GcAXNhcMXaBmc1PK/aMc5dXURhqui8pUCCWrtnTYOcTRNzmHD8JiSW
	0nmkXuzJuAQFFwvi453xn28jUi5KLSCBiXGXa5Q/LSxYrsoQZ0vxWcHI63VrsvdR1FNrPv6Nepr
	uKPTx/dEIqXIGDLcAK9wW9YSJgrvrDrVueqLszS/D3uF9doDF9qQPczBjbU8ekv+t8w1VUTqIAH
	RyZCgQT/e8wD2QyYEYuFAY5MB5StvemYkvgEan/1TKQ==
X-Google-Smtp-Source: AGHT+IEOrICf6dJFeY0zHSniT8Jtaqtd61QsV62lKDpe6ZR0vlPJtkX7CquNyOygzd7DL/QMim2koA==
X-Received: by 2002:a05:600c:458f:b0:45d:98be:eea6 with SMTP id 5b1f17b1804b1-45dde1a8350mr113312805e9.3.1757421413379;
        Tue, 09 Sep 2025 05:36:53 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd0350e80sm233690705e9.22.2025.09.09.05.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:36:52 -0700 (PDT)
Message-ID: <a908a354-8835-4e28-ac06-ec6075ba011c@gmail.com>
Date: Tue, 9 Sep 2025 14:36:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Remove suspend-breaking
 reset from pcie0
To: Guoqing Jiang <guoqing.jiang@canonical.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, jianjun.wang@mediatek.com,
 tinghan.shen@mediatek.com
Cc: macpaul.lin@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250721095959.57703-1-guoqing.jiang@canonical.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250721095959.57703-1-guoqing.jiang@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_053655_436835_EBAACE56 
X-CRM114-Status: GOOD (  14.46  )
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

On 21/07/2025 11:59, Guoqing Jiang wrote:
> When test suspend resume with 6.8 based kernel, system can't resume
> and I got below error which can be also reproduced with 6.16 rc6+
> kernel.
> 
> mtk-pcie-gen3 112f0000.pcie: PCIe link down, current LTSSM state: detect.quiet (0x0)
> mtk-pcie-gen3 112f0000.pcie: PM: dpm_run_callback(): genpd_resume_noirq returns -110
> mtk-pcie-gen3 112f0000.pcie: PM: failed to resume noirq: error -110
> 
> After investigation, looks pcie0 has the same problem as pcie1 as
> decribed in commit 3d7fdd8e38aa ("arm64: dts: mediatek: mt8195:
> Remove suspend-breaking reset from pcie1").
> 
> Fixes: ecc0af6a3fe6 ("arm64: dts: mt8195: Add pcie and pcie phy nodes")
> Signed-off-by: Guoqing Jiang <guoqing.jiang@canonical.com>

Queued, thanks!
Matthias

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index dd065b1bf94a..50cf01452208 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1563,9 +1563,6 @@ pcie0: pcie@112f0000 {
>   
>   			power-domains = <&spm MT8195_POWER_DOMAIN_PCIE_MAC_P0>;
>   
> -			resets = <&infracfg_ao MT8195_INFRA_RST2_PCIE_P0_SWRST>;
> -			reset-names = "mac";
> -
>   			#interrupt-cells = <1>;
>   			interrupt-map-mask = <0 0 0 7>;
>   			interrupt-map = <0 0 0 1 &pcie_intc0 0>,


