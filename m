Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A218C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 08:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pRZw5w+2U2qZZUcZUPyn53QbNuJsJLbWvkiinmtjsk=; b=QSiCK2Tw81LISvVyYVJdFwsN0m
	/ij1cGYONzmLRgD9pjUy/oMh/1tAruCSpGRmDES+rkM8i4IXIuc0gg0NujXMtxOCPGxvAnSXCYEzv
	Eb1jDV/SIXEuM2rY0FJqqH/VBh6rKb/eOnbl/AK3e1e19lAQ+cB4TuPtsNMF4X1ZjuJcOMVDK1eJ+
	a9Ma4Z4wXcg+CDriGthQXJWJchCzsgFJ3x/uI2DJzRzXxuzOVm6AO7Tta7uhqgm/cxfFmkClori+i
	LX9T108uqCdX9AY0RnHyTSKBx7q/eJgFPh/5kTMFZCVA+eQZ6c0CGe2FUnGqrJA5nnIaghAt8rJM+
	Wuhy4p6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpkDT-00000007O5V-05kE;
	Wed, 05 Mar 2025 08:34:59 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpk8r-00000007NOs-2Njn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 08:30:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-390e702d481so3004786f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 00:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1741163412; x=1741768212; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/pRZw5w+2U2qZZUcZUPyn53QbNuJsJLbWvkiinmtjsk=;
        b=HCYzxTohVT8d+OyAr4WSm8hflZl0LdpgIOUAYNXnIY7/od1cznMRwpQlZHLY3VLwAL
         ohCcV4d6lVsBE506AfXS8l4DSp9tp7fWE7CS7hpKwfDXRgjbWeZopD+gCK0Pe2dJ04HO
         y6gDd21vFyGFC6UWjUMjMZfRPx2326mF6p+SUdKgx7OmzVNpJDZtYTNA3tHMOmbZuB/F
         1KadWOuOmAggfsd/yAGXCw+ID+qO6+IfffwNTwnE+JtFVUY3hzFClvb0X9Wft51fUzH8
         G8s3ct2ivyeokriF+Atx992RSDkOw9/vzIzcAUrRGLQdqj/UHRV82RpDrXu10hHLODlY
         gJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741163412; x=1741768212;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/pRZw5w+2U2qZZUcZUPyn53QbNuJsJLbWvkiinmtjsk=;
        b=Tmjy9CBD6Yj2Zt1e+TwokyxzimXpgFWPg7yhnA+pNQk1JRjD44wGZIvoZo2tcW66GF
         ja2ZDBMzn0AGg638DJDhQgdn6uz2U6rkizPuVb4lHjbEVNOcHdMPNxJ5wQ5Qq6C/WPKG
         bLeJukcijsiifTIoLU/Pj8ywlx19xeBJmV2xM96K0NAvnPlCmoPA3Q/iCRCaHs2Fcihl
         xRXyfENXLvmJlDwmlZbR6ElIeqc3ihiSEl5D1d481RmGotnqwyAC9Y/U8tDcWfy49J/o
         wv5yzF6YCURyJ/zvQoJIGGjZ8iINNWmNSbBuXLwxuCiGPR2umEZ56NKplVGmShtFpjke
         kn8w==
X-Forwarded-Encrypted: i=1; AJvYcCX5oBohdFeFZqesgCYqQSondoGGYrFhC7H/R95bxqGgr1qsosrmShu/GXBdquO6W42oTtwWVyOnNpKv30SwmFPS@lists.infradead.org
X-Gm-Message-State: AOJu0YxPnESE8iY8Dd2ynRaQQTimvbbdYzi9KQzEuetewepVYyc6+dH+
	7NB5rM9Ufn8t70ZFtX/JVU4X/1sOJza35tMoP6l7Byllo/S352fzbrFuXfIFYhw=
X-Gm-Gg: ASbGncvO256lSTdw72twS/JkMvlaQjZbIMHUs7EZOswfu6wZ/5kWZPbXKPAwEWILD8j
	Gc0oi9PoF4nScKapAP/89746Ll4m+mOQRTMi05MyKP4Ibbxy2FxUP33xo85bJNTprm30GaYuHvc
	VGdSBd+EF80bKqaLlD6+6iDRsWBVZEDepbQa1H2VzwZwtTwtqg/0/w2OWh1LoebBuvo4oQ/9eP4
	rjoIg8Ru492qH3JQ0cI28iL5x2GakUy8fH99Xs5MsVgDT+CHbQmisqtWJV/JLjU4A1JU0dDFoUS
	xjKDDxqNtG2JaOKNYO5klm3F84CXiZxyQXnCtdfk+bLCQSiGguGFsg==
X-Google-Smtp-Source: AGHT+IFSdzvWtn7tTFdb3Ley/k3biVDCTE4cufgwD5dIqDrEulteNMEUpYhuCzwhg513O9Qc/kl5+Q==
X-Received: by 2002:a5d:5986:0:b0:38f:4d20:4a0a with SMTP id ffacd0b85a97d-3911f756bb8mr1512469f8f.28.1741163411612;
        Wed, 05 Mar 2025 00:30:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7cdbsm20550527f8f.54.2025.03.05.00.30.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 00:30:11 -0800 (PST)
Message-ID: <1e33b374-0454-4d03-a673-75f36e6fabfc@tuxon.dev>
Date: Wed, 5 Mar 2025 10:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: microchip: sama7g5: add ADC hw trigger edge
 type
To: nayabbasha.sayed@microchip.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250304-sama7g5-hw-trigger-enable-v1-1-61b5618285f0@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250304-sama7g5-hw-trigger-enable-v1-1-61b5618285f0@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_003013_757350_99B76DDE 
X-CRM114-Status: UNSURE (   6.58  )
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



On 04.03.2025 08:15, Nayab Sayed via B4 Relay wrote:
> From: Nayab Sayed <nayabbasha.sayed@microchip.com>
> 
> Set ADC trigger edge type property as interrupt edge rising value.
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>

Applied to at91-dt, thanks!

