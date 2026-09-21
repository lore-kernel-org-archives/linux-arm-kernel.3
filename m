Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A1DC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 06:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wqlm2oKxQsTu2i23sWiXCPOdJxQdXfXmPVhtM0Xyv9w=; b=1h714hyKn4Q4k+tAytd2Cjs0Xu
	WQoLKg2n9B5YzTK2K1crPq9hqs7P9IiLekUNnbP4gVtxqDBFO1HgdVQmCO+rm70ARdjLLNQ98+KUR
	2rn3oNe0Hc0nVBsgb2p30qX8Dja0LUm+yJmQddboiFHI1w/iSnH9BeOMlcrdOAuZxHm0Dmroto/LN
	MiZNXHhUQb2gm1Lh4/bFOdhrHiVIaPtERKIJpdqGT+ngJnzDUgfu8cHYC79TlRbT2ZMIKjobdFAdW
	8JQ9+C+gGSHpXRglKaqTOjr1e3llcPW12vjlpYykGXxzOUfXXZCDjyFstYM7VGeSvpTbdaVOxVGom
	0l3o5/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XDO-0000000105p-392W;
	Mon, 21 Sep 2026 06:09:22 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8XDM-0000000105P-0HAq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 06:09:21 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso2545090a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 23:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacecubics-com.20251104.gappssmtp.com; s=20251104; t=1789970959; x=1790575759; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wqlm2oKxQsTu2i23sWiXCPOdJxQdXfXmPVhtM0Xyv9w=;
        b=nZ/EwCV6/PE3ogo0bjfElAcaLwINYEP5pm++kF3rZR4tQ0yMU6SW2wL3fZ0RQ6rs6Q
         t5IImt+dyM5VBRq9D1TWxdVXSvFxZpm13OamY6lQ9TsNPgtsrh8CXVWxbFZDsaXe1M9q
         QsIWmCP5oOeAleC2h0ecoQqUtZLjJZkxpHFHmlCZkOnQ51isUZ/BCQTufXt1yB9Agu78
         a7NcWh9qL04DNJ+JcaofEeOwb/ZBjQrN8veTXUURbFB6weYpVdmMdl5R+hsNwC4tqtxQ
         sl8VFFbmeRlKSE+S+kdxXTCPhJ7DxjW6DrsW2mUB6CW9ddwcnQ69OTqHQlOZ/a4bz1V9
         apeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789970959; x=1790575759;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wqlm2oKxQsTu2i23sWiXCPOdJxQdXfXmPVhtM0Xyv9w=;
        b=1vONHgAIS/hvF+l/HEwv9dtmjb6oY6m2K1YuXt66o3t4QQBdZfQU3zTNg1SiYg2FSb
         RqJraNYKNZ7Qw2J7ZEpcQb58HdjK0Pa04LNQ6kGCZ/61ARVFXwEV1qr4oQyssMtEPNu9
         RbEKlIOqkRWHMB1YKdF/PrD0tkp5bMuCcBG78jtNpNZy456wtxhATaXiuUPUZGqhJSig
         R91lCuA9kzxjB2AdI1eScaknkGIsBiT1Gecr8Gvl/t/yxSYQpUUtcOj7m/bYvQ+qHLTF
         i1MwIC/26TporFRY0A9hk+GV+M8x45lZUb0RntUIkGHMzQOhgDBwvKte/HaIP7yo7Nf0
         bttw==
X-Forwarded-Encrypted: i=1; AKwUvBz7D4yuZzJ+5yJPx3RLvfqHi/qPMhVUfdwJufReU369g/UATfiiquVF9iB6tLBPr6YZlgoOaNCP1UMeXyIOyS7o@lists.infradead.org
X-Gm-Message-State: AFuF++k/moVAk8UZKjM+UC0P0yUSOP5tBbMKCnuGnMi8Cdzg3EIHN5BU
	pkcoiU9kJNlxI6KOvVrQ9kgjO8OO8hOGmy7iX2gezknqIEx5WTe6JkvzZCrJh+krEXo=
X-Gm-Gg: AYBFou1l+mgjPEmNh5+0kMya4W7HGIisfES8t+QC46tMILpQw+GUYvzNrcIjq3N8eLF
	OQ+/zvoLLDyhPSLNGmomaGfGNFyXhMISFxnNl8TJtFHTIYpOE3J9ClLIpqiKK6PgXBUg+RZLDtM
	vn9gd0500M+fSm677cD+fLm781RY46AiSHqZwwO8oaJvvniJSxn/PzOmSN5xpIqAmFsn1f2VHUV
	T9FtZHRD1mpRaX9DROjMb1rXdRseQzdXZXySWJOgyviEOnzXc2WypXBP36s+KzaTEdwaSkOlsmv
	yjMh4YFeVug8rW9XIog3tu+SDYVbgKpgQ+YZFZfQLiI0qJkLgiHSFxifEOar1S8o0TT4DSZ17vN
	tb0J8G8sjIvPJZEllgF/53kV3w2aS+OZNUFhoE1gbe2AptOxg8LJAor4B8NvQs6OgU6ngMNT072
	998fUXwbvnW3JsMRfa8OHnokFrHoOCHq++CM0bJFosMr7aKpoOoQySo6p1iR2akDAwxyGfco73T
	CwcsWpSDE3dxjKXw61hsHQiLHX/8p3kHUtgVxt5qA==
