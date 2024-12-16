Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216B3E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPHS+vG8QIPL7cOVz1Q//RMyZMwZXBy2d7Sjyi0gdrg=; b=Bk2OCIU5dxjvQAt2O0DgPrSEuP
	1SMWEZVYksfyO330RhGrq5cxlV8EbetjydkMUjOe/oW6j4dYMqCjZmtrnoYvirwlGbHqziQGuJCWX
	nT4lZ9L3JAqke7fbLUFSJLMFKZ55WIXyAqcCv4FhJPzRgwR1/Pm1fDVToZNp6NfJoLVGiLq1he68R
	xwUYNvn5lyUGTD1sK81vowaRBMHp1S8zqo6o0vN40AZxVFlPFXUCb5wEEs9Tfh5r6kh+cCWbKEt59
	p9+XulyLrco7xU/fgQ10fwrjSkgmYlJPEWKnYZ82BshlQq2mwNPefnJ4hTyrZTq+HptA9Dbw7wZvH
	SrYbm2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6y3-00000009Tit-48tb;
	Mon, 16 Dec 2024 09:00:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sk-00000009Sk5-3XsF
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 08:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=oPHS+vG8QIPL7cOVz1Q//RMyZMwZXBy2d7Sjyi0gdrg=; b=Bz6Jrp17vuU5HSLxqIWBhAHh3A
	bLZ7Pz2uPRO6H+/ay5lv7rbWaOF9IlF84eL9hsqRYYoa02Rg9vhVlZWrtIAEvIGAT1L2R+58XXrmO
	SbL5WQX7znMlPz/itqN+FHEkHVUqtW5YPVSpxYR7QPBCjB5fN+8Jzl2PcFbzPU2ByQ73S868GgJXn
	0P8jBic39+mxuxg7XFsL16yHLnfxv14piAFYyRKVKxRpbQr5s26DnXLfqxm50oTHZ9XKa/vn9PNmd
	UTyraNmhSipR2g61K6GtVbSjVfRFlsTqeQA2tFtnJ4/U94YVPuJtUpP7Bsq6feMesje3KCmd5Ko5b
	3sNNuJfA==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6sf-00000004o9J-0pNF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 08:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=oPHS+vG8QIPL7cOVz1Q//RMyZMwZXBy2d7Sjyi0gdrg=; b=YfRN386tBJPkmbobGcUmDGhHQ2
	pyZptxVKu0KtEqAdvfH9YH8Y3az9IGHviqpye1N+tpVejHRbtDF0PMVZ8LbznzUXBHChrGJQMbOj0
	P+ZfZUoV8I39EmC9h6nCDHwSg7An3k6557xml9qeZcTHSB9kbWAk/BDi1Lo3x5XYd+zPfrvPbjUkq
	ujgwy8Q/xYK0dXLQXsFzfTQGkO0FNEd7OIwrROHpjjiZy9aUfexpRKC/v+MAoF44Tqyy6ncOlc0Gj
	XSYNoJC8X8UBU+8pjTZks6XxoUXyC7I630rzipxaeUTabSfNYr+sIdJaYgmV/mUJd/4kebJQwkEHv
	rTmB+RGg==;
Received: from [89.212.21.243] (port=57844 helo=and-HP-Z4..)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tN6sW-0053uC-2v;
	Mon, 16 Dec 2024 09:55:00 +0100
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
Subject: [PATCH v7 0/3] SN65DSI83/4 lvds_vod_swing properties
Date: Mon, 16 Dec 2024 09:54:07 +0100
Message-Id: <20241216085410.1968634-1-andrej.picej@norik.com>
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
X-CRM114-CacheID: sfid-20241216_085510_767502_D1490AC5 
X-CRM114-Status: UNSURE (   6.07  )
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
v5 is at: https://lore.kernel.org/all/20241210091901.83028-1-andrej.picej@norik.com/
v6 is at: https://lore.kernel.org/all/20241212121712.214639-1-andrej.picej@norik.com/

[1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf?ts=1732738773429&ref_url=https%253A%252F%252Fwww.mouser.co.uk%252F

Best regards,
Andrej

Andrej Picej (3):
  dt-bindings: drm/bridge: ti-sn65dsi83: Add properties for
    ti,lvds-vod-swing
  drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing optional properties
  arm64: dts: imx8mm-phyboard-polis-peb-av-10: Set lvds-vod-swing

 .../bindings/display/bridge/ti,sn65dsi83.yaml |  34 +++-
 .../imx8mm-phyboard-polis-peb-av-10.dtso      |   2 +
 drivers/gpu/drm/bridge/ti-sn65dsi83.c         | 145 +++++++++++++++++-
 3 files changed, 176 insertions(+), 5 deletions(-)

-- 
2.34.1


