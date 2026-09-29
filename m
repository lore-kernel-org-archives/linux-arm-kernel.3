Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD47C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 14:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/MvsTZBQVv82eCENlE54GLFRNRWl+Z3gRhZz1fyUG8=; b=LItVMgoD/vPV03DX3QtqSElz+z
	bKLdiLIwieNZ9A9ucf/ARAV3df1tkjJ+4Dfu/klE18KdYXGsVk5pLpomO74hxZChQiaNIiw4Rupgz
	VVU7rbsi0/ZoNIY2LkKMelZUQYbLaWbq34AqZBw70JH2ybdQIv0gpih3osc4Im1ecfQnSl+Z9eA9L
	c+iWieQP81xhxVdA2kuUvOAzNJTgm7TutGfsF6YGpn2MMwvBOH6yak+GWGu21ihTjV3CWMAzV3JX9
	+d3vImnQDUgG5HAEbPGSSLS+Ssh3Yyw9BHCSbJOQ28LM14k2E0oNLfyb/SeAEoUgyLsTBpEeBEe0E
	U4ZMCPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ6M-00000003pVD-03kh;
	Tue, 29 Sep 2026 14:46:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZ5l-00000003pGG-33ZG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 14:46:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 46AE14E410BF;
	Tue, 29 Sep 2026 14:46:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18BA4601BD;
	Tue, 29 Sep 2026 14:46:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA9DC103282F2;
	Tue, 29 Sep 2026 16:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g/MvsTZBQVv82eCENlE54GLFRNRWl+Z3gRhZz1fyUG8=;
	b=QvKie7nfVAzjaDRHyzr4WFhvS2O7e2j8VPpNC4TMQYd9gkTABiLjOSjOYs67p6QbsVSRPK
	Kf5UohPLxwALG4uhro/dO8Lo9ZYO/AMxtIStAGh1VOzRLwOzVyChQIwRqn2FZhkm99JOd+
	2jo/US6/KdWkOUfB9uLytM8+goCm67oaPq0pKxsJPXpZoor66TjaZP5TY3ajiKlP6EXV1P
	FcrcxbFjxU/RfM/eBVdOGUOuO0x4M56uf36HggWtFpkFdLAjAWMp/D3l/5dRwIv0zQR6Td
	4OfB+aKBPybYldN7X9l7hkU07S30LUcvfLlqfAyhYKLwU6BaFd3d20Gn7VF5qA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:51 +0200
Subject: [PATCH v5 8/9] clk: nuvoton: ma35d1: get HXT/LXT from DT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-8-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_074602_792758_93EB14B8 
X-CRM114-Status: GOOD (  15.17  )
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

HXT and LXT are crystal oscillator inputs of the clock controller, they
are described in the DT. Get them with devm_clk_get_optional() and point
the internal clock table at the clk_hw's found this way, instead of
registering fixed rate clocks in their place.

Old DTs reference the HXT fixed-clock without naming it and do not
describe LXT at all. In this case, fall back to the fixed rate clocks
that were used so far, to keep booting.

Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/nuvoton/clk-ma35d1.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-ma35d1.c
index ceebcbd8c18b..81a412b1706e 100644
--- a/drivers/clk/nuvoton/clk-ma35d1.c
+++ b/drivers/clk/nuvoton/clk-ma35d1.c
@@ -4,6 +4,7 @@
  * Author: Chi-Fang Li <cfli0@nuvoton.com>
  */
 
+#include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -124,6 +125,21 @@ static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
 	return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
 }
 
+static struct clk_hw *ma35d1_clk_xtal(struct device *dev, const char *name,
+				      unsigned long rate)
+{
+	struct clk *clk = devm_clk_get_optional(dev, name);
+
+	if (IS_ERR(clk))
+		return ERR_CAST(clk);
+
+	if (!clk)
+		/* Old DTs do not describe the crystal inputs. */
+		return ma35d1_clk_fixed(name, rate);
+
+	return __clk_get_hw(clk);
+}
+
 static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *name,
 				     void __iomem *reg, u8 shift, u8 width,
 				     struct clk_hw **hws,
@@ -240,10 +256,10 @@ static int ma35d1_clocks_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	hws[HXT] = ma35d1_clk_fixed("hxt", 24000000);
+	hws[HXT] = ma35d1_clk_xtal(dev, "hxt", 24000000);
 	hws[HXT_GATE] = ma35d1_clk_gate(dev, "hxt_gate", "hxt",
 					clk_base + REG_CLK_PWRCTL, 0);
-	hws[LXT] = ma35d1_clk_fixed("lxt", 32768);
+	hws[LXT] = ma35d1_clk_xtal(dev, "lxt", 32768);
 	hws[LXT_GATE] = ma35d1_clk_gate(dev, "lxt_gate", "lxt",
 					clk_base + REG_CLK_PWRCTL, 1);
 	hws[HIRC] = ma35d1_clk_fixed("hirc", 12000000);

-- 
2.55.0


