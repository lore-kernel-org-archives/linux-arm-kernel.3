Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9843CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 19:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AUucbabIGrn3bRd3fXdHgTzW7jRpxaxIBGMPCbeA8Ms=; b=qasQp6CV3/ZAVvN3hBYxOKl0gm
	BdavV6Mj3sg6QHJmcdSThmYZaMZ3DxXrYHzLASzf3a1DzByqdg4+AjxlPmFvVwSnGO3EH3vtMPbru
	Xe0XkB/6vZsAVmb2oCd/dQ+SINJ7rwBCqmdv6MU+2wkwf8ZhwNErw3dVBQyqormj5an5l/LErRscn
	OiMU+Qj9WylNFsDQo08KyuxXn/vV1iculMzNVy19koVs8gfNlY7Ad6vIxsujN0UejjiQxZjRrFncY
	xkNEnCVFW3l/0IdKdIavXUtz4I8WS2I7knlZHuNWKoeOa4GVrrfI7k8u3Q0ZtVg+Ttqbvp7vKNtZB
	blAgwtdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4ie-0000000GD9R-3U1x;
	Wed, 14 Oct 2026 19:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH4ic-0000000GD9E-36A3
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 19:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=AUucbabIGrn3bRd3fXdHgTzW7jRpxaxIBGMPCbeA8Ms=; b=ZuGLJTFEE2pXNOQu2NSJnVA4ey
	bz0J72QtGVP/7iSMERO96pB+2Uc3YgnRlVi8oCwzNdx7bsMYxWhPPjPLkczW6OpGYdv2z61hjQzdS
	iUcwBskAAyHDN9KsaxBsTlMQehF23PtK8cSO6pL0R83yoJEjXqzR9Zl6MJfHB9h3TTF7WgFI/1R5g
	wcOyulO8YDzlvHNnLAF/Buv1jRFKlky91ehns/S3hv16rmPNHNM5JXlrI+mU26+OdjUXj0AIM8nq3
	U/INGTEi0ZYzpAl2trhWeO7RZnhY3Qkzb3i+v86V9DfmRp/phxEHB+uCuUMgIwA4dkFiUG6rWNqrQ
	yphBIYkA==;
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xH4iZ-0000000H9Qu-2J2l
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 19:32:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-486e70f2457so415868f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792006369; x=1792611169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUucbabIGrn3bRd3fXdHgTzW7jRpxaxIBGMPCbeA8Ms=;
        b=LxIutU4bVOkSnQD8iFd/USfDglzK1MBSJ0PLpr193dA/vhPYs3UR/QrhnhnZSnTgxJ
         VQqwntZZ498NZDvcATbPzuMQBGckLS+8DjvrgXnCP+3RwglfiaZsjw3xCbLBTdXvrHR+
         2b32xNjxz2h2jLzDdwFBse8WIkF+7qI7c/4b16bF9Mw8EtfDsirPEzFusouE1mf6s0AN
         P2FrNqc+H6sxHesj9htoVHDisVfXr7b0muWRRRpkBP+WGATUECrUenjOe+8SX8IgDZjQ
         7NMzaxvY3Dpgatwybe6kIW1LDHTLAJqM/td6GMyTK1Ewn2j1iWbBn41YPg18Y25so5Dp
         qL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792006369; x=1792611169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUucbabIGrn3bRd3fXdHgTzW7jRpxaxIBGMPCbeA8Ms=;
        b=RZS3cNrBhrpvHXflAC/mR8b7zKe/WphtR3Td8YBtxh69Fk69UzMXEhqpeSGU3Dl2Am
         Ad0YOZuFq1oLMzEibBJizf4+qTpAG7OzLlmpoizyPkqvkX2ilsUxNd2zxdaOr5/e5xup
         /p+vTYAaNvX8fIRDGNWz0blBGBaQqLoCpkr88HkBfN5nw6i4xdZZHCVkW0QSKfKh3EXm
         hEvOqXHJ1XUXh0q64XkPjQgd5rnCk+qSQE5G0m8Dn+Ft38M4AZnbZhDXkpbMPn+ugEbj
         Nck1IhiyVHJ+hWLO9zD6CFgivcuu8zUQDh2owww+1LcbAF1IL2JKu4LHLey/9h4DH67B
         TFiw==
X-Forwarded-Encrypted: i=1; AKwUvBxHG2AvwoSJQu0ftrwKQInLn6dgeipBf9FgJh8B4sWBMC3p00hIMjvFpXpsVokosTS16zvNoea+0ebZfR1H9iMA@lists.infradead.org
X-Gm-Message-State: AFq9FYJxFiRncskTZRU1KhUDQFxAEQ6tqnoZBya1ygMvCoNSN8OUlUAo
	Qa4yIBQnQiiotV9xUSpqi0hdrxSEtkZ6gp6o3MVAewHECpXLb9WCJ1SI
