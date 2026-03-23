Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E013FD58CBE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 02:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xo7X24KURKwbCzAPV/YiMB2riIeW/RY3dANwUw5/k3Q=; b=ag2FJwjqTadUqgpELQNfgdQ35w
	KE01AKFvpSmYUi9TsOmVd9MUxeTv/FErBzww1sbU2q7dQFruT61JtSfC9W/cB5PKRAyESjqPku+Y4
	wftoFGirX9Zv415ol96WSVIPJjsHfUn5SIKB+T36/SaX0aZvUDI1QZOsraUYMiYpF4XnNW/4imKNS
	aWCtuoCEOFkOaQK/uE+kfeGvq9lROM8Ykl7Bl0dmVkjL5GA4MiowciK0+YDN1fD3ScBHWZOIgZLHK
	LKDI+I9eriSPP9efrk1jTkuruuWD9jLlzCi67qYavrv75v4bCZ6DAlREeCjg74TwhLXfABGyFNlil
	k6yalSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4VQY-0000000FvKe-0nYt;
	Mon, 23 Mar 2026 02:54:02 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4VQW-0000000FvKH-1RDX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 02:54:01 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-59e4989dacdso3646165e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 19:53:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774234437; cv=none;
        d=google.com; s=arc-20240605;
        b=Vv0AWb01b+nihd+x2qx/TNEOz4XRAWiCXq6AXqpNAhmi237se0k1icA5jarcSAbe+P
         fnSnE+XfjweYxa5HQWusNFrk+m4jLrX5zbbAgivR7NDaY2kM/01BgtRK6peF+tuk2/hK
         SL0wWrA9knNGArWzze58ULp6KrYVXS/OxtCtO7bQax4urE5xhluvs65kwHn7Jishnq39
         xRSC5VJzuEs9/tChnxmyhqVWdH98eOCvPQwpGra4hclvFvcAdFCkjgSlkS++Pw/06xP+
         p7DYxisTG8qSilXmppcROio6g265KRtwE6dO+Tqf8JoHIf0Rfbgb81Z81ka5CTz+Rnnl
         XSsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xo7X24KURKwbCzAPV/YiMB2riIeW/RY3dANwUw5/k3Q=;
        fh=OsCALZk1oPYoJ3GmS3HSu9xDocXpoJhtWQBBBm5RXBM=;
        b=CJhEPii9PWrP/dJhS5rEfP3IChK9vxyRBW5CuYxNlFnzPNvyHeNnAWpUHgffaInV4G
         K7aVjBMHQV8UlsdqPh9aMSW/JAg7fTS45tzu6noxzC5cYZd2F4CwSPH0BaH1yrRFmGqi
         EvaBM0t0FY8B/YOYDYywVMuGT5mDnzOT2iyP3UiAYemxHQv4UX9ETG970kBAMpvcQZxt
         o9virOUNxSHTnrAshfA/59YyHM8rzf/UXRAtlKojU2W+JXUl7caORcsxnlpbqZNZyl8E
         FTqqw7UiRd0EiX3ys9etasEc65czSTSiJB6MRBDs6Lftn3KimMaFAyy827d6yyETvWLD
         /Jsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774234437; x=1774839237; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo7X24KURKwbCzAPV/YiMB2riIeW/RY3dANwUw5/k3Q=;
        b=kZWGEzNJAZI4aDu/Q+LULW2dCMQAV0I8oI/Vm+RvFjEHCWiUq0T3O7uJ0ynWe4/xxp
         uCcMpGdtFOBSXZIwdwo6vHA6usJh6R3319j+hITP8EIHHsiCmbEpRuUMVxxDRuWN/Ztr
         CZ2G8o1dh5VpE1U2xKxztJfX5eq3IQmiq+/jxCDba2D2tJTOU35M9sdlLyOe4KW08d0/
         hA3ojeYse1HGBKKQ4a/7BD1vuL3U3tKJnGEeDmGzcLS1JhcfJ8fS6WKtih829ENf1cl1
         1Qyh767Ag08W9GOXjZxsLYpQu22mvLaN+Qc9AC+705fdPt7j6dcTTSnQNfSK98/6I1hq
         3VnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774234437; x=1774839237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xo7X24KURKwbCzAPV/YiMB2riIeW/RY3dANwUw5/k3Q=;
        b=J5B/FfW8Kv6L156OD8XDJj+cl2Dni7V54xaljY7MsTRPqnBQ7biWeO+wNr+98XIH4x
         R1+ifFTqEl0+qX7UUh+tSlykCyGq+X28Cx5WlWb3z/iTFybrTe0RS4/tihcCTcboG1L8
         /UDVNP4CKVUy/uI7Qcq7qYDRNwSsTsUXmFD+D4GR2qF72aGU5sOtg3Kpr4Vg+nWD8f1z
         RF9cIVHA7LWp/o7jtrI8onGoPZlq9mn+cRzlPNJK/2nnwgunBftTksCQ4undNV4nDE3s
         9Zh/eQIG0s1RYBinimB3vo28GTOzTO3+ahn7QIyiaf9HgbEcbDlfj6dY/vbcxE1jbGpf
         vOVw==
