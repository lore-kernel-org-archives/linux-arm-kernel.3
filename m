Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDB8D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98g6X3S/iJSm9qbCDckyxRmdDucwdo57Y2Adtbm1tHc=; b=3+iqK/oJ1tvSETw4/k1E212ThY
	oBPumaZbn96fAlTENxJ740wgt+B71NF2rvr0tHSSWwvQkbuDm0rvZ/MbxChkeunRmpJE2JwdbtoWY
	xxOg+Bm4GDjKLpfNAGZJB0VE/wYvIlGrQrDZyLS86/ixxXHHz4JDNzj2LbKOHHrNFzOcgprMBIWvJ
	DVy0g0hzstoVAhyPzQXsbkwjCYCAcT8WeVtETy6k5WuXt8ni+PStcNYYDSSfX+bn/bcdfOxy3ACiO
	Px615KliDuMLwk2haH0Y7V0//FyFoLy+HK9MfQZm54NgPaMZEYG8JvttEjdYwIBNrb6lnORL69m7M
	8oIwCAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOrU5-000000001Eb-0qGo;
	Fri, 28 Nov 2025 05:57:33 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOrU4-000000001EQ-0Vwc;
	Fri, 28 Nov 2025 05:57:32 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: ti_sci.h: fix all kernel-doc warnings
Date: Thu, 27 Nov 2025 21:57:31 -0800
Message-ID: <20251128055731.812460-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Modify kernel-doc comments in ti_sci.h to eliminate all kernel-doc
warnings:

* use correct/matching struct names in kdoc comments
* use correct struct member names in kdoc comments
* add a ':' after struct member names where needed
* change a blank kdoc line to " *"
* convert 3 structs to kernel-doc comments:
  struct ti_sci_msg_rm_udmap_tx_ch_cfg_req
  struct ti_sci_msg_rm_udmap_rx_ch_cfg_req
  struct ti_sci_msg_rm_udmap_flow_cfg_req

Fixes 13 kernel-doc warnings:

Warning: drivers/firmware/ti_sci.h:609 expecting prototype for struct
 tisci_msg_req_prepare_sleep. Prototype was for struct
 ti_sci_msg_req_prepare_sleep instead
Warning: drivers/firmware/ti_sci.h:609 struct member 'hdr' not described
 in 'ti_sci_msg_req_prepare_sleep'
Warning: drivers/firmware/ti_sci.h:609 struct member 'mode' not described
 in 'ti_sci_msg_req_prepare_sleep'
Warning: drivers/firmware/ti_sci.h:609 struct member 'ctx_lo' not described
 in 'ti_sci_msg_req_prepare_sleep'
Warning: drivers/firmware/ti_sci.h:609 struct member 'ctx_hi' not described
 in 'ti_sci_msg_req_prepare_sleep'
Warning: drivers/firmware/ti_sci.h:609 struct member 'debug_flags' not
 described in 'ti_sci_msg_req_prepare_sleep'
Warning: drivers/firmware/ti_sci.h:623 expecting prototype for struct
 tisci_msg_set_io_isolation_req. Prototype was for struct
 ti_sci_msg_req_set_io_isolation instead
Warning: drivers/firmware/ti_sci.h:696 struct member 'latency' not
 described in 'ti_sci_msg_req_lpm_set_latency_constraint'
Warning: drivers/firmware/ti_sci.h:857 bad line:
Warning: drivers/firmware/ti_sci.h:1002 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
 * Configures a Navigator Subsystem UDMAP transmit channel
Warning: drivers/firmware/ti_sci.h:1130 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
 * Configures a Navigator Subsystem UDMAP receive channel
Warning: drivers/firmware/ti_sci.h:1249 This comment starts with '/**', but
 isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
 * Configures a Navigator Subsystem UDMAP receive flow
Warning: drivers/firmware/ti_sci.h:1421 struct member 'valid_params'
 not described in 'ti_sci_msg_rm_udmap_flow_cfg_req'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Nishanth Menon <nm@ti.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/firmware/ti_sci.h |   29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

