Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D329D0BB42
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPndmxxbEbM8C1VSJaLplnmL2iqy/XCPatb+kldw96Q=; b=WdbyzfR5PxGCJlOHor8jSxvb/r
	etiNpHKS6NOpyr1yCIXgUJ1mgcmmVvyDMIZJnXvRnA7+tcntAZUN/tzjakiOiJMtqznDomURmmVD0
	i1G3waoAJ7GI/1apuqJGmLZX/iMOeu7syMG0pP0HaVMNqlA4HBeHYkBF3IdeAZ0X8hRv7mhRnad4G
	sNGWxFVnzuKjuQWbDLWLBmTvSN9F3BB58Htv+gK43T9Qcxn7Kzk6A1dIbkyk8l2QxZJ9z/FgwseRr
	B7E8GlzoauDAH7LDzPrB/dllMUsktvcwoO/nQsfUrnpoeqxh9zx2YKLV/1nlSTBZQ4a6duxLjpdTV
	xBHX8UvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jZQ-0000000G3rz-1VRF;
	Wed, 23 Oct 2024 22:11:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jQc-0000000G26w-1yYl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720926; x=1761256926;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Db4mo36NIk5280MwSTl+F0lyO0vOeJdT0JiFPqacJdE=;
  b=DmTHR4gTEi1vljWZ2vITIUpKBRlzyrD3wK+0B1JbLDoNDvGJDIgKsZNp
   WdOkFratLt0OCjZ6VRZsLBvMWpZ4S3aam7ImY6EKi2qu8hhfPdZvxH8IY
   XStT0iR//kiGrdFf8k0Vxj33haUcX7bIjpFnbziRRPBgGLI/Hxe5BOhLh
   yF+uboxOjXCA7PZwesO3ZzqPreBRx5/EpSIlseyRsdO0GWf6PwWmiL7mN
   ijel9/XIoeSB/hBArRUusIrezHoRzMh+LAVJTDn2rF1/AFS0DKoT1q8QB
   KJHbPlpeEJUfhxpibR6rcCGUFkF1hv0gu3CC0qu70NIpEofb176s8Qv7B
   A==;
X-CSE-ConnectionGUID: 1Xapdzk8QAqz3uJYdYtrIg==
X-CSE-MsgGUID: wZ/VQMLxRG6JieyzTeqSLA==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="33409630"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:01:51 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:01:47 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:22 +0200
Subject: [PATCH net-next v2 03/15] net: sparx5: change frequency
 calculation for SDLB's
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-3-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_150206_659633_A00EA0F9 
X-CRM114-Status: GOOD (  12.41  )
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

In preparation for lan969x, rework the function that calculates the SDLB
(Service Dual Leacky Bucket) clock. This is required, as the
HSCH_SYS_CLK_PER register is Sparx5-exclusive. Instead derive the clock
from the core clock, using the sparx5_clk_period() function. The clock
stays the same before and after this patch, only now,
sparx5_sdlb_clk_hz_get() can be used for lan969x too.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h |  2 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_sdlb.c | 10 +++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index f117cf65cf8c..2a3b4e855590 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -552,7 +552,7 @@ struct sparx5_sdlb_group *sparx5_get_sdlb_group(int idx);
 int sparx5_sdlb_pup_token_get(struct sparx5 *sparx5, u32 pup_interval,
 			      u64 rate);
 
-int sparx5_sdlb_clk_hz_get(struct sparx5 *sparx5);
+u64 sparx5_sdlb_clk_hz_get(struct sparx5 *sparx5);
 int sparx5_sdlb_group_get_by_rate(struct sparx5 *sparx5, u32 rate, u32 burst);
 int sparx5_sdlb_group_get_by_index(struct sparx5 *sparx5, u32 idx, u32 *group);
 
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_sdlb.c b/drivers/net/ethernet/microchip/sparx5/sparx5_sdlb.c
index df1d15600aad..98a3f44c569c 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_sdlb.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_sdlb.c
@@ -25,17 +25,13 @@ struct sparx5_sdlb_group *sparx5_get_sdlb_group(int idx)
 	return &sdlb_groups[idx];
 }
 
-int sparx5_sdlb_clk_hz_get(struct sparx5 *sparx5)
+u64 sparx5_sdlb_clk_hz_get(struct sparx5 *sparx5)
 {
-	u32 clk_per_100ps;
 	u64 clk_hz;
 
-	clk_per_100ps = HSCH_SYS_CLK_PER_100PS_GET(spx5_rd(sparx5,
-							   HSCH_SYS_CLK_PER));
-	if (!clk_per_100ps)
-		clk_per_100ps = SPX5_CLK_PER_100PS_DEFAULT;
+	clk_hz = (10 * 1000 * 1000) /
+		 (sparx5_clk_period(sparx5->coreclock) / 100);
 
-	clk_hz = (10 * 1000 * 1000) / clk_per_100ps;
 	return clk_hz *= 1000;
 }
 

-- 
2.34.1


