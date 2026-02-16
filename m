Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1159BE81A29
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SCVUnYgMVi4kTUebvJEg3W1kkZuExS+3JYLzrkgS550=; b=bFHxafN5pd226EJh1u97VgWMof
	dE49Cu9vNr2sY7wg3VYGmbo82vZzYfD5BSrfh06TwKgV2FSJgD08rl0zslM+NBV4Um2Gr0iLSrTp+
	O00MK8+kTHpVdgpj2jTCSBfBUJTmm6KO5uy7+nWoZHL1VaFJPJFTlkCG58vGqn8GTvlv5E/WxH68J
	JT4Ywo8bui+VHyUG/zD6Jn/Y1FQZC8gYyv4C6vGgZgokHhslnpNNXgdtZmxTz8WgKsG37LkjVQG07
	y4Trcf2D6TcYja/Lmbpt+JO97sKEx0jId1GjzoltoLUO/XIjw7yKmnxkIXxFnyuz5Fbh2NNRQQxc2
	mDXMwkcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzEq-00000006kjR-1Jf8;
	Mon, 16 Feb 2026 14:06:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzEn-00000006kj2-3yCi;
	Mon, 16 Feb 2026 14:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771250766;
	bh=dKwBFmk8gTB+srL/9ek2nPthdM7fpaKb3ygyY/JkJ30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=daXH3AgZRHGuQSpm6G91Sko6UstNpozS0YLFrmoUjw/Rpe3AnP4iEA08rdc/1QpEU
	 iOQ1FSfnjmTcrAMwoT6yMpI08gkGliQxUz7z419jy5052zcJpY2PpjwfEZ2BY3fJIg
	 6a7ZdmYtDnERzuG08ABsAZb+Ww46N876VTc0XbFmKhMQNJoizb31sJG3+UN1DiWkwv
	 eqC5dZKERGGNmQB3JNUGEjnJKTC79f9ouYZPljp8XLGXhwmWA/sknI4pKTEFDxv2Fq
	 J3evxwbcdaj3dggJTKoTvJqvcyJ/TYW3ZXMryj8XPrPutv65TBbmWKbCBmh15kBQC5
	 HIU39rLKbveQA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D32117E12A9;
	Mon, 16 Feb 2026 15:06:05 +0100 (CET)
Date: Mon, 16 Feb 2026 15:06:01 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Adam Ford <aford173@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Onur =?UTF-8?B?w5Z6a2Fu?=
 <work@onurozkan.dev>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except
 mt8196
Message-ID: <20260216150601.6703b0f3@fedora>
In-Reply-To: <4730819.LvFx2qVVIh@workhorse>
References: <20260215100302.136719-1-work@onurozkan.dev>
	<20260216104423.6b5bcc96@fedora>
	<523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
	<4730819.LvFx2qVVIh@workhorse>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_060610_175096_E52F5181 
X-CRM114-Status: GOOD (  36.82  )
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

Hi Nicolas,

On Mon, 16 Feb 2026 13:43:19 +0100
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> > >>
> > >> I wonder if a more generic device tree flag would be better here.  
> > > 
> > > No, we don't want it as a separate DT flag. This is all stuff we can
> > > hide behind the compat, and every bit we add to the DT we don't
> > > strictly need turns out to be a liability in the long run in general.
> > >   
> > >> What happens if others do the same as Mediatek or Mediatek decides to
> > >> do this with more processors and this list grows?  
> > > 
> > > That's what panthor_soc_data is for: you can attach per-compat
> > > properties without polluting the DT with more stuff that can be
> > > directly inferred from the compatible.
> > >   
> > >> It seems like a
> > >> panthor binding might be useful to prevent future bloat.  
> > > 
> > > It's actually the opposite, the more we add to the DT, the trickier it
> > > gets to maintain, because we tend to get those things wrong (is the
> > > SRAM really not needed on mt8196, or is this just a workaround to hide
> > > the fact the PM is deferred to some FW?).
> > >   
> > 
> > MT8196 has three supplies: core, stack, sram.
> > 
> > For example, the Google Rauru Chromebooks use those:
> > 
> >         core-supply = <&mt6373_vbuck7>;
> >         stack-supply = <&mt6316dp_vbuck0>;
> >         sram-supply = <&mt6316kp_vbuck1>;
> > 
> > As of now (in our midstream trees), these supplies are declared in the gpufreq
> > node (the performance domain controller), and required to be on whenever GPUEB
> > interaction is needed, other than whenever the GPU itself is, well, needed to
> > be powered.
> > 
> > As of the current model, these supplies are getting powered on and off along
> > with the MFG power domain.
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c#n1005
> > 
> > I'm not sure what happens if we also add those to the GPU node... for this, I'm
> > adding Nicolas to the Ccs, as he is the one who developed support for EB.  
> 
> Fairly sure they need to be on as part of any of the operations the MFG stuff
> does, but I also am not 100% sure on this because I didn't take notes at the
> time.
> 
> Either way, this patch shouldn't exist, it doesn't do anything useful, as a
> missing supply from the DT can be caught with `make dtbs_check`.

Well, the fact DTs lacking the sram-supply definition went through
is a clear sign that `make dtbs_check` is not bulletproof. Not saying
the script doesn't work, but if maintainers don't run it automatically
before merging DTs, it's going to fail again, I'm afraid. If we had
enforced that "supply is mandatory" rule at runtime, we wouldn't be in
position where we have invalid DTs/DTBs merged/deployed, and I'm saying
that as the person git blame points to for introducing this logic :-).

> It does not
> need to be booted on each device to then have the driver abort probe at runtime.

Now that we've merged those DTs we can't really fail the probe
anyway, because that would break DT-backward compat, but flagging those
DTBs as broken (with an error message) would be better than pretending
it's all good, IMHO.

Regards,

Boris

