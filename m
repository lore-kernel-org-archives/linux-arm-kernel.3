Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CB3CCF9EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 11:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYZHP/h1h6LMXmA5rHQVK6kbxBrD0shRYIBtDi9X0/0=; b=14BlQxpab/KF/Hpi3sQyuyJj3r
	OsZJy4JhFj0Dha6RWKZigInHUWme1Yf2H8cP0hkbycTZaHC+fT0Lf6KliSe8LuwEophFlrfb1M0tJ
	vmFJa6fYoCZHF6+XX1Lia95PAfdcorFYgcQoh+CNjtZkv5PSvPlC2G4jK1TFVm9OGb70o0eP/Mtfy
	oYnpehMw6Y/64PoLS4DEDS9+8DGEaeLhFoC9nTc5ynw/lICFoeKSlKj2dG4W/6/8FtM3eu7jg5HCd
	lV1YeOAqhOUhnU+gMSyLnq7LVsJQ1KpLrgp3Dx5S1N3OmrQdFXtnq9ok+Y5R0zne9YsbKXWVbU0N1
	iuJlffIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLZ0-0000000DmeF-1V6c;
	Mon, 27 Oct 2025 11:39:02 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDLYr-0000000DmYy-4Bp7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 11:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761565134; x=1793101134;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1Nq4OsIRGvzLFnYkMUeCuaM3aAF/kNBZikR/j5G0pus=;
  b=WnzT33mYNidLhYmnyx+LPXfPwj3ikFJbFfflhNpWvHHsIZkBWZGmYFd9
   Oj/pHviZ0oCzTqqW9DwhTttJVeiP3+uClUsZvdctM6wdkgr60TmuD4qmC
   8a4LdIn0WHXgZfbyYibFheezfMkXJ0S/pz6rZ44WfEAdsE52Q1o+A6pGY
   /B9xAEEjzQ4sHueiAtkYp/Uyq7gxqHj9FtJV+xc1jkw5IfcecAaC/hfgB
   asysPBHO2CIZZU/RdN+0GboFbqzD+e68nnwrqelxXGpWLIXt6Z7HoudMM
   LhhXFdC1fS/pAbNvTzh1ivJ+1wRs9VJzLh67byjXYlo4n7udhgnA+2I0M
   w==;
X-CSE-ConnectionGUID: ejRfG8DAQR2sb9mBgpgiSw==
X-CSE-MsgGUID: 8FfQ/Db2QteYeF3r0jjHKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67475566"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67475566"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:38:53 -0700
X-CSE-ConnectionGUID: iIW0rqlSTjKyFa6dPorjMg==
X-CSE-MsgGUID: 5jwMr2BZQgGdAvsLID/SqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; 
   d="scan'208";a="184642346"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.31])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 04:38:48 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 92855121EC5;
	Mon, 27 Oct 2025 13:38:45 +0200 (EET)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1vDLYY-00000001dde-27gj;
	Mon, 27 Oct 2025 13:38:34 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Ingo Molnar <mingo@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michael Nemanov <michael.nemanov@ti.com>,
	Kalle Valo <kvalo@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roopni Devanathan <quic_rdevanat@quicinc.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/4] net: ipa: Remove redundant pm_runtime_mark_last_busy() calls
Date: Mon, 27 Oct 2025 13:38:32 +0200
Message-ID: <20251027113834.390681-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251027113834.390681-1-sakari.ailus@linux.intel.com>
References: <20251027113834.390681-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_043854_160367_08EF66F1 
X-CRM114-Status: GOOD (  13.03  )
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

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/net/ipa/ipa_interrupt.c | 1 -
 drivers/net/ipa/ipa_main.c      | 1 -
 drivers/net/ipa/ipa_modem.c     | 4 ----
 drivers/net/ipa/ipa_smp2p.c     | 2 --
 drivers/net/ipa/ipa_uc.c        | 2 --
 5 files changed, 10 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index 245a06997055..8336596b1247 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -149,7 +149,6 @@ static irqreturn_t ipa_isr_thread(int irq, void *dev_id)
 		iowrite32(pending, ipa->reg_virt + reg_offset(reg));
 	}
 out_power_put:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return IRQ_HANDLED;
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 25500c5a6928..95a61bae3124 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -903,7 +903,6 @@ static int ipa_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_deconfig;
 done:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
index 8fe0d0e1a00f..9b136f6b8b4a 100644
--- a/drivers/net/ipa/ipa_modem.c
+++ b/drivers/net/ipa/ipa_modem.c
@@ -71,7 +71,6 @@ static int ipa_open(struct net_device *netdev)
 
 	netif_start_queue(netdev);
 
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -102,7 +101,6 @@ static int ipa_stop(struct net_device *netdev)
 	ipa_endpoint_disable_one(priv->rx);
 	ipa_endpoint_disable_one(priv->tx);
 out_power_put:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return 0;
@@ -175,7 +173,6 @@ ipa_start_xmit(struct sk_buff *skb, struct net_device *netdev)
 
 	ret = ipa_endpoint_skb_tx(endpoint, skb);
 
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	if (ret) {
@@ -432,7 +429,6 @@ static void ipa_modem_crashed(struct ipa *ipa)
 		dev_err(dev, "error %d zeroing modem memory regions\n", ret);
 
 out_power_put:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 }
 
diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
index fcaadd111a8a..420098796eec 100644
--- a/drivers/net/ipa/ipa_smp2p.c
+++ b/drivers/net/ipa/ipa_smp2p.c
@@ -171,7 +171,6 @@ static irqreturn_t ipa_smp2p_modem_setup_ready_isr(int irq, void *dev_id)
 	WARN(ret != 0, "error %d from ipa_setup()\n", ret);
 
 out_power_put:
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 
 	return IRQ_HANDLED;
@@ -213,7 +212,6 @@ static void ipa_smp2p_power_release(struct ipa *ipa)
 	if (!ipa->smp2p->power_on)
 		return;
 
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 	ipa->smp2p->power_on = false;
 }
diff --git a/drivers/net/ipa/ipa_uc.c b/drivers/net/ipa/ipa_uc.c
index 2963db83ab6b..dc7e92f2a4fb 100644
--- a/drivers/net/ipa/ipa_uc.c
+++ b/drivers/net/ipa/ipa_uc.c
@@ -158,7 +158,6 @@ static void ipa_uc_response_hdlr(struct ipa *ipa)
 		if (ipa->uc_powered) {
 			ipa->uc_loaded = true;
 			ipa_power_retention(ipa, true);
-			pm_runtime_mark_last_busy(dev);
 			(void)pm_runtime_put_autosuspend(dev);
 			ipa->uc_powered = false;
 		} else {
@@ -203,7 +202,6 @@ void ipa_uc_deconfig(struct ipa *ipa)
 	if (!ipa->uc_powered)
 		return;
 
-	pm_runtime_mark_last_busy(dev);
 	(void)pm_runtime_put_autosuspend(dev);
 }
 
-- 
2.47.3


