Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943F8CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 11:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=; b=WoH9L4D6FnHsvotsbsUcIC8OI9
	HbH7qI9pmNW+P7JHBKEwWVSm9P7/h9n/x1aslfp80EJuCT1hrRhzkFUVCpEnqBbyEZyMcJbGfPmzp
	Z+kBU0f6xpkIswkhF+7347fiRnTkN7porGSQdWWGnM8gUfCAqC5tE7uPTXpytocZskm50Y7FIWXzB
	jmO+sJASodrMEHL9LvVHQt5h7+49Qo7fiiI5SxQ0WGxLjoUm16n7xb7Q8n7CcpaIfai6qvbWsJysQ
	vsOThy9CYglUVgtTCwSiwNRIr1aj33Y9x+bUWf92KOg1u9hTXwNqjYgfGGtNBSv3tL32SXVkfSFcC
	p2+64zyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQO3P-0000000AdSe-43ow;
	Fri, 22 May 2026 11:28:35 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQO3N-0000000AdRv-3LI6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 11:28:34 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-393c40246afso82953861fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 04:28:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779449311; cv=none;
        d=google.com; s=arc-20240605;
        b=UCl6hZzsjbqU10mkHYO+dapxRe9riKfI+SdDKFZYYK+TwvpMCJGcSIjSwxp1GuOhT5
         fI0FsFxWFKn/w8gUsnlqYS6nR6CtHL6th8EFbukQxaMiJKeP0lc1KPVtXOfV/4Oc6dwT
         LWmxDM4Yd+i91CKjcpqg1yM+KRXid361TA6yEvv69Sqtssl2n8PKntsmw0JBLGokeiRN
         enZIEielorHDiGUyId/hV8F5yoPwH3Z2K80lBP4C5bVwyzNRQdR1+oEFRJ1kZ35+mAGw
         +ZqtwGOm+6J0D17F9DqBNQBOO4zeCRhUmS/t9xHd22Ad2263Bb4vLq/awYNr3nDgiUdD
         RgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        fh=7H+PZFf3HFHBd0YqodH2sSPTr5qA34pj0g8tkvxK1tk=;
        b=XWOQvSBlp9HukJEDklGkFc1sjxkZPMaUUCLoaXJY57IzrHtmZa8YQvrrmu1W+N1rua
         f5RBYmv/Uz+dfGJVJqliJ7byktZ34mWLWTvpmIwJOelhD16ZoG0FCjJJWJkKX9Z0Cfl2
         8+BqonwDTyOx7D/5PNfQugkXbJfYD4VpDFX8SjVdfwG1s3rOxm17TeQzeHGanL4+gmQD
         /H5ZZv2cSMtmsLcK5+3KLCG+PVVNf5MeBXUAesnl8DIOBLgQiW3Jx+MtE61KNxLo5TzF
         tak+DDA+oMhWv/o8CzaKqwpa6Wv2EHmaN7NJ7qtYVSB7+q/90hkW8j0Z3Lx26XJBepbL
         cjaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779449311; x=1780054111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        b=g3TAVicF0VtPCLHFZ/lkHClqNHG8fstvzr6CKJ3y/4TmRY3g9O8fj23yWpvTCU7oX9
         o3ByFxjQQQ+oxfIX16ZzgRptOcPSJTm7qX0Z8rvufa2SWMUz6KK1I8Wx0zkYVgsNkLzl
         N/OGEvgLyRwrEpScVvb06RHPVlNMZWnztwi/8xr5eGepuCFqS2ffTPOqvPgMLE3Cr1Tw
         gHW63sSW1FgHlmlLuUpSndoSjVvNfMjwuWIo8tXBl4W87o/WQHAQj8sDRY47rg/dYufe
         qAjxdg95JFesHqsysJXVxCFL8hHrlQnF5ksE7m1/XSHaoUBLP5cHp/ZDQ8qZr3wsCYtK
         +b6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779449311; x=1780054111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fa7dC+O8YGHKdhROB6LlQr8p2/+2vxZ+5YIvHDJ13XM=;
        b=GDvQFfdBOvhEweHb9bwi5I04uN7Nv/zqFOHvi20ss4l00PsaFvxfrBxTXXtk6LxYrN
         LEBDokMQRhXTeOeNvI4H8cvc1k6qNQzwjFBYfHn0soOmlZdBnVQOl305iz5Nk0u6REeK
         022F1Pyig8xX/iSY93EdFOlg+bo8wkRPLM8elysPlKFDaFdVe+fEAeNsCYe666wwBCf1
         wP+m0ncEcOcYNlrqzsrbj1LD88MYJRXA5DP7ROZy2C9wifiJWdUD1DU4SZi3bU4AEUeI
         v0k0KfkzrKrW8L2owlDF62cjc3DfOOe8FOUpib0CU/cBlI32Lf9HEactOeXsJlGEumDJ
         aqjA==
