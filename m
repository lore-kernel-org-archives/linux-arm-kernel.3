Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09986CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 19:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qg44q0VVpNZ3OyYCRjYUw+XIcf+qYUx8J25GphoeznQ=; b=m/rsKeTIi8CLO94zn2stVD698/
	5DzQAL/KuOB8zbJOlQeKnSOrX8yQdFG6imrWeSm4Njm55VVLFtKdAYETEBDaX97a66qIjvkuqN0ZY
	2kC/K/XzHCV5y/mswnmbM/44iTk99D7vCZf7Ll5ozNHrUl/AnEzu1CigeFompMyU2/KPJcdMmw84i
	/b08mkc1oLRZt73kmbRpC2oO/KU2otFnQjWenuWuM+4R0E/59lwAIsJojXZtGrM6iqyOczFmxsdub
	aE4uYGD34t9O3fC6uHxNv+jiM2mNIUrsoXQogxRZ7uxyf3NaZXfgCl0xNIaPhbEOeWXYeHGbKe4yN
	1VCtExWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Nog-0000000EEW4-2n6F;
	Mon, 13 Oct 2025 19:02:42 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Nod-0000000EEUo-22mn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 19:02:41 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4clmtv5glTz9t0S;
	Mon, 13 Oct 2025 21:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760382151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qg44q0VVpNZ3OyYCRjYUw+XIcf+qYUx8J25GphoeznQ=;
	b=Qy2Rxf6Xekle6nc5iX9/WQPMEXyGRW4RxX3U/jO9SMR+Ns7rHt+cB0Pkq0Kkoxt6ELP8Kp
	ERbilmOrkdv8MIjOqvGEWOlmhzj1kfk5hr70RC2Uzg4KEYWPMp0yHL9+rn/czUXS5HzJoF
	eFKVRYfNrXvHJWrzopf3SxfwDurQNv2dmmORkfFXgu3EiK90DyDUg1EBammkgu6OcZiSIs
	GahENHa3jaSs5BezXNS8LW2VrB+V3tjC9LD5BPifBJfBK2gauUwj7JXkmFOa/f3u/DaJDY
	cCe/RtVGX6ITwoN1VTiwNJ8TV+UkVatn19pprYbDrXe20/4WvWW6rbc5vxEUzg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760382149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qg44q0VVpNZ3OyYCRjYUw+XIcf+qYUx8J25GphoeznQ=;
	b=UIcur+N0qOo/kizLBR9bNsH5j4FBVb9HQ8eNT+uzmc4V3YOVoephjiLCaxvmZRn3uOJoNW
	GbQIN2A3FJQAeHwihmv6Gs17h8P6ezOqF85TmliPwa6ARmM4JD8kPdl7ikkNcHim4DSiBH
	i0JION5Vr89i4/z8DcY+PNFa2JBpXMkfY/ieFPOe4ziPeGCVKU7CSc/P1b642Qx1qAy3vk
	zWUBw4tNdFxKWKyjSEtCkM4d2jpSk8P6Fa6l5j7XvMutn6DnW8WW4m2r6RdqU6mKFAEX+a
	FMJR+5FVaoREc1CpKkmo9uDd30EPsWHnFUXU5a44+2JNy/IJBIH8oQJ0rWfvWA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+
Date: Mon, 13 Oct 2025 21:01:17 +0200
Message-ID: <20251013190210.142436-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 87dbecb418ff6fbe859
X-MBO-RS-META: cnajsto9a5ybxf448khspd6zh4y7sud1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_120239_669227_AE74B2A8 
X-CRM114-Status: UNSURE (   7.10  )
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

Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13
for related userspace bits.
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c87d7bece0ecd..c9680a2560114 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -13,6 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - renesas,r8a77960-gpu
+              - renesas,r8a77961-gpu
+          - const: img,img-gx6250
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
-- 
2.51.0


