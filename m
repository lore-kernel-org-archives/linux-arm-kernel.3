Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E212CC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wo1cSCYChzZ+SeD4Rr4ePKZmOVyTbiqYMm+hrcWkjS0=; b=nVY/QO3zbCtTifRUH04B54d4QI
	GvQNyHxX/Ldrdpu5oODsWaGRVIzWWNarKK0yciUq23E+c2Qim4qR+QQkUp5UOliUNd5U0NTFqPfED
	hKUy4WAFqdThMqud5LVvgvDiYnQ8L4rYPOZyrHeCtABmfYGHYOmxmsrF/m79fF9oxUMjykI2ArLS/
	ORS2bL/vF+Cfeh1ktieFszrav21BspAomCGbWOzP0QxHOubiLAC1xxAELGg1ZMyTpT85V6fkRo12z
	hb+sNU1U9BVpFveGqB+AertYuUCxxUdlbypcrtI+Zg2GAZdhIGwXokYMOEBiMpwato42vHhNNbDMe
	f3S81eEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkX4-00000001f2p-2FZ5;
	Thu, 09 Jul 2026 08:54:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkVL-00000001aYw-3bYV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:53:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D4D343A34;
	Thu,  9 Jul 2026 08:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF60A1F00A3D;
	Thu,  9 Jul 2026 08:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783587191;
	bh=wo1cSCYChzZ+SeD4Rr4ePKZmOVyTbiqYMm+hrcWkjS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RmeCyhPtF8BNHhug50TYHpv0PhKpjxp+ji79UYqwm0DDbsTKCisbsfs76qBKKh0Ln
	 0hz9BURu17YvzkQ5YEKRN7B58DkjZDDGH/w62aG22gxMC1xRa/gT8xrQdGc5rjVvIz
	 NfaVnP6j2/Ypnkmira6Ui/SA70zb4XBIv38bK0EGRXIMUMueOcHcSbMKyFTiAF+oZu
	 v1/CxiD7GkUgV/tcCD+ZycUNU6BkWScSdYJoBS4e4VScDhug2JDy7M2+RCprIii727
	 fHpqeRd2Ml4v0ZL8s6AM/Pj0Tu50cpxu08wDchSUdIa9BQqiCiFi9vSGLSNs1zxNiN
	 Yl46YHM6PcLFA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 09 Jul 2026 09:52:37 +0100
Subject: [PATCH v5 13/16] firmware: arm_scmi: Unwind TX receiver mailbox
 setup failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-scmi_core_fixes-v5-13-bea6a3024f05@kernel.org>
References: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
In-Reply-To: <20260709-scmi_core_fixes-v5-0-bea6a3024f05@kernel.org>
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


