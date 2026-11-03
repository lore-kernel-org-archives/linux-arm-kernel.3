Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F00C608508E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Fa/xc7xI;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=HtN/mltV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=WoqY59TBbrT3C7Tj+UiFPH8AvAu/mqEoGvH8cSfspG4=; b=Fa/xc7xInr6KKP
	CXx1CMiel4Zc+vmNeruN8LN0JiIkrjUhCYMkzsclJ+cxBh5iS3rvulstKcPHe0cYWwqeffA4IPCl/
	ZyJd0yvynQL3vl50FBLtMO8YtTSpO2cmbWqp1UlYhPtg/gTr9k8OAEIgmgImlTJW42SJk0YoH4v/C
	y+aEUE6ACBDgh7Drlek5pX6bSF0x4tHBMyViKbK2NzhGTOzFUsdlwfH8SHl3IEAwc1zcsT2mTtOob
	kzx/R/wp6rqY/oZrEkJLuF4x+B55TVC+RosorLu//oVGa6P42sLUYtuEw945yisUO1hJ8z3sGqFOw
	XWl5Tww3S/Ehlonn4s4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCoK-00000002Cfy-0gOG;
	Tue, 03 Nov 2026 11:36:18 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCoB-00000002CQ0-1QrP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 11:36:08 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2BA42819;
	Tue,  3 Nov 2026 12:33:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793705628;
	bh=9zTXLhkgklN7e4oEinpYlDPDvpd1jSurXbMd1q/62KU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HtN/mltVHM31xsXvecS7TDGpRLPGbQ7DtT8kUx4vZ5rIKMaSquBxjgoRzDMRLwPrm
	 Uxe6PSPwSWbA1n4HCY7xsqybaP1/4sRfvdQ/sw147VYv2rKpUbM8WWdF3g6b9leQQ6
	 W5ub7qE6o2f8+XY6o7d+I237Kqo1zqp2wluzG5aI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Nov 2026 13:34:28 +0200
Subject: [PATCH v5 08/15] drm/tidss: oldi: Fix wrong return value from
 tidss_oldi_mode_valid()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-beagley-ai-display-v5-8-f1c8d0e52bb4@ideasonboard.com>
References: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
In-Reply-To: <20261103-beagley-ai-display-v5-0-f1c8d0e52bb4@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9zTXLhkgklN7e4oEinpYlDPDvpd1jSurXbMd1q/62KU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq6ccYF8i2QmbTUmW7QGnj1nZebFFrjyawbrEsJ
 L5mWfZgKAaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaunHGAAKCRD6PaqMvJYe
 9SyjD/0e9Lb6u7bIX2Vd1QhyXQoyCxevWWuqh4x/t0P2dTQG7EJCbl/jd5toeXhlZrgZiUVU/ir
 VfI3KadkYAkrakCtzyVTEzPcOQoRXNqLdsrPW+Qj5hae7sDWWG5lWyhdpiH3IqNzJH+0iLtpj5f
 /zDeNXjvOs3u2AYJKb9QzYKH3PiRKh4A6YgtyzP2kMNPY51TMStErfRkZmGuge2r1XK1+ESKqxo
 9JS/ecD2UXFdkpucL0+VU63bLVvXE0+GO08V13lVssH5qlIoTGtpOQTghMgKQxcKUcnh50JfoER
 MP9g5mSzfvUTW+ghOJXTyBigYpSvogpID4fKJtZwa/EnzD4TiA9bpJKvjp5eOZPMgg1jXA9ioAS
 v9FsH5k/Dssacz4yNijuQt/YXkpmTL2AUwd0PRqsTvfE+q2IiLiOfzkGhX8Yc3hKilbvzgBbumG
 oqermIXkOZ0wL57D+piMCM267uxSyx84ikF2S9dnYk8qa0BbeGVAZa1nJRaGyFquS9iwAFRGz+/
 KPfCVNddhUS7GRFDG+P84dQRPucVsS43sZ6pVajYPA8bxVKZ1FlzRl6BC9KEy5HGZ0Gs/NaVyLp
 HVw3xf2UTn+j6PXfqrdX5lB6oLTiL2fz+I2nOxhXSIL3ga5HjCAwAUTwkIKyJiOJ+Ue1JMAdQuB
 dpScMsdlMlOBVTQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_033607_599837_A9F7B8EF 
X-CRM114-Status: GOOD (  12.25  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

tidss_oldi_mode_valid() returns 'enum drm_mode_status', but the current
code returns -EINVAL or 0.

Fix it to return proper enum values.

Fixes: 86db652fc22f ("drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook")
Reviewed-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 82b059f85244..ae27ebc7306e 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -346,9 +346,9 @@ tidss_oldi_mode_valid(struct drm_bridge *bridge,
 	 * we use the same 5% check here.
 	 */
 	if (dispc_pclk_diff(mode->clock * 7 * 1000, round_clock) > 5)
-		return -EINVAL;
+		return MODE_CLOCK_RANGE;
 
-	return 0;
+	return MODE_OK;
 }
 
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {

-- 
2.43.0


