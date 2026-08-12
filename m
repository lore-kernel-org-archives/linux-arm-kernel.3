Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A3AC5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 05:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a3NwGJoxjsOQfXneqpDh4SaW5RBEezGe2ajLiNDyPjM=; b=eclxBB4D5b0QUVI/ddOxDb1GWX
	6d1gkLrkofwKTbECrZGSKNwP36hk0GiWyQ6Yw0pjZo4mNU+yk9IWpfQ2kNiZEVj7FtV9UP6IpsbI9
	xsJ2hJhpRKNlNKPAlGLjewcw1VfnXs0xKwgmhgRZWs+u82hjCzStRUJ1ZhCLKYrVffVIFPIRTfcXu
	yWDPE7kgHSVwnSw5pxfUeSAVo5b0oPaP7BonvkqV0qwNABwDya1TkUqd7q7/CAFxerxSNgjTi0z6D
	fWB4ECbuTjJFWLhp3PMTJa0xhwKfjsTO3B91FaBbYFrPdznFGWA2Unc9+mCb+INPKS3GwBSPx3Qpw
	bcGWhKPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1pP-0000000FSZq-2bJg;
	Wed, 12 Aug 2026 05:48:39 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1pN-0000000FSWa-0Z19
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 05:48:38 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 12 Aug
 2026 13:48:26 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 12 Aug 2026 13:48:26 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 12 Aug 2026 13:48:26 +0800
Subject: [PATCH 2/7] EDAC/aspeed: Set the DIMM grain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260812-edac-v1-2-03992edea297@aspeedtech.com>
References: <20260812-edac-v1-0-03992edea297@aspeedtech.com>
In-Reply-To: <20260812-edac-v1-0-03992edea297@aspeedtech.com>
To: Stefan Schaeckeler <sschaeck@cisco.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<linux-edac@vger.kernel.org>, Borislav Petkov <bp@suse.de>,
	<linux-rt-devel@lists.linux.dev>, Ryan Chen <ryan_chen@aspeedtech.com>,
	<stable@vger.kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786513706; l=1310;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=ghwuXIUkCe0r9jImgksJuGTgCehdPwUB1sU47hl7ksA=;
 b=ta3t3OOxlRiWkwMAqIK/N+WRybGbaOUJqQg0PEnxU+ucrYPyhNHsveCEa50qfJPjIFuCdvrvB
 JKdn2wbwYSlD5+7XNJ8o56qPVH+USWyAHMRG3mZ0zzsDkqhJppHYiDM
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_224837_205732_370AE949 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

The driver never sets dimm->grain, leaving it zero. Since commit
3724ace582d9 ("EDAC/mc: Fix grain_bits calculation")
edac_raw_mc_handle_error() runs WARN_ON_ONCE(!e->grain) and forces the
grain to 1, so the first ECC error reported on any Aspeed BMC SoC emits a
warning splat, e.g. on the AST2600:

  WARNING: CPU: 0 PID: 0 at drivers/edac/edac_mc.c:924 edac_raw_mc_handle_error+0x4b4/0x604
  ...
  edac_raw_mc_handle_error from edac_mc_handle_error+0x364/0x4a8
  edac_mc_handle_error from count_rec+0xdc/0x124
  count_rec from mcr_isr+0x110/0x1e8

Fixes: 9b7e6242ee4e ("EDAC, aspeed: Add an Aspeed AST2500 EDAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 drivers/edac/aspeed_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/aspeed_edac.c b/drivers/edac/aspeed_edac.c
index 6e069b255595..83d60414f89a 100644
--- a/drivers/edac/aspeed_edac.c
+++ b/drivers/edac/aspeed_edac.c
@@ -266,6 +266,7 @@ static int init_csrows(struct mem_ctl_info *mci)
 	dimm->mtype = dram_type;
 	dimm->edac_mode = EDAC_SECDED;
 	dimm->nr_pages = nr_pages / csrow->nr_channels;
+	dimm->grain = 16;
 
 	dev_dbg(mci->pdev, "initialized dimm with first_page=0x%lx and nr_pages=0x%x\n",
 		csrow->first_page, nr_pages);

-- 
2.34.1


