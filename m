Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DABC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eo/zVUS27I3iBJXxa3aUPvdwg21sDptKqghnN2ZomoU=; b=EUdyCgq07W+/YYvjIHk2g7DwLX
	AI/R+ScXE75yHEWVU4taiiSrW6OfqzGX5+Gyfi9B/7gT8Uvd4XrxVOqii3JFUdHEPNEhdDNCGk2/l
	ZC+89xguqVFKDu5UXNeLhRjy6+rd4v+VR3WrLwx5TaigGZ4MsZbyOz6UJeJnFIZtROq4kSm2Trkw4
	e9J73mex2Fjo1dFB34NYZOrr6+20+7CqlA/dQC7UrXKpKYoc/CpMA25y3k7qbTvA3InwKRdWSMN6N
	W3SUeQra+AS998DfI2e+xy424nwGdDEqyuDXwdtiPZfnoYPzp6fu2Yx1mpimNzE1FR7uthPHFD1CM
	1UWXZdYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKwn-0000000E6LO-137R;
	Thu, 19 Jun 2025 19:29:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKmU-0000000E4KS-1ds4
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Jun 2025 19:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Eo/zVUS27I3iBJXxa3aUPvdwg21sDptKqghnN2ZomoU=; b=P0sU1uaTzOIZFKaSyBZw240W+u
	Jk7TberldQUZaRo4XZusHrgAOP7MB4YbDqVurk8ctGd+OZZD0JRIGBmCqjaqRZu12SU6gtCt1Zsfw
	Rwou/ujCyCf7QUa5tQ7uuOiu/q4ZhSxbJDL79BmXnEZ7Gs229RPmMYRy8HzClgmbgZrDu89EU01WF
	5Dqv1G8jftru0Hmdan5wcWiFCGTayB1OmZj7E03j1NOBnGcU2DXh5PFfopT1d/zcfGpotGREWXrvm
	u+XQ/X9LAtvB6u69Jz7DsthyBjPTlnVBsFcgdqS6p8qWtx5pIdYc4NkDiYTq0zk/FXGdJATmvZtio
	cRnQpe7Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKm6-00000004Ybj-1HtO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eo/zVUS27I3iBJXxa3aUPvdwg21sDptKqghnN2ZomoU=;
	b=QlvfoknHmSi/Dq3caNFm392jfiSZQpqi6ESZKcTLZPGP1oUAe9roq4Sq7Tl43tE768gle5
	OD2ZbUQnTrSQrTFjH/sy6MK7uoNQdXtAU5O0NDHIPnn0y90rRIIklSIOxEuitB1QQxYq3c
	0r/W0HRckWskaW4nudaEVk77OOTEPB0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eo/zVUS27I3iBJXxa3aUPvdwg21sDptKqghnN2ZomoU=;
	b=HiMstr16Fm72JOvaUvQiDo7yqjpfa7YCb7CXstrSJgW2ksSH3kIzEBdnTzR2kF745jRFnr
	PxVkAo7/lRhXmfK5zmEnuG2uZXgn40pQ5R939oHQLIvNfYz5xjM+VGR+Kqr+UxiCipstkt
	NRQGkxML64yXjBAWJFylNrTpwqi8lQE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410--ujauuIfPGOIoVTMItiAUA-1; Thu,
 19 Jun 2025 15:18:02 -0400
X-MC-Unique: -ujauuIfPGOIoVTMItiAUA-1
X-Mimecast-MFC-AGG-ID: -ujauuIfPGOIoVTMItiAUA_1750360678
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8117C195608E;
	Thu, 19 Jun 2025 19:17:57 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E157419560B2;
	Thu, 19 Jun 2025 19:17:47 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:55 -0500
Subject: [PATCH v2 03/16] drm/panel/samsung-dsicm: Keep up with refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-3-0df94aecc43d@redhat.com>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=983;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Tc35LYnloxYekiZZhivWmAHnrRtMhAnr/P2YRkymKvc=;
 b=vN92IBQi+M09EbSRlRz+7klMp240mFog3YQFqIvUWNP4EPGP0V5d40UNgVhMKMGQioZJzKxlt
 4mDoniewSgwD271dOvPPbqJJrVnML3dE9maoN1t5FCwFi6HaNRX+SIk
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_201834_227584_B02FB455 
X-CRM114-Status: GOOD (  11.28  )
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

Put the panel reference back when driver is no
longer using it. The panel that of_drm_find_panel()
returns is or the purpose of finding a out->bridge.
After which it is no longer used. Drop the refcount
accordingly.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: Explain in commit message why the refcount is put in the
attach function which is not usual.
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573de657af7fd14388 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 			dsi->out_bridge = ERR_PTR(-EINVAL);
 	}
 
+	drm_panel_put(panel);
 	of_node_put(remote);
 
 	if (IS_ERR(dsi->out_bridge)) {

-- 
2.48.1


