Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2F0105F7BA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqmiBlG5GZNPNrF8yE1ZigO2m45rU7LUeETLTvie+r4=; b=KQvxC4L/sr+0fj7Qw94YbUrQn9
	JfwXz3wyDUI/gngUPsKuZ4EJtvPkyi55g7k9/Vhy3xgFM/NUIpDG1NVaiY5hJHL7i170kHPdsTX7E
	9zD8Il1fSHPaPMzbMf9GqGVHsVkvtIk+GGIlXVT0PzUqciMFBuNTQyQmzhJnp3ys0iKCyQRjN3nTq
	QQfxC/XMLoavTQJmQV1vs4+QvSa0131ZIh7ynOb1BIEmr3+CEzPXjapdVYQFZIVHna+FuUMqUzGGv
	0JjyxlfbONQeEe8IWvl6sbJXgae6PX+F0Ky9uccx5oVWroot+Ju85aBdzHf2Ufm/anP5bVoGUmTBW
	dhnwJj7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14KH-00000000Wo2-1V3n;
	Fri, 13 Mar 2026 15:21:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Jq-00000000WV0-1cVn;
	Fri, 13 Mar 2026 15:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=QqmiBlG5GZNPNrF8yE1ZigO2m45rU7LUeETLTvie+r4=; b=keFKFhcXqNRncuFOYx+sUM9DGo
	MLAtXP4XKRpuYfO2986psGXL3epjS9G1od6uFGPDuE/sDjBzz8kodeHkPJMMZBxvR82lwydRTlJJ3
	nF3AfAKjwJXZwHeOzx0ZUKHM9WLPa09/0jDnHbux6BgTe7ObinePT4m1YYTvn2hOPgJjphCLzQ0oX
	Rw5nY6FbSih+73qSt8sMsZHGPm/09XjnLthN5RVDIjdtGPbhISSsQmErcss22VRQ0pku7zzicKlIV
	BPHqofKZI8SwlBpqWFXwxYR+Kq4UH9/gUS/eRnzoxCVDrymVUJMNc/5cDIJSroQUM/6R/A8ml8a4z
	RFgrHLfA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Jk-00000003fcz-1h67;
	Fri, 13 Mar 2026 15:20:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D629044323;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADAA5C2BCAF;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773415246;
	bh=GWeDLU9AFjoINA+09rq3vjmK00lublXB7/CSAH8fXo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zy745EI9UzlxJ2T0rgY6o8DpItsb3STnMTI+PokKV91OcnO9zbErUscDNqhXxMPb9
	 xMwTwnxZZLiGmF/SARlib9uHqGFKiFufqCiqN7IvNpOnEPf19QZsl1x57u86xVRMKG
	 NGbZaubA3CfsEKRkJQzDPbqtLxQjhs6dDwp15V0MbnPokg5VrkqU9xF7L9VCBfcMex
	 Pnqkdm8Jw3P6iFd9dPmHYpuINB+GGwanISrNxouNF4JsFdAnNkjYHFWAl4kLLwRoXg
	 TFclbJOS02sTTBT72kzVtwYNNwnuCcU+9fAnQwNd2pwoe6DADiWuagLnjozRntnrg/
	 +2+ByO//CtPCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50BE105F797;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 13 Mar 2026 16:20:51 +0100
Subject: [PATCH 9/9] arm64: defconfig: enable designware mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v1-9-b3bddf749914@collabora.com>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773415244; l=937;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=mcrIEvEtgTS/gcjDOYC5aehK60tx7gRZsU5sHfBlIbc=;
 b=i98waWvpfL3yBp38R/xRsbEUzSj/vKY600CNq03DpE/y76Na9EaSORwQYWeEqplCaNdksxxEi
 aVepIxpsFBxCSIXpOH/OZ2AO2nS3YKCOl50+TKrc5NnfsdT0KY1INzk
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_152048_945292_8123F597 
X-CRM114-Status: UNSURE (   8.76  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
recent Rockchip SoCs, such as the RK3568 and the RK3588.
As a consequence, they are used on a lot of Rockchip-based
single board computers and/or corresponding camera modules, such
as the Radxa Camera 4K.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..a93ff73ae52c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -907,6 +907,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.39.5



