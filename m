Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA49C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HstpdYfbywLWh4CB6nynAIB64mnsBl07BDpNKOrgIFE=; b=Dxs9JNzG/GzYdQ
	ONBe5orPbyLzDGPFWvRM2EVLCOV0P8XxdgU82RhUnp1LtVCm89/FvTe6rU71CV9QjMMRZIgl6mk+d
	PX+U7YWtKfw8R+g+J31NNESOURZ2LOfVlbuBkfkdjL9dvTdtUHzFTkXuY19hkRBecmzM4wFnpJc4J
	gTFeWFtrzDhQ/yP3aqAaNgeA509w457dXsTWRQnQbqwTJl23rdhWiaQ2iX0mFsjPvaVeTB6xTvTc+
	q+HIrJvgdoUYDhqRiyVFT5LUa1LkOrEFW0TU1FZ90Hf4zO9qxr/HCXExWrX0LxxUEDx8/5Hv6EDC8
	9sJwzO5SiMBultGax2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohdG-00000005KEp-1wiR;
	Tue, 28 Jul 2026 13:14:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wohdE-00000005KEV-2Tuy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 13:14:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E41F43F88
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 13:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 262811F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 13:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785244443;
	bh=HstpdYfbywLWh4CB6nynAIB64mnsBl07BDpNKOrgIFE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=cCaobtUEdzz6WRAUNsTL3Z2vgY+Co9DP4VkHm+Gsb7xa6sbxVRRo0eJmjA0z5lLco
	 AEhqign9VQ1QldpFiba9OJX6QVUyv8VKT584kgql4jr0NllmZSJN+79lHqyIy2ug76
	 AwNOw/8sBO2jiGYABfcfoAQ1qWvEgMdVR48oD8gN5wnNzvGn1KqXUEOXgplHORXW3Q
	 R63ziezh8499ch4nkSEg/J2YWrYrfc+ktmsMa053XWGZamjCcJb2zyf2c7cOZOi8eB
	 WOOy/DpYkNYX1/In6ThKJH/honitiwtyjASzpa/u0XJnE+PGssiBRxQaPRUxX3M56q
	 xEXhTcDtCa+Aw==
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-495b250b01cso2131962b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 06:14:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RozOy+vw2RayJueZooYP3zn0khddpFl0vNv7ezHu3Ba9GZzlA23wPI2Rs/tT564oQC7U6QbWvyWpWEXvy/X4bdX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3Uao7q1ho33rkyi+T8RCCzEZRT87NF4UbPEqu5fpR6Wd16gDX
	gVtJB/pSmpfegV07y/52MuI1z6W33GyHtOfCPbBp8NQFPtd8+pBy6V/+PP3DYtG+ZjOaNuW7PnC
	aR2WhfYsdv0dDElOG42vVFTg9mED30Ms=
X-Received: by 2002:a05:6808:d4b:b0:497:ce6a:c1e3 with SMTP id
 5614622812f47-4ad5b9ee590mr1487519b6e.31.1785244442094; Tue, 28 Jul 2026
 06:14:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260728091804.382753-1-wenst@chromium.org> <amiqKRkFItYwD6oL@redhat.com>
In-Reply-To: <amiqKRkFItYwD6oL@redhat.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Jul 2026 21:13:46 +0800
X-Gmail-Original-Message-ID: <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
X-Gm-Features: AUfX_myW1QhqVL6Ph24cCnrD1naOOoxnlCT_fOiXs5oLs21mzKAdeU9Y2nOIEvw
Message-ID: <CAGb2v64zUO-azpTuei6LCypad2noGFbg+EmaBC1iidoZ2stQzw@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] powervr: MT8173 GPU support
To: Brian Masney <bmasney@redhat.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
	YoungJoon Lee <getfeus@gmail.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 28, 2026 at 9:10=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Chen-Yu,
>
> On Tue, Jul 28, 2026 at 05:17:58PM +0800, Chen-Yu Tsai wrote:
> > Hi everyone,
> >
> > This is v4 of my MT8173 PowerVR GPU support series.
> >
> > This time around Mesa was ready for basic testing, using both vulkanmar=
k
> > and glmark2-es2-drm (with Zink). Details below.
> >
> > Changes since v3 (all in the clk driver patch):
> > - Changed pm_runtime_put() to pm_runtime_put_sync()
> > - Added missing of_node_put() in remove function
> >
> > Changes since v2 (all in the clk driver patch):
> > - Made COMMON_CLK_MT8173_MFGTOP depend on PM
> >   - Needed since the driver implements PM domains using the generic PM
> >     domain library, which also depends on PM
> >   - Fixes build breakage (kernel test robot)
> > - Fixed "RST_DELAY_CNT" name (Brian)
> > - Dropped unused mfg_desc (Brian)
> > - Added check of clk_prepare_enable()'s return value in
> >   clk_mt8173_mfgtop_power_on() (Brian)
> > - Saved error value for return in IS_ERR(data->clk_26m) branch
> >   (Dan Carpenter / kernel test robot w/ smatch)
> >
> > Changes since v1:
> > - Adapted to changed DT bindings
> > - Dropped driver change
> > - Use same power domain for "a" and "b" GPU power domains
> >
> >
> > This series enables the PowerVR GPU found in the MT8173 SoC, found in
> > some Chromebooks.
>
> I'm making a pull for Stephen for the clk changes. Should patches 1,2,4
> go through the clk tree? Patches 3,5 go through the DRM tree?

Only patches 1 and 2 should go through the clock tree.

Patch 3, 4, 5 can all go through the soc tree if Angelo wants to pick up
DT binding patches. Otherwise I can push patch 3 through drm-misc.


Thanks
ChenYu

