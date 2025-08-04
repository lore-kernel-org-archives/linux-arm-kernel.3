Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F9BC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 10:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh1Rgjosg540zxHZD2xDXccwZ+z6nBjhSknKZkXFQgY=; b=5EK2pKc/NxsC2xlViotVx724Ii
	LM/T7kBcqU7YQ3s7yeyrUihGv+rinEFea2061geBibeVSX+l2dX8ljETsW3lOAs01VX7KE3B0Mpj7
	axKzwlRHNC+52MwrkAfxxUHTkeakPfBB5Otd8Cada/CM9YUUpE6cMAeO9BHKds4Jz7C0LcY18bwhc
	zCGEYHcLpRFJS7Hx/mw2zJrGDoj09RR8/nuNdXTsQn1z7SckakKkFtAPRILJ9bhq8ZGKg64klk12C
	JuVIJ0y86saRdb8Yuyp09oy7MQ8fgRPhXeif2NzYd+YVentKj3pcklpkhmQ/+8mpI9/NVTRqVKAPG
	/Lc9vUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis9i-0000000AAAc-0eTs;
	Mon, 04 Aug 2025 10:10:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uis2C-0000000A8ra-1xGC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 10:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1754301792; x=1785837792;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GoN/D1fysbMjHLdBfvRUxq+AyYb+K0pTz06myBTGEEQ=;
  b=FXSVU6mFSxDxClNn/l5OQyJIuczlrZadCJrPBxC1f+XfDlvrG+p1A7hJ
   ZyrZZn3RDoQ8t7ROOAw/jHunsmnPZSzWP6cH3DvnA27MVlGAlUl/UBCkO
   qP2yjGgMJfcuXh8aizu1L8RCfP6OrKDTFf1CGCjg8bIlU+mnX4ZwUsuYA
   n3mWCdThlQWqo1YVzoeTVJVSXZ2ys3//KMbkjIvtrh8T/vXEeI1Oz6ESq
   UlcwFMwosu6yDt3YvzoDYSWFhyxUN30ePI/JERDTZW9ynXfo366nPoPFD
   8W5Vz+2gjtuP7q52OdXwrrAA/589u/OMOHBRW+vkSnOszSgCLL9u0tBs7
   w==;
X-CSE-ConnectionGUID: Liqowa5KRuKZ85yXFKRAhg==
X-CSE-MsgGUID: QJiDf9GrRGW3RZ2GGFZX4A==
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="50182871"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Aug 2025 03:03:11 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 4 Aug 2025 03:02:41 -0700
Received: from che-ll-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 4 Aug 2025 03:02:35 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <eugen.hristev@linaro.org>, <jic23@kernel.org>, <dlechner@baylibre.com>,
	<nuno.sa@analog.com>, <andy@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<srini@kernel.org>, <linux-iio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>
Subject: [PATCH 02/15] nvmem: microchip-otpc: rework to access packets based on tag
Date: Mon, 4 Aug 2025 15:32:06 +0530
Message-ID: <20250804100219.63325-3-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804100219.63325-1-varshini.rajendran@microchip.com>
References: <20250804100219.63325-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_030312_512758_A5B87211 
X-CRM114-Status: GOOD (  30.94  )
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

Rework the driver to change the packet access technique based on the TAG
instead of the currently in use "id".

