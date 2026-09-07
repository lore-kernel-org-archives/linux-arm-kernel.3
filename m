Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC5BC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 18:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=; b=Lh8i3st/J4kkuTXCy6nNSbRhUJ
	qrVKquVrdqW7c+ZCs2MbOP0HosuJ3WacIPiicUNRovMw8dBlmefderX2EldETF8YCo42atIVvi9gx
	2eXjZnAPp4ArUS1vYAdOcYe+mnDsB2zb4OZTh6Gcfl10ERy3BU8AbP74JZTQG3MqZJZOnoRSgGQLJ
	nzAKNhQ09NMTSLQN8mi7ZR9+DSTxePgKlaHPLcFB2uoee2VWO6EKMW1k0ZDJvPfQpM3lmglxSydiM
	UOvwW4rUcZyEk7sQUWJb+HsgM4T8GRHaMea7yDV5JatNN8ZceF5LbagUwDB92acTgOceQomVexsVX
	j/VOT2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eMG-00000007blh-2pBb;
	Mon, 07 Sep 2026 18:46:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3eMD-00000007bl4-3ko1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 18:46:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4957eefd361so30176975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:46:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788806775; cv=none;
        d=google.com; s=arc-20260327;
        b=ee+pFrW1ayX4oMC8EIR9Yf0D+N/0aRQQZNV5QZUccPxT/BoJDYGsMN6yNqLyQ7G51u
         VcRZeMT9F7fxfQMKG+q17qLXCRHVMhPDIFHGRC4SB6nsKbGACxF27sNs2VHwx5YevEcA
         GBVD0NraplXbx/hUs8ajs1/2wm2ku1xlgmlcyLZduzQS9hS9A1k8kUyTSIIcrqJ+4piy
         ca6WGm9Thc210ebnSTVPRhjQY7HMYgQe3Q5E0Riue4492P6RE2cCCx7HaBDDosomSF00
         cykgmS3947S3017JOMTYYNWsw15a/+GQJkj1gElhbr17P2OOMiKnuUZdebkZGwyEJcYx
         YBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=;
        fh=6qVqNqYx6iaDq5i1or3SVhsnQems2oijlI3gd3IppKg=;
        b=EodI2y7Dv8TezwNoGhmfmi0Sel/BI6l1E2ENxps9ZXeIYBQmx/OFAsZKZNxxh8Ixnb
         6ybiEngLAhC6uIgh3omYayQ7JQKngWEbLbnd+66aZzHcyJF8RfQiMdEDE6KDCSA7udfO
         bUodfxgApZ0ZZwfzo7wuuEgy+aYg7oQSr7ZGQHZVPb6dp74dJcdsXRKNvJ4VfBJyFYT6
         4NyJVo4Sltf3iLV3/DfMu5LroFWaYHOKUVEVbS9TknOnljXXlSQu2RNVnt9gzAw4Rv9P
         VdugbMpV+pGMXJPt016v1afbLpeQvEZBI0oDZGKpz2kJCyP4TkGRLOLRyKfPYhw+I2oZ
         XGEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788806775; x=1789411575; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=;
        b=UwAwtqlwh6iYgxi4maIS7mJr2hgpFTh8xbMeyYgFo2DOkGzcR6Hq82AbnhVutKN27m
         /WLzHRridplh7hNYNvj7L6qGi0LBLtLmKOxWZMWU33xgZBza4N+0c14d8OjFe1GtsLI+
         u5/4ZUQ67/IHOliU3zPsCeLuigaYnfgV2UM+xNkf42sUoG3TNOPzMPXMGFmko2LN3W0J
         0dIB1g5HrkdyFzCUIioYEC5ZmmqPgkJFMoKnUoSsirMegQO8z7q4IFk27CRH+klV5Y5r
         HgRx7x97alrBAo9cWioDqt/0sGvoWNxRfZT7c+lwOrByzNF17hEzynCq7pC0q8/qA8oN
         eBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806775; x=1789411575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5tgil3vkQ8CD1s0t9IPIfXEewAuekCe0/KDn3NFVfRk=;
        b=LTRzAhH+n1D81hrvr7LjNHcpX2gcZC0odnAijjPxZExkFeYqVF7ijrmuUii+0wlPKR
         tD54IS+yWLL7BcFHzrvQuHaOd/3dt1CXXP59LoGn+6WYsxInCL2Mka/6U/ULZrWJCKc6
         k70f9kyqAVmX9LSKV0dOM1AfzZ+MWTlrkr6Hh2zFgrh2+QtSRNJT7ybY0lksNijRDOTl
         zvabwY4lz1lwu/5+NqtGt2Dc6bAhRdkhQ9zZuIR63BRSgpjdiqAVPZh3pcRxvxesHGg1
         zCMKxOsHzTciH/yDsKbEo6P/eDvWFLFk+dJjYjZIRLlDzVa/zF9cdF7JJJx2bZBwQzV3
         AySA==
X-Forwarded-Encrypted: i=1; AKwUvBzA0IC4RVhVR103Fg5ogEqGXp43mFhCi49jmUN4KFlYi6QStvLoscXDFwhe3VGYwa5Zl88zySEUBMl+5uuS4zCW@lists.infradead.org
X-Gm-Message-State: AFuF++lukOGf1zd2QYo1Xx6W3fXou6/cbuHHeI6ENxD9DHDhq7tcI3uR
	QdRoAgYAML1gEUu8JU8RLNWR4TfwOVpsyorBoiXwnNyDcvKxRc13lxsPi6zXz1l+gdyDotHTFv9
	pLqB9UCld5UVG2E3VKx98t0huavh0ANE=
