Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B2ACA600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OT87uIWBaiF7LwPjhtu9+NdFm7Rda6rLBPon7Dlb4XE=; b=j5T/wlU66RYJU7FPVRwzPNxvgJ
	ZAirv6WT758QR51PFPkSy+Mjk872iVl9BA0Y5bfM2QweaZoqw/xbWoUq2l5MZO3X7n2Od2emUTDX+
	35Kh2+aAOgBo1HIZ1OkaplENYt4m25e77gGZaYKP02NvlG7OmZyyVfnhDTwTk5oXfxW0DCPXM7EbG
	ykfehuU12tRNZxwxfpJdE9XRFZHkFnAzO3SF3DdvJTkZTdeEXpkbaMphuuXITDgxl3hRfOe+ka3tP
	mXXF55X/vQ0IpjPbKTkzOsg4xEzgXibEVaENj9Wkhy2Uu8J7Y1LX1NTj+p3e1hELfkOZodl5yyv60
	t72FiX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEr1J-00000004h77-0j3s;
	Thu, 08 Oct 2026 16:31:01 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEr1G-00000004h6G-0Dcd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 16:31:00 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowACXljQ5xcdqciAOCg--.38966S2;
	Fri, 09 Oct 2026 00:30:49 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: at91: fix device node reference leak in at91sam9x5_sckc_register()
Date: Fri,  9 Oct 2026 00:30:52 +0800
Message-Id: <20261008163052.2685401-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACXljQ5xcdqciAOCg--.38966S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4Utry5Ar45WFyDCF4DJwb_yoW8uF15pF
	4UCry5AFs5Xr4UuFW2yF97XFyY9a92gFW8ur1xCwnI9rn5tFyxtrWjgFykXF15AFWrGay3
	Jw4jq3W7Zr45AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqVcEUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgAOA2rHo1NcQAAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_093058_493879_863A934A 
X-CRM114-Status: GOOD (  12.55  )
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

at91sam9x5_sckc_register() calls of_get_compatible_child() to look up the
"atmel,at91sam9x5-clk-slow-osc" and "atmel,at91sam9x5-clk-slow" legacy
child nodes during DT backward compatibility handling. Both calls return a
device node with its reference count incremented, but neither reference is
ever dropped: the first is simply overwritten when the second lookup
reassigns child, and the second is leaked on every return path, including
the unregister_slow_* cleanup labels. of_clk_add_hw_provider() takes its
own reference and does not consume the caller's.

Drop the slow-osc reference once it has been used and release the remaining
child reference on both the success and error paths.

Fixes: 45b5ec8498ff ("clk: at91: modernize sckc binding")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/clk/at91/sckc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/sckc.c b/drivers/clk/at91/sckc.c
index 776118f14867..bdf6897a98e3 100644
--- a/drivers/clk/at91/sckc.c
+++ b/drivers/clk/at91/sckc.c
@@ -398,8 +398,9 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 
 		xtal_name = of_clk_get_parent_name(child, 0);
 		bypass = of_property_read_bool(child, "atmel,osc-bypass");
+		of_node_put(child);
 
-		child =  of_get_compatible_child(np, "atmel,at91sam9x5-clk-slow");
+		child = of_get_compatible_child(np, "atmel,at91sam9x5-clk-slow");
 	} else {
 		bypass = of_property_read_bool(np, "atmel,osc-bypass");
 	}
@@ -431,6 +432,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 	if (WARN_ON(ret))
 		goto unregister_slowck;
 
+	of_node_put(child);
 	return;
 
 unregister_slowck:
@@ -439,6 +441,7 @@ static void __init at91sam9x5_sckc_register(struct device_node *np,
 	at91_clk_unregister_slow_osc(slow_osc);
 unregister_slow_rc:
 	at91_clk_unregister_slow_rc_osc(slow_rc);
+	of_node_put(child);
 }
 
 static const struct clk_slow_bits at91sam9x5_bits = {
-- 
2.25.1


