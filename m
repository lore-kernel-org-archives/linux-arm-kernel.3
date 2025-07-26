Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977A2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jul 2025 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNa3qU18en9WzZnFesAoBlTJYBP5hk4MnfgIv/faVHU=; b=379LRlZQxdSv4tA//qW0mP+eB5
	o4o/OjZ0i2ctHAmSrqZJ2BdJwX7rBE2DwNdlwM6zxsfGnOnhAFjbB1Qr/mWvLL9bl54NWYxWnN1dN
	zlpx07K8MjJCFDOeN4hM6oBnCUaOFiNKiRyQFPX3OWPZ3xCF1UVyRv9PN2nr5wtGrMgg/zyjASbwx
	G+wAoyIfsg1o74zgjI7hi7K/bstosMUoztQAYzOFgm5nmGWHrhLpsRUgd8AjLmHCJB32mqydpQAy3
	UCBe5hWMAZL2jMvYAgNd84f+Bx+Ojei3An3G7uaf5P2TrjLinj6Jpwv6LC5Wi3yLi722feSuph38r
	Gk19NKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufcmb-0000000BOHU-3fYQ;
	Sat, 26 Jul 2025 11:09:41 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufckA-0000000BO9b-3x1g;
	Sat, 26 Jul 2025 11:07:12 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a51481a598so1517632f8f.3;
        Sat, 26 Jul 2025 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753528029; x=1754132829; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pNa3qU18en9WzZnFesAoBlTJYBP5hk4MnfgIv/faVHU=;
        b=EMLvQaRlG1mkh/O1D62MelUqNMGRbt5CVgq/swocYabHhi9NKl/NQb9VhRwsubbXm6
         MOx9aKd9qfKgZBF08McdO7abLCiGVvFkakAYWKFE6Zx54CrlT9K9bjax7IzxXa2iSSeS
         C1rwe8RUf4KZ1WpIByjILZOYLAIJUHDlg+u28ymt2iO3WBwneu+8WAcfygbSy71H6XbN
         b+TJXECicMmgdE8ViKaj8Y+sHsTEkzD2FpuTMmpD++8xx9i37ygTuvEbR++6v346Tr9H
         acClto00iZSrRtpHtvFvOKMzJCs66qZMPY8eAtelT96zZFRUCOpWzafNoNMDgJcagVjs
         FmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753528029; x=1754132829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pNa3qU18en9WzZnFesAoBlTJYBP5hk4MnfgIv/faVHU=;
        b=Xzfj4XAltx/SOw2rbHgNqbpJl4Smr+xnvjWMjP9QG1uoDsrx5jlFL0CTrHqIG+OcO4
         GJh8asiwOLK5xHO01ZjzB9+dXMXWbY6IMkHy4sr8GOYyHMxAeWfrSyfd7/cWEdEkNIAU
         l3Ewjy+VYLEbQPj9fPI8ZjYRu51d3fQoJ5dD84BomqN7RwW8ciFGxfVK/6rj/tKhIPRS
         QTBXK3r/8ocyNBt245H4TsYrmLGm5cBqo9WAGAr63U/jOmNwyAwFCBVLfmDurw7YyytN
         k/9/XMyc2NXXUt3Z6lOLgKFM6VoC1X3Qpv3ZYOh0WaqCYNWsMRENrJClyzUsSrYTkeVD
         WcZw==
X-Forwarded-Encrypted: i=1; AJvYcCUXctJg+uxGm6UCjxfV4aJ2+xf+eEvaXJKph4RYwqBEJlyFWE8qVNWkh2WwWO7ANdyFVfveOjRfFxXGIYED9rmj@lists.infradead.org, AJvYcCVJdWjuUEKC+x0Ll3qFIfUpTmEoLlU45OYDV7NmOwZ2KhS0UuF2ADTUXCUABBhVUd9ebejW7XwGH2AFxbk1pdQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwNKL+WS3k/16XtD+ZF3LnLUxkZupVCRQuIbOfFldnd7F6mfG8t
	I/yriG2wlRY9OR9Hl8uy48Zruu+Ob0EIvOPYUc/kYbvA8v0MK95HuVSkwSuM
