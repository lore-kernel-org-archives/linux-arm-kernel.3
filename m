Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1384DCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 13:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=00WHQBbuvCy+Iu0TttyHrGysG8aWQEbRKIjNtnlItpM=; b=U0xaJXjKRAjhHSGwUNok78yaRH
	rT0+M1SMUCycL8ww4eTyF7Yx7Qc03JxAoVfVkWGIaEDCaxbtkgTYtp5jIWL1cxDK6aUbMqLNfbqfX
	Ab3DACtQkl9Bv/5flwWFgxgjP+L2c3Rozc9sZYr3ojNHWwOIizpwxnoGFRvj3gPOSxRn4PSwIv2xt
	QfDXqt8N7MVLb1ddLwL39DddvSS99TZiSjizvUSDBMtGTxxFnfFz2hFMHAtfUz4E365NO1+5e2qtj
	jzBbvYIdR+YAlko9Dk6KF6ONbhoaQSl8OFzimeBLXMJt2Z3sK5RXgXChHcfI6kGD3uvWn9kUkWc9p
	dci39Xkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHXT-0000000Bvy2-49dl;
	Tue, 04 Nov 2025 13:57:36 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHXR-0000000Bvxh-2a5U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 13:57:34 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d194p6Zggz9t27;
	Tue,  4 Nov 2025 14:57:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=00WHQBbuvCy+Iu0TttyHrGysG8aWQEbRKIjNtnlItpM=;
	b=QzxvE5Dgn/3P5I0WBMJ9uQNOBPBqSn1WLcQafm+LAnDIvmgOkrmb1K4cbqlga0capxFzVq
	DjbrBq69NA1dXkVSWOiFVST1mXqOvKDU40KP11BFw27k7z0yW/CnvDEs6dxmUh07CqXm5s
	xTML1mbReyQ6AkFfi4qNB34myiTj/9saIH2rnAWcV4lAbQoS2rvDuW+Vcupi7tLFIaLnkQ
	MucwQ/1eg10jsk3QWZdniW+PyStnqRj7DxgV6CV323w8AAY/Zn0GTW4fDoREaJ5EQ/vBPB
	MY/Q7I1ViIJ2BGzkrWS6kzRtLHxZBdbLPs6RTGHQHn/GusZEC0tK1Xxpq1N37w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=00WHQBbuvCy+Iu0TttyHrGysG8aWQEbRKIjNtnlItpM=;
	b=XuAIPL/pleVpOMtiG6KAUnTel2TS5JNoTv+cH+IVL1Lr3ENIh0Z2CX1snYXl3NomULKf8P
	NcGwc5KB/xt0cg4wFoOvqCgMo7Fe0xpdLXItPPVFmw/SSsuego4ZG9x1Jbe8+bg51JOxjF
	TpS/sr12qj9ml8IvziGdYJGlceXkHGN4gFEt+Pn5p1Wi1qJQ5IaGzsUMbZFAfDAgB3v6Uy
	YxCB/1dJLuS4jX+aQGVxRJjL/nMExk7x+gVfmZcq5gQCqOxNP33YPDdJ51OZvNcPn6e4uj
	MWMFX94gGE2Tf4j02Mxyqxzy6ekO3Rf/C8aUecDmLFqrA0q1c/3FRia+E0luwQ==
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
Subject: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Keep lists sorted alphabetically
Date: Tue,  4 Nov 2025 14:56:05 +0100
Message-ID: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wg8q95iupj6tko68886b5ooww1sxemjx
X-MBO-RS-ID: 0190ce7413311b3881e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_055733_817373_EC431D22 
X-CRM114-Status: GOOD (  11.01  )
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

Sort the enum: list alphabetically. No functional change.

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
V2: New patch
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a7ca6d3fdf10..550da008629c 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -134,8 +134,8 @@ allOf:
         compatible:
           contains:
             enum:
-              - img,img-gx6250
               - img,img-bxs-4-64
+              - img,img-gx6250
     then:
       properties:
         power-domains:
-- 
2.51.0


