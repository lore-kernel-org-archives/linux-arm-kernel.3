Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1000ED4A5EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 03:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KV319puhFj+Sd9x6IUkirOSDJKof5+w3klMiEStvyys=; b=RWY4xLjcfzghCcPQnXMAlVEIou
	n4A5YKBn2vVqY88BSspF7cfQGsfvxY7R5DS6fPw/V03Q+Y6b/BeMj2KrAZqHP8f9mZKtHyWlPUkuN
	iX3Z7Pgp0iDRPviIsuN1G7FsJOTactneICJo0xlgdSLEnwLvmIZvIIQG4LYep0SWytWSwAYb12f+6
	+90NaLwlwJR16h8dkG4pAA/2aT9AMof24FIymat2kMbkXhsMA9u40zwi0VNzKamBNHzooZIXOlto1
	AuEJ8SIJWddkxeW1kam+Q0ys8d12KrQRbVOz/5/mmoGdoULllM4ox3inZoyVjnhqILY05f6NpGbX/
	Kmdu3dFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaUD-0000000DX70-4BCr;
	Fri, 16 Jan 2026 03:26:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaUC-0000000DX6u-3LfI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 03:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D5F0560193
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 03:26:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89577C2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 03:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768534015;
	bh=fL5JEUdugUywOgfF3xS/1Yv5nBNWIwQ+xgwU4aZe6jw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IMN+Vh2rcuaRuzVSTA/fpzdCaDamxcHLJsq2vUF1GBizZflEBpSxLusCzExokoxLB
	 N3uGszAg1JvlIQPhxmv5aKNlx7FPly+tGJleQjRABIu+1TETR5otFEugenRNkQ5K3Q
	 sxcwh4HlomHuV85WZaBREVI2JtT/29DBrc6lM++RdyOJIwoVG0D/S2ANGPR2x/AdL+
	 8P6Ij27fveW2b2NRpDVUjRq7u1nb9Y71V1YoSB6KtsAV2Y22nmo57mBPlwOOwdwIxM
	 /jiH+9a3OjtuQIpWK8wBPPlSZ8mE0gpjv9u6SCEV5lDpSaIoI/XCGLDhonIVnEYquy
	 TRayhdVDfrxNg==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6536e4d25e1so2314840a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 19:26:55 -0800 (PST)
X-Gm-Message-State: AOJu0YyBIvKB7KmTJQXyv5rXXHmrNCUyZQWyXRiWQsHUW7oa35B8G2Wx
	DGvpn5J8e84VvZqNngbkm3MJqMu3LYWqBDOTcSEdp9++zlfpHROYPezAvGuxNIEL+1/81FwQgsC
	Na62Jt18xP0HGPh6EKjeJzKHqV8L8hw==
X-Received: by 2002:a05:6402:358b:b0:64d:1762:9ba2 with SMTP id
 4fb4d7f45d1cf-654526c8fdemr1205981a12.13.1768534014112; Thu, 15 Jan 2026
 19:26:54 -0800 (PST)
MIME-Version: 1.0
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
 <20260115174047.GA930768-robh@kernel.org> <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
In-Reply-To: <85ff0eb2-d942-4f85-8f1d-c5982bd31bec@mailbox.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Jan 2026 21:26:42 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
X-Gm-Features: AZwV_QgG6kq5B06g-etlYhXpjQuBrn8cB9pNEEXLMMNB0ZA-HxranZ5k8pyuI0Y
Message-ID: <CAL_Jsq+ELqDhPHeSL=Hybaihmj3QbXt3VmrJ2tC8iXvdoVFNfQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Fork Waveshare panels
 into separate document
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Sam Ravnborg <sam@ravnborg.org>, Simona Vetter <simona@ffwll.ch>, 
	Thierry Reding <thierry.reding@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jan 15, 2026 at 1:20=E2=80=AFPM Marek Vasut <marek.vasut@mailbox.or=
g> wrote:
>
> On 1/15/26 6:40 PM, Rob Herring wrote:
> > On Tue, Jan 13, 2026 at 01:05:30AM +0100, Marek Vasut wrote:
> >> Move the Waveshare panels description into separate document, so they
> >> can be properly described with compatible =3D "waveshare,...", "panel-=
dpi"
> >> and attached to "waveshare,dsi2dpi" bridge.
> >
> > But why do we need "panel-dpi"? Adding that requires changing a DT.
> > Can't you make the kernel handle these compatible strings as a
> > "panel-dpi" without the compatible?
> I can, but wouldn't we then miss the more specific compatible strings in
> the DT ?
>
> compatible =3D "waveshare,13.3inch-panel", "panel-dpi";
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^
>               this ... would be removed. Do we want that ?

No, drop "panel-dpi". Or really, don't add it.

>
> The other option would be to add the timings into panel-simple driver,
> then we wouldn't have to change the bindings at all. Maybe that would be
> preferable ?

Why can't the "panel-dpi" driver match to"waveshare,13.3inch-panel"?

Rob

