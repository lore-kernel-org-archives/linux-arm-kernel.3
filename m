Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C4DC54E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 May 2025 07:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sIsz51ve9WD6EIYt9+H904kIrnIh/0ETD/TqyTo6/IU=; b=3snaKUMDRCeDQqAVav3BfCl8Ka
	H7suOxOEAe0PN2eVbODb1iq3HDNbCGMVVv7UfaNC42O91Y1Or/aFuc8kchL6vYOThCfknLjUrEUZH
	wK377XUeUL4V6g4jfMYyf3MOCeq9oGnP2WEmGQSfDzPTi7Gr64LYbXKT0Qkp2/581pIkZQSS9zUmK
	0aSS7u3eX1zLqkqPmHQGXvWs7AyYTSlSzfWdqEDTw1/h9GJbvW1w/iQCFfUDg1kYmtbVU6ohaJDFL
	nfxSp2VgFrTA7dkWE3GgSMS1UAwqEFXv0vM/ZuHHT9AcPjyq1eNFwL9YURomnfp160fgnjBGWRlmX
	x9afU5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0gk-00000000BMe-1j8A;
	Thu, 22 May 2025 07:50:02 +0000
Received: from mail-m21471.qiye.163.com ([117.135.214.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0dE-00000000AkB-2Jrk;
	Thu, 22 May 2025 07:46:26 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1605e660e;
	Thu, 22 May 2025 15:46:17 +0800 (GMT+08:00)
From: Elaine Zhang <zhangqing@rock-chips.com>
To: zhangqing@rock-chips.com,
	mkl@pengutronix.de,
	kernel@pengutronix.de,
	mailhol.vincent@wanadoo.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	cl@rock-chips.com,
	kever.yang@rock-chips.com
Cc: linux-can@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 0/3] rockchip: add can for RK3576 Soc
Date: Thu, 22 May 2025 15:46:13 +0800
Message-Id: <20250522074616.3115348-1-zhangqing@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUseGlYaGBhKHUMYHx1KH0hWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96f6f50f7903a3kunm9938470210de792
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBg6Izo6ETE0LhIcSTgpDiov
	GDRPCSlVSlVKTE9MQ0JCQkxCSk9NVTMWGhIXVQETGhUcChIVHDsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUlKSks3Bg++
DKIM-Signature: a=rsa-sha256;
	b=ZHgASNrqMdf+4b6cLuXsZ1XZEP5++2a9VJU5ozLQi+Y5vCkl5jmy/SzODsHuLCwVANNEto4TcXitwR/kMnZaLfcRXXrL06j2FbOeiZUL4FPlmQXDP0+M4Jwv3HPitH+wsKnczxWwDnUGUScTkRzpiC/fqmZbx5KWpuVH3R5BlE0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=sIsz51ve9WD6EIYt9+H904kIrnIh/0ETD/TqyTo6/IU=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_004624_997575_4575E4CA 
X-CRM114-Status: UNSURE (   8.00  )
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

rk3576 can is a new controller:
Support CAN and CANFD protocol.
Support Dma.

There are major differences from the previous rk3568. All errata on the
rk3568 have been fixed and redesigned.

Change in V4:
[PATCH v4 1/3]: Correct the format and add explanations.
[PATCH v4 2/3]: No change.
[PATCH v4 3/3]: No change.

Change in V3:
[PATCH v3 1/3]: Add documentation for the rk3576 CAN-FD.
[PATCH v3 2/3]: Adjust the differentiated code section and add dma
function.
[PATCH v3 3/3]: Remove dma, no use dma by default.

Change in V2:
[PATCH v2 1/2]: remove rk3576_canfd.c, use the rockchip_canfd driver
[PATCH v2 2/2]: code style.

Elaine Zhang (3):
  dt-bindings: can: rockchip_canfd: add rk3576 CAN-FD controller
  net: can: rockchip: add can for RK3576 Soc
  arm64: dts: rockchip: rk3576: add can dts nodes

 .../net/can/rockchip,rk3576-canfd.yaml        |  86 +++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi      |  22 +
 .../net/can/rockchip/rockchip_canfd-core.c    | 637 ++++++++++++++++--
 drivers/net/can/rockchip/rockchip_canfd-rx.c  | 193 ++++++
 drivers/net/can/rockchip/rockchip_canfd-tx.c  |  29 +
 drivers/net/can/rockchip/rockchip_canfd.h     | 312 +++++++++
 6 files changed, 1234 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/can/rockchip,rk3576-canfd.yaml

-- 
2.34.1


