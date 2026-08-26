Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9556C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5i5vI6tnXF7tzWUylgjE2oxSiQIPXybHe+y/l7IIT6E=; b=Uheh6Ie8vNgZwV+79j+tKTFcYK
	ZAPPjqQ/UBOaEKpz6qJlTghX9ZzrjmKw58HfzZouM4URumEgHJyn0uey/TzXPjQCD3Ekd7bsxtZwI
	RdK8g6n8acdlyYBhouE3vgqRGFkqVaTgrsPqaiEAMOClrhHcawsxuxeF3ZuO6SfG9WcB4kDMfn/No
	FGihRps6gb6tmbXkgFxBY3VfpXgqiZaJHlhYRD/4WWjc99jyGgb5x1OSIklaa4CTkNoCRvl0LdWIW
	uh6C7IVD6V9ykwmWc9R2nhyElmTzP5DFH+dittoJwTVdtJQ48CGnT6Zd1bzviGS4EOfYg4xxEi0Rr
	gz7kG3FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDnj-00000002WKG-2tp8;
	Wed, 26 Aug 2026 13:36:23 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzDne-00000002WJD-2gaF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 13:36:21 +0000
X-UUID: 15ff82d0a15311f19a56ed5b684f684d-20260826
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:6d20cedd-ab11-4185-9dc4-88b344281a05,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:f233b56e8abefb0aacba6566bbd6482e,BulkI
	D:nil,BulkQuantity:0,SF:102|136|850|865|898,TC:nil,Content:0|15|50,EDM:5|-
	100,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 15ff82d0a15311f19a56ed5b684f684d-20260826
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 222379006; Wed, 26 Aug 2026 21:36:04 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michal Simek <michal.simek@amd.com>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: [PATCH] usb: gadget: udc-xilinx: cap non-EP0 OUT transfers to the request buffer
Date: Wed, 26 Aug 2026 21:36:00 +0800
Message-Id: <20260826133600.3797953-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_063619_083796_5C5B6F02 
X-CRM114-Status: GOOD (  15.51  )
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

xudc_read_fifo() takes the transfer size from the endpoint count
register (device/host-controlled for OUT packets) and, if the request
still has some room (bufferspace != 0), passes it straight to
xudc_eptxrx():

    count = udc->read_fn(udc->addr + ep->offset + bufoffset);
    bufferspace = req->usb_req.length - req->usb_req.actual;
    if (!bufferspace) { ... }                /* only the ==0 case handled */
    ret = xudc_eptxrx(ep, req, buf, count);  /* PIO: memcpy_toio(buf, epram, count) */
    req->usb_req.actual += min(count, bufferspace);

There is no cap of count against bufferspace.  The PIO path copies the
full count bytes into req->usb_req.buf + actual (memcpy_toio), and the
DMA path programs a DMA of length count - both will overflow the
request buffer whenever count > bufferspace, with only the bookkeeping
(actual += min(count, bufferspace)) clamped afterwards.

Attack chain (USB peripheral mode, non-EP0 OUT endpoint; attacker is
the USB host):

    malicious host -> OUT packet on epX -> UDC interrupt
      -> xudc_read_fifo() -> count = endpoint count register (e.g. 64)
      -> request with req.length = 8, req.actual = 7 (1 byte left)
      -> bufferspace = 1, count > bufferspace, bufferspace != 0
      -> xudc_eptxrx() PIO OUT: memcpy_toio(req.buf + 7, epram, 64)
      -> 63 bytes past the 8-byte request buffer
      (dwc2-style FunctionFS / f_tcm gadgets submit short requests, so
       the interface does not guarantee a buffer as large as the
       endpoint max packet size.)

Reproduced (kernel 7.2.0+, KASAN/SLUB debug): calling the real
xudc_read_fifo() with the above state leaves req->usb_req.actual = 8
(count 64, bufferspace 1, actual += min = 1) while the PIO copy has
already written 64 bytes: byte 7 of the 8-byte buffer changes from the
0xBB marker to FIFO data and the SLUB redzone plus neighbouring slab
objects past the buffer are overwritten (65 of 72 dumped bytes differ
from the pre-use pattern) - the out-of-bounds write is observed
byte-for-byte.  (memcpy_toio goes through an architecture copy routine
that generic KASAN does not instrument, so the surrounding-memory clobber
is the forensic evidence.)

Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
Assisted-by: opencode:deepseek-v4-flash-free
---
 drivers/usb/gadget/udc/udc-xilinx.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/usb/gadget/udc/udc-xilinx.c b/drivers/usb/gadget/udc/udc-xilinx.c
index bef06fe7543b..63749fd97625 100644
--- a/drivers/usb/gadget/udc/udc-xilinx.c
+++ b/drivers/usb/gadget/udc/udc-xilinx.c
@@ -627,6 +627,24 @@ static int xudc_read_fifo(struct xusb_ep *ep, struct xusb_req *req)
 		return 0;
 	}
 
+	if (count > bufferspace) {
+		/*
+		 * The host sent a packet larger than the request buffer.
+		 * The PIO path would memcpy_toio() the whole packet into
+		 * req->usb_req.buf (and the DMA path would program a DMA
+		 * transfer of count bytes), overflowing the buffer; only the
+		 * bookkeeping actual += min(count, bufferspace) afterwards
+		 * would be clamped.  Complete the request with -EOVERFLOW
+		 * instead of copying past it.
+		 */
+		if (req->usb_req.status != -EOVERFLOW)
+			dev_dbg(udc->dev, "%s overflow %d into %u\n",
+				ep->ep_usb.name, count, bufferspace);
+		req->usb_req.status = -EOVERFLOW;
+		xudc_done(ep, req, -EOVERFLOW);
+		return 0;
+	}
+
 	ret = xudc_eptxrx(ep, req, buf, count);
 	switch (ret) {
 	case 0:
-- 
2.25.1


