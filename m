Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64565CA600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRGzTN0NleWaTALyndg5Ju+cl2dvjR4CoVoX+HqyLZw=; b=VdnXlCWUPvpwyMzl52CeuOkNhp
	nnRRIWMqAbJOwSRBMgWcd0y2j23kOMK2NlKcld3dLBrbsx30tBaFq5Usfz9R9TD9vTgKfzgVEagsU
	o0CUHHPwW6WPCGqbW8qZeb8+CU1bwwFKrpq665ao4Uazj1R8dfJTMF17pEXLWUR1ijN5AtV1I5aO9
	TyOpy0uG3qzmUescAH0U1WJOxZt5kYa8uEdxv32MVC67Nb+cGCQ11FGVxFq8dTEa8DE2utvTruPWb
	O8+yFxwSxHqodCHjzwSZgUev/+6XgwBYzDphBYg2fzmibFl0OKBOGCWt0imi6ffaPJZFc39bd/GCz
	OUYzl3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtbb-00000004uWx-1dfH;
	Thu, 08 Oct 2026 19:16:39 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtbW-00000004uVj-431T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:16:36 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3115c4451c8so4785890eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486994; x=1792091794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eRGzTN0NleWaTALyndg5Ju+cl2dvjR4CoVoX+HqyLZw=;
        b=hteYaWk4TRTkfk784DSA8vlpgJva8X5SUpzfL6KRO8oOnGBj2K8BPNZY+feEIhQce+
         nIgA8EIy25VAwShpKv5QhrDxgrLoDK9OzzlAanJUUqTcQdSx/6O2GLdMr8YIL+i5zb5B
         X5JsCXLf3WCuPX/J555JX9aAkKJ2JbBAwcl+29qFPNysHweKvx+anD7jJN4vU5KY/dWN
         tbw+goLWQnmuVJQqlZbXnQRJHb2E8kv1G1mIuHppfg5c7b/mKqS/RYXxxa4fjd8e9DgJ
         gTkyX9EOoCwrvQF/qbQox5NNR2x6GnCSaoCQ3vMajwu1J5NDqyP4M0PIu17fxZVbEaA8
         Q1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486994; x=1792091794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eRGzTN0NleWaTALyndg5Ju+cl2dvjR4CoVoX+HqyLZw=;
        b=HYazL+uG29qagcA6QLZImVpzgnHXLaBvPGtf1U7KdW3pqQuJLWH5CnSkCMY7tENONa
         x5rTSABOJX0i0ONEpV1G52txUeb7Jz0d2M0GD/nLmb13yDnImYmqk9tVI447+Gt1DWjp
         9YYvp4i5oC111DYzFWnk9rYAkGe6Axnz365TcwatzK4IanJtb9keZd4mNPOhqQlwNZpR
         j9cUZtteDtbXSJn+4QUluZw7XyMirH5yP+zQLMQ87hpvIfuXXq1fyu9ko8JZtVChgjXz
         KezFBr5XBTloOiRFDavwnY8XlSNQRcOc4enCqApOfFnL3ZC/N3M1WocCWoxXxGTfaotk
         H2yg==
X-Forwarded-Encrypted: i=1; AKwUvByp3nbHqtYNZij9fre+Ud3zvs6Gz4xaairkQ/uFZrtj7QrrlFg6yjAWy51G5tv4zIf1EolV6Emwv/Rj37U9HdLY@lists.infradead.org
X-Gm-Message-State: AFq9FYKpLYLgaWHKcOP74HNjDMKRM9uxDaJT/ci97jVK1ARm08i5Z/8o
	gJonRcqXLDguQ4Z3aSNCMG7rh3g/b/ecnucwim8Xg0zL7lRSzukzJthXrYCA5CxVn/Q=
