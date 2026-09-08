Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A67C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1z6Bj27I27t4pJmuJ175AefeQtd/kOqAphoJXB6vZBA=; b=BHnwZe7x+OkDsWsb1HDSz8UmjS
	hRduafIhCwqmbv7HXTfDlun1cA9fxtLPeWDCreyMtmL3ICt7L4WHY9Od/WkDU6E6xEluN7l5+FoIv
	ZLZgAJqedsBP58V5/3U5I5gWfXtUNkgblEX9Cu57ucsES0N/y0pkbzMZT/8ykDehecNGohfw2+wO7
	zpMHsuWE6XHFyPDKnFUsErtfYdFkdeDZShCzucyB17KrrSG5EZ9qPL4FqwnMtNv16Io90sHDz0On+
	MO59rnZ4GT12u/2mkh2VC+VMc1Jq6MMQFp8UNMtEz0Ib0UIyyQw912w5xAOM0cKHUEh4V/aV3Tf/I
	zXrLAQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oM7-000000083jB-07pK;
	Tue, 08 Sep 2026 05:26:51 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oM4-000000083he-25pG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:26:50 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso3998164a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845207; x=1789450007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1z6Bj27I27t4pJmuJ175AefeQtd/kOqAphoJXB6vZBA=;
        b=q6G9pW0Uh/+6bndm6+XAcpKiuIPqDAAGlGJE1/9wyDDCbS136ve/KTM/SUlPxUn/12
         wdJ0AxYoOcC/sY2n+7JOgv442hV8ocpX6s/70E3uFFE53yc1FkEMrAVAeJWx2/+KWpB4
         0LcObAL0BHooCBA106XFD2Hfs5iz/WOV4CPyEvaV1OHFdXS5PcQ6BiMOiA9wFJyEu3L6
         eaEnSM15APMIYileCWKACDbUce7R6umpi8RJIA6ACQ/hsVnlYsQPWISnVqUHblA+UUjY
         QoujDJEbHtW90wWK2cg3UViqKkuGrXu0NgPK63qNYVd+QMikp9fqOUYxl4JY6l6U9T8S
         oW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845207; x=1789450007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1z6Bj27I27t4pJmuJ175AefeQtd/kOqAphoJXB6vZBA=;
        b=oRqtxgH+me1rVaRDGq7kB6pIf2IbRhxQb9jijLMuqgztjTErrDgBh0+ujWcKUoZa4y
         QK72Chg9CjVzsvykVz2Rf6PhTKaSc43+pD56Z20pD+yileBX9gc/HhYJtgVLe+Yu2Src
         BwBTw+foP8qilrYWf461HsShIdp2vHo5GDh5TrVkg7pMW9pUwvn9PeqpkbhGmRPogPam
         0d5uDgsB3mYttCJpa9cCnuGvhrzbz00p+oFq1SISkUHcrGwaKb5NzOhTljQREmbQS5/W
         ZgSevMp6K4SYZSaU4nyoXJXI5Ll7BjB6ABuG4hzMjd6PaSTiFVEqDW4f2oa/1pLOIUqG
         zq6g==
X-Gm-Message-State: AFuF++mftV+BvKxqhCPB10R/v5EULMl7m4Aeh2a/sbNzcn6Mv5osMqgN
	+oBg1hrCt2ntCTN1RX3rHEHFRTPjVS3jlO91uuRc5Lcv3q0026qBnPul
X-Gm-Gg: AYBFou3H7ON7IKv1vHNUzujh68vtnUWz7G7nIlf0qFcX/fWUT143hzWRRwqEZwzBRxk
	JExG16DyG7W3GEfkUKH5q4mydO8lPg/kks0uTDugTvl+JrLZ5fu2penVNqaL+dDkMJBexbzZw7b
	2vY6xqQLfRknu/oQkn1RQjupO38dFJvoqNUZGWYCDlBc/eDj59dSRdzDIjS5k4m9xEB/hsa9gVV
	IvnB0LVLedlNBNzupUjBH0Bg0j68WmOZkLMS2d6OoaVSrhrRel5hk7SkiVnOkN6mBQ89DzqK5Q5
	9WSoU4loHJAKOOLdPrmFg8aKmUsszCBhXcMssnKVLhiJy/MdRFnQLRWG/jzmee77NParjqFVRdg
	hTFlJ58vyhpAvBSmBJG+Vjev+AfDCNRPSoSAmeirGlHlpMyKAuY4PUNHy0dWelSzy0Vp/wlTiIR
	5W5N3Vsg4e1GEVne4ow0+6LjW1K23/9W77vi0/H0maoi9qU5GZoU+TRlY7IOo+2b4GbLppy/tHr
	iAG443Tsxl4TJOEWjNb5q4i
