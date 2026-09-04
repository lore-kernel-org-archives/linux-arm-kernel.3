Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4FAC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eEzBt5w9dH/8EXW2rlpjud9RALZkOP/eXJPPIgYa1g=; b=nzwvpSW6y0HIn+R5s0gaDSznM0
	YvLupx5QXh0Hm04UY4dpn+kdBv4JiOLSiZXxCBIr7TQUkcB8jadAq97ldDHFqQZbrrLWq7UWyy1n8
	DSi1BFUxeD8UgnIZT3uQhv3QrYxPygPeqzbIYQbuK0EUYw+gV4G0GCySRKoa2tZH/OVlUY2r9IGcY
	/kkPviysJzlOQ17vQIk02mkTv9O1RyVcMrRI+0tqCCjfJPuXf+zvYWk4qbVJitINxRGyS+ALio9Kg
	dIsMNwsojCYd3FdrmGURS+SlR+KVD37paZyVzauRMxNVF9Q0tMCLQGa1YmjncXxSCK+ag4LfuAo3f
	lhogeKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKX-00000002dDZ-0WY4;
	Fri, 04 Sep 2026 15:59:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WKJ-00000002clT-3vqs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 15:59:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 61704600C8;
	Fri,  4 Sep 2026 15:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C21D1F00A3E;
	Fri,  4 Sep 2026 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788537579;
	bh=8eEzBt5w9dH/8EXW2rlpjud9RALZkOP/eXJPPIgYa1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=LoV+6npU3X0tfRsiNWA+pguUTvNwILVq4PEvW2b637t8f4ZYMqq2rRVt+P+8eVqGd
	 j6iUOZapXILEQgxZUVrab3rzfCWLfNIiZPDbQKiXfBIKQkbn/iIvOf6bd4rgpO0AjF
	 1S/vyYeW7gICB6Z6G8qMJftLq1lhrlV+1vYgxpGaQPJBccKwlSaRjVFd0oiVgLU9et
	 7KJfaqvTKGqWs+jA8zIQe0D4+NVTi8UJ7UnobBPhk9N8b51Rf1ak/l9eXwADcGRlxl
	 W7BKK8HmpssMcpQCZWxXzYUBHCVzNlHEVdY7xE5JqYdDOMUdOPl5t+p4iTebFrgrYg
	 IATp+wN8huChw==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Fri, 04 Sep 2026 16:57:56 +0100
Subject: [PATCH v4 1/9] firmware: arm_scmi: Set generated device fwnode
 with platform helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi_scmi_pcc-v4-1-6ebe9755606e@kernel.org>
References: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
In-Reply-To: <20260904-acpi_scmi_pcc-v4-0-6ebe9755606e@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel-team@meta.com
Cc: Cristian Marussi <cristian.marussi@arm.com>, 
 Breno Leitao <leitao@debian.org>, 
 Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
X-Mailer: b4 0.16.0
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

The SCMI transport probe helper creates a platform device for the SCMI
core. device_set_of_node_from_dev() propagates the supplier's OF node,
but leaves generated devices for non-DT transports without a firmware
node.

Use platform_device_set_of_node_from_dev() for devicetree suppliers so
the shared OF node is referenced and marked as reused. For all other
suppliers, use platform_device_set_fwnode() so ACPI and other firmware
nodes are propagated with a reference that platform_device_release()
can balance.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/common.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index fe8c22cfb9f7..244f4ee5b655 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -649,7 +649,10 @@ static int __tag##_probe(struct platform_device *pdev)			       \
 		goto err_mem;						       \
 	}								       \
 									       \
-	device_set_of_node_from_dev(&spdev->dev, dev);			       \
+	if (dev_of_node(dev))						       \
+		platform_device_set_of_node_from_dev(spdev, dev);	       \
+	else								       \
+		platform_device_set_fwnode(spdev, dev_fwnode(dev));	       \
 									       \
 	strans.supplier = supplier;					       \
 	memcpy(&strans.desc, &(__desc), sizeof(strans.desc));		       \

-- 
2.43.0


