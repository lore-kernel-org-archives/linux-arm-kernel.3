Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95678E674AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SxMfeP+pK/jjbt6osAsvGvg62n8msoxFEd5q8xvlKT8=; b=HdveBq0Eu06nN2DfYYA2l9KfEO
	8BtnmjMk4KgzBWFBUp0Vp3bZssGL1tnCwDKi6UrBVmAB2hM68/KVRYDH7rBKiKRrmNrFf6oXyaz0V
	IkhWzObocRJrQo/Jt2O7Bq61SwJeMA0q9prErwvqLJ68P/77gYcrbt0SOkS2rGH8oA4SUIEPGA7og
	30D208JRmYPVyf1wKHLAF+sU5lAf/gJZLJJRYFaMHUQzBu58sXANWxeNzYb5F1Zmn+/IgAaeLJqQS
	HM2SpOyAchJDdZrrXRGn0Sywmf9LJWAddBRuI3M4K9seTa0Wb/ydq9MijTKwbz+8esHTWZRe1aL2D
	QX38X+Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m59-000000066mM-15a6;
	Fri, 01 Nov 2024 07:28:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lnF-000000063d2-2V9g
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730445001; x=1761981001;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=bNDvHwGZPuV+jga52Bz0VxfXArVfgtjiFjQDUPKRnEw=;
  b=vN5qs6h0enEybxqqVLwDKgNf7/UtUfodrJC0bvyUEmzGLGOjq5XdpOjl
   GXs0gCi3W60kMuPCBOCovnYsCD/idsjDXTgNXaTSYJnMhu0AGa66R/q9B
   kdOuB0CGsG7gcuXCwWIlfAKk9mNGLqDNAdf8m9avO9YYVWTUgUtXFOhGV
   5LMxdLnV2epRAq+km6w6VhfrrjcKPZoRjPPbBbN4SHLkkRCYSgtkyXAO8
   w7yDb/RZwmhQiRy4MYH5Rk8QrDmEbq4Du5AkucXAMiPl2lZZ0Cy0Xe5ST
   DJXp/V4JUEBl5nBcCc8u6GmIZKlGTnCo1trz2GQUs9/TlrbGibgSsxV9l
   w==;
X-CSE-ConnectionGUID: LaL60DmvQP6I/WsdV/7gQA==
X-CSE-MsgGUID: ACGpuLYZRUqqf5TabdThyw==
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="37215414"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Nov 2024 00:09:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Nov 2024 00:09:57 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 1 Nov 2024 00:09:55 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 1 Nov 2024 08:09:08 +0100
Subject: [PATCH net-next 2/6] net: sparx5: replace SPX5_PORTS with n_ports
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20241101-sparx5-lan969x-switch-driver-3-v1-2-3c76f22f4bfa@microchip.com>
References: <20241101-sparx5-lan969x-switch-driver-3-v1-0-3c76f22f4bfa@microchip.com>
In-Reply-To: <20241101-sparx5-lan969x-switch-driver-3-v1-0-3c76f22f4bfa@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<jacob.e.keller@intel.com>, <christophe.jaillet@wanadoo.fr>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_001001_838595_690BB99B 
X-CRM114-Status: GOOD (  11.37  )
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

