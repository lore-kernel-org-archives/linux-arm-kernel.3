Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC26ACAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 05:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iu+BN9J7+HV2bxA+IZtbZWgO9p/Q4KEFO0uDGLjX7+M=; b=a5hq5rJl3ROzZ1mQV6RjVQadAI
	sRLdjuq9GUyHM4Vmf8ktGbQbBAMRmNvAXqf6K20xoElN9ZGcSX7kR9estjv8U01CJ14p2c7VR3gv2
	HKESPM1EDqXt87G2VrY5sHyLoTOO99SIqqGJoKi3o51WYe+afJEVZ/DfICQQAI/hn03x/npvUabum
	3aKtxMh2xVqrlOI6JK/y+MdCCe01SP3jE6ZTdk3Uw6Mv57qKqKOcsiGcHP2euOVb7lpEqt4YbedR8
	jikHuGAAkFXy0jkQKKUf37WabJFoi4RCSibU/9Rnjo4qVuiiXVqh6OyPqMKOpdJqJ6KqM0PQ2KWGq
	4sU2dpgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzU9S-00000001u8r-2W0l;
	Fri, 19 Sep 2025 05:59:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzU9J-00000001u2u-2a1q;
	Fri, 19 Sep 2025 05:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DBBBE44D2C;
	Fri, 19 Sep 2025 05:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFA3AC4CEFC;
	Fri, 19 Sep 2025 05:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758261550;
	bh=vxKxe6c/ehRwg4Y0ba6xYL+uSGYy+9cgQxN0cPnDXHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TqCCsuFtMp9lQjdZUunivKKbFPlxcgzDyostmwz+hkEVnx4ELwic6L9D7KlgGcVPz
	 oilXZnHJ2ehuVRZcQl+xS+mzVvK/YVzZ/qB/pNArcwot88F8ZerxaFx+pXiD7z9kkU
	 t/fTKpE7XB6F7FWt9Z7VLaddA/+tTsB36ZWjJcSmmk531NSfnoK67AY2Hx4BabvB+I
	 KlT2SlZopfQ71ypEkS47zc5hKrBkXyqcfGMLaiyEc8WCzV08TH2Q3wqnIGBib40zh+
	 KsmrmrdteLJEiNUhO5sV7nij3erbVRd2bUjmVxYgEIJ30XuTYbnZzWY0okMT2dAKos
	 RKamPQ88mCn5A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3001CAC592;
	Fri, 19 Sep 2025 05:59:10 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 19 Sep 2025 13:59:01 +0800
Subject: [PATCH v6 3/3] clk: amlogic: remove potentially unsafe flags from
 S4 video clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add_video_clk-v6-3-fe223161fb3f@amlogic.com>
References: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
In-Reply-To: <20250919-add_video_clk-v6-0-fe223161fb3f@amlogic.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758261548; l=1493;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=pOpocCKNpaziWiHhDcJu1vTMZ5jdWqLvQRMLrgn1IXk=;
 b=r14O5cCFsk9df7Bw/kETEQkh7o9IKmZ5Q7JHBFdXPEM/dxZevMJ3AfIfwazFWlcs/xX0Ssh/0
 S6wSIFg/QLZBFbHr4/RDzoZr2PLcvw8lScuSWpG6CdNg7pj084sfRQX
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_225913_710692_A6056E77 
X-CRM114-Status: UNSURE (   9.91  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

The video clocks enci, encp, vdac and hdmitx share the same clock
source. Adding CLK_SET_RATE_PARENT to the mux may unintentionally change
the shared parent clock, which could affect other video clocks.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/s4-peripherals.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index aa500ea8ef9c..ba41fcd90588 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1107,7 +1107,6 @@ static struct clk_regmap s4_cts_enci_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_cts_parents,
 		.num_parents = ARRAY_SIZE(s4_cts_parents),
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1123,7 +1122,6 @@ static struct clk_regmap s4_cts_encp_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_cts_parents,
 		.num_parents = ARRAY_SIZE(s4_cts_parents),
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1154,7 +1152,6 @@ static struct clk_regmap s4_cts_vdac_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_cts_parents,
 		.num_parents = ARRAY_SIZE(s4_cts_parents),
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
@@ -1185,7 +1182,6 @@ static struct clk_regmap s4_hdmi_tx_sel = {
 		.ops = &clk_regmap_mux_ops,
 		.parent_hws = s4_hdmi_tx_parents,
 		.num_parents = ARRAY_SIZE(s4_hdmi_tx_parents),
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 

-- 
2.42.0



