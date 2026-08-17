Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20828C5DF77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 15:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TQEY9nafI8wt8O0OA2EATNJzNVvYn85W0n2JQCDTwk=; b=Vxk6Lwc7HQgHfo8yZCE2V+yWxP
	Gmha79O6/sQ2shjMM7BFMtBAVnkrmpze6UgE01iXNXlxWhAQfyd77Pyg33zJKi9ZR8gf2qoxNFKsw
	X0jNXt80ItgdorM0fC4MJF2wrwggFiPbPkgm2W3zpoATt/OACzm5u3Mqxwuu0AWpJow1bavMqPhTE
	ZptQFQVQ2ugGL9aCuCl3eRgJlxcQOiAe77okRRF98NWqyIC+6KygO3sKl32giBz+aAY8hvcMLbJ+7
	4trWOgnZln8O6JfeYYtcoTcYIb7mrQw7sUXtIzEnF8Jngi/+l4jWxE6yCQhE/et/wb/ALKTjRXwB6
	VtMqfMww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzTc-00000006RBZ-14BX;
	Mon, 17 Aug 2026 15:42:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvzTX-00000006R9j-3naF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 15:42:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1786981332; x=1818517332;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=aft+SGCCWz/ySdM2f/xLt6qBj8ixlAwYEDkY4Fj7DCM=;
  b=rWdYTlp7kxVLJj/LmbP+27+wOeuTCv21hWWiPoQ81n15jaKknnMCpaho
   b7kggqEUpkvVE0KjbaPkP9/1wXctLmn2yV/c6jUl6y11zZfnu2LL0ob/B
   xbH+PaJ4ZWXe2y8loEz685pYmRriViL+YMIuaKu2AqndSuwt+gvldoPpM
   uMxFchHXlq3SmCr7Q02PAfbPdfoGwvzGcQfK27NoeZFzo68iaFApte04R
   R94JXf66DZ5MfKnq7S1zIo+nfJNBIhK0IbbMGoSJuMSN8oOj5f31j1WeG
   3TsQ25XIFlgCa5rVHtfRwZ8ghBPPSrgs56cdMunPfBAvNUJwEC7QBoZSD
   Q==;
X-CSE-ConnectionGUID: LadDgCKrQOKBp/4es5iCwg==
X-CSE-MsgGUID: 7fvZZbFwR5yMZZb91e5UCg==
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="293621266"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Aug 2026 08:42:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 17 Aug 2026 08:42:10 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 17 Aug 2026 08:42:06 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Mon, 17 Aug 2026 17:41:58 +0200
Subject: [PATCH net v3 1/2] net: microchip: vcap: use port number instead
 of netdev name for debugfs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260817-misc-fixes-sparx5-lan969x-v3-1-c7c7fef723a8@microchip.com>
References: <20260817-misc-fixes-sparx5-lan969x-v3-0-c7c7fef723a8@microchip.com>
In-Reply-To: <20260817-misc-fixes-sparx5-lan969x-v3-0-c7c7fef723a8@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <linux-rt-devel@lists.linux.dev>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_084211_954801_4C91D7EC 
X-CRM114-Status: GOOD (  15.90  )
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

sparx5_vcap_init() runs before sparx5_register_netdevs() in probe, and
its debugfs setup calls vcap_port_debugfs() for every port using
netdev_name(ndev) as the debugfs file name. At that point the netdevs
have only been allocated, not registered, so dev->name still holds the
"eth%d" template and netdev_name() returns "(unnamed net_device)".
Every port tries to create the same file under vcaps/, producing a
flood of warnings at boot:

  debugfs: '(unnamed net_device)' already exists in 'vcaps'
  debugfs: '(unnamed net_device)' already exists in 'vcaps'
  ...

Add vcap_port_debugfs_portno(), a variant of vcap_port_debugfs() that
takes the port's stable hardware port number and uses "p%u" as the
debugfs file name instead of netdev_name(ndev). This makes the file
name independent of registration order; the file still stores and
later dereferences the netdev itself, same as before. sparx5 already
reports the same "p%d" string via ndo_get_phys_port_name(), so the
debugfs name now matches that.

Only sparx5 (and lan969x, which shares this code) is switched to the
new function. lan966x keeps calling vcap_port_debugfs() unchanged, so
this fix does not rename any of its existing debugfs files.

Fixes: b8909aad5b8d ("net: sparx5: move netdev and notifier block registration to probe")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c    |  5 +++--
 .../net/ethernet/microchip/vcap/vcap_api_debugfs.c  | 21 +++++++++++++++++++++
 .../net/ethernet/microchip/vcap/vcap_api_debugfs.h  | 14 ++++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
index cf332de6bf73..2dee2ce19fce 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
@@ -2077,8 +2077,9 @@ int sparx5_vcap_init(struct sparx5 *sparx5)
 	dir = vcap_debugfs(sparx5->dev, sparx5->debugfs_root, ctrl);
 	for (idx = 0; idx < consts->n_ports; ++idx)
 		if (sparx5->ports[idx])
-			vcap_port_debugfs(sparx5->dev, dir, ctrl,
-					  sparx5->ports[idx]->ndev);
+			vcap_port_debugfs_portno(sparx5->dev, dir, ctrl,
+						 sparx5->ports[idx]->ndev,
+						 sparx5->ports[idx]->portno);
 
 	return err;
 }
diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
index e0c65c7ab23e..476f7496a9d4 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
@@ -400,6 +400,27 @@ void vcap_port_debugfs(struct device *dev, struct dentry *parent,
 }
 EXPORT_SYMBOL_GPL(vcap_port_debugfs);
 
+void vcap_port_debugfs_portno(struct device *dev,
+			      struct dentry *parent,
+			      struct vcap_control *vctrl,
+			      struct net_device *ndev,
+			      unsigned int portno)
+{
+	struct vcap_port_debugfs_info *info;
+	char name[16];
+
+	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return;
+
+	info->vctrl = vctrl;
+	info->ndev = ndev;
+
+	snprintf(name, sizeof(name), "p%u", portno);
+	debugfs_create_file(name, 0444, parent, info, &vcap_port_debugfs_fops);
+}
+EXPORT_SYMBOL_GPL(vcap_port_debugfs_portno);
+
 /* Show the full VCAP instance data (rules with all fields) */
 static int vcap_debugfs_show(struct seq_file *m, void *unused)
 {
diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.h b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.h
index 9f2c59b5f6f5..7dc6e3411a4d 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.h
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.h
@@ -18,6 +18,12 @@ void vcap_port_debugfs(struct device *dev, struct dentry *parent,
 		       struct vcap_control *vctrl,
 		       struct net_device *ndev);
 
+void vcap_port_debugfs_portno(struct device *dev,
+			      struct dentry *parent,
+			      struct vcap_control *vctrl,
+			      struct net_device *ndev,
+			      unsigned int portno);
+
 /* Create a debugFS entry for a vcap instance */
 struct dentry *vcap_debugfs(struct device *dev, struct dentry *parent,
 			    struct vcap_control *vctrl);
@@ -30,6 +36,14 @@ static inline void vcap_port_debugfs(struct device *dev, struct dentry *parent,
 {
 }
 
+static inline void vcap_port_debugfs_portno(struct device *dev,
+					    struct dentry *parent,
+					    struct vcap_control *vctrl,
+					    struct net_device *ndev,
+					    unsigned int portno)
+{
+}
+
 static inline struct dentry *vcap_debugfs(struct device *dev,
 					  struct dentry *parent,
 					  struct vcap_control *vctrl)

-- 
2.34.1