Since there is no way of knowing the OTP memory mapping in advance or the
changes it can go through with time, the id based approach is not reliable.
Accessing the packets based on the associated tags is a fail-proof
approach. This method is aided by adding a table of contents to store the
payload information which makes it easier to traverse through the OTP
memory and read the data of the intended packet. The stride of the nvmem
device is adjusted to 1 to support the TAG being treated as an offset.
The only reliable way to recognize a packet without being aware of the
flashed contents of the OTP memory is the TAG of the packet.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/nvmem/microchip-otpc.c | 130 +++++++++++++++++++++++++--------
 1 file changed, 101 insertions(+), 29 deletions(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index df979e8549fd..e922c882af72 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -18,16 +18,27 @@
 #define MCHP_OTPC_CR_READ		BIT(6)
 #define MCHP_OTPC_MR			(0x4)
 #define MCHP_OTPC_MR_ADDR		GENMASK(31, 16)
+#define MCHP_OTPC_MR_EMUL		BIT(7)
 #define MCHP_OTPC_AR			(0x8)
 #define MCHP_OTPC_SR			(0xc)
 #define MCHP_OTPC_SR_READ		BIT(6)
 #define MCHP_OTPC_HR			(0x20)
 #define MCHP_OTPC_HR_SIZE		GENMASK(15, 8)
+#define MCHP_OTPC_HR_PACKET_TYPE	GENMASK(2, 0)
 #define MCHP_OTPC_DR			(0x24)
 
 #define MCHP_OTPC_NAME			"mchp-otpc"
 #define MCHP_OTPC_SIZE			(11 * 1024)
 
+enum packet_type {
+	PACKET_TYPE_REGULAR = 1,
+	PACKET_TYPE_KEY	= 2,
+	PACKET_TYPE_BOOT_CONFIG = 3,
+	PACKET_TYPE_SECURE_BOOT_CONFIG = 4,
+	PACKET_TYPE_HARDWARE_CONFIG = 5,
+	PACKET_TYPE_CUSTOM = 6,
+};
+
 /**
  * struct mchp_otpc - OTPC private data structure
  * @base: base address
@@ -42,6 +53,25 @@ struct mchp_otpc {
 	u32 npackets;
 };
 
+/**
+ * struct mchp_otpc_payload_info - OTP packet's payload information
+ *				retrieved from the packet's header
+ * @id: driver assigned packet ID
+ * @packet_offset: offset address of the packet to be written in the
+ *			register OTPC_MR.ADDR to access the packet
+ * @payload_length: length of the packet's payload
+ * @packet_type: type of the packet
+ * @packet_tag: TAG corresponding to the packet. Applicable for most
+ *		of the regular packets
+ */
+struct mchp_otpc_payload_info {
+	u32 id;
+	u32 packet_offset;
+	u32 payload_length;
+	u32 packet_type;
+	u32 packet_tag;
+};
+
 /**
  * struct mchp_otpc_packet - OTPC packet data structure
  * @list: list head
@@ -50,20 +80,16 @@ struct mchp_otpc {
  */
 struct mchp_otpc_packet {
 	struct list_head list;
-	u32 id;
-	u32 offset;
+	struct mchp_otpc_payload_info payload_info;
 };
 
-static struct mchp_otpc_packet *mchp_otpc_id_to_packet(struct mchp_otpc *otpc,
-						       u32 id)
+static struct mchp_otpc_packet *mchp_otpc_tag_to_packet(struct mchp_otpc *otpc,
+							u32 tag)
 {
 	struct mchp_otpc_packet *packet;
 
-	if (id >= otpc->npackets)
-		return NULL;
-
 	list_for_each_entry(packet, &otpc->packets, list) {
-		if (packet->id == id)
+		if (packet->payload_info.packet_tag == tag)
 			return packet;
 	}
 
@@ -140,8 +166,27 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
  * offset returned by hardware.
  *
  * For this, the read function will return the first requested bytes in the
- * packet. The user will have to be aware of the memory footprint before doing
- * the read request.
+ * packet. The user won't have to be aware of the memory footprint before doing
+ * the read request since it is abstracted and taken care by this driver.
+ *
+ * There is no way of knowing the Mapping of the OTP memory table in advance. In
+ * this read function the offset requested is treated as the identifier string
+ * i.e., Packet TAG, to acquire the payload with reliability. The packet Tag
+ * is the only way to recognize a packet without being aware of the flashed
+ * OTP memory map table.
+ */
+
+/**
+ * mchp_otpc_read() - Read the OTP packets and fill the buffer based on the TAG
+ *		      of the packet treated as the offset.
+ * @priv: Pointer to device structure.
+ * @off: offset of the OTP packet to be read. In this case, the TAG of the
+ *	 corresponding packet.
+ * @val: Pointer to data buffer
+ * @bytes: length of the buffer
+ *
+ * A value of zero will be returned on success, a negative errno will be
+ * returned in error cases.
  */
 static int mchp_otpc_read(void *priv, unsigned int off, void *val,
 			  size_t bytes)
@@ -154,30 +199,23 @@ static int mchp_otpc_read(void *priv, unsigned int off, void *val,
 	int ret, payload_size;
 
 	/*
-	 * We reach this point with off being multiple of stride = 4 to
-	 * be able to cross the subsystem. Inside the driver we use continuous
-	 * unsigned integer numbers for packet id, thus divide off by 4
-	 * before passing it to mchp_otpc_id_to_packet().
+	 * From this point the packet tag received as the offset has to be translated
+	 * into the actual packet. For this we traverse the table of contents stored
+	 * in a list "packet" and look for the tag.
 	 */
-	packet = mchp_otpc_id_to_packet(otpc, off / 4);
+
+	packet = mchp_otpc_tag_to_packet(otpc, off);
 	if (!packet)
 		return -EINVAL;
-	offset = packet->offset;
+	offset = packet->payload_info.packet_offset;
 
-	while (len < bytes) {
+	if (len < bytes) {
 		ret = mchp_otpc_prepare_read(otpc, offset);
 		if (ret)
 			return ret;
 
-		/* Read and save header content. */
-		*buf++ = readl_relaxed(otpc->base + MCHP_OTPC_HR);
-		len += sizeof(*buf);
-		offset++;
-		if (len >= bytes)
-			break;
-
 		/* Read and save payload content. */
-		payload_size = FIELD_GET(MCHP_OTPC_HR_SIZE, *(buf - 1));
+		payload_size = packet->payload_info.payload_length;
 		writel_relaxed(0UL, otpc->base + MCHP_OTPC_AR);
 		do {
 			*buf++ = readl_relaxed(otpc->base + MCHP_OTPC_DR);
@@ -190,6 +228,20 @@ static int mchp_otpc_read(void *priv, unsigned int off, void *val,
 	return 0;
 }
 
+static int mchp_otpc_read_packet_tag(struct mchp_otpc *otpc, unsigned int offset, unsigned int *val)
+{
+	int ret;
+
+	ret = mchp_otpc_prepare_read(otpc, offset);
+	if (ret)
+		return ret;
+
+	writel_relaxed(0UL, otpc->base + MCHP_OTPC_AR);
+	*val = readl_relaxed(otpc->base + MCHP_OTPC_DR);
+
+	return 0;
+}
+
 static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
 {
 	struct mchp_otpc_packet *packet;
@@ -213,8 +265,15 @@ static int mchp_otpc_init_packets_list(struct mchp_otpc *otpc, u32 *size)
 		if (!packet)
 			return -ENOMEM;
 
-		packet->id = id++;
-		packet->offset = word_pos;
+		packet->payload_info.id = id++;
+		packet->payload_info.packet_offset = word_pos;
+		packet->payload_info.payload_length = payload_size;
+		packet->payload_info.packet_type = FIELD_GET(MCHP_OTPC_HR_PACKET_TYPE, word);
+
+		if (packet->payload_info.packet_type == PACKET_TYPE_REGULAR)
+			ret = mchp_otpc_read_packet_tag(otpc, packet->payload_info.packet_offset,
+							&packet->payload_info.packet_tag);
+
 		INIT_LIST_HEAD(&packet->list);
 		list_add_tail(&packet->list, &otpc->packets);
 
@@ -236,7 +295,7 @@ static struct nvmem_config mchp_nvmem_config = {
 	.type = NVMEM_TYPE_OTP,
 	.read_only = true,
 	.word_size = 4,
-	.stride = 4,
+	.stride = 1,
 	.reg_read = mchp_otpc_read,
 };
 
@@ -244,8 +303,9 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
 	struct mchp_otpc *otpc;
-	u32 size;
+	u32 size, tmp;
 	int ret;
+	bool emul_enable;
 
 	otpc = devm_kzalloc(&pdev->dev, sizeof(*otpc), GFP_KERNEL);
 	if (!otpc)
@@ -256,10 +316,22 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 		return PTR_ERR(otpc->base);
 
 	otpc->dev = &pdev->dev;
+
+	tmp = readl_relaxed(otpc->base + MCHP_OTPC_MR);
+	emul_enable = tmp & MCHP_OTPC_MR_EMUL;
+	if (emul_enable)
+		dev_info(otpc->dev, "Emulation mode enabled\n");
+
 	ret = mchp_otpc_init_packets_list(otpc, &size);
 	if (ret)
 		return ret;
 
+	if (size == 0) {
+		dev_err(otpc->dev, "Cannot access OTP memory !\n");
+		if (!emul_enable)
+			dev_err(otpc->dev, "Boot packet not configured & Emulation mode not enabled !\n");
+	}
+
 	mchp_nvmem_config.dev = otpc->dev;
 	mchp_nvmem_config.add_legacy_fixed_of_cells = true;
 	mchp_nvmem_config.size = size;
-- 
2.34.1