X-Gm-Gg: AYBFou3JyuXCVPaGeDgBcpPd08cauQqxpfFX0t24hQvsuKe//WLVZ+98/zVT/YUEaoM
	I4d522vhQ418RvMc8HtPl3CgTfyzAxeMyM5PZYQtUhsnJNSIBTOYpE1+mJrT0+4LqNUDSEWG4zI
	PQLypKVsTaM1oRvuwI0SUv4l6tTICbI6eGPl8Yf6TUI1/K1LncHP1RH/M0LrMT4ATF8LM2LCxl8
	yELeg0Kut5kIJCknK7vl/XEJKlr3jM5AFcHfDoRIovVwnD2XeRi9XEuqLJk7Bcen9bCPL/gmHEP
	453ManSpN1DyGqSfI9A8fcvVKpjllMMzEQqgy6S6R2SWc7KzpOl2YzmlhPppXc4r2a290VXisyH
	kXnIp0HUy+VQTXJfcsh7Q/v4huMq5/zHYhIesbHN5bC1S3irFE5GS/69rt2y3D3M+IGo9aVPn/h
	bXfUOmkNieypz3uX659OqDCc19fFs3iEFhfTOOoYQ7C4A8/tzoP03/NSMq2fet4Se6lKfq5siOQ
	c62fGN7yE4+EB4edvT2isKDrrJgSbjo0MPH3cycKHAg1v7eREBnAjhbqE9AuBty9QVdKebzcsG1
	OlamRQ==
X-Received: by 2002:a05:693c:87cd:20b0:353:5d7a:cabe with SMTP id 5a478bee46e88-3536c53930dmr345111eec.13.1791486993426;
        Thu, 08 Oct 2026 12:16:33 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb5e9sm54053eec.20.2026.10.08.12.16.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:16:32 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Sashiko <sashiko-bot@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	viresh.kumar@linaro.org
Subject: [PATCH 6.6.y 1/2] firmware: arm_scmi: Publish channel state before callbacks
Date: Thu,  8 Oct 2026 15:16:20 -0400
Message-ID: <20261008191624.98532-2-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191624.98532-1-artem@trailofbits.com>
References: <20261008191624.98532-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_121635_337552_5573F4B8 
X-CRM114-Status: GOOD (  19.89  )
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

From: Sudeep Holla <sudeep.holla@kernel.org>

[ Upstream commit 0314900dcdde044af0208fed212035dbfaa55843 ]

Transport setup can enable callbacks before the setup routine returns.
mailbox_chan_setup() registers the mailbox client with
mbox_request_channel(), and the mailbox controller startup path can enable
interrupt delivery before SCMI mailbox channel state has been published.
Similarly, smc_chan_setup() requests the optional A2P completion IRQ before
the SMC transport has made its cinfo pointer visible.

If a pending or spurious callback fires in those windows, the transport RX
callback can dereference a NULL transport cinfo pointer. Publishing only
the transport-private pointer is not sufficient either: an early callback
can enter the SCMI core before scmi_chan_setup() has assigned
cinfo->handle.
The core derives scmi_info from cinfo->handle in the RX path, so a NULL
handle can still fault even when the transport-private cinfo is valid.

Assign cinfo->handle before invoking the transport setup callback. Publish
the mailbox and SMC transport-private channel state before requesting the
mailbox channels or IRQ, and clear the early-published pointers again on
setup failure. Also unwind mailbox setup devres resources on failure so an
optional RX setup error that is ignored by the core does not leave stale
transport state behind.

[ Backport to 6.6.y: use the pre-transport-split file layout, omit newer
  SMC fields absent from this tree, and publish/clear the older mailbox
  and SMC channel state around callback registration. ]

