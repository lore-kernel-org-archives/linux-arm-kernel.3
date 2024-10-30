Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F90FD6B6CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 19:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7nZyeOT+wnKPsXEpGH2Hj04pEnZpEJwO4AgsBqz0YpE=; b=e23U+mWpkLTKPf/NV6ygDMdgfh
	FjGPXwgtzYE4jw5NCJ4hRVoYMGBEThDfu+/LEcvkhOnbDbJEklPUBf3IpTiKmyXAHsONNhAVlQISf
	z+WbBRktisWyvL68UZf/uFQ43P5iGWTm+aZOiBGGZHeZSJ5eQZfjajSxYx7Lyv5tsHBHg7dLghmLS
	bkjEDJ13Egd9o2eydBEvQHn5+DXeE48VjdLz6Sucli4csb1QVGIV/vtsNRsEGRO9cITVlsViZxtaN
	jZD7Fxfsh0pWAz61avLEK9CVJsPuVqXGRyUgGi3f51B5Xyv+qPU1PEA7vnWrP/5a1ctRN/uO2eXgm
	6N3NbTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6EQN-00000001Xyd-0lZN;
	Wed, 30 Oct 2024 19:32:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6EOj-00000001Xsm-0lPq;
	Wed, 30 Oct 2024 19:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 040065C4A69;
	Wed, 30 Oct 2024 19:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB77C4CECE;
	Wed, 30 Oct 2024 19:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730316626;
	bh=CoYyKlKmOSKxrPKi0zvjVFMgQHG2rxkSbzEovk3fD3k=;
	h=From:Date:Subject:To:Cc:From;
	b=j+kSn8N8k3flee47m87qzOJaPDUCR9IfqmjO9FEAy/f27KSHYnbdC7ggeRRYypUKM
	 +HBafMda4IfNG63cAttYics2sYs75QKFq8FnVod2yIeH5PnPXxvwmAavtidx+i7/IF
	 1S2LlVmUmpADapAoy1QWkNWFHLGeMjz1Xgor3FP2JtGvVgeodI8QKJHf36GBy7sjav
	 Oh7SVqWovdKCFJgMm/dxKXjg7d3X9Vg9u2V2MiqJPilnGos/BU2xM+Qr2/o7lBUxib
	 aLYdF2ls1Y6537wEnR/hl2Z3+9NVqE5dWNkzl2ISt5aBtz+OnUn6bNQKHlyJcbIthS
	 o8BNqF092VAiw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 30 Oct 2024 20:29:55 +0100
Subject: [PATCH net-next] net: dsa: mt7530: Add TBF qdisc offload support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241030-mt7530-tc-offload-v1-1-f7eeffaf3d9e@kernel.org>
X-B4-Tracking: v=1; b=H4sIADKJImcC/x2MQQqAIBAAvxJ7TlhNCfpKdAhba6EyNCIQ/97Sa
 ZjDTIFMiSnD0BRI9HDmeIrotgG/zedKihdxMGisxg7VcfdOcHsVQ9jjvCh0ZNBaqx0iSHclCvz
 +z3Gq9QM2CB49YwAAAA==
X-Change-ID: 20241030-mt7530-tc-offload-05e204441500
To: =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_123029_687726_C1D9B2C0 
X-CRM114-Status: GOOD (  15.04  )
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

Introduce port_setup_tc callback in mt7530 dsa driver in order to enable
dsa ports rate shaping via hw Token Bucket Filter (TBF) for hw switched
traffic. Enable hw TBF just for EN7581 SoC for the moment.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/dsa/mt7530.c | 54 ++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/net/dsa/mt7530.h | 12 +++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index d84ee1b419a614dda5f440e6571cff5f4f27bf21..0adf69ac8827cd66cdc44f9bc43d27ab8acb785c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -21,6 +21,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <net/dsa.h>
+#include <net/pkt_cls.h>
 
 #include "mt7530.h"
 
