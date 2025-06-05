Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99134C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 03:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xbtqvsf7BRpbL9q0tKGzMc/ghsVtwuf5Kl78Wf246CI=; b=SAm0AnKyumogrAVnJ40pkVNpUT
	dMN+2u4Hy28ueQbcP/zk7YBEH2pfulKGcMRphrEgdTsSfmnBZp1KLqKdIgirPpJSIn8aLOwL+UC/6
	WIiJPLOr3K1Bo1Z/OmnfwBmduHWHt2IuaeYYACCwPNEXmE+nNDfKOLwKR0+FogppghLoAMP9n/bFx
	gn5/O0XRG+lyxyOfb+7MElXG4KBuJ8gJhneDUg5xKYPQmhVjiTxT3PyifkjZTlbDYypUG/GuwYgAg
	zmOLMtqX0ja7kPWd9raXBE5usGcb4XsU/1vDBgRFUgD9jtgO0kBWl7d3SUX9pTobV/IQys+Gktmj3
	j0CSB0ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1hR-0000000EfeJ-2pR1;
	Thu, 05 Jun 2025 03:55:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1ZE-0000000Eevr-3xK5
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Jun 2025 03:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xbtqvsf7BRpbL9q0tKGzMc/ghsVtwuf5Kl78Wf246CI=; b=GF0LttqVSFopupIn4nkfS8tMKu
	sslGiGiTRKATyI4fyEjmmBX3kKjyh+9Tc2ikFuu5B+tbqOIZvwJrpAeKJ7ItiyL0rIiUau6Lks0N5
	iCVAb2h1RHJXCOuww/NItu5coFI1+mjGVxFebFFDVkwhk43oeBsExato0AsL8GVGoiPoE+Eu2DvTV
	tV+180kEdtXKWjB3EptUv4Qxly1wxZU7Or/7JpSVyAzr+mXqSuO/BaSqyWEs8giv/CGwbEDoI9Nab
	upTIfK6jDsd7XBOf6V9e1GN76YfPNOmWmrxfMdidckSQqZ75T2w3vX0XvZCsb6FcxXg/Gxd8dg8hX
	yZIKvs6w==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN1ZC-000000013UN-13LU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 03:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xbtqvsf7BRpbL9q0tKGzMc/ghsVtwuf5Kl78Wf246CI=;
	b=G49cCE/4Ls4In6ufSQ2dLnLMsFUlfMqhOxwn1/ZxX+U0ke6dJvLMkD3mdtQZcKck39SXVn
	C0e7vWe4daL5OZaoOat+1oPSviYuZLK/cnCzqqYEaB4OteqnSquIYW7EhTtObPfzZsgGh1
	ByTNdVEaUuEkpsAo+1HZn6ArBrDw7k8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xbtqvsf7BRpbL9q0tKGzMc/ghsVtwuf5Kl78Wf246CI=;
	b=bvnEgLX2+qaJrcGaB/zX4rXtmXv8l662ptRBghtUoJWGliKuVQYjtCa5M9v5dmmvzlB6MA
	bAnyDH4NRXgdUTEjEFTLv9oFJlKlO7WMuA4cNsjFqxW6ywXpIrHwK93/w6x6qYsqTmUNLD
	RrYsEDZHQ9ZZMpvUP5a3wlZB0+PP0ds=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-hSawOjZCOlCHJFa_3Q4gJg-1; Wed,
 04 Jun 2025 23:46:45 -0400
X-MC-Unique: hSawOjZCOlCHJFa_3Q4gJg-1
X-Mimecast-MFC-AGG-ID: hSawOjZCOlCHJFa_3Q4gJg_1749095202
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6BC631956087;
	Thu,  5 Jun 2025 03:46:42 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6157C30002C0;
	Thu,  5 Jun 2025 03:46:37 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 04 Jun 2025 22:45:12 -0500
Subject: [PATCH 3/4] drm/panel/sun4i: Keep up with refcounting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-of_drm_find_panel_part1-v1-3-c632e12e131d@redhat.com>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
In-Reply-To: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
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
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=688;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=8TEfN32KZd6YJhzTAU5W2FFXyAmDYouG69xkiU/38RY=;
 b=hgLlqDE82iA86gpJEHX2fHQf4POVn+EIXHPqw81ubtcFdUfF7dPMQSIdXkUcX+ngUZhsvVlPw
 DGg2MsfGbjfD5ueMCo+9yUhN+O3RALKd7EZxCHZgGjVQKTML4WQ1aJ5
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_044658_533724_FED4E79C 
X-CRM114-Status: GOOD (  11.27  )
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
longer using it.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index c35b70d83e53b7397c6e38dde45824bd49fdf099..36d47d7cedde1e1e3e83eb670520664100bd0a25 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -990,6 +990,8 @@ static int sun6i_dsi_detach(struct mipi_dsi_host *host,
 
 	drm_kms_helper_hotplug_event(dsi->drm);
 
+	drm_panel_put(dsi->panel);
+
 	return 0;
 }
 

-- 
2.48.1