X-Forwarded-Encrypted: i=1; AFNElJ/9yWv6hnHDAA8vpPd3y77sT0jAh5Y66uQdpBYF+i5MMjpjzCs38uP/W0ED5nHwC4LR67SBUFKgqV0qQxDUcPCU@lists.infradead.org
X-Gm-Message-State: AOJu0YwMFuVTEb4qsDRhgzq6jFko7qQQNLwJMyMgG3PvEu0eUNQ5HcX4
	tzcnHKFlp6uowJdO42Rnr8Hofo2K+XvLHC8VhPJcx/7yJtWntp6HSpmU4t/ypbrXDRK6KKp9YUT
	k/yGUyD6TSrTp3jZPfjzq3C2xInFw1Mw=
X-Gm-Gg: Acq92OHQpMCBOsM8xf3ri2Vtp0e6rNfxIx3rjUNAOZ3Q7odPTqogAUbo7g6T//9mSqm
	FNwv1CwLABhIhf46naLmQ9x9jU6xUf2NHA6tUPsHW0gkEdOoAsIc+8+9f9m3lcOElqX2gr9HJiR
	5/PL3NkKoi1UV2eipZF5FAZztvkpQF7iu3LlI8qWN/R6Dw2LeQe6m+HsqpZc8tDy1qxmc+5KND5
	q4KtxzPGQrMMx13XgPxpu9CoQWOuxER/jsK8y4jhHtbgBDwodCqiuV4RwVw+ks0ZyOjz5xoG+G5
	6W1E9gGGhKUgMV4hdF2X6gG7OZv4mpSKh7PSsUJZMrM7yRXykUY1uRm2W+0QIqwKz4iei91h
X-Received: by 2002:a2e:a9ab:0:b0:389:fa42:b266 with SMTP id
 38308e7fff4ca-395d891aebamr11019001fa.11.1779449310900; Fri, 22 May 2026
 04:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <20260522101653.2565125-15-paulk@sys-base.io>
In-Reply-To: <20260522101653.2565125-15-paulk@sys-base.io>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 May 2026 08:28:18 -0300
X-Gm-Features: AVHnY4LV1-i2NLucbS2YgdzZXBX26-Ma3QP1bn3Gx38hCGfG5dS4UR0F3rTTEKQ
Message-ID: <CAOMZO5B+vaoXM1F+avtcdo=_tpJ4ZZfCcNCqaUo=KiQUw49caA@mail.gmail.com>
Subject: Re: [PATCH 14/14] arm64: dts: imx8mp: add VC8000E encoder node
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Marco Felsch <m.felsch@pengutronix.de>, Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042833_852958_7C59CF60 
X-CRM114-Status: GOOD (  16.12  )
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

Hi Paul,

Thanks for working on this.

On Fri, May 22, 2026 at 7:49=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> From: Marco Felsch <m.felsch@pengutronix.de>
>
> Add support for the Versilicon VC8000E multi-codec stateless encoder.

Typo: Verisilicon

> The IP integrated on the i.MX8MP supports H.264 and H.265 encoding.
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

You need to add your Signed-off-by tag as well.

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index a3de6604e29f..4e63c2b16c1a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -2290,6 +2290,17 @@ vpu_g2: video-codec@38310000 {
>                         power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUBLK=
_PD_G2>;
>                 };
>
> +               vpu_vc8000e: video-codec@38320000 {
> +                       compatible =3D "nxp,imx8mp-vpu-vc8000e";

This compatible must be documented in a dt-bindings yaml file.

