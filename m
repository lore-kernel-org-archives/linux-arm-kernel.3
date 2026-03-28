Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DD610F3DE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AoEYqOyCwLKuC0V9Q3PeCvNLzvN5dlLpjvo9mjcs6I=; b=DyXSUPbsf4C7TrwSZ4IeLOR+Ov
	YsAxOUX3nIr451eaF6LVWjGcLyAxDJP7iXDN3PerttVgIFPnd7/u3PFQOGIFs6RQZxUvYhjxTxeCp
	F6Mv5C8RGRslC3MYMAAdXFzi53ZkVRDNbG5hhLwRpUuq7yPToh0iOlZWvV6+XgZATENv125EV7iLk
	4ODCy1mzLsmW7mQ/jNMW1zdgQ8alGd+J17QxefH6uKt4Dsvodq6XbvZ7ug/BXYXHpNg3TXeR0tdVu
	M3dOX278Z1o2KUVIWCXW4KxndHHGVMetPjOVPydjZaFoFUHccWWhgcYbgjDLJ6L7FYWii3NlnJwxk
	gseoFjeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6U85-00000008zfu-1otn;
	Sat, 28 Mar 2026 13:55:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6U83-00000008zeY-0NL9;
	Sat, 28 Mar 2026 13:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774706103;
	bh=Oi0gOGx8Pbzn8cxnk+KDcQyKry6zs4biJs1RjCjCeuk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fn7azBtRcEOYwiB0nutp/7LpIJDr0JqrM8q2r3j5Im8qnbsr6BT1vWgA1mY3ikyP3
	 vFpmgVhJ3k0G091xxWBErvDCVI1olapDgF2dXlLSLxaJAp6MIDaaLYALojWuSJ3RlS
	 BmO4C0ct7CWsotykEhr1f0Nkoy/W6COsOx4o5uwYkqcpmstznrUxlONC0KRoGWHfOw
	 LCwXXioKwH6idA0BM/axBLINxqdm3jS62P3Yzo6cGyVUQ+GczpXP8j4ZVNM5HwoJnJ
	 TQW2cE3RGOw3zcOCsrq4pDtAX+ivUCJ5RovjtUO1SaI0mZ3vuQxrwl9esD0TBDL5cc
	 W0ylA6oB4pGbg==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 494AA17E5F39;
	Sat, 28 Mar 2026 14:55:03 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 28 Mar 2026 15:54:54 +0200
Subject: [PATCH 1/2] phy: hdmi: Add optional FRL TxFFE config options
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260328-hdptx-ffe-v1-1-53ebd5dea20a@collabora.com>
References: <20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com>
In-Reply-To: <20260328-hdptx-ffe-v1-0-53ebd5dea20a@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_065507_278236_63E27E42 
X-CRM114-Status: GOOD (  11.70  )
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

During HDMI 2.1 FRL link training, the source and sink can negotiate a
Transmitter Feed Forward Equalizer (TxFFE) level to compensate for
signal quality degradation.  Starting from zero, the source may
increment the TxFFE level up to a maximum agreed during the LTS3 stage
if the sink keeps reporting FLT failures.

It's worth noting TxFFE adjustment is optional and only attempted when
both the source and the connected sink support it.

Since the existing HDMI PHY configuration API covers the FRL rate/lane
selection only, provide the following fields to the frl sub-struct of
phy_configure_opts_hdmi:

* ffe_level: the TxFFE level to apply, only meaningful when
  set_ffe_level is set.

* set_ffe_level: a 1-bit flag that changes the semantics of the
  phy_configure() call, i.e. when set, the PHY driver must apply the new
  ffe_level and ignore the other frl related fields.

The flag-based approach reflects an important invariant in the link
training process: whenever the FRL rate or lane count changes, the TxFFE
level must be reset to zero.  A separate phy_configure() call with
set_ffe_level can only follow after the rate has been established,
making the two operations deliberately distinct.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 include/linux/phy/phy-hdmi.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
index d4cf4430ee8f..1d4b62475079 100644
--- a/include/linux/phy/phy-hdmi.h
+++ b/include/linux/phy/phy-hdmi.h
@@ -19,6 +19,10 @@ enum phy_hdmi_mode {
  * @tmds_char_rate: HDMI TMDS Character Rate in Hertz.
  * @frl.rate_per_lane: HDMI FRL Rate per Lane in Gbps.
  * @frl.lanes: HDMI FRL lanes count.
+ * @frl.ffe_level: Transmitter Feed Forward Equalizer Level.
+ *	Optional, only meaningful when set_ffe_level flag is on.
+ * @frl.set_ffe_level: Flag indicating whether or not to reconfigure ffe_level.
+ *	All the other struct fields must be ignored when this is used.
  *
  * This structure is used to represent the configuration state of a HDMI phy.
  */
@@ -29,6 +33,8 @@ struct phy_configure_opts_hdmi {
 		struct {
 			u8 rate_per_lane;
 			u8 lanes;
+			u8 ffe_level;
+			u8 set_ffe_level : 1;
 		} frl;
 	};
 };

-- 
2.52.0


