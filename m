Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8CB2E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 09:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=APM+1yhaJCH113HhvAVKgYmvJyXakNLD1enONsFKaVE=; b=ZeBXlhqW7MtGRtVLxAxcpfMHZr
	x+SzujqxYNAHaC07/0ggVXWlxhxKjaKzBP0/oDT9VROGk1fyINGQUIpbn22WZ8hUDKkoBADgK2ois
	KM43LsJN0UeWDRaMDHsUsWa8gmyQiQarStT721srCwRv72ux2Q55jVGf+9UCvnalwDIkdXyq3kJFN
	qYhpIlqGCi0y9h0L/De5dQM21c1WwKDaRzcSD6agJnwlyE4RpB8GTqn/2aIQ002kbicyeNQ4zJv3Y
	TKSOdZUabcR8kG5nKefePAymg84F3Q4tV6mzsBtlxlqqjnCNxsnSwID8RK/T2yrMkdsierDLSH/bJ
	PmpIeK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwUt-0000000Arat-3WPM;
	Tue, 10 Dec 2024 09:25:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwQp-0000000Aqts-1TIH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Dec 2024 09:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=APM+1yhaJCH113HhvAVKgYmvJyXakNLD1enONsFKaVE=; b=CIeqgyD7GnCMGbGdXUgLfxDw/j
	QjUQVhbphX+CkQw1d3W1CFXtMQQqCXCX2SnGFeBDZ7qbcWAYZgVeKVytK0/UHBqpmTmN/27ym9LAR
	QH6EhibTYmutubDMsPbDPgUdqwQk4H2uzjVY+Sgx+Lqeiyk0QGsgjQt9c5wGxZvQR55AYnuRxipP+
	290zPtuALZmsOUyO5Gf1OdORZ8B2PJ83MWAp4o215ir6RBBi3EDt1MvnJIznqB4ohHvC0jLkFizYM
	IaqaKuvmufEXLMFaHZ6HpA5VmRguQPKlwb5hq0O5elluTQrMkT70/4khQ/WskDCcwt40WQb4dE/Nf
	VgqvcgSg==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwQl-00000003e43-1bEn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 09:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=APM+1yhaJCH113HhvAVKgYmvJyXakNLD1enONsFKaVE=; b=XtQMU9MVlqL5uT8Cv5KUl1wp+1
	k2Gyagp080pG7UY6rcUpFWYBZMfOvVApx8XVBbBNMnqyxOcUgMeDeoDqK1sxzgueFm95igY6MJoHp
	xFEhF12S1qGrFmq4QgAsLn80arpFDsomBzweZ7KOr+aIoXtOpejLhe7HtuBYQUAWBTNZRUU4vNPWN
	yQNddM/5EKnuCMgNdP1/MfePzTSlV/BCB5CQPatrIzz4uAqNEpxIjp699+GDiCkgANv8TL965X7wB
	LfLzHbTQDk+JdQp9/HtgpT9s/JEqUO4aMvhu8VCgBJHQE99rtLYWNr/Dy+NVL+LYCbh8Zrm1n4CVj
	+7QAG2KQ==;
Received: from [89.212.21.243] (port=59230 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tKwQT-001jvW-1b;
	Tue, 10 Dec 2024 10:21:05 +0100
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
Subject: [PATCH v5 0/3] SN65DSI83/4 lvds_vod_swing properties
Date: Tue, 10 Dec 2024 10:18:58 +0100
Message-Id: <20241210091901.83028-1-andrej.picej@norik.com>
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
X-CRM114-CacheID: sfid-20241210_092123_604495_AEB970F2 
X-CRM114-Status: UNSURE (   5.98  )
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

The LVDS differential voltage swing can be specified as arrays of min, max
in microvolts. Two arrays, one for data-lanes and one for clock-lane can
be specified. Additionally, because LVDS voltage swing depends on near-end
termination this can now also be specified with separate property.

Driver goes through the tables, taken from datasheet [1] and selects the
appropriate configuration. If appropriate configuration can not be found
the probe fails. If these properties are not defined default values are
used as before.

This patch series depends on the patch
"[PATCH v2 11/15] arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10"
(https://lore.kernel.org/all/20241202072052.2195283-12-andrej.picej@norik.com/)
which is currently under review. Please apply the dependent series first before
applying this one.

v1 is at: https://lore.kernel.org/all/20241127103031.1007893-1-andrej.picej@norik.com/
v2 is at: https://lore.kernel.org/all/20241203085822.2475138-1-andrej.picej@norik.com/
v3 is at: https://lore.kernel.org/all/20241203110054.2506123-1-andrej.picej@norik.com/
v4 is at: https://lore.kernel.org/all/20241205134021.2592013-1-andrej.picej@norik.com/

[1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf?ts=1732738773429&ref_url=https%253A%252F%252Fwww.mouser.co.uk%252F

Best regards,
Andrej

Andrej Picej (3):
  dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for
    ti,lvds-vod-swing
  drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
  arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing

 .../bindings/display/bridge/ti,sn65dsi83.yaml |  34 ++++-
 .../imx8mm-phyboard-polis-peb-av-10.dtso      |   2 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 142 +++++++++++++++++-
 3 files changed, 173 insertions(+), 5 deletions(-)

-- 
2.34.1


