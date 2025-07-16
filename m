Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5DDC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpkoMJVYrf+nym2u4i8uezXIMPI/i56YOMFW99GCO9s=; b=qU8Kf8RmKjSa8rhFzIC+4Se5r6
	V2mn4wx+n7DxXq3AJD+r+1RF3nK2nm+2gXd+5yyA9E6XEmAM45gqoHM7fWxuSvtPd1BZo6yRM7XhM
	GFDk8FGAoLp2QPESHwe23KvNCg1vV2WwC/IORh8sNLRZDp//cSym2Y8X4bwKzS7Ibqhfk3e7unnMZ
	e6raAOnXIyx2I7MYi/3pED94Qxnq09FEJTx8sR21+efnqYe1T3JajVqBJjRIWDegGWWndupZXGE6V
	IOZNJ9nrdOCpxdpLRrMoECQXgh57UovTMBBBKhX5e3yVBOtiZD5mEizJuU1NvcnUDyCXd0B4iWeEr
	ISzygLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2Yp-00000007q6J-0TB3;
	Wed, 16 Jul 2025 13:52:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc2Tw-00000007pc1-2DWC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 13:47:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 085F45C54B9;
	Wed, 16 Jul 2025 13:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42AB3C4CEF6;
	Wed, 16 Jul 2025 13:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752673655;
	bh=ckGXL7OnCquHJZR35uviuEeY5gCHUP3bzsBXwXjI+0s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JkVlO+4N70vvaOR4LcEIwuRDgywvGZlQ8KIUGL6gjE+HG/mYoCESDTgdxydD3imtN
	 GdVmDJbiLXzxi2GPhVouo8T+u82o9akf7XpKWC+Wk+KBpD4mxFTs91/DfTT7OdIUKQ
	 oT4dvON4FRQrVUrmlxEtxVSlAAutXlGjrdsPpOmcyupVr/Dz+IVWsbHkIRlAPMY5f2
	 EvkGsv4AS+RDJwUIYgS3bhIpGBcsqf9b5byfpalMkeS2QOy2bYcl9bD+7N4+azH+8S
	 CiImB9iPu5oR1yv4fVw4WtHBuJPCWCI1x+6+CIa/frE2fgil6KS5H8A9Kg+f38mGQM
	 bxvyhFGJ5iLKw==
From: Michael Walle <mwalle@kernel.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [RFC PATCH 1/3] dt-bindings: gpu: img: Add AM62P SoC specific compatible
Date: Wed, 16 Jul 2025 15:47:15 +0200
Message-Id: <20250716134717.4085567-2-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250716134717.4085567-1-mwalle@kernel.org>
References: <20250716134717.4085567-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_064736_626437_00EBA263 
X-CRM114-Status: UNSURE (   9.09  )
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

The AM62P and the J722S features the same BXS-4 GPU as the J721S2. Add a
new SoC specific compatible.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 4450e2e73b3c..bad3e412a168 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -23,6 +23,7 @@ properties:
           - const: img,img-rogue
       - items:
           - enum:
+              - ti,am62p-gpu
               - ti,j721s2-gpu
           - const: img,img-bxs-4-64
           - const: img,img-rogue
-- 
2.39.5


