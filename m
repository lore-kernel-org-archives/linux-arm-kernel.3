Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E23DC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QGw3SeVFXYVYOzL+kW264JyMISWAAxmyJ1DyNg+uanw=; b=Nv/HGvC5oRpoHkjY9T5sKbGGuT
	r6o86DlXxn92op29VK4vGGECQKoyv5Yx8L76WSGFXElcRxixa0ekJhjRdA9Vh+Jc39GxBsFmGSZ9Z
	FnJvHMTiTE3R8kG5X+BEaXo1YKLahqUNJg5movtE1ffN/QQpjUIgYkW+4V7xaObS9PvFOqFgjeefC
	RzOk2hnCE3Rd18JxzqS2x2NBWCMZ6EHKLxktUUDQnVI53sRogILVDQo6srmRwKCl8OnXousTd23bk
	iNR3sU7hErdlVuSLEuHqDsPBBtTnADfe+pcKwu/ZRfD4vrwhR36CJfSP6+tPaOqFVhQK5ZJ234Lz/
	nQuxi9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfV2-0000000G7a8-1Jvi;
	Thu, 29 May 2025 15:48:56 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKfFz-0000000G4y7-0sH6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 15:33:24 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3f6aa4b3a7fso329004b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 08:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748532802; x=1749137602; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QGw3SeVFXYVYOzL+kW264JyMISWAAxmyJ1DyNg+uanw=;
        b=xMA0eQKc5PTsx8oLamdWDKiO6Io9IMS8JWHp+vKqEI1kwFATkOQ7HN3yoJFWl8vvFv
         +s1SUPyqYlNbb2Axfz1An31WDz6zOLZkI/aLUSNx9HwF1HccSQnYRhkD1Y4PKNRn2bpu
         qexXeCQE/RjbBsoX/r9cZgvzxnOjQiqTahD4nWs88dkI8/cUgSotRj5IIS3RvV+JIBI1
         xcT6bdtfDJjc75Hkh7GVxmP+f4Lss7eyB/k9w4S0tqE3Eo+Ggc2n1SJihpq38BAJ01mz
         ivgfv9v1Cp70RFvowfcVChcnodMODJ8zeV7e9IcllMuXs7PHe6dEe5na+tiGu0gxlNff
         Z8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748532802; x=1749137602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QGw3SeVFXYVYOzL+kW264JyMISWAAxmyJ1DyNg+uanw=;
        b=i6pqJTj+0qUl46FzftcLX5TGjV6XfrOdhQ4Ji4ianye7yozoVWmZDs/3HuaCGwGRY4
         noMEvDWaePbLmYggSZQ+l5JvzBEMpEl7no7r8vnT2oGdzEhIfiM3uzWM1huRxncG9a/5
         vRXKDiWo40eCafE8P/P7RDUj9WKnUnKWWRkMiHGLA650SJ3YN3wp9LuBCSzAiG7vbuor
         OF3gS8ULqWdVQC4IIkqV9RXBnEC6DQKjnM7esvkJf0h731BJCN/hh2B8X6zcDWS9c4u+
         MBzETDZtzi2uKbGZXBCedvwwkh+DJRDnuoYWem5JTaKEtZCAKbqwjcOjccEjmzjN1sGc
         91BQ==
X-Gm-Message-State: AOJu0YxoDwmsxDm8o+3DiadAmq995JNmTNgF9u03CXyM9BTYMv+J7eR6
	vQfst5pZcgl7dAuogX1AB0YNP/SlQYY5CE0JiGB8xvFAIv/msF7Zujol2cJhBSmZGb4=
X-Gm-Gg: ASbGnctg1s1AIWeJOMNGP0k9g0ONaCOLwLSO/C++UukD7pRJRfUoAwXvTg/hMnNJDvc
	dLxAisEgGI8vfdQwIMbLKcvglpCRd76cEhpCVhjpwoZLcAwNRq44A295MKmcbewyiR6OnCU78S+
	ZPbSSyLYCkyJcj++498754VFdjAdzBXxfmJvuEwzoMH3bS7fhOur70s0X58Wl/4c/Ara/baofEL
	r2Re/z59DNi5jF14sx4vVbhWCqhDWq8iL0he8BCqS2ogBjj1Hy/XkcSG60M5r8IWiuryL2idVCp
	QnrlK/6LhB+kRRP8bEieD4r0alrvgWcCukQZ22xvYKOaTR4rN6MGyefTMUH5CYgOkia94tIeC5F
	JzKMG1Sxb6TFLmXQTBdiq3JRYYQ==
X-Google-Smtp-Source: AGHT+IEHqt2TXipMpOtCWZM03ipD2V1JcC4i1LJeU/pC1caBAXKNxDTmzAlqmEjoL3VZqIFse+G3uA==
X-Received: by 2002:a54:4116:0:b0:3f6:6d8f:1365 with SMTP id 5614622812f47-4067073568fmr1203951b6e.3.1748532802067;
        Thu, 29 May 2025 08:33:22 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4? ([2600:8803:e7e4:1d00:928b:5d5c:6cd9:1a4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-735af9bc74csm277033a34.52.2025.05.29.08.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 08:33:21 -0700 (PDT)
Message-ID: <b45ea46b-3e17-4cb9-8e69-9eea0a3f8241@baylibre.com>
Date: Thu, 29 May 2025 10:33:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] counter: microchip-tcb-capture: Add DMA support for
 TC_RAB register reads
To: Dharma Balasubiramani <dharma.b@microchip.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 William Breathitt Gray <wbg@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250528-mchp-tcb-dma-v1-0-083a41fb7b51@microchip.com>
 <20250528-mchp-tcb-dma-v1-2-083a41fb7b51@microchip.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250528-mchp-tcb-dma-v1-2-083a41fb7b51@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_083323_252541_90929065 
X-CRM114-Status: GOOD (  12.12  )
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

On 5/28/25 1:13 AM, Dharma Balasubiramani wrote:
> Add optional DMA-based data transfer support to read the TC_RAB register,
> which provides the next unread captured value from either RA or RB. This
> improves performance and offloads CPU when mchp,use-dma-cap is enabled in
> the device tree.

It looks like this is using DMA to read a single register in the implementation
of a sysfs read. Do you have measurements to show the performance difference?
I find it hard to believe that this would actually make a significant difference
compared to the overhead of the read syscall to read the sysfs attribute.


