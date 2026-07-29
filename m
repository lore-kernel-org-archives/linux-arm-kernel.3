Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E655CC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 19:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeH+WNiUe/anlxAPKJgAg9qgcQK9PQs4CI3joLBED90=; b=JiwH5vIXCph5Q8mC1PH1RdNnPy
	4yjdyhvcSBm181d9AlDQ6zGtbcNEcYMsgoFDhvyiJVHMECH7ERhk6QzxUKhlXRcg9tdZnjzfv0Eec
	eH6v07dxcwCpLcotE6KOOH8XP9+7ycG1E+HsuqFnN9WVtwFKcTCd/TH3GpMO/wRZVUQRX7esl9kig
	EBUnqU9lcxFtXD3S1KDfAqdpFMmrtdQuGioU5cqRbwRyAQ8qBsGozOz7XicKQzxgENzqFwEzyH49Q
	dt4PM39nUNqG2aW4eCcCt8Q3RmCMuF6g3fSXV/LQWW0Du/2g4jQaIb0LysUCF0wRKiWR89TS9/Zq9
	3RnKRkeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9VP-00000008qpL-1JpO;
	Wed, 29 Jul 2026 18:59:51 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9VM-00000008qoO-3k2e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 18:59:50 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6ab08d289d1so821994eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 11:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785351588; x=1785956388; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DeH+WNiUe/anlxAPKJgAg9qgcQK9PQs4CI3joLBED90=;
        b=pUUKg62X/lHIkeOubkhuyDnvUVg/PEdBJg6ndMnwe2DqlIGAhr7xnLGZJuM3q+Jd3m
         /Q4VcXW6ZPL6TyK3b88ngnw4S0GjkCpcQR1HdcH0vp67RcAsghfbuM+P15MJBikcjrtJ
         9uL3UGqWIFAsZfMRdm/YGM1i8UKGjBZGK8gzO2v9m3/0jmTU7l0tz4HUa3GyloRrgEC9
         QzH9GJW22lsTKMwE158WqMeDMHcYkrV9OPFTM9DdL23I3TLeBKaDAnoV+MT9ahBSSAo4
         jM/qnQzylmCbCFKMzfCdryck3Us28zeDM2RVpWLDRBxTn5Oie0h9X90g2jx3lzhPR4Fb
         PvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785351588; x=1785956388;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DeH+WNiUe/anlxAPKJgAg9qgcQK9PQs4CI3joLBED90=;
        b=cyLc6J7mxs2Ie16jzw1aIhcSWVoKLLr+hGlGIeW6B6bsVZmpNh6bohGLsHMWjURb0f
         sJiMDXQ/dkczXLDp5Q/EC/5hrPuuhT0w1nr2+y5mZyUp3pfgtGs0p5UIgmKNX62l6PcE
         9ZojlRS6mq9hRM6Jycnk3A58N1+kDZuZDZW4RShZGHFGmxr0ELVTk0PbHGWequ+/UYvL
         07kxzqTxMQlDYEyBC9x395m8zuNtRKw2yEgE3t35y971guYr2x4F0dg3fSQ8sdVRXS6p
         evy7FOW0tWTHVITTE2EMepOMdIiyogSPazT1LYZW+6SCABfuA37fA0zkWvcp7FJeHJQq
         RrEw==
X-Forwarded-Encrypted: i=1; AHgh+Rrsfm3oP+C6jwCjsvGCrZ1CxqWXo9zXbUwt6vel/VmDDcA1C1L2FRZF38UCae7ByWnVZE2CE6Ty7SlX2ZTWaRrq@lists.infradead.org
X-Gm-Message-State: AOJu0YxPcPOYkzcd53XPHMcxmeBzmWuql2EWACguGpDNXBbofUxlK7W6
	LLWasoZdDvUDcjsH/OZT8q/TDgM5cnYgZxzGUG3AU/7n3cicO0dgK/At/wXMj2IPOos=
X-Gm-Gg: AR+sD10rHUU6pmkz6NbWLprUEIrFUAJt/yxlgv7IcNxjvAVdps1OZjdI+yL1KVYj7WZ
	zcqEhd6ycioumzLtdJsbkvyhRWaeqnum+l53FpHEWAy35icj7j/wXZRETSoLZCFuDNcdMVMjlFG
	e6CvEoF4VadDlag51ZyLr8jvhzDtyjUF51aPMJgg+6Tkoud+AZAxEDBcttztIV0MCCrZPb8uznP
	r6QxG+w/N+sgqtfAAmP5BeZGGqopLdNvYgtSMu8Q7SZJsgML9VPZ2RTOwWF50Q1E/kaahu6cz6b
	7WEwpaHMWhLFOaN0ReEx0FMLzpkaOIT7EJRE/ZfprYCH5en7vwvzNC+hj1CVq3qTZ/0RMra4J6+
	FePBDdiyKZz5EHSoyx7bU69ZmeCiHtn0mbEK1Cdnb66nTMxGVyqPDtvdcKXXhToEjdOVqPZo+4H
	tiIYQTeLGNXow1HmFxs+1Gz7qc8GadVa7bBv6XOMvH0u+1biWcgl9AUilYOc7fpS4X38HA8zH/7
	jW9R0H8iUA7zxM+kxyhn6TK1BtBVHxBrsirivQ=
X-Received: by 2002:a05:6820:c92:b0:6a1:98fe:3da2 with SMTP id 006d021491bc7-6ac9697e7d4mr4033926eaf.11.1785351587691;
        Wed, 29 Jul 2026 11:59:47 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3096:ee5f:6f57:afe1? ([2600:8803:e7e4:500:3096:ee5f:6f57:afe1])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aca527fe83sm2603945eaf.6.2026.07.29.11.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 11:59:47 -0700 (PDT)
Message-ID: <9ee5b759-30a3-4387-98cb-48e8c2f6a9df@baylibre.com>
Date: Wed, 29 Jul 2026 13:59:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-700: Add boot phase
 tags
To: Carlo Caione <ccaione@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Julien Stephan <jstephan@baylibre.com>
References: <20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_115949_248179_585CF8D9 
X-CRM114-Status: GOOD (  11.90  )
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

On 7/21/26 8:24 AM, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM. It
> needs the debug UART and eMMC controller, together with their clock,
> syscon, pinctrl, interrupt and watchdog providers, to load the firmware
> FIT.
> 
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 81 ++++++++++++++++++++++

It seems like this would be better placed in mt8390-genio-common.dtsi
so that we don't have to duplicate it for Genio 510. Julien can test
it.


