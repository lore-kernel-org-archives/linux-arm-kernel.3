Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261D7C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 04:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cPmre8+oBAXt4/pXa4kpg6IRg6WUJKjYgdfMZtsh7dY=; b=gwle9UuKnx18x7a1wW5rYcAG8+
	yNaYEs8eFFGGRIWR0x2htBpH5z7PGWA8rBiXjzbnPq+w0lHX3c54r/P89wkYCsSRqCZTNZHFrBbXy
	ij4BVO/3ldoq+rNfiT3Bt2Bn+xbJmze+Y6og9OghaoVwJaTLWogqAt/8KgriIlHlWrmDWPXRpnSNN
	thCLGHdhOO5a+3Oj7+QJKjFDbtnHdZR61nsREjdkf+/DTMIgE6p64erP7j5/rGLSEH1wTuyxM1xq2
	OYpdOMANvi+5wVTIHa4B0ganIZ0fMVAXkCejoVoU/gWnyW/3sPphAB23bF1egHpIEjiZKAGCzdkSX
	PyCbvNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHTY-00000007SLo-2nqv;
	Wed, 25 Jun 2025 04:11:08 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUHRF-00000007SC5-30CM;
	Wed, 25 Jun 2025 04:08:47 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACHCglJdltottQjCQ--.56888S2;
	Wed, 25 Jun 2025 12:08:41 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chris.lu@mediatek.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] Bluetooth: btmtk: Add missing usb_free_urb()
Date: Wed, 25 Jun 2025 12:07:03 +0800
Message-Id: <20250625040703.1021358-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACHCglJdltottQjCQ--.56888S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF43GrWxJrWfZr4kXFWkWFg_yoWfXrgE9w
	10yry7Wr4UG3srA3W2y3yfuFZFkr1rXF97WF9agry3XFyDWr1UC3WjqFyDtasrWr4DKF17
	Aws5uay8Jr1xJjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbTAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr4
	1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
	67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
	8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAv
	wI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
	v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8oGQDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_210846_117165_EDF22D99 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Add missing usb_free_urb() on failure path after usb_alloc_urb().

Fixes: ceac1cb0259d ("Bluetooth: btusb: mediatek: add ISO data transmission functions")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/bluetooth/btmtk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 4390fd571dbd..a95b1074ad36 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1043,8 +1043,10 @@ struct urb *alloc_mtk_intr_urb(struct hci_dev *hdev, struct sk_buff *skb,
 	if (!urb)
 		return ERR_PTR(-ENOMEM);
 
-	if (btmtk_isopkt_pad(hdev, skb))
+	if (btmtk_isopkt_pad(hdev, skb)) {
+		usb_free_urb(urb);
 		return ERR_PTR(-EINVAL);
+	}
 
 	pipe = usb_sndintpipe(btmtk_data->udev,
 			      btmtk_data->isopkt_tx_ep->bEndpointAddress);
-- 
2.25.1


