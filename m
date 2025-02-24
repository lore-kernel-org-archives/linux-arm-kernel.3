Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F24C5C021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+7myiS5YDjg48/Ag8fwVJzAPYwjPP2oihtGPggfyt3U=; b=4Yp4mPEQZFAWdnQBPjOrKy0JTQ
	n1Sz71vEN2PgR8tOkcgRuBNeUF+r3dK3V11ppCHwfE8uNIYe3RNqkVTJtQWYyLvkD7zT7/7wqiuIP
	eOwZxmMg8jRmrb1qu7plqQsWKxDPrkPApjnE1A/ceoIu5SKyvVfLxo8jF/RoUNtqn4WdKhQpg//N5
	qqPQ/1lw0wteWjcxWd3Z82dGLONvsH//X3QdJzWZt4jdEdeNMZoIQ/1UcQwm0jd9gRAbocpYrC6At
	pCjzwD+bn+Sh1o9RfHE+0SGsymVN1amGWRC+CDwxVeVf1LJhYEV62gNG2lY693MlvCB3GLzU1KWE6
	c/igOv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZll-0000000EAbz-1gwD;
	Mon, 24 Feb 2025 14:49:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZRo-0000000E64B-0ldo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:28:42 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38f265c6cb0so2168128f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 06:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740407318; x=1741012118; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7myiS5YDjg48/Ag8fwVJzAPYwjPP2oihtGPggfyt3U=;
        b=J5VQQKhtRC/felsB8meQV5HBJuHHbg3FYIl9X4AgXN4YbSPsGh6s6pQSuk4LY0N5kz
         lcsyQb64AqCoESxztpdoDoPbTI9mPC3odLTKxLh5NSicnb7dEDHUXxKEH+nstmbFZ9Ld
         xAB9pywJ41U5hA9CoQku9jH2HGBBqBfkVM/eFw0Fw3qML5dEY1NXFIpmYJMX73TaJQ4g
         C/NmansEzsCVwiC4+HzfSe837N4zb2bD2wLlSn6bNr3ZxolVPepHVXNRz2afJiWSnkFp
         IrwplCK/uEMnT+phZXnV2moP97YkmuvfrLI5tjmONz8lXk4gTmSjwiBHhyo+fCJn95P9
         hPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407318; x=1741012118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7myiS5YDjg48/Ag8fwVJzAPYwjPP2oihtGPggfyt3U=;
        b=G24TES3gnP17trsZRlX8WBun5zvCNoA6WdfXCYPFHfbgtgNAQYcga7+6tPuMTboJWD
         oJcK1u6iRA9UB87T1i6ssHQAbL3L3NIwY9Ko+lKwRvF3ccBOx/E41wKjGfvuqFcLBV+g
         kD1lvWU1LpwEShoNr6pB2x6DWaD285r8LTf6lVVudHKGafCOEMVutzp/XE8Vr4dIQ0fP
         BIGOW6yhV97Y9y+Y1/09fHqj9/Y5RoNNTxpxMh3FS8ZQMc6QUdYo+nhGZdYzF964qZE6
         fWg7NzircL9dxmqNgKRDu3w4T/WYce7V0ZaOYFLI6noImU9yKuHq8f59qJabFv5JvdTQ
         slhg==
X-Forwarded-Encrypted: i=1; AJvYcCUlc0ucm8KSsSRsav071sxRGy3l7ewhKR7ciPxwKkcCMIR5GYSVltPrTpYQ+zE3xS6NbX60hbXnJVzzWyApDwth@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8UzQedi0fdergg5X2NMwa+inPoBXpRnBuW68nPmB4tg17yIpa
	RnabLhGynsQ5t+61iMlJKSpGhGPTta51ntXaioCeN1d3J57++IcQKMGk6xM7PlI=
X-Gm-Gg: ASbGncsXfr89ILHwXGOFfBaUU/j4gh2woqCfqdzKx/E1IDqceE53cpXwH2G5Jet/vRY
	7BSoxQO4yCBqipDzhucMyQ3CQNBl53mrVrUyftyQ8qhAtXQOGNCaxf+TTUqJJJ6BZcWNqUaQABO
	MvRfkWIwA9H0JhOcToUMqBihtS0MXn3gIg1KtvV63opnLbzpQOCvtMNBwEFLv8E+8VQvNTyWDWr
	EpiJ7oZwca1mRcWN0jfIceHvipGK9MHrw84DEumWkLG6ApcQ1NfmzROd7WvojUzgV1AVxkMMMFX
	XzNPkJBdK1w4kc+CqxME6JmVp0Ax2M2xpxS3lABxPbpBQTRA3UdSPuoK9oZSU5T+Yk8BU2VwwA=
	=
X-Google-Smtp-Source: AGHT+IFgTjY0B9Q+EBdWo53fKYf0MGWnVrcQoJfE4mJdhQbgBfmM6+4xRs286ajDlhlvB8MLPAk/3g==
X-Received: by 2002:a05:6000:4014:b0:38f:28a1:501e with SMTP id ffacd0b85a97d-38f70772b46mr10667747f8f.8.1740407317886;
        Mon, 24 Feb 2025 06:28:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123? ([2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d9be9sm32217076f8f.79.2025.02.24.06.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:28:37 -0800 (PST)
Message-ID: <43d23c40-09bd-46ca-840f-4724a42946a6@baylibre.com>
Date: Mon, 24 Feb 2025 15:28:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 ChiYuan Huang <cy_huang@richtek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Yow-Shin Liou <yow-shin.liou@mediatek.com>,
 Simon Sun <simon.sun@yunjingtech.com>
References: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_062840_230194_C1716A8F 
X-CRM114-Status: UNSURE (   9.47  )
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

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 24/02/2025 12:49, Macpaul Lin wrote:
> From: Fabien Parent<fparent@baylibre.com>
> 
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, MUX IT5205 and related
> settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SS (SuperSpeed) and HS (HighSpeed) USB.
> 
> Update pinctrl configurations for U3 P0 VBus default pins and set dr_mode
> to "otg" for OTG (On-The-Go) mode operation.
> 
> Add ITE IT5205 (TYPEC MUX) under I2C2 bus and configure its properties;
> also add references and configurations to 'typec-mux' node.

-- 
Regards,
Alexandre

