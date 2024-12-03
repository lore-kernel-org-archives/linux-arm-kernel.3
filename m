Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A0EE69EAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 11:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GFOo5u8aTRK7DhrsU260UeP6FhrEO8wPjHVlLdKzJ1w=; b=P78BrhjCCVI98bgztVqUC8qEIi
	Xlew+AxvMrTQd1phVVyA06bYpJTf6rBQkRBK14ha5ba/fF2N5wdiI/lOy8tw0725Lo3qXDRnLqKHg
	u5piL6jF4as7be9O0GU+fYfzIcnoJ1lTzn0IGF39m0S0WAz7518h6wOqIVf6C7qSEVxXDJf5lefrN
	VkmSYFhJ5QuR93Zd+kiznGludNdZOvL5UF+FVMOnjK+SJte3YPA+Kl3YGjaC+wEMqdnMwQrLPTzl9
	3K4po4FapQ9co81d5dSg49IrCYE9dnT9m6lsFtzbZ8xlBp8Jt3JLgg8M085F0FGo7Ge13rhKMDZpF
	eKOUMveQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQqq-00000009DoN-1aYA;
	Tue, 03 Dec 2024 11:13:56 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQed-00000009AxD-1x0G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 11:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GFOo5u8aTRK7DhrsU260UeP6FhrEO8wPjHVlLdKzJ1w=; b=dtMb68y3lpHLKU0c1tR4gkjF+V
	ad1pKfy/m7Ua/q0KSXO8jrUEzMoyOzkz2ocyB13GREkilWMp7Z5RYjxAc8vU95PiOcph+gavbGoh9
	WW8j7vYFHfHB3hOSIqSDEQcscVjYjFc2arm/fkJ3rW/FG3XJUIgMV4VpPf3P6DCskVHBTLeshk+Y4
	/X8stw+PIT+jYpr36osFhs+zTpGI5VhK30uFRjNskZYJZQX9Le1OtgGSUGRnPz/I/Hrbtbj+wzGjQ
	dpUPSGX82cpRRWw8vDUIJKlt5pPT1yvZUG83zCVK9MlcYZE+7BbqwqVCKNO464pp4mwgEfNWRUD/L
	KgUcYraw==;
Received: from [89.212.21.243] (port=52296 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tIQeX-00Bd83-0c;
	Tue, 03 Dec 2024 12:01:13 +0100
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
Subject: [PATCH v3 3/3] arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing
Date: Tue,  3 Dec 2024 12:00:54 +0100
Message-Id: <20241203110054.2506123-4-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203110054.2506123-1-andrej.picej@norik.com>
References: <20241203110054.2506123-1-andrej.picej@norik.com>
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
X-CRM114-CacheID: sfid-20241203_030119_656724_02F0E13A 
X-CRM114-Status: UNSURE (   5.57  )
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


