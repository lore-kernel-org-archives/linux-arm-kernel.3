Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925ABC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 15:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=; b=trUYcts7DPYLYjS3vbawwbYATt
	XtbSjNUo2LcjVxPm8SqAIqGmYpx3GPkzdIcamUj3Z6tm+GtEIMPwcBzdy+ReIfBMf8Rk0U5qybv07
	F0lCKVYI4gBJHCDzu7L2VKQLYnTX823doO7o3UJRd+xg1i+GFWcB/fdstqw/E0lheUYAuQ/R3/Qew
	VTh0gIVbsB+uj3ax0FVS/AIrQDcV3PlUYLG4qG0hTWL9w8qMmY4E++drUUvJhoKJYOd6ds6GIk5aY
	9nPq0QfnEEUMC50dopvhboDGDK7zJSkDt2r0F6oeRRH1Q0KY6IVft61TzIduDzlzXiTP/nLwirxpc
	wupWClbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x534S-0000000H1qE-1Ows;
	Fri, 11 Sep 2026 15:21:44 +0000
Received: from mail-yx2-x10.google.com ([2607:f8b0:4864:41::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x534P-0000000H1pk-2w2y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 15:21:43 +0000
Received: by mail-yx2-x10.google.com with SMTP id 956f58d0204a3-66e4aae3149so803373d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 08:21:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789140099; cv=none;
        d=google.com; s=arc-20260327;
        b=Ba0CitOitvMFv9ZLkhYwtxlbxiMfxKsnf8Ip3sIVYgC9/VwzFfSzhwJAf4IFrtqZr/
         HxUp7cWIZiTOZMBlnLrofSwLKKu4vDpLTj1ScD6iuWk8TbCnvzdGO0c1wuByC0FdoXBE
         VN5qg47RojJ3v32BW0w+U2RAGP7nieR9X/2syoc8xKiMeBNUmpge1BpNlzsv3bt1CuWv
         z0T/PPY/GAUQwfxEyrfCLSYOwUU1XAznEvopd5VskxKoNQ9nqtdbjd3IhP8nxTaVME9G
         rKrysyTU5DtgQY3TKELE8SNDqbpK9h5LIVB+hUJWIZPflvvF+l8oAdMCWxj8M0WnNMu8
         ihgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=;
        fh=M6XJ3eRbRY/cHT/XblBmc5uALHIa+zPU8cVwXWW4XSg=;
        b=shLdEVrhcUAKJ2A3VnrdugMN/4ag4iM5FMjndhGGZn8Ds/alNr7TndsSBjAfRHSu4n
         fu9/fcXirAFxv13IjPOjIb++Iu66qHUyno/6Za3VzW+Xk4IRsi+XZwuxkliRZBbhODAu
         o1lte4RjCd98UfWR9WgdTU5p9RyhYuUZroBLxjtAqPmBxE/0zFY9Zal3H4+CRH3KNmMX
         9znZy1j6tsqslnSuWpimpTCHU02pNRlrQQfiSg5drnQ9btL3K69iDU5/zj/IvxertUIq
         RDdSqfQUH/lEbLfI1/H7ibgcY5qObMrhW3O7VoUBCFrsmu73rL1BWCSSZR/hOoy0wd68
         H+HA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1789140099; x=1789744899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=;
        b=jH0hwoT0bU8B5kTSiiaJTLTEqXAXhtxnOX64jKfiCyc2oZ8NSQha1aXWviNephTxIp
         /5huJPWHpNkTExAYBKJKiAE6Auqat/U9rAoNgD3C3V57U2wxCxrKewTRLw67WAV730WC
         mA92brli0IpwZFJAY8KRSH8dYizuSbuz8x264=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789140099; x=1789744899;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FkkSMxc0+XLFGXfcobgYJWMCi6rudZ0wwsjRC0+wmrk=;
        b=i86MEob568Tcitoyz4qbyfDg1VgdwRFzeby66Z0r/7DOu9tvgP12M10zTeupkmterZ
         ByIgLsyu3kwroQtPvhG4vUgFOqiTT4va0jXhLEtZG2aKamYujakpGAQMV0ZnqVHxFpvL
         3Xa/DUVWkHSjsDA0450D5grij1bQrs8t+Yj7//Xoo0uf68yDPQtSAX19/Ut4aWGUio0m
         XhJJUQApepBkdc8uDvwpvh7kCgYtd9JgkDBuwcs96WXH5LVPQUlIaHDE/EUYQRbcHML7
         SVyUlnNGnkJsj+dGzA1aZJuRGjXwQbWj5NMzRZj5RgZmpf4sGrhBH0kNMVDSatLVKwCU
         0srA==
X-Forwarded-Encrypted: i=1; AKwUvBzeZnf/v5nUkYqCUv8YGk+ht8o6s/dCVK4PSOa69iqugx2rtTnAn94sjJdJryhfuccxmeEojhB2ofRYfq1yrbLV@lists.infradead.org
X-Gm-Message-State: AFuF++kVrG1PSBGYhVcly5xJnq5ZoeiPnC1lIzfYfi7B9+hN/+VIFCm4
	PY0Kzd47N4cm+QOC/KDuH25hh6mXVMMjwUJLni8TZpMJbFRJt8eHHUyyWc7rzejv8Nae4xAZKPq
	/K0zxpe23WjvAfnZu57ENAYFZq+G7lIK/Ibt3hEoFlwWDlGaFLAM1vGWNxQ==
X-Gm-Gg: AYBFou2hk3CLKV5zFFHPjsQt3UvxkkN/jlOse+CntYsfHRkC40DFFXZjMJhJpbALC58
	Lfm9GIOlssUjGoB9xcJW4HaojWTY4bMPDBNJomU/VEeivhbcU103aIX3NU4DUUF+ixJLD60k7/L
	ZHh5PeXOJ8K9HdjnjW8NtpAVJ+lMy6GbuTrQGyZRGXxk2R8FXJUJ0QQM5Ty+XjQIGvIhA/lGi0w
	5wQTWQ0RL6Y9VNKQAUIEvoTE81kRF58OYqmRaTt9YLeLDbAJL7GIjaeYocFaibn5HGkvjCcVkHp
	z8dJ0VRYd1H28FO6QDurHh2PGs6rnrP9Vug4KkEEvhSra3tzgHMUkbCPfdjQq9IfUVFjYleLMsV
	5nN/4eq5Kyg==
X-Received: by 2002:a05:690e:4549:20b0:66c:ba49:1316 with SMTP id
 956f58d0204a3-671245483c7mr1612948d50.10.1789140098875; Fri, 11 Sep 2026
 08:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260820092143.44829-1-dario.binacchi@amarulasolutions.com> <adc7f285-6269-487e-bbcf-d157da49f379@foss.st.com>
In-Reply-To: <adc7f285-6269-487e-bbcf-d157da49f379@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 11 Sep 2026 17:21:27 +0200
X-Gm-Features: AcwNN1Ulqxcrv_HW3Dh6aPwZRfGOKMd7-GxKs7PSgQjZfT6GRUC-E4KDQ90Z2_Q
Message-ID: <CABGWkvpBT5xg3BKXAn01rxcpc8E4r238JQxx0YsYOG7Xvg5_LA@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/3] ARM: dts: stm32: add missed
 arm,num-irq-priority-bits for stm32f429
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_082141_754190_D49D95B6 
X-CRM114-Status: GOOD (  16.82  )
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

Hi Alexandre,

On Fri, Sep 11, 2026 at 4:32=E2=80=AFPM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dario,
>
> On 8/20/26 11:21, Dario Binacchi wrote:
> > Add missed arm,num-irq-priority-bits to fix below CHECK_DTBS warning:
> >
> > arch/arm/boot/dts/st/stm32f429-disco.dtb: interrupt-controller@e000e100=
 (arm,armv7m-nvic): 'arm,num-irq-priority-bits' is a required property
> >       from schema $id: http://devicetree.org/schemas/interrupt-controll=
er/arm,nvic.yaml
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >   arch/arm/boot/dts/st/stm32f429.dtsi | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/st/stm32f429.dtsi b/arch/arm/boot/dts/st=
/stm32f429.dtsi
> > index ad91b74ddd0d..f94500cd90cc 100644
> > --- a/arch/arm/boot/dts/st/stm32f429.dtsi
> > +++ b/arch/arm/boot/dts/st/stm32f429.dtsi
> > @@ -794,6 +794,10 @@ rng: rng@50060800 {
> >       };
> >   };
> >
> > +&nvic {
> > +     arm,num-irq-priority-bits =3D <4>;
> > +};
> > +
> >   &systick {
> >       clocks =3D <&rcc 1 SYSTICK>;
> >       status =3D "okay";
> > ---
> > base-commit: a4ff2be345d0abc943da8dd8da98151843b750dc
> > branch: stm32-nvic-irq-priority-bits
> >
>
> Do you really want this patch ? MCU boards are deprecated.

You are right. I agree that this series is no longer needed.

I wasn't aware that the STM32 MCU boards were deprecated.
I noticed Arnd Bergmann's series, "[PATCH 10/13] ARM: stm32: remove
stm32f4/f7/h7 MCU support", after sending the patch.

Sorry for the noise.

Thanks and regards,
Dario

>
> Regards
> Alex



--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

