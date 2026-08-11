Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A42C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 07:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=; b=fbTEUJ2mvhfUaf68xfKts+k+9b
	iCFxxFCHUl302MXH910K0jaNZVSgaY9WhQ6ofUpbBlLPRtPLmQD5/Ym6z4yeB8/BAbjZkzWAB84Pw
	W6yrUSrGgERNR1DkBU4CEG6CmfejWjP5m5g0ZP9Lv77mxqVaWM5xNl77ZCJCQzeqauvVhbN3igiZE
	XWquPTyEEEDFC/SukPFx7C8VMuXYJFWEttjRD3gCOgAjNMX+l7eMyV0X9Tg5/UGK+sjvNmX+5oxCD
	YyioEGt8cMVTDJLvQrr6JEpwabMXbUZ805Doa0NEoGBqMY40bZfFsGkzisVvPTfNjD+jWP7bvTKYh
	abhkCIOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgzI-0000000DX9d-06um;
	Tue, 11 Aug 2026 07:33:28 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtgzF-0000000DX8l-3RSb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 07:33:27 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cace91f112so31411375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 00:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786433605; cv=none;
        d=google.com; s=arc-20260327;
        b=B9otDC64t6i7AJrOJU218I7sXtmPnjpDyiLMxsNL3vSxc2BPk5rCpJbhOTYgyTR98L
         ZYUJfgEQSTkoJZnymOB/6j5pGoXsjZDNn6L7Ppt6wL+5psXkX6Mw/wjjq28tZTN9Jpg0
         5vtbR9X9xkG1qEPR9TmW4YPZsCh3DFVsvkTDnKVyWeGcfbTAb53nhNRYdZuBuiLi+s/I
         S4dtZfW81Pl3tjydGxhM4au/4XIwsLTkBD6Ioqm5+evq0RPxmta0O51/0qqt9xFsJyVt
         OZpdl3ql/EtobBEW+qAtxOcX2n0YBPxLcaMTbnVy3WMcitmKQYRIDu2hk8Jal6vfRXCg
         jcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        fh=T67ANjvmCbSKJAvfLsMCa/A0zSGQZFMoJJpJmOlhrM4=;
        b=i+50c2/k0xMmEGjVSjEWgMOT5suyD6OU0FoAa6n9UhrCCjuLjPmwKXltb+9z9oOaM5
         tCdpIOlngHl+IkETLkM8pFI+1YQ/WmXp3pC2CSfGKVO1Gz/CBpJ8WJOSW9neIYpJ4Vy0
         bKoiWQaPB9EM8vRY5R9Opdh0S/QU/QQWbScAKX5tFHFjB+aslIMhep4MpQ9wo11wmCGY
         /S38PQLwbGxrACDdEBr2NYERc7q9mR66vUmQ0Zvyr8bYn2pxEVqwBmQ0ZQ77dvz+tDJN
         /Ut1bYMb/ONgPQHYEuK4LD/IycVzOpZ+Txgdua4n8DnDyMfYVFZaV5VYNR1bBnnxr3Cv
         K9Vw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786433605; x=1787038405; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        b=YX0FODnvUU0uOu87IEqyh+3+e70C27aP0FwL9IBtdbEFFyuZwqhRMXjT8Xm1XW/JcV
         a0BUIK8d2rHRCgTphozabpveIMyLaZB2nKzxP4yEQeuZskbHe1eHeQMqNmnU0BmGewf+
         nZADJ1TWJoZqYoUL9WEq2YOVfbj60IDXH7HUGpmtI31o7IOyb8bAAXI6ie6SRIYDU3am
         1XXlZlER7FaO11MHxZCEe6IFXCx93vcDs5Z0Z4IOWcTRo9i+B04KJubjPia9Z1KQHAvy
         DwV0K1x0fAaTWTyZi6h/nofy4+O1NneS5GdKlpW1fT1w4X3nQxdyt+k/0cbL6oT9QSra
         dIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433605; x=1787038405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xF99ad/0DOf4sVlgM38a6novcYoEr4EV6MAbjOWZJGk=;
        b=fnvack43dOCnCoBD1RDkbRIlQwzsAKXa8T/VLaEckQAJK4gAoPPEnqhPerA+hwhntT
         TkUlMc9+Zu1c73HKqqWe9mmiNKuJM3D/4MeNyPt3qwPEB72fidwScpTdcxyGqzcfx7NU
         Wt0jFRIEkDXe3+5ZuWpKR3HseMdd1+Mg9dWbcJYysaei1SdaBQYX19UBNwnEY1wKr5vM
         WqhwMmTmugDaVt/RcY+JYDBmTgEW+FQh6lK7DRDiDboTmvPGIn8FLa2sZGEbFTPQ6S7i
         eGUh0yen+KiQbQ9dTe7AlJvxl9za9giBEaLSgSXz158kEirkBuCImyPzwP2xTInZnz+j
         ogYw==
