Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DA4C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTEPlivf57KNf0u9yF+nL78ShRAOQbbl1KlRhOM3FSk=; b=exq3QbSKLJ0ihBCF7VNiAl7fzr
	XDPvkyDYUNyWGh1wXQAdsd7m62Ps8L685ndmydR4NL3wqFisSFpvVgviHY/aUgsR0AMtNhWAWmaVJ
	1OX8wpOOLJBpEK//Xph60TmBSJeX/jFwUKaHLv5avJJIpgOyfpjz8OUaugya8MhoWOqfJLz12arnx
	Edy7Y2t9vbyMc0UTWXo9lCxINuWS3GCBxHavYlWYC8lt4r9WqKSpJqLeLoxISbcCLDTPzKY6CgEEc
	jppiZq8WpHKYhNLYPJjAHzkvXcX+zcYgmr607BNfS7A041KLHKaaLR5oDexX4rHICMKSFPRd6t3IR
	Mr+V5quw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptxY-00000008zaT-0Q7h;
	Wed, 05 Mar 2025 18:59:12 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptsj-00000008ylY-49QC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:54:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-390ec449556so6200243f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200852; x=1741805652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTEPlivf57KNf0u9yF+nL78ShRAOQbbl1KlRhOM3FSk=;
        b=ElVLOxe+DLmKhyJtORWczBIM/OjlW8DAvF7qTkCPdYVJza6WRFmqf/IqO/++uY8WTZ
         thbCVXc2rwZ9HYoQJG8lPoZj5dK6VGXnr8lwcfflSGLuBlIftGm67/2Bf1T5k7ufJncp
         od1jvS7AGFeUolrcwGeijJ9vffVLYqmdMigvzBAaFk/7eMMGDH2ALZ+63QwExnSVCOh+
         M4H5elNwxrqo3hAmJS8MxclsG5Zwr1qk+Rx9GsMVaXrArQeuDhLnbqJQmWtD3EVrzosg
         CCjf2x3ofpQMRSICy90bJMmolWqZ3nrFtEZvq0hYYTFdRU6I1ai8Yo6xRQIhYFMpTl5D
         MfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200852; x=1741805652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTEPlivf57KNf0u9yF+nL78ShRAOQbbl1KlRhOM3FSk=;
        b=J0uSt/h9XBCyjl0fWFtDbL9LhgI1u4TUJnEA2+W7eRCRiNEuFHw/UOlAhRiYM7ll1C
         TktLSsyuflviMH6C0wXZqIqJV6j/AFNveNgV9IrNWDbQxAAT9XtjG+Aquu338wflELWZ
         TiAzArUEXIchSjag6o3u1h8xKHMiOgbT7UFdJhOAMayr6Djqk7a/pM76Kev2MyKxB3Xb
         hid2pT2qeV4WBeBZ9l0k6hStuYR0v8yYasVOIR2WNOQaVPZzXCpoW9XodNba5e1T0ov1
         3wS3F/Uw79mNWHzXtaChs5Ves+dSMk5a23dftsp+h2sgzUSZGwoXXznmQmI8arjDlCTc
         F/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8XVCY6q20TpOK6l7fmEiYKB1nqDloH0p9na7TC8yJ9gE1LWdXgfxpJcIYe6Icj9FQ2cZBeTyyUAX7hiv19yAw@lists.infradead.org
X-Gm-Message-State: AOJu0YytbHbSqnoZ45ks36IWNuMPDe3WM17Af6uxk4ZH8mFwnQ3S9q31
	e+qSW4jZMiEz4JE49Arbfa+tfsu98NHd4RxiGEhHNZhZntQNg3Zg
X-Gm-Gg: ASbGncthUOwcNauf3bVCqFkMrRSlkk34qzj4ccy6YBfK4Wu2Z8+jyj8FGHfpfp9SqeF
	2qdQod3EN+Bwyt48XU4Ce2MgxmMvlhFpmv7beRxgWUFlX0svZBE24/bnUaUu7APoz2qsGT6GgsF
	NMs5qBQt2LdyoSbhiD57VXPTAuYZc4gqRY7tK1LGAqDfEZpf5IRuO5I2rml754b9iOfABpuOfSB
	hfWHXcEOkhOLX+2O4HvxtLzk0s/qlT4Nh353+5u+TIbJJQl5QLAxZ+EZ9iox6On/f/xCfxAx3/y
	7kVfbBFTAEHMrB6nvW0af7xr7FYQ8DK/7Tw2+vRMSe2hHgBT6Hyv7jBEMcM5c3gs9g1jTPNHEEy
	KPGZcY4HVuUByZQiNwpTC
X-Google-Smtp-Source: AGHT+IFq7ByBMzrdcbNey9rPMwFoH0XXCXvSqwidIYHLYAKpglo0B8dEBkmtmZjPTAu9SsK5oJOomg==
X-Received: by 2002:a05:6000:1f82:b0:390:f75e:f815 with SMTP id ffacd0b85a97d-3911f7543a6mr4658220f8f.23.1741200851871;
        Wed, 05 Mar 2025 10:54:11 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47965ddsm22312099f8f.18.2025.03.05.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:54:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 15/15] arm64: dts: allwinner: h616: add YuzukiHD Chameleon
 support
Date: Wed, 05 Mar 2025 19:54:10 +0100
Message-ID: <2227598.Icojqenx9y@jernej-laptop>
In-Reply-To: <20250304222309.29385-16-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-16-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_105414_026871_5A0F2488 
X-CRM114-Status: GOOD (  10.94  )
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

Dne torek, 4. marec 2025 ob 23:23:09 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Chameleon board is an OpenHardware devboard made by YuzukiTsuru.
> The form factor resembles the Raspberry Pi Model A boards, though it
> differs significantly in its features:
>=20
>   - Allwinner H618 SoC (4 * Arm Cortex-A53 cores, 1MB L2 cache, 1.4 GHz)
>   - between 512MiB and 2GiB DDR3 DRAM
>   - up to 128 GiB eMMC flash
>   - AXP313a PMIC
>   - 100 Mbit/s Ethernet pins on a header
>   - XR829 WIFI+Bluetooth chip
>   - 4 * USB 2.0 USB-C ports
>   - microSD card slot
>   - 3.5mm A/V port
>=20
> Add the devicetree describing the board's peripherals and their
> connections.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



