Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23123C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dP4iIFxpGRxJIuWg8fbKde8yqpGCy/LbovICFuWMxcc=; b=zddxwD3++Ic51K3tYGKRHCWp+6
	jmvJycERm1A/XYTQX2X9kTqwLhazAYoSoQ2zURPMknANig531uyBxwlScq1endj+z0LmjFv/mYv13
	CmySRkh6VV0gIumbqgkKRye8uJWWTp5dh2x/rsGgQJuHK4VjF+iRwHBT2OhYLhNNeZVCM0wfnrfiZ
	RiXQR2UJmuQr1LMErlSl8V7N6oqSELP2DkjitGrzPY+Kxj5BSWQCcixNzCylJey9gBhvwkVXyCXI7
	G1EVMfITJb2p3PWK6EZStLn1HmTqpxmwQCAucbYpF8UBXn+HH9cYm7UK8pHoTzZGGrbBG5Rl+5E0C
	E/XnBK4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazzA-0000000CohU-3AVI;
	Thu, 23 Jan 2025 16:23:16 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tazww-0000000CoPS-2udT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 16:20:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54021daa6cbso1248072e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 08:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737649257; x=1738254057; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP4iIFxpGRxJIuWg8fbKde8yqpGCy/LbovICFuWMxcc=;
        b=gqpcT1IlNLodVeVnXKaudmtzca25/xcOmWpiRScw+Q8zSV9hmzbGx3zOkEKE6eJ6vx
         jtPEf9FX/9LzGrgnW5DqBPGfYeDDB5JFiA2drA7hHX3tMbvk6NJ6FcDz0hQuPc+0At9D
         2pW1FOgVJMyFH+N66mK9NfFsnnLYM4UlYpga0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737649257; x=1738254057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dP4iIFxpGRxJIuWg8fbKde8yqpGCy/LbovICFuWMxcc=;
        b=WP1aADcjvcKljhow5mW3rfgpsoPLMWPsQKo07qe6FAh+1pLQOFiuQ+0f3EckAXcTKn
         1Kw6D0RZkBdYiIBS33wm0Td7kh1rvt+ZQmK6fPoVVibEKEqqNJPhusLNeSHgdlfpwxCS
         ykaT+killlRAf7cTTQHLickRzTRPV8XRgxFNyhnx0mT1svO9lliAo4xt9aRm/YpWluit
         wK8v2BRiQF1fZUqIAHGsUZTD3DkF7JD/Ls9+VIpryVyJzyZ8vVQAIAG6zNbx2RANorWq
         tHfUqpO897cDfe4yOyRS65oJWbgPGoG3dw2tY/NrFprfzLCtKEHOFr+YpjI8UypAIKHk
         6jqg==
X-Forwarded-Encrypted: i=1; AJvYcCVMMadte6Tpt40RZK5O4lcvh5BdWSID2RiNXESs2jjPWYU4w00RakJ0eLYZkt1obJ4aRkYUbB/tqpmke4I9C5FK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr5kLKzJdmy5xaZeGiP9kqJCk0HDb/uhVsADFFQm+CXIzjfdNu
	axemjK1+ulHrnZeNCG3EqXpftrLURZKFzdu0ehB3Mo6HAx4xvMmh14fYY8SQ4NUF6irvddLWkRj
	rfrrhauVKJt9+2ZbKurxtuu2dyFMgy1CVfI3i
X-Gm-Gg: ASbGnctn9LC3C30ODxnZhl0cZJ1wdp30Vp5R1ud+V4C2slv938F/hX0jKn3Ujv4hmjm
	uutecRa4VivduSgE7SdV6ZQPWHEntGbArE/eaFTkcnUz892EFA7r5Q7yhxTew3lpyDPhlT3/WG7
	+y1bDBWSO6gWbwjs8cuQ==
X-Google-Smtp-Source: AGHT+IEKUB561xRTvYxXd4p0qNfpMRKfCZE8QX0G+Jn2kD2LonKgpFupCThYaQ1M0nTLUAE+dgJAYJFA1Lqm+sRFeOA=
X-Received: by 2002:a05:6512:124e:b0:540:2549:b5ad with SMTP id
 2adb3069b0e04-5439c246d35mr9447895e87.22.1737649256790; Thu, 23 Jan 2025
 08:20:56 -0800 (PST)
