Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E242CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 20:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gO1uJlhV6oM64fVpq/0JHSVRxjQ7sLQnALSTsOIjYT8=; b=ouInCyo2ZWfxPxSfSJJoPRT8IL
	RL3NL9TehPqkabQGL8CnzxyqvoTlOXyRS2rU5sjftmf/dmc8mXDDBJVBpKD1Qy0WXsGoc06ULQa6/
	GR34j2uSZlUBEIsTEdhPihkGoXvaa+Bauf2RGeCg6A/U7jvE1tpaoqRNbq5ne9smuTqHRHLdU7g+D
	XCKjy8+cvTBaVwaZdHoICR84Ojbl3L6KsoD046oC0QlHaGDfvRc/9S6OVCDYMjAU6yZpQBI+l7bG3
	YufqBa5bY5+jCRJITVAUBT+Cc26dQkVj3xhk+oaXNTlZ0EjDZdZhkdEUz6aCr76u2NuX3nL0HuidI
	g9hacftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG0qr-0000000AaDS-3lac;
	Mon, 03 Nov 2025 20:08:29 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG0qp-0000000AaCP-1CUR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 20:08:28 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4d0jMB4JpDz9sxJ;
	Mon,  3 Nov 2025 21:08:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762200502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gO1uJlhV6oM64fVpq/0JHSVRxjQ7sLQnALSTsOIjYT8=;
	b=X5Y+8ilodsOL4HoPbZhGRipcGdvgrg5A+4S0GGWdKrlzaSe+/pB790XiCyHIJH/iTol3cj
	yR0r4fGRm9EiaSSs2PtK59Qjdq1IMlxks4i7AsZRRZCJ+3vX6qvpUX1Lbaz5iQkkrL0Nft
	uCgQbew9IhSOaJxs/63ofIVZDa735q6VlAuhgapYiqwM/oGpz04UG1oATZAKD6p6739Ext
	EF2cteoqnWTCkU1eOvqHk+v3ZxBcQDlv9dq5mnArLcjKKbN6OvsUsuR0gkO+j7JribmxBK
	QCP8Ka4C/2eUIi4YuoMEHQoQy4a8e9GL7N5EK4/mfinCEPTWdStbT4thtekNYQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xI66H01M;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762200500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gO1uJlhV6oM64fVpq/0JHSVRxjQ7sLQnALSTsOIjYT8=;
	b=xI66H01MM1/fv0z0izQzVRJQPMuP3I6bz+TAuuAPKQPlnq7DvVRC0CVYwJxQk2HDLQSyyy
	13Fbr9xPflk3Xh6E55W8oiVfhcTqOzWB40Dl3d3BqKUa5nJW6W7+ZDHdiUPfFj69jdxJ3S
	aBNUP4NZYCbHz3jMMOq6dsRbwrL2Ub/iknkPRiG5/Ujp4cCvxRacPEwmwWJvpI8c0/gENM
	CG/5HD2tI1SEURI/MPo4BtItGb/1fP1g9+1Y/eLADF6+KifszQl1FG8EZD4j3qCeVxIq9Q
	lHM2YsDliF2FIb7zypw5ZGOPNyEAksRlWLIIJHuQuG6qZtONPPXYvsIQJFA30A==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE7800 GPU in Renesas R-Car M3-N
Date: Mon,  3 Nov 2025 21:07:35 +0100
Message-ID: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: khrd3qq4o39hm5ydwj6crqdebybxex5s
X-MBO-RS-ID: 914238a6db457e3aa3b
X-Rspamd-Queue-Id: 4d0jMB4JpDz9sxJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_120827_471837_CCF85C0C 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A77965 M3-N SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a7ca6d3fdf10..c03efbedc397 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -19,6 +19,10 @@ properties:
               - renesas,r8a77961-gpu
           - const: img,img-gx6250
           - const: img,img-rogue
+      - items:
+          - const: renesas,r8a77965-gpu
+          - const: img,img-ge7800
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -105,6 +109,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - img,img-ge7800
               - img,img-gx6250
               - thead,th1520-gpu
     then:
@@ -134,6 +139,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - img,img-ge7800
               - img,img-gx6250
               - img,img-bxs-4-64
     then:
-- 
2.51.0


