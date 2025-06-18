Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6282EC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c4XvPKZ0jyzP+/T4B0ak7ickyXY0rfQoxfsZnSW5Rwk=; b=VTleTjFAjEnIam/x4Yl568A8yv
	PdoQNl6MalLPZuOuBasR/BjWmQfu0SlLDYswgx3R6ostwMSgpcIYCD4N7yy5+ynRGfyRc4D9LPniF
	9LeDF8ZEkqfwK5Jax5g1YvnGcqDMbkdE0n/fzg2pxygnPeimID9zB/l7V4faaI5UGTZkJ4dRD37r0
	2g6Jz1wU+OwMuaFjYoAEp/Rb7/60sodmNDQ40IFaapJPFghqNjdYI14Toq4Mg2aLqMulKyQtRL49u
	U7RNWo3w5X+vG4XmWhF2quj/i9tGUzToUivxL6ySTxWuHbZFdrAQugQ8YBx9A/hhynJDqKL02+JiD
	jJQPCiQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkCy-00000008z8e-1Znc;
	Wed, 18 Jun 2025 04:15:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkAm-00000008yzp-298L
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 04:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=c4XvPKZ0jyzP+/T4B0ak7ickyXY0rfQoxfsZnSW5Rwk=; b=IuZSxR/0XD81vt3FoSx0zq1Wmm
	QZHS6FqSBK7EzT11ZfPXh3RbrpusEO8xiPlKhprhqdkCotxg27+hg0dT/xJoLTH4Bf6qKbuikOATG
	e6JS77AzVuaSfdynvRL9DH6PqF2twbA6S3vxg+boCa71W4uZHF7n4xADlP0y+8LF2GuSivWQvdt26
	eF0dNo8SSBDdVHE51qL/8mFlIj99CGYpMz+mJi8Vp4Mr575dPIiAQ+dG9vVhhj/IkLuvGquggiBzF
	NSl5ovS4cORWHscv5wtfZYZa5Eo3T5woCHX0NOKQTQw/tJv2bF4pXnniw2KDCznS+Flc4nsOzKP66
	JBp8tYaQ==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkAi-00000003xM6-3Dhx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:13:16 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowACH2FDLPFJooa5HBw--.34075S2;
	Wed, 18 Jun 2025 12:12:59 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	michal.simek@amd.com,
	u.kleine-koenig@baylibre.com,
	liqiong@nfschina.com,
	colin.i.king@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: gadget: udc-xilinx: Use USB API functions rather than constants
Date: Wed, 18 Jun 2025 12:12:22 +0800
Message-Id: <20250618041222.408372-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACH2FDLPFJooa5HBw--.34075S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF43KFyxJw47Cw13Kr4Uurg_yoW8Jw48pF
	n7Gay8GrWvy3yUX3W5AF1DZFyrGa9F934qyFy2g3yavF1Sqws3tFWrJr1fKrnrCFW3Aa13
	trs8t3ZFqFW7CrJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWrXVW3AwAv7VC2z280aVAFwI0_GcC_XcWlOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCY02Avz4vE14v_Gryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjTRiOz3UUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051313_497997_2E261635 
X-CRM114-Status: UNSURE (   9.53  )
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

Use the function usb_endpoint_num() and usb_endpoint_type()
rather than constants.

The Coccinelle semantic patch is as follows:

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bEndpointAddress & \(USB_ENDPOINT_NUMBER_MASK\|0x0f\))
+ usb_endpoint_num(epd)

@@ struct usb_endpoint_descriptor *epd; @@

- (epd->bmAttributes & \(USB_ENDPOINT_XFERTYPE_MASK\|3\))
+ usb_endpoint_type(epd)

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/gadget/udc/udc-xilinx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index fa94cc065274..8d803a612bb1 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -813,10 +813,10 @@ static int __xudc_ep_enable(struct xusb_ep *ep,
 
 	ep->is_in = ((desc->bEndpointAddress & USB_DIR_IN) != 0);
 	/* Bit 3...0:endpoint number */
-	ep->epnumber = (desc->bEndpointAddress & 0x0f);
+	ep->epnumber = usb_endpoint_num(desc);
 	ep->desc = desc;
 	ep->ep_usb.desc = desc;
-	tmp = desc->bmAttributes & USB_ENDPOINT_XFERTYPE_MASK;
+	tmp = usb_endpoint_type(desc);
 	ep->ep_usb.maxpacket = maxpacket = le16_to_cpu(desc->wMaxPacketSize);
 
 	switch (tmp) {
-- 
2.25.1