X-Gm-Gg: ASbGnctSLVYHEYYSauxU8Y40np+RRan6PENh7RRpKdFimBbEUYG9r1TsIQUrHfpV2qP
	Mc/7Nl28nmAEHqErmIdp8mu5LGKiq32USI3K/Ewl65kv6WGMxw417/ePOgLNhuCIrnKHwKc57uT
	n/4Ay8rhGS5/fgiDB6rqRcr8wBpUJOCK4gMPwRqCB+9+R3Z0GO1QviUxX21rKGeWUG8YR9zgIPy
	2p7gp8cYtUkXVDbYdD2PKjgHXSmYeqy77ykrU0IhZwWuvQEs/uDPjEtsD/8nLp/g/qqllO2tGPS
	MJQtVN33vFZXw++NxnJ+B6U1gQUGyQdxZCWn0wiuRAqArkjA3iwOphg7Xe2jiTybxIgAHLlmNgJ
	VUUVqf8tnh/pPQCHJwiKJJ+aPIDjEyR2SJK4pnps96E/intUygCeM8vnxf6vOdgQnGqNU
X-Google-Smtp-Source: AGHT+IErIrHwPR1r+j+7XXM0CCTaccjvC5i4ORfw15B6NsxaP8RzwsKAVSUb6nuEIQdtcDZU3WEVog==
X-Received: by 2002:a05:6000:40df:b0:3a5:3a03:79c1 with SMTP id ffacd0b85a97d-3b776676d43mr4216161f8f.48.1753528028455;
        Sat, 26 Jul 2025 04:07:08 -0700 (PDT)
Received: from ?IPV6:2a02:810b:f13:8500:7a8a:e7b9:25b7:a4f6? ([2a02:810b:f13:8500:7a8a:e7b9:25b7:a4f6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778f03436sm2513217f8f.51.2025.07.26.04.07.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Jul 2025 04:07:08 -0700 (PDT)
Message-ID: <6f62d1a8-0e5b-4e66-bbe2-53a355df3c1e@gmail.com>
Date: Sat, 26 Jul 2025 13:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] arm64: dts: rockchip: Add ROCK 2A/2F, Sige1 and
 NanoPi Zero2
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: devicetree@vger.kernel.org, heiko@sntech.de, jonas@kwiboo.se,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, ziyao@disroot.org
References: <6d93c92d-2bba-4247-960d-5f2e5e12b594@gmail.com>
 <20250723134019.1076352-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Alex Bee <knaerzche@gmail.com>
In-Reply-To: <20250723134019.1076352-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_040710_981862_5928E519 
X-CRM114-Status: GOOD (  18.16  )
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


> Hi,
>
>> Nope.
>>
>> Are you really questioning my picture? Ridiculous ... see [0]
> No, I mean some boards of this model have SoC silkscreen RK3528 and
> others have RK3528A. The same is true for another Hinlink H28K SBC.
>
>> I'm sort of impressed on with which conviction you continue to claim
>> plain wrong things: [1], [2], [3].
> If you spend a few minutes running mainline u-boot or BSP kernel
> on your RK3528 board before blaming me:
I can't see the point here: I don't think it matters wether you or I
actually have this version on any of our boards. It exists: you may like it
or not.

This picture was actually a reply to your claim "... so we have never seen
the silk screen printed with RK3528 ... "  in your mail dated 2025/07/19.

Initially my only question was, why we don't use "rockchip,rk3528a" as
compatible when working on boards where the silkscreens says exactly that.
It was obviously copied from vendor and now it's "too late", "too
complicated" or something, idk and I'm fine with it.
> BL31:
> INFO:    rk_otp_init finish!
> INFO:    RK3528 SoC (0x101)
>
> mainline u-boot:
> ------
> U-Boot 2025.07-...
>
> Model: Generic RK3528
> SoC:   RK3528A
> ------
>
> BSP kernel:
> [    0.768514] rockchip-cpuinfo cpuinfo: SoC            : 35281000
> [    0.768990] rockchip-cpuinfo cpuinfo: Serial         : ...
>
>> I'm fine if upstream decides not to care. But it is and remains wrong
>> to claim that the other version does not exist
> Unless Rockchip says they fused the wrong OTP during production.
> Regardless of the SoC silkscreen, the chip type on OTP is the same,
> so how does Rockchip distinguish these chips?
Please read the rest of my previous reply where I sent code locations 
where and how they do.
>
> --
> 2.25.1
>
>

