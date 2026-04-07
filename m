Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B839DEDB7E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 09:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=; b=wn3zyKIZVxknpVPcbKcpjCI43b
	ZbsVXoHXKjsNJGbZ16aRvzBUdnHN4SHtPzMWsj2y0xh/rzSy6pJlURR7qBS54Uy1MXVAkaFpjwdF+
	BdjfVPEJAcAAa5kclCtM1kD+UyPOhFxfSTz+NXvtHJCuSaRYZ7XXn30U9uWVd6js1QIoUPxTU/ZZi
	rZ42nDGTeYRRYWsYoIqzYah51aaa+UcuFFwv5/jix9+yjzApxlo8q50avP1eozlPQJEUoQ8h/sj+4
	g5eOFMqLwrUH3eJKU8cPT3J6LbhuUQBB2Wd97s58cqWse2G29bnznw5v9JAsgkss/p7DcGvpYPGdi
	TSENMahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA34U-00000006FIo-3NI3;
	Tue, 07 Apr 2026 09:50:10 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA34S-00000006FIS-0kNW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 09:50:09 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c76b994f7a8so2041966a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 02:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775555407; cv=none;
        d=google.com; s=arc-20240605;
        b=PHcUuCeZWrredXkki6iQ4SaCUx1POm2zbuQt31NtQl782QCRjCx8dAUyrFdSTTeaWB
         6Agl37uthuYHCiFzEZcZ4jD6z032an0iuDqXu1Z1itteRZJZpI6S8S2IZnEEQswg3MRw
         geVntqhH/FcIU9i5V7xAjqitHe+LjClt+0ORmsw7xOUwruMcxcjHz6eHnIIW8Nb1Oqfk
         KgxttRuZN9plOM+gaP2HwDvV8ju9gKbVhnmUww9qjDhK15tsv3Y2vhzjhpeIX4ZEuyOW
         eC4Sf6oeKYPADI5A/BZ5CPC7vHXS/xuIDzTpVaLs+1H5YxdKQIcqoBuCRsM3yTLJg6yn
         CqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=;
        fh=6+1eqk7mlsaK/2oHy0q7oL62uSWFm4UiNXuu10ZF+kc=;
        b=Lw0ZZKUNFUx97cgDXV2LPCfBD8PT9ZY/Hd0Ciq0gCWyNJzpSywe2NsXTVGJ9pZqypR
         PWPhcKKU4YJbiDxCSPslR5omg/HbNO8mUKJwtqooEjYp5O1OEt+rCGxIycIZfhvVTBQH
         I+BVqPJzCuqt5iKq5eDAiIuX1de4UBa0hK9GhscbxFtT3Jrac5vah0pRkXbY2AbwAnYT
         RcT+SBPjc1H5H3FeyW9nklukcBLCXw4pF2dUYYO8QU44rBc3owaKLBDuEU2n9uR1cmcK
         bi1MxMlLhLpuoptRVKC2YdtsuPqGx7oyEHmUREVkiFMjDj8z1KvnKykabSb0k5Ji1XOw
         bs+A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775555407; x=1776160207; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=;
        b=iZkjzWWQtAG0I0VKJSXPs7zbOQIi5hOhLnl78G3uLEHiFO0+rjP1maxzyuE3URhBib
         VBjIALFGQQzqIDPPsFIK6ON02bNn5lNwq4lHX9aGcMOxxmvvPaqIxgLrXi8WmlymCjKb
         AcxrVDFhIQoF8plfgGfIUQ0BwfjoES6RIAppT+FWabtW6UGc6Y9qHgkCtjsww7Q276sD
         7RhcZ1L/S5VXp0fOXDWqLRLV8d7EXaoTlrQ0QtJYwk2ksnN/+JrQdiyn0v4RRJ2AfjBa
         h9N0navNr2D5HGYNIjfYM/7tdSAdOmS7UX3p4BMaKjFcR9++KnEFVEBAbEGzV2uWlEbd
         wgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775555407; x=1776160207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=376jX0gFHlCYVWXCTvgc/4jS/LPYKaeyewgyhax41kY=;
        b=M5Si/nGnRNnRYrN1q9HQS0iXvx2olC+qAQuAHL+7QQIeisVve27XVUcY9abVp51iH3
         EJbVkSoJyonfYqZjsicLXStpSfX9hHgcbFutR8pC9istswS8+atebscICqIcqCXMZu/h
         kVKUvlIRQ27+DbWDj2BzRZ+TH8CQsUJ/4oVYP9pr7zREfi8Z1W/jYRco7LfAY5acY7R+
         lAcFjZSULhJKeSV9V4JhQ1VykN21fn3qfbUGx7/9dPM6EopIHQL4OF9MLol1Wp8yo2jA
         jwgZ2D5BJL9C2MFUhVlk9dtGq230qlsjjceihUQi/qfQB9+brmBdv7frqJ4kR335cIXS
         v7Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVu7kObVVLjvrPZkrlrgT6F8GC1hbQOabK+vW7tuXl7rQXrCgZ623HcSHSfF0w/W8BgBF25ej07O21gbcO1RqAR@lists.infradead.org
