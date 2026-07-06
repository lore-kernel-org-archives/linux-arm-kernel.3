Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B42FC43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=; b=m8RoDCBqt6U1Z8shqSUhw7jmdb
	IsqQKOwpIukp8EJC7lcZk7VyfKDLkLiZekbAUVjhjRybihd7JIqBgkcaDZKwR4NpIKIlZ+OF0bLpI
	P45iMKW/TmoxwrEIV22AVTUrWchteiHnK5TLdSgdioC1fPy1uJGliFIiaGavK95OdGU12Y9wo0cl2
	O2aVLItaeMOMcYekCHi7lYIoB/2sEdes1ZLCVbF14Zlo2ZZLPm+W+jZKpyRhvpppQknVC4Y7Mqzzy
	2pkZ9YYOrA5032kZhv4A2JYy2PoFt+DZphSgAMF8sEK8ZppVOFDTisfbjh/xxqZmeO6Md74tut5DT
	aTVkFLjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgx-0000000C1v9-2ugQ;
	Mon, 06 Jul 2026 09:32:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgq-0000000C1qe-2dXs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so10801865e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330355; x=1783935155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=UY0cvVCptCt8OCzahQ4+zcoxGs/M4wwisVlATqAICtuWzAnj95je6Myt0L47S8Unkj
         oD0Z52+mGWRcRyWm/3u71J/BpW9XUI598ebUjGBW23iP7pTysftMo0QLsbg8LcdfMJEk
         FFn410jODGq+Qi7JU2o15VsvDvdyHEz6cZyuRpyG3QEpMR24k7bVwEy1Wdyy1fX+yISY
         SqaA/vmi6fWsnVJcAEQNvofeeoCt/n1qZyGpxcxS2qfIT105OFej+0+CPKHM/EGCV3aw
         +sRHc8cfuscchbW4i8FnyrOgt8FW2YeGdaM/BgDJrwcs9hyXpNqngLgL/BVUhqPBDJ1E
         0Y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330355; x=1783935155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QZ/tzJaIkMNpKGsZtD20B+8zLkYYTOKlJtJuY0qjaA=;
        b=Z3M+ga2KzJjfP+SZUQkHurZjRB/NR4ESNehZb+Iz4noFsRb6tjdFLjrAJyM7MxVDvL
         +Och4FcCweGzJ22piLcCCZeGOp9qcj3/VM8PxFtVmixkHpng4JqgV7CmN/gyg0a2a0R4
         bDlxUYH8QpkHTfVSoUAaTi/0wEjGJftPZY4ar6oa+RCFO45rzgxk8zJNyFd7oPvfB7Kb
         f6MyYDDI/VUkie/nit11RxMARxaeQTgcIEY91XALWGaL74YxRXid1NjbHptfE7sCOfq3
         QH8KDeGzhXdo94feFZF56HkEeTVf2qeIz8tT7wzeiVP1hgZmpUXvYbOgGps6GKc2xvmz
         6esA==
X-Forwarded-Encrypted: i=1; AHgh+RpdBm+nKEKamJ5C5xPY8dAbZnk8JRiUPV5aD8xfD/V8xpvAdcROuumRff+hcZWVwlRUXdQ775Q9vl6TTx9n8i4+@lists.infradead.org
X-Gm-Message-State: AOJu0YzYixfWGz3Z/DJPmYUXKM3ERSSyzLkxDsJiwoBipbadyAUFjqry
	EnLA6VlIc6QgOpjbGQzU7ZLAwvyWJ6/RXiiDhZAySs69AqLJNHRxZzsBW+JC55hf5Hc=
X-Gm-Gg: AfdE7ckOOW1oiGBZKZkuKL+35YCKcVkyqINCxwkEMDA9zrcI9rH4+0nOq26d8DCnlXQ
	HT01y6O7Mka6jbc1/+XY68KkLqvdYcz4tIUVsSKMB8hwTw8QUc572DzHj4SUuS7MMIBOaKQORbT
	7CMnzzJE9i8B/HHa58nIY/auWpCIKGfFHmGXqTzm3dItEpsG173ZWY6bbOWS9YnoVZpQOj5YQtW
	FxcouUqv2CWua7h3COv/8pKBhqCHMwmgKEa4hmP+avx/9ZZQtdgkLE2jKw2twhllX7kjGBphInX
	JDomKS6ebX0TE6RzcsoGNc+GUX66n04otLdhzXVWK7g6GUJdroJoWHSpRfs4aRPDAoSCbTQ9zvG
	ogj3C3yienONHlsus+ctQtuhTlOm15ppAj74ZAK1FOXpIDtJ9F2VL10JzSkGxLVrwmOsH6c7WAh
	Peh1AGBBZhiBY=
X-Received: by 2002:a05:600c:811a:b0:493:bc92:ba9a with SMTP id 5b1f17b1804b1-493d11d7e5bmr93766755e9.13.1783330354669;
        Mon, 06 Jul 2026 02:32:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493be4a343csm317962395e9.0.2026.07.06.02.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jul 2026 11:32:12 +0200
