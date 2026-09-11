Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C516C88E54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2p+CWD3SlvHFhm5upLG6ZgOd8bEtDZeUbNDOVEcky0=; b=F4WzzsQExKJ+XaNaCJq1Z3FvjM
	e7JdhWNXHlpsIbMBpX81118ITTop1LzgA6k8DD2yDC1Vp/nwraUmjo/VnUOsfPJCI0tmjxnqlVX9k
	or104A6enqkWT5TbH2IgrtHX6bjql5fyXLxmezxG/aXsmkKEVrplBe05UfgOGjOCYr9ctnBfvzsZK
	MHLEcLYt8DN0wfP6xRXG0HoNGFEqADXVrrUDIMwymgFgXCkS0OdSbsx7YkzM0R4QcEF+W++EBFCY5
	YDk1IP84VlvEBdW7LE3X0ogn1714oTUR5YVar8tNv3fWLIkZa0htqaZMEHPNDxylDGxd1Wb9F1igW
	cgSV9jNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcx-0000000G7jO-1HCj;
	Fri, 11 Sep 2026 08:28:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4wcv-0000000G7gi-1KDF;
	Fri, 11 Sep 2026 08:28:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1714143C77;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0FECC2BCFB;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=DiPGG6/1y2xmrETzC91peDuTfVXoxRXsfQ56MzCZN9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eofex1EYc4oqSgx/4d58E0WLp/L067GHsx9erfSBOfnH1liGDTxjEdex2pgV5BbAJ
	 aVia89N4jfwihLXA4kKWdxYcnUY3mBbIWAJxlu0QYImFiSap6Zbm4VUpRYhdUY5yV0
	 uksOYtT4KKGOHU4C6KN1gF71RpQ5umL1uDFOn/Y9nLnNA1ZKei600idSSfFv1azyTb
	 odeHrZ5T5C8FBkJOQIF1IcZ/vJppmRnqi8xiJuTMbA0JfMM8ghDllpzosQVLCgQ4RX
	 R3xYvQ1UpyL9XuEwwsHHPZlDKyMvakuyYcmvl2zZnquHhHMK19fg45kjJVWSfNqpy8
	 7s/zeBozfP+Sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2DE8C88E4C;
	Fri, 11 Sep 2026 08:28:51 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:29 +0800
Subject: [PATCH 02/10] soc: amlogic: clk-measure: Support more measurement
 channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-2-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=1344;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=e2ydz5bLAgoXoKx1id6ARA1Qq/OeV3kWw0wR36wz9Ks=;
 b=Ni8daolTgIdg3jAm0A8kb0WCYbrmYnKh/C3NyycRuAnk8bFEMRQ6GS22kUNk1VOvJlgWA3y18
 cdffAlfZX26DHdr5MIXWfOtqEv7rTZiJaU19Ci0uE2qA1MwYsQf5+7n
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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

On S4 and C3, as well as later SoCs, the clk-measure IP expands the
number of supported measurement channels from 128 to 256. Accordingly,
the MSR_CLK_SRC field in the register is extended from 7 bits to 8 bits.

To support both the old and new implementations, the driver now
uniformly defines the valid MSR_CLK_SRC field as bits[27:20].

For SoCs where MSR_CLK_SRC is only 7 bits wide, the driver never sets
bit27, and on those SoCs bit27 is read-only. Therefore, using
bits[27:20] as the unified field definition does not introduce any
behavioral change or compatibility issue for existing SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/soc/amlogic/meson-clk-measure.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 8a1a9fed0e74..0d4ba2555d17 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -20,7 +20,7 @@ static DEFINE_MUTEX(measure_lock);
 #define MSR_CONT		BIT(17) /* continuous measurement */
 #define MSR_INTR		BIT(18) /* interrupts */
 #define MSR_RUN			BIT(19)
-#define MSR_CLK_SRC		GENMASK(26, 20)
+#define MSR_CLK_SRC		GENMASK(27, 20)
 #define MSR_BUSY		BIT(31)
 
 #define MSR_VAL_MASK		GENMASK(15, 0)

-- 
2.42.0



