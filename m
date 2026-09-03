Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E753C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aECgqs6JZ6BZsxQ6mCtynd9VQxvrPgGlkCeCbvLdpQI=; b=tXE4tfgI0FKCrJYN1YOT4ycMwE
	nen2jbrCyFmNpPsvw4mk/8wvQD91yXmy9KptTdTrez5ae/tm0J5TJzcAy89hrC+p9mrvOxq5n9Vy3
	hC/3GS66y3AxSSxc+NXxqsGsYCg6IQSPS+rlnCfgjY4uwZXcN+gCTGYGDHsp/va26yfKeyra3uZh0
	q/HJ53Re5b3u0b4OXIrE1DxzwFTY16NZwHw/LYQdWUvzK9WvfIZigdDvCRTuN7EiDdtgkKmjpcKn7
	878E1qOoRrYBES8lCkDkxzpy+G8XBpV93sIU8fLF9jijQq35qOBRsk5XG3jwgjoPAL0wCDl2a4w8L
	FEg0zSxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Ml-0000000GtCq-34zo;
	Thu, 03 Sep 2026 09:04:15 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23Mj-0000000GtCG-06XV;
	Thu, 03 Sep 2026 09:04:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788426249; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=L1MFU3XGjQR3xnEmm/yOzXINoJasZTga1rCeK4laB3qEHzHB/D+vvXXibA7CEPdTDb9oRjRTOaBtA1KU2XoQyKzo3wVAWS0KVy5UvjAG3TUcxoMCEwP7wmZaE28bwbcBPLAVO2gBrCji2LZcTy9IetQw1pq5t7mzN3mrb4Xww58=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788426249; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aECgqs6JZ6BZsxQ6mCtynd9VQxvrPgGlkCeCbvLdpQI=; 
	b=DTpdkBW74euXRal9u1UOinYclu9NIp0dTz+WnXvr+hE/RXmZkW7XSYKCDowWlTkpbJl5CCf+/B7NDXJFqCnvFDjmSlsy7B6SzKg/3gB5ZReOIWwo3caXr+mBeWN/PgBvljrAEzlJKAf7ybitsYIpJU+dyox9oPaLbwFjy0gTaMI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788426249;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=aECgqs6JZ6BZsxQ6mCtynd9VQxvrPgGlkCeCbvLdpQI=;
	b=NtirWF7a0Cc0Lh1qAbupCDbyhSss1cFAHIGDmN0w2pFsGHTLTRxCQLcjd8cF/n49
	AwqVpUMcmweeNyTf/wqZ5uswcM7EsKaJPczjzMFptgivpiGlKEfz91y2BaKcD8Lw2Aq
	ui55znASyqR06/I+Tw4rIw5k94afctSVbMdBECAI=
Received: by mx.zohomail.com with SMTPS id 1788426248393643.0972373499999;
	Thu, 3 Sep 2026 02:04:08 -0700 (PDT)
Message-ID: <2c8405eac9e72409154c98bb31b3fbed10be5755.camel@collabora.com>
Subject: Re: [PATCH] drm/mediatek: mtk_hdmi_v2: fix VID_DOWNSAMPLE_CONFIG
 register offset
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Julien Stephan <jstephan@baylibre.com>, Chun-Kuang Hu	
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, David
 Airlie	 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias
 Brugger	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Tommy
 Chen	 <tommyyl.chen@mediatek.com>
Date: Thu, 03 Sep 2026 11:04:03 +0200
In-Reply-To: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
References: <20260828-mtk-hdmi-v2-fix-register-offset-v1-1-118ad5d7ebe3@baylibre.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_020413_147563_3DB9E8F9 
X-CRM114-Status: GOOD (  10.48  )
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

Hi Julien,

On Fri, 2026-08-28 at 14:10 +0200, Julien Stephan wrote:
> According to the datasheet, VID_DOWNSAMPLE_CONFIG is at offset 0x8f0;
> 0x8d0 is the VID_CSC_COEFF_0 register.
>=20
> Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for
> MT8195/MT8188")
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
> =C2=A0drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
>=20
I've checked in the MT8370, MT8390 (MT8188 variants) and MT8395 (MT8195
variants) datasheets and 0x8f0 offset is indeed the correct one.

So,
Reviewed-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Regards,
Louis-Alexis