X-Received: by 2002:a17:90b:3943:b0:398:d8eb:cb2a with SMTP id 98e67ed59e1d1-39b26273e31mr43805291a91.23.1788845207542;
        Mon, 07 Sep 2026 22:26:47 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 04/10] net: cavium: fix typos in comments
Date: Tue,  8 Sep 2026 10:55:56 +0530
Message-ID: <20260908052602.27497-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222648_681332_80EE3125 
X-CRM114-Status: GOOD (  21.63  )
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

Fix misspellings in comments, found with scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/net/ethernet/cavium/liquidio/cn66xx_device.c   | 2 +-
 drivers/net/ethernet/cavium/liquidio/lio_core.c        | 2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_config.h   | 4 ++--
 drivers/net/ethernet/cavium/liquidio/octeon_iq.h       | 2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_main.h     | 2 +-
 drivers/net/ethernet/cavium/liquidio/octeon_nic.h      | 2 +-
 drivers/net/ethernet/cavium/liquidio/request_manager.c | 2 +-
 drivers/net/ethernet/cavium/thunder/nic.h              | 2 +-
 drivers/net/ethernet/cavium/thunder/nic_main.c         | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c b/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c
index 93fccfec288d..d3ebbb40579e 100644
--- a/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c
+++ b/drivers/net/ethernet/cavium/liquidio/cn66xx_device.c
@@ -177,7 +177,7 @@ static void lio_cn66xx_setup_pkt_ctl_regs(struct octeon_device *oct)
 
 	/* 66XX SPECIFIC */
 	if (CFG_GET_OQ_MAX_Q(cn6xxx->conf) <= 4)
-		/* Disable RING_EN if only upto 4 rings are used. */
+		/* Disable RING_EN if only up to 4 rings are used. */
 		pktctl &= ~(1 << 4);
 	else
 		pktctl |= (1 << 4);
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
index 93b06d599eed..bed450bfad38 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
@@ -565,7 +565,7 @@ static int octeon_setup_droq(struct octeon_device *oct, int q_no, int num_descs,
 }
 
 /**
- * liquidio_push_packet - Routine to push packets arriving on Octeon interface upto network layer.
+ * liquidio_push_packet - Routine to push packets arriving on Octeon interface up to network layer.
  * @octeon_id:octeon device id.
  * @skbuff:   skbuff struct to be passed to network layer.
  * @len:      size of total data received.
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_config.h b/drivers/net/ethernet/cavium/liquidio/octeon_config.h
index 24c212001212..d2d64edaf3bf 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_config.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_config.h
@@ -254,7 +254,7 @@ struct octeon_oq_config {
 	u64 pkts_per_intr:16;
 
 	/** Interrupt Coalescing (Time Interval). Octeon will interrupt the
-	 *  host if atleast one packet was sent in the time interval specified
+	 *  host if at least one packet was sent in the time interval specified
 	 *  by this field. The driver uses time interval interrupt coalescing
 	 *  by default. The time is specified in microseconds.
 	 */
