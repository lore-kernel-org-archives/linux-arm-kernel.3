Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5A7C5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=; b=SDnj1LMp37wADKyueGqlS7Vnpm
	D+ogxqlfy5Hjz8DxnRgXirOqA6D1ba4ZDmXaAo3GNBrTNOzunm4RoP36T6lhS0EGgW4g8d6Vwxv6/
	bJSIuqAfPYFcTylakMCiL/oy8d+D17vviKTj9mg06mwZx80pI58sTWzC3Ij1PN6ShuoNpgufZ0w2s
	ARkCHX4l6Dzpy9skusEqDwFXrbXUNMgcdB9l1geiCmf8Drwef1i4ERy0WE66VP8wfXO9XFOatkv2W
	gDgEpJmKtZdSXUxOnMCI2GApRyCDUdLaiJqVKXx18O7bPsn/9IT/w0qOeG5AfQtzcL6nWhtW3XXRq
	jqE+ZHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoIl-0000000Civt-2MFX;
	Fri, 31 Jul 2026 14:33:31 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoIi-0000000Ciu8-0YUq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:33:29 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso1109144e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508406; x=1786113206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=;
        b=avH/Gj0nnXgs0Y0bP/dYMTG+aVQ+hyUuIZDYInNGxUUQYhaUCvXivNzCxWA6HwQCjn
         5jKYD/YKBPOuAsc2KHAhRbP8peEk9fDAr96TpAAyT2hbN6/WWGVG068860CCyUv4a0ju
         uqU8p+0I5xahPl8UwoNH8hs6V5dUib3LwKDWNqG56Pil/tlY125DDIxiLqxsqJyBHmWl
         JSVnFg5xg0TyCyUeZVUHOOqMSbbNy1FWiqo3SoFOZJqKjg7cZY/Qzp/4bGETPfnxyZ7Q
         ulp0R8gLt6RyYodRSZ9FyFSZ1XOZSnsECT4P6Bx/kptaRggmaOXlfuO4GTHck5QXam/s
         KDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508406; x=1786113206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=;
        b=HOKQLThD9YV15ZPC15rS5splzqE7taXS47YZfuJZWrcIbwNClGg6z99t5GKlMswdkV
         kJM03eNUTG2t8WHImm3gXXfLPtiS3ZkyyIMW/zGgTKqndffMFm7hoa4rXERukgV6le19
         OzK/bRFi4ewDcna/CJCQlXsIjAd/h+l2ZnrG9FIkEAjV29iR8GoWO1jfQuBu9tGtYtf6
         eXq7xzYk754Mh4/IWtkNIsiSIoVh0nlwfKRVDF2R08B7skrAkuaJWTUHVXzfLd0Bmkv/
         Uf6uqho936RjMrzJN9dFynmXaXDQ1L1lmuJfuVi5Ko/hVxwnXhHF5smwch/OZ1eUoe9f
         9Daw==
X-Forwarded-Encrypted: i=1; AHgh+RqZX8+SuoNN08Tlv2U9DD1bDCimZPov3dTTX/uAV7wVpHnIZTGMfFjxTSwcs9jHlPACsxsHCQb8kjn00PTKEt1Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyzKWM65AFRAwVOG39eb43a5IvzE3DmmvMDYsQjlKilijuMYI1L
	4j+ucCzfYFXFzfiP71s0NtvRWwFBoGz71tuBaCMiFcDc6MT1HZhNoI8X
X-Gm-Gg: AR+sD13WYS2C9RTPleEuAk07UH4X+34v5tAiOncBRwqFpk4mjcux1H59/vAcdtl7GMS
	d0pjwlsp+64+jwaPIvPT3x7MgPqxNG9uxPOq1OlNzQ4GTtFHB2a++K6AF1kbOOm8rkaCH/gG51y
	/3TejSqMhUvhDt1k7f7oK4w3UAyhC2EqW3abkRZPBh3Ar7BeHdWK1xCQCTbd5ZaJIbtQV58wE5n
	vqjj15tXUm3z3J8OmgnfYiKl4hq4zz28Wno/QY0Qit1tjvWgFcoFgS79CV2+MeW0rGq1Ewk7nox
	yXTWm3H212tmnWuMaXoOKJkJNsXB0VUPYvoFLhPZ1eaQkumx6oOSqsrDfzhh8DgKV7/Z6LuekXv
	D1lB1GTWNzgS+df6Sf8s3SRrcgQbpMA/VGfrmpaBWR+yReHinzhiasBM3sRgImWHMXSgHoFqnzW
	iFe9oRD0xZHDVSgHi4msnUMDDtgOvMKiA0s2GJX/cyWhEBlra7KOO6z+JaB4nLTuBre7ORRbqA
X-Received: by 2002:a05:6512:3d0f:b0:5b0:17e7:67cb with SMTP id 2adb3069b0e04-5b2e1fc6317mr582376e87.17.1785508405470;
        Fri, 31 Jul 2026 07:33:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23c556asm341380e87.9.2026.07.31.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:33:24 -0700 (PDT)
Message-ID: <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Date: Fri, 31 Jul 2026 16:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-12-wenst@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20260721065413.2306137-12-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073328_194432_A48E2121 
X-CRM114-Status: GOOD (  11.14  )
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

On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
> 
> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
> and USB 3.x Super Speed (SS). The block can also be synthesized with
> either HS-only capability or HS+SS capability. The SSUSB controller
> handles the device or gadget mode. Saying that SSUSB handles the HS
> portion is wrong.

[...]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Super Speed (SS) data bus if SS-capable;
> +          otherwise High Speed (HS) data bus.
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: High Speed (HS) data bus if controller is SS-capable.

FWIW this is opposite vs what the (most common) DWC3 schema defines:


(also true for mediatek,mtu3 and renesas,usb3-peri)

-- Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
  ports:
    $ref: /schemas/graph.yaml#/properties/ports
    description:
      Those ports should be used with any connector to the data bus of this
      controller using the OF graph bindings specified if the "usb-role-switch"
      property is used.

    properties:
      port@0:
        $ref: /schemas/graph.yaml#/properties/port
        description: High Speed (HS) data bus.

      port@1:
        $ref: /schemas/graph.yaml#/properties/port
        description: Super Speed (SS) data bus.

Konrad

