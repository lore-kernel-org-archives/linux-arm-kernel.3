Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C501DFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f/UzBoVYRWWvvqiuIVeXO1qjbaupyhKMOUsVSUfvfxw=; b=PByipTutcPBHXTytmuPqZQoqrm
	fBg0dtjEk2PmVed4upnKgzZuxGJgL9KEICS+y+2VAJ2V8L412hP3qCiaOXz+jVlnmG3fgbKBEy3Y5
	B9K93KqPEBuZ9Jt2uY1U+rOQtMDxq19rsHb6D2GoWOT/XXzjb39Qz0Bw8t7wYMETiNe+2sQ/7Yr1T
	0n9XPIv1T/icBmShGnszBNFlb8Sg+40XZeOPadf2rhgyjwD9VL5Af+1uINQH3LWh4j2iufoNOBEGX
	Aa+xdcjPe3cDLXrF8wc2qxCApwAJI28ELUxNXUtxDGCFlD4HDRWK4YG0Lhp+HPOxUjpRFznvBliEp
	yWk4eJxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHW9U-00000000KbX-2ggB;
	Tue, 28 Apr 2026 00:18:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHW9T-00000000Kab-3Eap
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 00:18:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B04D26012B;
	Tue, 28 Apr 2026 00:18:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64E53C2BCB7;
	Tue, 28 Apr 2026 00:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777335490;
	bh=pX6+8HgPg+/75SzAsHB9znme86Aih5ZL9FPNk75ERIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FTZO1ACond1QyuWms2yeUh6w2WvZrK/37C6xfPBDNsQn/yZ915BFqTI8hSl3MyPGq
	 7UX62Cia71C7Hk91H6CuY0lNqX1S03nNgzqrDhRmTD7DsbAHuzpBreCfS5DkivpPhA
	 y3OARf6rlex1UMgYomJpBEHx3TkleSjfc8GIledGH+uw5M/SQZJxAbKs/ljFKtG0qk
	 UoYiS0Xww6ECLlYUY3XvIm6h3j5mgL9Nl3VZL1AykUCKyWJfVFT9UDXHXKZSFpABXC
	 1QtFsceu0F9Bd6Ok2uP0Zh+wgeECWmay9hU6lc6NtVaWqTLhno4vMzNTrVOd10sLut
	 umrHOd78wosHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 524F9FF8867;
	Tue, 28 Apr 2026 00:18:10 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 27 Apr 2026 17:18:06 -0700
Subject: [PATCH 1/3] i2c: xiic: preserve PEC byte length in SMBus block
 read setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-i2c-xiic-v1-1-e6207f9aa5ad@nexthop.ai>
References: <20260427-i2c-xiic-v1-0-e6207f9aa5ad@nexthop.ai>
In-Reply-To: <20260427-i2c-xiic-v1-0-e6207f9aa5ad@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=abdurrahman@nexthop.ai; h=from:subject:message-id;
 bh=WbRNSgR6fF75ujIFRpZT+WIk0CWNPjAlMacuue3U6KE=;
 b=owJ4nJvAy8zAJbYltPXv6rsCXxhPqyUxZL7/c3B1ziaWhgZtFrFK/7l1X/ruSL6cYMDSVjL1j
 c2+ms//ngV2lLIwiHExyIopssx55P+mraMtYkPMIXuYOaxMIEMYuDgFYCJT7jAydHBtfsJ7Ujyo
 QjBN2L0pu0lRwTj1x/cph3/Ku6i+WVcWz/BPQZ3xXJja3qblId0ujyKkJq17U3jguKjB1QquM6I
 zzQ/zAgDNJ07Z
X-Developer-Key: i=abdurrahman@nexthop.ai; a=openpgp;
 fpr=9CE24FEC86888658B05CC23FB45585FDABDD10F4
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/default with
 auth_id=756
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

xiic_smbus_block_read_setup() overwrites rx_msg->len based on the
announced block length byte, but the i2c core appends an extra byte to
msg->len when PEC is enabled on the client (see
__i2c_smbus_xfer_emulated in i2c-core-smbus.c). Before this handler
runs, rx_msg->len is therefore 1 + pec_len, where pec_len is 0 or 1.

Overwriting rx_msg->len to rxmsg_len + 1 drops that PEC byte from the
caller's buffer: the PEC byte is never drained from the FIFO and the
core's i2c_smbus_check_pec() reads the last payload byte instead of
the actual PEC, returning -EBADMSG even on clean transfers. Capture
pec_len before the overwrite and add it back when recomputing
rx_msg->len.

This is a pure bug fix; non-PEC behaviour is unchanged (pec_len == 0).
Tested on a Xilinx AXI IIC FPGA block driving an adm1266 PMBus
blackbox read -- with PEC enabled the full 64-byte record transfers
cleanly after this change.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..959a47b645a5 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -539,6 +539,8 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 
 	/* Check if received length is valid */
 	if (rxmsg_len <= I2C_SMBUS_BLOCK_MAX) {
+		unsigned int pec_len = i2c->rx_msg->len - 1;
+
 		/* Set Receive fifo depth */
 		if (rxmsg_len > IIC_RX_FIFO_DEPTH) {
 			/*
@@ -546,7 +548,7 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			 * Receive fifo depth should set to Rx fifo capacity minus 1
 			 */
 			rfd_set = IIC_RX_FIFO_DEPTH - 1;
-			i2c->rx_msg->len = rxmsg_len + 1;
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		} else if ((rxmsg_len == 1) ||
 			(rxmsg_len == 0)) {
 			/*
@@ -562,7 +564,7 @@ static void xiic_smbus_block_read_setup(struct xiic_i2c *i2c)
 			 * Receive fifo depth should set to Rx msg len minus 2
 			 */
 			rfd_set = rxmsg_len - 2;
-			i2c->rx_msg->len = rxmsg_len + 1;
+			i2c->rx_msg->len = rxmsg_len + 1 + pec_len;
 		}
 		xiic_setreg8(i2c, XIIC_RFD_REG_OFFSET, rfd_set);
 

-- 
2.53.0