X-Gm-Gg: AYBFou2YtRjcgCmWAVBqYTlJJwJMYXzsr3xcg65x/35zdaFQWZ+kTBMB9qE6TXY6Luj
	uJJY/7+/UTjxPW28goPbjMc08WUUNtzhSGqewPc+wWUsc3iU/La8oLlDxZ11qbu2ZTfhwT/alBp
	hST+bfgHwqWgb2bNVfDbe7LRKvz+wjqfqUX8OUxFGMexYfLqDHRYucBzVeBGMHctpIxSgFyM+Fr
	Z7oA6xxlrBoIbR/IZPmCjFnLMFH8l3HdNKuKDt6qm1664z4QJQAV96XUOjl+y7ZFPHKlUy/Map7
	GQk5c/jWMlfb9U4E59GXM6LoHJfHStoFB7ubeXQQvu/ccYZ6Pp/D9MIm3ctx5NttWt5XNMW1kk5
	hYZ9PGMGIKToElljHuw6VABpOMxA75aQir7H6ddiLEp8=
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id
 5b1f17b1804b1-49cfc6ea7b4mr221188365e9.24.1788806775355; Mon, 07 Sep 2026
 11:46:15 -0700 (PDT)
MIME-Version: 1.0
References: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
In-Reply-To: <2a759a486337e4cc8156bc94079471a6552faefc.1787669487.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Sep 2026 19:45:48 +0100
X-Gm-Features: AcwNN1XE7uW2eXf-zpDN13rtRKPngwcstajdD4PloW5l674McTr-7H6fGfJLoZs
Message-ID: <CA+V-a8uXz6ehq3Mdgri0zT9we7kE+=-XZjahfVg3BBu4NGxh2g@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r9a09g047e57-smarc: Update CAN transceivers
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_114617_996230_49EE2A91 
X-CRM114-Status: GOOD (  18.14  )
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

On Tue, Aug 25, 2026 at 3:57=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The dual-channel TCAN1046V-Q1 CAN Transceiver on the RZ/G3E SMARC EVK is
> currently modelled as two TCAN1042 instances.  Improve hardware
> description by describing the actual transceiver.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only due to lack of hardware.
>
> At least the TI AM68 SK DTS should be updated, too.
> There may be others ("git grep -wc ti,tcan1042 | grep -v :1$").
> ---
>  .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 25 +++++++++++--------
>  .../boot/dts/renesas/renesas-smarc2.dtsi      | 13 +++-------
>  2 files changed, 17 insertions(+), 21 deletions(-)
>
Apart from the sysfs file name changes everything works as expected.

Old path                                               New path
/sys/class/phy/phy-can-phy0.0            /sys/class/phy/phy-can-phy.0
/sys/class/phy/phy-can-phy1.1            /sys/class/phy/phy-can-phy.1

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/ar=
m64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index 469a6282b2a30c91..14f5834082fa500e 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -112,7 +112,7 @@ &canfd {
>         channel1 {
>                 status =3D "okay";
>  #if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
> -               phys =3D <&can_transceiver1>;
> +               phys =3D <&can_transceiver 1>;
>  #endif
>         };
>  #endif
> @@ -121,22 +121,25 @@ channel1 {
>         channel4 {
>                 status =3D "okay";
>  #if (SW_GPIO8_CAN0_STB)
> -               phys =3D <&can_transceiver0>;
> +               phys =3D <&can_transceiver 0>;
>  #endif
>         };
>  #endif
>  };
>
> -#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB)
> -&can_transceiver0 {
> -       standby-gpios =3D <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>;
> -       status =3D "okay";
> -};
> +#if (!SW_LCD_EN) && (SW_GPIO8_CAN0_STB || SW_GPIO9_CAN1_STB)
> +&can_transceiver {
> +       standby-gpios =3D
> +#if (SW_GPIO8_CAN0_STB)
> +                       <&pinctrl RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>,
> +#else
> +                       <0>,
> +#endif
> +#if (SW_GPIO9_CAN1_STB)
> +                       <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
> +#else
> +                       <0>;
>  #endif
> -
> -#if (!SW_LCD_EN) && (SW_GPIO9_CAN1_STB)
> -&can_transceiver1 {
> -       standby-gpios =3D <&pinctrl RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
>         status =3D "okay";
>  };
>  #endif
> diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64=
/boot/dts/renesas/renesas-smarc2.dtsi
> index 696a933af808a8eb..826a11ab93c7a253 100644
> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -44,16 +44,9 @@ chosen {
>                 stdout-path =3D "serial3:115200n8";
>         };
>
> -       can_transceiver0: can-phy0 {
> -               compatible =3D "ti,tcan1042";
> -               #phy-cells =3D <0>;
> -               max-bitrate =3D <8000000>;
> -               status =3D "disabled";
> -       };
> -
> -       can_transceiver1: can-phy1 {
> -               compatible =3D "ti,tcan1042";
> -               #phy-cells =3D <0>;
> +       can_transceiver: can-phy {
> +               compatible =3D "ti,tcan1046", "nxp,tja1048";
> +               #phy-cells =3D <1>;
>                 max-bitrate =3D <8000000>;
>                 status =3D "disabled";
>         };
> --
> 2.43.0
>
>

