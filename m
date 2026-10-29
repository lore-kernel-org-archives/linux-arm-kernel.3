Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0B606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KXrH3Q3s;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=N9w76DW4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6clb7zDaAH9r9M6v0Cs2SweYtJsu88uC1qfGVnb/DF4=; b=KXrH3Q3sN1mQBg
	V5/bhHltPEWb03fndeZGtE1q2mbTVoR86Sw6KpOLkAAwS6J/shn6U91DA8UTCaRFh0ZQ6H41K28Eh
	J4nziFrim9bOLqXEwiXaBmSp/ZN22flSOxUOVvrT5S4Gqej+NzY3g1IauL4CLV33qEcYtOxJY3p8M
	B3r0i3YsiPGSKurdTl+a3yaO2QYRaNO2e6yKGXSI4dGllp4Ax48Ymeg0/jHgxNEBCw71NFmYigZ1J
	XndLUOODKFqCbX+zos6qG8b6PnKCJ67bH3sip9Dy451KFfAO34EhyWO41jMFnNHh77ovsyeuP+yCV
	DI37FDkhVuXOEa+vEFSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNEE-00000008wrC-077u;
	Thu, 29 Oct 2026 10:19:26 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMNE7-00000008wik-0gGO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 10:19:20 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 845A6BE;
	Thu, 29 Oct 2026 11:17:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793269024;
	bh=k4C0AwrvL/79LdIbFEMvqhcsEJvl7Y8Jl/ivUjUaUNY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N9w76DW42RbToB7YW8OAdd+pMcMbpgSA/Sk7hxWN9zf9ymn9em9sVyhV+Fsa0ntr7
	 EJUV/U2O5yiC4A3hM6NTzbtSp0uAuo6mxK7YC/w2b7ocFcsFBluto710AHr9yNoOQO
	 aofubdRJ5KfnN364+d7Kuuk3Q/gIe+5fHQvy00dI=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 29 Oct 2026 12:18:54 +0200
Subject: [PATCH v4 08/14] drm/tidss: oldi: Fix serial clock reference leak
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-beagley-ai-display-v4-8-dc7f2b532478@ideasonboard.com>
References: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
In-Reply-To: <20261029-beagley-ai-display-v4-0-dc7f2b532478@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=k4C0AwrvL/79LdIbFEMvqhcsEJvl7Y8Jl/ivUjUaUNY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBq4x2Y4TaFah9O+f4ICQNwMOb0ENbZMRRnPmSIZ
 wUyG2wRS0uJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCauMdmAAKCRD6PaqMvJYe
 9d+eEACdlhVd8vF+KuMFop/dcrXzR9DmSwJhfEwLJWzEqRnpuCzq/XGEaAP1VC7qBbQY42AV2IV
 XR9fi4uqa7fadaDatsmrmCDSUO4ub1l7ieNV4I6xE3lH8CTl4/AF9xQy2mw7cattqfgY4GuxJIO
 7z6bCKXekQUQRTqOFCQBUcXQ3mwBszUAPGLnwxG/V28s0MZzu+DSK5YUWBgu97Qiq3QJ5EEDguR
 jsEg0bEf9Aq0q8Mwz1/FNgxSFsnZIALyFzqNJiczbm5PuuZ8pv+voot2dqZ3doyje1HljBJ30io
 Aj4L4UEvTICMGIxJWg3XTC2MxAUZq2ECgX7c21WnbzvsWWuIvPuXCrfTH3i3CeJfunULOeTeDey
 arQPv3opd+EnLjENTjwaL32h7l7ycv5pWMd/19X7QFm8EtWbw8X6iCEGFFoRLDJ1iZaZA3JIJW2
 tDqfMmmat/h7ebc0VAvFczcDW2hJ/i4YM0sX+15JsHRFtfAr0rv7dxUGuUH9HCVv6zFFPbQwXEj
 vr1984cB8Hocfdqhlf6vxe/fAkZLFWBn8xajqHD+F6KDFzJAhaCO+UqI8k/qiCQYIG0JOD2ptKO
 /i5plTw9sBP+HsHnC57bB0Mpxw6tOQbyu2mk2ch5ILOdsyeY1B1xJQL9O7VH/qu6T8TX6qXzjPP
 gv9vzL3sqGO3cnA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_031919_422538_AFB71D87 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

tidss_oldi_init() gets the OLDI serial clock with of_clk_get_by_name()
and never puts it. A clock reference leaks each time tidss unbinds, and
each time its probe fails or defers after the OLDI setup.

Get the clock with devm_get_clk_from_child() instead.

Fixes: 7246e0929945 ("drm/tidss: Add OLDI bridge support")
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index ae27ebc7306e..506507e83112 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -609,7 +609,8 @@ int tidss_oldi_init(struct tidss_device *tidss)
 				goto err_put_node;
 			}
 
-			oldi->serial = of_clk_get_by_name(child, "serial");
+			oldi->serial = devm_get_clk_from_child(tidss->dev, child,
+							       "serial");
 			if (IS_ERR(oldi->serial)) {
 				ret = dev_err_probe(oldi->dev, PTR_ERR(oldi->serial),
 						    "OLDI%u: Failed to get serial clock.\n",

-- 
2.43.0


