Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347A0FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=; b=FCP3XLfXl/zzeqiTgsQTQ5/U3f
	ZoW+4N52QGsUKCthk8OFbVARIoEu3h4FNR+yxJv9I6XnVT1PAx5IV3nL2g3+jlflr+sNpnPH5FhmY
	CsEN/DvZQfs3kbyPC0koJWp5laCpkuO5kJgu52RAl2Nxl1mX/ewe182aI22leILypSyYZfy0lmLqy
	SSva4AdHBj6NNrznbuyg0MDBqugrRgkUwljOSct/sSV7NcjxUQcfJaLw30jRUZpt15mP6YY5eH9+y
	IXxUwpFkuKBgFH1UD/KdP+UwojaLn4p52oFPVLmMS8PywKH+jo60OUdRgpR1ALfLZvHb/oq1Pp6it
	LyfYD+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcr7-00000000zmN-1LUy;
	Wed, 06 May 2026 14:04:05 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcr5-00000000zkW-2eQu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:04:03 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-60fee2fa3b8so2255266137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778076239; cv=none;
        d=google.com; s=arc-20240605;
        b=Pq5O9Yzpk96J5YlIkQOE6/QTPzBjrhhMgYtOz+8+D6jzcbylwEvRP6Bq8wpZkkqQ8D
         er67neOJs2zs+MggVtXnG8cdHNAZFErIS05gMr4PGKDrU259ALZx2kBwnGXjtd0kMw3V
         13r2+r2OMjNvEJ0F1ONXN5mjPYBdr7L7OsdRhH6l1mdUOWgT6hNov8HvTd1PvFde2b1n
         /AnyKb8h8HxKzrPgkf7cuJl6pMUTukSXNDL4W+bZcsXB/9v+WgABWo0mwSuaeJ3e7Ejq
         2uWnyBgiIrt23ElMk+jDknRZ/avoEBuFduVxFm0pInbKiI9l/MO0MubWKD6+yElm5idc
         NYHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        fh=/0zNHY/TPRRMRSnkmeytoE9JkV8DQsFebxakHElwlPc=;
        b=a7k2NL/kE63Ag6N3dsTVSjlGQRw/+opcXXFOMYPdUV64I2+iG3aL1kgEmxGT0AA9DH
         8qo8tGOvJbFfgqH6U44CVDL4zO38IhHT69+CmfVIzmXmdlYFvlYWpFf0Mtrky/a9kR0S
         3hcrZDV5OwDXRjsQUwddTt9ewR8gD/3vbtun1HmGvLSjCaLv/5ZXYbtB6N2iE6Vv3VGq
         NJtIYGOIm8bnFLDPi6umZd81SuqXtwTHrSmnHdk1JzwSLAhd3s/NbScC51UP7Ej0bHiZ
         rKkOB+zbFFmCoaGBNADY9ay4xJ2VOXFpy6AvJeYehrJPvNnJxkBUJhqn+cwX1wcghhuN
         25og==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778076239; x=1778681039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        b=ECCMkgyp1ritS0X3DBpzwBAV7Dg9bCmF5XyoCuZTDXAAdDQMv8eMPMONRyebRuW6v1
         pYVQKoqTCdKoBV+zFd1IbrQNejH24ErZ6DFaJVQpf0wwgM67bqOo2eF0gsUyW/XH6Mo3
         yshKAsrZ8RP5gnEXjBYh9Hdp04dH7Zn685vCefJXKP2QAUkAfMGmB+KwALLpkRO6yig7
         +kL5oXEwBA8lg5PZ3FKB9IEFKRiGIFJZ6nVxMwWnMzp43LyV3AH0Av1mC2jJXSlL5/E0
         X4nrsc2BIlwNscGFvda+dev6iwKmk8tHSMG4Lq4KDaLjsXRVSv7Z+15/K4mzo/4km1LR
         bwWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778076239; x=1778681039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsD9mMCCpukEdwiIZPox/sOpEjhE31kEGDjuvOB20/g=;
        b=YBd7AookKLwynt2NU9Np0743t0+4R9ykThrHlVhsFyEcasOWvmkBwbS2XXWrrmui+R
         t+Ems0zWtW3Nm7KQc/XOpNTxUcbyl1ap/tEoYi6L7PffJVFxuehBpnuNbxZBDVpdfQ1w
         D6lBjwamOcoTP5oGDHOtzWfsP874WxzwObberjbIjE1VMfy5BVVXbCWbeY8TZydEJVSX
         1tC+bg28KdhqrNKqpyf3/boFHHT7+a5YgWNZjcjVBvJk0GJpIoNOzzwqSSFBYbnh5jLv
         cmNtvonjQaQOrvaUsMAnoXMWAYgN5w/gCtxBEk0TRtfnraAe6okecKVVkKeb9hlZP6TY
         PjBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Hn1C+MYu7yBjDphQPVm3hdYmMDze9L4YlLOSR6TAQm0n+kDhtd0E1WshreMJ4mgmuoZs50dT9F2tpp6n3x9tB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1N5azeaDYS52LjvuiIE7nYZjW7Hyc33IOp9COHRPhMmUNskcZ
	QhlfkfJvOy+0lMzN7o0f1yjqiqkB9HSYOW5T4unajw3yJ7FOD9EQGHpH0X+0DuENUcSgGhnkaNo
	O/ZRIGcyrndTHqjPtOfVGT2kVyHvofYM=
