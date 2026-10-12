Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EDBCA9ED5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 06:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b4Qvrcwgu9I6f+1f4CHY/F3cNNpArFkZBjt+WcNGphI=; b=Ln9rxHsuVb4kNS
	I7OC0SVIFRO7ZaDVrGWSlrjAnEQH+LBHq+X9Jr051jHlvJ1FHGoCZ0dNKbFqLsCIx17TsIh1BJ0w8
	jwTr1wY84K6BfrMBfC/1tpjz8rwdRYaNlETMIr8L3kHVx5FBLNkPaCP/hh1w4CRkgUWxuutsqR6ae
	3vRMnLpW1NlN8mvbjjOFVzUoolI5WNpcdwNCGLXkjm6KifDveufCGlDsrK2sFKwToH1O9Kr9s/fz3
	Vs5zjM8DGQhmVlkSa9ODxq5HMu35TFIzxeXlweCBo6pS5IuwZzSlyA681yZWc5a3Cq0FHyvI18Qa8
	0Bmjr9oG9nywxkdnYsNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZI-00000009jr3-0Ijo;
	Mon, 12 Oct 2026 06:31:28 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9ZD-00000009jn5-2Mgk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 06:31:26 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 0CB02200073;
	Mon, 12 Oct 2026 08:31:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b4Qvrcwgu9I6f+1f4CHY/F3cNNpArFkZBjt+WcNGphI=;
	b=O10tlFPTf+hrOW2UHCdoV8hV99JAzcxybcmSLrG8vbv9LcQh5PGBZZY24oEviD3qVWFhaK
	nDblnZdpli4OfMiCoKLqb7vcrSXux11zm6+QWGONXFs/+ywDVFRlAsPIscuvFsRUjVgUSV
	DeC27JrTlLlNVNFNgtZhAJ8wjGnkBvI0p8rRxUo3RyLIDas9XftFXtV68+9ZRyidhYYz/G
	u4/e7BEZ7la3QIoUHDD9vRvZSZyRxpIFlyWCIPnb5reG89qiOIu4YRLGWDC/IkmVtzl4X0
	h65JnlF2dyefbL6jtc5SCLy8rTuDh4TDob0J8KCinFJ5/IvfrR2JkB1d2qFAfA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1791786679; a=rsa-sha256;
	cv=none;
	b=VIPoaprsfdu3fAhw3VBh5+Y+Xm1bJ/2RKzNWw+sKrsJl3ph3lJJeOJ1rrm0oUedAKoBWjn
	PMjzebHjmAJXPWn324Z7XurLFfRm0zfF7M9c22Cb0HtrHe6+YxzvUHnMctkx7a/IdEBIf3
	rSuj1ervuY19P5/ymHVA14kfYu34nNg2jAkKI6oPXjR/2hAHJvcXQw4uHV+dQ7OkFBv45M
	6J5GqDIWxTv/1Xjbi7ASiiC2wlXxdDIOri/WBgqF5mTr8x8+UiqLXbORoVwTFvYtbRz2Un
	wxqZdRVEBWG8G6v4QsyMyIPfA4LyiKDA/Z4yVNeOCGrpaJvox9+/CFoxkZ+lCw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1791786679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b4Qvrcwgu9I6f+1f4CHY/F3cNNpArFkZBjt+WcNGphI=;
	b=NTpd09FIsikTzkvs174+SHq5dfFQW9XWeU7qRaLNNhsIVN4PdG8xkvzFUPS8CwxBSlyhuN
	SU4U+B18+cPCqA0ga4//B58S39lPygRYwdJNe4q/0CoiKVmSd25YhsR9ukeb7J4ToOT/I0
	kWaOZgoW/UL+YQZ0Ib4SHC4Bskkgb+V0VQei60Ulkq6dvsV38s82uVJtUAaBGbyNC9jEA5
	LY5fmvWMTbdlBAwe0WmBUDU5jq4uj07bDQ/F3NlDG6MTczlZ6ZWZtmE0uBjxdTtsfHW1Q5
	yVw8oDyog9eBsz1+mjuTecKD+043Xfaqw72fATSwb+QTpdkJpjKAXAKpcBtD2A==
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v10 0/4] arm64: dts: imx8mp-skov: add new 7" variant
Date: Mon, 12 Oct 2026 08:30:29 +0200
Message-Id: <20261012-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v10-0-0906e57486a3@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53Su2rDMBQG4FcJmqtydJcztXTp2KFb6SDLUqKU2
 MayTUrIu1d2oQlUi7IIdPj5ji7njKIbgotouzmjwc0hhq5NGwIPG2T3pt05HJpUQBSoBEYFnhU
 GPHZ9sDgcT/rY4/jVzbgZIz5MYzfZPVahTStraltzAYZVFiWuH5wPp7XXB3p7fn95RZ+/5TjVB
 2fHpc0S3Ic4dsP3eqaZrPHy7jNJQQJUiIYyyVn11Lt2N41D14bTY+PW3jO96pyqAp2moKO1qry
 lCSdZnV11BaRAZynYKO6VY17TimV1fqvLAp0vurdgtabKAs3q4kYvehmRglJ5Y4RzUHuZ1eW9u
 kxBb7RXJN1ASJ/V1b36ErRGG+BcEilNVtdXXbOSX9XrzDjJBBe0NvmJrP50AqAL9GqZd+JNBV4
 w4u0//XK5/AC8yyyr7wMAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3658;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=8afguFn9yCXQFLb7LXj2fhjSLNZL3S+XDu9Q+mLI4AI=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9aZuq2ZdceZ9aduUxbw/N3OfPNI7rSAs9bHLppHB93gV
 bETKXnSUcrCIMbFICumyKKysIJP1OODZ+Q0ES6YOaxMIEMYuDgFYCLX+xn+ZzeeNrz/yzNI88OD
 xUd/iWkY95+bGnvWzy5G48rTH/ImBxj+2U3dHNV7Sk51p8Xr848W6VSG6tlV+Rt2l/w8Ga56qyq
 SCQA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233124_126394_2917DAF7 