@@ -296,7 +296,7 @@ struct octeon_oq_config {
 	u64 oq_intr_pkt:16;
 
 	/** Interrupt Coalescing (Time Interval). Octeon will interrupt the
-	 *  host if atleast one packet was sent in the time interval specified
+	 *  host if at least one packet was sent in the time interval specified
 	 *  by this field. The driver uses time interval interrupt coalescing
 	 *  by default.  The time is specified in microseconds.
 	 */
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_iq.h b/drivers/net/ethernet/cavium/liquidio/octeon_iq.h
index a04f36a0e1a0..fdd7d3a77a2d 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_iq.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_iq.h
@@ -70,7 +70,7 @@ struct oct_iq_stats {
 
 /** The instruction (input) queue.
  *  The input queue is used to post raw (instruction) mode data or packet
- *  data to Octeon device from the host. Each input queue (upto 4) for
+ *  data to Octeon device from the host. Each input queue (up to 4) for
  *  a Octeon device has one such structure to represent it.
  */
 struct octeon_instr_queue {
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_main.h b/drivers/net/ethernet/cavium/liquidio/octeon_main.h
index 953edf0c7096..d2a52673cac5 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_main.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_main.h
@@ -166,7 +166,7 @@ static inline int octeon_map_pci_barx(struct octeon_device *oct,
  * errno -EINTR: user abort the command.
  * errno -ETIME: user spefified timeout value has been expired.
  * errno -EBUSY: the response of the request does not return in
- *               resonable time (LIO_SC_MAX_TMO_MS).
+ *               reasonable time (LIO_SC_MAX_TMO_MS).
  *               the sc wll be move to zombie response list by
  *               lio_process_ordered_list()
  *
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_nic.h b/drivers/net/ethernet/cavium/liquidio/octeon_nic.h
index c139fc423764..8341faaa0c24 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_nic.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_nic.h
@@ -277,7 +277,7 @@ int octnet_send_nic_data_pkt(struct octeon_device *oct,
 
 /** Send a NIC control packet to the device
  * @param oct - octeon device pointer
- * @param nctrl - control structure with command, timout, and callback info
+ * @param nctrl - control structure with command, timeout, and callback info
  * @returns IQ_FAILED if it failed to add to the input queue. IQ_STOP if the
  * queue should be stopped, and IQ_SEND_OK if it sent okay.
  */
diff --git a/drivers/net/ethernet/cavium/liquidio/request_manager.c b/drivers/net/ethernet/cavium/liquidio/request_manager.c
index d7cfb20eea00..a983e7f79461 100644
--- a/drivers/net/ethernet/cavium/liquidio/request_manager.c
+++ b/drivers/net/ethernet/cavium/liquidio/request_manager.c
@@ -40,7 +40,7 @@ static void  __check_db_timeout(struct octeon_device *oct, u64 iq_no);
 
 static void (*reqtype_free_fn[MAX_OCTEON_DEVICES][REQTYPE_LAST + 1]) (void *);
 
-/* Define this to return the request status comaptible to old code */
+/* Define this to return the request status compatible to old code */
 /*#define OCTEON_USE_OLD_REQ_STATUS*/
 
 /* Return 0 on success, 1 on failure */
diff --git a/drivers/net/ethernet/cavium/thunder/nic.h b/drivers/net/ethernet/cavium/thunder/nic.h
index 090d6b83982a..bb3f4fa6b995 100644
--- a/drivers/net/ethernet/cavium/thunder/nic.h
+++ b/drivers/net/ethernet/cavium/thunder/nic.h
@@ -97,7 +97,7 @@
  * This value ensures that once a packet has been "accepted"
  * for reception it will not get dropped due to non-availability
  * of CQ descriptor. An errata in HW mandates this value to be
- * atleast 0x100.
+ * at least 0x100.
  */
 #define NICPF_CQM_MIN_DROP_LEVEL       0x100
 
diff --git a/drivers/net/ethernet/cavium/thunder/nic_main.c b/drivers/net/ethernet/cavium/thunder/nic_main.c
index 0ec65ec634df..086f32b61580 100644
--- a/drivers/net/ethernet/cavium/thunder/nic_main.c
+++ b/drivers/net/ethernet/cavium/thunder/nic_main.c
@@ -595,7 +595,7 @@ static void nic_config_rss(struct nicpf *nic, struct rss_cfg_msg *cfg)
 	nic_reg_write(nic, idx_addr | (cpi_base << 3), cpi_cfg);
 }
 
-/* 4 level transmit side scheduler configutation
+/* 4 level transmit side scheduler configuration
  * for TNS bypass mode
  *
  * Sample configuration for SQ0 on 88xx
-- 
2.48.1


