Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2DEFEE4EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8ilFU5WuG18swnOUDhw7CL76xSB1EetAmw090m1DI4=; b=EKD/oDz5HnEfYqhDCDG0PQR3JQ
	diCfe5sAmiXeuWXj8viCAPgalpck0FbcnEdApLEV1K1VxfA53t/JeEp5+mwCdHrt2T8NtqVOkrMk4
	TslRyCs36qcJPx+dIbKZGpxSJ6OdR/N1B6b5vw2bE0b5jS1lyYg71xjs9CopXt+k2cSknqDf+Q7ON
	AWsQagyWzDE9ULaz+LATta2nRjVs55hBf0AHDhviXz51OsdtCAU17/GNwtoj/QGuaCud1zTnSMNMT
	S+ZvzN12XiXrRhk+HueS7aG2wyksTBkQ07xI4hGQ1HAKZx5T0k+4VMGO9nc0MgKNeR7+vRaj6oyrt
	D3mm/yDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKsY-00000009tZF-20yi;
	Sat, 28 Feb 2026 14:01:10 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwKsV-00000009tYG-1FRU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 14:01:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-48375f10628so19698095e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 06:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772287265; x=1772892065; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z8ilFU5WuG18swnOUDhw7CL76xSB1EetAmw090m1DI4=;
        b=B8yrpWxhI4eDcGv4pSifyEA/Ps+uWKdagJV1v7L9An1Jzg/TbsN0vBDdcj7zdPBb58
         pPcP+E4+l/NOF4ktGsFIE2uZIxWuepKVH7QKRX6julMH+Af27JfY0uqtH9LXzt2tQgkZ
         uwguc0keU/5TjDDt6ga1TGTFoEpQf0mhEu4pdAYd0tLMpPK/J6gqgmX7C3WpnrYkhyoo
         D3M2gg250ihlf76VYPfUqUdnG9Ql16itPE2Twcm6+UcMeAcpaZMHMFUcDh/qkZgv9cw7
         9IszrkwDEgy2wE3cvRjq56ATroKWE6kPDD6ugO/Ke1nS534esqmEFdKMF1g7kRD2kIj/
         3J2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772287265; x=1772892065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z8ilFU5WuG18swnOUDhw7CL76xSB1EetAmw090m1DI4=;
        b=XF+TKyAggVWNBPwUDV6dICSanmCd3mxMIXRlXLsRsiBPLSLEv2mA47Zgb4qSFNqsXv
         vnlxIerJALeQKEgvG5ma7Wga8IRzhcFGs2gxmADhdC75vwmxAu0rmsXm/mSyNqHF2zzC
         uN5uLDGZJXTy0kFTGQva2cpx+duEdTSc1Npsw1BsLo5V8g+d86NtCwor0wXKt8dikRn4
         uahs7pdH4stWwR/WcIrtCD+03EkmURTASTNjKzXKqlfi+TpJO4Mnmp2X64ifoRP0RxQR
         JORPACMU99fuFTweY0CKwqs6swIVFxa6G81UP7UuKh8OgedZBueh0o/d+DQoC9y3qBXN
         jzWA==
X-Forwarded-Encrypted: i=1; AJvYcCUl3gTs2Tn+NnyN7lr6hs1mwSp8eWGmZkoh9qBZGYOD35f4j6gW/nxVNfp5DD1r2KIC9qJ+DjGNPO+nMkCZBHg0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7k+BZrFOiKQQB3OEfz1QiaS4SL7lkpFS3GGwxSgjXKeVoUlD2
	BHD4TtUMtRK9iG5KZ+sB5AAkmArs85YPwBcUr13b2Guy2NCvRNjVc48cinstlacgxMM=
X-Gm-Gg: ATEYQzzGhVUAO+1M6xKAf3fmxoQnbSD035TnZnzJvDJJw3vV7YioqzbsenDLRHiC85r
	MYlk8fbvcFFfWd+XZPE1EJev95lt43s0j0cDdu0shfkvbQZhLAd7yeSe+LrkY6dyJw9QRJ0yDmS
	Qi9Au56P499rZqzWV1dHljLSP5X/phU1c9rY+QmMGvV1upuCwoQuPTtG3TfUCK0NYAqEGM1FP6w
	5maQNl6s+ive5FR+4hZzZDC+/hFrbVtM1u0+N9nKIGmytd5uYT68Sv1vDaUQpe1hB5Okcz79X8A
	ZGG6pun40QPsRftmJcCxmKXmog5s1nYNGQ79vCdIfABWwMLDDHi099Fu973gnQ6EDXf9nXUuDpw
	SQKad6iCs44SYTiS6uQszN9xlqiFDM4iKuHna03VblujZG9waC9iY+xjGQRZqYh72ttHXkOoXok
	0sq+Fk4DtY1bFGWXN5y04sNeksoWcNnw==
X-Received: by 2002:a05:600c:83c8:b0:47f:f952:d207 with SMTP id 5b1f17b1804b1-483c9bde71amr115364265e9.19.1772287264671;
        Sat, 28 Feb 2026 06:01:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm310079535e9.9.2026.02.28.06.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Feb 2026 06:01:04 -0800 (PST)
Message-ID: <b76b271d-5249-4e84-b10c-f9b364b08b3a@tuxon.dev>
Date: Sat, 28 Feb 2026 16:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ARM: dts: microchip: sama7d65: add LVDS controller
To: Manikandan Muralidharan <manikandan.m@microchip.com>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 linux@armlinux.org.uk, ebiggers@google.com, martin.petersen@oracle.com,
 ardb@kernel.org, tytso@mit.edu, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Ryan Wanner <Ryan.Wanner@microchip.com>
References: <20260225085430.480052-1-manikandan.m@microchip.com>
 <20260225085430.480052-4-manikandan.m@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260225085430.480052-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_060107_346786_1FF3679D 
X-CRM114-Status: UNSURE (   6.12  )
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



On 2/25/26 10:54, Manikandan Muralidharan wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add support for LVDS controller node
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>


