Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE993F51416
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBG+429E3vcUma5kemlOwyHZ1j6F1Ope9rNt6A3O/Rg=; b=a8a42j+SS3+c5MBgYRrUcvfhxl
	lqRkIE+pdqP56F+3lCuE51YDKdm1norg8a6Jhaz9cCQVHZbk802Fqofp4I+KL09Nj2NCGWuqtwDUI
	HREdxQTSaNAlN75Cq6yl3hL80P/PHNshAEl8sePh61ix9I03Kk4eysYOZxFoYi2gfAFPxHz74MTaB
	oFiFd1um1XUf7tLAD4NScyMJuNl7HGRmvGNEAhww5kapR5Dzk2yRhAhOKlh/XS/SU2cJZKn+kTHij
	srDMG4a46ePVrFVck7JAC6zorWBHXgBExe5/u1UwrmEECBAgJd/iQDvhDAqo/Nk7ZP6/kOReAtwOZ
	TqgGjbQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVsM-00000003rxA-1ayN;
	Fri, 06 Mar 2026 14:09:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVsG-00000003rrV-1VOS;
	Fri, 06 Mar 2026 14:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E123444E8;
	Fri,  6 Mar 2026 14:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03194C2BCAF;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772806191;
	bh=tG2smnBCklE3FOUfpQJ/IMAKQJuAT2Ta4UzZBTyOfNk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c0gS4DGaswuLjSlwg/QidikJxhbNtANNJYPn8y4yxovJPZVP29F4lTW29tLXcASPe
	 HnopBUfaqif76yUFT6OvgVYrpz9X0QyMbZiQuc+3FJ4THUKKNkKIw334+HIq6fNVpx
	 TIkEfnKja+XhI7SiKbT0j8ZoqK1DM9Tcho7loARUGjQo2Ayom05z8rjRySRkCojaak
	 7x1SR2GXdnui3MKL0x/7fNeFPDkM3cLTaupLiXIIY8Sk1eB5M43iU9VYZrYVDsGGGy
	 jq3IF3hxeALRRsXLBBTLa9Ps1MV9W+D1Vqk5J1Hk4TLoZkVlVoCQoPc0uet8vLKuOw
	 XgURfYu2PjZug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8576F0183A;
	Fri,  6 Mar 2026 14:09:50 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 06 Mar 2026 15:09:49 +0100
Subject: [PATCH 2/4] media: synopsys: csi2rx: add support for rk3588
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rk3588-csi2rx-v1-2-0cd8d2bf28c0@collabora.com>
References: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
In-Reply-To: <20260305-rk3588-csi2rx-v1-0-0cd8d2bf28c0@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772806189; l=783;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=tRMPz5B8516LiO+2W1dom5lnoXdr+CUnoFVXU/MBd8w=;
 b=XPKFRpNbfZ4vmwf2A0jxs6sl9zUddsR5xnMxxcUCSdSSfpJ0RFqyECdk4FHCUlcHhN6+5dwlv
 07dYfxD3aggAIHLbuxX/d4ksvjqJmbdq+Q9GH8aIuco8fIxMEw+KfGY
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060952_444738_0B0444DC 
X-CRM114-Status: GOOD (  10.11  )
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

Add support for the RK3588 variant of the Synopsys MIPI CSI-2
Receiver.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 170346ae1a59..45ec815b0fba 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -609,6 +609,9 @@ static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
 	},
+	{
+		.compatible = "rockchip,rk3588-mipi-csi2",
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, dw_mipi_csi2rx_of_match);

-- 
2.39.5



