Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3181EE20A6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 14:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Peb4bRvkuJSgns1XA6+qJKAdVywZBsdpUaY2vtFtMTE=; b=iVi9KjoyIggTs9V7V6HiiBzb5V
	oXq8iv/EQkVu8rGIKqNdkbEnd/Dx03LjVA7bPzkz9EZVhCJFJOxYZNdIE3R2DCCVSAh7HhBPY+klw
	S/2K3aE4UqMh3wa0u3EkNbPGUad7xtMVpXYGE/MyD0sS5kXbOfOixNURhUheMkrpiX9btO1bUYHW8
	q4ZFcmUiRMHuquG1p7+u+OtmDL9o0uYcshmGzDcX1mRO0D1A/DDK15bEWbEuJf/Lf6qbzCxRm422i
	Vk35wkSfsyLvWkrO2zdZ+INkR5Ob/xnuNPzZKol9+xr5U8uSICkGyKZ3pBPavbwSIk9wB4AwKqPea
	uyofLyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMXv-0000000BPyX-2CF3;
	Fri, 06 Feb 2026 14:10:55 +0000
Received: from sender4-pp-g122.zoho.com ([136.143.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voMXs-0000000BPy4-1JtG;
	Fri, 06 Feb 2026 14:10:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770387040; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BMjN2G2e1K3gWDVCQGaE3haovIpIcRG4WDTXC+xBYm5AQWe1i0dr+bXGNXfUL93eHKpOHGDL3LXA6iGOf8EUTc1+UcI927DTEHVjK2EH9q3FSPYFXo5lWJTcIpw4ExRyJSB8nz9xK7dLOP9dQfQlve6ElDl87SwCCIWELB6lbRA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770387040; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Peb4bRvkuJSgns1XA6+qJKAdVywZBsdpUaY2vtFtMTE=; 
	b=MpE/8s0ryy6kBrOXVXzuPdhFQh0xeZF8KdXoWA8tbpSyZT8AEPQ7xBIcEO0vD/+qw5qV+A0DYQY7/1XIor14jKmmffgdFyckG/kYOKVHhFQIM0drGwdJMpiKxkGuVnIWkYgyix32N6V9oy1IJtHNbY2/TtJa+t1wh7CKrwVX5eo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770387039;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Peb4bRvkuJSgns1XA6+qJKAdVywZBsdpUaY2vtFtMTE=;
	b=CkUovisgpBVCh8YQUPhbv5VBgS4fEwhK7I95wZ1LIIXAW5UEHW/tss1AqNgSnAQq
	meFi6m7CQzmrWZpVf5qrp9IMYHJfZMnbGdi+vlJ40IDUMx3Y2AemCPkiHDjsc4+8MJg
	OY66qtNZvH1E7MI9O0clQhV2fDHUO6psNvhbF1o4=
Received: by mx.zohomail.com with SMTPS id 1770387038864755.1550395699519;
	Fri, 6 Feb 2026 06:10:38 -0800 (PST)
Message-ID: <b97e849eb0de3fc497f4473df142d39f3cb7c823.camel@collabora.com>
Subject: Re: [PATCH 03/11] drm/mediatek: ovl: Add supports_plane_colorops
 flag
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
Date: Fri, 06 Feb 2026 09:10:37 -0500
In-Reply-To: <55bcc926-a090-4f4c-9325-6599761d10c6@collabora.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	 <20251223-mtk-ovl-pre-blend-colorops-v1-3-0cb99bd0ab33@collabora.com>
	 <55bcc926-a090-4f4c-9325-6599761d10c6@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_061052_501590_CA3AC968 
X-CRM114-Status: GOOD (  12.97  )
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
> > Add a supports_plane_colorops flag to the driver data to allow SoCs
> > that
> > support per-plane color operations to enable support for it in the
> > driver.
> >=20
> > Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>=20
> You should merge this patch [03/11] with [05/11] - so that you
> introduce the member
> in the same commit where you use it.
>=20
> This patch is a one-liner and it's not doing anything complicated at
> all :-)

Sure, will do in v2 :).

--=20
Thanks,

N=C3=ADcolas