Fixes: 5c8a47a5a91d ("firmware: arm_scmi: Make scmi core independent of the transport type")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://patch.msgid.link/20260714-scmi_core_fixes-v6-1-3afe499d46e3@kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 1 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-93093. Both SCMI setup paths can make
callbacks reachable before channel state is published; release/acquire
publication ordering prevents observers from seeing an incompletely
initialized channel.
This needed a target-specific adjustment; I called it out in the bracketed
backport note above.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.
This fix also affects 6.1.y, which will need a separate backport; this
submission contains only the 6.6.y patch.

 drivers/firmware/arm_scmi/driver.c  |  2 +-
 drivers/firmware/arm_scmi/mailbox.c | 18 +++++++++++++-----
 drivers/firmware/arm_scmi/smc.c     | 13 ++++++++-----
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index d253e9d41d84..f99cfc49dfcd 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2449,6 +2449,7 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 
 	cinfo->id = prot_id;
 	cinfo->dev = &tdev->dev;
+	cinfo->handle = &info->handle;
 	ret = info->desc->ops->chan_setup(cinfo, info->dev, tx);
 	if (ret) {
 		of_node_put(of_node);
@@ -2482,7 +2483,6 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
 		return ret;
 	}
 
-	cinfo->handle = &info->handle;
 	return 0;
 }
 
diff --git a/drivers/firmware/arm_scmi/mailbox.c b/drivers/firmware/arm_scmi/mailbox.c
index f1d5e3fba35e..80b67f46a4d1 100644
--- a/drivers/firmware/arm_scmi/mailbox.c
+++ b/drivers/firmware/arm_scmi/mailbox.c
@@ -211,13 +211,18 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 	cl->tx_block = false;
 	cl->knows_txdone = tx;
 
+	cinfo->transport_info = smbox;
+	smbox->cinfo = cinfo;
+	mutex_init(&smbox->chan_lock);
+
 	smbox->chan = mbox_request_channel(cl, tx ? 0 : p2a_chan);
 	if (IS_ERR(smbox->chan)) {
 		ret = PTR_ERR(smbox->chan);
+		smbox->chan = NULL;
 		if (ret != -EPROBE_DEFER)
 			dev_err(cdev,
 				"failed to request SCMI %s mailbox\n", desc);
-		return ret;
+		goto err_clear_cinfo;
 	}
 
 	/* Additional unidirectional channel for TX if needed */
@@ -231,11 +236,14 @@ static int mailbox_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		}
 	}
 
-	cinfo->transport_info = smbox;
-	smbox->cinfo = cinfo;
-	mutex_init(&smbox->chan_lock);
-
 	return 0;
+
+err_clear_cinfo:
+	cinfo->transport_info = NULL;
+	smbox->cinfo = NULL;
+	devm_iounmap(dev, smbox->shmem);
+	devm_kfree(dev, smbox);
+	return ret;
 }
 
 static int mailbox_chan_free(int id, void *p, void *data)
diff --git a/drivers/firmware/arm_scmi/smc.c b/drivers/firmware/arm_scmi/smc.c
index 771797b6e268..fada68b8e15f 100644
--- a/drivers/firmware/arm_scmi/smc.c
+++ b/drivers/firmware/arm_scmi/smc.c
@@ -166,6 +166,12 @@ static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 		scmi_info->param_page = SHMEM_PAGE(res.start);
 		scmi_info->param_offset = SHMEM_OFFSET(res.start);
 	}
+
+	scmi_info->func_id = func_id;
+	scmi_info->cinfo = cinfo;
+	smc_channel_lock_init(scmi_info);
+	cinfo->transport_info = scmi_info;
+
 	/*
 	 * If there is an interrupt named "a2p", then the service and
 	 * completion of a message is signaled by an interrupt rather than by
@@ -177,17 +183,14 @@ static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 				  IRQF_NO_SUSPEND, dev_name(dev), scmi_info);
 		if (ret) {
 			dev_err(dev, "failed to setup SCMI smc irq\n");
+			cinfo->transport_info = NULL;
+			scmi_info->cinfo = NULL;
 			return ret;
 		}
 	} else {
 		cinfo->no_completion_irq = true;
 	}
 
-	scmi_info->func_id = func_id;
-	scmi_info->cinfo = cinfo;
-	smc_channel_lock_init(scmi_info);
-	cinfo->transport_info = scmi_info;
-
 	return 0;
 }
 
-- 
2.39.5


