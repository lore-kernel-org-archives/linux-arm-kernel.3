Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30BAC5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 06:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pHr4Y8C7R5Apz3Ajw29/NxHZ11lFDdErrS4WW8DaORk=; b=0Rm7nfok+AwqjiNGfvGBsTzOwJ
	YUYv+vd/u8C/xb34Ceuae8ZliB3jSX/J3ed5d0fV7q+hWIJGV/1gc2K/MJ8MTAU4sAjCQF8dJBBfj
	XS0bHxwHnCIYnsA393jAqOkKvFvGer6BoTzVf62u4ZOXRvkO0g6KrFSeVmh8nq/KpXumgE2fEfY9S
	Xn/1U/dHBaDjUlKGmIvZiXBC5qwhBEdnchlpbpBlMn+8crVfyzpY0WazgAASrWzx6tf0+nUTXthIs
	9PDt2p+RVSvnC1odNZkmPDew/4T/5J97eyFDOnnvE0+BI2rjWk2KyHO4IKZ1QZXUNmL+XzC4imEDu
	il9qi6+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDD2-00000007Oas-0swL;
	Tue, 18 Aug 2026 06:22:04 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwDCz-00000007OaD-3dXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 06:22:03 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so1751703f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 23:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787034120; x=1787638920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHr4Y8C7R5Apz3Ajw29/NxHZ11lFDdErrS4WW8DaORk=;
        b=MX2j2ZX3P5MfZV9L50RQP/UuKkZkZjCM/S4yuqPZ1WoHNJB2anjO4HVrJFT+Ek7g7U
         Kj2gVfOJLiuk/HjW58vmeSmEKAN+4sQFTD7fgIdzaIFWX7b7efYINxqlUQySkwbR3vxg
         JCDrL+Cub7DHNCCJe/1VN0jceNytP3LwO88E5U3aw8YUl5hljepC3wUoBU9azIqPJogl
         OWJEPvgjRlaUNeXYbly4JkLgWwDkINZ6LIOMyB6R5KOGddXjVBUomQ5LQIRifdyvl6th
         wu5AlbGagw0boWa874AxMTT6OZT6N7PbQHZoIexzdy8c4+dqIbz0ScbxnX4rELHPnbvn
         WIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787034120; x=1787638920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHr4Y8C7R5Apz3Ajw29/NxHZ11lFDdErrS4WW8DaORk=;
        b=OG64vZEQa16u4B/JVw3MJMViFiBTC9527tKJpesEsTOL+ACFZl0ZQXqf4EQAS/Kjn/
         AXfkOC2fq1tuegC2FUgICzxDDCaEKjWghVRYuZFf19tCRFAFtl8CWUBXePntTMII7zkF
         WIji5l+DhKAXo1RwMiMQoarGLG/S8cJes1szM7XfBmRuCvfogVKGbqOO7TS+Uf7tVjoH
         zqrTYkXfmZaC/fty1n2Wc9/0JRzVFkoNU2yWvu0SkIXAxN1oohyaWTs8uF8EGlM/fxyz
         01X5YYKUTRIE+Qnf2yRRSPMalgCzoRGrOi+G73hQgB+dV3Sq30+QppckKClMb/DVEbyG
         5Jlw==
X-Forwarded-Encrypted: i=1; AHgh+RobiDVxFZQB9CKqdoQvQ7F0dC6VQ/q5oNc+6QEpQiFJ6geW0Aa6GKEx7wA9qdqwwkjdCDoLARe4K2pXhMHbCArD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7NF5S+46ke4VMkFnmPxuv7q1vNwT6MrzyWsXXLEWs0bUHJ3D4
	oErCRsle7Ni4qhiir3zXbEBgiQfzp9HJ018aYWnmc4ScRHygCvkbrxkX
X-Gm-Gg: AR+sD11Wp8dwFf+2pu06RAMc3rn3E03RoLREY4bLGQmYDHotA7NB0xT75G3/NDo5wA4
	xRzrTx1IQZMuPe99ZHwSmWo/qiRjemJKnFzvJfBh9QUY/Mq6qOkXBEx2ilQIoaGa1QXjVVXhB7k
	ayMKZDLmNw2sftVmzYkNTagwGG9GxurDd+Wrkheos6ze6UUUZr3lW27Kd9N4npg6V4XnDFIvF0L
	YVh+ijxvI7cL8ZkggF7y9A8uPenqcVqLG24m8XCuDdugieNUZPkbexVf9HiHzvXFjJk+1Dk8Koa
	IiJI+f9rBdWXuyVuqm6kDJPcnyet9OIrXS4/tsKtnBI8V2O+xIhKiT66+eX3ckbR4eAfXf7J5mJ
	oxjUp8Oyv5ws9Dt/YvllCbX7u1C+ttXlo6y9l0P2fa2lYdrKdPmRBFLmvxfCyg+BhMnFMGJTIA8
	5IF22o+rPcpsfCJBwvTmP9PMKWpNA7RmTEW6U/zNjMP1rAl7oouWDhwq0aa9z4okzK/0xN3qGBB
	kjIcWXBazTe7lN/AJ77wuRCGHqlZ3fWLbBkk3aM7es=
X-Received: by 2002:a05:6000:46d4:b0:481:5ba5:9927 with SMTP id ffacd0b85a97d-48160705dcemr32728199f8f.9.1787034119642;
        Mon, 17 Aug 2026 23:21:59 -0700 (PDT)