X-Forwarded-Encrypted: i=1; AHgh+RpqfWoT6A/2OFDWgyRCyUTbVc3IXIN0+kPU3AcM8MydXKN/X91QuDGeTZAJPWvAisrlhdpYsvHrZK03Zaw6HpLW@lists.infradead.org
X-Gm-Message-State: AOJu0YwhzQzRNuDVpiVb4KLgOSu7TYcWcrRNSVvVaRtjNfZoeYJufEpS
	yOu/AcL+yFzpBuaOXJI4D9olKiuPqt/Md+bvzrBLM8GQPuu2ejTQuDIERrEsJI6u5XOvQ4e+Zbt
	JQTfwhWyGt7gl3Zu6I3JpyhtyFWzrwM3bVwWU2T8=
X-Gm-Gg: AR+sD12na1psb0hid2SoBF4cB7HXCLmzNUkq8WWHt1YXLdbkt7ePFwONNAn3cYJ2/Bh
	GEUmVOsbOl08xqWHTjqkg+nXJRGEyZUcSjqlNLNee71faiBzudhab/GqHiHgRXZM2Oovo5xHH7z
	NTXr17vLzcU0kZXMkHP7gtZKmq1YaIMcE+VHdGPlz58RzEnLF8xle8y2k0/3LVCNtlLDDqB8No7
	7R40gWc2lt28qpi6WF2oWrCeEYyyBoiUxxJCHd+X2A2n+Ud1FGAhAlDnUqqVksf/9lENg/hiVlu
	Tp6OkKGXSALJgBXkZ72kcxVBWEUacVxcWzIc3BT9uRl/
X-Received: by 2002:a17:902:d4cf:b0:2ca:d975:5bbd with SMTP id
 d9443c01a7336-2d3179365d0mr16451405ad.20.1786433604824; Tue, 11 Aug 2026
 00:33:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <20260810-normal-cuscus-of-argument-4b230b@quoll>
 <CAA+D8AM9s7EX-G246Hf2=DOx5q2qXWg_MjUCaoJ8RggOjp+5cQ@mail.gmail.com> <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org>
In-Reply-To: <dc40dcae-3017-4e61-8c6d-7e6127e4ee77@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 11 Aug 2026 15:33:03 +0800
X-Gm-Features: AUfX_mz8xzcQdpAVFUpNZF46ew2dm49dWd2moRqPqyVHFf2Y0Ny2enqss2gXdZU
Message-ID: <CAA+D8AOQ_y7BdR4h+X6qxFygPU6h1iFV0cYXHN4KB370yM2Bkw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_003325_862216_03CE9F68 
X-CRM114-Status: GOOD (  25.27  )
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

On Tue, Aug 11, 2026 at 1:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/08/2026 04:28, Shengjiu Wang wrote:
> > On Mon, Aug 10, 2026 at 3:14=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wr=
ote:
> >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>
> >>> The i.MX ASRC hardware supports up to three conversion pairs (A, B, C=
).
> >>
> >> Which SoC? Did you read this binding you are changing?
> >
> > The i.MX35 ASRC (the original) already supports three conversion pairs
> > (A, B, C).
> > All subsequent SoCs that reuse this IP -- including i.MX53, i.MX8QM, i.=
MX8QXP,
> > i.MX952, share the same three-pair hardware. This binding covers all of=
 them.
> >
> >>
> >>> The existing binding exposed only a single generic audio-graph port,
> >>> which cannot represent independent conversion paths when multiple pai=
rs
> >>> are in use simultaneously.
> >>>
> >>> Add a ports container that enumerates up to three sub-ports, each
> >>> representing an independent conversion path:
> >>>   port@0 -- conversion path 0
> >>>   port@1 -- conversion path 1
> >>>   port@2 -- conversion path 2
> >>>
> >>> Each sub-port references audio-graph-port.yaml as before. Hardware pa=
irs
> >>> are allocated dynamically at stream open time; each active stream
> >>> direction (playback or capture) on a port consumes one hardware pair.
> >>>
> >>> For backwards compatibility, keep the old single port property but ma=
rk
> >>
> >> Why? Did the old hardware change that it has more ports/paths?
> >
> > The hardware has always supported three pairs; the original binding sim=
ply
> > did not expose them all. This patch corrects the binding to match what =
the
> > hardware has always been capable of.
> >
> >>
> >>> it deprecated. A schema constraint (not: required: [port, ports]) ens=
ures
> >>> that both forms cannot be used at the same time. The binding example =
is
> >>> updated to show the preferred ports form.
> >>>
> >>> No existing upstream DTS file for fsl,imx-asrc uses the previously
> >>> documented single 'port' node, so this change does not break any
> >>> in-tree device tree.
> >>
> >> Does it break other users of this binding?
> >
> > No. The existing single 'port' property is kept and marked deprecated
> > so that any out-of-tree device tree still works without modification.
> > The new 'ports' form is additive only.
> >
> >>
> >> Why mentioning upstream in the first place? Either this change breaks
> >> ABI or not, explain that.
> >
> > The deprecated 'port' property is retained, so this change is fully bac=
kwards
> > compatible and does not break ABI.
>
> So why? Drop redundant parts.

Ok, I will remove the sentence below in the commit message.

    No existing upstream DTS file for fsl,imx-asrc uses the previously
    documented single 'port' node, so this change does not break any
    in-tree device tree.

best regards
Shengjiu Wang

>
> Best regards,
> Krzysztof

