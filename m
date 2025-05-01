Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A7DC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 16:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blFO9nj94W2sQqi74hSHTooSl7uV3ZKhQoJ+90nLCFw=; b=Izq0SgPOwp6GEiO6OEQc+Kj2ec
	/1NFaTrwGB6WXo21Hwafeag18bL0jOcvzqEhdiIpHcPdK3lAhJWyRj5lIDdgKColUmHb8Rs81cPPy
	uCeOvmEwh90o+aYp6ZVS/29La1XHz9DUvHS8FOxwPhTSVvPIqUVrLPBrCBFqN/Q4i6YgfFYFg32vC
	OpJIBfJ/ERNk1ts0zOhpKhSH0LpxyMh1PuCCavf69FQyqu5rK9ZOlBR/o1KH+oXN/nPZK7BblX64w
	iSDxvBPd25WlFSitLGGKQYzwO56y2dZjsJDAVMz6jnK8C3sfk2TcFuY25svKcHpmFtVCzJqg42UeE
	as9WrrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAX3r-0000000GDJA-3vWH;
	Thu, 01 May 2025 16:46:59 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWwH-0000000GCFK-3lAP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 16:39:11 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so1380575e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117548; x=1746722348; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=blFO9nj94W2sQqi74hSHTooSl7uV3ZKhQoJ+90nLCFw=;
        b=Qye/+Yr6UXHeCWWU4eYZV1Pjol4tgnsMeWdwkcKFDrrv4qcWAFHcq9L4YfgDDfTVlY
         pojleAKAzZpoGpyn5Q82Mv263hKQFbi4Komo5frcMls72P2VegkkX3iOjaDfPjT5/K56
         tSYTuqkgYTnFSGoHTQRoEos+60OWKgZipL8znEdtc81tVU1ux5IrkndEwAxFgcmpynRO
         kTZt5iHbPF4776+nwhRrVUSFde+aSNWtC83Rb9iP50xR035/4BJ/zECaphKcoDyq58Vb
         k0pvO9c56kdXNQ/DXh59dnCRRVqrcX9zDdggbZ9NCm7UGZsG06PGuHSncSHBvDHdNAHn
         rU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117548; x=1746722348;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blFO9nj94W2sQqi74hSHTooSl7uV3ZKhQoJ+90nLCFw=;
        b=B/CIGyQ7tEOBI4M4Q0pzAHQRIi8tmP3/fZnNi/7MX2sKtoPKtS814BMFeG1nFbpWOb
         do15z+UPQ026+1ErQyyv373jpNLqm1HuAylMIi/tQ7yoiymsQlsBhHPzyX21kA8xDvHT
         9zsKeTWlvvW6TLUgzhJUoJsvozbWsZI2+egE5iAR+dIjT+RIuULqJa8ur/XcQPVJzZ07
         +pwfHAJYXuIOUVNXaFXLuyjWU7J030DGVE2ZDXZSkqBOK4iLd2vNdj1H4cw9M8XjmEgc
         fO9DYlD1LfVclvmoU4SH4s49cEPlRAwcASJVRD/N1XKvgqqPMbVIayI7kAQQuFyl/3sj
         +e7A==
X-Forwarded-Encrypted: i=1; AJvYcCXAqqka5XJ1yIqx/YqrAlg8p9bX/Bl4+Fbrls59adCzZZdGIAApyJySun9uJ7qez+dPZMYV4hmVkdyzoZLbaLYu@lists.infradead.org
X-Gm-Message-State: AOJu0YzTPSDEMjd5Tzg61h6/hhKzndro7Prtw067/TX+ySjAsfbQFmAU
	tt1w4i38RFTEnaETzx1MGzmFmss32i/Rr/Q++7spIVDX8KglfR/oH2TK0vNcRic=
X-Gm-Gg: ASbGncvlljkOLsByyW1GKvtzlb3Vry4x9juihTH77bHt/qTV7DzR0Q7yO1akTSc8NlS
	xSLjYEqiWQS1NmnHz75c6qoyfS0u5eLL2hzLmyOksALtG6CxDVYZldLmuT0FM6Q1Y9ZCHM+7aXJ
	4nBJrORq1xugcjaToSjA2K5rmeQQjhggiwKF7qiAzrYuf2VnZCbbBWQQXR17CJkolKHY40Swncl
	hLccHLCNSUaQQUP32egc/A2BkGt5k3u5yI2K1xfKCAmN35Wrz4WV+YTvUYNr91/3hGIWaZWJQjt
	/62KVyH+ujoCXpcODihNuyh+yjSXoCgIvy7OR4gT62ZUVkqTsqAJZljbrMs1j5XocrFsig==
X-Google-Smtp-Source: AGHT+IGyNaNrDJUN4KrX6FLJUPQ7uE9Qq/8rComdsxtYw1MA/vRdRpy2qCoOwiHYoDt0Ee2LtLh7RA==
X-Received: by 2002:a05:6000:430c:b0:391:277e:c400 with SMTP id ffacd0b85a97d-3a09009aadfmr2159212f8f.13.1746117548514;
        Thu, 01 May 2025 09:39:08 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a46b23sm1258988f8f.34.2025.05.01.09.39.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 09:39:08 -0700 (PDT)
Message-ID: <af3e3007-edfc-4fdc-82cb-38457ba60d3f@linaro.org>
Date: Thu, 1 May 2025 18:39:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 0/3] iommu: omap: Simplify few things
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_093909_938254_57A1AABF 
X-CRM114-Status: GOOD (  10.18  )
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

On 01/05/2025 18:36, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Combine patches #1 and #2, add dev_err_probe() and drop the comment
>   (resolving Robin's comment)
> - New patch: iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable
> - Rb tag
> - Link to resend of v1: https://lore.kernel.org/r/20250212-syscon-phandle-args-iommu-v1-0-c3fab486b426@linaro.org
> - Link to v1: https://lore.kernel.org/r/20250111-syscon-phandle-args-iommu-v1-0-3767dee585a6@linaro.org
> 
> Few code simplifications without functional impact.  Not tested on
> hardware.

I forgot to drop the subject prefix from b4 - this is not a resend, just
v2. Apologies.

Best regards,
Krzysztof