X-Gm-Gg: AYBFou27FJIc45IEd/rkZbjDfjkEerdRtgNLXPB0yV98bQlzQJYiIGZXG4BtSZqL4oc
	Sp9Ph3VNG1seqqsQnL4Dxqr6TFpIPoMeeRUIr/96DTmxvrl0MUdKNwUAXMFzJgSygtWiAbWtmBF
	dXCYhqv2Ujy+Bg9Mo+7kNbsvcemJDwwDbApkKAYHSx6rDNE/0BXyo7B8gNYgXYkcUh4hGOcGiEu
	ExdB37xNm/1SYaCLOYaJLswhXTuD3jgRsEnS5NgBqz32a1nt+qWSydmUbF+GejJhz5q4t6dGl9J
	L1eW+QApEPoLhj+p8htIQ4BqhjWS0cnmpXF7HG8XNxWrODKp2dEbMcAn31FAASnBvVlxWL4ugKA
	t/77AzZ/qFdYrxsay5QntNuO7jyZIiUlboU/2iB0j9wrtuDImZUn0UlLmAKaA4J14r8hj9mr2PG
	h1bMaNTsEYc1FTf1hAZDznIATfRwich8iWYyM7dtdjYjU6Nj+d2HTTuVsEUfPjoSttwxBjTTvUz
	PLX4iEH+0X3aAtTA3PpixLQOUVv1mgJ
X-Received: by 2002:a05:6000:298e:10b0:48b:5e2:52c7 with SMTP id ffacd0b85a97d-48dba77cf13mr25773200f8f.8.1792006368804;
        Wed, 14 Oct 2026 12:32:48 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4e8csm13151463f8f.23.2026.10.14.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 12:32:46 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH] rtc: sun6i: fix error handling in sun6i_rtc_clk_init()
Date: Wed, 14 Oct 2026 20:32:20 +0100
Message-ID: <20261014193220.38055-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_203251_797363_B50CC37B 
X-CRM114-Status: GOOD (  14.70  )
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

Set sun6i_rtc only once all clocks are registered, and unwind fully on
error.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/rtc/rtc-sun6i.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-sun6i.c b/drivers/rtc/rtc-sun6i.c
index 7fc60880e409..dd293e8324b8 100644
--- a/drivers/rtc/rtc-sun6i.c
+++ b/drivers/rtc/rtc-sun6i.c
@@ -231,6 +231,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	const char *iosc_name = "rtc-int-osc";
 	const char *clkout_name = "osc32k-out";
 	const char *parents[2];
+	struct resource res;
 	u32 reg;
 
 	rtc = kzalloc_obj(*rtc);
@@ -267,9 +268,6 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	}
 	writel(reg, rtc->base + SUN6I_LOSC_CTRL);
 
-	/* Yes, I know, this is ugly. */
-	sun6i_rtc = rtc;
-
 	of_property_read_string_index(node, "clock-output-names", 2,
 				      &iosc_name);
 
@@ -280,7 +278,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 								300000000);
 	if (IS_ERR(rtc->int_osc)) {
 		pr_crit("Couldn't register the internal oscillator\n");
-		goto err;
+		goto err_unmap;
 	}
 
 	parents[0] = clk_hw_get_name(rtc->int_osc);
@@ -309,7 +307,7 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 					  &rtc->lock);
 	if (IS_ERR(rtc->ext_losc)) {
 		pr_crit("Couldn't register the LOSC external gate\n");
-		goto err_register;
+		goto err_losc;
 	}
 
 	clk_data->num = 3;
@@ -317,12 +315,22 @@ static void __init sun6i_rtc_clk_init(struct device_node *node,
 	clk_data->hws[1] = __clk_get_hw(rtc->ext_losc);
 	clk_data->hws[2] = rtc->int_osc;
 	of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
+
+	/* Yes, I know, this is ugly. */
+	sun6i_rtc = rtc;
 	return;
 
+err_losc:
+	clk_unregister(rtc->losc);
 err_register:
 	clk_hw_unregister_fixed_rate(rtc->int_osc);
+err_unmap:
+	iounmap(rtc->base);
+	of_address_to_resource(node, 0, &res);
+	release_mem_region(res.start, resource_size(&res));
 err:
 	kfree(clk_data);
+	kfree(rtc);
 }
 
 static const struct sun6i_rtc_clk_data sun6i_a31_rtc_data = {
-- 
2.52.0


