Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D35AE6C61F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X412GLjVjNgho4d5BU2d+RZdrHHdZR4eFJmgPaiIEUM=; b=Oi+/nb2LpJlkWcBSqZ5zfSSZgx
	UYTTEY++SGtq+iu86kv3dh+3pltZ8gueGE9xD09T03AltPXZbB1NzG9a0ZyJ/J0t8yFkfjvtFKPgp
	5ls5Mg1bUisAobBEJhJ3hwD0sPV0DPJC+tsH8S2D6sIseDXon5MiuZu5zXGb6X5rrr37ivthG3jBb
	yTIzwtAMDuqj4Z8i7xHTX4wlvprgRwxGboJg4KSBGhF6NCqzBHR2uPR/l+S7+zXXMjepco8/73BfG
	CRkXSPxpJW2uAtlVPGJEoA9jSZzvPFSjmwqUW4bDpKivTcGfvi8IYbeA4A0ofjXL8tnrBJAqipd5O
	rwWJPeXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOoM-00000008nE6-2g1c;
	Tue, 03 Dec 2024 09:03:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOkT-00000008mGT-2JaF
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Dec 2024 08:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=X412GLjVjNgho4d5BU2d+RZdrHHdZR4eFJmgPaiIEUM=; b=BAzEVlv9C07z9JnmYo0w1XqSNf
	LqFvBzXESpv6WfBcbfJ6yW341RzDva+tEQlw2RQNXt3Pqht5XP073op1CWnSTL918duz54Kidcxy8
	jlUjYT2lALjMRVyXxZ1ImopX23Nq1tWm8vlKMknSj9d5yoTIiCFPylT/4x56TwEhj5cB4OqpcZeyt
	695x8lpJFAjG78bFmMXsMdKsw6Ag6UNb9xmTJKZdY6Bjb+s7WBczoL8LrTVCIgLciLdAYOpPG516l
	TevID0d5boJd0k1AoRWgAMsxIG2aMb8xx/Hbs7NR2K2KMjZacwB0hhCm2GX2t/rltFqANjoNPYrxh
	6m3D5yCQ==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOkP-00000002LM1-3KK4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 08:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=X412GLjVjNgho4d5BU2d+RZdrHHdZR4eFJmgPaiIEUM=; b=IohL/7cHd6PBHWtvYAg8G8g2Z4
	dandx4NF3wie961zgDH7zBPPol2b3nSNRVE9FZijFqx7ChLAJ/gNe57kL4tlrfgLLDEBg/D1Q6KDl
	sEUrS8nAw2oqW15U2/OrTXssRcTG5ICUHgu69+IfwRnFLKNqEUdYKCVIungVWb8dk31T+T6yA6XwG
	Wgb8azFG13W1asAMyQoiCU/IzWqLilF8sfHWsxzMeX6iHLxZWzkCqIYXC9uBMVVErqUNuoari40SS
	ybZa69aEktxNAF2dA50uzPt867fTHJbEvFv9gpT6tMiyxbQyMBeDVM045FVQ0+HjPqN10kQ4ECBuD
	LacpYQig==;
Received: from [89.212.21.243] (port=47386 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tIOk7-00BGOq-0Y;
	Tue, 03 Dec 2024 09:58:50 +0100
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
Subject: [PATCH v2 0/3] SN65DSI83/4 lvds_vod_swing properties
Date: Tue,  3 Dec 2024 09:58:19 +0100
Message-Id: <20241203085822.2475138-1-andrej.picej@norik.com>
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
X-CRM114-CacheID: sfid-20241203_085910_131994_DBCD16BE 
X-CRM114-Status: UNSURE (   6.61  )
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

this is a v2, which is quite different than the v1. The LVDS differential
voltage swing is now specified as arrays of min, max in microvolts. Two
arrays, one for data-lanes and one for clock-lane can be specified.
Additionally, because LVDS voltage swing depends on near-end termination
this can now also be specified with separate property.

Driver goes through the tables, taken from datasheet [1] and selects the
appropriate configuration. If appropriate configuration can not be found
the probe fails. If these properties are not defined default values are
used as before.

v1 is at: https://lore.kernel.org/all/20241127103031.1007893-1-andrej.picej@norik.com/
v2 changes are described in corresponding patches.

[1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf?ts=1732738773429&ref_url=https%253A%252F%252Fwww.mouser.co.uk%252F

Best regards,
Andrej

Andrej Picej (3):
  dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for
    ti,lvds-vod-swing
  drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
  arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing

 .../bindings/display/bridge/ti,sn65dsi83.yaml |  36 ++++-
 .../imx8mm-phyboard-polis-peb-av-10.dtso      |   2 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 144 +++++++++++++++++-
 3 files changed, 176 insertions(+), 6 deletions(-)

-- 
2.34.1


