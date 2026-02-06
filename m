Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C29DEE20A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xvam5HJNIvasJ/2nIByj8E9UTXU+JTYDZ6M6R68d/EY=; b=Kg33hN6CNzDVHt6Fy3eBQ5PDay
	gPpNvZuauuT+nrtimhYtj0t1mluGTY2Bxcz86uRK1q8DMhQE+k+ocQ+50QVLW/cXImC0hknf6qFQu
	G9MG+OLEd9LvXiModasf/gEpO/lgqpN8bILPeH8PnwHwVFDQzT4ueRDIDbR+WUMoR03DnXmejOBn/
	7a6JOM1jqqZrYKP5k1Oko25hdCjUKg/BS/Mq2uQcvmPwKP5s3fEQJBpYXkXw/GvKy5PHwXs/q3tvO
	/CNtiYJWFCHi/mRtt43s8aCcyEctfiUdbOIZmYivzPfLdKLwEjfOuIOdS5t+b/uj7s+8ZZnIzpPWN
	1CAS6Ulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMaj-0000000BQGK-2p4u;
	Fri, 06 Feb 2026 14:13:49 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMag-0000000BQFP-3w8T;
	Fri, 06 Feb 2026 14:13:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770387214; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Gt+coUoet8QH0TDqiquTwhBLpKT89/Akykd/Qhjkz+jl4xNs7KMymHAUTG5im9Or4TqucZ2BmEn0njypAvlSnrU0vHer9kUO4mDd+YQvjAJ7xO9uQCQea4EUtbJmT4IS2Ig54a4+ca3NVm9fI/d3E+WQezSKM8A8Ja9lrkLGPzc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770387214; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xvam5HJNIvasJ/2nIByj8E9UTXU+JTYDZ6M6R68d/EY=; 
	b=fUkZAKXTaUrhAz7q63XAWElVsPJYHqA+Hp0X7XdnlH632o2qI2OSov7SMd9nUGoF0PmMA/wqtpKjbE2HAkcHrxffcWcZnxTMpnzkxpOLwV7gSOSXYmcQQ4a3TWbPZxAXpOm04A0wG2pYjf3j0MTVCMGGFBFq3v0mEa0T0A0Y9vU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770387214;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=xvam5HJNIvasJ/2nIByj8E9UTXU+JTYDZ6M6R68d/EY=;
	b=f8S4RADjyViHt7femYhhlq9LTWkAFgUbqPBzyhXPNCt5x81+xJstzn2mZU0Dov8R
	OWuvJTtRyW7N00h9PTXZOZkhVtCBeqk0nb56eVlWAo1aCoVPRqA1NeibY5I/GS5aafV
	Kx0iTFB/RUyXh4pU5p/slXNB3oFcDjmaoP3h+Wnc=
Received: by mx.zohomail.com with SMTPS id 1770387213516827.7987217683014;
	Fri, 6 Feb 2026 06:13:33 -0800 (PST)
Message-ID: <9849130a6c4da61bd7291f40a9a3d224d32ef08a.camel@collabora.com>
Subject: Re: [PATCH 01/11] drm/mediatek: Introduce DDP plane_colorops_init()
 hook
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	daniels@collabora.com, ariel.dalessandro@collabora.com, kernel@collabora.com
Date: Fri, 06 Feb 2026 09:13:31 -0500
In-Reply-To: <8d043341-9099-47b2-a1fe-538502e40f99@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <20251223-mtk-ovl-pre-blend-colorops-v1-1-0cb99bd0ab33@collabora.com>
	 <8d043341-9099-47b2-a1fe-538502e40f99@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_061347_124448_1FD052AD 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

On Fri, 2026-02-06 at 11:07 +0100, AngeloGioacchino Del Regno wrote:
> Il 23/12/25 20:44, N=C3=ADcolas F. R. A. Prado ha scritto:
> > Introduce a plane_colorops_init() hook to allow DDP components to
> > define
> > how to initialize the color pipeline on their planes.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>=20
> Just a nit for the commit description.
>=20
> In preparation for adding support for per-plane color pipelines,
> introduce a new
> plane_colorops_init() hook to allow [...etc]

Will do in v2!

--=20
Thanks,

N=C3=ADcolas

