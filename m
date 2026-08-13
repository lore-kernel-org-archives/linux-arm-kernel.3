Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7CFC5DF6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KoDh+HPsdT+k79QCzkVLOnidRdFVkjvujhwbOs4vyAI=; b=TbLjWHrVNGHjiZmZUo0rchmtnE
	s6VQmmBlYJRSa3REi4TVA3KacFvKKRdjeQri6UubrXAy1BGcIgAfkaE1LEcWGCwuGYFvwj4TVf+4O
	TMgnG0EFKi2i82Q2NJcCzMS7e8TTo2/T4HdoFhnJppxVDMzscIPJnUhRZYg+CRr4y4/kV6fuUJovA
	66d2gDK0WHg0Ct4ww/kVM972++SgI1cIHQkQoR2aPOU+ic/rrm4LF5rGMJ0fE8fv3NrrSAkjKMZ6s
	SI6OiwejC/sASqPEh9N+etAo7qi/5wQMPRaEKbteThMEqnUfLsYMgj9fB5DTiBl6fGbOiGGeNugNy
	EyzxLRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPe-00000001Xu2-0Buf;
	Thu, 13 Aug 2026 20:52:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucP9-00000001XDh-2DCA;
	Thu, 13 Aug 2026 20:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654310;
	bh=F5HBTNrUTZP99GdpFwb2DnCb/PErZaXCXmFP4cHspV8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=km31wucKwNzGWmXbd4rLhdZOO/tYFvQiclee77qWAlTk6UlATX9acYpz/0PGm3L7l
	 UnE8xn6l8IsYh5ZA/HBctPr5Rq9BaSABFIxExuZvY1QCKfD+5GOaNdOKUL2fhO7y0o
	 8Mts/EkBjhY/rzgcJOEPqCgqXjniYlS+kAwjgtrpKJaSSFh/BNAmJUkFB2zWv0XtTe
	 d376C//7xlaXY/JeGKYevxZTnNAYLZbvC5JfIh9rmg2KLvc6E/py7Ab3KYBHo+NnSS
	 XvN2/2u61GPtML2OLj7B2FKem2aZKzLEdF+YMnRBYohhrRglsy+s1371+hOipGtS4P
	 mBPgTiYXVZ3Zw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C4A117E12AE;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id A9D6B480052; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:51:57 +0200
Subject: [PATCH v14 14/38] phy: rockchip: usbdp: Use FIELD_PREP_WM16_CONST
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-14-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=F5HBTNrUTZP99GdpFwb2DnCb/PErZaXCXmFP4cHspV8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmQN09nLHbgrdeTMQF4daw6ph71ZGKvvv
 4JCKUpL2YdD8YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5kAAoJENju1/PI
 O/qazvEQAKiRurpxY+fQU6pK4O/XrbXbdZNWSdWL1Xy8qH11SSgVdx2BqnkMvKcIJZtOtNYMY6x
 JhX/jeRDZGFzMm3k1V8z/FgWyANsoXJPek0kzCL72kF1KUdBXd2VA1P0zRuq4ig6skwE1jWUjEv
 l/8tj7A62/SUtL5ctfbLhWKn4bOLE4OMABxcRQEFg/hdpj/aVRPAOCPUvbYqaRQx9ybYXBsDDYH
 FrRDke8x+LqNJjjy/hIrp7mtbDDHWkLnnZNf6cSn26g75scjNNpqY5YUqtkaQ/xrXetO+g59zBL
 AaASTGuMHipeUYDm7WYPBHTaPtJue1Nz8/1Z7DCjGYtr2Q/QNZyaMuZehU3dW3YuxdRU6uV8ZXs
 sDidZwJLga9vilIf6rd6BKsLRThlbl6y6nObQ9D/bDDgqmgeEz2wjQyGnzaCgTw5HfLf0Qq++LF
 rMpvZHtdKHoqH9p7LNLPuzls5x6qA8SPwWFc9a2EyBI13OvuSGOCWSnX7fHbx2RFIB1jpQmzSBZ
 gQGD3+umH18uDoUaa6Q/hbj0BEq14SqYzYCKn68Ykk6VejcLHe2p1nrjfrd5FmV/NofovBHSC8C
 Q4uYQ3wIvCIfe0F3+oszQxIUkh/O1qGdv4+NVUvftUzB/fpWMNFAzovQL2lR6moQsxzCJTt4yv0
 PRU/JlxRXfHIer5dWwg4toQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135159_732711_1C171B91 
X-CRM114-Status: GOOD (  11.54  )
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

Cleanup code by replacing open-coded version of FIELD_PREP_WM16_CONST
with the existing helper macro.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7fb864a1486c..05593e98c16d 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -12,6 +12,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/gpio.h>
+#include <linux/hw_bitfield.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
@@ -75,7 +76,6 @@
 #define TRSV_LN2_MON_RX_CDR_DONE_OFFSET		0x1b84	/* trsv_reg06E1 */
 #define TRSV_LN2_MON_RX_CDR_LOCK_DONE		BIT(0)
 
-#define BIT_WRITEABLE_SHIFT			16
 #define PHY_AUX_DP_DATA_POL_NORMAL		0
 #define PHY_AUX_DP_DATA_POL_INVERT		1
 #define PHY_LANE_MUX_USB			0
@@ -104,8 +104,8 @@ struct rk_udphy_grf_reg {
 #define _RK_UDPHY_GEN_GRF_REG(offset, mask, disable, enable) \
 {\
 	offset, \
-	FIELD_PREP_CONST(mask, disable) | (mask << BIT_WRITEABLE_SHIFT), \
-	FIELD_PREP_CONST(mask, enable) | (mask << BIT_WRITEABLE_SHIFT), \
+	FIELD_PREP_WM16_CONST(mask, disable), \
+	FIELD_PREP_WM16_CONST(mask, enable), \
 }
 
 #define RK_UDPHY_GEN_GRF_REG(offset, bitend, bitstart, disable, enable) \

-- 
2.53.0


