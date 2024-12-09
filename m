Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37B8E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 16:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIEdj43BhgzaBILC0jHKlUDE1+HkZL900J5jKnUjVgc=; b=K5YXTMMm8vRMOtk8uDW2tJMpnB
	nvV3LfI+1/gh0LL6pGthv6WaPaeBNcXYa16MkC9IhZYcq1BaSWI8pPXN1ujSP1rv269ym6KRLGWvw
	xpy/eQ9uVCkvLlkrRK1fRs3aCZ6fg9r1kDHqdSG7N6he0Z+15q7lR2KdJF98f2nFJy/fdmExQcqS0
	i/9rfAjr9uwqEFs/zJBPNWaYmJyR5EWJEkZkYJNb0rCOwSItgBWgijtH1h7wG0OFB+KCaunTe3DNl
	UVict9H2YfXISDcia6AN+n5ufibYB5sBQabgXQDtlkbbSkZE4+HM14RNrxcRQnD+xWG90PX/uaVck
	aev6u6jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKh1o-00000008cBg-2WGA;
	Mon, 09 Dec 2024 16:54:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKgxq-00000008baa-2KVg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 16:50:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A07E175D;
	Mon,  9 Dec 2024 08:50:58 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 965393F720;
	Mon,  9 Dec 2024 08:50:27 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	johan+linaro@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 3/3] firmware: arm_scmi: Add aliases to transport modules
Date: Mon,  9 Dec 2024 16:49:57 +0000
Message-ID: <20241209164957.1801886-4-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209164957.1801886-1-cristian.marussi@arm.com>
References: <20241209164957.1801886-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_085030_630114_765E6D81 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

SCMI transports when built as loadable modules should be loaded by the
subsystem they plug into, based on the related subsystem specific aliases.

Add, where missing, the MODULE_DEVICE_TABLE() directives needed to generate
the aliases required to enable autoloading for SCMI transports.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 drivers/firmware/arm_scmi/transports/mailbox.c | 1 +
 drivers/firmware/arm_scmi/transports/smc.c     | 1 +
 drivers/firmware/arm_scmi/transports/virtio.c  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/firmware/arm_scmi/transports/mailbox.c b/drivers/firmware/arm_scmi/transports/mailbox.c
index b66df2981456..bd041c99b92b 100644
--- a/drivers/firmware/arm_scmi/transports/mailbox.c
+++ b/drivers/firmware/arm_scmi/transports/mailbox.c
@@ -378,6 +378,7 @@ static const struct of_device_id scmi_of_match[] = {
 	{ .compatible = "arm,scmi" },
 	{ /* Sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, scmi_of_match);
 
 DEFINE_SCMI_TRANSPORT_DRIVER(scmi_mailbox, scmi_mailbox_driver,
 			     scmi_mailbox_desc, scmi_of_match, core);
diff --git a/drivers/firmware/arm_scmi/transports/smc.c b/drivers/firmware/arm_scmi/transports/smc.c
index f632a62cfb3e..21abb571e4f2 100644
--- a/drivers/firmware/arm_scmi/transports/smc.c
+++ b/drivers/firmware/arm_scmi/transports/smc.c
@@ -301,6 +301,7 @@ static const struct of_device_id scmi_of_match[] = {
 	{ .compatible = "qcom,scmi-smc" },
 	{ /* Sentinel */ },
 };
+MODULE_DEVICE_TABLE(of, scmi_of_match);
 
 DEFINE_SCMI_TRANSPORT_DRIVER(scmi_smc, scmi_smc_driver, scmi_smc_desc,
 			     scmi_of_match, core);
diff --git a/drivers/firmware/arm_scmi/transports/virtio.c b/drivers/firmware/arm_scmi/transports/virtio.c
index 41aea33776a9..cb934db9b2b4 100644
--- a/drivers/firmware/arm_scmi/transports/virtio.c
+++ b/drivers/firmware/arm_scmi/transports/virtio.c
@@ -921,6 +921,7 @@ static const struct virtio_device_id id_table[] = {
 	{ VIRTIO_ID_SCMI, VIRTIO_DEV_ANY_ID },
 	{ 0 }
 };
+MODULE_DEVICE_TABLE(virtio, id_table);
 
 static struct virtio_driver virtio_scmi_driver = {
 	.driver.name = "scmi-virtio",
-- 
2.47.0


