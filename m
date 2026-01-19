Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E65D4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 07:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=; b=O3BYBsNlRq9xKaIfl7U0nOM/mg
	8cMAIdTa0hKF+hnmhVZlp9+UcdbFh+l52VJonumq8p78NvWw+hBA0y2ahhWCh3eNUcpjET9QmPWLr
	DXNKYjFPNe1OsHyFmFVBQgXpr5XY6CYRPhKdsaSAgWU0oVCjd9uma2GE7I4tTiUa1av5pxaktUf9X
	BvQfE67jy7bWDx7xV5MRiasLVcmb/+gQR3jM/yuQyK/GsRP+S/LOketUf/QNcrjekKAugpXJ6zinz
	yoULKWbB63C3NFz04ylO+iCKj50kx1ENogATPL8k2RweVffLI+CCv4Rj8AypbwFWPEGjegBMDU556
	mQ0aFkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjjT-00000001TlF-1Jqq;
	Mon, 19 Jan 2026 07:31:27 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhjjL-00000001TkG-1T7J
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 07:31:26 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-34ccdcbe520so2626298a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 23:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768807878; x=1769412678; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=;
        b=B3S3A8styW3eQfmLRCfcSl4cwj3OMTP6UiJZZPs2ig4KeHamg2ugoKoHAKymfoPkUI
         pKmTb/XG3FL4g4X7304xsoz0puHYfmQZEdS0fd5bWftYkuVVw32q/S2YC/muCTMVWojo
         d6KK1nWqF2Bk7CAOswu2Ar9O413VAvbHXlxTr6tqW3ZuZ2Bciix37NV15nY4jUGSac1b
         neI4AXrQBIXFjVg5w9+GV5ele1TQLDz3J67ZbhohKIXO8GpeCZToxPGBspiZdeM06pc0
         pl9n489eJx/xJEptoLXpOWyedrqyIluptC/RVh1VgFDWKI47EqMB5K21oYT8danGO6AI
         d8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768807878; x=1769412678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AmBvNvnKo3AicJkVDkgT9ULTWLrciXVW8Cf69nuUyxE=;
        b=gEqhHwxwwAfAnZWwbnB7rNJS1nLLf2ix3bDAIYoweI5HCmsXo0El0XOMTrEYMhyhjV
         xDe0OhIFSvGJAaFqnAhDJ85W2F0SRhDGFgr9PQG38ewjdJrDWmzTPd+4QKLIGO6RMgKj
         fK0xobFfvHC7xyhRDzl2AT6GGUVUPTdhOtNqkGSWz0cBGW+5KwvruhrVNjStB6vSvkvr
         /FnbvgTzN+skTNwOjJX0g33b1q9JVO+/kvtzwSvoKDILQkCvtv9lNq7YslpFehiq9u2e
         Srrv9Y6joxgo7hPgeTvNJhpmUMJuSNv/yU00Gu16vArYSm7F3D4HlrNsKka0zo7VoFVf
         aEPg==
X-Forwarded-Encrypted: i=1; AJvYcCWFHIUu+sx6nztmhuDXxiAzcAdk8BmHuRbL7b9Dwjjlf4UydQ6L/Eh4I7NkipOD3oL2dH9ni/VfesSXa9JQAkvF@lists.infradead.org
X-Gm-Message-State: AOJu0YzrOA1uRwNxo0UcAAJ7R96M2GXFD7rqRKty7IZOTEbrQnmGOjRy
	wqN/oF4jcEaL17XGgEGkzbSk3x7Gxu+Pv2ODrEAEQQogInoOerCfiRmPPt7VHZhqblWKQXvSb6S
	AuNwd2wuDMIhcbEeVXDEiJwed0q6kdhs=
