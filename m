Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BDBCD3426
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 09:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=; b=FLGzEmi8gi3a2sU+Q7xmxZN+Hc
	+RQTahZPwkz+zGVlnPNXBFrD2Qa9eQQfo38Zy89pRrUPdRe+bENkrck2VOt/HALzkQAa9Uqovws8c
	NF80OkH4LUayt71DNnPkPhaEduz74e8HA4r4esE3mWOAwOUDJxIML3/Fu0kz4n782mytZBudFqSOG
	rLMNKY8pJDgizUWM7tLFIKBvr0m5aciKXQi8H9ecGKRA0c96IDQB/l/E+N8m3S+MdZ8FRQNTYpZ8B
	OxMkRJhiyRWMHnpaucAfm39Bat6znot5H6mnuOC1cPe2r8m2iNOUieJ7Ru4H0xNen1a0vJIY6U/vR
	o/RqmtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpni-0000000CqKk-1aIj;
	Mon, 04 May 2026 09:41:18 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpne-0000000CqJ6-284Q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 09:41:16 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a877510541so289707e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 02:41:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777887672; cv=none;
        d=google.com; s=arc-20240605;
        b=huAi+1Q99IE0lHM1llur2rkU18SMli2O86PaQ+tWpFbizgOSB5PoP9XvLdB7go6gSo
         FN5euutYqongAjU/HwNP+1QxTzkOXSO+bpKhtkrB+i9Atunh0LlXPnwf7lu4NecOCsQj
         BhvX6AiL3596OfRT4BJzRDTrekYG1CbAYuVhrIsQxlFFLj889W284z9qx3xIWIka7CI/
         IiD2T+2k0e655lWyirwnMx2wOvf+DNHjioVJEbyN9512pUycxXas+LV+1wW+xg/LlGe9
         KMzcbkwfeWSRQ9+4sodAhv/hv0OX3p8uPZ6JgFU6whRfEvgGh+RA4Hu2+WXPp3sdOJ0x
         l8pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=;
        fh=UY0sqy8OARjJOh4Xxr+xCZGYXzJT00vtOszcY/8tbnk=;
        b=crmhyEUBv/VSaNASiG61ZQ3+QWQ74QMoHPwCuw41PGnkc1yBXPesZk0TrNJGQbjD+I
         yusOENHeq8skmmUz36/qC+IlHOPYnLahs/TwttGSu0xz/YliIt2ypDLhKkZtRVrU89BP
         IroQJLoEiFtWywn2xLqJ7oAKyXijSXjrLae+ykjX5FqZ6xBFDS0vit02r+TMuoxpzvSb
         E5XrXmMS0XMB25ZaNLLvKh1eNZPVCIzz66wj129+tmGgbZQtIo6dxiJUXIb5SfCrXNVS
         u7jl2Y08pqzHMyrX5KD6oS7W91HYq7H1j50+UGWEqry7uGKoaBam0+vrqEX8ZsuCo7ko
         CK4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777887672; x=1778492472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=;
        b=IdSPxoqVRaXS29cHfHUtbMxqlzfalyYRGLddSPSBKKlyuEY9oAbVSGuLEL49AnmzeZ
         Cs5htAmY4eJuha+EeTxEo1D+55hwhl3gsxFQn/WEYLfxHebN0WoowWWikLXc0TEpC2r1
         yaTIqiYT1un4nxGjT9V3kXPPy+bVBLe3aZJJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777887672; x=1778492472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pPRPoG0bnXrUp5Oogbu+VyQo8WCBzCtv1bsnZQz2h4s=;
        b=FhVe0nKhQV6FkFRByi5S4uxo25sXqwT6sRbJrnlr9j1feE5hUmfaxS4Qn1vXghHvLJ
         PsRqlrFFyumSiMYo2MaUzNupwSLpnNNTWiEQpb7Yaa4AWXydphO056A67jfsm+xH/svg
         DFJUfps5f/shLniTD2zzN0EBtPVdNFUtTDm7YjylULPOhF5jcRNwUK8qS0MkvmAJd7P7
         VqbUjV5VAJ8++FO0R4q2/Ac+wa2cU1Wp4ci5tDDdvmhb4/wS8K+ohEJ4FbxX+6up/gJF
         e2rfRDV9kozPQ0hucgbSAabk9T3xkD97VwBzdrnrEznG4J1QAU+w8V8Kt3K1uO/sr/8M
         fKkA==
