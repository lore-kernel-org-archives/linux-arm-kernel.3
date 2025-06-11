Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE20DC71133
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hgyBVrfYOGwb8icwtwZuqsQvTSZXh6hVi38QgSu9syk=; b=ywlsKLnKv6SojXwgsn91SdqZKX
	++xx/ZfiL1yDWX5JH+r8w3tdiWoE1g15nZM4qVTsBXiFcNa2UdV/iWlozlqL5cDcjH9Geq/VGpACh
	jcBhZqf4l8tdjnb5PnHPePmh/e9nzA9urWCFsrZGzzLi5bORWCo5r0oC7VrkEuGXBbL9qVpH/HLKD
	fbeAS7NtIUtMWv0mchyw6AwZ+sqtM/QH47K09+5AfOmpZ4NaF+RErTVn6YeOjjYcciVXvZlkw9lPf
	zbk6rZRlMEbC6dNy7qIUCtFCMvx+n2zp1xBIyimQOOrYQvkRlnf9/eBMJ+JccaWBOT43Cx0Xcmabl
	7cxZioCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNzU-0000000AYD0-1ama;
	Wed, 11 Jun 2025 16:07:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKyA-00000009t8B-0vZ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 12:54:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a522224582so4057842f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646457; x=1750251257; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgyBVrfYOGwb8icwtwZuqsQvTSZXh6hVi38QgSu9syk=;
        b=yZLa8pcmgRVT+3drCCNnxmK60M/+k/42MBkvE9+KezVj6jf4GxMLg7grPF6UKTsI6F
         0iN6RL9Ih0vXoYXlCuH1kRESBDH9NfutwP9cU0cl4g6ndHwPKYm5aSV0l33rjTAsva8+
         b4Xxp/XDPWv+u0lQC0i+6MZx1B3S7VcMBLQ6/6lpN5SP3odSO6rkILfsHfmcUaNW/bx9
         AFO4hhOCDfXvMWOFXpIsU/8aHu+I1bOs7pNX2mzZrJvLVJPl+h++0QxUpzrF5gLroOu5
         gj9uq5sW0IO4oF92QQysHWfeaQY3TYgP9frZW7kkHbqte6cRM+ar3iUY62MiwLeX6WPM
         NmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646457; x=1750251257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgyBVrfYOGwb8icwtwZuqsQvTSZXh6hVi38QgSu9syk=;
        b=IUp2lomsiLVuTmRmV/z3p7RC1iaxJnC/NvZEUYMJc8zb2shnvnyyPdbyThKsvJwIcE
         W0UrUuL5ruovSuQrAYLCjP8wyDvEBV4f0fuloWTwVqzOk8AYdqYcMajUGTQ4lnrUg9kK
         R3sN78Kr/THSG12sjGwV6K84eAwQF6aYxmrkzn0wbBm5ZUjUJ6h8fxvdkckqzpRgoq8f
         zI75CpO6r2f5EHqB5hIn6oaaGRR01eipyMfuHLTAzskZqxkXQ+rIHsM75bohv7YjJR7R
         QsYIMsTlK7enNLlJW43F3VBaIU3/fPRTULTNIMGrPEE5ExqDmRE6qMnabzy5Tva0LHyB
         m08g==
X-Forwarded-Encrypted: i=1; AJvYcCVXsW2yzd1fLSUGUJOjOxtiCTs+teu0O+MrJh4elKVwHdR7y7yAh28JJ3UHRedwnjqKwGgGxFmjIakdHhxXEPTO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8roD25sXFyusBCbtS86jdg7J6zbA/IXFb/puMUOxQAwIoMZxB
	Lg6sw1xcuyvqlofn1jaTCvh7DC0IroDqBMk10yQXxl/5a5h+B0ymNLS5UgXPaCumi0ALUhZeLDO
	YYDJ0
X-Gm-Gg: ASbGncv5INz1+1TrZ3C4tG3UDjF/yICc6se5u9WihDKZFAnPwl+adeKInxscxxkJyVn
	vDgrlU9gGFSzWJNPK9qTOGVrA+tq3l2pE7/E2zzEOWjMDh0yCUzh11u+mb33CXVcjbMP+ErebDC
	v+qnD/gg8Rko1Wc0d/vPcHk1ULN/pXwiRjqlULCpnk+BQWIUnqaUcJbupzC+j2NqvjaWaAZHNlB
	L3HGeJnv5BJPL2QxuQg5MygDTn8wGzDGjwZDeHK2XpaYARhiWNlkaycXYu3QKtO+X2TIm89tWNk
	TxC9nsX1ng/BZ5LDvtsZgBIXADxSC7Ef/+AzWgCRVpz0m8Bff28gXDR86jDqhXIG3uvdGnXlyza
	VnKpqOC/Bxk0=
X-Google-Smtp-Source: AGHT+IGSKQ+I1VSBXzjz0e0/4PIaSTIl1mLDIRYQG2dUdUWN1ZjW/HP6izLGdBlHKJXUN9U97V2Bhg==
X-Received: by 2002:a05:6000:4203:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3a5586dcff7mr2566047f8f.38.1749646456700;
        Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:57 +0200
Subject: [PATCH 2/4] reset: eyeq: drop device_set_of_node_from_dev() done
 by parent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-clk-aux-v1-2-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RwzYmOF728hq2o8OgF4Q9VGpNb0lf0jDIwME53KEgHc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxzT4vvsOSw1zz5K9DH+lG0L5oWKmI61cqwC
 Uao7DX7/vqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8cwAKCRDm/A8cN/La
 hW4nD/wNd9PvOlo3p4RnDdZJ6qBC2p1a28mPHDfq6qSu/abBcGDIzBdcMUxT62vTPUu8vpWiUGQ
 pFFM9Ak0KjaeQXESXgfXTKh7Dal6utZtLY/jDkAbZPH1CwNYWpz499j+w4KpDXlZ70DGV9b4Wur
 nAc3LYPsix9HrCyBHL4J+bUdWbiZEJN65Ry0GGjj/77420eK2cPTNB0lcn0a/8Nspxs6a5eeb4x
 GxgMKDRbx5Gtc7q31GWbg4XsRhNczNAxGHol6J4U52E4/tdeyB0nWgnqg957uLKyzKff5npQ/3x
 VOpdHG074k8RLQ9kAbwpTGETzaVqm1Us6dEbwLkFAs6zy9EFjLCs0rNcy7xp9Vi04Za0zfGtX7Q
 Qv+i05679yJBJ3hUZJ7gmRPiPftx1Zig+ZdMH1rqLCKlxNbijywLN9bwy0nK+yxAxxKiq9KaZ6X
 G8UF309wZ65EgA57LA60CIS3n3dKEUMwNGPD+Hn0Ya/ZC9Jatg3rF9B6oQP1yDI3V9bMIpDksX5
 yFuQh8/1B89E/ZITsAi7jg6/KC3DsmCjIKGrovtwIdtyC61OzP6De4p6qQcK8KSUhcwFNB31vkO
 mITE+N4jmeeCX2ghVtBZIpexDdcjqcCN0r/MEOfdFdMYz77VtMrWDSAyYmnoEIXZv0b5OosDfZc
 pXrQkrGtqAn1Ltw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_055418_265019_14C192D2 
X-CRM114-Status: GOOD (  13.36  )
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

From: Théo Lebrun <theo.lebrun@bootlin.com>

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-eyeq.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b42921e3e511148cd29f215b5fc5e..8018fa895427bb1e51ea23b99803dc7fe6108421 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -420,17 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)

-- 
2.47.2


