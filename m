Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05645C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRMVTZ8vtbtPKIa+qHrZs2AF3LH6qpkmLAQTzSfxb2Q=; b=Fw69ipXXdljNnEzSxMq4hIWHAr
	aCZS/GdaHpbtnDmpG7VUwdrKQVz2Q9Hg9i5+fGn1fyPclHWkzVaFb2MnNL8iuBiENxTFlE9FXAoAM
	+kQ/GD3zgJMbpP48lD02dfteNPZkQN9mq++uTw+9srTk57YXWOffzdclw9flWQ8eev6H6Nmw1ZAd7
	BruVPwCJhiqcqrwW8auNkeDNlUrvv/oBYc6fCiEPmaQVnAiFwlXCpC0k+E8LN47gE8hqfT1LO6knV
	Nb5iJT/IJYWyzNpcMHt5h7QdIdNkdm+91QOMZLHJQxt5wPd0MyREBFW2sMm1cbKb/yG8E2JKz1AFc
	qzT1Sp4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2ci-00000006X91-0NIe;
	Thu, 06 Feb 2025 14:12:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2SF-00000006Vpx-1hrg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 14:02:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=jRMVTZ8vtbtPKIa+qHrZs2AF3LH6qpkmLAQTzSfxb2Q=; b=IuXLgbvL3/Mwz+mHtYQ+pzi6s8
	qVejuDIr8VIWUnTMyMuCRchHFXRMzkdhw5HY5+RlGkyRKCdbMPdq7oC6wTKuZPMiRZTQp652WtLOM
	2DWs7ldTPaV3CCmiOXzP+UxmulbWDGgGTBzZDgXGbRp9JBk7uRfB1TWdWlYej2EP6D2OVTsCp7g/P
	cOye4V3i0QeVOuV3c4ihILBSMqop0NqDAVpxts8bvD1jC98UPZ04tJRUsIKraSx1TVj00Y0UzJnLk
	r0vsxpNdtDSnrPpnUJIY0syr/vK51y22hWPCy+saWnDnu0Fv2G9/aotpALY9Fu6bEesxskjoXhk4w
	rFfWCT1w==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg2SB-0000000Gxdq-09jy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 14:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB958A442FD;
	Thu,  6 Feb 2025 14:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64B64C4CEF2;
	Thu,  6 Feb 2025 14:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738850520;
	bh=P/SzQu6y7u6xqUaNho59arHMiKdq98AWgwmXeu+7vz0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dwi3QvqEq7jxSdsWTrDKf9itCxNZY436QN18swCyu80Mhp28CPn0Ep0iUhybqReiN
	 mpDVcF2e2mt2m+oFx4cwr0GHchBi++P60t7j1kncrwDL328R/7qw1oaohtxUE9Y9ZK
	 TgkSwFTK8ACS71cra/Dz4rsAFAwhGowEjBPJHls/LAcWW8BocZAb0+eT9bonmUkCZ8
	 +okUQTpdUk/h2X0SpW2KjEKbpzChxwm95xum7sav6L5atmBTNaon50bYwnlG1ZTmhX
	 U9zq9854A/n7yqKuSVrM/FBOL8EHWJ8Avzkj4tMg5cVU/QaMh/5a2spGFKa3z8VGd4
	 nd6d15V8LrdCA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5064EC02196;
	Thu,  6 Feb 2025 14:02:00 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Thu, 06 Feb 2025 15:01:58 +0100
Subject: [PATCH v6 5/5] MAINTAINERS: Add entries for touchbar display
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-adpdrm-v6-5-c8ab9348b853@gmail.com>
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
In-Reply-To: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
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
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738850518; l=1351;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=QZbXiYlIe2lkzDC1TDBQjKD2XWfozo+Zu2nizcpe9lI=;
 b=hj74DCc42VipOopXJGsCkSRizSll3yOyirOlf2oPMfapmTohJQUmlU4r3lofykfmq5AHwFP+F
 bbydgCBWvAqADwAMvKgHsfBuyv6Di5rePfJ34zTrCW5jOs99CKBslCR
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_140203_387936_8B0E29B0 
X-CRM114-Status: UNSURE (   8.59  )
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



