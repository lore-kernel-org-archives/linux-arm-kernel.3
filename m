Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB99C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 20:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+NLeKkmFfS3FdjQ1rDekiaYo9KOrt0849XuRcwwgxk=; b=mGhHwP/JOtXWSBnLpKkL9C5D+u
	p3FU6YyR1ze0X1PuRJBQuNTuyTjNoCu2V/Zgm8z9G0iFzGRTPUCbH1z0HULLoNKjjAoFhFdC5TN1Q
	SemBsomqe5i2ZBaB/Ygv+g91OgNwA/WNKhWX6QIf96jyk3H3hfdofgZ/NRkdruwMUtqCmRZAwyTHP
	ZKLFONPXm371c8jIlUkFBDWdEt5n3VERxNRF4riORTfpO9cm+Kd8Wy/KD/pMHDT+FEKf4ROqfUVAL
	WEzE3Sij6GKIFz8NBW5XCxioFWFF60vSfkiZIbgYHbSrtuaMKzgNJCVkhaDR3K/gipFBEyVILV3+H
	P/60Ainw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udx4r-00000000cje-1nTs;
	Mon, 21 Jul 2025 20:25:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udwu2-00000000ajv-3Aru
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 20:14:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-451d54214adso34122785e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 13:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753128865; x=1753733665; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W+NLeKkmFfS3FdjQ1rDekiaYo9KOrt0849XuRcwwgxk=;
        b=tmQLGFtjkQ8YcheAYwg5+0h/jC9ktunvTQTx7SM/tHPdYLfdrWui38T8kv5g24Nvcw
         9eVleFkXMrutZk4TemlPoVwUP3JUs5px45eK4K+ntUAnHeOu55Ial/Jluw+8V0G4ekhT
         ED8YGomuWGC40TpkYRGjedvNtOITK5oSD2YzU8eu1az/lA5u4BPI6u1ocWbAcQq1iF8L
         0GSs5ldJi90bLBCMLL9wyses9F4QpWiyoOY3amGsmCHDseTY3fvnVqzxbCnMddPe2s4X
         K0zt/FaujxQJmcVbqEmMGja/PX9A9oEUWfanpZI8JJWHv5P2NVdaolnfcPGdo0D/LenY
         CaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753128865; x=1753733665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W+NLeKkmFfS3FdjQ1rDekiaYo9KOrt0849XuRcwwgxk=;
        b=EuZSdnE93m1szyqeiLoTa5EYNeAXpWiEZZ8BknU3eCrUBHfvSCod54/BdRQ4lsvL6r
         7q4//wzHsd0kdmYmRZFgbiIZsQpGV4HOxvt5hg926FdkgQOjOoHKXZ1OfW83WFfmcfsW
         e/ERttYooGKSESsuP9s/jslElUk/zfycQ1OGh91cozl01ADsq+qLnmNncvc/f+w4OuLE
         kEagnuIkl3Bhziu6lS+XN/TwNIWIiTBhn3CrmevE6nGOVB7+XlxJsX79kUBVoA7Y7FD4
         76mrUdIhamG5aI6eJn40kdPYF3478KvpoWLXdENlEr0+zVdM3wRPDCT1EVcw9dHnDKzY
         1YvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUy4HVSzPQnS91KMkIWfw18tkQl/7sLvjHpbZI8wHvsN278ZAsm+o34SJwKsKmDLA3ck4SlBVsRcklrUdOl0+uO@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc7HOp+AVQmkD3PkKNbGVSjROWH3SfnPMDw+EZ2xJviDZF7i/9
	78KvqcXlh0OfqrsKhSKGwzjZoKYmD6WXGxfWf5sybtQoFT+SsEnhYIWlpTkDU9Gplbs=
X-Gm-Gg: ASbGnctJcn/lSX/y+ZN6+o6Q8ttT5v+3OCswDYXGjdW/0HTOFK2arIGnYWBq3nzb5dj
	Ym/1w2wZID+9Hh3T1YjRf3eUS0JfP7gdKOochUYidhw7W249Jj/EiJvXORDTnL2J38NRNPRPMwH
	vy5BpyTQQhUWimcRaC2DeYmTtIuNZgxKMirwKsl1bV3ZsTzV7/WDWCXB9uHLTQZZr5RrZyiY7Oi
	42zqtqvtrWiAMFUl6OZuI9z4Lno6aevtTwB6QHKXz2/Sp5NgFbFOQqkImSquPHqdhWtfqHeQFWZ
	tn9KUtK6NmUvxufxyKkAhya1LrA3NRR7d4bPhsOgMkr3V+PoDuDESnwoeKmybO3nQbm9s+TRwep
	MoVZOsqnPqFswkb21FamQLU1u6Y08UPNMlo66+5Ws28mfX7GmbdR8s86l9AdX+xZKLd0SmQMmVZ
	QFPTw=
X-Google-Smtp-Source: AGHT+IF2K0d0bKG4VD7/lCdy/OhzmE3w6YgPLQSQDJFH+YKC0cK0MI2AOW58kLCdtZuimtB0pT85RA==
X-Received: by 2002:a05:600c:870e:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-456352d2ab1mr153619675e9.3.1753128864772;
        Mon, 21 Jul 2025 13:14:24 -0700 (PDT)
Received: from ?IPV6:2a0d:e487:135f:abd:1f99:991c:5b07:cd28? ([2a0d:e487:135f:abd:1f99:991c:5b07:cd28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45862cd7143sm1464855e9.1.2025.07.21.13.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jul 2025 13:14:24 -0700 (PDT)
Message-ID: <23b3cd9e-50e2-4888-81a3-c6d340bb9583@linaro.org>
Date: Mon, 21 Jul 2025 22:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add thermal sensors support for MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, rafael@kernel.org,
 rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, s.hauer@pengutronix.de,
 rafal@milecki.pl, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250712195904.6988-1-olek2@wp.pl>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20250712195904.6988-1-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_131426_809575_70CF74DC 
X-CRM114-Status: GOOD (  14.40  )
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

On 7/12/25 21:59, Aleksander Jan Bajkowski wrote:
> This patch adds support for the temperature sensor in the MT7981 SoC.
> This sensor is exactly the same as the one in the MT7986.
> 
> Changes in v4:
>   - sorted bindings by fallback names
>   - dropped accepted patch
> 
> Changes in v3:
>   - added fallback in bindings
> 
> Changes in v2:
>   - added fallback to an existing compatible string
>   - removed second patch as obsolete
> 
> Aleksander Jan Bajkowski (2):
>    dt-bindings: thermal: mediatek: add falback compatible string for
>      MT7981 and MT8516
>    arm64: dts: mediatek: add thermal sensor support on mt7981
> 
>   .../bindings/thermal/mediatek,thermal.yaml    | 27 ++++++++++------
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 31 ++++++++++++++++++-
>   2 files changed, 47 insertions(+), 11 deletions(-)

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