X-Forwarded-Encrypted: i=1; AFNElJ+Ln54rxlTyjPIkdKYeXR4B/v0YjIBVNeg1VvHQsaSOXNMGDECqCNvAoYI1e1GrH/EW92gfnjlHZozCATkHU8Rj@lists.infradead.org
X-Gm-Message-State: AOJu0YxFFB0O6DuUNuAYf6UzJ7VP30O7Y6ElomjkjUOrhJl48AZ17Tai
	BqPV7IGPb324kvD962PzJD2VnLwq6PpDBWIDIYaDo7tDMRLA927NfUaNfm62j4Y5MQvKUrEw7Qb
	j6nHXFUNPA/Vkohe/C2hmoLm4X7Edtrype6A+KvHM
X-Gm-Gg: AeBDietHHba0a2EH4BecC7qheCUElIRIYiA9WtFLesJMIXwKzYIw2Lt5iiWSsh074HC
	w4fe6eRqkq98XVE72AJmeHHD+Alzhlj9CYK0/ty3vCszkmgKc4MVSS6R3fkmupjV7GwE7B3qpOT
	IUxhjIqEGHDimtiRE3WdM/zie7zlRjgZe/Sr9YZRBP8BekRSuzrN0VaMQpsgQC2ezx2FoT7Jj6f
	8Iz2r3mzXq+KwIWUIZIi1Pg6NQs7GAcdIFrTZRu0OWAOVf6/Spy8sDFsCHnem2dKJRgA1IvqJ9X
	hXM7ffDNSDTGUwRETsvUPItw0jbNeClUcnX/dPldmzJsBRHe
X-Received: by 2002:a05:6512:400f:b0:5a4:304:43c9 with SMTP id
 2adb3069b0e04-5a862fbd635mr2676512e87.14.1777887672100; Mon, 04 May 2026
 02:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260504072846.2581096-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072846.2581096-1-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 May 2026 17:41:01 +0800
X-Gm-Features: AVHnY4L9QFY2fxGccmoY4I5c6vHRXkexmo_pKFyAww1n-29lZtiDvf1w1FXMeYk
Message-ID: <CAGXv+5FvdufzjqBRQnnG3y8FVW9bHL47CVv_=e7GbVv2d3eEuA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: enable touchpad
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_024114_663514_8AA493B5 
X-CRM114-Status: GOOD (  23.29  )
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

On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> Despite the Ciri device's touchpad is on the detachable keyboard, the
> I2C HID device seen by Linux is emulated by ChromeOS EC and always
> present regardless of the presence of physical touchpad.

AFAIK it is actually an I2C HID device on the detachable keyboard.
The I2C bus is "tunneled" across the EC-EC connection. And if you
detach the keyboard, the I2C device will stop responding.

We have some downstream trickery to deal with this:

    https://crrev.com/c/6040044
    https://crrev.com/c/6040045

It basically involves registering the I2C device when the keyboard is
attached, and removing it when it is detached. We haven't gotten around
to upstreaming it though. I talked to Krzysztof about this design last
year, and I believe it was at least acceptable from DT point of view.

So this patch is somewhat incorrect, in that the trackpad should be
disabled by default, and its status should be toggled at runtime based
on the detachable keyboard events.

Otherwise if you boot the system without the keyboard, the driver will
probably fail to read the HID descriptor.


ChenYu

> Enable the device in the device tree.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index 8e423504ec052..8f801454bf84c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -460,6 +460,18 @@ &i2c4 {
>         pinctrl-0 =3D <&i2c4_pins>;
>         clock-frequency =3D <400000>;
>         status =3D "okay";
> +
> +       /* The touchpad HID device is emulated by EC so it's always prese=
nt */
> +       touchpad: touchpad@56 {
> +               compatible =3D "hid-over-i2c";
> +               reg =3D <0x56>;
> +               hid-descr-addr =3D <0x0001>;
> +               interrupt-parent =3D <&pio>;
> +               interrupts =3D <148 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&touchpad_int>;
> +               wakeup-source;
> +       };
>  };
>
>  &i2c5 {
> @@ -1131,6 +1143,14 @@ pins-bus {
>                 };
>         };
>
> +       touchpad_int: touchpad-int-pins {
> +               pins-ec-ap-touchpad-int-odl {
> +                       pinmux =3D <PINMUX_GPIO148__FUNC_B_GPIO148>;
> +                       input-enable;
> +                       bias-disable;
> +               };
> +       };
> +
>         uart0_pins: uart0-pins {
>                 pins-bus {
>                         pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> --
> 2.52.0
>
>

