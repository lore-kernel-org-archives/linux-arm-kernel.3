Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BADC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=; b=BWuFCV6aAjQSYwmSQ8OC9zavno
	mg+aFna7rbjX5BpAsFZsZ1WIFJ18B+BjQqbISnBY9v6X1j/YXXdPGgsqkIowGfmj4ZYuZEX7P7Yfg
	2xLb5nhGqsSuuCtPdB551XDtJ2w3/w2W2r/QLyeIcjOXDjmzFuHWxQqu9idO84w/jsoyEAZRo1KpZ
	sBcho9SIV54xQOMfCbP+s0tkbNyuj3tDRb+UXPyQQwXrmxuM7sDt8y7F0WU8fXd5Wd33TkW80y9wB
	mMotplZZJaxyuycpj48X19w6QTEm6eckf4rmHpw49M4Qec4J74DMQtE5X/GVTWP9jd83lly0WZvEq
	Qr+6JRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7w02-0000000GMxO-1i2N;
	Sat, 19 Sep 2026 14:25:06 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7w00-0000000GMx5-1SwN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 14:25:05 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso12390925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 07:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1789827902; x=1790432702; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=SMui42hRlc29zCVbujqkibVAWdqsFqAzuX9zYwzhcUXX3tfIMxJFKtxS4tdHSlQPTz
         4C8vCFibm9zZnUQUMoPmPI9/xDNhpnjygFw2Ve1jdZIfgh0rzqIwE8hMRmvUI6cpaMTW
         ap7204K15DEzGq7QSpzg0Arp/0RAfnlsnQio4GXGoHSTWxHEgeE6qtOfE49AqpUTW3IZ
         9uCPdeRdSXFaajv8vIRfHRaOpK9zy7K5vHDVbQoIhHzONlCZDNK9cnhDhjqzUXLNJ472
         O3sji5GbFRAtfKgz/Yz0QFtHIsgdATgrKPTqSXq28hnk4+CHjdBc+TEHDHMLovp6JYW5
         FMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789827902; x=1790432702;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpdVAxuNOwmWu0WfirEONZSR+j3md2xsgnrcoSx6gSA=;
        b=eHpBSD2QIh7bdsXFhn8FFATU7/QLJK2A2Vm6kmxNe5gSOcjyMitaAa14EMwW08Bekq
         V3u6l0wpN/w9QYzbrhxm7PSTQj6WA+/AYYrVHOV5qIjQ1jIRLzobubSfReTVFWEH2ZjC
         zkCpMEND9l5fZNFfEV6wtXCktobyXR5FEb+nJa5T5fkTmvl8vlLuWyqLyP/pMoO5kL+G
         9YTP526K/ENi+un1CIYmeG5llCnXf9nvCH8qC2NqwK0WG8CsXvvG6Mp6Baxuak26pAd/
         s3msWtcdvNv9Wn+6MYMCpBC4VUjIyfkp8+Vv1uPLCB9/Y6wrdIc/NfQTxqa1nsN0SSim
         v5Mw==
X-Forwarded-Encrypted: i=1; AKwUvBxs+tNBCyyc3UL0RwgTRNoGk6yDMppM4qzqnnblHIKCIJ3bPP4El3K9hMn6o/MogAHMhz3BgR/XqcpYxRr0VmL7@lists.infradead.org
X-Gm-Message-State: AFuF++mTY5j3FTOXj7QgUFDH9ZnGDwtuAl4JH1fhRxX6fBTDRlp/8M3B
	ltre/U6EQPLpmjZrkvB3qx4EUCk9McJFg/odRAKeNnE/ay9VW8REyIkODaEeMhuYw94=
X-Gm-Gg: AYBFou387URlP9o9r8nHyNQLl8e5NbbpTKpGT5kQX1GhWORoPLNpLPHa8wkqgTeu369
	iqB7CV6qxyUSkKvWZrSQCkRKJpT1u/tQOKPQpKxcJtyojV4LgW/hZXtkyEn9ervngyUznBCyHNG
	CygrPktj3FvqVLw09O3fZ/mnZMuxg0i9j/k7dR8DRXNm2aMXb4cHfcDeJ47Oe2fCChEox29gK3Y
	pVxCt8Wrh+jJyj8Dgfa/UJb5VfXaiBsmnTcLbuK+73X96Chl83c3rklyvjguY0/8G8BIaqacN5v
	XiWtbzaISBVL545G6rhmsQYwrofihppUTAmpoQZ/worKaPZtODDgksuuRB9h1NTOEC0dgdvkviY
	u41VN0iDR4aUb/q26YGA6rQ6th/YoF1t80DsUKlIOIvMgUNptmke0iXHY5cW33+kFhWLgTLmEgx
	+WfpKMbRfB5Y+QblJLsHdOUVsZXm5iD/8yX3K3aC8HOpYZipCR3DgPovd4eaybDMtL44DocuBa8
	KmK/vbss8y0/uY5TVLv1l5lNeRHMkw/+zek3UL1gK7rnhVeO2Zdipc=
X-Received: by 2002:a05:600c:1d29:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-49fc572b7afmr84151565e9.22.1789827902455;
        Sat, 19 Sep 2026 07:25:02 -0700 (PDT)
Received: from ?IPV6:2a02:2f05:1204:e000:2cf7:c250:64a9:ae77? ([2a02:2f05:1204:e000:2cf7:c250:64a9:ae77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm106948995e9.15.2026.09.19.07.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 07:25:01 -0700 (PDT)
Message-ID: <111e4f31-1c2b-4e7b-ab8b-534544d2ae22@tuxon.dev>
Date: Sat, 19 Sep 2026 17:24:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
To: Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Russell King <linux@armlinux.org.uk>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Manikandan Muralidharan <manikandan.m@microchip.com>
References: <20260828-cpitchen-mainline_gfx2d-v8-0-378374559738@microchip.com>
 <20260828-cpitchen-mainline_gfx2d-v8-3-378374559738@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260828-cpitchen-mainline_gfx2d-v8-3-378374559738@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_072504_399736_3805E987 
X-CRM114-Status: UNSURE (   8.32  )
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



On 8/28/26 18:52, Cyrille Pitchen wrote:
> Add support for the GFX2D GPU.
> 
> Reviewed-by: Manikandan Muralidharan<manikandan.m@microchip.com>
> Signed-off-by: Cyrille Pitchen<cyrille.pitchen@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

