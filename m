Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A794AC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZnmnlHOIAnwAFNNa9mq1vsRvjLPPK8mfvrGHyS9lec=; b=RnbS9BkGq3PQUhKqgWKbwjFRwL
	WtHWynuj0dtj11kRHX8P1ppWCtOwXsKVRDsV7/01KmHaS0+E+6nj3EjUd8RhR6kHicU5gLx6trTGS
	aDfdECyYiP5JK9bzhGqPOFWQc6qeSYpFjJCeaXHD1ETHl94b2SJL797C03G3I5bQSTMtav9FQSwnQ
	krq1zHJ4Xp6x34Miw4YUE85WhymFlxGG4wXTVTnRrwLEl13YkO6OqyWBYnVpz7u9DdTsp0+y+CIaG
	duNQs9zm2QAiZ8mWN3rq4kkJSE8vHiIWlv9d8t4dUfqBstGYNXm9plNH9/XP7WvM77VGnwQL6Ikjo
	VzlF1T+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgm-00000000YSa-24G8;
	Thu, 13 Aug 2026 11:33:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuTgi-00000000YR2-2sqm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 11:33:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D09A7600AD;
	Thu, 13 Aug 2026 11:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A806E1F00A3A;
	Thu, 13 Aug 2026 11:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786620811;
	bh=YZnmnlHOIAnwAFNNa9mq1vsRvjLPPK8mfvrGHyS9lec=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E4bxJHRsLsz6zpf5Oxm7P7oWjuQ/dqRV85N8xf466bioJ6cZ0WSlA1vp2RyRp1ccb
	 UuBWbNEOMuDXOBj8JEUoWhIJxdbDBKIjKqq0gYHL0/Vgzd7i7ppXapFjqZ8uU+tKAi
	 K34G90mW1HxGrIgOFZFmHpe9phvE7/z9obvJeuuLkoTvs35/eRbAqj8AN1vyqfTSTR
	 CAJq9adnvXAgRukfjoyI1EYhF9XHolu27WlCAzzmFvgNYYI+xzOiYopMp/F6RxG2RE
	 ZjZikkNIglLLiliS+0dsYDpTGZ8qJrX9uHW4dZ0A0qnNic8O+PWy+5gNVrGZaNcvy8
	 bkoN6nau5Vd7g==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 13 Aug 2026 12:32:56 +0100
Subject: [PATCH v3 1/9] firmware: arm_scmi: Set fwnode for the generated
 SCMI platform device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-acpi_scmi_pcc-v3-1-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>
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

Add a call to device_set_node() in the SCMI probe helper to associate
generated SCMI platform device with the firmware node of its supplier
transport device.

This complements device_set_of_node_from_dev() and ensures that
firmware node information is propagated correctly for both Device Tree
and non-DT (e.g. ACPI) based systems.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index fe8c22cfb9f7..cc7d11c3c1f3 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -650,6 +650,7 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 	}								       \
 									       \
 	device_set_of_node_from_dev(&spdev->dev, dev);			       \
+	device_set_node(&spdev->dev, dev_fwnode(dev));			       \
 									       \
 	strans.supplier = supplier;					       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \

-- 
2.43.0


