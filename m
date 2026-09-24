Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE63CC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=; b=k8xif1OQ9sip7xW0cECtjBDji3
	3E9v1lVV97Qkx1BLds43cRBY+i+zvAiBvNaYSf2muM82Kk0C7RZMS2g/QHCrt5VKjYKdJqbNYR6/9
	7XraNAUItpqUWgTmN7IZJzmT4nZQ+fiSGytAJjpmzArUersEp3wOk+jS2VOeUqLsZXXWIpuH9uXyY
	i6npg6hma+dl5rT7Lu3V0fVMdlUtR50Ys1zVW7GPXs/KiYUZa5KqWcSPBOpUz0YNzTi1TV1eIzZAP
	HyyTvNKvbJeYcIecxSo14wQu+JFUyJkQlmrJOGgtE3Bp+zf6ZTqR9Ef66gBTqHS0aOI/yrBrV8ZTa
	a0McgQlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oiz-0000000BzjB-2Ml3;
	Thu, 24 Sep 2026 19:03:17 +0000
Received: from mail-lr2-x21.google.com ([2a00:1450:4864:38::21])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oiw-0000000Bzhy-07gj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 19:03:16 +0000
Received: by mail-lr2-x21.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso752821fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 12:03:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790276592; cv=none;
        d=google.com; s=arc-20260327;
        b=bAhVZGmvIeFleN5fbLrOUdHeT3kkDBY7FxiR2l48k5YmpUeyDJwbx0R7gX/EUAmR81
         +/duvq6pFC7wHJq9ZhXwtXaMW2KBKvLK5vc1eRdgXDX9JNGKDKpZnMFUsnmM0qm+F3Hk
         zWNK48eD4weQglYIR0xP3v3cNV8e1SWWpqGVqe6d70o4UpVtf1RWkCrqSiG78bSUiAnB
         Z+vSQ0EkkZPgeOswMaQN4D7HvNLYiskuF99gFZ0lAmvv+ylV7ubkkBQ1upC3uNIxE6GX
         uTd0ekFSXYBN3roQBzPVIHoasedeFcuSorCnFTQFEOkurwocRpLJxDGWFemMwD6prBSN
         AHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=;
        fh=/fY3j4W+/Ti7lzgVTgJACpZ/ajmypmWKdNfEzm3aC/g=;
        b=kgtQOVjKgeAF/T9YaJVwJs/2RgU4+GaNF+htlZXQnmaRhdw2wBcpzeHA+8Jcax3uh+
         7x8Z3sqHYyVf4ggXGK2gcRYzxamomsm0+0uLPGJEg37mR5rRHZe8UGlsm9OkLGAG0um9
         8OJ2Vv3oco8MIl3vX9/oRBmYqr54sdY1IOVe1HcZpnS6X9q2nhyAhGjD5OAGW5BFyoAw
         +nxIvuNNz8UHzdZhMu+jxl8y5UFEQg0dBf8cm/VUqJBRiSa7XDduDg1j9sWOMBKBX9l9
         YFoSP0BY70DnLVWXiAeWHoaSWs+KzLme9aG1bwv4O825w4AnKrN8t6xxQVdHq5t5tXN5
         kvpw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790276592; x=1790881392; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=;
        b=JvylZQ4Wvx2cQoaeBhY8d2a2fRkcOmLVSJTEman79KXbDFPNWvGpZvlhPCeAXDXsVL
         OAx9DoDXFicvONLYn8cQ93mQrYkDDBuiarZA3QHiYVw0SBuL/LeiaGivJSnuHhM2Xx73
         k01LiElCupuRXxzJZLrQDuudl3tGN47e8WqcXLQhutRvXw5v5BV2Kv38lNxthXdjH+Vo
         a46KwKtCHQPLLFKUIno7JIzwYoME9KrJtF7BUJRc/3PipCXpQGoAE1HbzvGxxYEqNA6A
         DeWC9ADPxGUMfRLnPdXauXMMiVCRQp/bVZ9M1PL0+aY5RL6U6oLqgMzeS3stOCK5cooS
         ioTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276592; x=1790881392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=;
        b=mlf8Vk3BhJSiJIyk9iByFY2RzEgxqaAuHXkJGXa84qitnbW3xgvAS5z/Pfhc9jOPdF
         veefNqNbZNR9IAa02ea6hOJ5QPysESDriPvLgQxMUuIk0apKwKHpWrXDFqEe5ZilseNi
         Z/D8RI5Jz4cK+cYDr88Lx+HBDKeB15g6PcE7Kn0vj799gjPPTeghQegxzwXM4Nazqa1P
         L6DlXd9g0WGLCgodF3ba9zQ7hmZuQyvxpA8ORBsIRMelSWF5ux/w7eAk80bnLz8+F2pj
         6dljc+KrLVaeFGY4aP1u3jx63PrmC7hPQTEQU0DSs6ht3B+0+ZpO1wRtph8zLHuMrHVz
         Oayg==
