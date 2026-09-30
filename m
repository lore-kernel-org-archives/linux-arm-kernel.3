Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13124C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 04:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=; b=qtyoTKN3PDCY75Vu9nD+lX0nUF
	alpp5RkVztZSrvhSCKQIi2m18BHI+qiLfzCWAn6BgZqXxGD8bTvDxT+cqD5Ti+/Me3IHltBc+lfA+
	K7t0DY/sLU/JeIaM4+aZkC5Cm4gEGIP29ASbuF2f2hTGP9L+TwdZ3i1/ZQVVcfvVuHfUsYpTZeKY/
	ygTzpzODjJxdZcAEDo1pqNnBZzVJsxgH/M9JXALN3Wmkk7YwMapqumyT/qukhgtqeA+KWi9YMnTdN
	oS+s1AuX4uO6kREjrN6/KpOzlomaFwmhevu7cFxshVHk53Y8brgUGRSoJjiWnzD0OkYei5FdHgHT/
	ADioSicQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBliB-00000004zIr-3MFO;
	Wed, 30 Sep 2026 04:14:31 +0000
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBli8-00000004zIF-2Gks
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 04:14:29 +0000
Received: by mail-yx2-x11.google.com with SMTP id 956f58d0204a3-66e4ab201ebso4734864d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 21:14:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790741666; cv=none;
        d=google.com; s=arc-20260327;
        b=es9CDqXEo0BVv1D8FdbsyDhOa5FjddfPtSWwR3kLd0Brtc/hOd+biXFx5lHWWyRp8C
         otM3pk+lr6xYAN3/ZiLth034R3AM9HUObXakXYcEOjemROIQAaQIsyK77EBt3QdzZ/BY
         TC+F1oapgiQRwkSIzIPdOwam3APGIPg4IHGs0PBipsMuon8uYYPVQcm8lBO05Z5ebO5d
         N/OrS1LG+wE1YmXKYSYPMr9ECk2rcYYoMVUGRxOeDedCNFwGNaNDmp0TH5qEMFApKFEd
         aA1a+FF8iLnkYg+QTFwJaETxNuoAmbNi/oaExvSib4v9zePaGiTLvX19BKmXYn36Suts
         oBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        fh=+E0uyyuq7SJVHIGvU6pvekPUcdlGtINDwPXbdYBvroA=;
        b=j5kF2nxtJlYI9KnSXFdAUl1o2/ER8tdfHGKbgot/HkuyqK8XreYKBDFAqAlVXR1BF0
         /C4Pwonn/K8Xpjn7+7mfxlZXZmKpeOXYMCCO7/7fV8NetYFcSj4iPUfCfeDlyPH6T9Sa
         QkDSo4OZmNV9HEYbf3rqbrcLqkBTCuhQdi2+y11AnTtHawRoYZsgw91VaP5VGSpWO7V4
         SCpktE//4/b8tj8ePWZH9nchCSZgyipzPwP3zEeiO1baRVvbV+wOfPFhkUvFCv3Qu9jB
         /4U9yP75cTm5AcmjAnIGQnLe3T28Bp5wxrs4NGqyyE0vKy2CNgGQSwI2bfNfsDZjvu0V
         ZTSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790741666; x=1791346466; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        b=K3nAkNIW4qJkRxMZ7CGOtsjfk0XA8uw3S1jBYB3Oee+dLuShWtVm30Kjczkg3yMwjw
         DAo8LGOA/QFjRS6SPl/3VqwzG7GuHrrkF10xY8VsVb/5EORkPOz+hWqWMsfkCXC09+ha
         uGlurIPF/2Y2BM5EpScfC8ykqSKmO+5oPAndw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790741666; x=1791346466;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGZkzwTmnY9DlHAH8nSxv7NRFKJj9m8v197rHzuwMIo=;
        b=t7ut8bVYAuFTPiCMGNDyiGZafI6g5a/qArdXwFy4aRhEo10ADPcYVjSbkzdqEctUCM
         GIM4ta4NztBwMCFZkjF1dvBTiQgNT7JOjsa5XZGvkx/Pp7UIueFIpR6v+OpMkbwTamXN
         jWkslVHmeDjX45XoRf6Mu3quNdgQq8a4ff7icVqUqasQnXRDa0i123qaWBwaHfO7CS52
         jSCLa8PNMzVDsuyu/0hpHbjuWI0/vguegu2AuZn7mw6924ir2SJAn+QDsomFX6GwKIuy
         ANoNEr4z0aCz20u/pi1DA+hmvmSkLCZn1wUFgcTH5ZgHYKdYm5egheHfM8DB9RycLWSl
         Puvw==
X-Forwarded-Encrypted: i=1; AKwUvBzdMawfo+U/Cruj/BMFw0sGqxRSlnscvaiceVAb0jNjWkO7q4lryUYqBuL3GBu3/7uaV3o+2iJN1BDl3rACEtV/@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2DdOrp69iPa+yxNZZDlC+MBTBuF3mxU9i8dn3Or3GLm55d1tv
	dlPkAdiP/NPy/8hxc/Q6fSYOgk4JtY5dRokdCtjPwvgGkEpgRI/SOilZPjtduY13v/wosrUjpCH
	2nhA6y0tkpePycYvM+5mnHXnIF/HLJiQqrFaSBrUJ
