Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97222C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eEzBt5w9dH/8EXW2rlpjud9RALZkOP/eXJPPIgYa1g=; b=msPDkigs1TqPKfac3g1lbqew4S
	MssAd+BQSkQVDfgvoPECs+SVKQENIqCm9J/ONCcW5oesdp98lL7W1GceyX/1tve+rmaqUwal/RyeG
	qS7VB++y/2TuLuESBohENAGJSfhhsH+Ke6RsCylQs9UWmorv3gSPBEfOuvZYQT70EECQEQ0dTgAt9
	n6Tw6UiMdrwPuBdLXGPyKvvCoj4zfa8NJSw9R+sZlEoU47poh8gAag1OmU/htHAJYiPn5pXidLVy3
	m3JpFhxWoHp1ng7xDQAO6CdQaUzszessRLFgaznkwNLwstvmtPN1i+H6ggjQW+gE9u2f7K3I8lBJc
	n+ib7tAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wae-00000007Wc9-28tS;
	Tue, 15 Sep 2026 17:05:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Waa-00000007WZA-0uU6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:05:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 68EA1600D1;
	Tue, 15 Sep 2026 17:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7301F00893;
	Tue, 15 Sep 2026 17:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789491899;
	bh=8eEzBt5w9dH/8EXW2rlpjud9RALZkOP/eXJPPIgYa1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PzI4I/E8s82pCP/TZYlgWkLNf3XXFIvUBvcQCZwbdd7TcWovGx2xrWNHkCNbOV2M0
	 DQG307jcSxZUOPw+YKAQe2LSLRZJCUSmMXipnYpQc3H1Gryduv0MsNyD95+DFEINpL
	 DXxda4Xy9g8KLHn6nyLsBNKElqLC57kE73O/RpEKLJI7foUsgobkUSxlfCRhRezhrH
	 6ZPCMVDWkMpnobCbZkeNR7UJyMu3+nNXFDQZZJS6ESWPnIpcFn2ALuLw8xlS+07y8v
	 JzUpihABU5bsFvClSpkFR2PS6hyHpuYaJr1evC0WIIwyLlFzoFMR39ZUPQb9WMtGPZ
	 uAS0J20pRD8+Q==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Tue, 15 Sep 2026 18:03:35 +0100
Subject: [PATCH v5 1/9] firmware: arm_scmi: Set generated device fwnode
 with platform helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-acpi_scmi_pcc-v5-1-298579e9f359@kernel.org>
References: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
In-Reply-To: <20260915-acpi_scmi_pcc-v5-0-298579e9f359@kernel.org>
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


