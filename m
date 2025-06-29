Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238A3C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Jun 2025 17:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Diy1MlYscq1DF0Zv66TQbVLrO14SzJmah7qWSQHod6M=; b=HLPmgpW3kg+j2QglVZsLhZc90T
	QB0lKczJQ7jbGcGNicIGvTaGILWvbQhTeqp3lvF90AVhfL0HDNEj7Kl/1zcm0/CW2/0yjr5ekJwDT
	/7zyjBCD9A/+HqRO5IitilU4PHgTwpGbOBBQvBDpOYokZO8llV6eHm/CBSLzxBcs4HHngjWAI0Tsc
	y4z7ym0nmByM7qaeTq4sSmNrDv8pP9kx6PNdhoB6TCDF6MMCjzBd9aSRxu4FTVfn/hZ6qWcCN+IUL
	3tNTdRRBkZFnRPy2V22bvHTyVhUS3a+ihqog4244sUmvI/aPAm8KUgka/jWHph/kU2aTUegMbRLpH
	XBH+L+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvo9-00000000VtN-0RFa;
	Sun, 29 Jun 2025 17:27:13 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVvlm-00000000VV1-2bB1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Jun 2025 17:24:49 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-72c47631b4cso1108872a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751217885; x=1751822685; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Diy1MlYscq1DF0Zv66TQbVLrO14SzJmah7qWSQHod6M=;
        b=LqPKzIR+ASZDR8+i1HO9GbleJI+IctZuozE/VoO/G/wc39F6sHqDxI4QCgzKd1eCwB
         rpjppucOFEKru/35Pwq16ab5ubtV85bgAfajfHBgYQls2hJhZ95hdBYiKMKgtLQU5WXs
         PV5Y8xXLWT1iCkR4fqQml8ido2lAEutmpIFgC7LRLkdunln0gKYdXnu2SqywqNNR9FAV
         Wq4VDfYaofNaqD7SeJtFI/0VD0ZMLe42OOWoKvT2lKCMrZs16vF/uElzlwIOFivpLdu0
         cFaRN/IXhxZzCzzgIUbcmOlWRF5EatoMVJy8RDnLhvPDvBDhTFR3BRWOlIiXTBv/p1hp
         fRYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751217885; x=1751822685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Diy1MlYscq1DF0Zv66TQbVLrO14SzJmah7qWSQHod6M=;
        b=fsOQJ3tHYzF7t9+MPH7GeyH1S8O+Rt8shJ4qCaCPeqXNIQMzw5L0q9Wse9vHLqtWck
         sXB7cosrBeGdI+ByqovEAlrYJ+PoPA7w69HrrRkMIFNewjv1dKQ59YKhp8FTbvPmMCyP
         EyuoyHK6pc0LtXHgVyVQalgZxBnIrYId+m6Yl1DQ5EqyJEBLqFmKEQiPHJ8Gg6AOLBGo
         xroPh8NRHxGfk02aa4vtQEIH6d31rYIHHdjpN3WIp5AlvaEopWVFL9t/q0BcY0ejKC41
         x11MBxzhZIDT+42LpX5tNFn9lHLDYZHab30ASd93rQgxaFc5N0q5jfxIoHNJC5gMLdS6
         cGGA==
X-Forwarded-Encrypted: i=1; AJvYcCWbrVvCoaevEyRAk2kIw+hIiPEFBczZ6Sv47xtGohLAF8C605FAhR3O5JiyFvQ/JL/pv2n0VeqBPGiwuhImgffU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4wuIRbYYSQpMro2njtm692mcHxCTNf4ufBdFKxAXm/r8vRf8F
	/IyNXm1CPmIpC5V05EEPJgctEJmyZuuOydz0gWNF+xPtydPPYjIsj8et4hlgY6/nitU=
X-Gm-Gg: ASbGnct+uA6YobKkflzZfbZ4ywUHC4qIL2CIZXskmPuazwHYwqoMc4Cb561PzFMAKzD
	fbjHaowYaJUSO9AlUnYWE1IfUz39jj8lHOwJmH8NSZ7sLp7S3h5lrvKN5wRUtVsmhIOortqOg3a
	QS0A1y7oGBJyazbzf2y544aq5ZjR7p0DCEctWa1QDYvd4RBgc37HUlw3EpxOxM7hpFt/NBeeTnV
	3YlvFkAwLvEwOIM+6wW9nEHmmRET4f1H+vjdSPddcU+n+fbLTc24JcqeCEpUgt5+Od86/8Yb5hc
	ASlskPukpEHRg8IBGgqwHww5jGVJPun1PmTafxwvzwobQaClRVjnXpp47HUCB7AlrxkGwPsPn5r
	U5YEVnBsF8/are1kZS8wsH+L/SAroMWHSagjyCEbD0a+vNHJnqw==
X-Google-Smtp-Source: AGHT+IEK2rnn6/CI2tLl625vjrG+arb7O1+sLlYYhwkeqs1zOcrydEV8o9HIf7UnVmK1VGPUEVYPLQ==
X-Received: by 2002:a05:6830:3898:b0:72b:8fd3:e2dc with SMTP id 46e09a7af769-73afc5c1555mr9130015a34.21.1751217885111;
        Sun, 29 Jun 2025 10:24:45 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4876:5a0d:2fea:6208? ([2600:8803:e7e4:1d00:4876:5a0d:2fea:6208])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb006a02sm1328459a34.23.2025.06.29.10.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 10:24:43 -0700 (PDT)
Message-ID: <9422d6db-5ada-4a93-88b2-74f1217fa771@baylibre.com>
Date: Sun, 29 Jun 2025 12:24:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add thermal sensors support for MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 jic23@kernel.org, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, zhiyong.tao@mediatek.com,
 linux-pm@vger.kernel.org, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250628223837.848244-1-olek2@wp.pl>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250628223837.848244-1-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_102446_873053_0162CFC2 
X-CRM114-Status: GOOD (  15.49  )
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

On 6/28/25 5:38 PM, Aleksander Jan Bajkowski wrote:
> This patch adds support for the temperature sensor in the MT7981 SoC.
> This sensor is exactly the same as the one in the MT7986.
> 
> Aleksander Jan Bajkowski (3):
>   arm64: dts: mediatek: add thermal sensor support on mt7981
>   thermal/drivers/mediatek: Add support for MT7981 SoC
>   dt-bindings: iio: adc: Add support for MT7981

When considering building and testing at each commit, it would make sense
to reverse the order of these patches to reduce the possibility of errors.

> 
>  .../iio/adc/mediatek,mt2701-auxadc.yaml       |  1 +
>  arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 29 ++++++++++++++++++-
>  drivers/thermal/mediatek/auxadc_thermal.c     |  4 +++
>  3 files changed, 33 insertions(+), 1 deletion(-)
> 


