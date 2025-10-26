Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF024CCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Oct 2025 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Da7n/lRyiS06YbMDRGJe/PhIKNbj4s3MR8oTEu6nwl4=; b=358E1vRQlU+J0VIpCB3YfhVBRs
	vNZov6v+cu4IsV1dRxrb95HNeNO9JFNVys6H2wjSP7I93BGPtG+Nb0cQj2UsPcFRzMPdF/a9C2zuJ
	3XjML/giGbMht+ntwppMmi4H0pNiNerQvWT0XtnTczBzGaebi3gvyt0Havg9w8i13Ric3ABo+oPRt
	v+N7M15Mp0LBMFuNuy0QEibDRdsJS2gchwJglNxWfCduyFoxx98YPnS5swhdRCAaeELCwh9vuYDUB
	9dy7khC3qiom6iYxHlcCdX95+QRWil0Wi+wYd49qUbigCzn1LNKi8fteBd04JQSO79krElkKuNdfx
	LmYS8nSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD4Kn-0000000CZN1-44bf;
	Sun, 26 Oct 2025 17:15:13 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD4Kk-0000000CZM8-48g5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Oct 2025 17:15:12 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-b4539dddd99so820233966b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Oct 2025 10:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761498909; x=1762103709; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Da7n/lRyiS06YbMDRGJe/PhIKNbj4s3MR8oTEu6nwl4=;
        b=dJA5ZydhJmIuXVTVwhGXRkRyaRnVQoUxOoA1mHFaCOq/BHKrxk98FaEAQt3+g/J3g+
         gCwqzgWQLX8Ca1f0dkHCxTQFljaQ2cqWF7FoZ9xQmbA89g6qfa5JRp6ZTr6qLmqdBeQA
         Ecc+LFJjEj2boYWv2Nual1ph2U0/FKYuNr8+KAKkkciSmLTs3SU+VZ2iOw7gjrEhZ/RG
         C/NUO+AIfuPey70pAS9KqJPxSKj1lhbbGpSTBEq1IjnZuEjJ0soXyAAGLlS863PvntSv
         lqMxo1m0tkqcrhyV4BA32+cWyOS8F+g4GtD5vJnzkUltnDuvj+CpC/ERcx2m9MAS34iE
         ldnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761498909; x=1762103709;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Da7n/lRyiS06YbMDRGJe/PhIKNbj4s3MR8oTEu6nwl4=;
        b=WmprK9IXCtuEUvDZ2xiQQnWMFNXt0VoO1ED2A6DgNAVnXokLORyt91wd595zVNZ/aO
         clNNINN5lf02uSL6WMr9BjoNUuec5siIHjHO88VxRHKpF5teW9257PN5AgB5Q8T8XFtg
         cflVHEIFzGBkv5Ls70gYiRAZsdi0JLpx19wd90BR4CBbP95ZJqq2kBnKU6dh+xFJPS5C
         4cunmSx1cxuLEY9QLnBr3DqFsFoIEVnV8B6QjwGOKQ/Z4dkEGFnx/QiWO/tHiNyUmNMU
         daUThq3uMiyQ5KwEe/Q+fl2zpSD2esPmCybrRwzHBLhdS0GKGqZf9fLEV31H8N05+YS0
         HZEg==
X-Forwarded-Encrypted: i=1; AJvYcCXKL+wtGnT/WmtDFUvpdshaHcGEjczisvQjnmqKfzFqboYwVi1tATvVDkELDQjTyOTBwVC5A/YQdXZW5g7D2fMj@lists.infradead.org
X-Gm-Message-State: AOJu0YwRLVCIbLgZIHav5JI8g6RFtPMZ4MhcQrF4ZPC8Pf5PhA4Q6MWP
	xiPTkaCEDTi+cdBGxZTjsJzWL36/WKdwuY42TVsvUEOJvb9vnfBp9xhQoiuMZj5eTQaEgCq//Kv
	xzQjfdaefbbzJvhv3W8mH8orm+VvF67mb3NchbPLo7w==
X-Gm-Gg: ASbGncuxEr8v7LYmRcakbjamWhq3chHQk9IDlHAUVLe9jb8kYPBMJowAGe65ljdebRS
	0srSp+6YcaQ8jj6WuTcGAHTc/2TrR0SIuEJw31Bu4KnymVpB9Y2sq12lDtPzASluMP9T+38ZuVb
	2IL3n+dTa1BxyvYm576NwduhK7UdaNMwFBvNbe/HpFribM7pwfdVWu9udOcxkfFdDcsiy6qgqCO
	05Zl+Xp0vYrkv42+IbuC+rDdUPStjlAmHEVQ8OYA5H34ZJWp6VO42kMwYyDwTe1KhvRW27kMA==
X-Google-Smtp-Source: AGHT+IFzqU3QsaPE1MW2duZ8/dKVM5Mj7D0icnFlvp/4DYRo9NMCY1YBcoIDI7zlJrtuI8cbSwsY9j7dHSYnlbDke2o=
X-Received: by 2002:a17:907:1c81:b0:b6c:8e24:21f with SMTP id
 a640c23a62f3a-b6d51c325c6mr1741819066b.55.1761498908937; Sun, 26 Oct 2025
 10:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20251026150358.1078453-1-coiaprant@gmail.com>
In-Reply-To: <20251026150358.1078453-1-coiaprant@gmail.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 27 Oct 2025 01:14:56 +0800
X-Gm-Features: AWmQ_bnvhjvqwSYSkZyszEhUHRG058LD6n9gayksgoabyqflquBOY2fvBCiBW_0
Message-ID: <CALj3r0jVPGtVtHUwxmxjePkj4T3jZD5JUHfJL6xa6h8CAKHRzw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add NineTripod
To: devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_101511_044551_D778BAD2 
X-CRM114-Status: GOOD (  12.74  )
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

Sorry, v2/v3 causes compilation errors, which armbian's build system
automatically ignores.

v4 has fixed the build failure issue.

:(

---

I'm new here

OMG, Gmail Android cannot send as plaintext mode :(

(Resending with corrected Cc list and plaintext mode, sorry for the noise.)

Coia Prant <coiaprant@gmail.com> =E4=BA=8E2025=E5=B9=B410=E6=9C=8826=E6=97=
=A5=E5=91=A8=E6=97=A5 23:04=E5=86=99=E9=81=93=EF=BC=9A
>
> Add NineTripod to the vendor prefixes.
>
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index f1d188200..37687737e 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1124,6 +1124,8 @@ patternProperties:
>      description: National Instruments
>    "^nicera,.*":
>      description: Nippon Ceramic Co., Ltd.
> +  "^ninetripod,.*":
> +    description: Shenzhen 9Tripod Innovation and Development CO., LTD.
>    "^nintendo,.*":
>      description: Nintendo
>    "^nlt,.*":
> --
> 2.47.3
>

