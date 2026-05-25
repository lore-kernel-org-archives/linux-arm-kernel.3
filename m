Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A88CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TlO3dB26ssu7jKkXqb9zPQxgT0qu1CiQ7R2WjUBOrto=; b=zyhwghZoQOePGW2mTTWF8LSHVS
	Kyqd2R1F/hEj4fNtRfegQJ6UaU0tt5tIfEvK3E64f2TeZ5aIFKEd4e/Y+nz0gG/Oodidi7lPWvI7e
	yWRxYlJkFzP8rKedaN9hB1JiQTzVWC+bANABR981mrxLE9RDOL8lxusTgHrAd1jE84s22P6LfMQzn
	qv/VnyOYPI94RMSWPjxiyT692VW5GuGUxUobfQaoUXkZ4p0leWvfMTiX5nz2CfM3zO1s54nEIV6h9
	VmgkcHOMHegek/24jn1wZX29z4SPoRRRY4QHEw+nUmh8fuyrunjKepZS6Ta2hfm3nkGJCn7Ld+17h
	/jC3dilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRcAT-00000000RdR-2BQr;
	Mon, 25 May 2026 20:44:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRc9y-00000000RMo-0cv7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 20:44:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA72D40671;
	Mon, 25 May 2026 20:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151421F00A3E;
	Mon, 25 May 2026 20:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779741865;
	bh=TlO3dB26ssu7jKkXqb9zPQxgT0qu1CiQ7R2WjUBOrto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UWWGAEiuodS30BYeqOkUJPwMrIpWEoTEXmGZ2CTqR5HiFiiiy4LIr/XA9QwbI45jd
	 C6AFo/H+QrqiBaklUHCeEFlVOY4mjCS74+zf04Qfmu3idtqs2MORvBjNitmMimw5IF
	 Ri96Mk1wOhRbShDoD76anq9WFb+iWRXRJsoUYkrkiPWyfgpjMQGgdAGxLKQyQvmACA
	 CxtFSwv++/QY4qAFoDyvEPuhY0BNgU1MvE1y8oH1Q2D4IIf3EXi+JfrXBp8Nk9Id+O
	 pVP1JAlY0sVhNqG15m7pRBmKKFiejyijqScLGbXdd1EEgorDHg9E/5J1fuuXuyPkgu
	 kmJlkjEy2+38A==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Mon, 25 May 2026 21:42:47 +0100
Subject: [PATCH v2 9/9] firmware: arm_scmi: Initialise all protocol devices
 and transport channels
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-acpi_scmi_pcc-v2-9-4f38938d08d8@arm.com>
References: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
In-Reply-To: <20260525-acpi_scmi_pcc-v2-0-4f38938d08d8@arm.com>
To: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_134426_556678_82FFC48E 
X-CRM114-Status: GOOD (  12.87  )
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

Unlike Device Tree, the ACPI SCMI namespace device does not provide
child fwnodes to represent each protocol. Initialise protocol
channels and devices for the ACPI SCMI protocol entries known to
the core, and let the transport channel-availability checks and
SCMI protocol implementation checks decide which ones are usable
on the platform.

Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_scmi/driver.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 47f13409dfeb..9e25346a7eae 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -2827,7 +2827,7 @@ scmi_txrx_setup(struct scmi_info *info, struct fwnode_handle *fwnode,
  */
 static int scmi_channels_setup(struct scmi_info *info)
 {
-	int ret;
+	int ret, idx;
 	struct fwnode_handle *fwnode = dev_fwnode(info->dev);
 
 	/* Initialize a common generic channel at first */
@@ -2850,6 +2850,17 @@ static int scmi_channels_setup(struct scmi_info *info)
 			return ret;
 	}
 
+	if (acpi_disabled)
+		return 0;
+
+	for (idx = 1; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		ret = scmi_txrx_setup(info, fwnode, prot_id);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
@@ -3215,7 +3226,7 @@ static void scmi_device_check_create(struct fwnode_handle *fwnode, int prot_id,
 
 static int scmi_probe(struct platform_device *pdev)
 {
-	int ret;
+	int ret, idx;
 	char *err_str = "probe failure\n";
 	struct scmi_handle *handle;
 	const struct scmi_desc *desc;
@@ -3344,6 +3355,15 @@ static int scmi_probe(struct platform_device *pdev)
 		scmi_device_check_create(child, prot_id, info);
 	}
 
+	if (acpi_disabled)
+		return 0;
+
+	for (idx = 1; idx < ARRAY_SIZE(scmi_dsd_info_list); idx++) {
+		int prot_id = scmi_dsd_info_list[idx].protocol_id;
+
+		scmi_device_check_create(dev_fwnode(dev), prot_id, info);
+	}
+
 	return 0;
 
 notification_exit:

-- 
2.43.0


