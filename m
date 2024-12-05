Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71702E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjBqIvCBlnzXYwzDaKfr38Hr5KyZb3Wjs7Zs+iuRS8E=; b=0Qw/VbJ13tNyWFhl0IWjZIvKFL
	LKtydCGsAQ6RuqCxXrRFoEsjXiRQdic2/CcaS/+OteHrJOYmeslk8sH22ccVr5FI5sE0s1v6+J+/R
	lMH68Ec7MXh2a1OU/tOsyijmtTLzsoZI3Cz7Qo0HpEMXLr9qcHhVCpE28JjglfMaby3yGx32UAZrn
	8HGHbe1mrqfZ+VC0HwyJU3VudG/2UTTF8DpATjIYTpKQ2s4WvkkZogW72u9uGKEZ3TXI8knns6RA7
	Q6vqIXgJ2eEkz2VfWyQDg7L4TvCpWu3k4SY3DZsQ75BliI+JmcYMzq3nzTpRNiME0PLC37anlyIg1
	G4bTOKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCRN-0000000GGm0-2ftr;
	Thu, 05 Dec 2024 14:02:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCKu-0000000GFIt-3NHn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733406968; x=1764942968;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=6GvfB7edygOjof5RC098NRUa57MLKSj4Kl9eAHtIq4U=;
  b=MBc8HlnTnNuchLM9CR0nHiVxssX3dVVy80yhkh3ZzM8OuJ7T/En/H8H/
   TRcCSmJHn0Vt6nGKPYkMjZSQ+EC0yHmm4/jrCbAvTwtQgRFfaY8esVSPl
   OaePtGR5CSpPvY3aruevAtzulmexk2nug4sksFj6WIGZtHNGIBGjFoWXg
   F0LMF5sJXQdzege7lUR2i0A0kN2YLQIW79Z6pTPhu8SXVjh9YVt2QmZAq
   gbEHq1ZLwN1wze9bshUuBDotZpqWZAm8ztE9xjWdqoCsCrvwJjl+5ciO/
   4QgKejUXRY4Bivbj8zjE0+boYZQz/ijZHCwB8s1ou0Dz1kyukaSBSmtk/
   Q==;
X-CSE-ConnectionGUID: qy+UA5uVS7igPsVfubi4eA==
X-CSE-MsgGUID: JzRvWx8tQKavjYXcv/wEYw==
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="202626300"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 06:56:06 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 06:55:36 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Dec 2024 06:55:33 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Dec 2024 14:54:28 +0100
Subject: [PATCH net 5/5] net: sparx5: fix the maximum frame length register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-sparx5-lan969x-misc-fixes-v1-5-575ff3d0b022@microchip.com>
References: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
In-Reply-To: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<arnd@arndb.de>, <jacob.e.keller@intel.com>,
	<Parthiban.Veerasooran@microchip.com>
CC: Calvin Owens <calvin@wbinvd.org>, Muhammad Usama Anjum
	<Usama.Anjum@collabora.com>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_055608_932266_6B2CD6F8 
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

On port initialization, we configure the maximum frame length accepted
by the receive module associated with the port. This value is currently
written to the MAX_LEN field of the DEV10G_MAC_ENA_CFG register, when in
fact, it should be written to the DEV10G_MAC_MAXLEN_CFG register. Fix
this.

Fixes: 946e7fd5053a ("net: sparx5: add port module support")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_port.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index 1401761c6251..f9d1a6bb9bff 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -1151,7 +1151,7 @@ int sparx5_port_init(struct sparx5 *sparx5,
 	spx5_inst_rmw(DEV10G_MAC_MAXLEN_CFG_MAX_LEN_SET(ETH_MAXLEN),
 		      DEV10G_MAC_MAXLEN_CFG_MAX_LEN,
 		      devinst,
-		      DEV10G_MAC_ENA_CFG(0));
+		      DEV10G_MAC_MAXLEN_CFG(0));
 
 	/* Handle Signal Detect in 10G PCS */
 	spx5_inst_wr(PCS10G_BR_PCS_SD_CFG_SD_POL_SET(sd_pol) |

-- 
2.34.1


