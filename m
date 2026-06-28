Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34214C43327
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 17:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvP5EC4HPkXdnPkEEbC3Vgbr3RX7xQ2s7hFuOh57p+w=; b=OXauXSQWgnTlUwhV5jSOuwkNPD
	eeOUlXbcgaOPeucMJWc1Wgn9aexdrvn+4k1SGk2En4bTioLF1CDQQfNdneydlLLKUvzDWR+szmX2J
	QHs++7OYt3v0gVJLpw1EqCKpF0U73il4IZ/my3eXF6ToqWpmBsys+uE/KkBNrN37zHWzI0JOszoll
	WEydxnLqHSLKEWye5Jz6Z/sTWmAPCbCVXZxjFfhy5/j06Q8sQdrNDsLflryA6wipW1WeW7DL8/+tu
	uBO4hSHcZ7OPVf5zAe9d9AVdpnIg6GOUuXRsvPFW/VKje8SUM2Bam/Eu81SwOCWso2AF5Af5++uk6
	C5S152Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdtOk-0000000DFLs-2tN8;
	Sun, 28 Jun 2026 17:34:26 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdtOg-0000000DFLB-44or
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 17:34:25 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7e9c5cacf1aso425599a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 10:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782668061; x=1783272861; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvP5EC4HPkXdnPkEEbC3Vgbr3RX7xQ2s7hFuOh57p+w=;
        b=E6pKRkeovoxaLAY9IjGHf30vDChuY6bH9Vv3wRpRoaXmlH/Yn+jmLw5ZpFZyGSAMKb
         R+N5scyBDS6MwXAjtaa0wxeMUFjBXtJYDnBJWM+sOCzw29tR4Pd87AjH8YURHLpj8sPW
         VePk5IKoR9wXjtM8qgBgqjHS8mNyHDhLqcpa6mLi83ly85KlbF2KBzs0ryLBGJ5Wt1oL
         zkTOHVe/GSrZrVaY3faw0tTkITwtfcbrcl1dBvesjRPEH4JZREVfHfoSxnBGNY9wC82w
         Gy+fHBAgn1KnHs7CgTBXGlS1Dx+5VUQJvfY+xa5s1mvTBl43/TK+iHMTUoHguqhlYyL3
         +Dfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782668061; x=1783272861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvP5EC4HPkXdnPkEEbC3Vgbr3RX7xQ2s7hFuOh57p+w=;
        b=U7cn6tUK41N7KLjdud0Fx09cE0xtpADjMI7VqCwoNAizA/f4l0hHjQCZ5TEehLsDd6
         jqp+pVNYhi+sGqT6Lpp1rmlcoGw8uzFXO43NxjRI0BtLBtdTR83C5fZni/QXW+AXczTA
         yZhdyoi53rgbnz3WLGVwElcXihq0wnP0E0ZqWwVohijbOh+nCbt+z5ORYHHS8/hXdd1u
         s4XK+ortXjtTCqHijp1Ggma+OlhD1bQQL8T2gk97P2xlBvGKYgtXlYQ9SCgD8TqJ0Oua
         z6mfDp2I614yeDpPHnIDeIVNRDivmIgnFMsgb+zpoUQPl/OCL9TPLdi7r5wYdW55Ll92
         Q7kg==
X-Forwarded-Encrypted: i=1; AFNElJ/RVbTU2RwvpjIUrOri/amyDRRJgJeA3mOE/xosppjom4ZZspjuczKR0q7dTOtBWP6/tup1Kd7KcZewzw9F8vyo@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9J6Sp0slghBdfxuF/WFtVzmeeL162xtEj8Qo1ir2u7EYMHDEF
	8zHm05yOAOM9Y45zXOPX3GhG+XgsM4m8GBqBlplSXC/6t8bOLGs6JrqU4XdTjeGhbuI=
X-Gm-Gg: AfdE7ck0IzU4L8STBueaPkG77OPNrt1SWlarCGg6NgKEwwmFCEzB4lqflul/D+unXdU
	1tTjWFkJrRtPrTvxQlaTLn1nilmrQxZ/z1M/JUM/Rc+5g9dbNT15xSJMO+C76q3VnJTnoifhUi7
	f8dgPvUleGtD97slmTnqunEG0pq1NfOI1chVB05G1GhqONtMnQhQGQLGhGkFTTv7VXU1EztrmJi
	uQCZvDRz+f7DkVSH6KfLpyHmPhqBYkwAsiMi+F50vIIkLtvqlhr+4tja9+FFAkgW4zVAeCj+FCw
	h//IVosFU6Q+fA1WBrV71WU8ch2AQfCiqlIsGOHKWrQQ1Xc2f+TTaKXq+fX8Cq491hTs5oJDEgS
	sUzxn9jvjVU5luPvb5vHuly337AfuPcAgVmg0S6P3Rz7+hSE76ZIjVfOF2Ai8E5t1edVa5onS2J
	PTJqFi6p/IntVRjEfMJ8IzkFb174LAxJjVIuYV3TSiKQtRYv38rwfZ7M5GKRCnj+I=
X-Received: by 2002:a05:6830:4998:b0:7e6:f083:130e with SMTP id 46e09a7af769-7e99bfef82bmr13002333a34.4.1782668061288;
        Sun, 28 Jun 2026 10:34:21 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:f242:ecd6:f61e:d764? ([2600:8803:e7e4:500:f242:ecd6:f61e:d764])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa7eb558sm6725566a34.24.2026.06.28.10.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 10:34:20 -0700 (PDT)
Message-ID: <3f914030-44e8-4f63-ae72-7fde7d843325@baylibre.com>
Date: Sun, 28 Jun 2026 12:34:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] AUXADC driver for the MediaTek mt6323 PMIC
To: rva333@protonmail.com, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>,
 Conor Dooley <conor.dooley@microchip.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_103423_020067_8CF8E473 
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

On 6/23/26 3:16 AM, Roman Vivchar via B4 Relay wrote:
> This series adds support for the 15-bit AUXADC hardware block found on
> the MediaTek mt6323 PMIC.
> 
> The previous version of the series for all AUXADC, EFUSE and thermal
> drivers was split after Krzysztof's comment [1].
> 
> Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
> mt6323.
> 
> [1]: https://lore.kernel.org/linux-mediatek/20260504-mt6323-v1-0-799b58b355ff@protonmail.com/T/#med30fad67a090be35f549231336b2dec295233f6
> 
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
Reviewed-by: David Lechner <dlechner@baylibre.com>