X-Received: by 2002:a17:90b:2584:b0:39e:6c68:c787 with SMTP id 98e67ed59e1d1-39e6c68ca2emr8661197a91.61.1789970958653;
        Sun, 20 Sep 2026 23:09:18 -0700 (PDT)
Received: from [127.0.1.1] (221x245x252x90.ap221.ftth.ucom.ne.jp. [221.245.252.90])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a031d63ca9sm7736324a91.14.2026.09.20.23.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:09:18 -0700 (PDT)
From: Maximilian Zimmermann <maxz@spacecubics.com>
Date: Mon, 21 Sep 2026 15:09:10 +0900
Subject: [PATCH net] can: xilinx_can: set CAN FD flags on received frames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-fix-xilinx-canfd-flags-v1-1-a371c90b4e7c@spacecubics.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM0QrCMAxFf2Xk2cBadDp/RXzo2mRGRibNlMLYv
 1vd47ncc1YwykIG12aFTB8xmbWCOzQQH0FHQkmVwbe+a3vvkKVgkUm0YAzKCXkKo6Ebjunkzsz
 hQlDlV6b6/IdvoLTAfR/tPTwpLr8kbNsXOLaTT38AAAA=
X-Change-ID: 20260921-fix-xilinx-canfd-flags-1b4d517ffa8e
To: Harini T <harini.t@amd.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Appana Durga Kedareswara rao <appana.durga.rao@xilinx.com>, 
 Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Cc: linux-can@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Maximilian Zimmermann <maxz@spacecubics.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1789970955; l=2529;
 i=maxz@spacecubics.com; h=from:subject:message-id;
 bh=5e1DN0MH+2uhstHQPY9yvSOiQBlfYmFimowFYKSkVuA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgTdhHxRWjd/5fTnSCl2OntVxEesqbE
 9i5nsw3HMsMZQEAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKXfMkUxdDkzbUxrYqcR9CmxaEoMSR48XP0S0bdMqlRh9gJxY12FDmi0dDFtQsct5b1Va9/oXnU
 BgiIyHvpargc=
X-Developer-Key: i=maxz@spacecubics.com; a=openssh;
 fpr=SHA256:0PWSMXfOZY6FZQRGGLZq/AMDyoKTiLmNTaQ2XShpqeA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_230920_362096_294A6A9C 
X-CRM114-Status: GOOD (  14.97  )
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

The Xilinx CAN FD controller reports the bit rate switch (BRS) and error
state indicator (ESI) in the receive buffer DLC register. The receive
path currently uses this register to determine frame format and payload
length, but does not set BRS and ESI in struct canfd_frame::flags.

This results in applications being unable to receive the BRS and ESI
flags, even when the controller correctly received them.

Add the ESI register mask and copy the controller flags to the
corresponding SocketCAN canfd_frame struct.

Fixes: c223da689324 ("can: xilinx_can: Add support for CANFD FD frames")
Cc: stable@vger.kernel.org
Signed-off-by: Maximilian Zimmermann <maxz@spacecubics.com>
---
Tested building against net/main and backported
linux-xlnx (31626ef92ff1).

Also tested runtime on the backported linux-xlnx kernel with
QEMU Xilinx CAN FD 2.0 connected through host SocketCAN to a
physical board via candump. Verified reception with and without BRS
using frames transmitted by the board. Send an ESI frame using
cansend on the host and verified that both QEMU and board
reported ESI.
---
 drivers/net/can/xilinx_can.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/can/xilinx_can.c b/drivers/net/can/xilinx_can.c
index 43d7f22820b8..52661e088205 100644
--- a/drivers/net/can/xilinx_can.c
+++ b/drivers/net/can/xilinx_can.c
@@ -157,6 +157,7 @@ enum xcan_reg {
 #define XCAN_2_FSR_RI_MASK		0x0000003F /* RX Read Index */
 #define XCAN_DLCR_EDL_MASK		0x08000000 /* EDL Mask in DLC */
 #define XCAN_DLCR_BRS_MASK		0x04000000 /* BRS Mask in DLC */
+#define XCAN_DLCR_ESI_MASK		0x02000000 /* ESI Mask in DLC */
 #define XCAN_ECC_CFG_REECRX_MASK	BIT(2) /* Reset RX FIFO ECC error counters */
 #define XCAN_ECC_CFG_REECTXOL_MASK	BIT(1) /* Reset TXOL FIFO ECC error counters */
 #define XCAN_ECC_CFG_REECTXTL_MASK	BIT(0) /* Reset TXTL FIFO ECC error counters */
@@ -959,6 +960,11 @@ static int xcanfd_rx(struct net_device *ndev, int frame_base)
 
 	/* Check the frame received is FD or not*/
 	if (dlc & XCAN_DLCR_EDL_MASK) {
+		if (dlc & XCAN_DLCR_BRS_MASK)
+			cf->flags |= CANFD_BRS;
+		if (dlc & XCAN_DLCR_ESI_MASK)
+			cf->flags |= CANFD_ESI;
+
 		for (i = 0; i < cf->len; i += 4) {
 			dw_offset = XCANFD_FRAME_DW_OFFSET(frame_base) +
 					(dwindex * XCANFD_DW_BYTES);

---
base-commit: 1e24c4f2ee44be0eee94092b5d13cbdb4bdf0d60
change-id: 20260921-fix-xilinx-canfd-flags-1b4d517ffa8e

Best regards,
--  
Maximilian Zimmermann <maxz@spacecubics.com>