Subject: [PATCH v4 4/9] clk: sunxi-ng: sun6i-rtc: clean up DT usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-a733-rtc-v4-4-f330728db3d3@baylibre.com>
References: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
In-Reply-To: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2679; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0uBL/FtS3qxYddEpWPm85zwv8RTdX1Kl9yqgj170ams=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3YjAlK/wAezwRG/Br2o9jTucmyJPFDAgWQJK
 NGnH+1LXpCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2IwAKCRDm/A8cN/La
 heKGEACVs19xz8UT8PIIUFWAjitE9+NBDWhZaJDxvNcUM0SxaCYy96bafmU0d+a2rqtLufr//KC
 Z6WuhTQ7tHSglmlAJYJGPYFWh6rGPUtCTUvd6+nEaLUUGiCfk0VnOtJDTlgka/thanIyvG7C8Ib
 CnWqoMTk4qimPYytuWrTsIffWAuOUIrOsz3DfO3rvDqFU+n+PfI9lXD3+kAY4OLnh2iVuDKk3g+
 wOoaaCddMgxevDmh28+DckALZ5DPj8b4mmDtYdJBfeq+8wB8rH0oTYXMh2YvS6Il5dFLoEkTesb
 X4HEJd8dKaMDVGMIi6Sn+USIZuuIWRpydFCalXQxQhSz8AmNYW/nCF+Kv2J6olyH/yehTqdaqFZ
 RBfacTRrrZVF4K8KO7E1a2eCcFAlV/AXQqFKWqIw1Kljn6x0vMJm64IKq37s0/pMu/tFHpL1Mul
 /hdDazToGy9fdBo48oMitjchP2j3noiOnFZqGn2ZZuqc89RBwRcaiOaEiqxUfDo/74XQe7Z7xls
 cR1ohmd0I1POV7Gp+SKuS8PGZcKzfAISw3A1AnGb7pkYQCf8PsrpXM9ofPeLziH85FqvKJo++9c
 TDK8n6R4fNRVe3j3kH5AZRPFsgn4ijCQKyayBO9Ak2WcrTkCbVATnAi74NLyP+BzTG5fVygyNJe
 Ke9epCWPHbybvhA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023236_700760_D38B156F 
X-CRM114-Status: GOOD (  18.96  )
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

With sun6i-rtc compatible devices, the "ext-osc32k" clock input
is optional for the devices that support this input (r329 and onward).

Probably preparing for older SoC support, the driver does something funny
when parsing DT. It check if "ext-osc32k" is present in the clock-names and
if it is not, it uses the first clock as "ext-osc32k". This clock will
actually be the rtc bus clock so what the driver does is wrong.

At the moment, the driver does not support the older SoCs that would have
an external 32k clock provided on index #0 so just remove this quirk.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index f6bfeba009e8..0f528bfaed00 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -191,10 +191,8 @@ static struct ccu_common iosc_32k_clk = {
 					 CLK_GET_RATE_NOCACHE),
 };
 
-static const struct clk_hw *ext_osc32k[] = { NULL }; /* updated during probe */
-
-static SUNXI_CCU_GATE_HWS(ext_osc32k_gate_clk, "ext-osc32k-gate",
-			  ext_osc32k, 0x0, BIT(4), 0);
+static SUNXI_CCU_GATE_FW(ext_osc32k_gate_clk, "ext-osc32k-gate",
+			  "ext-osc32k", 0x0, BIT(4), 0);
 
 static const struct clk_hw *osc32k_parents[] = {
 	&iosc_32k_clk.hw,
@@ -352,7 +350,6 @@ MODULE_DEVICE_TABLE(of, sun6i_rtc_ccu_match);
 int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 {
 	const struct sun6i_rtc_match_data *data;
-	struct clk *ext_osc32k_clk = NULL;
 	const struct of_device_id *match;
 
 	/* This driver is only used for newer variants of the hardware. */
@@ -363,21 +360,7 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	data = match->data;
 	have_iosc_calibration = data->have_iosc_calibration;
 
-	if (data->have_ext_osc32k) {
-		const char *fw_name;
-
-		/* ext-osc32k was the only input clock in the old binding. */
-		fw_name = of_property_present(dev->of_node, "clock-names")
-			? "ext-osc32k" : NULL;
-		ext_osc32k_clk = devm_clk_get_optional(dev, fw_name);
-		if (IS_ERR(ext_osc32k_clk))
-			return PTR_ERR(ext_osc32k_clk);
-	}
-
-	if (ext_osc32k_clk) {
-		/* Link ext-osc32k-gate to its parent. */
-		*ext_osc32k = __clk_get_hw(ext_osc32k_clk);
-	} else {
+	if (!data->have_ext_osc32k) {
 		/* ext-osc32k-gate is an orphan, so do not register it. */
 		sun6i_rtc_ccu_hw_clks.hws[CLK_EXT_OSC32K_GATE] = NULL;
 		osc32k_init_data.num_parents = 1;

-- 
2.47.3


