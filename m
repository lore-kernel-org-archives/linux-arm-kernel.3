Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66ED8C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 15:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUEn3JMwsIKPIkXJ0tSp5EwKeVNFEzL92ytfdeNBZxk=; b=bIvULEUkzK7guTyESr09nEyHCG
	1oBxUGXj9q8pSu/LNCVs4NGmaemFpanzHq2LoH7tdkmL97z+jFnXkjlOUn3koHD+VdSOtX4nJ7cay
	HRqwd2GB9y2gziXmokY0+uk4oZJwsprBRWlhek6Lf9ApFZN0vp6ElsdIUqBKwImtvyASnp99eLbq7
	GsgU7k2i1c0DdG3AQT2COMH9swWCls7C+J2reiYeQzpWzsJ+xDvfdoUHYo6ptTmT5HKsO3FUn2omv
	cVzy5osX56cMQxrdbpjDvGDtB/7aanmDkmFwYcZj1bJZ5IfBdg71vnVV4CEw1BkL4G5IiA5VTXlpo
	LGd7Rp9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgfj-0000000Fy0b-1R42;
	Wed, 07 May 2025 15:26:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCg3e-0000000FqbD-3vqW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 14:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C97484495E
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 May 2025 14:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7D5EC4CEE2
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 May 2025 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746629257;
	bh=7kf2ALq9/Fo9sH2dq1oJJwydVs2ruWu/GnwJukTPrac=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XvkEeIsPB5Ry0v4pb6qPVXaZKm2OARrRn6akiFVoR2mM2spnElojN6bKMmbmuVt+s
	 roHfv02ImJBJuNFoDtnx460x5jPj6zNQLFDiWpeYGivmJMl3eQvqCp4tcvdf7s03jA
	 v6tptasGSchNEpItgc6LfuKEsLgdS9zOg5m239AHAVJit0U/Mwxd7uEDiFIRG9hULs
	 iKDX2/o6/5lDLC1ybEr9c7RYgzrIkbMINyww7ly+TzP8kL2s6ZigZFOTEYEdFLG6Yc
	 5UjpiOWy/azRbV3ytP2WoTA6DmCflg5egCtM7uMn2nC4LA2QMVj65BzI8OMmiI68Au
	 UJTrEqbH3O9cQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2963dc379so1024591566b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 07:47:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+FKF+P74hn88XICpii+PmXQ3KF4gpmFGG9tvERG1s0TZOFk7pnOR6yx0tnG7uonRvHAEc6NiroemUwICUax02@lists.infradead.org
X-Gm-Message-State: AOJu0YwebA+t/PwiHMEtwvOGLjdUBYb16MHATrle5N/oejuepBgiXBdQ
	c8ItYGdAq6EkviTYxefbbFBI/eYCxDAy5pfk06Fjcko0jznATKKU9G3CGDQskOpxN04u0/YH4s6
	3N+O83swTsjXhuCl4qHvfTSuiNg==
X-Google-Smtp-Source: AGHT+IGQ6GxHlslTwdOZh1gbDpgh+dYe27WpmXegpHd5DkVrMdkA8NZoCRZDzvSOBmaGdpd1/hZMGrQJ9el/C9neT10=
X-Received: by 2002:a17:906:6a1a:b0:ac7:16eb:8499 with SMTP id
 a640c23a62f3a-ad1e8befcc6mr361869866b.5.1746629256312; Wed, 07 May 2025
 07:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250506220038.2546557-1-robh@kernel.org>
In-Reply-To: <20250506220038.2546557-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 7 May 2025 09:47:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL9tN_9r8nNXFK0u=pn0z+vL6jbNttHiy0kUTLniAPXzQ@mail.gmail.com>
X-Gm-Features: ATxdqUEaSFPzBMpV3-DeUOiztY1d0UDv2l3fSDWeswYEdFW2Ok8r_aLfxDsvOy4
Message-ID: <CAL_JsqL9tN_9r8nNXFK0u=pn0z+vL6jbNttHiy0kUTLniAPXzQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: Convert socionext,milbeaut-usio-uart
 to DT schema
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_074739_036474_1EBF133D 
X-CRM114-Status: GOOD (  21.16  )
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

On Tue, May 6, 2025 at 5:00=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
> Convert the Socionext Milbeaut UART binding to DT schema. It is a
> straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/serial/milbeaut-uart.txt         | 21 -------
>  .../serial/socionext,milbeaut-usio-uart.yaml  | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/milbeaut-uar=
t.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/socionext,mi=
lbeaut-usio-uart.yaml
>
> diff --git a/Documentation/devicetree/bindings/serial/milbeaut-uart.txt b=
/Documentation/devicetree/bindings/serial/milbeaut-uart.txt
> deleted file mode 100644
> index 3d2fb1a7ba94..000000000000
> --- a/Documentation/devicetree/bindings/serial/milbeaut-uart.txt
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -Socionext Milbeaut UART controller
> -
> -Required properties:
> -- compatible: should be "socionext,milbeaut-usio-uart".
> -- reg: offset and length of the register set for the device.
> -- interrupts: two interrupts specifier.
> -- interrupt-names: should be "rx", "tx".
> -- clocks: phandle to the input clock.
> -
> -Optional properties:
> -- auto-flow-control: flow control enable.
> -
> -Example:
> -       usio1: usio_uart@1e700010 {
> -               compatible =3D "socionext,milbeaut-usio-uart";
> -               reg =3D <0x1e700010 0x10>;
> -               interrupts =3D <0 141 0x4>, <0 149 0x4>;
> -               interrupt-names =3D "rx", "tx";
> -               clocks =3D <&clk 2>;
> -               auto-flow-control;
> -       };
> diff --git a/Documentation/devicetree/bindings/serial/socionext,milbeaut-=
usio-uart.yaml b/Documentation/devicetree/bindings/serial/socionext,milbeau=
t-usio-uart.yaml
> new file mode 100644
> index 000000000000..37db6459b67a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/serial/socionext,milbeaut-usio-ua=
rt.yaml
> @@ -0,0 +1,56 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/socionext,milbeaut-usio-uart.yaml#

This is missing 'serial' in the path, so a v2 is coming.

The tooling didn't catch this as it doesn't know what the root
directory (bindings) is until a reference is used and the reference
checking happened to miss this case. I've now fixed that.

Rob

