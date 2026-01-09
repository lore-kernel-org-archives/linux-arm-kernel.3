Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701F0D26D8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vf+18t1t2iJMep/ahqqAufx0XkAXBscr4g95xemYq98=; b=ukz0xIk2YL99T5OrKPQIHxVmZ9
	XwCWNLHiKt6LgZM1QUx7I/wfC2bLsb3z6SMeiVQDwnhgvOVNEqAZE/0M/nSBzHVwSTI4aROrkEH8J
	34Khn3cunaYFQHhlPmSZRfTfhluehZ8Eim5OZgIB5x7mwGw0lMWMHHXebGu3unOS2p5tmVKBiyVA8
	SIHpDEVM7+lFX7T1sFRa/04Fhka4+YMC+Y9SxSf1xj+eTD8z3RE2iuHtGx4IrOJRVuQGjfDVgbPy3
	aokRmQIBGPIZ4oGMJjW0z1PvhfzmoxaWU0P3k6FRp1zr6fa5MrJpc9wTvgYOYanP+NyZ7DLnEQdXM
	IUL19NXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHDV-00000002st7-17Ds;
	Fri, 09 Jan 2026 18:28:09 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veHDS-00000002ssM-2n9k;
	Fri, 09 Jan 2026 18:28:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767983273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XTfBx+aumr4r26qEMS0RwjcPnj46PAfTi08A3JujHbeFikRRVTo1EPKJSc1Dzuc7kAKCVPMoR5UlHqVmL3gWIJkcSftyOpn7IJSgRadPHgaHw2RvlHEx2YwrgIN7ByHTT3AvEaqtJuGwMi8cQxtEoEUdxtm02eruFinn7lOnBe0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767983273; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vf+18t1t2iJMep/ahqqAufx0XkAXBscr4g95xemYq98=; 
	b=hKMh2q5w0LGL936lnYAYGf/BrtTTYdMOn1o7pRh7IySWJk3IER6bA7bs5iOIxkWFY90VvWxUYnEGeKeszgw2RYrE3RwdzX8ZFJICihuHE0zH2gxes0MiCXU4IsqOI3QfjCQ8uBfk2FAGNALKDTE2SXRa8nsogWCsW3YHau0qA7k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767983273;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=vf+18t1t2iJMep/ahqqAufx0XkAXBscr4g95xemYq98=;
	b=TTq2WD53kIq8HjDxVYzDBy3cFCtsADCb9pmD9cI6BbKE2yn9UTm+uAWXHTwtwRvw
	Tsg5MuB+RIfbS7sbk9EsnBlXAoaF+WIZpX2RkfmNqLGoqTNeo6BCuD8BpRWzqHeCskC
	iPYvw7SwJVXYjavI8h+pmYGrJqLCRif/N2UOR5Ck=
Received: by mx.zohomail.com with SMTPS id 1767983272320533.4804385881307;
	Fri, 9 Jan 2026 10:27:52 -0800 (PST)
Message-ID: <cc128facb246d89408cf46aa7c9e250c56900940.camel@collabora.com>
Subject: Re: [PATCH RFC 0/6] AFBC fixes for MediaTek DRM
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel	
 <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Simona Vetter	
 <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Justin Green <greenjustin@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, ariel.dalessandro@collabora.com, 
	daniels@collabora.com, Nancy.Lin@mediatek.com, Jason-JH.Lin@mediatek.com
Date: Fri, 09 Jan 2026 15:27:43 -0300
In-Reply-To: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
References: <20251230-mtk-afbc-fixes-v1-0-6c0247b66e32@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-7 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_102806_765996_8E257BAA 
X-CRM114-Status: GOOD (  15.18  )
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

On Tue, 2025-12-30 at 11:03 -0300, N=C3=ADcolas F. R. A. Prado wrote:
> This series contains a handful of fixes for AFBC support on the
> MediaTek
> DRM driver so that it can be re-enabled.
>=20
> This is sent as an RFC because there are still some issues to work
> out
> before the series can be merged:
>=20
> 1. Patch 4, 'drm/mediatek: ovl: Disallow AFBC buffers with width over
> =C2=A0=C2=A0 1920' did not behave well when tested with Weston, so a bett=
er
> =C2=A0=C2=A0 solution probably needs to be implemented before this can be
> merged.
>=20
> 2. Remaining AFBC issues:
> =C2=A0=C2=A0=20
> =C2=A0=C2=A0 a. The first 4 pixel rows are always skipped in the displaye=
d
> output,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that is, the first displayed pixel, on the=
 top-left corner,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 corresponds to 4x0. And below the end of t=
he displayed output,
> the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first 4x32 pixels are displayed.
>=20
> =C2=A0=C2=A0 b. On some resolutions, there are still artifacts that look =
like
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 misalignment issues, eg 1024x1080, 1080x10=
80.
>=20
> =C2=A0=C2=A0 c. On some resolutions, no output at all is displayed, eg
> 1920x1080.

I received a suggestion that the Lx_2ND_SUBBUF bit in OVL is not needed
when cropping is not enabled, and that removing it should fix the extra
pixels after the image described in 2.a., and perhaps even fix AFBC not
working with MT8188, though I haven't had time to test it.


--=20
Thanks,

N=C3=ADcolas

