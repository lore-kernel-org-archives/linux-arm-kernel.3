Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E45CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgeGgsFM+rQArXvxzAToJZRLnYQpJqlxlgbUcOeTf/U=; b=vpUnuKq+o8IHaHPvzW8TdyJCm6
	sV9jccTcnndWEt3GmzFgsYKXKfROccImml1RzfnBALXg0hGzOm4IrfLrSfsJ5dEexQEMqyJRnkKMN
	85P+4i0TERD1q10yMlhfiHIzu92WGY+GjJt5LrYhFFhr1nZeDZR1aM+Tdm5mO1V3Wxpgsam8Bu/fZ
	6Gd1D2vBG/xFEiIdA0SS8YIBrw07+rWo9HnodPOYXySsRTBMo8QAJdLlggpeR0QMBr66jVWvR5Nnt
	OwMgrYNshxj8Kk9qo7uoz+yDXlIPoknAZyRNc198/Biw/9APCT2AKeV7ZJNH3Zb+vxHkg9IUlFMSz
	uVnv1a4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkd-0000000DauD-1wr4;
	Thu, 04 Sep 2025 18:32:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAOH-0000000C0vZ-0xcq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:52:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61d2c26963cso189783a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756993960; x=1757598760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgeGgsFM+rQArXvxzAToJZRLnYQpJqlxlgbUcOeTf/U=;
        b=D+mkG+H1U0Mi5JUytYYjfosPdXpHJ/YBrIBBEnOqXtcYQ69ydc48m7wGY2VTYX8E51
         j8kfy0JFz0IJZwgaVHd8kQ7EnjkSbNAAQZhj8hNkIGUIYk3KrFiOH05eL6o10HpLOAm+
         3oVyPLB0lw4D/PbsURxXwYqfU2RfFDvi5EDwftN0fhIXo/37mJe/mirCcpIPm2I1FCXg
         V7b640N3bvqZUuEi4tAYnHgF1e2Nmx0OWy5sRbvIjnGjaRtEkJ7VGETv90TuG3S1AZqy
         Hgr33QlEpHfHQO+9UkkPtIsO1X399o72eQJWVMSW3e+JFBuMFnL9LXR6GkzPTC2c1HOs
         nUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756993960; x=1757598760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgeGgsFM+rQArXvxzAToJZRLnYQpJqlxlgbUcOeTf/U=;
        b=N9Xm66+85g0kcV/l7C5n8deTDcs62exIydnbawSM2MFe0pUvHXtu+jT3pq2OFk7aKs
         iSEEPYk8ZtjDI6te5Yapsp9lZsLd2p17wmSRMWgPtIs6E2ayPMdZBoq8FP936EQh4pDd
         go9jWG4bYeQFyOcln+Yu/hnUCJQYR4DCD+kHDzKRoghsV2NwVIZmJ+AApsEfopp8BC4g
         Apt4VvpkEPytO7svU5JKdlXWuEsexuDyso0rDazx+Osg5Oy/h5Rh9+FiGeatEz86a5fb
         2HDx89KYdcrJMxwFGX7SUl0YhA6aVoqcmt2/UxNl+++5BPlZXfWN7dcQvnWCb3NrAkfM
         +Ggw==
X-Forwarded-Encrypted: i=1; AJvYcCWuykEHnZ4WDYjcoV9PR3D10hSFjAotgnUX/lUmXktQi9nxG/P1OEQYp2FDL8P8wHEtTAMiIhG0pGgxbTWMxHZS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4V8LB/P6SlMn0TuNI2zPVdTDhMq7L+GufvYEWN1dMOSSWE6sY
	A1v1FvZgE8E4LCTXV+wAJ/vXHeBNNFsDJcXqJo8QBihNTkP+WHyzNhIVV+HKamwsE+M=
X-Gm-Gg: ASbGncsRppnm/SesC0Q+c+84akMYV+P2wO/aRwMmfH6/F/7SeQ4vQ54oRUo0lSjmOWD
	K5gh79uhvSZ567UaH3BBTVkyyPR0x/6k4VaSDrnnQPRWaWWRv7RkPJDPnomKm6/WdaGJLohsg0V
	q9ze6HbwPvf/3Th1QtyiW6XvtXSjDD4Ho3FHfR5UWCV5EsEUcm1c+gcWnSxa9k398OVcP0FH9Ua
	serLVrf0yN71g6+aVd6A5ExkITFCmH3ZNUuGfLE9fIhTm9nndQI8x99Xhcawu0Na2fHSHXWLWgi
	vM+2DdUiOSRh2vW3JvMQbD43OWaPpHttT4OkyiICQ4sGBX9e19Rck7HouG5aN6Pq440EOsvwc4+
	P9c3tDLtp5cOH3H/mvEThFfVu+qP5ERRBDQ==
