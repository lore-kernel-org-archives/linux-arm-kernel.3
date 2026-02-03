Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E12FE8B36D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 22:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c0NPTkqLZrpseRrb77cJ9keUj/pZc1R94Glr/7UpBo=; b=Y9ttKJ5jZq+T6mhiRosEuDZ01z
	8ujg7UAlC9I85DJ3OZ4r3YrYdGIrVFZw0bPosUM5q+OFXbNfdmZ8LSBdD3Az3rNeGAKWNUeWThvSn
	tpYmVeiSn5I/82KnyI8ary7uD3Bc8xYHROpnXyLO45B67R+3qgYMECuLy4cYDl96iTVwwCURMq/Ag
	S3sSErVk+OTGOdF1gyk2AXzgo3JfqErq8+hhXFRjnczHnSbPEH56zjY8MFMrsht6xc29pbbnJbGfD
	LtsMIA8VlAYy0fir+aGorbug7wojLHmmcVofs9z1bsNTxrs0cJF64jtjEFLNgiWf4U6bAR0/r35ct
	9NC+aNhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOh6-00000007TYT-40jo;
	Tue, 03 Feb 2026 22:16:24 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOh2-00000007TXT-3ZKS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 22:16:23 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-662fc35291eso3410949eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 14:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770156979; x=1770761779; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7c0NPTkqLZrpseRrb77cJ9keUj/pZc1R94Glr/7UpBo=;
        b=ffM8O8DHJ6C0wmvlRpdvXnP2sIEUrcHUx2TuvBKq9Ww0iC7vSy1WkOqvCKy1QEFtLV
         qBFkVpTsaeXuLcgRKkndcXjLmGJWpzmzh02P+D4cEXKVU5yaotUw3Z8O21uiPid3mPPr
         l4D38FU2H0Ae7DaszyFU7kIBJdjbsPs55rTn1na+Ll+/rG52WQjNa7Ju6/HBQ57mwh4w
         A1cx1Y+y65hLcTQtfaDtdNXgYRiJ944BMAviWUqVjBGZTOoBEipAHdoN6SDxcqfHyjJf
         8EAB2aF8BpAa/O5N+WyrEBlhEAARy4NKhsTzHDlDEFOK/QBXYpMwn3S+ONn85Q20pOeM
         Xklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770156979; x=1770761779;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7c0NPTkqLZrpseRrb77cJ9keUj/pZc1R94Glr/7UpBo=;
        b=pvgXTQmlOg165g8y896Th4S0OFoi0AVx9589noCwMFCgrsbEnSUOhnjEYOKYoG1m2S
         r+4gurvVyrFi97wERdlrYqoeb/4snCrw9AZkEWcOBynA9YNaWYG8phKDPeOoYLr9nu0h
         YJSzQN7FEGn4wKww8wwLKAyBhi6fm18npAlIeeOpPls3YKlTrxNxCqc5MHFD7kkRb1uz
         cbZzf2XhfvyX+Fcgr7XaQj+A3zSJxXGPEbJg+muQAn21XI0xpn6atHS6SBZeS2vIcvLx
         xMeXr3dAwUhrDgS0WSNHdCUP8HRv3LQQkBCSNuDVE8dNxvHYPDw3YvKANybHX3r99gI/
         t86g==
X-Forwarded-Encrypted: i=1; AJvYcCVyljJ2cjBZqjjje90hX/bZ3D+dK62rxN43ECdo0bwnTXyaM8zB/4hjhXzlFxZrohptvES9Rw/EBEuzh/8oy+pg@lists.infradead.org
X-Gm-Message-State: AOJu0YxmEcy8eKdlRSvSuuj6pzcEO586oCWzxDs9TJ8uPFgXV2Cu4vdC
	9d9cmdYJKHzvy1DwgJ25FQ5rRs1SyCrvElv9inyhVJMYCeM+qWDdjg3tXcoDbajHp74=
X-Gm-Gg: AZuq6aJwOGp80XSONQrNpTlW+XziSkoMAuVm8QdX6pnd4gGBZpEKtRS8wsmRPkIPH7a
	J04CZSJv3Tzz3DA4FEO/xtGJMp6pR//4nso1feN/YQ0+yuDG4HPhJ3ZEnCp8dXxO5gt63r5Eu4v
	Vkuy2ZPHnvRZXgCP9UoHX9wN+A3WKejZ+8Css4ibCYcU8r6naqomr2l0fhit1D1/5p5dTHF1NzY
	U2fURDp2pgrKZQ8tWTsQ4nEsbO0xSA84X/h+/r/8Ti+C5vI660kB5OuLLoEsJ/rIMBTT7R7f0u5
	IBwdH7fHlSr0yg+mYmJ7hSxifofsL1tXz5/punbcVhO/szQ7I+GZ/EWZlCGXLCO/YYHQgIioFbs
	QtwcvL8d+KLUtDAw0CQD0PUmjZMGcXOfk6JUIoCXNtUksXdGA7+qnJd4BnRciN8OH6DzdhpiBx6
	5ZF9cUAWsZ6xBBVnjEJeG6//C9jrDivksIwqI08+A6laChsfXzoIoC89E=
X-Received: by 2002:a05:6820:f09:b0:65f:66c5:c3e with SMTP id 006d021491bc7-66a20d658eemr547793eaf.22.1770156979083;
        Tue, 03 Feb 2026 14:16:19 -0800 (PST)
Received: from ?IPV6:2600:8803:e7e4:500:8e13:880:992:e796? ([2600:8803:e7e4:500:8e13:880:992:e796])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40a544e77fdsm481769fac.21.2026.02.03.14.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 14:16:18 -0800 (PST)
Message-ID: <37d5b1a4-93e2-4fde-ab56-186d34f8835b@baylibre.com>
Date: Tue, 3 Feb 2026 16:16:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/18] dt-bindings: clock: Add MediaTek MT8189 clock
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
References: <20260202062840.342707-1-irving-ch.lin@mediatek.com>
 <20260202062840.342707-2-irving-ch.lin@mediatek.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260202062840.342707-2-irving-ch.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_141621_136212_7F7988DA 
X-CRM114-Status: GOOD (  10.81  )
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

On 2/2/26 12:28 AM, irving.ch.lin wrote:
> From: Irving-CH Lin <irving-ch.lin@mediatek.com>
>
> Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> The MT8189 clock IP provide clock control for main system
> (apmixedsys, topcksys and vlpcksys) and
> subsys (eg. peri, mfg, venc/vdec ...).
>

> +#define CLK_TOP_VOWPLL                                  174

This one seems out of place. It is not used in the driver. It is
a fixed 1:1 divider AFAKCT, so should not be included. (And this
line has spaces while the rest of the file uses tabs for indent.)



