Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66765CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pKJNhHU9/ufu6hDD6ncBtRaVdBf5TTfF+q6Ja87ZwEY=; b=kOlljxG6QhrI9OHsiWTjbWoe9a
	Jtm6H9wcOQ2d4oGKgb/SNFUVXlYUhvdaXm3rNChJ2T3wvIa4Uxagdwa3XMSMLFIjfPE4e/2XtA/uX
	xY6D4o1G0VBZIpRe6p+Kf0eZOFAMHLFK4ceBJPg1r6J9epZct3FoNmFx4fQRT5MqQgfGeHtjw7hgH
	fbse/fzbcALuVxCaAe+pTHEs5+3ZDprII+UYCBSCwiL8ZQZA7jcKggAhvATf45z57qEQOuvOCflgo
	Cps6j3d5b0VGX0kS0USGIiFmrdvEqQrOtjAjMGloGJ8l7d9a0JkYXsMLeQuCQNPkh7m4q9H04GyPK
	hL+rZ/9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBiP-00000000hNc-3zfZ;
	Mon, 28 Sep 2026 13:48:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBiO-00000000hNU-3cvh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:48:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0E91600D1;
	Mon, 28 Sep 2026 13:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AD6DC2BCB3;
	Mon, 28 Sep 2026 13:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790603299;
	bh=0T3U1aXBXMuP/XUFiuZsj0r9Vk56wjPuqVb7adaAvic=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=knBf0MIzn6sk7yr3oA3wKkTe2rroEzCAJZWyp52BmFNmOa1lqkQh1tyuWDAPyosnb
	 sRLsxsO0HxAR0+xWGkBn70bhL0cU66TYegfPjv1SFz1/UZM8TSzQcFuwnP8eoIr/mb
	 wDtz3DjKFTEybFFVb3yqT5JN45FI5LJRLeeczEi2YWm8LoA5lC64odJfDplJvpEpx3
	 dtyDkxANC/jT5L40zHzZEH469oGLN34eRu9Z8Hq+SxqwFLvOvksF31Imn05xYu6SD1
	 7j7ty5IvHBUP4DYHJGgBPE4pyb3QbjTZVQO6y7gynZrd+tbZNPAYrlXjKJmVdoSttS
	 CmLhK5PB2vTKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B0ECA5FA5;
	Mon, 28 Sep 2026 13:48:19 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Mon, 28 Sep 2026 15:48:09 +0200
Subject: [PATCH] PCI: layerscape: async probe by default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-for-upstream-pci-layerscape-async-probe-v1-1-76412d887baa@free.fr>
X-B4-Tracking: v=1; b=H4sIABhwumoC/x3NTQrCQAxA4auUrA3EwZ/Wq4iLmKYa0JkhUbGU3
 t3B5bd5b4FQNw04dQu4fiys5IbtpgO5c74p2tgMidKBhtTjVBzfNV6u/MQqhg+e1UO4KnLMWbB
 6uSpSvxPW/UgDHaHVqutk3//pfFnXH+yB0fl5AAAA
To: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790603298; l=1374;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=FiRn9OiNUjwkWfk6TfzHBQosBVCt2Ztr46nw5buAh4w=;
 b=61ATACnDyWjW6rV7RTXwL9RyAdZDzlU6eY1kSxfh9+/akDvP2PLaEXFhAq3GqnDqV6ZPd/ELZ
 2Cg7PafmqWID96UsYC+Ox031k8ImTNnycQ3by9yvKvgRkTiJ4assXMc
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

dw_pcie_wait_for_link() polls for up to
  PCIE_LINK_WAIT_MAX_RETRIES x PCIE_LINK_WAIT_SLEEP_MS (10 x 90 ms)
per controller.

The controllers are probed one after the other, so, it leads to slow
boot time.

On an LX2160A board with 4 enabled controllers and no link on any
of them, ls_pcie_driver_init took almost 4s.

Probing the 4 in parallel allows to have it down to 1s.

The controllers are independent, other DWC based drivers are already
using async probing such as qcom, imx6, s32g, rcar-gen4 or stm32.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
 drivers/pci/controller/dwc/pci-layerscape.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 14d6ac4fc53f..7f37a0537159 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -419,6 +419,7 @@ static struct platform_driver ls_pcie_driver = {
 		.of_match_table = ls_pcie_of_match,
 		.suppress_bind_attrs = true,
 		.pm = &ls_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(ls_pcie_driver);

---
base-commit: 94e8d4e94266bb9737a5963810a3f9365cb2f39d
change-id: 20260928-for-upstream-pci-layerscape-async-probe-084cae5d0907

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



