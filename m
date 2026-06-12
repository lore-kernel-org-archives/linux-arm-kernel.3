Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902A0CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8IYasltg+1DSCFnkSbgcZ13FVphI7sW1t/35Jeq6vE=; b=Uik5mVhQsUTs+NxoXrRKeh9fU0
	6qvlXeSdQtR1WQZyq/Z2/7x9Q5YzguAwcyFuzPyz43nyWwNk4b8CSpEfaP21dg4A13W4LFafYkI2e
	xZceEjOE3sLLIEzACvlm00eyJIPbBg9yKmguFZ0Sw0qLMJUYlzXYjHE6ERmKiri6ToPtZ8eGLpfL5
	TrBKEX+tOBj185AnXyDJJBr3wYtABBaOqiAelIZlBCc/Y9RXfxDh8N536TkjXeLlJeQCtx9LJLzfi
	w1nga+Dzy9nC4PcVNoQZ/PrWPZ7Tg+pmtfqFGpt8hhAICb5psY37rieBD/Sju6FBAXvEuSJtwT1OO
	J0AaZrAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1A2-0000000Asdn-12Rw;
	Fri, 12 Jun 2026 12:38:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY19y-0000000AsaE-3H4Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 12:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1781267934; x=1812803934;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=J5cODPae9xHWjsNg3eIs8ayyIFFEGxqXbiqynkL8wHk=;
  b=SUPRq9+1uEAlZrCqOoWnC/u1orSrGoI3P1f40/ZAeehS8MX+9ptX6cFt
   5bEkbHxS87sxAxVnWsR+9Km+N3PcIiENg2ocHmuY72LEuWqvfx8/sZEID
   f9xPRyjWF+ZZJxcQQU+nTzxNAuuXU0eLntmlyB/xFU+Jng1gWccK+nA0H
   LIBN2CafAk6OfNGyJz5YComBm2LCbbFJeUmBE9vj5NKMr1FfxrmGZdLLk
   Oh4atXe0Ir9BdHLzcZYIhryURySS8iM44aKU3PvwofqBKO6p8DYZUaVIk
   r3tUKoHlvSyQhtMK9r/xEX6GH9Ug5Dk0Soe99q9fhydIj4lR4VACQSBUF
   w==;
X-CSE-ConnectionGUID: sPQK71H8SieGQ4obK2zgNQ==
X-CSE-MsgGUID: aUH1FealR+eYHPGMmQgwSw==
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="58199249"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 05:38:54 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.41; Fri, 12 Jun 2026 05:38:53 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 12 Jun 2026 05:38:50 -0700
From: =?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
Date: Fri, 12 Jun 2026 14:37:15 +0200
Subject: [PATCH net-next 6/9] net: sparx5: vcap: add lpm vcap
 implementation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260612-sparx5_l3_routing-v1-6-fc3c10160f49@microchip.com>
References: <20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com>
In-Reply-To: <20260612-sparx5_l3_routing-v1-0-fc3c10160f49@microchip.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Daniel Machon
	<daniel.machon@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-hardening@vger.kernel.org>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_053854_913713_A8D120F1 
X-CRM114-Status: GOOD (  23.39  )
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

Add the implementation for the LPM VCAP for lan969x and sparx5. The LPM
VCAP has a static keyset configuration, and a single lookup dedicated to
LPM, so this is straight forward, and many functions can use existing
functionality.

The LPM VCAP is allocated from the Super VCAP Blocks, which is shared
amongst different VCAPs. All blocks are used, so we steal a block from
IS0, which had 2 assigned. Since we statically assign blocks, this means
IS0 has half the available address space for vcap rules, compared to
before.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
---
 .../microchip/sparx5/lan969x/lan969x_vcap_impl.c   |  12 ++
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.c   | 159 ++++++++++++++++++++-
 .../ethernet/microchip/sparx5/sparx5_vcap_impl.h   |   5 +
 3 files changed, 174 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_vcap_impl.c
