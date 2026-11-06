Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE26606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PqTBb5qi;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=e+I20grL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FQyyOJeI2Mbet+u86QRL7Xi1ZkmhZ27qXA46SycGnFM=; b=PqTBb5qidV2VbQ
	DnBl8EXEld35tXcds21MFy/a7TNrtT1re/0ftjz5zyL0/ukRCbua/yNP4QhoLfqJp5/ZIah33cvH7
	S12w9UsXemIlIqGa08aDw8wmlwO5t173Bp7U8spMN5+BAsdVPHntkvL6s3bF1Nqt+DNMKzLrJ2t0n
	lmeLngI1rmj9iblFHA9XCB64PHDvtc0ZlZpRy+MBphwSBBoZa3wVgpxxtcEuj+eFNkADvMPK1nKfo
	recyOtz1sZXc/80C/xLf8X+jazCLrSkpQY6VUFHk6kiIJU8PJY+eyFLhkfJPbkmBTEcdOFk8vvQRS
	XGgllnin248rkiXg7teQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2O-0000000BtKK-2Fi5;
	Fri, 06 Nov 2026 10:19:12 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPH2L-0000000BtFa-3SOF;
	Fri, 06 Nov 2026 10:19:11 +0000
Received: from surface-pro-5 (ydWLT-U1-95-184.uibk.ac.at [172.25.95.184])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 6A6AIuX11863787
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Nov 2026 11:19:02 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 6A6AIuX11863787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1793960342;
	bh=FQyyOJeI2Mbet+u86QRL7Xi1ZkmhZ27qXA46SycGnFM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e+I20grLGd86uiKasozl/mnJLOHUxrDTCHuOc/NeGDAH0wZaQku++hAwGEzxF+L9Y
	 aM+krN8L/c7skFfIfdqqR+LZqIsXdZJDFqFjIrdeJV9DRdC8vGdsPtbBj2n0hCItso
	 QqJaOWZRmoQ7wrrXWrvp3SQVycro7cqFP/BstzYY=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH v2 2/2] firmware: meson: sm: make power-off work on S4
Date: Fri,  6 Nov 2026 11:18:54 +0100
Message-ID: <20261106101854.46569-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261106101854.46569-1-christian.koever-draxl@student.uibk.ac.at>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_021910_216570_9E29F210 
X-CRM114-Status: GOOD (  17.30  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

Register a power-off prepare handler that does both, for the
amlogic,meson-s4-sm compatible only. It offlines the secondary CPUs
with remove_cpu(): machine_power_off() later only parks them with
smp_send_stop(), and CPU hotplug no longer works at that point.

Tested on an S905W2 board: poweroff followed by the power key
cold-boots the board.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 drivers/firmware/meson/meson_sm.c       | 31 +++++++++++++++++++++++++
 include/linux/firmware/meson/meson_sm.h |  1 +
 2 files changed, 32 insertions(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index ab9751a59b55..de0c8e809c51 100644
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
@@ -303,6 +306,28 @@ static struct attribute *meson_sm_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(meson_sm_sysfs);
 
+/*
+ * The S4 firmware implements PSCI SYSTEM_OFF as DDR self-refresh: on the
+ * power key it jumps back to the kernel instead of booting, which hangs the
+ * board. Setting the shutdown flag first makes it cold-boot instead, and the
+ * secondary CPUs must have been taken down through PSCI CPU_OFF beforehand,
+ * otherwise the wake-up path hangs as well. machine_power_off() only parks
+ * them, so offline them here, while CPU hotplug still works.
+ */
+static int meson_sm_power_off_prepare(struct sys_off_data *data)
+{
+	unsigned int cpu, primary = cpumask_first(cpu_online_mask);
+
+	for_each_online_cpu(cpu) {
+		if (cpu != primary && remove_cpu(cpu))
+			pr_warn("meson-sm: failed to stop CPU%u\n", cpu);
+	}
+
+	meson_sm_call(data->cb_data, SM_SET_POWEROFF_FLAG, NULL, 1, 0, 0, 0, 0);
+
+	return NOTIFY_DONE;
+}
+
 static const struct of_device_id meson_sm_ids[] = {
 	{ .compatible = "amlogic,meson-gxbb-sm", .data = &gxbb_chip },
 	{ /* sentinel */ },
@@ -343,6 +368,12 @@ static int __init meson_sm_probe(struct platform_device *pdev)
 	if (devm_of_platform_populate(dev))
 		goto unmap_out_base;
 
+	if (of_device_is_compatible(dev->of_node, "amlogic,meson-s4-sm") &&
+	    devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF_PREPARE,
+					  SYS_OFF_PRIO_DEFAULT,
+					  meson_sm_power_off_prepare, fw))
+		dev_warn(dev, "failed to register the power-off handler\n");
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