X-Gm-Message-State: AOJu0YxQqKkoa/RHsHLgiOCtPRNm3W47Aow7bgiYWdnISpAf7wFGwXjf
	qypW8BEygOeGIeAclRRD+ubaK99woXCy6XYVsKjTgmuS7lHXndP+3nLt2qM4QWpFffkknVWMbBo
	QHzDvGcPIVvpdVHVIPPKVXkFgao2RPZc=
X-Gm-Gg: AeBDietKqUuUug2u2r+jkQurBPRoRkt6qEr5NoRtCX0FJyBTuSO0VV7btaMKDteOMli
	7WdhHYzEUTR4i3vPpKBsFcUEAWmdF74rhOj+r2SsZ/Vc2Cjecpq7akLLRGf1KVeqanu/64BcOTI
	SKWSnEZV3/6dp0q1xnThtVQsD24fxa2tL1d9iLIJlmpau6BqorYlEGs58v0ahtKaDdhY1JCOW9n
	PNcN+6uIeud7LUA3AwMHGSVTj94s/vUUQ02D/Q6qPnFMWIdIobI29m5Vcjs4NPXgVn66quPhDUm
	k1JXQ1Y=
X-Received: by 2002:a17:903:3b8c:b0:2b2:ade7:820d with SMTP id
 d9443c01a7336-2b2ade7a263mr29495345ad.22.1775555407014; Tue, 07 Apr 2026
 02:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com> <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 7 Apr 2026 17:49:55 +0800
X-Gm-Features: AQROBzBDsI8MMkaElAEIhn9Rq7nCFmivdfNIApAyidNH2a8-Ops7NCH-H1ksaJQ
Message-ID: <CAA+D8ANg9CEpaGGpUQ8D7AWuMkk-A_+HKtedFAp+ZYxHMV_MZA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: imx8mp-ab2: Correct interrupt flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>, Peng Fan <peng.fan@nxp.com>, 
	Fedor Ross <fedor.ross@ifm.com>, Shawn Guo <shawnguo@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_025008_229838_C4E8CD72 
X-CRM114-Status: GOOD (  19.46  )
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

On Mon, Apr 6, 2026 at 2:39=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning:
> 1. GPIO_ACTIVE_HIGH =3D 0 =3D> IRQ_TYPE_NONE
> 2. GPIO_ACTIVE_LOW  =3D 1 =3D> IRQ_TYPE_EDGE_RISING
>
> Correct the interrupt flags, assuming the author of the code wanted the
> same logical behavior behind the name "ACTIVE_xxx", this is:
> ACTIVE_LOW  =3D> IRQ_TYPE_LEVEL_LOW
>
> Fixes: bf68c18150ef ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP=
 audio board (version 2)")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for the fix.

Reviewed-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Best regards
Shengjiu Wang
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mp-ab2.dts
> index dbbc0df0e3d1..443e4fd5b9bf 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
> @@ -281,7 +281,7 @@ pca9450: pmic@25 {
>                 compatible =3D "nxp,pca9450c";
>                 reg =3D <0x25>;
>                 interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <3 GPIO_ACTIVE_LOW>;
> +               interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
>                 pinctrl-0 =3D <&pinctrl_pmic>;
>
>                 regulators {
> --
> 2.51.0
>
>

