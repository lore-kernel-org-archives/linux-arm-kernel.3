Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBEACAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxfA7gPwhGq/sq6jFzKBfvNhTZp2F90ab1l6OLJ9t4Y=; b=JwvaYvVqNuzbkIVB2RrJEPSlbK
	qrtBxL8xE4v65g5hOUku4cJF2als3pt26MWN9pQgCQqOzh5FdTP3z6UwBjo0gEutlJGKpAiqZ2q0a
	LUzYESkQO7tFB5dvwZhjzrGKVjSbA+SApEiPnfUF27NlukxF2ytgGWxK5plhetHCVXI6ZPRtvIZzK
	0G6JKNcaXZfM4TbnHTNN+75hDc8/dBbUET6x+muDg6T5bqEe+eUPRZCsQ9SygjKa5cehXGu+dkiYD
	ZqSifC8pzCk2M2OSK4CJ+qWa1DBKyhrq69oadkokFsTsjhk+LryjRM4dDQtSMBk0tYj0X8ZS4B+92
	svTtyz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1wf-00000008oqd-20nB;
	Tue, 09 Sep 2025 17:15:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwWj-00000006joC-0kyq
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:28:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=uxfA7gPwhGq/sq6jFzKBfvNhTZp2F90ab1l6OLJ9t4Y=; b=Buv/TWwphp/wFFTC/ce4k0iu0B
	9dm3el9MzD/KOrfHjsC1eyCD6mG0zFHlGQrZOSuDx8Rv/RVtNzafgxtZmwOMdHIY+Iqir9PoL28kc
	RgxalqMXeKV6Q0gPRa7GIIIZQyMc5V7RZEOAPt7Plbeh9lzWCq/Os0pqXtWdewookkhtgL56I2/xM
	J3RuybbyUPdsbXu8hB/D/1b2IMLleVGcBQn+15a8tFiKsLsYigbKLlzPuWDK7F2ShWkMTDbfC7hTd
	wAsa0rDL0dT2j605Tn0zkZcP8HgswLU/0hA+/+wsm79rPA6YzQxGIpsWahCe5S162TV73Mk9MLKyo
	vgCk2I3Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwWg-00000005JZZ-0J41
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:28:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAB8444AC5;
	Tue,  9 Sep 2025 11:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B6CCC4CEF5;
	Tue,  9 Sep 2025 11:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757417320;
	bh=wIIA34sMjqdACOJSvYzTP2Jt6YsaPcn1jljZ4TFuAY0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ie45hwQEfH6KYJR1NvRIX9Q8Pi+zjzQNIGIbayd3cC+xXwscDWhgZMTbtfHJlYwST
	 nSgvZUS/2xWfUcXxc5dWVWim0td6pio66g4ZqB/w0/91YkK9RaSfDg7FUCSlL7P1yQ
	 GvYmtql3as65JM99hSlPFb2AXCYtVCzMfss8NmzO7e2HXuscKAxeCbIvm405RtPPHg
	 KT/rCKCUzOWzK78yeEfDZg4qDeM2kMvpWriOEf3UbSSHxgNBkUeZOlW2a69nGeVDMF
	 1KSOC2SHIgCJd6qUG5vEljkw0AWJkSn6S8yiZGDMW+BJ6hpWEELNYp7fEOcFLP/d/H
	 4x2UEgPkpPjKw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 09 Sep 2025 13:27:37 +0200
Subject: [PATCH v3 18/39] drm/imx-dcss: Switch to
 drm_atomic_get_new_crtc_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-drm-no-more-existing-state-v3-18-1c7a7d960c33@kernel.org>
References: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
In-Reply-To: <20250909-drm-no-more-existing-state-v3-0-1c7a7d960c33@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=mripard@kernel.org;
 h=from:subject:message-id; bh=wIIA34sMjqdACOJSvYzTP2Jt6YsaPcn1jljZ4TFuAY0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBkH+LUMtrwKebz60Vr91uzrO5LMOhjaX7XN37Xk/uIMn
 b9R6+ZmdUxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJ3GFgrJVnVtoVu/HwoZPb
 v8um/+z8q65RGFF6ppoj+9kV5kSec9ET/Y80brdP3C3aKVKtsfDodMaGu56eCz2FMpU/u+WleBx
 Y98m/uON32Wq5hih5YRmua2J7N/6dk5XNtVPsw3Odp775AewA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_122842_533799_10B0DC10 
X-CRM114-Status: GOOD (  12.63  )
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

The imx-dcss atomic_check implementation uses the deprecated
drm_atomic_get_existing_crtc_state() helper.

This hook is called as part of the global atomic_check, thus before the
states are swapped. The existing state thus points to the new state, and
we can use drm_atomic_get_new_crtc_state() instead.

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dcss/dcss-plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index ab6d32bad756d080e1c56d7574403febceff94f4..3a063a53c8dfa6bc5bbbf9afc7ff6519199c2f19 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -157,12 +157,12 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 		return 0;
 
 	dma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	WARN_ON(!dma_obj);
 
-	crtc_state = drm_atomic_get_existing_crtc_state(state,
-							new_plane_state->crtc);
+	crtc_state = drm_atomic_get_new_crtc_state(state,
+						   new_plane_state->crtc);
 
 	hdisplay = crtc_state->adjusted_mode.hdisplay;
 	vdisplay = crtc_state->adjusted_mode.vdisplay;
 
 	if (!dcss_plane_is_source_size_allowed(new_plane_state->src_w >> 16,

-- 
2.50.1


