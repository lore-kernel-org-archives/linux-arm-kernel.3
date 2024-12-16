Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A07AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKk30ZIZRqGtSP6fobJeplap92YADW8Wo93ti1YEXBs=; b=5A8x+zL3yktpPl1a9HXt2FsE2n
	YfHfIE6HtwKBXZTSDNfFQ4zUc9Hsaj8DcC3X84i87Ki1fhVCvSLaJJUWGWnHcMMGatT68rHjbVOVa
	ugz/X3oUeZH2VSXG8Tm5rhZCUg/5CllCX7FjREzP5PugTSU3s6dHavE1cr61isCy6K3SUqRjBXEcs
	PAVBNKwnicH2PqkpoYdoNvv4xJEFK4hiQTla8DBdNKY7/LFncvcvv+KtIjr6XhK+BHsFPDrF21KhC
	wgOOanWH7yJzm58HzSxXRLZAb3f0rgzy4yZcO12NYna80XA0CjoMv9c2KonxpZOFTNdjkWBCrNNs3
	YV8TWpZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6wz-00000009Tbe-1ZRX;
	Mon, 16 Dec 2024 08:59:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sj-00000009Sjx-3QBi
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 08:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gKk30ZIZRqGtSP6fobJeplap92YADW8Wo93ti1YEXBs=; b=cL1Y3Xb7JfHKTWzGVaY7Bsji+c
	JEtjzYwGiVu+Oekmj01wgZTsfjHvgV4jutwYBbgMejQXI8ux0nNjY8wMcI/2XntSxtmnleeBnjy4a
	dXbJVcacuklOJu/euW0Fk0MLLhNnF1scgS2ww2kN7hQrghj6Anhu1nSZOraZAX4sg9faVKtmQVfje
	RnizN9Z0wV76MhVnfzuUVTs8rf0bOgZ1sqD0+1AOZ9PGA5ZO9+lvOzkWvqZXijLlgMEjRu7MQETsH
	PkFtJDjQsFLw3/zK8jH+89BPffCAOz2gEqFr+UFrqImFPdDc3SYFBWsXswixoOTtQeVBGrhiOSGIG
	P1oksGeQ==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sf-00000004o9g-0pTu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 08:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=gKk30ZIZRqGtSP6fobJeplap92YADW8Wo93ti1YEXBs=; b=cVdIfrixyt2Yy4kaDIvyXlZXeV
	ZJbNiAxP5oexJ5kC/kJMW9i4RyYk4xotJ5Rf6UNihvFPDEq4/RIAggx3yFItin3ZIZMim3vom5B5E
	qNab6Txa3Px3nJrNiERs+jIbSK3Hj9Qg+0tOaK0jmpbl6VqDGpSQ4YVBkff8YDL4qvOeMGgwCVEPs
	rXECO4yKNj60i9UIbKvDO67TA3GCAyPNaMBSGn1feguG3/va2WydaSKrZsqNeHgH1tTMtE9lmtrJy
	fhqb8b0GRTLESeBLci3y2ImWvqGKJNxeZkI3TtP8z2kZYBQffkQ8CKXqJM+JsvrQ8QZ3mMM9Yu0p/
	BsMndEqA==;
Received: from [89.212.21.243] (port=57844 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tN6sc-0053uC-37;
	Mon, 16 Dec 2024 09:55:06 +0100
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
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH v7 3/3] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing
Date: Mon, 16 Dec 2024 09:54:10 +0100
Message-Id: <20241216085410.1968634-4-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216085410.1968634-1-andrej.picej@norik.com>
References: <20241216085410.1968634-1-andrej.picej@norik.com>
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
X-CRM114-CacheID: sfid-20241216_085510_762697_06CEA1AB 
X-CRM114-Status: UNSURE (   4.64  )
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

Set custom differential output voltage for LVDS, to fulfill requirements
of the connected display. LVDS differential voltage for data-lanes and
clock output has to be between 200 mV and 600 mV.
Driver sets 200 Ohm near-end termination by default.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
Changes in v7:
- no change
Changes in v6:
- no change
Changes in v5:
- no change
Changes in v4:
- no change
Changes in v3:
- no change
Changes in v2:
- use new properties from previous patches
---
 .../boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
index a9de42cf14be..8bf9cc553bea 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
@@ -186,6 +186,8 @@ port@2 {
 			reg = <2>;
 			bridge_out: endpoint {
 				remote-endpoint = <&panel_in>;
+				ti,lvds-vod-swing-clock-microvolt = <200000 600000>;
+				ti,lvds-vod-swing-data-microvolt = <200000 600000>;
 			};
 		};
 	};
-- 
2.34.1


