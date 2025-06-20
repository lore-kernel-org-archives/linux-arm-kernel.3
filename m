Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE30FC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 09:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkZMdMJtiCI1godzM9JRbQDVZvxgUYM0ZUn00XDblK4=; b=VS2V5OjuHzasYVvLDdpGTvnQBA
	tbbUnyCo7gWdGveP0EIYCl5TDRyzapJ0MPoJaYZL9QQgT+5rgBM+LQu4Q30ZNgv+JuQF5melinEu8
	cYgSXBmloxusiKguBKRn4iI6gQr7GxnsSMG1Z2PpgsTRZtkgifB77AK/bbv4WmZakF2CeaJPmPBjD
	hmb5W4TJ0WBgE4/cBF+Ndywh/wyJ2i5j6XEWONhV0y6cauT2dDHDs2zcSJwUpDKJExAeA5z3QFWVk
	8u44BB2erMdkhyOnKVd+zARNGZtjjzEMmpBECXhBOjd6o+xii99rIh1P/fYgurDiap281OHqgPwki
	Y6iC5wJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYSp-0000000FGx9-1wPS;
	Fri, 20 Jun 2025 09:55:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXFi-0000000F5Hm-32C4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 08:37:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-451d3f72391so15045395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750408657; x=1751013457; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkZMdMJtiCI1godzM9JRbQDVZvxgUYM0ZUn00XDblK4=;
        b=RStCT8rl0Pl7YAKB75qbVB2QFTJVIXGwVEo3kBXlQdgSIf1Id7S/hjyrBIs+p1y5Lv
         h6PDYDjEEsLyYj7SuF3m+gvss57bWu+0MV9ENir4iKUCcxPp+E8DERmQfILe+v/Xfms/
         ZrxzbSOrGb5Ftlesvhtuc3Q9TrvlFuMxIlgx8kH1RgU8U6j7bt/IrTJgmz56mNzDRJOf
         MBDsNuYlcskmLmPNLbU05zrtvin9e4iZeGG7A+ucNuC1YxbsU/0hoT2HjsroGvMoQ78A
         4m6aNCG76KXYh2jgIuQFbHeT04GO2g22fDvqI4Ml23RAAF7pzPxmq9N82JezM9YzAaum
         O98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408657; x=1751013457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkZMdMJtiCI1godzM9JRbQDVZvxgUYM0ZUn00XDblK4=;
        b=WVdGfsf8RWzCoy11Nf9NavkgGnAJd+AUtemWG7ZjFYXXKMxacmFZPSBDGqM2MsAe3H
         /S91gJuzvd1U8BaYXp9oxuodJE6HBrTYkKbWjmVlBit2w8AEMGz0HqDy4EthbHqyOiVX
         VdhPp3NaiQ/Ka4kouKHRtMqs3uEUa9G/7BVhccm4eYKngtJczTKDlhkIMGS7YfbrcXeE
         GgIC1kKK6GBO5mxl09bqpWtz5vYFJkAH63yIEwIt3jJAunUvvqFLMuQDo3hKTQfLzqEU
         3tNmiG1lek6O2WngytlAa5JxLHZsyMZOmTscuh2JdDw6/vMVC+9O2LywqO0rcAonP1uv
         FlUA==
X-Forwarded-Encrypted: i=1; AJvYcCWx/L1MYFV1yIqgVPSHRnsxDZ3e7Kf0EbIcnriF5tePYqrtX7YJcRunbeb2PVk4qSz3DBXVcMVt7bilUlHGpDdH@lists.infradead.org
X-Gm-Message-State: AOJu0YxSmUTnaCTz0CMt+ZYltYqj+vae83MBYxDbQkDSWDgWiGcR/Ixj
	hvHK/UOy2IjKVUGjw0Zw3wbhzyANdUkcjLDfUod8p3kzc4cAlxs5O46zv/68nJibvf/S52TmYyH
	92TnepIBM/V/JQhmIroDUXGOq/n3+lHJN1X8kK+k=
X-Gm-Gg: ASbGncsLnhjT56IqSDg9o26Vdi7yBIUbJ88nJNaOsEm1FVMmI3OwhnKXcKgKuO1f5o1
	P3T/wh/OFQKUU2qALbU2Q9TGOmoarD3TUmMu8EQWhBtt8b8KfEzLf9580Qmzw0R0Ga2jFIxnL9S
	y+17IzGOYDzMk6YjUfiE8Yi6yg8DdxcRXgddsFzTrUEnIbDA==
X-Google-Smtp-Source: AGHT+IH91L09rKl1WvHHN6miWU42yNno2KuBsV5zEbCXDsnr6stucdm+5+kVbuTet4qP0eO2vIMK3isuHSCFs9idYtY=
X-Received: by 2002:a05:600c:4fc5:b0:453:2066:4a26 with SMTP id
 5b1f17b1804b1-453659ee9famr16883665e9.16.1750408656499; Fri, 20 Jun 2025
 01:37:36 -0700 (PDT)
MIME-Version: 1.0
References: <0703ecbc355164e35b90a9fe088438c821f13cd3.1749741263.git.geert+renesas@glider.be>
In-Reply-To: <0703ecbc355164e35b90a9fe088438c821f13cd3.1749741263.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 20 Jun 2025 09:37:08 +0100
X-Gm-Features: Ac12FXwoHC5okYTQfQ1hd3pLbVxnrfdeiudtMlvvUAqtZogtU5CVCeKmChDP3KY
Message-ID: <CA+V-a8ticxRyDrtAMOLjULWhU-iXNhgQNEYx0JQvc0qKHRSf+A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: soc: renesas: Document RZ/T2H Evaluation
 Board part number
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_013738_772222_8E494541 
X-CRM114-Status: GOOD (  13.56  )
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

On Thu, Jun 12, 2025 at 4:39=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v6.17.
>
>  Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b=
/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index aac7af605de24f99..c25f12642061b6eb 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -595,7 +595,7 @@ properties:
>        - description: RZ/T2H (R9A09G077)
>          items:
>            - enum:
> -              - renesas,rzt2h-evk # RZ/T2H Evaluation Board
> +              - renesas,rzt2h-evk # RZ/T2H Evaluation Board (RTK9RZT2H0S=
00000BJ)
>            - enum:
>                - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + D=
ual Cortex-R52 - no security
>                - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dua=
l Cortex-R52 - no security
> --
> 2.43.0
>
>