X-Gm-Gg: AYBFou2ZmyF10UYfyDeNEfwrZUo3uXPA75UVinFHoeo+jByYc5xxZlWO1DhwcienC4C
	RdupqN2Nmyi49UcSa5ZUAAOFrpbV3d/iXVejV0sgJczG51D9FkuaGJeSaIzeQ4By7vitZHSu1ZK
	6WehdK750yBuNl5vVHHFr6NHMQ5/VKYvKAB0SmuLjpiKkbN+SkcHxNu65pv/cpbpErtkB4ZTBHl
	BgVsXz5SZDlKEtD95MeFL+zK8kXXZSJHHOzXoFGoHx6t56eKo++bwHRJ2oSuu929UuJNTBCdlCM
	VySwzSfEdvWrVsT/SlvGR58KippZ3BI3FlW6aY2IyZDjb6d1/1Fvh29UnN8J79h4TVcV7lcbb9y
	TI9pNsQz/eA==
X-Received: by 2002:a05:690e:4197:b0:675:405d:643b with SMTP id
 956f58d0204a3-6768349a6c4mr76844d50.98.1790741666569; Tue, 29 Sep 2026
 21:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260522101653.2565125-1-paulk@sys-base.io> <ad9788bba0851dcb86c22f40c2562f2a57ac8e6c.camel@collabora.com>
 <CAOf5uwktfp0a3Vi5Jd8Zw5knGMHd_FH=iusRX1NgHYC4VSuzBA@mail.gmail.com>
 <arQxC3DmDyVIGdqq@collins> <CAOf5uw=SeHZSnYjPOptAGYwPkQc7L7gDpOrDWJH3UF0r1qdrtg@mail.gmail.com>
 <arVnQmik-CveaAkY@collins> <CAOf5uw=K5tWiodM0SEP_nFn0vBv3=YRFWrY1Bd-1jPmZtM7G4A@mail.gmail.com>
 <48271d518bb25f552309de12758e9a9995905f0c.camel@collabora.com>
 <arWIcrSFkEA4GMTY@collins> <013b1e7ceb7cf046888109631e72ce4c408ab88a.camel@collabora.com>
In-Reply-To: <013b1e7ceb7cf046888109631e72ce4c408ab88a.camel@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Sep 2026 12:14:14 +0800
X-Gm-Features: AclHuK8VlKUTvMI0v8jjtLYpqVzk8qBeIKfHOI-d_wW7lfMXYke40oAj8SBNDvc
Message-ID: <CAGXv+5F8iJQJK4N2g8pmpGQVf8TxNvkC5Gm-RZ6F4HdQaThXpA@mail.gmail.com>
Subject: Re: [PATCH 00/14] media: Add V4L2 H.264 stateless encode and VC8000E support
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Paul Kocialkowski <paulk@sys-base.io>, 
	Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, devicetree <devicetree@vger.kernel.org>, 
	"open list:FREESCALE IMX / MXC FEC DRIVER" <imx@lists.linux.dev>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-media <linux-media@vger.kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	Michael Tretter <m.tretter@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_211428_654049_611792A4 
X-CRM114-Status: GOOD (  23.26  )
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

On Fri, Sep 25, 2026 at 4:46=E2=80=AFAM Nicolas Dufresne
<nicolas.dufresne@collabora.com> wrote:
>
> Hi Paul
>
> [...]
> > By the way if you have ideas about specific problems with the stateful
> > API that should not be reproduced in the stateless one, feel free to
> > mention them.
>
> Few things:
>
> - Drain flow should be as simple as for stateless decoder, there is no
> reordering, and so no holding on frames.
>
> - Capability query should mimic the stateless decoders (but up-side down)=
.
> Basically, we don't add a pseudo unset state, that was bogus.
> V4L2_FMTDESC_FLAG_ENUM_ALL could be made mandatory, this is only partiall=
y
> implemented decoders today :-S
>
> - Capture/Output S_PARM, maybe review/revisit, but likely still needed,
> otherwise the rate controller can't know the rate.
>
> - S_SELECTION, maybe make it mandatory for codec with a conformance windo=
w ?
>
> - Of course, encoding process requires a request
>
> - Anything about keyframe insertion can be dropped, since frame type is e=
xplicit
> and per codec.
>
> One ambiguity we have in all decoders at least is weather or not the enum=
erate
> sized are coded or display resolution. I believe technically, all statele=
ss
> decoder exposes constraints in coded resolutions, and display resolutions=
 are
> not easily enumerated. Not a blocker, just a remark.

IIRC from working on bringing the Chromium V4L2 code up-to-date, userspace
programs coded resolutions as the frame dimensions, and uses the selection
API for the display resolutions. And yes, the decoder exposes constraints
in coded resolutions, like having the resolution steps match the macroblock
sizes.


ChenYu

> Hope this is helpful,
> Nicolas
>
> >
> > > A second implementation, not just a variant of the same brand would a=
lso be
> > > nice.
> >
> > I still have it in mind to add support for the Allwinner encoder based
> > on my earlier stateful-ish attempt. Hopefully that work can be funded.
> >
> > All the best,
> >
> > Paul

