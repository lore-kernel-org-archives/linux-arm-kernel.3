Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BB0FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 07:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=; b=ysrfPlK4FB5Gx27NzPG7rysdCQ
	QB2G63gPwmxnP8CmW/83ToTswYJNZLSyMgm3psXNUmzM4/hrcYFNv74PhqDlbOdOP37iMnsfENvQJ
	qOgKO3X+bSmHjTNxpsayj1GMnXv6CpP892tbNr7xK+VGpepG0qaVij+OLifVvnxJlStPRb/7foSR3
	ccVJqwJB81OhdyvsN5kLWNrI4O/ljtbw72yvNUQwg4gNcpKNlbPzjj+fapbSWf/PBMOmAWuJZVJid
	dVRpoSwmhHKwFzawC/Hd3/kP4/spNS/Es47DsFMawGtT7zlmWTTpezFS+6GkDr+mpC+Yp6kdAY4gy
	8/vTJy4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnpN-0000000CcP9-34mE;
	Mon, 04 May 2026 07:34:53 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJnpL-0000000CcNv-0rxy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 07:34:52 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5a8738c178dso262088e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 00:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777880087; cv=none;
        d=google.com; s=arc-20240605;
        b=kQCIAueCBUFDSOF+C5bRvhok6PtaOe5VuXsnp4040Y0fIlD9SD0VsclVoyMqT500ix
         axF6DhONBukARVEVkGErPxCr8Xvy03JrjSdJgA8FyZ4f6sRUYntL3yWqCIha1WGhhyGZ
         PnkgsPSNYmuuXxcakyA2TjzOnh0YlMvXILNhERz8ey0pWxCCmVs1oigwUK5bIaHr4eR6
         4SUKL81p8eFqoMVPuo9CCgkNKjJJEyMty5os8SobkHGBxW163Zs6Yoslsx2vwRx0l2bq
         z57zVOA3oUHKZTDO00txuMhQn78hTUUdei8OtSb6f64hs7kJwMM8T7RIeu0avnBH722K
         i7yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        fh=/ex4C2s2vpzmTY+BeykR6j+71hksubttLEWZB1ygimY=;
        b=LvvURA5i0oZ8vkVZuRhRzbs8v7jSKOlL6pFvXQWYpG0qfbX7OoMgt5lCpW3x9hmOKP
         93Ja0U6p9MLM8l1jjHpiwvErG+au8fo1bhNIBxthoVrEKR3K4+NOxZTMUcZqiKXqOwiw
         r4BNCHevzhRvam7aGBJ5cjDgZYow+amMrQl9goxlRksPjHaGQ6Au0j1CHimajj2bOwd/
         uu1nuLb0czaUYpEwS5UTxLcvjJ16HJzYBLkXvg9wEC+tCkMWbACP1x0+S90QIoJ7L0u4
         ZKXrjRVp/0EbGM7HuakUe+2LyYd2btx1cbfgUf9IQ2aRu6U7ro9V6wSspZiKnA5MlTOM
         m8eg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777880087; x=1778484887; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        b=Ifi/TiOSGzDW3KbDNlOM6ujNPb9ch44wQZErMA8PEvDaqgUxSzyvG1OXLJDSmhpZo2
         XBrAtWHs3Mt8goXxzyLxsz5JKH0il4UcNPsZMyq1pnYDnsGcBD78vBw+E9E/P/PYBx5f
         Vshcop5NS9hlVyzz4P2JE6FBd/idqM+yIqhwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777880087; x=1778484887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmqoE5sH6WuPce4B+/6WncWE7pwXnMFKOobdKhulk1E=;
        b=c1Q85DvEOMaHCPx6AXcLj0zjtiOlKouJoUndmQPouo903kGoN3g95VQZyFSQXaDaUw
         0Op0nK0e67t6glILIwjX0hkIaS546WeUqXlVorobeVhn68Y3l2Bs1g62AV763jQZmvB3
         nnPq46FSTbqWDwhQuuG+6Ai6yDsKj2oAlKXilC227uA+yN4UgPX8V7GYgCA8/BOOqL0g
         feohfVOVjmgwBJ105fe78YayAAuzIIGsLLHDJ61Zfp5zpXh89hFxUn3ZMXx0cl6RMpsP
         mk7JldQ3dfAAi2AFyInd/o9LAUwQ8ZPf5YVHQO3Xgu/UMxHyBuyB8wC564o/OeujWTWG
         qENQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wYtbUxHiG6UiQCyUgPInhFWDXjyhYJTd3eUo5CMaS3WORG/MjFLJ+VmSEzlKNpntOdKl27m3s0wmWVI0Cyohr@lists.infradead.org
