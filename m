Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E0CCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 09:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQMvdvTBs6iJwXtYsvXOz+3I/5tVR71kCapN0bE7bQI=; b=Sjh3wgd5N/tYUUgHHVUnVIwjg/
	EGlWJI2o+B5/fPltzSCAMPlATBesKIjf0RMouyNFxtk5+svBDN/8ZqPKsqBF+aAww07lLC4G5/jVa
	OV4Uhsdrt82JhWaPeXUFzrhHd9Y0gkA1O1sMmb5dMCq8VHbhfH4RGLWGmfa126Nus08oVQCjJJuLv
	VwaEHhqFND0tzeRdZQF3tLwaiJJPr3+/vPzspwx0vHag2mp2BPn7olcEsjk8a8ZLrlvg9zj6wcnNH
	ytYGuz5c7d6KDlKzjCFd1jFKfnWIKaU/PHwEbvNsS4Qc0fYZxUhEiW6H42UEZNRVOVEJOniGwp7aD
	Zusp2oJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDef1-0000000Fvrd-48ZK;
	Mon, 05 Oct 2026 09:07:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeey-0000000Fvpl-2Hu6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 09:07:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5098D43DDA;
	Mon,  5 Oct 2026 09:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1C41F00893;
	Mon,  5 Oct 2026 09:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791191220;
	bh=pQMvdvTBs6iJwXtYsvXOz+3I/5tVR71kCapN0bE7bQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=igPnMmADQExidCdXXF4Wq/8dGBbJ0wI+gdVJN4/wH8sdLmM2n3DtJ6kyrXfLTlsP2
	 sYkU7tnCxXat1UP+UwJ9dP11QqwRhyD1KZDm1s1wUpOY8wjEdr6wSsqY1FYQd9m+QY
	 MFyybganmv1DZttCNZi16Cknzv7vnUZHmQ1SCwdxXF9h5VoKkNWv+eMyUvaZ7dqYZ8
	 ewmxeTQhAA0kIPAt1DVDm3mPH4yVwcF1dlPVn/Flvod+Ayt9FBWa24ZqlYbNHQOVOb
	 jwuUFOivRn+ElTXeCzBXaoxxjTxD4mqDcc4ZMDs7LhEgx7FsJU7WL53d1hUVNnYi7k
	 onyP15+t5wbtA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 05 Oct 2026 10:04:35 +0100
Subject: [PATCH v2 4/4] firmware: arm_scmi: Skip unused performance-domain
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-scmi_bus_fixes-v2-4-34a51338875a@kernel.org>
References: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
In-Reply-To: <20261005-scmi_bus_fixes-v2-0-34a51338875a@kernel.org>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Peng Fan <peng.fan@nxp.com>, 
 Hans de Goede <johannes.goede@oss.qualcomm.com>, imx@lists.linux.dev, 
 linux-gpio@vger.kernel.org
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

The SCMI performance-domain driver uses the named "perf" device only
when its firmware node declares #power-domain-cells. Otherwise its
probe returns without registering a provider, while the same SCMI
protocol may still be needed by the separate "cpufreq" device.

Do not create the "perf" device when the provider property is absent.
This avoids an unnecessary device claiming the protocol fwnode and
leaves cpufreq creation unchanged. Update the device-creation contract
to document that an intentionally omitted named device returns NULL.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX95 EVK
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/bus.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 6be31b5121b3..b235d322330b 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -570,6 +570,11 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
 {
 	struct scmi_device *sdev;
 
+	/* The perf device is only needed when it provides power domains. */
+	if (protocol == SCMI_PROTOCOL_PERF && !strcmp(name, "perf") &&
+	    !fwnode_property_present(fwnode, "#power-domain-cells"))
+		return NULL;
+
 	sdev = __scmi_device_create(fwnode, parent, protocol, name);
 	if (!sdev)
 		pr_err("(%pfwf) Failed to create device - protocol 0x%x (%s)\n",
@@ -596,10 +601,8 @@ _scmi_device_create(struct fwnode_handle *fwnode, struct device *parent,
  *
  * Return: The created device (or one of them if @name was NOT provided and
  *	   multiple devices were created) or NULL if no device was created;
- *	   note that NULL indicates an error ONLY in case a specific @name
- *	   was provided: when @name param was not provided, a number of devices
- *	   could have been potentially created for a whole protocol, unless no
- *	   device was found to have been requested for that specific protocol.
+ *	   note that NULL can also indicate that a named device is not needed
+ *	   for this fwnode, or that no device was requested when @name is NULL.
  */
 struct scmi_device *scmi_device_create(struct fwnode_handle *fwnode,
 				       struct device *parent, int protocol,

-- 
2.43.0