X-Forwarded-Encrypted: i=1; AKwUvBxwtnvi5ZNs+uIJ3hmmNhbl7Nhm3gB9mls1VgjgW/ABhewhl6dL1MVeEbCBW5kPeSpYk8tF5x5J0hZcM9bq06hv@lists.infradead.org
X-Gm-Message-State: AFuF++mKqXH9t2zYX7Log9vyTa3e5NrcacB6QYGqu4MIkzkOYPyOD8Zs
	bQyTlE+n6v8refanXfewpOV0Y723UVuCOAoaKOG5Nx/hFHlSs6VpD3xeuv89EO2VGv7ZEmJcOXW
	h2JBZC73SsygDK5s9/Z3USz5QlSACdxYQS5daDJXt5Q==
X-Gm-Gg: AYBFou1Mz5GAKfFYmgvz+jeVp9X4XZmH+UDenlutRUAgILtP5TMhqbRdqGVUgnQdIEv
	zTwo7w4A6GzzdBpHPBY3xBTaFjldgj6UoNr8gHPvc4A7VzVQucr9EiMMWNylH7VJj9jP8kSqP3T
	TwesxygLdX6O59eaIl7FwtkWUuq9z1IrtiIbl8H8p+qF/Kf5SKZ4lZuWdtdV3/PBPw5ZacJ5Sej
	J9uwTnrsp6l41714oSBWuH1O9b7n5bwXp4HDKFZ5Eze1bIgC63ZmmbwCY80B2YP50mIDKC0TgW5
	IJLyf2UjTBxyxtzRFktMwDgc/fNYEjdOd7w7tYQyyy3zKQ9SYdSQrmWcIEoupgpER3A=
X-Received: by 2002:a2e:bea8:0:b0:3a5:b507:dfb with SMTP id
 38308e7fff4ca-3a63c408eb4mr9542881fa.29.1790276591671; Thu, 24 Sep 2026
 12:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260924071445.441822-1-adam@wermuth.pl> <20260924071445.441822-2-adam@wermuth.pl>
 <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se>
In-Reply-To: <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se>
From: Adam Wermuth <adam@wermuth.pl>
Date: Thu, 24 Sep 2026 21:03:00 +0200
X-Gm-Features: AclHuK9IKF3aAn5suDmSsCEFKxWsKS6ErHA9CID8WYyLrPR40kN4mqnvEj86JPs
Message-ID: <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_120314_282365_FD6377C1 
X-CRM114-Status: GOOD (  22.08  )
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

Hi Jonas,

On Thu, 24 Sep 2026 6:12 PM, Jonas Karlman wrote:
> This and next patch is likely best suited as an dt-overlay.

Thanks for the review. That makes sense, as the B-key slot is not
always populated.

For v2 I will move the host1 enablement and the WWAN power, RESET#
and W_DISABLE1# handling into a new rk3568-rock-3b-wwan.dtso overlay,
and keep only the fan patch in the base DT.

Adam


czw., 24 wrz 2026 o 18:12 Jonas Karlman <jonas@kwiboo.se> napisa=C5=82(a):
>
> Hi Adam,
>
> On 9/24/2026 9:14 AM, Adam Wermuth wrote:
> > The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOST3,
> > which is served by usb_host1_ehci/ohci through the host port of
> > usb2phy1. Enable the controllers and the PHY port so that modules in
> > the B-key slot, such as LTE modems, can enumerate.
>
> This and next patch is likely best suited as an dt-overlay.
>
> Regards,
> Jonas
>
> >
> > Signed-off-by: Adam Wermuth <adam@wermuth.pl>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm=
64/boot/dts/rockchip/rk3568-rock-3b.dts
> > index 149a5306bb03..ad9a91c0d0d0 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > @@ -758,6 +758,14 @@ &usb_host0_xhci {
> >       status =3D "okay";
> >  };
> >
> > +&usb_host1_ehci {
> > +     status =3D "okay";
> > +};
> > +
> > +&usb_host1_ohci {
> > +     status =3D "okay";
> > +};
> > +
> >  &usb_host1_xhci {
> >       status =3D "okay";
> >  };
> > @@ -780,6 +788,11 @@ &usb2phy1 {
> >       status =3D "okay";
> >  };
> >
> > +&usb2phy1_host {
> > +     phy-supply =3D <&vcc5v0_usb_host>;
> > +     status =3D "okay";
> > +};
> > +
> >  &usb2phy1_otg {
> >       phy-supply =3D <&vcc5v0_usb_host>;
> >       status =3D "okay";
>

