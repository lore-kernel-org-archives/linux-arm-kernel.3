Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49575CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JfRlA2NUhU1kG602IPax22A5h+dNSAH5OIBQUrcaHKQ=; b=J5TboAJJ+iK6cGRuUqGE9JosWc
	v3taZTLDhNKRo3f9UYOx66pb0OAvk9VHEnL35rTOIS0ymY5k3Gx4h4dfbavc7NxqeqloOK69gKjF1
	yv8PruDXwZSRLgrNAGBFYhdPNoeVzRBFTno1hY3Jvuc62B3xDLXTrfFYkifIZcKY2trNganYZ3t86
	6CUaTv3bnSJHf9FuXyBP2SNmhQc1Po2TELxvUbSnRwYQMqvwFKK66u54uKVGgkh+jQLW3FmgfifuY
	UeojyTMLPmT5eeBGtXsQnrIW88Vb0Ue/EA5LBtmJmh7acFpoZGUY2/BUoPP4r+SQAMyqi5lvrErUi
	IDubRWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZLE-00000005F3t-2qvJ;
	Tue, 30 Sep 2025 12:20:24 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZLC-00000005F31-0in8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:20:24 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-79599d65f75so47820316d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1759234820; x=1759839620; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfRlA2NUhU1kG602IPax22A5h+dNSAH5OIBQUrcaHKQ=;
        b=b6zqCVnWAB5eVEH3cNEJjAWQueIHsDszHGqxVmubeJblwzSZRvEBqJEAO+x4jeuxb+
         LltjBJG0QN1bedAqESuqldaKoMZKxcHguwhACjsP42uZLb9GmgbfWlrNRSiYH3WASSNi
         59CafPiZCbpHUSrxo2r/7XjwDp3A8aF8zdnu0/r9JyRPn/ZwSSJMMlBYCeHDdJ+NIyFu
         DI0LFYGr1ti8YGLj25txNQ4PYBCRW0KZJmsWmm32CL55MQHUAqaXhYB0IQMIyZxDlwXO
         2yJAgZ68k/q9BJfUnR0y08WwOeFei4RELovIyum/AR8PssKh9itcUK5tz+nML+z1nYA7
         LpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234820; x=1759839620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfRlA2NUhU1kG602IPax22A5h+dNSAH5OIBQUrcaHKQ=;
        b=owvsoCT6z/p/TV5xdc3n68AowUcQcUhE59Lfq0NHDAhSGg6Oe1XMvKX9RUAF+lbW1R
         8JmFysfcbrB+jRP+/S2oF+cbdrSYra70vRuDMpt5+uw9DM3Y2gSkuWgPIGjqcczHZXt1
         N/BQUIccxsOG9r1YKuaE9hToM9uCPayna1J+Dmo0by6Phtzqrdu/pC6AenIGQO38lDBK
         0bFeBC8Wizn23sGlGEOv7lOwAyjXmJUrHpHt9/5h9qIxfRIAigjKcSI9OVfE6gX2oCw8
         AJhxgW6ocRh0sP6wgxlSFN7glKTaElMzhUqXDn+UNbrQLG0/HXhC3Jtd7glPYe9T+tYG
         a62Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLuJ1WL7cJFqf2gzWeQX5sGV383V4F8QnPCGbbdLGtcrrz56ghpwNQoWkrtfoUY/5FxnR3NTDFGnUjaa17vtG4@lists.infradead.org
X-Gm-Message-State: AOJu0YyzdkLrK5vIQN0Cnnh1y/d5fXnL0K0z9FPPXK/vyyvDIrkUoJzC
	HreOOxgGi7c048bVFrUNaQz0ij+VenS0oGcfx1U2h/NHazhxaOlX27J+TzyPXi5AYhMZfLzUEMS
	bnQgbMGaUzacfh3Mc61Pu9NOhFPdb0OH4QmeTdJOKLg==
X-Gm-Gg: ASbGncvLvykB6rDk/wEdeVnclvdCT5uQe2eEl4uILfN/CE1PUW7NOsp/CSSD4tM1Cqq
	qi2vopC+EsL0wyYvROX9+s/17xyLyYkvNZM9sE/pkxguWWawTaU7Js2tt2hjf2hlTH6AJTodH6P
	IhYq0H1vhzvLKXHeGDjH3Ez/4ROuYjjZldxTUpGwDe21SCp1s2r/qzVvRbsnfrbMUvZAha5PC9m
	hl4HsllAlm0aC0tV5VKVjsKOPiVlnGWOuKoL3oL
