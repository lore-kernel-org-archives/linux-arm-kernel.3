Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1015AC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqYS3VaYXkKa4Y2ba/jlry/eBEmss+btji6RsrdYjVU=; b=QHnSWxLEUCtEHXcfN+76AMfBlh
	rMwxkNGxC6geDqa4GrajyOGebgWs5QG48quQNbtTxJ2o9PqmxWMycqmgJbs7WisiJTnRd1y6zcrrx
	sVi3ACD7iQ3+u5CG0JLMrZi2k19Yd7sDZH4OsYw2BNAW0u/nthgWwCqZFJXEQJc+Ka6Oy0uIiSgwU
	I7p7MLUgrV9tsu3rEA7za2xOzylu78nKzX7iCWm/euSYH9imRy0VMQeD2P2mEvdm+KIQt28s4mBR3
	KB5wI6IBNH0mNXF/2Nef/i1EwqyBRn2JqVof0jHkYWNk998Y3Qfd9EHEyHP8Uyy7ai1I1LfpemKAb
	42f4alsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEoS-0000000EUdn-32jt;
	Wed, 13 Aug 2025 16:58:56 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9S-0000000ELjP-0DoZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jqYS3VaYXkKa4Y2ba/jlry/eBEmss+btji6RsrdYjVU=; b=lSaAJl
	j3P1xa5oxGrMEvCrsh3RyGYeFMscjLCAjWJnIdt1JfkZ2z4cNtf56pvgM0AQfOgH
	SOLdvtmj5SrBs+xRO1orIA2A1dl558KFNtNwEjLsa1K9UxBcmvqX45lv2vUo/bEf
	0SoMKabQ2jAoqXekq0GczZgV7A220vdGHLSDl1Akr4AQgWnbZpoaRCOwoXBPON5R
	u75pCXD2p+dZCU1fpoza2Wp3FmzJxk4qVjLcBrHJHS8Tw7D5XYGsKjKAvNbeT6tH
	Rzb+NkbDV5fP5aa+cGSqRgpmu4zbFkpH+9QEvjTdQfMGz7TMtoTx60zbq/h7a7Ic
	0vfMA8FhcDPdJ+fw==
Received: (qmail 695377 invoked from network); 13 Aug 2025 18:16:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:22 +0200
X-UD-Smtp-Session: l3s3148p1@FsI7ekE8sJFtKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 14/21] pmdomain: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:00 +0200
Message-ID: <20250813161517.4746-15-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091634_370440_54B9DA02 
X-CRM114-Status: GOOD (  10.75  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/pmdomain/imx/gpc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index f18c7e6e75dd..33991f3c6b55 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -343,7 +343,6 @@ static const struct regmap_config imx_gpc_regmap_config = {
 	.rd_table = &access_table,
 	.wr_table = &access_table,
 	.max_register = 0x2ac,
-	.fast_io = true,
 };
 
 static struct generic_pm_domain *imx_gpc_onecell_domains[] = {
-- 
2.47.2


