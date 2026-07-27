Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EC7C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 11:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2B5+ZNIbt5wpYmMhwGwrVTQ9DhkKPd2GAMOogsvhGQ=; b=xwX4DEUEagZQW1c8mlq1imz2a6
	Yj87zI+Qcta3VU4oWNt8ALKXyCVBG0Vqf8ydkSZ1jmYIMUL5JIeh9Fx31UK+KlY71L99BoO0ebdyS
	57+q6cKiKY8K0q0aObL2uDlEN6Y3Y4Xbi9FnyPiIJiliS8Q5B9Ilj6iWpn9DWn23Y7PbTpzOsBXEz
	5a8xJlzkdh2tn1qXyP8Sn/mONnZwTGEcAmXHNtMQ+kLO0sf1T4V4okiLHJrOmSPNhRmjApkyXTp66
	/EZDDTIfPFyNzB5wZ8ax9QwXlUGMUiYKann6pCBsahNE1frQaMulTwenS3ETlrmno4isrncVYISjY
	8zx4N7kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJpa-00000002c2r-1WJu;
	Mon, 27 Jul 2026 11:49:14 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJpX-00000002c20-3qwm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 11:49:13 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-69ffbd2a277so1190421a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785152950; x=1785757750; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2B5+ZNIbt5wpYmMhwGwrVTQ9DhkKPd2GAMOogsvhGQ=;
        b=fpBhx0jkX3uzfN++gj0Pj7bCa+LgSlGQfMHg1gtDXL9K8+UxbjjnSG48KcKAvhf9+P
         SehLVMsLKxaMXICySQw87cl8XmnsSBffnxobY0v8FX/UsknRPB2QBCSyDMSGqaTFf6zy
         Vbx2g0mK5KmdOl1EsfIq6sSKCreD8TBSwlVGcXoRmgqQwA0CLi0meUd7v2I85zeP21oq
         fY73dxrW9c/Es6QnDuqRj/jS+lr3SkyIlURHgJ/VV+T76b4v/XhjXJZ9qSi4tkkN0jCY
         b6JZnAMSi33BHZ6gqnFoON0DFwABHq1tX0yZ4qdVXCTilXgwND3ACfbisJo/rgeHHqDj
         ofHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152950; x=1785757750;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2B5+ZNIbt5wpYmMhwGwrVTQ9DhkKPd2GAMOogsvhGQ=;
        b=XsGBITq07Ldaxw7uXBg+O6L4krR2AU/xR1W+p7mIKidrQs7JsC6G0jbuMQ7Vus41mj
         bF7puv2kXYo+RcDmS7T7odND+wIsujf/Qa8inJfvpq59prUhWa5W5VVvQr9Zjwco8RP/
         aqSqZUHAiATi8T+5NRZhXKVGQStLhc4SAyQf9Lr/gS1Wt30NSQW/Gj6vJSXWTvJImWSf
         4LbyDm9mvY3NtRkDPJkldEmM5+MjkZwgFK0RBAw1ezYUikK++b1qpccKetZeqCEJ1IlR
         CHHIYVN7GGNs2vElSVa9267eJrXOKJH9AaGnC2VKrbqK9ASzkE43aUOlbzvilXJKKb94
         RW6g==
X-Forwarded-Encrypted: i=1; AHgh+RpEwidASWff7vnpZfHo0V1umfrsortqguxpfonYA0X0O+0n9Qh/VcVIB4T9myYM+Gpwb1fp9nZGEwVvyTU1H6OT@lists.infradead.org
X-Gm-Message-State: AOJu0YxGXJ33Hji8M6IhFG5IgAJ4rkVQ2WthFMg0i00NaBgcvbeShn2+
	FgvU+ZRMQ5wh+Zjsqf388qVLEliCpyKt+sD0OhFk0UAFXEhqvRS0CdUjPcuRDxaPl3s=