X-Google-Smtp-Source: AGHT+IGNbjw6RNqsJAvb7qKyVX9JU+8Q52yRLDkjXoWDZvMcGT/3qrwgZCNcyKpRwrI6Z9Mglf9tBhqM86fyt3kXMf8=
X-Received: by 2002:ad4:594c:0:b0:794:5578:6a with SMTP id 6a1803df08f44-7fc29999880mr292314156d6.10.1759234820411;
 Tue, 30 Sep 2025 05:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com>
 <20250822-mtk-post-blend-color-pipeline-v1-1-a9446d4aca82@collabora.com>
 <CAPj87rPAoD2D99zTdsvJ=9K8+G17mTS2jDYHMPYmXNtUyp2L_Q@mail.gmail.com>
 <CAFZQkGwotQ6cxVCSgp-BhUi5DaZ7MyVvbnrDJW11Z7ztzqy58g@mail.gmail.com>
 <CAPj87rMTOD3_tC70QX4xz3G4zdG=tmwt5VgPhq6jNyf8bbW49Q@mail.gmail.com>
 <269ca85a59f613568543f45867fba7e604cc9f11.camel@collabora.com>
 <CAPj87rMhsFy+uzKmNecrQG4e+BEoeX1FyEobO7bnHdQqhy1_2Q@mail.gmail.com> <2a985767-0fe1-40fc-b45e-921bbf201e07@app.fastmail.com>
In-Reply-To: <2a985767-0fe1-40fc-b45e-921bbf201e07@app.fastmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 30 Sep 2025 14:20:09 +0200
X-Gm-Features: AS18NWC_qgpU_0cN4JQ19aLDGw_PL71UmwKNqFB1ss4l60CpIYnHrco3rK8zc9M
Message-ID: <CAPj87rMHP_np_9vtnyJ_NU4S3W09DoMRrLPps-33hTngdLyKCw@mail.gmail.com>
Subject: Re: [PATCH RFC 1/5] drm: Support post-blend color pipeline API
To: Sebastian Wick <sebastian@sebastianwick.net>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Xaver Hugl <xaver.hugl@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alex Hung <alex.hung@amd.com>, 
	wayland-devel@lists.freedesktop.org, harry.wentland@amd.com, leo.liu@amd.com, 
	ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com, mwen@igalia.com, 
	jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com, 
	agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org, 
	victoria@system76.com, uma.shankar@intel.com, quic_naseer@quicinc.com, 
	quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com, marcan@marcan.st, 
	Liviu.Dudau@arm.com, sashamcintosh@google.com, 
	chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com, mcanal@igalia.com, 
	kernel@collabora.com, daniels@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_052022_363188_66537160 
X-CRM114-Status: GOOD (  22.13  )
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

Hi,

On Fri, 26 Sept 2025 at 15:45, Sebastian Wick
<sebastian@sebastianwick.net> wrote:
> So I'm going to argue that making the properties read-only or read-write =
is useless.
>
> The only case where knowing the color pipeline of the previous user would=
 be useful is if you want to re-use the framebuffer of said user. Otherwise=
, the color pipeline and the generated framebuffer have to somehow just mat=
ch to produce the desired output and that does not require any previous sta=
te, making the legacy properties useless.

I don't think it's useless; if nothing else, drm_info is a thing and
having it work is nice.

> If we genuinely believe that this is something to be supported, then my q=
uestion is why the new color pipeline should not be able to accurate reflec=
t the state of the previous user, even if they used the legacy props?

That's reasonable. My hunch was that it would be too much code in the
kernel to essentially just do format reinterpretation on userspace's
behalf.

> The hardware was able to get into some state based on the legacy props, s=
o it will be able to get into the same state with the color pipeline props;=
 it's "just" a matter of exposing the right pipeline.
>
> If we are not able to accurate reflect the previous state with the pipeli=
ne props, then use space will see inconsistent state between the legacy and=
 color pipeline props. Which state is the right one? We cannot know. The pr=
evious user could have used either one. So having the legacy props does not=
 help because we don't know if we should use them or the pipeline state.
>
> So, I would argue that we should *remove* the legacy props if DRM_CLIENT_=
CAP_POST_BLEND_COLOR_PIPELINE is set. If the handover is relevant for a dri=
ver, they should ensure the legacy props state translates to the correct co=
lor pipeline state.

FWIW, the usecase I can see in mind would be doing a fade-style
transition between the old and new clients. But I don't really care
too strongly about it to be honest; I mostly care about having
drm_info work because it's a super-useful tool.

Cheers,
Daniel

