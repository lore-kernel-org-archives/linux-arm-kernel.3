Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47168CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FRKX/a9t7ARzNjcgVwY27xm/KGPFcrC2ZLWzVexu+GA=; b=h7z34UPgLjG4Ps/ojzuvc91CMo
	WdoHgxM8DUUMWCiWAmz3WXcWfjhoTxrv7FYiUzmw8BxU+av3fAveS9EBJpVjaf6HNHnzSpMrtijt/
	GiOOHU+NH8a5BX+VjGnVuPRbx6m4LtMweQ2w4oPauGaO+RJKvFyiqm7WO6Ra+qBXKQyBiteNADqak
	tGzh2D/3SRorKtDWQLgz1tdsW3gYBc2OvTbtkWMGr8IiFq36iEia3r0dhA0du3EWJrR4eLp5j3oFB
	kK1qoOFwc89/LV9vA3rQbCLAYHx30MojcV2CYMiutbFLFB6wHDH7S+FnNvGX/QY9Enl8RtKrk4h72
	3BukhVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBFi-0000000GvS4-2sLs;
	Thu, 18 Sep 2025 09:48:34 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBFg-0000000GvRj-2UTH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 09:48:33 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45f2fa8a1adso14927595e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 02:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758188911; x=1758793711; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FRKX/a9t7ARzNjcgVwY27xm/KGPFcrC2ZLWzVexu+GA=;
        b=qfLGbKuCM8P4sKNNdh+5/MSvZZipPy6vEtP7W6a9hZX/cWXRYXDklmoS7n2A5alE9U
         TjAtKkzYyhwbe0ystwJeAYxnFcPEIFNmcMJXR6a+/2JUYs5RIuZ9RcMU7Yz402oy0YRj
         8kvgb0vgJXySYdkRhpcSjZb6m61wIA4pl0wJv1JdLuNyuu6roO4E9sVMgVgzneKvQ0bn
         ekfWIMO9YIm6hvTHaI9K0WHvK9A/eD7codIwPj4C92V6bzaE5uYC5AIyRBoRbv2P1vFn
         f1zDj12D5G/7EyoDdPWHo2ez20R2+Pvhe6kgOIxJ80QkvDSao0SEL6U4DjfhV8qAezmJ
         z6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188911; x=1758793711;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRKX/a9t7ARzNjcgVwY27xm/KGPFcrC2ZLWzVexu+GA=;
        b=NWEXKlor5R+K0JEGm1AKhY9+d+3uwc6jqsAvoZzQ0AWqOeY8e7RK4+dN6TvrelARYn
         6m+d/RRWJjr/kY3+pzRdKEzHUeI4adUsLxgzJItbaLTa6S7+rOePHdNwZMtBybIxOPsc
         8FH1pj4Mkd9mAF90xzaamDxqRkFIY8v0SflTZklfgceDtGdKfxXJdB1Kee2dALXXzhiF
         JQy0yPcwxCupyJU76WtnEZ1vVpKgog3DzDxBqdxnZnoIPO3o4jTm+kJLHlsw58qOpqlA
         mdIHskw9VwInIGxxRZ6m9tn0/f8I4zwpWZw3Mll8LsBBA5qxjwUpBWv4cp0Oc1dL7/9I
         ENKQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7uf2em6vUR5yTSP+xaxn9g/TVIE89PtSyBNVSBOuQc0lM/9spIypVb6gP++A3t7SkPi2A54R1B5+7Hq7MYYlV@lists.infradead.org
X-Gm-Message-State: AOJu0YzHXI+ZvKL4JViwtUGc58zUIlfz5u31LG03rq6HNEope0djLqQY
	GacvAwFZt4GrzrOcyy/fub/n+N66khixDLAWadK7lr+XNS0dSb6BmQnCLOngZFFOpYA=