index 543a1f2bf6bd..6e6a1f833dea 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x_vcap_impl.c
@@ -82,4 +82,16 @@ const struct sparx5_vcap_inst lan969x_vcap_inst_cfg[] = {
 		.count = 1024,
 		.ingress = false,
 	},
+	{
+		.vtype = VCAP_TYPE_LPM,
+		.vinst = 0,
+		.map_id = 6,
+		.lookups = SPARX5_LPM_LOOKUPS,
+		.lookups_per_instance = SPARX5_LPM_LOOKUPS,
+		.first_cid = SPARX5_VCAP_CID_LPM_L0,
+		.last_cid = SPARX5_VCAP_CID_LPM_MAX,
+		.blockno = 5,
+		.blocks = 1,
+		.ingress = true,
+	},
 };
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
index 95b93e46a41d..e25e759c24f6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
@@ -54,8 +54,8 @@ const struct sparx5_vcap_inst sparx5_vcap_inst_cfg[] = {
 		.lookups_per_instance = SPARX5_IS0_LOOKUPS / 3,
 		.first_cid = SPARX5_VCAP_CID_IS0_L0,
 		.last_cid = SPARX5_VCAP_CID_IS0_L2 - 1,
-		.blockno = 8, /* Maps block 8-9 */
-		.blocks = 2,
+		.blockno = 8, /* Maps block 8 */
+		.blocks = 1,
 		.ingress = true,
 	},
 	{
@@ -124,6 +124,18 @@ const struct sparx5_vcap_inst sparx5_vcap_inst_cfg[] = {
 		.count = 12288, /* Addresses according to datasheet */
 		.ingress = false,
 	},
+	{
+		.vtype = VCAP_TYPE_LPM,
+		.vinst = 0,
+		.map_id = 6,
+		.lookups = SPARX5_LPM_LOOKUPS,
+		.lookups_per_instance = SPARX5_LPM_LOOKUPS,
+		.first_cid = SPARX5_VCAP_CID_LPM_L0,
+		.last_cid = SPARX5_VCAP_CID_LPM_MAX,
+		.blockno = 9,
+		.blocks = 1,
+		.ingress = true,
+	},
 };
 
 /* These protocols have dedicated keysets in IS0 and a TC dissector */
@@ -149,6 +161,12 @@ static u16 sparx5_vcap_es2_known_etypes[] = {
 	ETH_P_IPV6,
 };
 
+static u16 sparx5_vcap_lpm_known_etypes[] = {
+	ETH_P_ALL,
+	ETH_P_IP,
+	ETH_P_IPV6,
+};
+
 static void sparx5_vcap_type_err(struct sparx5 *sparx5,
 				 struct vcap_admin *admin,
 				 const char *fname)
