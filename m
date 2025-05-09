Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ACEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4eqYriLPrxADs+Y2ccQgAUIrrfl91NvIA4OGzSSi90=; b=RQadDXkaOGVksQvAwlXpqyJrgj
	mb4r6vEmSuA817cUnQnj46tDF+rZ6DrD18DigixA1qwPMXT1cqDJ/xqPiqyeG9NbDdxRtgOv37tM4
	nm9hirYn4AbD5F3CbeiP+JW31DhycIVxxqocvU7FvXClavzs9ydFbLczmSDA8ZEV/u48SO0j/iIQr
	1Z69I2ZmWNQtm3aVJDfHs2JXFYusoDdLaa+WeTHqFwqInIrAFDJVSM9jLtQMYKge3sgFaejv6OQs8
	betEMAW0gDKcqfQXtOAIRENPmcgHBFv4cMcrtMoHk39CqYo1YBnXZTx3eb4th0/ooLWzSV90Rs3Hm
	Y1FaTFag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJGg-00000002wqT-2Mce;
	Fri, 09 May 2025 08:39:42 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIUZ-00000002ohw-3WyD;
	Fri, 09 May 2025 07:50:00 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Fri, 9 May 2025
 15:49:56 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 5/6] clk: meson: add MESON_PCLK_V2 for sys gate clock
Date: Fri, 9 May 2025 07:48:23 +0000
Message-ID: <20250509074825.1933254-6-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250509074825.1933254-1-jian.hu@amlogic.com>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.11.121]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_004959_875544_E253DEBA 
X-CRM114-Status: GOOD (  10.12  )
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

A new MESON_PCLK_V2 macro is introduced for the sys gate clock. Its parent
is an SCMI clock. It belongs to another clock controller, and the parent
configuration is different from  that of MESON_PCLK. This avoids new macro
definition in the peripheral clock driver.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 drivers/clk/meson/clk-regmap.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
index e365312da54e..61b8fc2d875f 100644
--- a/drivers/clk/meson/clk-regmap.h
+++ b/drivers/clk/meson/clk-regmap.h
@@ -134,4 +134,28 @@ struct clk_regmap _name = {						\
 
 #define MESON_PCLK_RO(_name, _reg, _bit, _pname)	\
 	__MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
+
+#define __MESON_PCLK_V2(_name, _reg, _bit, _ops, _pname)		\
+struct clk_regmap _name = {						\
+	.data = &(struct clk_regmap_gate_data){				\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = _ops,						\
+		.parent_data = &(const struct clk_parent_data) {	\
+			.fw_name = #_pname,				\
+		},							\
+		.num_parents = 1,					\
+		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
+	},								\
+}
+
+#define MESON_PCLK_V2(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
+
+#define MESON_PCLK_RO_V2(_name, _reg, _bit, _pname)	\
+	__MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
+
 #endif /* __CLK_REGMAP_H */
-- 
2.47.1


