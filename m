Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8E6CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ROb6l0esQuEFMG0ONS9trNOcFqKanMbtjSg64V55ITE=; b=oCyzKx4LxXdVfvKUelF0/uUqOb
	v/fymWk19UuNPQ5Apg7qVE1kI2sVBkheWtBD2NQeawVLUUNogIEgQ4IIvbgQ0NaVN368Bki/JmYVg
	9dnJJ6hIplvuozpsr/e/ud6WDBgA4J7wShuHf99oEoFsYWEMqfTYcscJVt2gXlH7UOO1jHYqJh+84
	njNsAaazTwC0Vl9zJQkbO0D3EugmyYkvQ22VqDxiSofNL6a26CUWGdKwE/evsUG7I7KBAjf7+P9Pg
	LW8YfASqLsyEYvVXNe/N5hvm4HZDpl5+gNAIkPbooAKUsR+PPnwJKWs5Snm9NO8GDP17alfmoqSaV
	LxMhk5Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSx4-0000000EfzZ-06zA;
	Mon, 27 Oct 2025 19:32:22 +0000
Received: from mx13.kaspersky-labs.com ([91.103.66.164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSwz-0000000EfwH-3Kn8;
	Mon, 27 Oct 2025 19:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1761593525;
	bh=ROb6l0esQuEFMG0ONS9trNOcFqKanMbtjSg64V55ITE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Kkm2QTIP+APmb1lWTFbiC33JTqXdsEvG5B3i/ZuhOW1nQdrko/2ij7dr8dtatYgfy
	 hqzdR6UpYdSq7hibshNSU4nx2gE6s9EeDVroaRNghUohTqxNfIqbjooJbYXuG0OyTZ
	 hz93vnvB7bG+6aXqEmjLzyVMNjiG+29JuMQbRqf9g+iDsgshQkNoWxeIog59KMp8Ah
	 sDX10he711NrqQLUjLQIrlcx/3EWm+ZrHpNHik3kPdrTOjNlkmzj0+szcduuBXmIxG
	 BZ2HLjJyAwhFY4iLsYGf8aCjnoF8Qzj/mAv54QnFg9ddVfxjOL2WToWL2x/W4btNNc
	 3Lwalcp2sD2QQ==
Received: from relay13.kaspersky-labs.com (localhost [127.0.0.1])
	by relay13.kaspersky-labs.com (Postfix) with ESMTP id 3B5C43E273E;
	Mon, 27 Oct 2025 22:32:05 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub13.kaspersky-labs.com (Postfix) with ESMTPS id 7AAAB3E26EC;
	Mon, 27 Oct 2025 22:32:04 +0300 (MSK)
Received: from zhigulin-p.avp.ru (10.16.104.190) by HQMAILSRV2.avp.ru
 (10.64.57.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 27 Oct
 2025 22:32:03 +0300
From: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
CC: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH] usb: mtu3: fix possible NULL pointer dereference in ep0_rx_state()
Date: Mon, 27 Oct 2025 22:31:50 +0300
Message-ID: <20251027193152.3906497-1-Pavel.Zhigulin@kaspersky.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.16.104.190]
X-ClientProxiedBy: HQMAILSRV2.avp.ru (10.64.57.52) To HQMAILSRV2.avp.ru
 (10.64.57.52)
X-KSE-ServerInfo: HQMAILSRV2.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 10/27/2025 19:22:10
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 197495 [Oct 27 2025]
X-KSE-AntiSpam-Info: Version: 6.1.1.11
X-KSE-AntiSpam-Info: Envelope from: Pavel.Zhigulin@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 72 0.3.72
 80ff96170b649fb7ebd1aa4cb544c36c109810bd
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: zhigulin-p.avp.ru:7.1.1,5.0.1;kaspersky.com:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/27/2025 19:24:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 10/27/2025 6:00:00 PM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2025/10/27 14:30:00 #27802224
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_123218_439223_2B529196 
X-CRM114-Status: GOOD (  15.54  )
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

The function 'ep0_rx_state()' accessed 'mreq->request' before verifying
that mreq was valid. If 'next_ep0_request()' returned NULL, this could
lead to a NULL pointer dereference. The return value of
'next_ep0_request()' is checked in every other code path except
here. It appears that the intended 'if (mreq)' check was mistakenly
written as 'if (req)', since the req pointer cannot be NULL when mreq
is not NULL.

Initialize 'mreq' and 'req' to NULL by default, and switch 'req'
NULL-checking to 'mreq' non-NULL check to prevent invalid memory access.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: df2069acb005 ("usb: Add MediaTek USB3 DRD driver")
Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
---
 drivers/usb/mtu3/mtu3_gadget_ep0.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c b/drivers/usb/mtu3/mtu3_gadget_ep0.c
index e4fd1bb14a55..ee7466ca4d99 100644
--- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
+++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
@@ -508,8 +508,8 @@ static int handle_standard_request(struct mtu3 *mtu,
 /* receive an data packet (OUT) */
 static void ep0_rx_state(struct mtu3 *mtu)
 {
-	struct mtu3_request *mreq;
-	struct usb_request *req;
+	struct mtu3_request *mreq = NULL;
+	struct usb_request *req = NULL;
 	void __iomem *mbase = mtu->mac_base;
 	u32 maxp;
 	u32 csr;
@@ -519,10 +519,11 @@ static void ep0_rx_state(struct mtu3 *mtu)

 	csr = mtu3_readl(mbase, U3D_EP0CSR) & EP0_W1C_BITS;
 	mreq = next_ep0_request(mtu);
-	req = &mreq->request;

 	/* read packet and ack; or stall because of gadget driver bug */
-	if (req) {
+	if (mreq) {
+		req = &mreq->request;
+
 		void *buf = req->buf + req->actual;
 		unsigned int len = req->length - req->actual;

--
2.43.0


