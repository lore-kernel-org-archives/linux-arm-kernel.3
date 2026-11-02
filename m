Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DCA60A5BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 13:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rEr3Rggj;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jgvdxVZ7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=faRMA1mhLkjqpnghPc6PRr7KsYaRPBjovOnD9EFU2+o=; b=rEr3RggjHCVlmM
	NnK1icrlaTsBdvnTaOWcIbl8RUVJTKaf0IoyqOh3WgfWmDCWSNDfWKlPcQviMitnrjIQaKMgDYHa8
	oUA6iPRv63Vw1ds9kQm5vKvLd0TGeMHSeQ7vy8th+JdxfbjjWh6PXixYTWFq90XHA4dFdJvCvpR0K
	HvJZ0usj1FbzO7OvIKgEgU6u3pzxLwaKxlQc/3CXEKBo+tmTWMIG1V0wmu7NwJUxPozgB6MIJryiv
	/nB3Jhv0FAy4jU4NBa2jaU6bIip/y4uGTP7AhqHpAoxr7qJmEuYyeJm7ny6mT/XAS1O0s/vjJ0Oar
	P+0X60xE1LUnWnWVgf+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrgs-0000000GYYL-1Mcz;
	Mon, 02 Nov 2026 13:03:10 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNrgp-0000000GYVo-2W7o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 13:03:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=jfMbSdvFeToanOblzM2qnSXimwftl4Nc9RBM7D5wNIY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624585; v=1; x=1794229385;
 b=jgvdxVZ7kLoPnyJWWk/pys/Za799lnNoQef7/hIQLHfuYvf5eoA7Gwf6RMXidhmMowE6PUDh
 S9VuFm23aBZJUWhYAEHlNY2dXkcH3fg1EFYTS3eW1wBYWiqVZIMA2rdTPu8QM82QN2jSnKb8Yrj
 JssbfMJlWem4xH2zIxtm/YpM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fe16e33d5f126d1c;
	Mon, 02 Nov 2026 13:03:05 +0000
