Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33561C36000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 22:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8yT7bxx+POTQPmMty55njjk/M6SEwDhRgh0uxWleRk=; b=ZdniiUFbnBR/GwoA6cG4lVZw4B
	OgW+tRFuYAd7/9sYSNBGlVsOZ7lMOn9SBl67Yad9sik1uPMDvTPvZfqq0MrtC7YEBDP7A2kehXdTr
	u9iUORoc6OtEi2SHyxEn6puf8JRcGEDmfdGslz7GSzj4FfEc6SUM/l4qJ9PvvG0fa1mKT8BLk02Jj
	HC2wdmPyPYwe1e4Cgksb9iRqUyQoobCYXrK+BF7coEi2W/QBC+tPHebU+nnYP0xkiedFBmKkjuwLz
	0I727ZfmhH3kMBg95/DV8QmlP8+tgTLCbzAX23Jb0xnx3ojM4w+i/CcKt/fp5OYdvyqKrJ5ZvDG5a
	7eO1NiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNz6-0000000DJBf-0fYp;
	Thu, 20 Mar 2025 22:03:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvNxO-0000000DIr0-0Hwi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 22:01:43 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso8848775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Mar 2025 15:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742508100; x=1743112900; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w8yT7bxx+POTQPmMty55njjk/M6SEwDhRgh0uxWleRk=;
        b=sUpxZxzNp9MQqUWY/DcANLtSgf6D0acK/wTnX/2vD6MNyKFALEYN7/5X4B6ON+bnPh
         ZkJj3cVzwV6fAWcvFslv5mHaprwlPYkTAtlLuOjQfR3mm6YoZFXJrzb7TMuwv66JqWL7
         mev1FktOm9MbrduLU68XoZDNkE1i1qGp+Nv+SIzmd5d/JAkrtKq6Gb+i/NBkB0rhKZN/
         s+FqIW5id1DsHC9ySEgvD67c53IWN9FBGZZLVdWxdTuifGfbGFa1P/RkUFrqVgs5UjWj
         kXwtSaAHY3fSLndCSTgi9N2KwhgKRFkgQ8rTy+Em93ZDYjOCd/XPoFiXeYqotR9d864C
         gaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742508100; x=1743112900;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8yT7bxx+POTQPmMty55njjk/M6SEwDhRgh0uxWleRk=;
        b=LJQgdh/CCYWemwQP8f2r2C1LQDtEAGA1qTnW/T671z3ZwC8EX7Uj5W60wdREm8+9FI
         WOIKsegWbkJ1LlS/2aPwoH5hxrr/mkiqlvfw2LVn3qGH2dIAu6ZxGwvs/Fai5ipJoqrL
         I8qi6VtHSYQa3FwmSYOOZcG6m8ZETkLeXUtLGm7d1/onYJvOhd60Y8fdUUVWKzt+ib4O
         a2piFfatdZGeU8L3sdDHN2BGrVbq9gotnhT//Qj/Cx4b0gjlkTqe9xy3h7PFzvs51Ws+
         /oxWpb9RwJVJcxD4ERxC2WSo8o9aWk7sDLPoaA9yrcsBUs7AnpHRsrPntcmJF3lyqPly
         AYtg==
X-Forwarded-Encrypted: i=1; AJvYcCUVpN2MYj2JgPvJtJLPC/tzz+z5wv0p+ORsji3yxA7cmYIKD2jxL+VI8GHkWX5lYXljWeVC0n5s+AU9Uq6Y2URY@lists.infradead.org
X-Gm-Message-State: AOJu0YxpA+Cap6Ug3FgyB0fGXwzPPbKXZyXoK1AusQZSpE4mPwTQGuv0
	m2Q0H7EZMkYRuLgd+w7zFeOs3aWwAuHVVKq/TlSbXGVaulZAyjpphkYrtXrulI8=
X-Gm-Gg: ASbGncto/Qd5mxLAirB0FZV6e1I+GPbwyBCqikKEG4SbsMET8V3bWwaxp6exorbon7R
	x0rwQQYtytPS4hlkaBVSeEI9vCwUpmVXV44dii1YapBaDx2tEUEL/ahEmfswxc1Pd6vsT3Y8Q9K
	qnhZHsJTaWXAxkckES2f3KOEXGdjCANmN3aBP1n1ZY1q+1t0XJI/At+gBRb6rZYvGouQBdP0Wy9
	2q9A5YfqIpuUcajcXWQyJcwVYgv2ApGNi5kGnqrfgjpQMZbu8rpfSEBoOgby6YCccROTSMK30W/
	teLtKxQygCQLAfJc5xp9kpuvmMzPOd2gNR6lBbXmilqSX8Ve28i7PMRY0e3JeknqgLcd6ylRQ/Q
	a/ql+4MjgeA==
X-Google-Smtp-Source: AGHT+IGz8sDCfiUcMrh3ZaHqynp/YtvdJQNLTBk+X4KzsimZeV2pCXU70QJKuqlDD/aS804bEebyZA==
X-Received: by 2002:a05:600c:1e8f:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43d502e4332mr11888305e9.4.1742508099644;
        Thu, 20 Mar 2025 15:01:39 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbd1c7sm8939025e9.40.2025.03.20.15.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 15:01:39 -0700 (PDT)
Message-ID: <fff943a6-4322-43d0-9821-08375bc5376c@linaro.org>
Date: Thu, 20 Mar 2025 22:01:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for
 PCIe3
To: Wenbin Yao <quic_wenbyao@quicinc.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
 sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
 <zqBb_94gbwLzHgbAiLqgbuGg9wmeV1jUxHOsMXDdZToeTtRrtUimm8ra7GB48DXWU-ZOvC5mO8EY0uvxz46ISg==@protonmail.internalid>
 <20250320055502.274849-2-quic_wenbyao@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250320055502.274849-2-quic_wenbyao@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_150142_119650_968FE1A6 
X-CRM114-Status: GOOD (  15.57  )
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

On 20/03/2025 05:55, Wenbin Yao wrote:
> From: Qiang Yu <quic_qianyu@quicinc.com>
> 
> Enable the pwrctrl driver, which is utilized to manage the power supplies
> of the devices connected to the PCI slots. This ensures that the voltage
> rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
> on/off if they are described under PCIe port device tree node.
> 
> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 85ec2fba1..de86d1121 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
>   CONFIG_PCI_ENDPOINT=y
>   CONFIG_PCI_ENDPOINT_CONFIGFS=y
>   CONFIG_PCI_EPF_TEST=m
> +CONFIG_PCI_PWRCTL_SLOT=y
>   CONFIG_DEVTMPFS=y
>   CONFIG_DEVTMPFS_MOUNT=y
>   CONFIG_FW_LOADER_USER_HELPER=y
> --
> 2.34.1
> 
> 

PCI_PWRCTL_SLOT is a tristate symbol why be a "y" instead of an "m" i.e. 
compile this into the kernel instead of having it be a module ?

---
bod