@@ -195,6 +213,7 @@ static void _sparx5_vcap_range_init(struct sparx5 *sparx5,
 	u32 size = count - 1;
 
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
 	case VCAP_TYPE_IS0:
 	case VCAP_TYPE_IS2:
 		spx5_wr(VCAP_SUPER_CFG_MV_NUM_POS_SET(0) |
@@ -386,6 +405,11 @@ static int sparx5_vcap_es2_cid_to_lookup(int cid)
 	return lookup;
 }
 
+static int sparx5_vcap_lpm_cid_to_lookup(int cid)
+{
+	return 0;
+}
+
 /* Add ethernet type IS0 keyset to a list */
 static void
 sparx5_vcap_is0_get_port_etype_keysets(struct vcap_keyset_list *keysetlist,
@@ -401,6 +425,28 @@ sparx5_vcap_is0_get_port_etype_keysets(struct vcap_keyset_list *keysetlist,
 	}
 }
 
+static int sparx5_vcap_lpm_get_port_keysets(struct net_device *ndev,
+					    int lookup,
+					    struct vcap_keyset_list *keysetlist,
+					    u16 l3_proto)
+{
+	/* LPM keysets are static. */
+	if (l3_proto == ETH_P_ALL) {
+		vcap_keyset_list_add(keysetlist, VCAP_KFS_DBL_IP4);
+		vcap_keyset_list_add(keysetlist, VCAP_KFS_SGL_IP4);
+		vcap_keyset_list_add(keysetlist, VCAP_KFS_DBL_IP6);
+		vcap_keyset_list_add(keysetlist, VCAP_KFS_SGL_IP6);
+	} else if (l3_proto == ETH_P_IP) {
+		vcap_keyset_list_add(keysetlist, VCAP_KFS_DBL_IP4);
+		vcap_keyset_list_add(keysetlist, VCAP_KFS_SGL_IP4);
+	} else if (l3_proto == ETH_P_IPV6) {
+		vcap_keyset_list_add(keysetlist, VCAP_KFS_DBL_IP6);
+		vcap_keyset_list_add(keysetlist, VCAP_KFS_SGL_IP6);
+	}
+
+	return 0;
+}
+
 /* Return the list of keysets for the vcap port configuration */
 static int sparx5_vcap_is0_get_port_keysets(struct net_device *ndev,
 					    int lookup,
@@ -683,6 +729,11 @@ int sparx5_vcap_get_port_keyset(struct net_device *ndev,
 	struct sparx5_port *port;
 
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
+		lookup = sparx5_vcap_lpm_cid_to_lookup(cid);
+		err = sparx5_vcap_lpm_get_port_keysets(ndev, lookup, kslist,
+						       l3_proto);
+		break;
 	case VCAP_TYPE_IS0:
 		lookup = sparx5_vcap_is0_cid_to_lookup(cid);
 		err = sparx5_vcap_is0_get_port_keysets(ndev, lookup, kslist,
@@ -716,6 +767,10 @@ bool sparx5_vcap_is_known_etype(struct vcap_admin *admin, u16 etype)
 	int size, idx;
 
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
+		known_etypes = sparx5_vcap_lpm_known_etypes;
+		size = ARRAY_SIZE(sparx5_vcap_lpm_known_etypes);
+		break;
 	case VCAP_TYPE_IS0:
 		known_etypes = sparx5_vcap_is0_known_etypes;
 		size = ARRAY_SIZE(sparx5_vcap_is0_known_etypes);
@@ -760,6 +815,11 @@ sparx5_vcap_validate_keyset(struct net_device *ndev,
 
 	/* Get a list of currently configured keysets in the lookups */
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
+		lookup = sparx5_vcap_lpm_cid_to_lookup(rule->vcap_chain_id);
+		sparx5_vcap_lpm_get_port_keysets(ndev, lookup, &keysetlist,
+						 l3_proto);
+		break;
 	case VCAP_TYPE_IS0:
 		lookup = sparx5_vcap_is0_cid_to_lookup(rule->vcap_chain_id);
 		sparx5_vcap_is0_get_port_keysets(ndev, lookup, &keysetlist,
@@ -873,6 +933,9 @@ static void sparx5_vcap_add_default_fields(struct net_device *ndev,
 
 	/* add the lookup bit */
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
+		/* LPM VCAP has no default fields */
+		break;
 	case VCAP_TYPE_IS0:
 	case VCAP_TYPE_IS2:
 		sparx5_vcap_ingress_add_default_fields(ndev, admin, rule);
@@ -1083,6 +1146,46 @@ static void sparx5_vcap_es2_cache_write(struct sparx5 *sparx5,
 	}
 }
 
+static void sparx5_vcap_lpm_cache_write(struct sparx5 *sparx5,
+					struct vcap_admin *admin,
+					enum vcap_selection sel,
+					u32 start,
+					u32 count)
+{
+	u32 *keystr, *mskstr, *actstr;
+	int idx;
+
+	keystr = &admin->cache.keystream[start];
+	mskstr = &admin->cache.maskstream[start];
+	actstr = &admin->cache.actionstream[start];
+
+	switch (sel) {
+	case VCAP_SEL_ENTRY:
+		for (idx = 0; idx < count; ++idx) {
+			/* Avoid 'match-off' by setting value & mask */
+			spx5_wr(keystr[idx] & mskstr[idx], sparx5,
+				VCAP_SUPER_VCAP_ENTRY_DAT(idx));
+			spx5_wr(~mskstr[idx], sparx5,
+				VCAP_SUPER_VCAP_MASK_DAT(idx));
+		}
+		break;
+	case VCAP_SEL_ACTION:
+		for (idx = 0; idx < count; ++idx)
+			spx5_wr(actstr[idx], sparx5,
+				VCAP_SUPER_VCAP_ACTION_DAT(idx));
+		break;
+	case VCAP_SEL_ALL:
+		pr_err("%s:%d: cannot write all streams at once\n", __func__,
+		       __LINE__);
+		break;
+	default:
+		break;
+	}
+	if (sel & VCAP_SEL_COUNTER)
+		spx5_wr(admin->cache.counter, sparx5,
+			VCAP_SUPER_VCAP_CNT_DAT(0));
+}
+
 /* API callback used for writing to the VCAP cache */
 static void sparx5_vcap_cache_write(struct net_device *ndev,
 				    struct vcap_admin *admin,
@@ -1094,6 +1197,9 @@ static void sparx5_vcap_cache_write(struct net_device *ndev,
 	struct sparx5 *sparx5 = port->sparx5;
 
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
+		sparx5_vcap_lpm_cache_write(sparx5, admin, sel, start, count);
+		break;
 	case VCAP_TYPE_IS0:
 		sparx5_vcap_is0_cache_write(sparx5, admin, sel, start, count);
 		break;
@@ -1273,6 +1379,41 @@ static void sparx5_vcap_es2_cache_read(struct sparx5 *sparx5,
 	}
 }
 
+static void sparx5_vcap_lpm_cache_read(struct sparx5 *sparx5,
+				       struct vcap_admin *admin,
+				       enum vcap_selection sel,
+				       u32 start,
+				       u32 count)
+{
+	u32 *keystr, *mskstr, *actstr;
+	int idx;
+
+	keystr = &admin->cache.keystream[start];
+	mskstr = &admin->cache.maskstream[start];
+	actstr = &admin->cache.actionstream[start];
+
+	if (sel & VCAP_SEL_ENTRY) {
+		for (idx = 0; idx < count; ++idx) {
+			keystr[idx] = spx5_rd(sparx5,
+					      VCAP_SUPER_VCAP_ENTRY_DAT(idx));
+			mskstr[idx] = ~spx5_rd(sparx5,
+					       VCAP_SUPER_VCAP_MASK_DAT(idx));
+		}
+	}
+
+	if (sel & VCAP_SEL_ACTION)
+		for (idx = 0; idx < count; ++idx)
+			actstr[idx] = spx5_rd(sparx5,
+					      VCAP_SUPER_VCAP_ACTION_DAT(idx));
+
+	if (sel & VCAP_SEL_COUNTER) {
+		u32 val = spx5_rd(sparx5, VCAP_SUPER_VCAP_CNT_DAT(0));
+
+		admin->cache.counter = val;
+		admin->cache.sticky = !!val;
+	}
+}
+
 /* API callback used for reading from the VCAP into the VCAP cache */
 static void sparx5_vcap_cache_read(struct net_device *ndev,
 				   struct vcap_admin *admin,
@@ -1284,6 +1425,9 @@ static void sparx5_vcap_cache_read(struct net_device *ndev,
 	struct sparx5 *sparx5 = port->sparx5;
 
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
+		sparx5_vcap_lpm_cache_read(sparx5, admin, sel, start, count);
+		break;
 	case VCAP_TYPE_IS0:
 		sparx5_vcap_is0_cache_read(sparx5, admin, sel, start, count);
 		break;
@@ -1379,6 +1523,7 @@ static void sparx5_vcap_update(struct net_device *ndev,
 	struct sparx5 *sparx5 = port->sparx5;
 
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
 	case VCAP_TYPE_IS0:
 	case VCAP_TYPE_IS2:
 		sparx5_vcap_super_update(sparx5, cmd, sel, addr);
@@ -1475,6 +1620,7 @@ static void sparx5_vcap_move(struct net_device *ndev, struct vcap_admin *admin,
 	}
 
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
 	case VCAP_TYPE_IS0:
 	case VCAP_TYPE_IS2:
 		sparx5_vcap_super_move(sparx5, addr, cmd, mv_num_pos, mv_size);
@@ -1743,6 +1889,8 @@ void sparx5_vcap_set_port_keyset(struct net_device *ndev,
 	int lookup;
 
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
+		break;
 	case VCAP_TYPE_IS0:
 		lookup = sparx5_vcap_is0_cid_to_lookup(cid);
 		if (orig)
@@ -1879,6 +2027,9 @@ static void sparx5_vcap_port_key_selection(struct sparx5 *sparx5,
 	case VCAP_TYPE_ES2:
 		sparx5_vcap_es2_port_key_selection(sparx5, admin);
 		break;
+	case VCAP_TYPE_LPM:
+		/* VCAP LPM key selection is static */
+		break;
 	default:
 		sparx5_vcap_type_err(sparx5, admin, __func__);
 		break;
@@ -1920,6 +2071,9 @@ static void sparx5_vcap_port_key_deselection(struct sparx5 *sparx5,
 					 sparx5,
 					 EACL_VCAP_ES2_KEY_SEL(portno, lookup));
 		break;
+	case VCAP_TYPE_LPM:
+		/* LPM key selection is static */
+		break;
 	default:
 		sparx5_vcap_type_err(sparx5, admin, __func__);
 		break;
@@ -1980,6 +2134,7 @@ static void sparx5_vcap_block_alloc(struct sparx5 *sparx5,
 	int idx, cores;
 
 	switch (admin->vtype) {
+	case VCAP_TYPE_LPM:
 	case VCAP_TYPE_IS0:
 	case VCAP_TYPE_IS2:
 		/* Super VCAP block mapping and address configuration. Block 0
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.h b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.h
index d0a42406bf26..94c77a60e4f8 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.h
@@ -20,6 +20,7 @@
 #define SPARX5_IS0_LOOKUPS 6
 #define SPARX5_ES0_LOOKUPS 1
 #define SPARX5_ES2_LOOKUPS 2
+#define SPARX5_LPM_LOOKUPS 1
 
 #define SPARX5_VCAP_CID_IS0_L0 VCAP_CID_INGRESS_L0 /* IS0/CLM lookup 0 */
 #define SPARX5_VCAP_CID_IS0_L1 VCAP_CID_INGRESS_L1 /* IS0/CLM lookup 1 */
@@ -30,6 +31,10 @@
 #define SPARX5_VCAP_CID_IS0_MAX \
 	(VCAP_CID_INGRESS_L5 + VCAP_CID_LOOKUP_SIZE - 1) /* IS0/CLM Max */
 
+#define SPARX5_VCAP_CID_LPM_L0 VCAP_CID_PREROUTING_L0 /* LPM lookup 0 */
+#define SPARX5_VCAP_CID_LPM_MAX \
+	(VCAP_CID_PREROUTING_L0 + VCAP_CID_LOOKUP_SIZE - 1) /* LPM Max */
+
 #define SPARX5_VCAP_CID_IS2_L0 VCAP_CID_INGRESS_STAGE2_L0 /* IS2 lookup 0 */
 #define SPARX5_VCAP_CID_IS2_L1 VCAP_CID_INGRESS_STAGE2_L1 /* IS2 lookup 1 */
 #define SPARX5_VCAP_CID_IS2_L2 VCAP_CID_INGRESS_STAGE2_L2 /* IS2 lookup 2 */

-- 
2.52.0


