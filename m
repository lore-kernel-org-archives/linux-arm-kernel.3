Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A58C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZu8C/LjKs+zhumQL2RagogjTb5ZhrLMBzmqreBoJto=; b=LulTh1IaOWrwdZFR3yXVUBfDQK
	6DXu5zJY03dKTSR/3VFJUwxqvFn0yJ1meK6SV4iOwsjz4hnsYr2jBMTEyRrdONibLQMXXWCT72Ufz
	w3pUlsYAGgYQ72iLs2254SDY0ablApVl3O80Ndwfy2nmZhf1gKzIuW1eUoLQXbdXwqalx0EHP6nEG
	Jt8M43/uHLx4yfTInhEeVBvJwZXIkBxNHtYZugx8s8Ilm9tk7vQ4BaQmAeN1Aq2Hy1geDvjTA8eWu
	qb6HfC0SX06Wa439K2iM2s7GHmYTHzIRzwpLIOg4WBPW74p5FQCQaBUH0gp8BK7zVdMnIHEoqu5Fh
	qYFWegmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCN0-00000002nWT-0eRJ;
	Wed, 26 Feb 2025 08:02:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCBm-00000002k8y-1i3K
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 26 Feb 2025 07:50:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AZu8C/LjKs+zhumQL2RagogjTb5ZhrLMBzmqreBoJto=; b=CtbW4iwd6dvJGLyrLUFQoXmF5H
	5vdgRCzoFtoDEDQBb3RtppXONur/4/hmbTT85KQw+5iPqqEVAzEA9QGWIFHC4FrOQoYjUqG9tpWLc
	HihqPPMqIvIOtivkUPtP7IyYg78tS9z1rpWqDj/gdv7Un+jHJbej4fhXCXoU/6jGHE45/nvdF7pE5
	f+sNqL7FJzbSnEB/qk4cPr+IioVpHoMe5a8k7SHeWHXGjE7TblKFgYX+H4lF8iFZ90uSgVyDDK4vO
	rjzCfX2+iVp51Q0O96w8rJG8emle5HwD00l5KEHdk4EeV+77LpVxI4lnAPSy4kj1LvFGckz/K0vFy
	QHTPgkyQ==;
Received: from mgamail.intel.com ([192.198.163.12])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCBj-00000003Y3U-1PxT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 07:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740556239; x=1772092239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AqeDW7qb92Fq8y+7TKrCPa96WtyV2jlAAaKKKnh8Hrg=;
  b=Z7NQ1ION5ddt3Gnn6EuyMLYY1svDmti78Njl8c5S0vbDSa9ocRXEwG6l
   Qmv7+HLgwEG/6TIOVzNVgODE3KmO3T3p4SoA7LBMVpx+5cHHwsQPXA46v
   ZA/a69o4pmD+EM3DtyXuiqwoaWlvmi/TeHmsK7MiuPEEZQa4zO63h8e5o
   NpN06NZtG6ZrrFFNiBMfESZOJJH9Ip/6UidXNhoLY6FeFxxN1ThX74cjH
   IY5exzz/6IPakreRzey1GY11OGwnIn4ltBWdzmOjvj0Bi68OTjkd8KZVl
   mWWC9vptR5oJhVv+aLURxAUqhB1bhRD8Ut4I70cmBQ4LlTGTa3YfF/5Og
   g==;
X-CSE-ConnectionGUID: bezvbdEARk+M0T9Br1UwNA==
X-CSE-MsgGUID: 564A5eIpR7yPuzRlETqEhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="45305215"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="45305215"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 23:50:38 -0800
X-CSE-ConnectionGUID: GL5GL3AgQ2ygmRtTiaUxnQ==
X-CSE-MsgGUID: 2qEvEi0QTfe+jxv3sy65GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120743047"
Received: from yongliang-ubuntu20-ilbpg12.png.intel.com ([10.88.227.39])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2025 23:50:31 -0800
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
To: Simon Horman <horms@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	David E Box <david.e.box@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Serge Semin <fancer.lancer@gmail.com>
Cc: x86@kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v8 5/6] net: stmmac: configure SerDes on mac_finish
Date: Wed, 26 Feb 2025 15:48:36 +0800
Message-Id: <20250226074837.1679988-6-yong.liang.choong@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
References: <20250226074837.1679988-1-yong.liang.choong@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_075039_809179_D424CF7D 
X-CRM114-Status: GOOD (  11.21  )
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

SerDes will configure according to the provided interface mode after
finish a major reconfiguration of the interface mode.

Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 424fa2fe31c6..72ec2ef3907f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1086,6 +1086,18 @@ static int stmmac_mac_enable_tx_lpi(struct phylink_config *config, u32 timer,
 	return 0;
 }
 
+static int stmmac_mac_finish(struct phylink_config *config, unsigned int mode,
+			     phy_interface_t interface)
+{
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct stmmac_priv *priv = netdev_priv(ndev);
+
+	if (priv->plat->mac_finish)
+		priv->plat->mac_finish(ndev, priv->plat->bsp_priv, mode, interface);
+
+	return 0;
+}
+
 static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_get_caps = stmmac_mac_get_caps,
 	.mac_select_pcs = stmmac_mac_select_pcs,
@@ -1094,6 +1106,7 @@ static const struct phylink_mac_ops stmmac_phylink_mac_ops = {
 	.mac_link_up = stmmac_mac_link_up,
 	.mac_disable_tx_lpi = stmmac_mac_disable_tx_lpi,
 	.mac_enable_tx_lpi = stmmac_mac_enable_tx_lpi,
+	.mac_finish = stmmac_mac_finish,
 };
 
 /**
-- 
2.34.1