X-Gm-Gg: ASbGncsuCZd1iKfRY7wJf3VaNMpLCsebC0N2Wthzyug0Y8uyJrIqv6l8Xaj31A2v9Yc
	+0WRJY/vyMkk4JQYlmAquuxn3jTGW8Ffb6E70KI3Fgcp/pOWlX4nt9m2Rkj8FJ7bSPZP8NyRPPk
	3I4gSLEvxkR/9MJ+lFeIdX8kVTy0BvEn0p8ojqqlO/L42ZNHvliyPFqTM0tE0DKVqWMc1UyXlIc
	MpJ8G+9PFnRzMOtEghAbqNttF9M9gYjlUm8pqbc0C1RNd9SmX8IJFK3ot4cAKbWUjlYQ2DZsYIY
	mjV66rRQqAT4tK2zinq5TX+150GiEC4wmxhvFTWaGmsoLWwMrTGRdFP64BbbPczefdOvuTz5iy0
	dA+6Q9nRmdKrsQpJi72i2zNdgHC2yzefWUJJT87Wg1at1yA==
X-Google-Smtp-Source: AGHT+IHXja+pZTgNTOTckYTv2vp7ew+2RtTFibAkrz6i7j2uNLlasmLdSudrmUnD6HjK82+q28mc+Q==
X-Received: by 2002:a05:600c:43c5:b0:45d:d295:fddc with SMTP id 5b1f17b1804b1-464f7027ee6mr16687145e9.4.1758188910448;
        Thu, 18 Sep 2025 02:48:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-461391232e7sm72907635e9.6.2025.09.18.02.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:48:30 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:48:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Roger Quadros <rogerq@ti.com>
Cc: MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>,
	Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Basharath Hussain Khaja <basharath@couthit.com>,
	"Andrew F. Davis" <afd@ti.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: ti: icssm-prueth: unwind cleanly in probe()
Message-ID: <aMvVagz8aBRxMvFn@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_024832_653416_6F38395B 
X-CRM114-Status: GOOD (  15.65  )
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

This error handling triggers a Smatch warning:

    drivers/net/ethernet/ti/icssm/icssm_prueth.c:1574 icssm_prueth_probe()
    warn: 'prueth->pru1' is an error pointer or valid

The warning is harmless because the pru_rproc_put() function has an
IS_ERR_OR_NULL() check built in.  However, there is a small bug if
syscon_regmap_lookup_by_phandle() fails.  In that case we should call
of_node_put() on eth0_node and eth1_node.

It's a little bit easier to re-write this code to only free things which
we know have been allocated successfully.

Fixes: 511f6c1ae093 ("net: ti: icssm-prueth: Adds ICSSM Ethernet driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 30 +++++++++-----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index 65d0b792132d..293b7af04263 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -1390,7 +1390,8 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	prueth->mii_rt = syscon_regmap_lookup_by_phandle(np, "ti,mii-rt");
 	if (IS_ERR(prueth->mii_rt)) {
 		dev_err(dev, "couldn't get mii-rt syscon regmap\n");
-		return -ENODEV;
+		ret = PTR_ERR(prueth->mii_rt);
+		goto put_eth;
 	}
 
 	if (eth0_node) {
@@ -1398,7 +1399,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 		if (IS_ERR(prueth->pru0)) {
 			ret = PTR_ERR(prueth->pru0);
 			dev_err_probe(dev, ret, "unable to get PRU0");
-			goto put_pru;
+			goto put_eth;
 		}
 	}
 
@@ -1407,7 +1408,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 		if (IS_ERR(prueth->pru1)) {
 			ret = PTR_ERR(prueth->pru1);
 			dev_err_probe(dev, ret, "unable to get PRU1");
-			goto put_pru;
+			goto put_pru0;
 		}
 	}
 
@@ -1415,7 +1416,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	if (IS_ERR(pruss)) {
 		ret = PTR_ERR(pruss);
 		dev_err(dev, "unable to get pruss handle\n");
-		goto put_pru;
+		goto put_pru1;
 	}
 	prueth->pruss = pruss;
 
@@ -1569,18 +1570,15 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 	}
 	pruss_put(prueth->pruss);
 
-put_pru:
-	if (eth1_node) {
-		if (prueth->pru1)
-			pru_rproc_put(prueth->pru1);
-		of_node_put(eth1_node);
-	}
-
-	if (eth0_node) {
-		if (prueth->pru0)
-			pru_rproc_put(prueth->pru0);
-		of_node_put(eth0_node);
-	}
+put_pru1:
+	if (eth1_node)
+		pru_rproc_put(prueth->pru1);
+put_pru0:
+	if (eth0_node)
+		pru_rproc_put(prueth->pru0);
+put_eth:
+	of_node_put(eth1_node);
+	of_node_put(eth0_node);
 
 	return ret;
 }
-- 
2.51.0