Received: from fedora ([46.205.218.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b660sm9346196f8f.15.2026.08.17.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:21:59 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	win847@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH v9] net: airoha: npu: use cacheline-sized buffers for mailbox DMA
Date: Tue, 18 Aug 2026 08:20:38 +0200
Message-ID: <20260818062038.1599651-1-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_232201_923056_5C24D687 
X-CRM114-Status: GOOD (  13.33  )
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

On EN7581 + MT7996 (Gemtek W1700K), mapping small caller buffers with
DMA_BIDIRECTIONAL regresses NPU version probe: the mailbox completes
successfully but WLAN_FUNC_GET_WAIT_NPU_VERSION reads as 0.0 instead of
0.1111.

Round mailbox payload allocations up to dma_get_cache_alignment() and
map the same rounded length with DMA_BIDIRECTIONAL while programming
the original payload length into the mailbox length register. On EN7581
the rounded map length is required for GET responses to be visible;
mapping only the payload size regresses probe back to 0.0.

Tested on Quantum Fiber / Gemtek W1700K (EN7581 + MT7996), kernel
6.18.44, including cold reboot.

Fixes: 6f884eb87a79 ("net: airoha: Fix DMA direction for NPU mailbox buffer")
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260814110017.2795022-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260809152813.585797-1-pawlik.dan@gmail.com/
Link: https://patchwork.kernel.org/project/linux-mediatek/patch/20260805070851.2885888-1-pawlik.dan@gmail.com/
Assisted-by: Cursor:composer-2
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 25 +++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index b679bed952de..9c95ddd7002e 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/devcoredump.h>
+#include <linux/dma-mapping.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
 #include <linux/of_net.h>
@@ -160,15 +161,21 @@ struct wlan_mbox_data {
 	DECLARE_FLEX_ARRAY(u8, d);
 };
 
+static size_t airoha_npu_mbox_size(size_t len)
+{
+	return ALIGN(len, dma_get_cache_alignment());
+}
+
 static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 			       void *p, int size)
 {
 	u16 core = 0; /* FIXME */
 	u32 val, offset = core << 4;
 	dma_addr_t dma_addr;
+	size_t map_len = airoha_npu_mbox_size(size);
 	int ret;
 
-	dma_addr = dma_map_single(npu->dev, p, size, DMA_BIDIRECTIONAL);
+	dma_addr = dma_map_single(npu->dev, p, map_len, DMA_BIDIRECTIONAL);
 	ret = dma_mapping_error(npu->dev, dma_addr);
 	if (ret)
 		return ret;
@@ -191,7 +198,7 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
 
 	spin_unlock_bh(&npu->cores[core].lock);
 
-	dma_unmap_single(npu->dev, dma_addr, size, DMA_BIDIRECTIONAL);
+	dma_unmap_single(npu->dev, dma_addr, map_len, DMA_BIDIRECTIONAL);
 
 	return ret;
 }
@@ -333,7 +340,7 @@ static int airoha_npu_ppe_init(struct airoha_npu *npu)
 	struct ppe_mbox_data *ppe_data;
 	int err;
 
-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -354,7 +361,7 @@ static int airoha_npu_ppe_deinit(struct airoha_npu *npu)
 	struct ppe_mbox_data *ppe_data;
 	int err;
 
-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -375,7 +382,7 @@ static int airoha_npu_ppe_flush_sram_entries(struct airoha_npu *npu,
 	struct ppe_mbox_data *ppe_data;
 	int err;
 
-	ppe_data = kzalloc_obj(*ppe_data);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_KERNEL);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -399,7 +406,7 @@ static int airoha_npu_foe_commit_entry(struct airoha_npu *npu,
 	struct ppe_mbox_data *ppe_data;
 	int err;
 
-	ppe_data = kzalloc_obj(*ppe_data, GFP_ATOMIC);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_ATOMIC);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -434,7 +441,7 @@ static int airoha_npu_ppe_stats_setup(struct airoha_npu *npu,
 	int err, size = num_stats_entries * sizeof(*npu->stats);
 	struct ppe_mbox_data *ppe_data;
 
-	ppe_data = kzalloc_obj(*ppe_data, GFP_ATOMIC);
+	ppe_data = kzalloc(airoha_npu_mbox_size(sizeof(*ppe_data)), GFP_ATOMIC);
 	if (!ppe_data)
 		return -ENOMEM;
 
@@ -466,7 +473,7 @@ static int airoha_npu_wlan_msg_send(struct airoha_npu *npu, int ifindex,
 	int err, len;
 
 	len = sizeof(*wlan_data) + data_len;
-	wlan_data = kzalloc(len, gfp);
+	wlan_data = kzalloc(airoha_npu_mbox_size(len), gfp);
 	if (!wlan_data)
 		return -ENOMEM;
 
@@ -489,7 +496,7 @@ static int airoha_npu_wlan_msg_get(struct airoha_npu *npu, int ifindex,
 	int err, len;
 
 	len = sizeof(*wlan_data) + data_len;
-	wlan_data = kzalloc(len, gfp);
+	wlan_data = kzalloc(airoha_npu_mbox_size(len), gfp);
 	if (!wlan_data)
 		return -ENOMEM;
 
-- 
2.55.0


