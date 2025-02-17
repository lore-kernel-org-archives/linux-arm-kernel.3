Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5CFC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++xiowYqljzYNc1yRgdLw7cNanJkRSMEsPaPeSgY2cY=; b=PxzxN9RhiMHy9LncKUKtQiQZ5k
	neaAN0oht2mBZRJmRCWLUBcT3cR9puidQs1sgaLP+myOW2K+rJ3qGWbpS5MlhvO+Bt+3YqEn3OJqs
	UV0IW1Y5SDOPe5R5Khe2GMaWYwMeNE4g+U5wfO7MwmvhqRKXmNynklCVApe0nwCwTxVoSfFAEdRTB
	Q/h/+gkBZ2aWPFGxZ5qsXwakfVEqgGOJbRKEiFQ6WN6z22H2HwXDFgn5k8GALDM914XOLpwY7uQ4d
	pklRpi9j+gJapzN4uoT68LCp4mzx4qPupmvkSab03k0iUS+j1oDQRTDCNEifXjYLqaKVNKKXbFrMG
	xk4An/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzhn-00000004Nwe-2suJ;
	Mon, 17 Feb 2025 11:54:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzTS-00000004L32-44T2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Feb 2025 11:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=++xiowYqljzYNc1yRgdLw7cNanJkRSMEsPaPeSgY2cY=; b=NVCiIL8AivzHwXFnCv/BmNm4v8
	NbxomqCWMx5T38RZpwWH24eZrbfWBh+755rBk4Xa2su/zDK5pb3dMW07zLh4DZ3n7WjurgpRBTXrf
	xCXMbqw+1SywmoDWao6vNDWIqQTQCmpFiSXHtYFfQ8k89SGpj1pw3/+qKiAzbQG6ClUsEvi5h8BYu
	Hr5zBST+4tWQGks2QndQrtk20x0C8XI5EfoQkxrX7PA6D1GvvIWEyFDtxTxvZxrWR5ja0y5yStRTq
	/U4ItA8i+UjBeQUnfCbd0EM5H/Nljs4VLF5a35ZAFNtbvs43SijqHA0qANFzUFe5Ws03/uqsUrkRH
	esIQJw8A==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjzTP-00000001now-3J6o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 11:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9027F5C557E;
	Mon, 17 Feb 2025 11:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30806C4CEF6;
	Mon, 17 Feb 2025 11:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739792377;
	bh=jgUIKutYD6JHar/7UGNU4iJs/xInxZUk3vydF/EOQVw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kzxT3XhRjCcjpnvE3++zGyD9rzcaqOjhZUt/UwNxmggVTfyXuL+FyUMHghPQJ33Uf
	 1rvZjaF+3G9gd9m7RLw0rbRRCtWJQbY+sN8tmHdWm9fKv/eY0IlIldYXXZqadUn/w2
	 0jTsj/baJIlu63Fd18V1qbxPzuMevn1QLyLrz+R5K59se/dSthFBOHL4D4jGGlyEGR
	 9ERMKkptF43foAxm3qFoPVJYD3O2X35BTmsvzTzNgs6ogdQ4RuPA/Wd7EW5KplNzld
	 bXhryTX+2FPKcjbc331ZjMf4Hqh+A5vASO01aZzSDv6rffP6bF+Ggw4d9CNEV33Oba
	 mTH58v5bVgszA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2586CC021AB;
	Mon, 17 Feb 2025 11:39:37 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Mon, 17 Feb 2025 12:39:35 +0100
Subject: [PATCH v7 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-adpdrm-v7-5-ca2e44b3c7d8@gmail.com>
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
In-Reply-To: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739792375; l=1450;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=bjGQY6YcAfvFhQstvcidH714PAZmif+zGGMT8HLhTJg=;
 b=CP5gH1NHTRgD2P0uDekGEfmEIKssn+z/69IoffnSBjcMumJcL/ltIZ3nNsYf28XV4BSrdBGq7
 abPAy+0Gi3tBOEnhmFXEFHPOtzA6nZvYx8j1STsY/VT6AWQIzzSzrXK
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_113940_171698_65A81683 
X-CRM114-Status: UNSURE (   8.23  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Acked-by: Sven Peter <sven@svenpeter.dev>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..895d682bcf4e351971b04c6515ebf685fd39b662 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7746,6 +7746,22 @@ F:	drivers/gpu/host1x/
 F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
 
+DRM DRIVERS FOR PRE-DCP APPLE DISPLAY OUTPUT
+M:	Sasha Finkelstein <fnkl.kernel@gmail.com>
+R:	Janne Grunau <j@jannau.net>
+L:	dri-devel@lists.freedesktop.org
+L:	asahi@lists.linux.dev
+S:	Maintained
+W:	https://asahilinux.org
+B:	https://github.com/AsahiLinux/linux/issues
+C:	irc://irc.oftc.net/asahi-dev
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe-mipi.yaml
+F:	Documentation/devicetree/bindings/display/apple,h7-display-pipe.yaml
+F:	Documentation/devicetree/bindings/display/panel/apple,summit.yaml
+F:	drivers/gpu/drm/adp/
+F:	drivers/gpu/drm/panel/panel-summit.c
+
 DRM DRIVERS FOR RENESAS R-CAR
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

-- 
2.48.1