X-Gm-Gg: AeBDietCir/4wXi9rqVJvnddksqHqqFl2JMCG7dZNac5sy4KTlAC9s0o8xJCU+/2ekC
	i5NwnxAnNXFvcP/nMeA/SQhfGg1EJL+9tJ9efG8e1CyK0mfBRThLa+2gcrF0NwYutgGLy/5YsKF
	yYVVI6p6qHD5RHb992MunzeeDxJF5tJ+YDtGX1Sh6key6NrySwZYqlRCfV/KSN59WIUnnlVi0Vo
	FL8oDoxKydPvMO0dKvhvScYhOQdYi5dFFEf7oJjKUBR/BoSCWbvWjy6ViTr45GsVofusVKmOvkC
	3rLO8iQpOGNxN6QIOswEFO+gtag/xkB7mYKM84TqLG97kr1rhg==
X-Received: by 2002:a05:6102:4a8c:b0:605:889a:89a1 with SMTP id
 ada2fe7eead31-630f9041b24mr1272953137.23.1778076137325; Wed, 06 May 2026
 07:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260501095433.1609309-1-mitltlatltl@gmail.com>
 <20260501095433.1609309-4-mitltlatltl@gmail.com> <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
In-Reply-To: <OmTXoHZJTSGePymL9I-1Cw@puri.sm>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Wed, 6 May 2026 22:01:22 +0800
X-Gm-Features: AVHnY4Jp93agdi_Y8mXGWuXYD7rYu7UJTV_Ohq4VXA590K98lCrI7__F8JibURM
Message-ID: <CAH2e8h6YM1D6K-SKg8UUL_-jJ0uuEvU1iK-xZtguNTurfO-U4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] media: hi846: Add 6MP and 8MP modes support
To: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Martin Kepplinger-Novakovic <martink@posteo.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_070403_694198_57821595 
X-CRM114-Status: GOOD (  32.90  )
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

On Wed, May 6, 2026 at 8:51=E2=80=AFPM Sebastian Krzyszkowiak
<sebastian.krzyszkowiak@puri.sm> wrote:
>
> On pi=C4=85tek, 1 maja 2026 11:54:32 czas =C5=9Brodkowoeuropejski letni P=
engyu Luo
> wrote:
> > Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
> > mode for years. This patch adds 6MP and 8MP modes to maximize sensor
> > utilization.
> >
> > Note that these modes require 4-lane MIPI CSI-2, as the downstream
> > driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
> > operation on the target device. The register sequences are extracted
> > from the downstream Windows driver.
>
> Has this been tested in this form at all? I tried, failed and looking at =
the
> driver I don't see how could it ever end up using these modes in its curr=
ent
> state. It can only cause troubles when used with 2 lanes, while 4 lanes a=
re
> completely broken.
>

I may have messed up. I tested it with two more patches. The first
patch removes 480P and 720P, the second uses a new 4-lane init list.(I
just sincerely followed the downstream) Since I didn't think much, I
thought removing modes would not break things, I just tested without
the second patch, so it works for me.

> The driver defaults to its first supported mode, which happens to be a 64=
0x480
> mode that only defines its register list for 2 lanes. hi846_set_format wa=
s
> supposedly meant to check whether the mode returned by v4l2_find_nearest_=
size
> is compatible with the used lane count, but it does so too early - it act=
ually
> checks it against the already set mode rather than the one it's about to =
set.
> This means that you're never going to be able to set any valid mode when =
using
> 4 lanes without fixing this first.
>
> And even if this was fixed, with 2 lanes this makes some calls from users=
pace
> that previously succeeded now fail when v4l2_find_nearest_size happens to=
 match
> a mode that's only supported with 4 lanes. v4l2_find_nearest_size would h=
ave to
> be fed with already filtered list of modes to fix that (which would actua=
lly
> make the check mentioned above unnecessary).
>
> Of course these are preexisting issues in the driver, but they make it
> impossible to actually use what's being added in this patch and to add th=
ese
> modes without causing regressions. So far these didn't matter as this dri=
ver
> was only ever used with 2 lanes, but they have to be fixed first before a=
dding
> any actual 4 lane usage or modes that require 4 lanes.
>

Thanks for your feedback. I think we can use specific modes for
different lane modes. The snippet like

    hi846->supported_modes =3D supported_modes;
    hi846->num_modes =3D ARRAY_SIZE(supported_modes) - 2;
    if (hi846->nr_lanes =3D=3D 4) {
        hi846->supported_modes =3D supported_modes + 1;
        hi846->num_modes =3D ARRAY_SIZE(supported_modes) - 1;
    }

Best wishes,
Pengyu

> S.
>
>

