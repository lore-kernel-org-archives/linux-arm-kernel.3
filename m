Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E86109879B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 15:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLXcqIVzc+TE7/RYP3TxhjZkuh5oaQY94C3LjN7BMto=; b=zuEKuJWK6usO0t8SQ3L80TU7c7
	Qmx0jO6d3QcAqSUN0ctUJjf4xKpTxz4dXfpMAn8ZhXhawvQRzM6SPTs0MCApI5RnqOJD227gz3PFw
	+fu886SpTTUIfULpp8EtLu4wwhmbjVaE09+bAUzgBq1Flv0wQCbMZXaUxK1TomIvP0tOjtnGffm//
	vx2ziv6HykqOEG0c4rj6twMlffqg6PSnQUUycBCCClEpRbaFV/7F2zS5xEXEx87l/Rje0ODP373b/
	6HHryjfFn+j1V0vn0Yt/EBT+TTFu/WHdPPiQbj89GOmv7mh2DE8MZtSBe5IDjEUz+U17k8dIThnAu
	rcS7WiYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3bid-0000000D2KU-1lUr;
	Fri, 20 Mar 2026 15:24:59 +0000
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3biZ-0000000D2Ji-3prH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 15:24:56 +0000
Received: by mail-ua1-x936.google.com with SMTP id a1e0cc1a2514c-94a231b285dso1025236241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774020294; x=1774625094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLXcqIVzc+TE7/RYP3TxhjZkuh5oaQY94C3LjN7BMto=;
        b=BrXRh4sDIDlSwr/MCeySWjtzoeDITHVjg6C2UPf/h2O+0w2W5n/DOETwGi/yUqxlzX
         6YFzlzB17NVYbRqeV/Lhk84+1XHtraDuJKvSqR2Q24cT7wf00t54XnzsWp2oi9YJh2Xs
         uo12+hFnRBqnRLaze7dX6hB5d6NpbvaP0Yx3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774020294; x=1774625094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XLXcqIVzc+TE7/RYP3TxhjZkuh5oaQY94C3LjN7BMto=;
        b=UZYLpMCaLcKSIM+XSVlwaNhWQ/Kw/95w5nEWDh/gikWKTiaNJIWHX094qzob/gYFJO
         DYL20bU+Bb6x9hFcu9Gvtp6CDNkJ77qHltIWOHzxF+HvmxT+wcJTqAtTUQ6/T7+QazJF
         a278KPuBNoqXxOUzeXAU+tz8AOH7utJhx5e/LB7b+QI3u72+w2SfVeyzOHFuIxzooLTs
         PUG6eY1yfQAbB01ONJJnv6MD3OwZF3LaF+lC8RajAt6vSBjCnRIJXPO34akd3FCTT11t
         VlchhYqzbWwaW9FEbMlBTxnforLX3+UASZBv2AjzBQWmPzdozEo2z8GPRsuFSdg1omME
         qgsg==
X-Forwarded-Encrypted: i=1; AJvYcCWXOUKORZOMHpjlgQ2KMxyMPNp3/G9tnKfra9HmUonHUiPxKizkKR5dl6NQzYs/IBKeRCjXyU56QEGUvkkadY+c@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3P3keIGAPp/+bpDFS0MXp9AVD/pUzMyA8SXkewFFnmZGWXIjr
	6zgBv3DKXAj69lDwPDBAVHOcO2PrEet4aCxeGGPRJv8Cnne9fMTEr+mJPKp0f+N5i3UGZEc+7IQ
	KHgw=
X-Gm-Gg: ATEYQzx3PwoQ9hCZuZ8JltcEShDUBTtkVQOGgEmvniZwM/La//d9HuloLzBrgPhTuq6
	TNPQpViBmFV4pqv+7HqBj5g5vKqCk9UI/c+k3Fzu8a0EYNj8CZ7GgUtDKx2z9rM3RsoQ+zGUk71
	Ys963mKRoRkj/BlrbFU3kONrmH2glW0/CVEpzYhbjorYYNdUAMi4RNRDzllED7AVauG0knvdvV3
	veMlrWik0hyshxFMDLeRTJ63E3DuUXExIL6r/xr6MVgzjkOKHY0bln+iENuRNVN7o04eMKZIbnl
	12+40XOFK2kQPxwEss2sC0o7r5pv+ACRF5AFiMIMSvDvIb98tW+R+0vKzgeojPzeoXbDObykZwX
	qxFMBPZTs1+tYOJyHOw32rrxyfha2ohAu+Fe4JIcSzG5fWvaD7s+yphy3SqTg2vwoNhdTfRQeS+
	rXck19FwBhdNa7gmWYlrMph//KK8qwN9WPBvBbJU35cd4ER0In0nXszS4vDw==
X-Received: by 2002:a05:6102:508f:b0:5f7:2430:cba with SMTP id ada2fe7eead31-602aeb13e80mr2111354137.12.1774020294141;
        Fri, 20 Mar 2026 08:24:54 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8539b1sm1268978137.1.2026.03.20.08.24.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 08:24:53 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94a231b285dso1025220241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 08:24:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwiAb8uem7fQRmLae7Z3a2K+cOuwzt2BzlIQxF+NK2HR+lCotMwOWQX82gPZD8F92CCR31zsn/1rs1LV9XHHQ/@lists.infradead.org
X-Received: by 2002:a05:6102:2927:b0:5ef:a8da:8b26 with SMTP id
 ada2fe7eead31-602aed346fbmr1801022137.27.1774020292428; Fri, 20 Mar 2026
 08:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260320084351.2461060-1-wenst@chromium.org> <20260320084351.2461060-5-wenst@chromium.org>
In-Reply-To: <20260320084351.2461060-5-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 20 Mar 2026 23:24:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhBnhE2XJRaGfSOSutZGJXfHQujOd1rMbhOfAwGQa0ZrA@mail.gmail.com>
X-Gm-Features: AaiRm52mZwCR4AEeTV_75B0alA5w3n6BBFefcUDCvgduPyrlTgwEFUngOeWKn9E
Message-ID: <CAC=S1nhBnhE2XJRaGfSOSutZGJXfHQujOd1rMbhOfAwGQa0ZrA@mail.gmail.com>
Subject: Re: [PATCH 04/13] arm64: dts: mediatek: mt8192-asurada: Add MT6315
 PMIC supplies
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_082455_954113_11C34E9F 
X-CRM114-Status: GOOD (  16.20  )
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

On Fri, Mar 20, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> There are two MT6315 PMICs in the MT8192 Asurada design. One has two
> outputs ganged together and two outputs unused. The other has three
> outputs ganged together, and one left independent.
>
> Add supplies for all the used regulators. In the case of ganged outputs,
> add the supply for just the first output.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8192-asurada.dtsi
> index d16634e9f342..318903b112a3 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> @@ -175,6 +175,17 @@ pp3300_wlan: regulator-3v3-wlan {
>                 gpio =3D <&pio 143 GPIO_ACTIVE_HIGH>;
>         };
>
> +       /* system wide switching 4.2V power rail */
> +       pp4200_g: regulator-4v2-g {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "pp5000_a";

This should be pp4200_g.

Regards,
Fei

> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <4200000>;
> +               regulator-max-microvolt =3D <4200000>;
> +               vin-supply =3D <&ppvar_sys>;
> +       };
> +
>         /* system wide switching 5.0V power rail */
>         pp5000_a: regulator-5v0-a {
>                 compatible =3D "regulator-fixed";