X-Gm-Gg: AZuq6aKALrQ7PWHnjQmDP4HrGBA+z6dVJog7hh2cIEJ+JqtCYqq2CaiBMvesihPtSMp
	OB5SWuRK1fCc+de8JuVnyWWbtcznCfJXKyxLAtKydV1c2BsV78cWeVCmwfWXpolrj/xAjc/KCC2
	IgXZD8V9PH4R9BEgWZzAOapcaSd4gpOCswUvl7Z6YSfH24bVpHzynsY84p4A9+hQ0upsPhMt2Fi
	YDOCY3yZ+5nTvh+2Ii6J6GHuHKMpQAe9NLzmxj3Qrotplut6DQqi+sXWeOT8+IPOdvgN6I=
X-Received: by 2002:a17:90b:3884:b0:34f:6ddc:d9de with SMTP id
 98e67ed59e1d1-352678fcf6fmr11202077a91.16.1768807878309; Sun, 18 Jan 2026
 23:31:18 -0800 (PST)
MIME-Version: 1.0
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com> <20260117-versed-proficient-pigeon-bd0b2a@quoll>
 <CAA+D8ANrcjvOCfRN7gGGW+7YzvVieU7P2uexUpVYTw6MEHAKYQ@mail.gmail.com> <2be56ba8-5659-4d03-a886-ad32a32f6b44@kernel.org>
In-Reply-To: <2be56ba8-5659-4d03-a886-ad32a32f6b44@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jan 2026 15:31:04 +0800
X-Gm-Features: AZwV_Qh5iuoRHWZMiK5VT4SDQMVso2DrWmENEWodorBSh_MSb2zROT8lpDWRAvg
Message-ID: <CAA+D8AMv0TaGwCU8yWWVbVfuYHyPMjMnz0MWNLh86nfsGMZtYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_233125_249442_C9AA054E 
X-CRM114-Status: GOOD (  27.69  )
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

On Mon, Jan 19, 2026 at 3:07=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/01/2026 07:27, Shengjiu Wang wrote:
> > On Sat, Jan 17, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> >>> The specific feature for AUDMIX on i.MX952 is that it can be bypassed=
,
> >>> so add fsl,amix-bypass property for this feature, besides this there =
is
> >>> no power domain defined on i.MX952, so make power-domains to be
> >>> dedicated to i.MX8QM.
> >>>
> >>> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>> ---
> >>>  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++=
--
> >>>  1 file changed, 33 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml =
b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> index 3ad197b3c82c..50fb08460b4f 100644
> >>> --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> >>> @@ -34,7 +34,9 @@ description: |
> >>>
> >>>  properties:
> >>>    compatible:
> >>> -    const: fsl,imx8qm-audmix
> >>> +    enum:
> >>> +      - fsl,imx8qm-audmix
> >>> +      - fsl,imx952-audmix
> >>>
> >>>    reg:
> >>>      maxItems: 1
> >>> @@ -75,12 +77,41 @@ properties:
> >>>          unevaluatedProperties: false
> >>>          description: Output port to SAI RX
> >>>
> >>> +  fsl,amix-bypass:
> >>> +    type: boolean
> >>> +    description:
> >>> +      The audmix module is bypassed from hardware.
> >>
> >> I don't understand why device AUDMIX would have property saying AUDMIX
> >> (so itself) can by bypassed. If you bypass the device itself, what do
> >> you configure here?
> >
> > The case is that the SAI interface is connected to AUDMIX,  but AUDMIX =
can also
> > be bypassed by hardware configuration.
> >
> > Yes, adding this property in the AUDMIX module looks strange.  Another
> > choice is to
> > add this property in the SAI binding document.  Is this better?
> >
>
> Not sure, but certainly it does not look like a property of AUDMIX.
>
> I assume you acknowledge all other comments.

I will move the property to the SAI binding document, then please
have a review.  As this change, the binding document will be updated, for
the comments to use the example-schema (:false) will be adopted if needed.

Thanks.

Best regards
Shengjiu Wang
>
>
> Best regards,
> Krzysztof

