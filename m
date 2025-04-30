Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC46C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqJMmROQSJ0a0G5OkKSFqFvvoSomW+akyYnIHyWjhOc=; b=Ge2TB5sgYOB/7TArOeMhHQzBc3
	DGXICcFF+qk4gkgplfpIB3TxdzqxGoE9LLwo65wBvSqKS4k4cs+ceDdJHoCORqwGL7tSyvmqs9Kz2
	pul6sOnuTS7gPeGsJmKiYDvudSRid4YXDEyqwxf211J49VRASvcW1nN7yrrXZq2bEVjpPybUIanbc
	tVVZbjP29MIy0DVthSg2y4HemlQ/tDBRMWDfr7fbdbXmowVQ6l+6g+YXEo0eqz6sIgYcurwa50Xbh
	aEv1gE22bk3cFkZQmm2t5NHenNuDGbehl40Nm/BcMV7hy2y+FWRZT1YzvivQnv9FItf4RNDanvoGJ
	6N048ifQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA28V-0000000C2Ad-1qLl;
	Wed, 30 Apr 2025 07:45:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1rz-0000000BzPV-3j7G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:28:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cee550af2so4753665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998118; x=1746602918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqJMmROQSJ0a0G5OkKSFqFvvoSomW+akyYnIHyWjhOc=;
        b=UbD+kwSUvm0q1NfbsyFsqLxIVlNmAQr47FRyOSnUKJ/+I2XjxQ/X+qyL4lSYXED58q
         vwldnn6Yheh1me0GG47S9AsFj0eJtRWwwt8aeDEd3TBdeGBZgIWXb83JewguC0ledgX0
         dce1pNCmqJu7GfsUAZ+Ddr2O4Vwpz6QFjwkUHoM4+8uAyV4shjd8KugXB+U6/HCOEiZ8
         CzLjHy7mXgDxS79/1kD+bFhus/n6hVGnvXvEDz/xcf7TBeWStELdpKKH6ekYjyW8LFVi
         y8NMd//uYUowZ5y7tLKFMvYvInsvBtCSizuO+5Q82H4+wFJaTB9e+nzfLrdX17TZJIXK
         FBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998118; x=1746602918;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqJMmROQSJ0a0G5OkKSFqFvvoSomW+akyYnIHyWjhOc=;
        b=tIanoVF/evfI5h/5nuriMdMI+zo4O2b+gs/6ip4p5iOijjVdQWX2LHBf7nAHpvlnCC
         fZlyQukmJz56ScejSOgwI+3VWK0JsOoQhSu2Xjf6uGwVq9a98JSuo7mwNLSJEuovgEfu
         rhlTyjgtOQ57kBf2jUGBMnHQp48Gh4JcrMzDxW5sGyuEjy+HoZESXDfGfDi+VyzOGlVN
         196kVwAJDJeWG8Qj6BcdAqr8Sc/W8+iDzQbM0FC2CYoh0HjrP1eBbRjNME7/FujxXyJu
         8DVMtSzaZ1y7jOQ8YpLZVO7RCkeg19M9U7yDX8a7OprENWCDDvUdkt2r1w3IHUb0Ehua
         Snjw==
X-Forwarded-Encrypted: i=1; AJvYcCXT8zUv689rBpwM6zux3qY1/2J63vILjQt2D46p/BGpiLwrlbAVW0S8fhXFjU8lstGnsX0po42aBEX9BMNg/mJ5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywxt6J1Iy5jmqUM/u+fdAcgxXRV+mhgsxPlhy6uGOwyqVmt6awN
	akbjSDGELdUcM8WwBjlHWraejEpgt8U+V5o2Ns6rGfxDO+HPqFOxKVJPgCxFKGE6pJZohwleKHV
	S
X-Gm-Gg: ASbGncv4X9GANgTHuvjoI54dC2y3RF3QdYp9c1YxgWRTSbQYo9PIkZUK7BX50lU30Yw
	OvtSQgrx37gVV4Ba9JWIcnB02x+Eb08ueyiT77b2V5OVSgLqe7WMkuFoIIL/L0XawEIBMeGftmx
	Ww1emMcLGDr/nWbftiqIFGmV/jI3qP+Bi2aL3x9Bt16ZXqT0Lpc7iN8DEVvWgb62Zj+e3VHLh2A
	qIMtKB0lzmCmyXNQuNtaq62WY/YPWUnn+op8SdtWhEsTnmOKJLbX4pdwFBe0aCMgilLy6bpaYYk
	hapRMiPvnwxTXKK2uS3Qxtbgw1iZq/yddV7QjJk5jGWIQosS3NEywuA1lV5WTJ2ncZF9Zw==
X-Google-Smtp-Source: AGHT+IF7Gh4vjC7xC4WSD1iD2VzffiZ5t8WLUUmff1SqKYA61CCGorcuPW7hl/AFgfoE9CQrmxQ9aQ==
X-Received: by 2002:a05:600c:4f8f:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-441b2bff6aamr3696935e9.0.1745998117810;
        Wed, 30 Apr 2025 00:28:37 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-2-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113547epcas2p43ca3c8db840a4235365f61151b043fb3@epcas2p4.samsung.com>
 <20250428113517.426987-2-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 1/4] dt-bindings: clock: exynosautov920:
 add cpucl1/2 clock definitions
Message-Id: <174599811635.45412.13637965232179255508.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_002839_946626_9B32BDCF 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
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


On Mon, 28 Apr 2025 20:35:14 +0900, Shin Son wrote:
> Add cpucl1 and cpucl2 clock definitions.
> 
> CPUCL1/2 refer to CPU Cluster 1 and CPU Cluster 2,
> which provide clock support for the CPUs on Exynosauto V920 SoC.
> 
> 

Applied, thanks!

[1/4] dt-bindings: clock: exynosautov920: add cpucl1/2 clock definitions
      https://git.kernel.org/krzk/linux/c/3c50137aa4c80c532cfcd7444a36b21710189ebf

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


