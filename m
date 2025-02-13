Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005C1C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kPk97JbhpQmgCQvtDgns+ZSkouadZj6mCq0F4eqNg4U=; b=DzGJ16Qg6jvACaswIjS/FMkPyC
	wt/lzvpYmF5PWnHGvq4Ne3ojCyKbaf5IXQI35vJhPW8cX37iQoRag8lE3FFM8poCdMvYI9u/Dd5fZ
	RmeO9soiUp67nitFNjFgYEWmgzK+d+z9JTC16HazA1F2NkD5X1sVigIVGJrJWjx6dBVeHWYwV3lN1
	md9galh/Cy0scOp3TYkFK0joibtKAy3Zk1UPKe2C1u1/Gpy/Ttm33tJiLi7XrnOpUaKs1OLCa+DEf
	yvicsRqtyVRSJoRKSXqssrJWLjLSLIvGPsonX1CLWgkdgAvTCMAGC24f/uQTuR0VXV4ierG58y7zv
	ze/Jfk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXIc-0000000Ap7L-0VTM;
	Thu, 13 Feb 2025 11:22:30 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXGQ-0000000AoUv-0de9;
	Thu, 13 Feb 2025 11:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739445612;
	bh=c+PRWIgQRlOLKV70WxMuEmtDfXA0VqGW/OzrGTH7ptM=;
	h=From:To:Cc:Subject:Date:From;
	b=kkCLYmHqigOlumjAgmhC0vswBSB//+IYO7wIoKFRhPvw71hWuZJEbcEngHEYR6YJh
	 vndp2Tf9GQDuWz/arpjrLLHRQFtmtyAHbU7lDIa7kGqis0eC2ke3Ebfgxei4fo5+lR
	 8ocOPYHyneGE3raK37cTPWjpQGO0IzHeQbvcfLaDwxqYIeJorLSjAZ+vn5jRtqqtAd
	 3pjwyZB8T2FXeHjbkDEvNMZp3b0jtQCDwjffIXWdaZYLz+DMRnWIqnO766Yvzi2c11
	 JCE8Gds8sR7rdM8yjr5cXHIAOen7meEkFconAP/TQyY2VBJxPv8Vbl5OrLX9rx85X/
	 5/Z+Jl9dzIKdw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2192717E0E93;
	Thu, 13 Feb 2025 12:20:12 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	pablo.sun@mediatek.com
Subject: [PATCH v1 0/3] MediaTek MT8195/MT8395 Display Controller Graph
Date: Thu, 13 Feb 2025 12:20:05 +0100
Message-ID: <20250213112008.56394-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_032014_341906_73621F6C 
X-CRM114-Status: UNSURE (   9.40  )
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

This series adds a full OF Graph for the Display Controller in the
MT8195 dtsi, and configures the MT8195 Cherry devices to use it.

This was mainly done to allow different display controller paths
for the Radxa NIO 12L board (compared to Chromebooks), and this
series contains a preconfiguration for the DSI0 pipeline.

No DSI display was actually added to the Radxa board, because that's
a SBC and, even though there is a display from Radxa that can be used
with this device, it's not mandatory to use exactly that.

The NIO 12L also features an HDMI output, which will be added later
when the series adding HDMIv2/DDCv2 drivers will be merged upstream.

AngeloGioacchino Del Regno (3):
  arm64: dts: mediatek: mt8195: Add base display controller graph
  arm64: mediatek: mt8195-cherry: Add graph for eDP and DP displays
  arm64: dts: mediatek: mt8395-nio-12l: Preconfigure DSI0 pipeline

 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 184 +++++++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 129 ++++++++++++
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  26 +++
 3 files changed, 332 insertions(+), 7 deletions(-)

-- 
2.48.1


