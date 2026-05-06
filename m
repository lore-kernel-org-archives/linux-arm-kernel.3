Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA9BCD342F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 01:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYWI5q6IWS0HuGrhMbiY7MLQV/QjiFOEif4XZnD0XaI=; b=fLsizDoFcuv21ajbEi1yVeIySY
	cqk1mdQV2YoB4jOrRG/XCRH03dzUyFkjP+0bH2X4295MU/PXssOIYt3ewySrKVBqDAHVuJSeOoxaO
	oXmUtM+s69ioxKVidfLbkbNTK/9J8EUZ8rlVI3L/tidbGOmIRhfCAPAQcaEvpnq29fsf1s3I5gtcD
	QPGyX5x0a1kT4TE5mXZ0RmYKbj9N6SXpLK6t8hDgMS1EvEm0pjLW4N9z73CetScyVnGIHLWboqQtn
	h3zt44KsLn2aokgPkn7fstfDMPDkGRS0OEy2Fq+hC+kh5j5fe5+cEJtv6+VUf+p0TLRGyuVl2RW3u
	vO49wUkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTG-00000000L8b-1drL;
	Wed, 06 May 2026 00:50:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKQTD-00000000L64-3kBF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 00:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYWI5q6IWS0HuGrhMbiY7MLQV/QjiFOEif4XZnD0XaI=;
	b=IYly3BXRAtQn8XGKcrKfy9weelYV5mtP4IccAv/dexdYt6r2G47I5P6OMUdAVQ43CaUOM1
	cg/1YdVFzNDXSVNlTu8lwl4VnlZS6DMSGZ3PBHLgy1dGviczjTsZAwbGhW/BzTo2GLj4XD
	DkmR3rVsQV37bR0eEnXEdALRc76tG4Q=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-CP8kVK3yMCOZguhfatnv2Q-1; Tue, 05 May 2026 20:50:32 -0400
X-MC-Unique: CP8kVK3yMCOZguhfatnv2Q-1
X-Mimecast-MFC-AGG-ID: CP8kVK3yMCOZguhfatnv2Q_1778028631
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eacc2008b2so1168223185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 17:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028631; x=1778633431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PYWI5q6IWS0HuGrhMbiY7MLQV/QjiFOEif4XZnD0XaI=;
        b=qw2LomBpCBVNP2LFJIZJ8HhSUi/ud9Cqn4DJ0gvuZPLNJk0QB6GKvBQKQATkOoNCtH
         sOTc8eOnKh7D3kVnljzR4OK0GbX1vgFi/NTB8vJRyMo/7nX67UiJUtfI9d3MInfAh+8R
         OZAN1oOQnNouXq+R4Ju6PMSKc2pamaN27lVV8Kpo0ggyRO7MFm/w9iOg++1kihX65Lf9
         4m5+dedzW6pxeqY8XlOn/0DV4dmbJxF3Jp1eu5PhNSggylQXAlu3dLrHekoz2+27R7M3
         14FFq9a8h2Vs0nEzt/8NK4k+dPjP3+LZHv/gq4TflhdKa3ijcMzSxtNZmSFQ026Z3wcH
         /9lg==
X-Forwarded-Encrypted: i=1; AFNElJ/IifA2TabO6T2Grxbj6ypB92+pHYmROz4bvqt+q3RumhfjlkUvGNb59rb99ZZ5LplaB23IBlNHT2ZQ/K56iYVz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/LW6WOufp5mBYGLupvoNhLIwdQV3xwQhDC0WVcbIc1Wq5X7yf
	Xo0LHaa4CX92Fp4D3PdhsPhLIQyvn2I8UsBk3cfFGNjMbDt2WTmJeSQ8tdgwnbg7jBd0UTynM3R
	LdolgiMA1YS2BinMadv51rM/EGXl8t9YucvUFZHBENo7u4Dd/nSIzbgAAsC7Gw69+PLBVXtRzkF
	DD
X-Gm-Gg: AeBDiesxFCN78fRaA9cznAL+Rsr4NFJ6elf78uE3qlL/Ckn4LQeosLiDE9IWCQ/LW3t
	xSOegYKsyjiblLR2lJaLVgRttSBnzukdDzSs7gPLHnIci0uByB0U2KawMA9FlHasF69yHoWeTzH
	g2urSIDq+Q6rO4DugKIMHqf3WzcXuzT7h7jdd+BNboj8gUeZ+4buZdEz0F+SNX4rp4RsHxzWRa5
	burGYHzl60qxTNyIPTravYG82zs7la8RmN/2uIVDNF6X3m8qPCMIlRq4Xvqc6PAATuWTN817/I3
	hlq2CkEZuxgru3c953ju+70/PlfZOb3YvHlRrN1vhGgLqlEHdBZNuxD8CyOX2dcv1g69SUKxBQH
	TFPq33LZ2L9N1pEMnCfLbHguyyh9t/FE47JmxudLW7Zr5NzwIP05PwEXnZLAtBKGoIw53FjKj
X-Received: by 2002:a05:620a:372c:b0:8cf:d441:c7c0 with SMTP id af79cd13be357-904d5d0d8cbmr224561885a.34.1778028631318;
        Tue, 05 May 2026 17:50:31 -0700 (PDT)
X-Received: by 2002:a05:620a:372c:b0:8cf:d441:c7c0 with SMTP id af79cd13be357-904d5d0d8cbmr224558885a.34.1778028630882;
        Tue, 05 May 2026 17:50:30 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:29 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 05 May 2026 20:48:57 -0400
Subject: [PATCH v3 01/15] clk: imx: scu: drop redundant init.ops variable
 assignment
MIME-Version: 1.0
Message-Id: <20260505-clk-determine-rate-noop-v3-1-f3f829fbacdf@redhat.com>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=9eLgOe84G1+qgxzBhagvDPxImGCu+A+SFA5V4275HKI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TXANuDRLyTWHUaDKdJaMwAzB7R3Pfnv5yCwtvfb6U
 ddMzn7vjlIWBjEuBlkxRZYluUYFEamrbO/d0WSBmcPKBDKEgYtTACZSrsTw3zFTdlNm3AUz4Xtf
 7Tsey7+LnPmRUYwnJ1vGaX/d7ndVHxn+1x++IHLLq5njd8Jpswt3Snfeyr//rde/ev17i+l3jge
 eYwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UwaTf9HuyiKMjjDQOmmv1t-Y9bWKowFX90Epu84dD-c_1778028631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_175036_003570_7073A47B 
X-CRM114-Status: GOOD (  12.10  )
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

The init.ops is assigned a default value, however right below it is an
if, else if, and else where all of them also assign a value to init.ops.
Drop the redundant init.ops assignment at the top.

Fixes: 3b9ea606cda53 ("clk: imx: scu: add cpu frequency scaling support")
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
To: Abel Vesa <abelvesa@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Brian Masney <bmasney@redhat.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: linux-clk@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/clk/imx/clk-scu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index 9b33df9967ec..658b6d94de9b 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -475,7 +475,6 @@ struct clk_hw *__imx_clk_scu(struct device *dev, const char *name,
 	clk->clk_type = clk_type;
 
 	init.name = name;
-	init.ops = &clk_scu_ops;
 	if (rsrc_id == IMX_SC_R_A35 || rsrc_id == IMX_SC_R_A53 || rsrc_id == IMX_SC_R_A72)
 		init.ops = &clk_scu_cpu_ops;
 	else if (rsrc_id == IMX_SC_R_PI_0_PLL)

-- 
2.54.0


