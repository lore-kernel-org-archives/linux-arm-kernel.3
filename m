Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E14C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 21:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KxU3JdBAeVtqTxqK28+IsVvwnIdRSd24xGRcP1Fs0Lc=; b=pVWm4B6/Mtllsx6rERUO/ycLHT
	se/Ng8hNfPvrHaYB6TjTmAZFTkLFN7F+TnEtp56ADXeNQ3IRfj3oyMdg+oFjwTu71EN6ZLMcsW9In
	zmM5WyMfYCpx9tEZ+dU8dKxj3UZhs+JcSSdQJ2bPn7xzdyVVbgxyaeVTOZPsa5PKWUWIKZBOpPo/W
	In2Rjx16jCDSm5z6Q6nSWJXbk4VfPU4BOQ0lqRmH1k6NErSvSFKGI2LnGCC1oqqfsSHJy2MnubQYI
	AOXCxfsJNI62YZixtSX6JOsO3kK12yw+nj8fgwsIHNR4bNvqXJi5Hqbf/A6rpU5A+pWv/oGHUbyFd
	Lz8cW9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZzHO-00000006SVl-1emG;
	Mon, 20 Jan 2025 21:25:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZzG6-00000006ST0-1W82
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 21:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737408272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KxU3JdBAeVtqTxqK28+IsVvwnIdRSd24xGRcP1Fs0Lc=;
	b=LOY1gey3JstB13+D7jqoAIFfAPandP5iiEVBb9vW+tLgkHTb7zxCIVna16OMG3rkZgD4Xv
	F8RKapzo2OEZoJeDqiwVjP2oI4X4nYr0Ueq7vMiCWJHwdfpAGHQeeqmT7bPmLEfkOXoGbz
	4QfpU2CD5YsHiPyQzqoCpwinHT0TCps=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-cn2L1q3qNBKRwObT92B8Dg-1; Mon,
 20 Jan 2025 16:24:28 -0500
X-MC-Unique: cn2L1q3qNBKRwObT92B8Dg-1
X-Mimecast-MFC-AGG-ID: cn2L1q3qNBKRwObT92B8Dg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 69B961955F2D;
	Mon, 20 Jan 2025 21:24:27 +0000 (UTC)
Received: from thinkpad-p1.kanata.rendec.net (unknown [10.22.65.113])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 38C5A19560B0;
	Mon, 20 Jan 2025 21:24:26 +0000 (UTC)
From: Radu Rendec <rrendec@redhat.com>
To: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [RFC PATCH] firmware: arm_scmi: Support mailbox transports with no completion IRQ
Date: Mon, 20 Jan 2025 16:24:18 -0500
Message-ID: <20250120212418.889385-1-rrendec@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j8BjqSRau3CshJUitsadu4mRr1YT8v3m60RdVQWrOj0_1737408267
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_132434_469844_DFA36CC8 
X-CRM114-Status: GOOD (  13.25  )
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

With the introduction of no_completion_irq in struct scmi_chan_info in
commit a690b7e6e774 ("firmware: arm_scmi: Add configurable polling mode
for transports") it became possible to enable polling mode by default
when the transport does not support completion interrupts.

Mailbox controllers on the other hand have a similar mechanism to
indicate if completion interrupts are available, using the txdone_irq
flag in struct mbox_controller. This is available since the introduction
of the mailbox framework in commit 2b6d83e2b8b7 ("mailbox: Introduce
framework for mailbox").

Since the mailbox framework is already aware of whether the underlying
transport supports completion interrupts or not, set the flag correctly
in mailbox_chan_setup() to propagate the information to the SCMI core
layer. Without this change, scmi_wait_for_reply() would end up taking
the second branch for a mailbox transport with no completion IRQ
support, and time out waiting for an interrupt that never comes.

Signed-off-by: Radu Rendec <rrendec@redhat.com>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index b66df29814566..33722f2d82787 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -9,6 +9,7 @@
 #include <linux/err.h>
 #include <linux/device.h>
 #include <linux/mailbox_client.h>
+#include <linux/mailbox_controller.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -221,6 +222,9 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		return ret;
 	}
 
+	if (!smbox->chan->mbox->txdone_irq)
+		cinfo->no_completion_irq = true;
+
 	/* Additional unidirectional channel for TX if needed */
 	if (tx && a2p_rx_chan) {
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
-- 
2.47.1