X-Forwarded-Encrypted: i=1; AJvYcCVDmx9fU9Uez+cjPJz4+gEovYL4CmOU6hXVSmPCtpGsKt3QHVhEVHIcGuFTTMxVI8R3Kk3ROjYMKM3H+bPSB8TA@lists.infradead.org
X-Gm-Message-State: AOJu0YyXVygdtxMjwkNOe5wjcqNukpbzBqEwqxIMz6epAraIIKCan+3h
	pb5//ngTIUUWuHUVEEre5k3Q3EDVx2WYd77Hat1wLxFsOC2HJr5IRzRJ1M9NhYd+nWVc0FHqw2R
	9OeZg2B4LGGAWTpwVggksjcVKjahiauOHjw==
X-Gm-Gg: ATEYQzwTdFXxR2BFein5Dnzye8m6+qmB85xxCYlvk0QQupwMg+g1dN/gOD1m2D+DNsI
	AwAhKeWwYcMc1RDBgrD4C4ogxtF0JPWQB8VrbRIXt2EPEjm00y9ehpgakfLBEXq7tku8fuvCVvg
	MOSzwBZHyFYZ5ruSOEKA+Nte1afPBfGvRw6Lk2AxBRh6uo4IFTAPg9Gbst9bj5c4UCozSp6SkcW
	DsdO8xv9ial61aKFKCQorOLIlbSFG8VU7NcfQN6JGx5gRQSIulK0sYUSGr3HAx6NQfnFTXdhH7v
	vYWe7ETq8FE9t9H/54h8qn4EsNg4z3k8zC1UMZdFBEZlHEERUc1/pccL1M8Pj3msFTOhBKk=
X-Received: by 2002:a05:6512:682:b0:5a1:18f0:930b with SMTP id
 2adb3069b0e04-5a285b6dd90mr3277193e87.42.1774234436995; Sun, 22 Mar 2026
 19:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260319200945.23333-1-adriangarciacasado42@gmail.com>
 <CAOMZO5DcaucpKj2=gO5kP3vd=f==ydzB+3FbGB4Jwg19Vi8fpg@mail.gmail.com> <DU2PR04MB8567934E6CAB063DE5CA0F3AED4BA@DU2PR04MB8567.eurprd04.prod.outlook.com>
In-Reply-To: <DU2PR04MB8567934E6CAB063DE5CA0F3AED4BA@DU2PR04MB8567.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 22 Mar 2026 23:53:45 -0300
X-Gm-Features: AaiRm53JnagsrSa0mVy9Yk82B1cInf3CYkgQHDyLxpH2kT6hRQZKDibglWpZf8Q
Message-ID: <CAOMZO5CJ3m9ucMVPB8qYhfaLYMTfRNF2VEoAmfbyJ2dFF80DEg@mail.gmail.com>
Subject: Re: Re: [PATCH v8 3/3] mmc: sdhci-esdhc-imx: remove redundant mx25
 handling and consolidate soc data
To: Luke Wang <ziniu.wang_1@nxp.com>
Cc: =?UTF-8?Q?Adri=C3=A1n_Garc=C3=ADa_Casado?= <adriangarciacasado42@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Bough Chen <haibo.chen@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_195400_427089_C4CAA06D 
X-CRM114-Status: GOOD (  13.81  )
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

Hi Luke,

On Sun, Mar 22, 2026 at 11:38=E2=80=AFPM Luke Wang <ziniu.wang_1@nxp.com> w=
rote:

> Hi Fabio,
>
> The option to remove the imx25-related code was actually suggested by me =
during the v4 patch discussion.
>
> "
> The original use of is_imx25_esdhc() to avoid setting DMA SELECT bits was=
 because mx25 doesn't support ADMA, introduced in commit 9a0985b78d70.
>
> However, before that commit, imx25 was already using SDHCI_QUIRK_BROKEN_A=
DMA to disable ADMA (commit 97e4ba6a5ea9), which theoretically should preve=
nt the DMA SELECT bits from being set.
>
> The actual reason DMA SELECT was being set incorrectly was due to a bug: =
u32 new_val was used without being initialized, causing DMA SELECT to poten=
tially be set to random values.
>
> The new_val initialization issue was fixed in commit 81a0a8bc380d, but th=
at fix was made for a different reason - it was not recognized at that time=
 that the DMA SELECT issue was also caused by the uninitialized new_val. As=
 a result, the is_imx25_esdhc() check was preserved.
>
> After the new_val initialization fix, is_imx25_esdhc() should no longer b=
e necessary. So merging mx25 and mx35 is indeed valid. If you'd like, you c=
an go further and remove the is_imx25_esdhc() related code entirely.
> "

Ok, thanks for the clarification.

This explanation should be part of the commit message.