X-Google-Smtp-Source: AGHT+IENiGowH65uqsGasImJfhU5ju4Jy1wXyVGZWUIgsAvpgpMXFrjAosxNPFmKdbC/U5NW3+rMwg==
X-Received: by 2002:a17:906:ef05:b0:afe:872a:aa5d with SMTP id a640c23a62f3a-aff0f022fa9mr1200463066b.8.1756993959596;
        Thu, 04 Sep 2025 06:52:39 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff0a591819sm1510983766b.41.2025.09.04.06.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:52:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: toshiba: tmpv7708: Add default GIC address cells
Date: Thu,  4 Sep 2025 15:52:31 +0200
Message-ID: <175699390854.173213.7488244114872177547.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822133340.312380-2-krzysztof.kozlowski@linaro.org>
References: <20250822133340.312380-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=JAwT2iPNt0TjVzVINIBUXGLhXR1IIpvFzujMO5pZKB4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBouZmfDWRJhl6b8w/8lg/0UJorn6ZScQfnQoFSS
 VWnfGSa3qKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLmZnwAKCRDBN2bmhouD
 19qHEACHjaZQXOJurWs1+uc09ch7Ro25A/y9Bw7jFLvs2B+A3naqZxaF0gxgKyx/cMCr/T9u61z
 HY/rzoIoXsmYL/Sqs6mX35jtP6tktdeTB7H3db5EinZo4t8DoUTomfVTMtS58dGp04zT/tJQ9w6
 Iw1B5u4x5BlxEXcoumOakBjn5X7TmVm4LkqB/wEneETqCqGQlbHOPy4s5Z0DlgKYfTrbQy6XQ6M
 wsTP7BEQ/EomzGk9NHtWsfkVCdYfrugM5NRgxBjxIcC8bXzpqjDOO1rrU+HNBrv4PyEejQmhGKv
 UbpGUVFjEFZBFUnQjjLeWErR/YnJM6WgsXXl8v0GHuUYHPsBj2hRA7O2ZJ0awPdt28c69dGJSKS
 2PTvO8L+KUYX4bJFJC12BNIn5IsyLtbtVrkj/1IsepHQwjd0RcSAYXLsE+Ho8CuO+B3YUjHNj/R
 keyRvrG/6gJv1g+givKQbePm2rW11cBf2/yrwYtO13swEjRizbuABQZnEkyr/l4s+Zxdn0DpmCl
 /Vbt5vLYw+uQsCEHjiy+V6VOaF2xhCMdDhur/avNDDwoPOQgvMMKHlXKn1FY7l2ZdlF1qef88Qb
 rs9kR5ZY2v3lGUjp4EnRD2ezJ+R77Gdlq/jG5kWSlKgzxebKx0SqqTSOWKr20bbZP50nxc2chNF 53z2xcvrrvHjXTg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_065241_270776_BC47F848 
X-CRM114-Status: GOOD (  12.61  )
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


On Fri, 22 Aug 2025 15:33:41 +0200, Krzysztof Kozlowski wrote:
> Add missing address-cells 0 to GIC interrupt node to silence W=1
> warning:
> 
>   tmpv7708.dtsi:503.4-507.28: Warning (interrupt_map): /soc/pcie@28400000:interrupt-map:
>     Missing property '#address-cells' in node /soc/interrupt-controller@24001000, using 0 as fallback
> 
> Value '0' is correct because:
> 1. GIC interrupt controller does not have children,
> 2. interrupt-map property (in PCI node) consists of five components and
>    the fourth component "parent unit address", which size is defined by
>    '#address-cells' of the node pointed to by the interrupt-parent
>    component, is not used (=0)
> 
> [...]

Applied, thanks!

No one picked these up, so I grabbed them. Please let me know if someone else
wants to take it.

[1/1] arm64: dts: toshiba: tmpv7708: Add default GIC address cells
      https://git.kernel.org/krzk/linux-dt/c/7ee0f223cabe9b9384250024fec577c731cbcf72

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

