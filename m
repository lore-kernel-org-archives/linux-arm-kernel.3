Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92484D2ECF7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YJ9HNhhdVjpjd8lpyfVaHQErXsbBsLle1p3eCQvHXI=; b=kfdJdXp702E2Qmxj2+Wmyee70n
	VjpyzGGMLIii9gDz5CkZFdAWVaNUhv35/5DDsJyoyLolWmcG/RQQtYzzbedTZ1rikBR67KecYFtJb
	xks6/lzJRVHPVUcez3AO+FROCpKit79QBuCYl9ETCq4CilKPcjd1oHEHdbtgIrkCZzoKPGQa7mXEL
	Vin9OhNpVqTeuQq+q8A90jnCctZD29MCeWTbqcyx62ZkVm7I0APmENUlZ8pv1hbDoIDEDd1S2jgKD
	KJzvbS909JmU5JIpQbVyf3EZiqkqVrxMEgtlorrzOL5zmE6jv7sVeEFMu33WbwHpsfbDhWvdcjOfd
	Zp/BKZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBJP-00000003sVK-3GF3;
	Tue, 20 Jan 2026 12:58:23 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBJM-00000003sUI-2xQ0;
	Tue, 20 Jan 2026 12:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1768913885; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PsnqqzEcbPifRlGdx2Mtiwp9QIgJxsvDHp/ZUgjFSzdf16ql8xhGcvuT7NKQKC+G5q+lGFJ0OOYQk74z4on554+oPqkYzVhN7gZBycbjOH4uZ7plFo3FRPd46d7BTY5TtvU1hYd+vt/p5P5PBTmxQLrHTkZoW7WGdmZSjzrn3RY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1768913885; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3YJ9HNhhdVjpjd8lpyfVaHQErXsbBsLle1p3eCQvHXI=; 
	b=RDAs0x08RWqlRZF1mmpSh6vZdyCn8FH975Uj7+lx2elZQ/4md4lekQigs7NvigAXn2DmnjZEwGXp8tW8cUW43XHvuF4a2OrIaN3XOS4Ib5lCeLCPAS5I9gP190qXnoZljsfwhtb1122y6TEGXbrwPswel1AyPOMbnQoYsgGtpSg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1768913885;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=3YJ9HNhhdVjpjd8lpyfVaHQErXsbBsLle1p3eCQvHXI=;
	b=NK/JAsH+4qv3kpUeu7xptAvVuI5rJxqbU4m6klJPYdjIOGp+dnkyjzN/CyfJuz4e
	9qI0BrUH9vpa0kbt2888+9Hauk0o7DsTe72m7VGk72jhNYR0UxtCjdpl6uhgHh/Xm01
	518BOyMsxCdTsWZcGoTNNOTQjdgKdlftHFJp5yRY=
Received: by mx.zohomail.com with SMTPS id 1768913883065871.0979621537674;
	Tue, 20 Jan 2026 04:58:03 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>
Subject: Re: [PATCH v2 1/8] drm/rockchip: vop2: Switch impossible format conditional
 to WARN_ON
Date: Tue, 20 Jan 2026 13:57:56 +0100
Message-ID: <13000903.O9o76ZdvQC@workhorse>
In-Reply-To: <c11ef222-c661-4937-8f35-25f450ab71bc@suse.de>
References: <20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com>
 <20251206-vop2-atomic-fixups-v2-1-7fb45bbfbebd@collabora.com>
 <c11ef222-c661-4937-8f35-25f450ab71bc@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_045820_808047_873F13F5 
X-CRM114-Status: GOOD (  20.03  )
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

On Tuesday, 20 January 2026 13:49:12 Central European Standard Time Thomas Zimmermann wrote:
> Hi
> 
> Am 06.12.25 um 21:45 schrieb Nicolas Frattaroli:
> > From: Daniel Stone <daniels@collabora.com>
> >
> > We should never be able to create a framebuffer with an unsupported
> > format, so throw a warning if this ever happens, instead of attempting
> > to stagger on.
> >
> > Signed-off-by: Daniel Stone <daniels@collabora.com>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
> >   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > index 498df0ce4680..20b49209ddcd 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -1030,7 +1030,8 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
> >   		return 0;
> >   
> >   	format = vop2_convert_format(fb->format->format);
> > -	if (format < 0)
> > +	/* We shouldn't be able to create a fb for an unsupported format */
> > +	if (WARN_ON(format < 0))
> 
> Please use drm_WARN_ON() here.

Hi Thomas,


A later revision of this series has already been applied. Feel free
to send such a patch however.


Kind regards,
Nicolas Frattaroli

> 
> Best regards
> Thomas
> 
> >   		return format;
> >   
> >   	/* Co-ordinates have now been clipped */
> >
> 
> 