@@ -3146,6 +3147,58 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
 	mt7530_rmw(priv, MT753X_MFC, MT7530_CPU_EN | MT7530_CPU_PORT_MASK, val);
 }
 
+static int mt753x_tc_setup_qdisc_tbf(struct mt7530_priv *priv, int port,
+				     struct tc_tbf_qopt_offload *qopt)
+{
+	struct tc_tbf_qopt_offload_replace_params *p = &qopt->replace_params;
+	u32 rate = 0;
+
+	switch (qopt->command) {
+	case TC_TBF_REPLACE:
+		rate = div_u64(p->rate.rate_bytes_ps, 1000) << 3; /* kbps */
+		fallthrough;
+	case TC_TBF_DESTROY: {
+		u32 val, tick;
+
+		mt7530_rmw(priv, MT7530_GERLCR, EGR_BC_MASK,
+			   EGR_BC_CRC_IPG_PREAMBLE);
+
+		/* if rate is greater than 10Mbps tick is 1/32 ms,
+		 * 1ms otherwise
+		 */
+		tick = rate > 10000 ? 2 : 7;
+		val = FIELD_PREP(ERLCR_CIR_MASK, (rate >> 5)) |
+		      FIELD_PREP(ERLCR_EXP_MASK, tick) |
+		      ERLCR_TBF_MODE_MASK |
+		      FIELD_PREP(ERLCR_MANT_MASK, 0xf);
+		if (rate)
+			val |= ERLCR_EN_MASK;
+		mt7530_write(priv, MT7530_ERLCR_P(port), val);
+		break;
+	}
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+static int mt753x_setup_tc(struct dsa_switch *ds, int port,
+			   enum tc_setup_type type, void *type_data)
+{
+	struct mt7530_priv *priv = ds->priv;
+
+	if (priv->id != ID_EN7581)
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case TC_SETUP_QDISC_TBF:
+		return mt753x_tc_setup_qdisc_tbf(priv, port, type_data);
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
 static int mt7988_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
@@ -3193,6 +3246,7 @@ const struct dsa_switch_ops mt7530_switch_ops = {
 	.get_mac_eee		= mt753x_get_mac_eee,
 	.set_mac_eee		= mt753x_set_mac_eee,
 	.conduit_state_change	= mt753x_conduit_state_change,
+	.port_setup_tc		= mt753x_setup_tc,
 };
 EXPORT_SYMBOL_GPL(mt7530_switch_ops);
 
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 6ad33a9f6b1dff3a423baa668a8a2ca158f72b91..9467f2a3f2bca45b3fce3bace2b3b3205158c4bd 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -248,6 +248,18 @@ enum mt7530_vlan_egress_attr {
 #define  AGE_UNIT_MAX			0xfff
 #define  AGE_UNIT(x)			(AGE_UNIT_MASK & (x))
 
+#define MT7530_ERLCR_P(x)		(0x1040 + ((x) * 0x100))
+#define  ERLCR_CIR_MASK			GENMASK(31, 16)
+#define  ERLCR_EN_MASK			BIT(15)
+#define  ERLCR_EXP_MASK			GENMASK(11, 8)
+#define  ERLCR_TBF_MODE_MASK		BIT(7)
+#define  ERLCR_MANT_MASK		GENMASK(6, 0)
+
+#define MT7530_GERLCR			0x10e0
+#define  EGR_BC_MASK			GENMASK(7, 0)
+#define  EGR_BC_CRC			0x4	/* crc */
+#define  EGR_BC_CRC_IPG_PREAMBLE	0x18	/* crc + ipg + preamble */
+
 /* Register for port STP state control */
 #define MT7530_SSP_P(x)			(0x2000 + ((x) * 0x100))
 #define  FID_PST(fid, state)		(((state) & 0x3) << ((fid) * 2))

---
base-commit: 668d663989c77fcb2a92748645e4c394b03d5988
change-id: 20241030-mt7530-tc-offload-05e204441500

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


