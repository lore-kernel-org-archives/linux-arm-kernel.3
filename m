Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1777BC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EgCjCwSAoWT6dP7WChm7aBhbHSl4JFbz/gKARLGAAw=; b=r04I2kmwwzxK9CXMZolhxp1OTu
	YgOzQGiwTMnGBwaZ/fPOSBjwKqPIsOb0mnuzGYWkGg8CVOI0dwLPeV5xua+Ul1td2rZKJoiMc+O+x
	9m0hyasTIF3azImuGtr8Ilw9PRx24p8Okyn9asoxpra4iOp4LI3ms/F3DqoE0lLZJTY2QJzTfHbcf
	32z1J7gkWTOmdaCFgUi6jR0omgJP4JeoZ0FZek+2HCaf07Cur1T2XIG4tWM85mDUdUr8/eTMuQ9pF
	SicctAUabtH5nb6PXTwbdAHHarHy1NogBFs4D5jn5qRaCnj2ylVNe97IKB4Ow5bD219d8O6Li5WmA
	y0WrPzdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0tq-00000000qVo-0Hec;
	Wed, 30 Jul 2025 07:06:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0rK-00000000qFb-0PaQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753859055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=7EgCjCwSAoWT6dP7WChm7aBhbHSl4JFbz/gKARLGAAw=;
	b=L/Cur1HLUyuNCJBLZxlQ7ESkjg4aP/+7JSIcDcN5s+YYb+DWFqkQF2cGXU3cEuD7QeSo4S
	0h4HQzWjozTIwkAkR1eTDqM+Vc/XPl8p5abWL+vmOTtBjtZOS7BLwpCaLXFVi0EEB4Kzsc
	9Cop54nMf4iNvhLZUfYIellQF0n3OQM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-dO59ZyJBPLSJrMp_ETmwTA-1; Wed, 30 Jul 2025 03:04:14 -0400
X-MC-Unique: dO59ZyJBPLSJrMp_ETmwTA-1
X-Mimecast-MFC-AGG-ID: dO59ZyJBPLSJrMp_ETmwTA_1753859053
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4f7f1b932so3756452f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 00:04:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753859053; x=1754463853;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7EgCjCwSAoWT6dP7WChm7aBhbHSl4JFbz/gKARLGAAw=;
        b=HV+ZFJHJLPoi1Rr3SMYGV1q/hN3l+DTka+7e49hAPCb32OYHP7M4uRoXcDFlnsmFmY
         uL4iSCz1FrDeNQoZ3pOoJakoG4/ZmgtWHLSAb8AS/O3RvVWy4GjldIGw+6Skb060jpnM
         gkH8YYIH0kkxGj8YPmsLDttmPnL4zuTZ+CXGPd4z9DWseLWNMkVJKQFiUrWXp+6V6gt+
         HfTJ3wiyH/IWNTssaJMBNfjsC2xkY/0jy3TOb42AK+N0Sx/vzgjXYw3RznnUUwFVLYSV
         MerZqIT61jpTNS0pXaLyIxFYGLZUtSIiPPGTrrxHMliOyo7PbmeozByQR2a3DXWJtvsV
         Pifw==
X-Gm-Message-State: AOJu0YzKfe4hT5+ha1hD6XVaaycw0rQu8TQwhr+1NUgo2RLk4jRr9ndB
	WUGg8XXJy5VeHvsdrIbslJlD96sHgW2iKZIj7Vo3Ow546Ob6JXTSoF0T6lx3RHZXkQ62jWwo3ga
	up8AvUgAMxkJjMEH3+pQufCaSmBQ9bu1fIne28AsfEtpAcHSBMos/fMkyl83tsbZyuyygSwvgqq
	2A8cQFktOna2efKX16HSWT3HsHKV+yJabeOVFKUxeKOu9Rfo18h7jMrl2D
X-Gm-Gg: ASbGncuoCqbWLHp/tW/zwUn5v/gp1DixtNDnPidVjzaBD1Afu3fFinQQDVxDcoXQuR2
	ZteV15TL4VVNSalq5D1wNmQPEpiiijcjWSOw0JS6Sz5Sn7vOqa4Mt9tg3iyDR4KfOgSOVImbpN3
	v1gn+LKOBtk5RgZvzRytyGzNdp0Vu3d46fjw6Si7XwpG+CvIFkrf4JXmsLpuzNRvYnQqZG1DSGZ
	43tVEjshDb0PX/syzDFaprdAm9J0Xd21ggiAnZb5+8s7gUSoUvTFSmJfXn296HYU3nf0bjy7p+u
	a8lGlS7+LEXB+e+KDXWhPE3dA++cX1fWaLMWFwDSLtQI4NhxEhjWjRckls/EoX5OXf3By9FeKKL
	KwS0=
X-Received: by 2002:a05:6000:178c:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b794ffdafbmr1455259f8f.37.1753859053179;
        Wed, 30 Jul 2025 00:04:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNUbYGDL0unBoGUvLAcwoshm16lk2z/rlSxU4KYNEG/RVgWXaLcOgnhaU/dRAgxynEmknJng==
X-Received: by 2002:a05:6000:178c:b0:3a3:7baf:f06a with SMTP id ffacd0b85a97d-3b794ffdafbmr1455181f8f.37.1753859052432;
        Wed, 30 Jul 2025 00:04:12 -0700 (PDT)
Received: from [192.168.0.6] (ltea-047-064-115-093.pools.arcor-ip.net. [47.64.115.93])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b78f5edsm7115817f8f.28.2025.07.30.00.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 00:04:11 -0700 (PDT)
Message-ID: <532f5e18-8613-454c-8497-8c224360ebbf@redhat.com>
Date: Wed, 30 Jul 2025 09:04:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] arm: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 uapi headers
From: Thomas Huth <thuth@redhat.com>
To: linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-samsung-soc@vger.kernel.org,
 imx@lists.linux.dev, linux-omap@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20250703173859.246664-1-thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250703173859.246664-1-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fEWoWq0fkPdU-57yvtEyZ_8EGnHDrdeFmgLMYXMQVes_1753859053
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_000418_218292_18B43C04 
X-CRM114-Status: GOOD (  16.70  )
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

On 03/07/2025 19.38, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembler and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembly code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
> 
>   https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
>   https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
>   https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
>   https://github.com/riscv-software-src/opensbi/issues/199
> 
> To avoid confusion in the future, it would make sense to standardize
> on the macro that gets defined by the compiler, so this patch series
> changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.
> 
> I split the patches per architecture to ease the review, and I also
> split the uapi headers from the normal ones in case we decide that
> uapi needs to be treated differently from the normal headers here.

Friendly ping! The patches should still apply cleanly, I think.

  Thomas



