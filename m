Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8ABEE20A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0CsGpSSY891OKiqXJQcsVUYiswvS3iXbG826PIIuuQ=; b=gzSTiUuVCDAcLVggSecjwkoO7L
	vj71Q9rXDDk0OMG1lunLa6QAMwf2JM3ssviXsbD08mGuF8nfFam0/2YMg8ubTLoynk3rgK4URVHYS
	eEnmy05M8wknrE4fmeM7Xq8IgxcTEbj6IQjbyfkJqX6U9ZjWkKJRAk/SCtMqtQn6NNUi616PXockk
	HufaMLNKVZ8X4glxCi1Sa9b90bOqACOb4ojNY1iChFSypVturAs58yYLZUSUKQprsu71pIF0S8Wa7
	wC3AfuzkTIjc6OVmWZ/j7onq7L9hVnlg9l9OtbYoddEjNGiurvVzoqlhhpKJkqBMxXwhGQVWuW0Ay
	wtiH66hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMYx-0000000BQ73-2oJ4;
	Fri, 06 Feb 2026 14:11:59 +0000
Received: from sender4-pp-g121.zoho.com ([136.143.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMYs-0000000BQ5r-2cki;
	Fri, 06 Feb 2026 14:11:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770387104; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Xe9seo1vMmx6WUOY3sSHMnNIOKQE94sGkmuOejebW59ydYHPRriIBCIGZlw03ekUN1fLUDI+fTN+1FJsc/eLO4CmA07nNuazd5XOx8st/3mX8gwW38mIbAywTay++wk7uR4evhXW+KDFL/1HSmQcPhaLqX3FfYA1CCncHzfpu0Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770387104; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=d0CsGpSSY891OKiqXJQcsVUYiswvS3iXbG826PIIuuQ=; 
	b=A4x7TaYLxdxzUvo6g7NctDqcPs/B40PM7hC4cYr5N1b2xQuR/ACxwBB1CPwK9Pnc/VGrVUFLxEw5LrkFQ+0bVfNfmWEU+yb7vp4SY6STIoS7nV4uhgjzOzC7Z8cY4aWpOlhLVhMkK1tchdemy36pTwZCD3MesPLUcoiPi+dkLVo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770387104;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=d0CsGpSSY891OKiqXJQcsVUYiswvS3iXbG826PIIuuQ=;
	b=arY3KAn1xw8Bz+nVBksW+IvJGFZdH5eW0dZUrSlL2ivHZh4FezVPorvy5bg6W1WZ
	zPXH7P4NuuF63lI06B4H6DHlKXOqJK6ZWDq7dbHX6CRgL3u7cv4COcIWT68Zog3/1ZF
	KWPCkuoldm5fQqAV9qWmIkxrHjHVkJMsm1igq5TM=
Received: by mx.zohomail.com with SMTPS id 1770387102870235.0357198020231;
	Fri, 6 Feb 2026 06:11:42 -0800 (PST)
Message-ID: <3ebf96e04a4476ae58086f223ae68f422cd9e812.camel@collabora.com>
Subject: Re: [PATCH 04/11] drm/mediatek: ovl: Enable per-plane color
 operations on MT8195
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
Date: Fri, 06 Feb 2026 09:11:40 -0500
In-Reply-To: <e92ca2a7-7a7a-4a00-9fd8-ecacc588ffa9@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <20251223-mtk-ovl-pre-blend-colorops-v1-4-0cb99bd0ab33@collabora.com>
	 <e92ca2a7-7a7a-4a00-9fd8-ecacc588ffa9@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_061156_817561_B1A57B4A 
X-CRM114-Status: UNSURE (   8.57  )
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
> > MT8195's OVL hardware supports per-plane color operations. Enable
> > support for it in the driver.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>=20
> Agreed, but you're enabling something that doesn't exist.
> Please move this commit at the end, so that you enable it after it's
> all
> implemented.

Ack, will do it in v2.

--=20
Thanks,

N=C3=ADcolas