X-Gm-Gg: AR+sD118kTBfwA4+JFOoPZoM3cXE7MgYkbrmcSnIJOeStZfswxmHgyUjBHcoSl0vSAy
	4XKxFgLfurKpr1Cd00Pn0Hezij6Wh9agvUNcDZpmMnrEdC7sr/9hhN77ZUHutEEsoy/nWNB5bch
	U6slHd/ee/QSZg8K4F267lP0JR0mn9fbmfCwHrjp4srPfLCzfp+S13pMfUjz2aEZWegwWxSCBRj
	3zEwMpYl3EbJorI4IUMmq4wOMBsrsFP+eU8FIiwZNHMi4BNwp3CmL07rThrrOFP5h5AfwaJyGg/
	ZzXTa2Tp5LbF26uVXuRW/0KQ/gFgluFmtr78xLj7FtQay2qjQ097mZyxT15i3rGjAeJgBGf8EQF
	9zYlCvGsRd+slIPuqAScxUWtH0rWOIAE3lSbbNDpzYKmcj7tr6SVhAzaWCa521dfNp94XKaBAkU
	avh6MlB9ElsO98TWkMpKEao5UTkSXgAYuBlkpWHyEU2r++X087Dl/tOVET
X-Received: by 2002:a05:6402:44d4:b0:698:c1d9:8134 with SMTP id 4fb4d7f45d1cf-69fc0ff874bmr2476224a12.9.1785152949730;
        Mon, 27 Jul 2026 04:49:09 -0700 (PDT)
Received: from localhost (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5958ea0sm2526661a12.31.2026.07.27.04.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 04:49:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 13:49:06 +0200
Message-Id: <DK9BWMDFMNK0.K7MAJJAZVKM0@baylibre.com>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <dlechner@baylibre.com>, <jstephan@baylibre.com>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Carlo Caione" <ccaione@baylibre.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jiri Slaby"
 <jirislaby@kernel.org>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial
 ports
X-Mailer: aerc 0.21.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com> <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com> <a3298120-f5be-4a8a-bb71-1d6923a28d6c@collabora.com>
In-Reply-To: <a3298120-f5be-4a8a-bb71-1d6923a28d6c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_044911_976058_3AB218D2 
X-CRM114-Status: GOOD (  15.25  )
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

On Mon Jul 27, 2026 at 1:30 PM CEST, AngeloGioacchino Del Regno wrote:
> On 7/27/26 09:38, Carlo Caione wrote:
>> On most MediaTek boards only serial0 is aliased, so the remaining
>> enabled uarts get first-free ttyS line numbers from the 8250 core in
>> probe order. When the console uart defers on its clocks another uart can
>> win line 0: console=3DttyS0 then ends up on the wrong port and the boot
>> looks like a hang on the serial console, depending on probe order.
>>=20
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
>>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
>>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
>>   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++
>>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts              | 1 +
>>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts               | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi     | 1 +
>>   12 files changed, 21 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/ar=
ch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> index 0e086dd487d9..63659e240b1d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> @@ -20,6 +20,7 @@ aliases {
>>   		mmc2 =3D &mmc2;
>>   		serial0 =3D &uart0;
>>   		serial1 =3D &uart1;
>> +		serial2 =3D &uart2;
>>   	};
>>  =20
>>   	backlight_lcd0: backlight {
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/b=
oot/dts/mediatek/mt7622-rfb1.dts
>> index 8c3e2e2578bc..7bccad118d24 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
>> @@ -20,6 +20,7 @@ / {
>>  =20
>>   	aliases {
>>   		serial0 =3D &uart0;
>> +		serial2 =3D &uart2;
>
> Why is that serial2 and not serial1 =3D &uart2?

To tie the alias number to the SoC uart index instead of to the set of
currently-enabled ports.

The problem is that uart1 exists on mt7622 but is disabled. With serial1
=3D &uart2, the day uart1 gets enabled the aliases have to be renumbered
and uart2 silently moves from ttyS1 to ttyS2 (or we have to again mix
serial and uart number).

Also in general it keeps ttyS<N> matching the schematics' UART<N>.

Ciao,

--
Carlo Caione