X-CRM114-Status: UNSURE (   8.87  )
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

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.
As the already upstream boards and this new one are almost identical,
convert the other device trees to a base devicetree and apply the touch
controllers and panels via overlays.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v10:
- rebase onto imx-dt64-7.4
- rearrange binding and code patches
- Link to v9: https://patch.msgid.link/20261008-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v9-0-11fa90f531fc@pengutronix.de

Changes in v9:
- fix dtbscheck error
- squash new compatible into 7" devicetree patch
- Link to v8: https://patch.msgid.link/20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de

Changes in v8:
- add #address-cells and #size-cells to i2c2
- fix touchscreen resolution
- add missing binding includes
- Link to v7: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de

Changes in v7:
- address more of sashikos rightful feedback
- Link to v6: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de

Changes in v6:
- address sashikos rightful feedback
- Link to v5: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de

Changes in v5:
- convert to overlays
- Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de

Changes in v4:
- fix Makefile sort order
- add touchscreen fallback compatible
- fix lvds_bridge comment
- Link to v3: https://patch.msgid.link/20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de

Changes in v3:
- rebase to v7.2-rc1
- Link to v2: https://patch.msgid.link/20260427-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v2-0-e2b79fc24391@pengutronix.de

Changes in v2:
- rebase to v7.1-rc1
- Link to v1: https://patch.msgid.link/20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Søren Andersen <san@skov.dk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

---
Steffen Trumtrar (4):
      arm64: dts: freescale: imx8mp: skov: fix sort order
      dt-bindings: arm: fsl: add compatibles for Skov i.MX8MP boards
      arm64: dts: imx8mp-skov-revc: convert to overlays
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  2 +
 arch/arm64/boot/dts/freescale/Makefile             | 10 ++-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 38 ++++++++++
 .../imx8mp-skov-revc-jutouch-jt101tm023.dtso       | 38 ++++++++++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ----------------------
 .../freescale/imx8mp-skov-revc-tian-g07017.dtso    | 40 +++++++++++
 ...h-jt101tm023.dts => imx8mp-skov-revc-touch.dts} | 26 +++----
 7 files changed, 135 insertions(+), 100 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>


