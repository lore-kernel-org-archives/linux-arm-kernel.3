Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519CBC44503
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wo1cSCYChzZ+SeD4Rr4ePKZmOVyTbiqYMm+hrcWkjS0=; b=Ow/MkeEGa01S6xP2H/U+vNCyKf
	jgh9MVr3dmaPGLJ870kw8p4b2EAAhrmEzITCbM2OZxT1wbrOMT+Xg5hmgJYmXf2fRRJASf5wtNIdt
	1cRQOirT53yx/CNNAeZ11L6V9UqAsTN94+Cn2v/q6uqM1BcFUGp6xwrpJ2GYMN4Fs0Nc99dTAoKhr
	mmzn3IOWWlEOVMX1PdLu9/eZk7MeA6lSOKhrp6PN50U2h0aMThAQRUs+SraaRedgD54+6h0i985ox
	STw5cAczMw73CBYZhqbf767HVXp50PErIjiIq6ZzsB+1XfBfiP99QBX5uGBbHfhJ+yYmXvt29XuBm
	ETM2AlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO9F-0000000GgIr-1IQC;
	Wed, 08 Jul 2026 09:00:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whO8z-0000000Gg2N-3Bpm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:00:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 75E1C43714;
	Wed,  8 Jul 2026 09:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C706A1F00A3F;
	Wed,  8 Jul 2026 09:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783501237;
	bh=wo1cSCYChzZ+SeD4Rr4ePKZmOVyTbiqYMm+hrcWkjS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UWVyCicP2vd4Hqdjn6YarNc/v6EXOCehpqC3QBGrC7RoY7Gsm1eb81KsSJ4/JINWj
	 AzKCrbKxpSvCyAyM/ZEU+pYfnxyNdess6Aq5PoL4rlyppNE5k5cwM0Y1pRwYz6XzBq
	 dLqAsIE8NSszJQI74hvQFCvD9Uqq3npPZxwjAjq78ypZEwWCqmc1KWhg9jG6CEVWCr
	 AfxAIGKRYguW2bhmak9h3ABIeyimh0HDqY8qKvZOAC0xsg2laC3pP2mr1esCk+S0b9
	 tBzKNgcE6Gm6rw2rU+qgg+nY07fI234Zg3XHa8vr9LsszaBoIVPLC2SajSN28VooFd
	 ZGEmlHHP/13sg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Wed, 08 Jul 2026 10:00:09 +0100
Subject: [PATCH v4 13/16] firmware: arm_scmi: Unwind TX receiver mailbox
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-scmi_core_fixes-v4-13-53142cd60b63@kernel.org>
References: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
In-Reply-To: <20260708-scmi_core_fixes-v4-0-53142cd60b63@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
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

mailbox_chan_setup() can request an additional unidirectional TX
receiver channel after successfully acquiring the primary channel. If
that second request fails, the function returns immediately and leaves
the primary channel allocated.

Unwind the primary mailbox channel before returning the error so probe
deferral or other setup failures do not leave the channel busy for later
probe attempts.

Fixes: 9f68ff79ec2c ("firmware: arm_scmi: Add support for unidirectional mailbox channels")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index b6459fbb8151..37e3eab529ea 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -230,9 +230,10 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		smbox->chan_receiver = mbox_request_channel(cl, a2p_rx_chan);
 		if (IS_ERR(smbox->chan_receiver)) {
 			ret = PTR_ERR(smbox->chan_receiver);
+			smbox->chan_receiver = NULL;
 			if (ret != -EPROBE_DEFER)
 				dev_err(cdev, "failed to request SCMI Tx Receiver mailbox\n");
-			return ret;
+			goto err_free_chan;
 		}
 	}
 
@@ -248,6 +249,8 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	return 0;
 
+err_free_chan:
+	mbox_free_channel(smbox->chan);
 err_clear_cinfo:
 	cinfo->transport_info = NULL;
 	smbox->cinfo = NULL;

-- 
2.43.0


