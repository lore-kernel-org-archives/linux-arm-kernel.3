Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF523D609CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GlNV48MQ4G7U/3atikXtOonokPebd5St2HI4ngxfLBg=; b=cMWPoK2Sx+PgONUSu/E/OEmwGc
	U5IXyIN0Wa+E15y+AHW3Ip3Xahb7621R3mypWWg9jdy2KKxROosXtUztlwY0I29QsF81+Ug/kuxme
	fO7VBfuABksKX2UE/9YmD/sdjUMN7KzLlt3hVgquGK0YJPuGpJ/O2Q8GIvrWhvMWUsrDgneVhU8ey
	6GztO/IbpqIKQI+51b8Xq6JQO1+t0rEdSCFa1KO6AshzfxAfRGJxHAE2HK5J462o9Ee4M+ZL3bqpk
	iGjpynlTO12WTa0948/TzOZAY6PrwvZLw6WhjVeFAyBeO9CDilDpgezx+GSv2UdADDLiHwVNGsGuN
	w7JZTDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFNe-0000000Crkc-0uXt;
	Wed, 27 Nov 2024 10:34:46 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFK8-0000000CqvQ-0ZxC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GlNV48MQ4G7U/3atikXtOonokPebd5St2HI4ngxfLBg=; b=KFqokzSyu7Wye4UwKlHRqnQi9i
	6ZC8cOeLuFtStrRftgOX36FHc1iImeukZen/FfW7RBwdZh3Feiy/AhX16Ka5oZG+H9EkJvy7pq2HD
	WbVBbLQ9dzwID4YX0E8zxySjBas/gMQO6H3YB2dVGoixXvA0qSDf9rKLGZplQOaOt4hogfMNXasCm
	3VR57T1TyTsGz86aBnQeCrke1t3laTmFOT7oL7IDCdEUpKuBk7P1jkpaNqBetVGaGIiaaS/G2KCWS
	s0xOCZeT6cRjDUHbEFnkwMWeAXAAowDFmeBH3jPYkQIpiyMSyatNZ0w+c80HIlqECgRryAlkcehsP
	PrShsijw==;
Received: from [89.212.21.243] (port=49750 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tGFK3-007Rx6-1d;
	Wed, 27 Nov 2024 11:31:03 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se,
	jernej.skrabec@gmail.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	marex@denx.de
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] sn65dsi83: Add LVDS_VCOM option in device-tree
Date: Wed, 27 Nov 2024 11:30:28 +0100
Message-Id: <20241127103031.1007893-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_023108_629321_6854DD3A 
X-CRM114-Status: UNSURE (   5.36  )
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

Hi all,

This patch series depends on the patch
"[PATCH 11/15] arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10"
(https://lore.kernel.org/linux-arm-kernel/20241125081814.397352-12-andrej.picej@norik.com/)
which is currently under review. Please apply the dependent series first before
applying this one.

Best regards,
Andrej

Andrej Picej (1):
  arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set custom lvds_vcom

Janine Hagemann (2):
  dt-bindings: drm/bridge: ti-sn65dsi83: Add optional property
    ti,lvds-vcom
  drm/bridge: ti-sn65dsi83: Add ti,lvds-vcom as optional property

 .../bindings/display/bridge/ti,sn65dsi83.yaml      | 14 +++++++++++++-
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              | 10 +++++++++-
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.34.1


