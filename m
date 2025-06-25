Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22FBC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTp0vKqj7VpMXAfHxRYqXVkfyzmgLQ4uxRgPuEKZ2ik=; b=fRMorNbajtFHCvr49BJc+iBQHV
	Wwy2088VWpIzfDDXz+hXsD45/L2Kmrb0dBrK41J2oAUmIM7/vZcqbfHv/hSQZ1Ifh2GS+3a41yo5b
	QFSs9QxuBmpSfFfJriduIfh8Zld1LlxIl0lYj1MZqTOVcjdwgNQMeSZLtvn6/JUHBT5j3TN/qEA/h
	lV8IXV6dKo+GaPQm/50NwSvBq9r52L3zd07hPTF/no6vgIuyyWyg70L/vQYMpHQ+9fDm4+POz6Z/s
	pX5im6uSJMOJs659fR83BXzBdKx/THq1L70HYSfSj0hDLjTr3W1lOn7VoFDd9UDRGZ/b263yQqR/4
	g/D4FA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXdU-00000009xsl-2ogE;
	Wed, 25 Jun 2025 21:26:28 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVC5-00000009eSi-16wI;
	Wed, 25 Jun 2025 18:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1750877396; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JiSk+zhM7F5ibFdpsLxBXZOw5FFL0tY//URjMrwoUWAq7glbxS7xfKaWw/P7FzPngt1ttrP/xODIuZHGhynCWNh6/uo/Nqnr7+Y+XqhF8eqaEPXQHuKgSqaF1z+oII5asBw/PEfqmIQy+MFikTkl8XrgM+o9BXtq3E0uWJN0jXE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750877396; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=oTp0vKqj7VpMXAfHxRYqXVkfyzmgLQ4uxRgPuEKZ2ik=; 
	b=lagqQquSjRWq+Baquzdtczl4KH08gSFGXjYKK281lnFU2//2NPEHgFY5Yqq+NfJaA2lEBw+jk+hu+7kptZ7lG9oimLsGWNX59hLg8yL9sR+xCwkdRzTvsxUu80g0R8qSt5DftD7OuqxKs/gTz2YFm0kABSMTUWstbCwFSBXgApY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750877396;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=oTp0vKqj7VpMXAfHxRYqXVkfyzmgLQ4uxRgPuEKZ2ik=;
	b=EMlpcbeT0igJJzPZrOc217CB++Rox3jgRaBjALv6UKPus8MBz09Z8RmKf+ceOwzC
	yokK2o2kkhT2yu2M5ziR5UIB01/5dqHDj5+IrKwFW3s8INUVJMYQj7218knl1s2uqLh
	3GGryVtWH9dd2Y4mmfsFLuwnEbFw2OfcLYpeuYAo=
Received: by mx.zohomail.com with SMTPS id 17508773949391017.7029644182626;
	Wed, 25 Jun 2025 11:49:54 -0700 (PDT)
Message-ID: <f3135961b2fe2c2b5cb3c29d76eb3d818d7a766a.camel@collabora.com>
Subject: Re: [PATCH v4 1/1] drm/mediatek: Adjust bandwidth limit for DP
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 matthias.bgg@gmail.com,  angelogioacchino.delregno@collabora.com,
 mac.shen@mediatek.com,  peng.liu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Wed, 25 Jun 2025 14:49:53 -0400
In-Reply-To: <20250625095446.31726-1-liankun.yang@mediatek.com>
References: <20250625095446.31726-1-liankun.yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_115001_376542_E676B36C 
X-CRM114-Status: GOOD (  17.90  )
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

On Wed, 2025-06-25 at 17:54 +0800, Liankun Yang wrote:
> By adjusting the order of link training and relocating it to HPD,
> link training can identify the usability of each lane in the current
> link.
>=20
> It also supports handling signal instability and weakness due to
> environmental issues, enabling the acquisition of a stable bandwidth
> for the current link. Subsequently, DP work can proceed based on
> the actual maximum bandwidth.
>=20
> It should training in the hpd event thread.
> Check the mode with lane count and link rate of training.
>=20
> If we're eDP and capabilities were already parsed we can skip
> reading again because eDP panels aren't hotpluggable hence the
> caps and training information won't ever change in a boot life
>=20
> Therefore, bridge typec judgment is required for edp training in
> atomic_enable function.
>=20
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
> Change in V4:
> - Tested the internal eDP display on MT8195 Tomato and it is fine.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250318140236.=
13650-2-liankun.yang@mediatek.com/

Hi,

I tested this patch on MT8195 Tomato, on top of next-20250625. Indeed
the internal eDP display is unaffected by this commit: it still works
fine.

The external displays though not so much. I tested 3 different
displays, using 2 different USBC-to-HDMI adapters, and in all cases the
behavior was the same:
- Before the patch, the image on the display is completely corrupted
and unusable. The only discernible element on the display is the mouse
cursor, which shows perfectly fine. Occasionally no image will be shown
at all, but most of the times, the behavior is as described.
- After the patch, nothing ever shows at all on the display. It is
always black.

So while the external display support on Tomato is basically broken as
of the latest next, this patch seems to regress the support even
further.

--=20
Thanks,

N=C3=ADcolas