The Sparx5 VCAP implementation uses the SPX5_PORTS symbol to iterate over
the 65 front ports of Sparx5. Replace the use with the n_ports constant
from the match data, which translates to 65 of Sparx5 and 30 on lan969x.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   | 24 ++++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
index 0bdf7a378892..bbff8158a3de 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
@@ -1777,6 +1777,7 @@ void sparx5_vcap_set_port_keyset(struct net_device *ndev,
 static void sparx5_vcap_is0_port_key_selection(struct sparx5 *sparx5,
 					       struct vcap_admin *admin)
 {
+	const struct sparx5_consts *consts = sparx5->data->consts;
 	int portno, lookup;
 	u32 keysel;
 
@@ -1788,7 +1789,7 @@ static void sparx5_vcap_is0_port_key_selection(struct sparx5 *sparx5,
 				 VCAP_IS0_PS_MPLS_FOLLOW_ETYPE,
 				 VCAP_IS0_PS_MLBS_FOLLOW_ETYPE);
 	for (lookup = 0; lookup < admin->lookups; ++lookup) {
-		for (portno = 0; portno < SPX5_PORTS; ++portno) {
+		for (portno = 0; portno < consts->n_ports; ++portno) {
 			spx5_wr(keysel, sparx5,
 				ANA_CL_ADV_CL_CFG(portno, lookup));
 			spx5_rmw(ANA_CL_ADV_CL_CFG_LOOKUP_ENA,
@@ -1803,6 +1804,7 @@ static void sparx5_vcap_is0_port_key_selection(struct sparx5 *sparx5,
 static void sparx5_vcap_is2_port_key_selection(struct sparx5 *sparx5,
 					       struct vcap_admin *admin)
 {
+	const struct sparx5_consts *consts = sparx5->data->consts;
 	int portno, lookup;
 	u32 keysel;
 
@@ -1813,13 +1815,13 @@ static void sparx5_vcap_is2_port_key_selection(struct sparx5 *sparx5,
 				 VCAP_IS2_PS_IPV6_UC_IP_7TUPLE,
 				 VCAP_IS2_PS_ARP_ARP);
 	for (lookup = 0; lookup < admin->lookups; ++lookup) {
-		for (portno = 0; portno < SPX5_PORTS; ++portno) {
+		for (portno = 0; portno < consts->n_ports; ++portno) {
 			spx5_wr(keysel, sparx5,
 				ANA_ACL_VCAP_S2_KEY_SEL(portno, lookup));
 		}
 	}
 	/* IS2 lookups are in bit 0:3 */
-	for (portno = 0; portno < SPX5_PORTS; ++portno)
+	for (portno = 0; portno < consts->n_ports; ++portno)
 		spx5_rmw(ANA_ACL_VCAP_S2_CFG_SEC_ENA_SET(0xf),
 			 ANA_ACL_VCAP_S2_CFG_SEC_ENA,
 			 sparx5,
@@ -1830,11 +1832,12 @@ static void sparx5_vcap_is2_port_key_selection(struct sparx5 *sparx5,
 static void sparx5_vcap_es0_port_key_selection(struct sparx5 *sparx5,
 					       struct vcap_admin *admin)
 {
+	const struct sparx5_consts *consts = sparx5->data->consts;
 	int portno;
 	u32 keysel;
 
 	keysel = VCAP_ES0_KEYSEL(VCAP_ES0_PS_FORCE_ISDX_LOOKUPS);
-	for (portno = 0; portno < SPX5_PORTS; ++portno)
+	for (portno = 0; portno < consts->n_ports; ++portno)
 		spx5_rmw(keysel, REW_RTAG_ETAG_CTRL_ES0_ISDX_KEY_ENA,
 			 sparx5, REW_RTAG_ETAG_CTRL(portno));
 
@@ -1846,6 +1849,7 @@ static void sparx5_vcap_es0_port_key_selection(struct sparx5 *sparx5,
 static void sparx5_vcap_es2_port_key_selection(struct sparx5 *sparx5,
 					       struct vcap_admin *admin)
 {
+	const struct sparx5_consts *consts = sparx5->data->consts;
 	int portno, lookup;
 	u32 keysel;
 
@@ -1853,7 +1857,7 @@ static void sparx5_vcap_es2_port_key_selection(struct sparx5 *sparx5,
 				 VCAP_ES2_PS_IPV4_IP4_TCP_UDP_OTHER,
 				 VCAP_ES2_PS_IPV6_IP_7TUPLE);
 	for (lookup = 0; lookup < admin->lookups; ++lookup)
-		for (portno = 0; portno < SPX5_PORTS; ++portno)
+		for (portno = 0; portno < consts->n_ports; ++portno)
 			spx5_wr(keysel, sparx5,
 				EACL_VCAP_ES2_KEY_SEL(portno, lookup));
 }
@@ -1885,19 +1889,20 @@ static void sparx5_vcap_port_key_selection(struct sparx5 *sparx5,
 static void sparx5_vcap_port_key_deselection(struct sparx5 *sparx5,
 					     struct vcap_admin *admin)
 {
+	const struct sparx5_consts *consts = sparx5->data->consts;
 	int portno, lookup;
 
 	switch (admin->vtype) {
 	case VCAP_TYPE_IS0:
 		for (lookup = 0; lookup < admin->lookups; ++lookup)
-			for (portno = 0; portno < SPX5_PORTS; ++portno)
+			for (portno = 0; portno < consts->n_ports; ++portno)
 				spx5_rmw(ANA_CL_ADV_CL_CFG_LOOKUP_ENA_SET(0),
 					 ANA_CL_ADV_CL_CFG_LOOKUP_ENA,
 					 sparx5,
 					 ANA_CL_ADV_CL_CFG(portno, lookup));
 		break;
 	case VCAP_TYPE_IS2:
-		for (portno = 0; portno < SPX5_PORTS; ++portno)
+		for (portno = 0; portno < consts->n_ports; ++portno)
 			spx5_rmw(ANA_ACL_VCAP_S2_CFG_SEC_ENA_SET(0),
 				 ANA_ACL_VCAP_S2_CFG_SEC_ENA,
 				 sparx5,
@@ -1909,7 +1914,7 @@ static void sparx5_vcap_port_key_deselection(struct sparx5 *sparx5,
 		break;
 	case VCAP_TYPE_ES2:
 		for (lookup = 0; lookup < admin->lookups; ++lookup)
-			for (portno = 0; portno < SPX5_PORTS; ++portno)
+			for (portno = 0; portno < consts->n_ports; ++portno)
 				spx5_rmw(EACL_VCAP_ES2_KEY_SEL_KEY_ENA_SET(0),
 					 EACL_VCAP_ES2_KEY_SEL_KEY_ENA,
 					 sparx5,
@@ -2026,6 +2031,7 @@ static void sparx5_vcap_block_alloc(struct sparx5 *sparx5,
 /* Allocate a vcap control and vcap instances and configure the system */
 int sparx5_vcap_init(struct sparx5 *sparx5)
 {
+	const struct sparx5_consts *consts = sparx5->data->consts;
 	const struct sparx5_vcap_inst *cfg;
 	struct vcap_control *ctrl;
 	struct vcap_admin *admin;
@@ -2069,7 +2075,7 @@ int sparx5_vcap_init(struct sparx5 *sparx5)
 		list_add_tail(&admin->list, &ctrl->list);
 	}
 	dir = vcap_debugfs(sparx5->dev, sparx5->debugfs_root, ctrl);
-	for (idx = 0; idx < SPX5_PORTS; ++idx)
+	for (idx = 0; idx < consts->n_ports; ++idx)
 		if (sparx5->ports[idx])
 			vcap_port_debugfs(sparx5->dev, dir, ctrl,
 					  sparx5->ports[idx]->ndev);

-- 
2.34.1


