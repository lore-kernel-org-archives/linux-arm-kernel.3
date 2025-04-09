Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2210C36010
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 00:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbV/vKXAiJOBIg+7IN7P0v6n1Jf6WS2233iGKx+AqoI=; b=w1265gjoBfgpCpEJXI162UWfif
	3MBdcL/NjLBB4VD9hVGTOtxFWuasbQPsqBA48H9IybRjpERTJG4+Xsg6TomAt0trsFlmkVns5Kizn
	AsuitGy/0DPh7ecdgghRkdPOYj4JB0IjOLFzmvr+/DprlFKHShS1uxT8QBkguvSvr1keN8tzqTCyy
	WlIx7v26wjxATGBkI5pM6ZadsL1aCuD/HJdbOE5FOUu2qY0u0mDZR0CbLrUD2DtCGJZMEARXSOF46
	m5hHdS+LW2QrV20EuNXs3S7eTEIcb1Af9MnxJkOecKLiIztK0Y17mRkd4ILnFPXF2IFWR0JN+nxeQ
	GZb+MXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2J3D-00000005kwW-0YTe;
	Wed, 09 Apr 2025 00:12:19 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Izg-00000005kB3-0vUO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 00:08:41 +0000
Received: from romank-3650.corp.microsoft.com (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 801DD2113E99;
	Tue,  8 Apr 2025 17:08:38 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 801DD2113E99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1744157318;
	bh=KbV/vKXAiJOBIg+7IN7P0v6n1Jf6WS2233iGKx+AqoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TjHciaQQgFnL7ivTEJKVa5ioWc/2NYa6k8KseApdUdFiruJHfVoaR9jxdQ7E4MiYF
	 IZ7YXCoETe3TAQmnUqpzuZqXLUajwo7FDuZ7bbr7jGbuCnPDf9fdHmbIE/9o1a+v7G
	 tMzUn9l1huWibgOirhb4LYNGntlzZ2ukSc+KBPek=
From: Roman Kisel <romank@linux.microsoft.com>
To: aleksander.lobakin@intel.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	decui@microsoft.com,
	gregkh@linuxfoundation.org,
	haiyangz@microsoft.com,
	hch@lst.de,
	hpa@zytor.com,
	James.Bottomley@HansenPartnership.com,
	Jonathan.Cameron@huawei.com,
	kys@microsoft.com,
	leon@kernel.org,
	lukas@wunner.de,
	luto@kernel.org,
	m.szyprowski@samsung.com,
	martin.petersen@oracle.com,
	mingo@redhat.com,
	peterz@infradead.org,
	quic_zijuhu@quicinc.com,
	robin.murphy@arm.com,
	tglx@linutronix.de,
	wei.liu@kernel.org,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	x86@kernel.org
Cc: apais@microsoft.com,
	benhill@microsoft.com,
	bperkins@microsoft.com,
	sunilmut@microsoft.com
Subject: [PATCH hyperv-next 2/6] drivers: hyperv: VMBus protocol version 6.0
Date: Tue,  8 Apr 2025 17:08:31 -0700
Message-ID: <20250409000835.285105-3-romank@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409000835.285105-1-romank@linux.microsoft.com>
References: <20250409000835.285105-1-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_170840_357296_391434E9 
X-CRM114-Status: GOOD (  15.85  )
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

The confidential VMBus is supported starting from the protocol
version 6.0 onwards.

Update the relevant definitions, provide a function that returns
whether VMBus is condifential or not.

Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
---
 drivers/hv/vmbus_drv.c         | 12 ++++++
 include/asm-generic/mshyperv.h |  1 +
 include/linux/hyperv.h         | 71 +++++++++++++++++++++++++---------
 3 files changed, 65 insertions(+), 19 deletions(-)

diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 22afebfc28ff..fa3ad6fe0bec 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -55,6 +55,18 @@ static long __percpu *vmbus_evt;
 int vmbus_irq;
 int vmbus_interrupt;
 
+/*
+ * If the Confidential VMBus is used, the data on the "wire" is not
+ * visible to either the host or the hypervisor.
+ */
+static bool is_confidential;
+
+bool vmbus_is_confidential(void)
+{
+	return is_confidential;
+}
+EXPORT_SYMBOL_GPL(vmbus_is_confidential);
+
 /*
  * The panic notifier below is responsible solely for unloading the
  * vmbus connection, which is necessary in a panic event.
diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
index ccccb1cbf7df..23f707b5aeeb 100644
--- a/include/asm-generic/mshyperv.h
+++ b/include/asm-generic/mshyperv.h
@@ -377,5 +377,6 @@ static inline int hv_call_create_vp(int node, u64 partition_id, u32 vp_index, u3
 	return -EOPNOTSUPP;
 }
 #endif /* CONFIG_MSHV_ROOT */
+bool vmbus_is_confidential(void);
 
 #endif
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 675959fb97ba..e66fd980789a 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -265,16 +265,19 @@ static inline u32 hv_get_avail_to_write_percent(
  * Linux kernel.
  */
 
-#define VERSION_WS2008  ((0 << 16) | (13))
-#define VERSION_WIN7    ((1 << 16) | (1))
-#define VERSION_WIN8    ((2 << 16) | (4))
-#define VERSION_WIN8_1    ((3 << 16) | (0))
-#define VERSION_WIN10 ((4 << 16) | (0))
-#define VERSION_WIN10_V4_1 ((4 << 16) | (1))
-#define VERSION_WIN10_V5 ((5 << 16) | (0))
-#define VERSION_WIN10_V5_1 ((5 << 16) | (1))
-#define VERSION_WIN10_V5_2 ((5 << 16) | (2))
-#define VERSION_WIN10_V5_3 ((5 << 16) | (3))
+#define VMBUS_MAKE_VERSION(MAJ, MIN)	((((u32)MAJ) << 16) | (MIN))
+#define VERSION_WS2008					VMBUS_MAKE_VERSION(0, 13)
+#define VERSION_WIN7					VMBUS_MAKE_VERSION(1, 1)
+#define VERSION_WIN8					VMBUS_MAKE_VERSION(2, 4)
+#define VERSION_WIN8_1					VMBUS_MAKE_VERSION(3, 0)
+#define VERSION_WIN10					VMBUS_MAKE_VERSION(4, 0)
+#define VERSION_WIN10_V4_1				VMBUS_MAKE_VERSION(4, 1)
+#define VERSION_WIN10_V5				VMBUS_MAKE_VERSION(5, 0)
+#define VERSION_WIN10_V5_1				VMBUS_MAKE_VERSION(5, 1)
+#define VERSION_WIN10_V5_2				VMBUS_MAKE_VERSION(5, 2)
+#define VERSION_WIN10_V5_3				VMBUS_MAKE_VERSION(5, 3)
+#define VERSION_WIN_IRON				VERSION_WIN10_V5_3
+#define VERSION_WIN_COPPER				VMBUS_MAKE_VERSION(6, 0)
 
 /* Make maximum size of pipe payload of 16K */
 #define MAX_PIPE_DATA_PAYLOAD		(sizeof(u8) * 16384)
@@ -335,14 +338,22 @@ struct vmbus_channel_offer {
 } __packed;
 
 /* Server Flags */
-#define VMBUS_CHANNEL_ENUMERATE_DEVICE_INTERFACE	1
-#define VMBUS_CHANNEL_SERVER_SUPPORTS_TRANSFER_PAGES	2
-#define VMBUS_CHANNEL_SERVER_SUPPORTS_GPADLS		4
-#define VMBUS_CHANNEL_NAMED_PIPE_MODE			0x10
-#define VMBUS_CHANNEL_LOOPBACK_OFFER			0x100
-#define VMBUS_CHANNEL_PARENT_OFFER			0x200
-#define VMBUS_CHANNEL_REQUEST_MONITORED_NOTIFICATION	0x400
-#define VMBUS_CHANNEL_TLNPI_PROVIDER_OFFER		0x2000
+#define VMBUS_CHANNEL_ENUMERATE_DEVICE_INTERFACE		0x0001
+/*
+ * This flag indicates that the channel is offered by the paravisor, and must
+ * use encrypted memory for the channel ring buffer.
+ */
+#define VMBUS_CHANNEL_CONFIDENTIAL_RING_BUFFER			0x0002
+/*
+ * This flag indicates that the channel is offered by the paravisor, and must
+ * use encrypted memory for GPA direct packets and additional GPADLs.
+ */
+#define VMBUS_CHANNEL_CONFIDENTIAL_EXTERNAL_MEMORY		0x0004
+#define VMBUS_CHANNEL_NAMED_PIPE_MODE					0x0010
+#define VMBUS_CHANNEL_LOOPBACK_OFFER					0x0100
+#define VMBUS_CHANNEL_PARENT_OFFER						0x0200
+#define VMBUS_CHANNEL_REQUEST_MONITORED_NOTIFICATION	0x0400
+#define VMBUS_CHANNEL_TLNPI_PROVIDER_OFFER				0x2000
 
 struct vmpacket_descriptor {
 	u16 type;
@@ -621,6 +632,12 @@ struct vmbus_channel_relid_released {
 	u32 child_relid;
 } __packed;
 
+/*
+ * Used by the paravisor only, means that the encrypted ring buffers and
+ * the encrypted external memory are supported
+ */
+#define VMBUS_FEATURE_FLAG_CONFIDENTIAL_CHANNELS	0x10
+
 struct vmbus_channel_initiate_contact {
 	struct vmbus_channel_message_header header;
 	u32 vmbus_version_requested;
@@ -630,7 +647,8 @@ struct vmbus_channel_initiate_contact {
 		struct {
 			u8	msg_sint;
 			u8	msg_vtl;
-			u8	reserved[6];
+			u8	reserved[2];
+			u32 feature_flags; /* VMBus version 6.0 */
 		};
 	};
 	u64 monitor_page1;
@@ -1002,6 +1020,11 @@ struct vmbus_channel {
 
 	/* The max size of a packet on this channel */
 	u32 max_pkt_size;
+
+	/* The ring buffer is encrypted */
+	bool confidential_ring_buffer;
+	/* The external memory is encrypted */
+	bool confidential_external_memory;
 };
 
 #define lock_requestor(channel, flags)					\
@@ -1026,6 +1049,16 @@ u64 vmbus_request_addr_match(struct vmbus_channel *channel, u64 trans_id,
 			     u64 rqst_addr);
 u64 vmbus_request_addr(struct vmbus_channel *channel, u64 trans_id);
 
+static inline bool is_confidential_ring_buffer(const struct vmbus_channel_offer_channel *o)
+{
+	return !!(o->offer.chn_flags & VMBUS_CHANNEL_CONFIDENTIAL_RING_BUFFER);
+}
+
+static inline bool is_confidential_external_memory(const struct vmbus_channel_offer_channel *o)
+{
+	return !!(o->offer.chn_flags & VMBUS_CHANNEL_CONFIDENTIAL_EXTERNAL_MEMORY);
+}
+
 static inline bool is_hvsock_offer(const struct vmbus_channel_offer_channel *o)
 {
 	return !!(o->offer.chn_flags & VMBUS_CHANNEL_TLNPI_PROVIDER_OFFER);
-- 
2.43.0