X-Gm-Message-State: AOJu0YytJPDzOPLthO+bw56d2DEO5rEl9q0ILPPaahVjHs0ZqnXPxjlu
	eJuJ+UfYqexJvHoZeUZJG26276nID/YHiA/WkNZIRjzpA16gVRz4IefFvkJUGX9vAvx0NsR//Xf
	dvzvDFKVOZB66Q436PUxsIyN33LHnAWZ2EQe2m+Hp
X-Gm-Gg: AeBDiesiQzjbbS5XwMDJ0rCl6+HVs7RbSlpUqghK39z422cI0uAp0o5eutXspNIZwsq
	bHekVjU0f2UdHLvZt495FkjPfB8W2Mgc5D89Q+xgc12gmJOEFkALPvd32qCQ4/PahoAM1cErXYJ
	EFaGoLKDsKWROqPozCz1fRAjeTciSlIxdUmKifkRWkpdPPQ1meo18+BsQcAjblNF5MbCUxhdLrF
	1esX0AbWDb1i+xoITd/OpWjaM+RhxpIj40xk7yYnMdoMyv78IuRiSGTI+Sviz9+Ec4eGi6DErWf
	b+ZWkCGVqKoCQ8exT5bYJLMVRblOPI1PMs+4mrstutkurY+M
X-Received: by 2002:a05:6512:3b84:b0:5a2:a3dc:51e3 with SMTP id
 2adb3069b0e04-5a862ec11b8mr2434888e87.12.1777880087115; Mon, 04 May 2026
 00:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn> <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072748.2580172-2-zhengxingda@iscas.ac.cn>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 May 2026 15:34:35 +0800
X-Gm-Features: AVHnY4IuKDBbAkS85uOVR5vEB6IDbpI4Sjzup8SfiFFfaDlz9Xmq5t63cjYsvnU
Message-ID: <CAGXv+5F6BSmqq5HEybuCSwt75LVzh5gvs2wQpqy3vgfLi60Dcg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8188-geralt: enable Wi-Fi card
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_003451_297564_2CEEFE83 
X-CRM114-Status: GOOD (  21.98  )
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

Hi,

On Mon, May 4, 2026 at 3:28=E2=80=AFPM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:
>
> The mainline pcie-mediatek-gen3 driver does not have code managing
> downstream device power / reset.
>
> As the Wi-Fi card on ciri is a fixed device, set the related regulator
> to always-on and use GPIO hog to set the status of its reset pin.

The plan now is to model it as an M.2 E-key slot (even though the chip
is actually soldered on the main board).

I have some of the patches ready, but I'm still working out the USB
side of it.


ChenYu

> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8188-geralt.dtsi
> index 8e423504ec052..c25780098103b 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> @@ -544,6 +544,11 @@ &mt6359codec {
>         mediatek,mic-type-2 =3D <2>; /* DMIC */
>  };
>
> +&mt6359_vcn18_ldo_reg {
> +       /* Used by WLAN */
> +       regulator-always-on;
> +};
> +
>  &mt6359_vcore_buck_reg {
>         regulator-always-on;
>  };
> @@ -1145,6 +1150,12 @@ pins-en-pp3300-wlan {
>                         output-low;
>                 };
>         };
> +
> +       wlan-reset-hog {
> +               gpio-hog;
> +               gpios =3D <145 GPIO_ACTIVE_HIGH>;
> +               output-high;
> +       };
>  };
>
>  &pmic {
> --
> 2.52.0
>
>

