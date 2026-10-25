Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0F3606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 19:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VtnCBHWR;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=rdiPjhtI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=0X/tbl9Q4g7QTtyNOjf8kZ22NcdZe6K4eZsTNrclaaw=; b=VtnCBHWRY5hMLu
	t/8qj4A2KsfT1ilDvxMX4re8gv8dKMaIuI+jlWg8aeurfCtqCgyt6SGFbZ3JoapTumZc/zwFXfVq1
	B9FS/A94+4Uny2UEVgro4tYgmSDsnCD/7Rv6uTHnw2mHHAAfYW4/mdeTvnDZQ0oDQafOLcT4v4ulf
	OvLOPmdkvzjR6OwI+OChP+TfevbYJpvc75lDVvpafgniDhBIOUGktEdP76dOKKDXohCgdSjDYxYYS
	gxcTVMd4eUI2kjE/xP4wfn9XInrUsnBJglWLW17aOdnvA6OfBrZgpm1fg+j9De/46KLZ2sIRRv4f3
	fMjk/VqUwdPZgyAWf9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3nC-00000001KsZ-2z2K;
	Sun, 25 Oct 2026 19:22:06 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xL3n6-00000001Kmh-0reh;
	Sun, 25 Oct 2026 19:22:01 +0000
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJLko5516701
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:53 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJLko5516701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956113;
	bh=0X/tbl9Q4g7QTtyNOjf8kZ22NcdZe6K4eZsTNrclaaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=rdiPjhtIbDhRZnlN+dcIhs9BQnfv7mzxnz4QZfouvzZGAl2c819HPQaSMMUMGQPBu
	 LXYjxl59cPYtVUuATW/WOJ9o4X3nTS9B8E6ejduu2VqAPCyNk2afCKxwSokWbCc/Pm
	 lkv6KvlQU2qWArd66gl5AO/PzL3u3RsshxfBLwzY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 2/2] firmware: meson: sm: make power-off work on S4
Date: Sun, 25 Oct 2026 20:21:44 +0100
Message-ID: <20261025192144.208954-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_122200_796319_AC0A515D 
X-CRM114-Status: GOOD (  15.61  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

On S4 the firmware implements PSCI SYSTEM_OFF as DDR self-refresh. A
press of the power key afterwards jumps back to the kernel resume
address, where nothing is waiting, and the board hangs until it is
unplugged.

The vendor kernel avoids this in two steps, both needed:

 - set the firmware shutdown flag (SMC 0x82000042, argument 1) right
   before SYSTEM_OFF, which makes the firmware cold-boot on the power
   key instead of resuming;
 - take the secondary CPUs down through PSCI CPU_OFF first. With them
   only parked in the kernel, the firmware wake-up path hangs as well.

Register a power-off prepare handler that stops the secondary CPUs and
a high priority power-off handler that sets the flag, for the
amlogic,meson-s4-sm compatible only.

Tested on an S905W2 board: poweroff followed by the power key
cold-boots the board.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/firmware/meson/meson_sm.c       | 46 +++++++++++++++++++++++++
 include/linux/firmware/meson/meson_sm.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..5410386603c7 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -10,6 +10,7 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/bug.h>
+#include <linux/cpu.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -17,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/property.h>
+#include <linux/reboot.h>
 #include <linux/types.h>
 #include <linux/sizes.h>
  #include <linux/slab.h>
@@ -48,6 +50,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_THERMAL_CALIB_READ,	0x82000047),
 		CMD(SM_A1_PWRC_SET,		0x82000093),
 		CMD(SM_A1_PWRC_GET,		0x82000095),
+		CMD(SM_SET_POWEROFF_FLAG,	0x82000042),
 		{ /* sentinel */ },
 	},
 };
@@ -303,6 +306,45 @@ static struct attribute *meson_sm_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(meson_sm_sysfs);
 
+/*
+ * The S4 firmware implements PSCI SYSTEM_OFF as DDR self-refresh: on the
+ * power key it jumps back to the kernel instead of booting, which hangs the
+ * board. Setting the shutdown flag first makes it cold-boot instead, and the
+ * secondary CPUs must have been taken down through PSCI CPU_OFF beforehand,
+ * otherwise the wake-up path hangs as well.
+ */
+static int meson_sm_power_off_prepare(struct sys_off_data *data)
+{
+	if (freeze_secondary_cpus(0))
+		pr_warn("meson-sm: failed to stop secondary CPUs\n");
+
+	return NOTIFY_DONE;
+}
+
+static int meson_sm_power_off(struct sys_off_data *data)
+{
+	meson_sm_call(data->cb_data, SM_SET_POWEROFF_FLAG, NULL, 1, 0, 0, 0, 0);
+
+	return NOTIFY_DONE;
+}
+
+static int meson_sm_register_power_off(struct device *dev,
+				       struct meson_sm_firmware *fw)
+{
+	int ret;
+
+	ret = devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
+					    SYS_OFF_PRIO_DEFAULT,
+					    meson_sm_power_off_prepare, NULL);
+	if (ret)
+		return ret;
+
+	/* Run before the PSCI handler, which never returns */
+	return devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
+					     SYS_OFF_PRIO_HIGH,
+					     meson_sm_power_off, fw);
+}
+
 static const struct of_device_id meson_sm_ids[] = {
 	{ .compatible = "amlogic,meson-gxbb-sm", .data = &gxbb_chip },
 	{ /* sentinel */ },
@@ -343,6 +385,10 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 	if (devm_of_platform_populate(dev))
 		goto unmap_out_base;
 
+	if (of_device_is_compatible(dev->of_node, "amlogic,meson-s4-sm") &&
+	    meson_sm_register_power_off(dev, fw))
+		dev_warn(dev, "failed to register power-off handlers\n");
+
 	pr_info("secure-monitor enabled\n");
 
 	return 0;
diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..3f2fa160e32f 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -15,6 +15,7 @@ enum {
 	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
+	SM_SET_POWEROFF_FLAG,
 };
 
 struct meson_sm_firmware;
-- 
2.56.0


