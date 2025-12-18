Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB9FD68BEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7f3Sm7AmL2ZhVGZQ6vT9Xr0wsX9S/g0iKtqgyQHDdDI=; b=aZ6rIQqFD2tHtoHEvBEq75zaYO
	oWbHtgiGYR8WZJIaXXttya1Hz33ka6/egB/rJe1f90Um/pTZA1GC3jnEDRi9mXybhq3aCRnrgL/ki
	/E+5KNxeA09cYyLO7MXSBxJkX7U6igXN1kooLlN5ErvIe+Il6oNC8v5dMzN3Q3G9Fpb6ZLS4vyHwn
	n7MWvVSfd/UcCHLRON1w9vzwcWl3uBdhb3kdJKbvejLkkTn7TchvCFOzKkwc1R/RLuN56LgSFynjr
	npeae7x2M9y9ZX/PP53q+VCeDO542TE8g9qLLuRMB3Fv3ClsPj3bGhchVd5tCS9zIXl9tyVB8fU1j
	FfXQbZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9YN-000000084bn-1r1z;
	Thu, 18 Dec 2025 08:40:07 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW9YL-000000084aT-15Dz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:40:06 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6EABA1189;
	Thu, 18 Dec 2025 09:39:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1766047192;
	bh=EHuzCXobNU2dCEe4gFQZ/GrmHkn2MkorXFYR9tLA8Yg=;
	h=From:Date:Subject:To:Cc:From;
	b=aJmA9BqoU0YMiPdKz60u69oHCC2lNWZCEBSASPs9k97PYNcEN1CL5iWvKxbc930P7
	 ysGopEnPVVMUMMKhV681TCGw88Y9Ds3lOFXFOB8Eh4RiRl9sW6s1oghcXF08EJCbfM
	 J+gac9wqph6oQfiIysMr8XbVf1larFAQHmH12/eY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 18 Dec 2025 10:39:37 +0200
Subject: [PATCH] dmaengine: xilinx_dma: Add support for residue on direct
 AXIDMA S2MM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-xilinx-dma-residue-fix-v1-1-7cd221d69d6b@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIAMm9Q2kC/x2MwQqDMBAFfyXs2YUmqLX+ingQ87Yu2FQSKgHJv
 zd4nIGZixKiItFoLoo4Nek3VLCNoXVbwhusvjK5h+usswNn3TVk9p+FI5L6H1g0s/Ro5fUUQW+
 pxkdE1fd4mkv5A2UzCV5oAAAA
X-Change-ID: 20251218-xilinx-dma-residue-fix-f6e4f97ffe61
To: Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Vishal Sagar <vishal.sagar@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2067;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=EHuzCXobNU2dCEe4gFQZ/GrmHkn2MkorXFYR9tLA8Yg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpQ73bzaL/oeu2jD8Z/n8Udmk5x97gAdNptDVXD
 RDNn7Lemw6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaUO92wAKCRD6PaqMvJYe
 9XPND/9SjYmW1LxDy5xNWsmWjsiKvDq8aIddbhTo5rarW9dY4Ou9XLaMDmVFfUezUKKPxw2EdO/
 ei0DVapBwaVUrBG98JMrVjbOPiRXp/uIR4nGM7NrPI61sBqZEHKEPqH9Ef+ZfRvq+4qMV6Mgl/U
 c/Fsl8FNrhNftTSjN8mM0WxQqVolqFLKhpMIVg9MTt5EHJKiOPxr9WxseA5gdc6LZvLP6DYDOAv
 0qz9Th9zmYEW3qWdVoSi+16bg7LjagBkj2NU49qlykVT7Ze3buo1AE2hXwhnqthL2Rl0RtaLBfI
 1ZRGVpl2ZrDFvImGdYOmci9wcQMZ+DLk7Hsrpl+tR9SnmtGwHnDhiAu4kjEKgYBetvkG0sqRhMV
 lJiTEBJdAsPwUwAVW4Rk6znM/yJNBpPsXXWmYJuiGKgB85pSyjPyWarjavB2ikbGSIHUvZhkwi8
 2dhQH3nKnp91bw1v6yEQzEvK7YzpN8w02UzMsgN+Bv2JBN98SbZJouW9JHvfeS8+/RaIMgzNkVu
 eLHufCIf6+pNN/2o32AxeUxLSRytP20YUixmId8qUDph+ZmaqZAvueEnk1JqpM06K/6lfw2U9Q3
 uiBcvdfc6QSjMkUWMHfwYulTij7ab2s1Q9bQ+Qc3lf44EbZ5Be6RGY7CnqtqliTVQEuifY//uam
 n8MpdOcyNGEFVsA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_004005_445607_76CBE4D2 
X-CRM114-Status: GOOD (  10.85  )
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

AXIDMA IP supports reporting the amount of bytes transferred on the S2MM
channel in direct mode (i.e. non-SG), but the driver does not. Thus the
driver always reports that all of the buffer was filled.

Add xilinx_dma_get_residue_axidma_direct_s2mm() which gets the residue
amount for direct AXIDMA for S2MM direction.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/dma/xilinx/xilinx_dma.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index fabff602065f..64b3fba4e44f 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -1021,6 +1021,24 @@ static u32 xilinx_dma_get_residue(struct xilinx_dma_chan *chan,
 	return residue;
 }
 
+static u32
+xilinx_dma_get_residue_axidma_direct_s2mm(struct xilinx_dma_chan *chan,
+					  struct xilinx_dma_tx_descriptor *desc)
+{
+	struct xilinx_axidma_tx_segment *seg;
+	struct xilinx_axidma_desc_hw *hw;
+	u32 finished_len;
+
+	finished_len = dma_ctrl_read(chan, XILINX_DMA_REG_BTT);
+
+	seg = list_first_entry(&desc->segments, struct xilinx_axidma_tx_segment,
+			       node);
+
+	hw = &seg->hw;
+
+	return hw->control - finished_len;
+}
+
 /**
  * xilinx_dma_chan_handle_cyclic - Cyclic dma callback
  * @chan: Driver specific dma channel
@@ -1732,6 +1750,9 @@ static void xilinx_dma_complete_descriptor(struct xilinx_dma_chan *chan)
 		if (chan->has_sg && chan->xdev->dma_config->dmatype !=
 		    XDMA_TYPE_VDMA)
 			desc->residue = xilinx_dma_get_residue(chan, desc);
+		else if (chan->xdev->dma_config->dmatype == XDMA_TYPE_AXIDMA &&
+			 chan->direction == DMA_DEV_TO_MEM && !chan->has_sg)
+			desc->residue = xilinx_dma_get_residue_axidma_direct_s2mm(chan, desc);
 		else
 			desc->residue = 0;
 		desc->err = chan->err;

---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251218-xilinx-dma-residue-fix-f6e4f97ffe61

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


