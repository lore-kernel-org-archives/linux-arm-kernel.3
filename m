Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE127D25039
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ph/Etg5Sr0NTZwxuYotbPw8N7SzYppkUoPjd6ftsrA=; b=Qla9aeHmKwGK04QQmYiDSkaIXu
	aghVWnd/q5MyIwJc1sg3+LEzxlVyvYIbfTuQknSa9MtL1EHHsaDPH6n3jlOyLbDky5JVQJIyvOKj5
	RZoKsIWNFNxjyycYnEvDqnSZz0xZ4SBpPcOa4+3i8ZVagBwl6HHMgc4qliJg41HsDCB4h0BinyEiu
	NWD6giNTV3mlf01xOJawYF3hcNXeHr7EMA84ACCty37+zhn+BUhjAdJzI+P/YcVvWwVN65ySUn9Oh
	5o3oSiIe3Alzn2TcmhNCKjSYtloujKFLV1Bq2S1PSZf2oogiAl+hwQIBX6emJpCEpdZ318qBunNkU
	fh4zPx6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCDY-00000004rpS-3kcS;
	Mon, 12 Jan 2026 07:20:00 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCDU-00000004rnM-2SiE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:19:59 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59b855a4700so1379181e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202394; x=1768807194; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ph/Etg5Sr0NTZwxuYotbPw8N7SzYppkUoPjd6ftsrA=;
        b=ZJnN56CQKtAOWtoBsf0h6IIGScTeyNN+ByjI5IKHPAklu5AocR19tW9hu3aC3fvqv1
         Vp5jlP/+Ut16/oUiod4oMQb+X4tPk0QrcgwY969/5N0TwPwhnSi8ZBUKC6sFIgb5dK1W
         p7h/BR0/+M57XxzizRrPxq1OXHUns632sNVFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202394; x=1768807194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4Ph/Etg5Sr0NTZwxuYotbPw8N7SzYppkUoPjd6ftsrA=;
        b=X+7ks253QtM6uJKqRKAFnq2LIFNUI3bBlM+uPLZNQB6lPd0sMg3bx/9sbxhKx7SM5O
         vionO5Icy23mNa1hK+V5SzsSPaRan0CD01d5YQZzEiWgk4oHyd89JeXgF5QRWbxImwc0
         vvlUiquJ+hHTv5EzTL/e+ja6dSJedFj6iiRlcFUfZme+OaJSJb4iLO8WDolWoCedehfr
         gJMMPNAcuteM/Nq6zDXrrm7sYVIFCMbNKXfE9PZRh9Epehk16TNIEmHNbj8AeD1EvmAI
         6ZaKbqJJ7UcEvenzmK0Eh+Wlt5Bxr+LsPiawD6CT3rBo4pjcAOxlMD8ZPw+UaE+uhWaW
         gzyg==
X-Forwarded-Encrypted: i=1; AJvYcCXm+qcTTD/ga7yPPveb1krRjvzhLl60Ytd5352yyxyej+DpCrhGu37sJ2N+u/zGVQG0hmZEAN97lwdiRXvmRN8K@lists.infradead.org
X-Gm-Message-State: AOJu0YyFLbsp+8sqSd+XNgoIavBlUz4DgV616LiFh9jgNPH0D+DivAg+
	d7fjMVsOjOHSJOQLHq7RfwP4bzOmIC6JAGQ2M+O6nXyek+x+xwFze/LIY9yO+RyvtMez5NAe8RC
	VB2p925pD8Aix0ljlhT7Rvm4SGFtpdIfkzYd7BSZD
X-Gm-Gg: AY/fxX5m+7WYF7XvzF/1Nsz+HFP0cSsN3RErfw1dd4/VQ6F8JwzZNyFq0fxgIFTVeaS
	T0Ys0R4gZ8vmc6c+oLDygt59wdBIQyzvEirl2c/E3SVslzsg3bIi2WKntv6h0tead3E11E0PJmR
	zIsdkDMLskU76QG8zSmyHOFSZLIVCbRUZsYB7QPY4BeFRJ4D5WpLAugZ0TcJztgIejHxhhZmnMV
	3S/n0WxMwraM/GM3skm7tRG0Vz2BE4ovnnUP1ZQIFqMmdQoG/akwyq9/lJO7uRUpmKweLt+Oq12
	b88D1NUwIN3IQyHJJyXrjNpQ
X-Google-Smtp-Source: AGHT+IG5kl0ZwX10KZuxnttOREwQR6GL+Z0E9J2N56/uwpX3vjlGU2NciA+itFAj/Kp8QX6ABfil/wuy6GMvq1S6NvQ=
X-Received: by 2002:a05:6512:3d1e:b0:59b:85ea:5a6 with SMTP id
 2adb3069b0e04-59b85ea063emr2341817e87.49.1768202393448; Sun, 11 Jan 2026
 23:19:53 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:19:41 +0800
X-Gm-Features: AZwV_Qj1Q-eovEPEvCaFCrkejPJ97W98r-3qCY7fgi6Nqe05K80d4_P2-yj-wb0
Message-ID: <CAGXv+5GEdqgbr5yPJ4_7gBKsg8=PkBvFCvarp+=Qcsq8kqWR_A@mail.gmail.com>
Subject: Re: [PATCH 02/11] arm64: dts: mediatek: mt8183: Fix dtb warnings in
 display graph
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_231956_636960_A9FD9C71 
X-CRM114-Status: GOOD (  13.23  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

No commit message?

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 119 +++++------------------
>  1 file changed, 23 insertions(+), 96 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8183.dtsi
> index db86e2bd0c7b..676f8ecd89e2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi

[...]

> @@ -1904,9 +1880,9 @@ ports {
>                                 #size-cells =3D <0>;
>
>                                 port@0 {
> -                                       reg =3D <0>;
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> +                                       reg =3D <0>;

reg should be first or second (when the first property is "compatible")
property under a node.

Ref: "Order of Properties in Device Node" in
     Documentation/devicetree/bindings/dts-coding-style.rst

>
>                                         rdma1_in: endpoint@1 {
>                                                 reg =3D <1>;
> @@ -1915,9 +1891,9 @@ rdma1_in: endpoint@1 {
>                                 };
>
>                                 port@1 {
> -                                       reg =3D <1>;
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> +                                       reg =3D <1>;

Same here.

>
>                                         rdma1_out: endpoint@1 {
>                                                 reg =3D <1>;

[...]

> @@ -2165,9 +2092,9 @@ ports {
>                                 #size-cells =3D <0>;
>
>                                 port@0 {
> -                                       reg =3D <0>;
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> +                                       reg =3D <0>;
>
>                                         dpi_in: endpoint@1 {
>                                                 reg =3D <1>;
> @@ -2176,11 +2103,11 @@ dpi_in: endpoint@1 {
>                                 };
>
>                                 port@1 {
> -                                       reg =3D <1>;
>                                         #address-cells =3D <1>;
>                                         #size-cells =3D <0>;
> +                                       reg =3D <1>;
>
> -                                       dpi_out: endpoint@1 {
> +                                       dpi_out: endpoint@1  {
>                                                 reg =3D <1>;
>                                         };
>                                 };

Same for these two blocks.

So all the deletions are correct, but the simple reordering is wrong and
not needed.

Once fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

ChenYu

