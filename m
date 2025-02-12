Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BDDC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 03:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcryBZKe0HwOZ15GXClthjY5efiSUbIeZQ+SYJvbj2k=; b=NfyuNWegKHuGA19yBCe1G+z+n1
	X7mK2u0b0Gvx7FiRCavvcP39GPGByXJmqPCkBfeIDNBRtNq+9tGnKKmLLSb8un38O9zVyNxeR/sjz
	VyAVcjhJOd2deYBokBkahAIx1nYBK9e9fD4a558Lb6m4agILwI104TtdB2aUUTGqlAyAhly8aJCRr
	G6N03zZUEYRCFYsNz9iOENSQHZm6b7az+XcJeUQwfAQmTW5rDyzXeL7xHGeBcFQELY4qQiGxGi49k
	p93WPV1G71pFAo7I8hhWitrSpWhSxCveN+EIQ28HuD+4PUBN41uu8kEeJ9lB9qFZ8hQvs/CHRUTaY
	BUE35Hdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti3la-000000066FK-00BO;
	Wed, 12 Feb 2025 03:50:26 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti3k9-0000000663O-0N32
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 03:48:58 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d04932a36cso55493855ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 19:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739332136; x=1739936936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vcryBZKe0HwOZ15GXClthjY5efiSUbIeZQ+SYJvbj2k=;
        b=Og54QILeXXpwIQCQBnF/48MExhPvvmtDbL+Mi0WwLZ2gkdBH7TEfJl6L4dNBGGhwHw
         SIxzCz55lc6n2mt1NbpMnxsd6loQKVpx2xfbSLSGMrHEAVipWYZfWSfWk3b90Z9Ptwv4
         k89IB9ZCjEWXokEd6gkTlK9tgSjKomFpYQMq+c2Ilt7a7So7cWfsP3VgWMd+BotiqFS6
         ggWkeu5uhqwMW00LTT3srOLQX4aZa3wVoHO5M9cXJackpbmSEj++nHfZM/R6UEGSFUV/
         16DBkrlCDYmzB2LeMNgSI+1mmyYaBWNcUhEVJoV0BWUDv8fiaWDtFk9rnwBoRI3KVvRb
         yGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739332136; x=1739936936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcryBZKe0HwOZ15GXClthjY5efiSUbIeZQ+SYJvbj2k=;
        b=JTAmZguwq3hedGNkl2/dFa5/0bb7+5b6ggHiduVquWvOWpWiEEoZGf5OUOf+x9gXPf
         izjxylFEU5MlTqMzZ4qoVayLGqtRoGVaqLAALNj1UlEwUtxzomfOuqPfGhNIuUj+WPTm
         06dDv7M8+7IDg6RS3lBrdVjxYaYw4BWb5adNWYVAHwsuOKo7NuAgnycMa8k7m7Wirgt8
         vdnTZcfrgde8FKj5Izf/HfAbjWthV3HIsvp8rDNQZFSIoGhC26PH4yBA9PzzvvG4GlDT
         lJxkYQgMwu4G+NraJ3JFDAHd2f9r/qBvPMlCeIJW8PAzmWz5ETKdrfaU5vB1nIikAWvV
         yDPg==
X-Forwarded-Encrypted: i=1; AJvYcCUjCtsrCNzBFkirGbr+rTHuS2SzDzMS00Z8G49tfzXfKBVbhF6Hw14dun80VzwxuGs/M4+fwMsjuwCH3HEsVfJW@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ1WKAJaJGgj4llsRstcc77u8EPifwJMlFbHj2yJzA9rgrLNVj
	jdwo5nRIUNx7FJyP12fFKUPga4UW+LKeQvUIV6MzdfJ5jrY7KKQJ2a8R/+k57ZQbpZ6L52e4FSP
	lb930zN1qdvvkZXqt+ezYTKA1X4M=
X-Gm-Gg: ASbGncsIrqI+ev62FOLk0kbhYURn0Hk6OvAYCLKKmHKbm4hSKTCTfgQYS0n+LoxqfN7
	/Ppyt1VfcgJR1yizLOjcfkyoYiEIpU1xY83NAAKYRL8vAIC7u/Eh7khCinYdKFB+aazXiHude
X-Google-Smtp-Source: AGHT+IFCnz4li/5IWRttFgFQdRpTdkwg/3j1LKC5VF8mycMo5avGb6iiANRdvRcmxPBkiquPSP6pJyx2R6uQlujKUaw=
X-Received: by 2002:a92:c54e:0:b0:3cf:cd87:1bf9 with SMTP id
 e9e14a558f8ab-3d17c21cd04mr17637315ab.22.1739332135646; Tue, 11 Feb 2025
 19:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
 <20250211035737.3886974-3-shengjiu.wang@nxp.com> <Z6tuFp9nZFMJMgDa@lizhi-Precision-Tower-5810>
In-Reply-To: <Z6tuFp9nZFMJMgDa@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Feb 2025 11:48:43 +0800
X-Gm-Features: AWEUYZnXrLA9vESn8DWyjyXL304FuAyCkB66xQG7feWsbb8dSRpLkjhc6mEjDb8
Message-ID: <CAA+D8AMyXVdAWOTGHtrOyXjSLiMioAhZ1awepX3nproom87azQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: imx-card: Add playback_only or capture_only support
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_194857_126963_267A5C8C 
X-CRM114-Status: GOOD (  20.24  )
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

On Tue, Feb 11, 2025 at 11:34=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Feb 11, 2025 at 11:57:37AM +0800, Shengjiu Wang wrote:
> > With the DPCM case, the backend only support capture or
> > playback, then the linked frontend can only support
> > capture or playback, but frontend can't automatically
> > enable only capture or playback, it needs the input
> > from dt-binding.
>
> wrap at 75 chars

On my side, there are in 75 chars...

>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/imx-card.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
> > index ac043ad367ac..905294682996 100644
> > --- a/sound/soc/fsl/imx-card.c
> > +++ b/sound/soc/fsl/imx-card.c
> > @@ -518,6 +518,7 @@ static int imx_card_parse_of(struct imx_card_data *=
data)
> >       struct snd_soc_dai_link *link;
> >       struct dai_link_data *link_data;
> >       struct of_phandle_args args;
> > +     bool playback_only, capture_only;
> >       int ret, num_links;
> >       u32 asrc_fmt =3D 0;
> >       u32 width;
> > @@ -679,6 +680,10 @@ static int imx_card_parse_of(struct imx_card_data =
*data)
> >                       link->ops =3D &imx_aif_ops;
> >               }
> >
> > +             graph_util_parse_link_direction(np, &playback_only, &capt=
ure_only);
> > +             link->playback_only =3D playback_only;
> > +             link->capture_only =3D capture_only;
> > +
>
> if only use once, needn't local variable.
>
> graph_util_parse_link_direction(np, &link->playback_only, &link->capture_=
only)

sound/soc/fsl/imx-card.c:683:53: error: cannot take address of
bit-field =E2=80=98playback_only=E2=80=99
  683 |                 graph_util_parse_link_direction(np,
&link->playback_only, &link->capture_only);
      |                                                     ^
sound/soc/fsl/imx-card.c:683:75: error: cannot take address of
bit-field =E2=80=98capture_only=E2=80=99
  683 |                 graph_util_parse_link_direction(np,
&link->playback_only, &link->capture_only);

There are errors with it.

best regards
Shengjiu Wang
>
> Frank
>
> >               /* Get dai fmt */
> >               ret =3D simple_util_parse_daifmt(dev, np, codec,
> >                                              NULL, &link->dai_fmt);
> > --
> > 2.34.1
> >