MIME-Version: 1.0
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-5-paul-pl.chen@mediatek.com> <173651725269.2671643.2891127782637834272.robh@kernel.org>
 <SG2PR03MB66367B4A9DBCC971F55DB326BC182@SG2PR03MB6636.apcprd03.prod.outlook.com>
 <d116e180-a056-4595-851c-ed1bb6f24cef@kernel.org> <b9405b09da418eb3c65592b53489d7f0dd4093f2.camel@mediatek.com>
 <e6fd5225-b437-4f3b-9835-f206ae4b9d2f@kernel.org> <843f2dcee012007572f41df991e52369c1e5ed22.camel@mediatek.com>
In-Reply-To: <843f2dcee012007572f41df991e52369c1e5ed22.camel@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Jan 2025 00:20:45 +0800
X-Gm-Features: AWEUYZkfWBp2Lo-8TZn9tTq4YyIX0WXHpEKOlB7N1Mjjx7XBDKyByJYKaE3h9KI
Message-ID: <CAGXv+5G8C8F5ua595Z3zs-D4vUP6YSUaxaUTGPQY-kfZ6am61g@mail.gmail.com>
Subject: Re: [PATCH 03/12] dt-bindings: display: mediatek: add EXDMA yaml for MT8196
To: =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>, 
	=?UTF-8?B?U3VubnkgU2hlbiAo5rKI5aeN5aeNKQ==?= <Sunny.Shen@mediatek.com>, 
	=?UTF-8?B?U2lyaXVzIFdhbmcgKOeOi+eak+aYsSk=?= <Sirius.Wang@mediatek.com>, 
	=?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?WGlhbmRvbmcgV2FuZyAo546L5YWI5YasKQ==?= <Xiandong.Wang@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "fshao@chromium.org" <fshao@chromium.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	=?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
	=?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "treapking@chromium.org" <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_082058_747698_9B5F335B 
X-CRM114-Status: GOOD (  24.07  )
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

On Fri, Jan 24, 2025 at 12:14=E2=80=AFAM Paul-pl Chen (=E9=99=B3=E6=9F=8F=
=E9=9C=96)
<Paul-pl.Chen@mediatek.com> wrote:
>
> On Thu, 2025-01-23 at 08:21 +0100, Krzysztof Kozlowski wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >
> >
> > On 23/01/2025 07:11, Paul-pl Chen (=E9=99=B3=E6=9F=8F=E9=9C=96) wrote:
> > >
> > > Hi Krzysztof
> > >
> > > I hope this email finds you well. I have a couple of questions
> > > regarding the EXDMA commit patch and decoupling:
> > >
> > > 1. Would removing the example from the EXDMA commit patch be
> > > sufficient
> > > to achieve decoupling for EXDMA YAML and MTK clock/power header?
> >
> > No
> >
> > >
> > > 2. If removing the example from the EXDMA YAML is not allowed, what
> > > alternative changes could we implement to achieve decoupling?
> >
> > Don't use the header constants but just some fake phandle.
> >
> >
> >
> > Best regards,
> > Krzysztof
>
> Hi Krzysztof,
>
> Once again, thanks for the review and reply.
>
> SO If we apply Chenyu's suggestion:
>
> + example:
> +-|
>
> +soc {
> +
> + disp_ovl0_exdma2: dma-controller@32850000 {
> +compatible =3D "mediatek,mt8196-exdma";
> +reg =3D <0 0x32850000 0 0x1000>;
> +clocks =3D <13>;
> +power-domains =3D <12>;
> +mediatek,larb =3D <88>;
> +iommus =3D <&mm_smmu 144>;
> +#dma-cells =3D <1>;
> +        };
> +    };
>
> Does this work for decoupling?
>

AFAIK it will since now it isn't including any headers.

ChenYu

> Best Regards,
>
> Paul
>
>
>
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