--- linux-next-20251127.orig/drivers/firmware/ti_sci.h
+++ linux-next-20251127/drivers/firmware/ti_sci.h
@@ -580,13 +580,13 @@ struct ti_sci_msg_resp_get_clock_freq {
 } __packed;
 
 /**
- * struct tisci_msg_req_prepare_sleep - Request for TISCI_MSG_PREPARE_SLEEP.
+ * struct ti_sci_msg_req_prepare_sleep - Request for TISCI_MSG_PREPARE_SLEEP.
  *
- * @hdr				TISCI header to provide ACK/NAK flags to the host.
- * @mode			Low power mode to enter.
- * @ctx_lo			Low 32-bits of physical pointer to address to use for context save.
- * @ctx_hi			High 32-bits of physical pointer to address to use for context save.
- * @debug_flags			Flags that can be set to halt the sequence during suspend or
+ * @hdr:			TISCI header to provide ACK/NAK flags to the host.
+ * @mode:			Low power mode to enter.
+ * @ctx_lo:			Low 32-bits of physical pointer to address to use for context save.
+ * @ctx_hi:			High 32-bits of physical pointer to address to use for context save.
+ * @debug_flags:		Flags that can be set to halt the sequence during suspend or
  *				resume to allow JTAG connection and debug.
  *
  * This message is used as the first step of entering a low power mode. It
@@ -610,7 +610,7 @@ struct ti_sci_msg_req_prepare_sleep {
 } __packed;
 
 /**
- * struct tisci_msg_set_io_isolation_req - Request for TI_SCI_MSG_SET_IO_ISOLATION.
+ * struct ti_sci_msg_req_set_io_isolation - Request for TI_SCI_MSG_SET_IO_ISOLATION.
  *
  * @hdr:	Generic header
  * @state:	The deseared state of the IO isolation.
@@ -676,7 +676,7 @@ struct ti_sci_msg_req_lpm_set_device_con
  * TISCI_MSG_LPM_SET_LATENCY_CONSTRAINT.
  *
  * @hdr:	TISCI header to provide ACK/NAK flags to the host.
- * @wkup_latency:	The maximum acceptable latency to wake up from low power mode
+ * @latency:	The maximum acceptable latency to wake up from low power mode
  *			in milliseconds. The deeper the state, the higher the latency.
  * @state:	The desired state of wakeup latency constraint: set or clear.
  * @rsvd:	Reserved for future use.
@@ -855,7 +855,7 @@ struct ti_sci_msg_rm_ring_cfg_req {
  * UDMAP transmit channels mapped to source threads will have their
  * TCHAN_THRD_ID register programmed with the destination thread if the pairing
  * is successful.
-
+ *
  * @dst_thread: PSI-L destination thread ID within the PSI-L System thread map.
  * PSI-L destination threads start at index 0x8000.  The request is NACK'd if
  * the destination thread is not greater than or equal to 0x8000.
@@ -1000,7 +1000,8 @@ struct rm_ti_sci_msg_udmap_rx_flow_opt_c
 } __packed;
 
 /**
- * Configures a Navigator Subsystem UDMAP transmit channel
+ * struct ti_sci_msg_rm_udmap_tx_ch_cfg_req - Configures a
+ *	Navigator Subsystem UDMAP transmit channel
  *
  * Configures the non-real-time registers of a Navigator Subsystem UDMAP
  * transmit channel.  The channel index must be assigned to the host defined
@@ -1128,7 +1129,8 @@ struct ti_sci_msg_rm_udmap_tx_ch_cfg_req
 } __packed;
 
 /**
- * Configures a Navigator Subsystem UDMAP receive channel
+ * struct ti_sci_msg_rm_udmap_rx_ch_cfg_req - Configures a
+ *	Navigator Subsystem UDMAP receive channel
  *
  * Configures the non-real-time registers of a Navigator Subsystem UDMAP
  * receive channel.  The channel index must be assigned to the host defined
@@ -1247,7 +1249,8 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg_req
 } __packed;
 
 /**
- * Configures a Navigator Subsystem UDMAP receive flow
+ * struct ti_sci_msg_rm_udmap_flow_cfg_req - Configures a
+ *	Navigator Subsystem UDMAP receive flow
  *
  * Configures a Navigator Subsystem UDMAP receive flow's registers.
  * Configuration does not include the flow registers which handle size-based
@@ -1258,7 +1261,7 @@ struct ti_sci_msg_rm_udmap_rx_ch_cfg_req
  *
  * @hdr: Standard TISCI header
  *
- * @valid_params
+ * @valid_params:
  * Bitfield defining validity of rx flow configuration parameters.  The
  * rx flow configuration fields are not valid, and will not be used for flow
  * configuration, if their corresponding valid bit is zero.  Valid bit usage:

