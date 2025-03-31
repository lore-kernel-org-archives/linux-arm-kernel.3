Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A617C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qrz2Jjzo6wrUZ14eaGmNUqzQPnqra+wcv/JiWOhUbxM=; b=fHSSLlpgtGV+qFzbdlWIl/8mlL
	HLvwIn3XGWguvnSuh4VTNwTzFeZqb+7S//QBFy6lZAreI2eamsvaOAT9SGtSImvW8Y6e8xC7GGoIg
	FiUaCN79Z+4cD+BkkTixrQyiqmCOlkBCz6QDdXoBkX/8pOx8nxOVP6zMFbmCjeaL+09qg9B9N8tv6
	25Ns6SDa+aWvLIhUwUt7mxsITwVB0Nku+92AzUT+fOAHA84iU/7tYbOhdyGMs/F7gGx6AqZQBveAi
	BNtc+VP2ZqygrVCAZ85a1zY/IKE+s5/knraaSKwI0F7jo89gpS9dVLIe8KuZ/S8OWU7TWlDy3o10Q
	v/nTQZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCBc-000000002QH-2hv5;
	Mon, 31 Mar 2025 10:16:08 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzC9t-000000002CR-3xZ1;
	Mon, 31 Mar 2025 10:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43FBCA430A4;
	Mon, 31 Mar 2025 10:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDE1C4CEE5;
	Mon, 31 Mar 2025 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743416060;
	bh=56IfTRauGxaQRKelmBbZK/tQWYp/lbJMPy7TjK50Wqc=;
	h=From:Date:Subject:To:Cc:From;
	b=UM5PkaxQaot4GJoJ+pHs9qPNmy+XoOLrc2NZ7l9Mikjh9Q6ro0mj/NEQyD+mWDF4n
	 A2JEbK/A0Lud86zCoJEVtjBNiIYh7t0+Fouw68z1hC+mmAsYvLLoDSt1oNk5Op3uxz
	 MKUmfoHUs5SPE/B3B8SjuvCD7Kj79NMRAaGk83yjA97UYFcHG1RINlUoNUPvn80iV3
	 uIPvHC4IFUNLWtAEE3W19QGnUhQp2ZHn2KZjnUAq31SIezXVpEtg7gr4I9aR38Dnx3
	 UMmAJu5whsDInYk/XgHgfCx09hFossNbly/7CZn/M4ZHB/+fq/us1yReLb6zI2taWu
	 FCBZQs+lAJjNg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 31 Mar 2025 12:14:09 +0200
Subject: [PATCH net v3] net: airoha: Validate egress gdm port in
 airoha_ppe_foe_entry_prepare()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250331-airoha-validate-egress-gdm-port-v3-1-c14e6ba9733a@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPBq6mcC/x3NQQqDQAxA0atI1gZGQ231KtJFmEnHQOtIIlIQ7
 96hy7f5/wQXU3GYmhNMDnUtawW1DcSF1yyoqRr60N8CUYesVhbGg9+aeBeUbOKOOX1wK7Yj0RA
 f93EcQmSolc3kpd//YX5e1w9fdG6DcQAAAA==
X-Change-ID: 20250331-airoha-validate-egress-gdm-port-336c879960ca
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_031422_145653_1D80E692 
X-CRM114-Status: GOOD (  17.00  )
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

Device pointer in airoha_ppe_foe_entry_prepare routine is not strictly
necessary a device allocated by airoha_eth driver since it is an egress
device and the flowtable can contain even wlan, pppoe or vlan devices.
E.g:

flowtable ft {
        hook ingress priority filter
        devices = { eth1, lan1, lan2, lan3, lan4, wlan0 }
        flags offload                               ^
                                                    |
                     "not allocated by airoha_eth" --
}

In this case airoha_get_dsa_port() will just return the original device
pointer and we can't assume netdev priv pointer points to an
airoha_gdm_port struct.
Fix the issue validating egress gdm port in airoha_ppe_foe_entry_prepare
routine before accessing net_device priv pointer.

Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v3:
- Rebase on top of net tree
- Fix commit log
- Link to v2: https://lore.kernel.org/r/20250315-airoha-flowtable-null-ptr-fix-v2-1-94b923d30234@kernel.org

Changes in v2:
- Avoid checking netdev_priv pointer since it is always not NULL
- Link to v1: https://lore.kernel.org/r/20250312-airoha-flowtable-null-ptr-fix-v1-1-6363fab884d0@kernel.org
---
 drivers/net/ethernet/airoha/airoha_eth.c | 13 +++++++++++++
 drivers/net/ethernet/airoha/airoha_eth.h |  3 +++
 drivers/net/ethernet/airoha/airoha_ppe.c | 10 ++++++++--
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index c0a642568ac115ea9df6fbaf7133627a4405a36c..bf9c882e9c8b087dbf5e907636547a0117d1b96a 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2454,6 +2454,19 @@ static void airoha_metadata_dst_free(struct airoha_gdm_port *port)
 	}
 }
 
+int airoha_is_valid_gdm_port(struct airoha_eth *eth,
+			     struct airoha_gdm_port *port)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
+		if (eth->ports[i] == port)
+			return 0;
+	}
+
+	return -EINVAL;
+}
+
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 				 struct device_node *np, int index)
 {
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index 60690b685710c72a2e15c6c6c94240108dafa1c1..d199b8adffc0b25c369dc19cdc074c50af40e3bf 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -532,6 +532,9 @@ u32 airoha_rmw(void __iomem *base, u32 offset, u32 mask, u32 val);
 #define airoha_qdma_clear(qdma, offset, val)			\
 	airoha_rmw((qdma)->regs, (offset), (val), 0)
 
+int airoha_is_valid_gdm_port(struct airoha_eth *eth,
+			     struct airoha_gdm_port *port);
+
 void airoha_ppe_check_skb(struct airoha_ppe *ppe, u16 hash);
 int airoha_ppe_setup_tc_block_cb(enum tc_setup_type type, void *type_data,
 				 void *cb_priv);
diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 8b55e871352d359fa692c253d3f3315c619472b3..65833e2058194a64569eafec08b80df8190bba6c 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -197,7 +197,8 @@ static int airoha_get_dsa_port(struct net_device **dev)
 #endif
 }
 
-static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
+static int airoha_ppe_foe_entry_prepare(struct airoha_eth *eth,
+					struct airoha_foe_entry *hwe,
 					struct net_device *dev, int type,
 					struct airoha_flow_data *data,
 					int l4proto)
@@ -224,6 +225,11 @@ static int airoha_ppe_foe_entry_prepare(struct airoha_foe_entry *hwe,
 	if (dev) {
 		struct airoha_gdm_port *port = netdev_priv(dev);
 		u8 pse_port;
+		int err;
+
+		err = airoha_is_valid_gdm_port(eth, port);
+		if (err)
+			return err;
 
 		if (dsa_port >= 0)
 			pse_port = port->id == 4 ? FE_PSE_PORT_GDM4 : port->id;
@@ -633,7 +639,7 @@ static int airoha_ppe_flow_offload_replace(struct airoha_gdm_port *port,
 	    !is_valid_ether_addr(data.eth.h_dest))
 		return -EINVAL;
 
-	err = airoha_ppe_foe_entry_prepare(&hwe, odev, offload_type,
+	err = airoha_ppe_foe_entry_prepare(eth, &hwe, odev, offload_type,
 					   &data, l4proto);
 	if (err)
 		return err;

---
base-commit: 2ea396448f26d0d7d66224cb56500a6789c7ed07
change-id: 20250331-airoha-validate-egress-gdm-port-336c879960ca

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