X-Mizu-Trace-ID: fe16e33d5f126d1c
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/13] KVM: arm64: Reject ITS commands whose IDs are out of range
Date: Mon,  2 Nov 2026 13:01:32 +0000
Message-ID: <20261102130133.3684226-13-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_050307_780657_41F6BDF9 
X-CRM114-Status: GOOD (  19.94  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ITS can't be relied on to reject a command with an out-of-range ID:
IHI 0069H.b 5.3.2 makes the response to a command error CONSTRAINED
UNPREDICTABLE, and one permitted outcome is "The data that generated the
error or errors is treated as having a legal value, and the command is
processed accordingly". An out-of-range DeviceID, EventID or ICID then
has the ITS access memory past the device table, the ITT or the
collection table.

Bound each ID before forwarding the command: the DeviceID by
GITS_TYPER.Devbits and the device table, the EventID by the size its
device was mapped with, and the ICID by the ICID width and the number of
collections. Also reject a command for an event of a device whose unmap
is queued, as its ITE would land in an ITT the hypervisor may already
have released. The driver loses nothing. It never allocates an
out-of-range DeviceID or EventID, or sends a command for a device after
its unmap. Its ICIDs are CPU numbers, which exceed the collections only
on an ITS that already treats its MAPC as a command error (IHI 0069H.b
5.3.9).

MAPTI's pINTID, which the ITS only stores in the ITE, and the RDbase of
MAPC, MOVALL and SYNC are left to the redistributor series, as both
concern the redistributors.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/its_emulate.c | 49 +++++++++++++++++++++++++--
 include/linux/irqchip/arm-gic-v3.h    |  3 ++
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/its_emulate.c b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
index 8f06b738ad118..8bcdb06632b65 100644
--- a/arch/arm64/kvm/hyp/nvhe/its_emulate.c
+++ b/arch/arm64/kvm/hyp/nvhe/its_emulate.c
@@ -55,8 +55,12 @@ struct its_priv {
 	u64			cbaser;
 	u8			id_bits;
 	u8			itt_entry_size;
+	u8			dev_bits;
+	u8			icid_bits;
+	u32			max_collections;
 	struct its_table	tables[GITS_BASER_NR_REGS];
 	struct its_table	*dev_table;
+	struct its_table	*coll_table;
 
 	/* Sorted by device_id, in the rest of the donated pages. */
 	struct its_device_map	*devices;
@@ -254,7 +258,7 @@ static bool its_mapd(struct its_priv *its, struct its_cmd_block *cmd)
 {
 	u32 device_id = its_cmd_get_deviceid(cmd->raw_cmd);
 
-	if (!its_publish_l1(its, device_id))
+	if (device_id >= BIT_ULL(its->dev_bits) || !its_publish_l1(its, device_id))
 		return false;
 
 	if (its_cmd_get_validbit(cmd->raw_cmd))
@@ -265,21 +269,42 @@ static bool its_mapd(struct its_priv *its, struct its_cmd_block *cmd)
 	return true;
 }
 
+/* An event of a device whose unmap is queued is out of range too. */
+static bool its_event_in_range(struct its_priv *its, struct its_cmd_block *cmd)
+{
+	struct its_device_map *dev;
+	bool found;
+
+	dev = &its->devices[its_dev_search(its, its_cmd_get_deviceid(cmd->raw_cmd), &found)];
+	return found && !dev->release_pending &&
+	       its_cmd_get_id(cmd->raw_cmd) < BIT_ULL(dev->event_bits);
+}
+
+static bool its_collection_in_range(struct its_priv *its, struct its_cmd_block *cmd)
+{
+	u32 icid = its_cmd_get_collection(cmd->raw_cmd);
+
+	return icid < BIT_ULL(its->icid_bits) && icid < its->max_collections;
+}
+
 static bool its_process_cmd(struct its_priv *its, struct its_cmd_block *cmd)
 {
 	switch (its_cmd_get_command(cmd->raw_cmd)) {
 	case GITS_CMD_MAPD:
 		return its_mapd(its, cmd);
 	case GITS_CMD_MAPC:
+	case GITS_CMD_INVALL:
+		return its_collection_in_range(its, cmd);
 	case GITS_CMD_MAPTI:
 	case GITS_CMD_MAPI:
 	case GITS_CMD_MOVI:
+		return its_event_in_range(its, cmd) && its_collection_in_range(its, cmd);
 	case GITS_CMD_DISCARD:
 	case GITS_CMD_INV:
-	case GITS_CMD_MOVALL:
-	case GITS_CMD_INVALL:
 	case GITS_CMD_INT:
 	case GITS_CMD_CLEAR:
+		return its_event_in_range(its, cmd);
+	case GITS_CMD_MOVALL:
 	case GITS_CMD_SYNC:
 		return true;
 	default:
@@ -639,6 +664,9 @@ static int its_take_tables(struct its_priv *its, struct its_pkvm_desc *desc)
 			copy_pa = desc->dev_l1_copy_pa;
 			its->dev_table = t;
 			break;
+		case GITS_BASER_TYPE_COLLECTION:
+			its->coll_table = t;
+			break;
 		case GITS_BASER_TYPE_VCPU:
 			/* Taken: writing it while the ITS is enabled is UNPREDICTABLE (5.2.1). */
 			if (its_vpe_table_taken(t->baser))
@@ -654,6 +682,17 @@ static int its_take_tables(struct its_priv *its, struct its_pkvm_desc *desc)
 	return 0;
 }
 
+/* GITS_TYPER.CCT indicates whether the ITS's HCC collections add to the memory table's. */
+static u32 its_collection_count(struct its_priv *its)
+{
+	u32 hcc = GITS_TYPER_HCC(its->typer), in_mem = 0;
+
+	if (its->coll_table)
+		in_mem = its->coll_table->size / its->coll_table->esz;
+
+	return its->typer & GITS_TYPER_CCT ? hcc + in_mem : max(hcc, in_mem);
+}
+
 static int its_take_devices(struct its_priv *its, struct its_pkvm_desc *desc)
 {
 	u32 i;
@@ -709,6 +748,9 @@ int pkvm_its_emulate_setup(phys_addr_t its_base, phys_addr_t desc_pa,
 	its->cbaser = readq_relaxed(its->base + GITS_CBASER);
 	its->id_bits = FIELD_GET(GITS_TYPER_IDBITS, its->typer) + 1;
 	its->itt_entry_size = FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + 1;
+	its->dev_bits = FIELD_GET(GITS_TYPER_DEVBITS, its->typer) + 1;
+	its->icid_bits = its->typer & GITS_TYPER_CIL ?
+			 FIELD_GET(GITS_TYPER_CIDBITS, its->typer) + 1 : 16;
 	its->devices = (void *)(its + 1);
 	its->max_devices = (priv_pages * PAGE_SIZE - sizeof(*its)) / sizeof(*its->devices);
 
@@ -722,6 +764,7 @@ int pkvm_its_emulate_setup(phys_addr_t its_base, phys_addr_t desc_pa,
 	ret = its_take_tables(its, desc);
 	if (ret)
 		return ret;
+	its->max_collections = its_collection_count(its);
 
 	ret = its_take_devices(its, desc);
 	if (ret)
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index 794d37c3bbf55..9e2a42a5ceb40 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -392,6 +392,7 @@
 
 #define GITS_TYPER_PLPIS		(1UL << 0)
 #define GITS_TYPER_VLPIS		(1UL << 1)
+#define GITS_TYPER_CCT			(1UL << 2)
 #define GITS_TYPER_ITT_ENTRY_SIZE_SHIFT	4
 #define GITS_TYPER_ITT_ENTRY_SIZE	GENMASK_ULL(7, 4)
 #define GITS_TYPER_IDBITS		GENMASK_ULL(12, 8)
@@ -401,6 +402,8 @@
 #define GITS_TYPER_PTA			(1UL << 19)
 #define GITS_TYPER_HCC_SHIFT		24
 #define GITS_TYPER_HCC(r)		(((r) >> GITS_TYPER_HCC_SHIFT) & 0xff)
+#define GITS_TYPER_CIDBITS		GENMASK_ULL(35, 32)
+#define GITS_TYPER_CIL			(1ULL << 36)
 #define GITS_TYPER_VMOVP		(1ULL << 37)
 #define GITS_TYPER_VMAPP		(1ULL << 40)
 #define GITS_TYPER_SVPET		GENMASK_ULL(42, 41)
-- 
2.47.3


