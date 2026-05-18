Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC95CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 09:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GxdjSCoSHRAw2soZ2duKpNm8mf0V8MJVumP3dJOuQ34=; b=P4rgNdxiCXjvr2YQ6Xr3bpKudW
	QRXpt3H2Lcww6lxxKBfRJMURonlyHsQtlaH/eSF7tYlgLtdTGAdrwtYx0VcToaC7uLQ1+9w9ZyV6L
	ofh52kUGjrS4LerLxX0wasu0Fc/S4slm97GvjKfnTszI8Kbpwri7XPyN3LsWZCyBckH3Ghf0bGjJ8
	Bpf03LtRR1PoXzDryVVstu+2JbjG5pFm70xwYxtFOIItk+2dUOOg6gujuI9vXEcADBDykMrmE8BkD
	WbjdGdElcAA2Z7d7znyI7gbTjPijpjTL2kfMVlsSoWIkK2cW0QdkREmGH7M6rAE0DFqJueAGgcxsQ
	F0lT7iHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuS4-0000000F3e8-3klc;
	Mon, 18 May 2026 09:39:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuS3-0000000F3dW-3LHp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 09:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GxdjSCoSHRAw2soZ2duKpNm8mf0V8MJVumP3dJOuQ34=; b=pWCrKFxVgNoPV0yKbOkzBsRIbA
	9Eia8FmxPNrZ9vfLBoXECLHOHj2mD8shWarN57v5fHkgkJI6BDEB2/lYhJuV91o//c6qSLhYqYi2+
	xS76CWmVzLe1cEA0JF9FVDPDpgIrRt0RQXrQcMJCGc54ipMTnsFpkyD659Je1fydZ0wFLQ2OdyFnP
	jibI0Q2v3TUes44SND4NYMkUR1poN58j3gNgT+U4ZQWuvEoWbxC4N6LCG2yu4Igv5z/EytMKAIoft
	rubdH63wbwNMmBNbfMIc816aDqo99wyhpDp9tJLAGWouW7Yc8PNxQ/BBlq3CIWaoimFWdJR3T/Ads
	hmLKta+g==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuS0-0000000AbfR-0cco
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 09:39:54 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-44c44af71f8so271433f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 02:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779097190; x=1779701990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxdjSCoSHRAw2soZ2duKpNm8mf0V8MJVumP3dJOuQ34=;
        b=q9fEfT+HmQA5FFH4ug0WukqI6qhzu661deMILl39O4LZGjlsut4XNFVrZdbwf+M4sc
         4mVRFdJXvInjcZT0e3ufwEic+Sz1cIwgF56jKcMC+TmokPD8HFGU10/jdkkzwzcLVlro
         /l7G7WXBjH2B8p0oB6v1TPmdlUXPNBZT7KlixT7YFPKwmcrf50DlkLrDrhZVHEu69LZj
         qUTqCb2LqZ9LxvJIQOG78bmo4ZrmJUg65DXJfhkR1j+5c2p7dh4f+AGhxaETnGSPv/Ie
         ++UOfrpzRrs4GhcjRREBsipEAjvMaNBq/1O/QrbJjvfs2cPtau8jP07dtOgjiz2rWKM4
         35ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779097190; x=1779701990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GxdjSCoSHRAw2soZ2duKpNm8mf0V8MJVumP3dJOuQ34=;
        b=pTkT3cOxUJc6c+rEYUac1b5yfh2a2CV4OFwkGRwPzFTeocz5GvaZmETN54LuRGG5ud
         N3iWo4WN0kbHHoygmjxtD7IiuCMn5xJmdD7j4B8W91fxPHfWqxqfcAV2TrM3bsuhNpas
         m6xJwxyA0Kk3j//KB/TpyQkZcMMe46lBcCQRIMTgsLgZtF8FGhz9e7Fz5C7xppjOFvkB
         4vbfR3egfcKtpHm/AXRUzucl96xQIbppeeIOTGwMqrILPQTCjQbOpulFdkLy4t1bD1Cn
         kug+roDq4fn1QeLevuhhOipJytneS36hdg/UJQ6Q2Zp6uuXLsfoE5g516v/ySQX2r8FX
         7zag==
X-Forwarded-Encrypted: i=1; AFNElJ8nqwwodd6KBc99YdN4lvvbFYBAcf5Rt0fnacSGFNZ/gUes+NjHoVuAqsAd5VpArkWcT9jyMS/wlxN3IedVMWXO@lists.infradead.org
X-Gm-Message-State: AOJu0YwE9Om7foDu8ahVuPwRUBq5Qo7w++5N2eFzzXXMROfIstowNTkG
	o/EioeyQvv7lUDU8aPErnDCittvedVDC7H0NRwjFLsyuTQvdmf+SrG7BDe12FCtC2Hg=
X-Gm-Gg: Acq92OHoifY7gxgXfEzbjnGaABrLca9QrmbnjgwKTuU63PMOX+7DNMDRMlzPsI2Z458
	F2oZ+SteizCRfqYnpukzlyx2Cdo57bpCg+gd08EdVXrtCb5DiaPg87NISBQBLyIsGquubi40Zt3
	Dk68ZCr8rzncCdkiQyqBWbAXwLbc+ooRFAWEtKPu8KbEH70otVHGqSaT4/s6USM/OrSqUT010K8
	5PVAbwKNiMoV+4gO4M5HCH0/CbGLtBhGqV7/OoVqwQJbvyqzD6P4OZi1CuiUqeVwGFGyLiG7K72
	aNwgL/9oU2elWUFdJZFvaTjfk6akgBVeKrooc0+hV6hpbl5Y5VFANyMb5Ewc5+x3t0tyr4LbIuD
	0665CAIwd4I2oEg004UGk5Hg1m1HudyLB2n9b6nALGoV7Gc7IfgFtCDLOFtXIhC8vsRJeOf228z
	3LDBuiAwKqO1gnP3B8UQyQ1ejDv6Gq+rpiHY9Ib1MrJKEQ
X-Received: by 2002:a05:600c:3594:b0:490:502:8422 with SMTP id 5b1f17b1804b1-4900d55ec74mr24159285e9.6.1779097189418;
        Mon, 18 May 2026 02:39:49 -0700 (PDT)
Received: from localhost.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4862209sm245408615e9.0.2026.05.18.02.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 02:39:48 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: Frank.Li@nxp.com
Cc: peng.fan@oss.nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	gregkh@linuxfoundation.org,
	hcazarim@yahoo.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sozdayvek@gmail.com
Subject: [PATCH v2] firmware: imx: scu-irq: drop wakeup_src sysfs file, log via dev_dbg()
Date: Mon, 18 May 2026 14:39:33 +0500
Message-Id: <20260518093934.1910-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20260515175002.34853-1-sozdayvek@gmail.com>
References: <20260515175002.34853-1-sozdayvek@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_103952_847282_32E7F184 
X-CRM114-Status: GOOD (  20.26  )
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

wakeup_source_show() walks all IMX_SC_IRQ_NUM_GROUP groups and
rewrites buf from offset 0 each iteration, so userspace reading
/sys/firmware/scu_wakeup_source/wakeup_src only ever sees the last
group reported, and the trailing strlen(buf) reports only that
line length. sprintf() is also unbounded against the sysfs
PAGE_SIZE buffer.

The attribute is not documented under Documentation/ABI/ and a code
search across GitHub and Debian found no out-of-tree consumers.
Peng Fan (NXP) confirmed it is safe to drop.

Remove the attribute, the supporting kobject and the per-group
valid/wakeup_src state used only to feed it. Log the same wakeup
information via dev_dbg() from imx_scu_irq_work_handler() so it
can be enabled dynamically when needed.

Fixes: c081197a33a2 ("firmware: imx: scu-irq: support identifying SCU wakeup source from sysfs")
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Link: https://lore.kernel.org/all/2026051656-corral-edgy-290c@gregkh/
Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
v2:
- Drop the sysfs file entirely instead of patching it (Greg)
- Log wakeup info via dev_dbg() in the IRQ work handler (Greg)
- Peng Fan (NXP) confirmed no out-of-tree consumers

v1: https://lore.kernel.org/all/20260515175002.34853-1-sozdayvek@gmail.com/

 drivers/firmware/imx/imx-scu-irq.c | 84 ++++++------------------------
 1 file changed, 16 insertions(+), 68 deletions(-)

diff --git a/drivers/firmware/imx/imx-scu-irq.c b/drivers/firmware/imx/imx-scu-irq.c
index a68d38f89..5969460ba 100644
--- a/drivers/firmware/imx/imx-scu-irq.c
+++ b/drivers/firmware/imx/imx-scu-irq.c
@@ -9,11 +9,9 @@
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <linux/firmware/imx/ipc.h>
 #include <linux/firmware/imx/sci.h>
-#include <linux/kobject.h>
 #include <linux/mailbox_client.h>
 #include <linux/of.h>
 #include <linux/suspend.h>
-#include <linux/sysfs.h>
 
 #define IMX_SC_IRQ_FUNC_ENABLE	1
 #define IMX_SC_IRQ_FUNC_STATUS	2
@@ -43,19 +41,8 @@ struct imx_sc_msg_irq_enable {
 	u8 enable;
 } __packed;
 
-struct scu_wakeup {
-	u32 mask;
-	u32 wakeup_src;
-	bool valid;
-};
-
-/* Sysfs functions */
-static struct kobject *wakeup_obj;
-static ssize_t wakeup_source_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf);
-static struct kobj_attribute wakeup_source_attr =
-		__ATTR(wakeup_src, 0660, wakeup_source_show, NULL);
-
-static struct scu_wakeup scu_irq_wakeup[IMX_SC_IRQ_NUM_GROUP];
+static u32 scu_irq_wakeup_mask[IMX_SC_IRQ_NUM_GROUP];
+static struct device *imx_sc_irq_dev;
 
 static struct imx_sc_ipc *imx_sc_irq_ipc_handle;
 static struct work_struct imx_sc_irq_work;
@@ -88,11 +75,6 @@ static void imx_scu_irq_work_handler(struct work_struct *work)
 	u8 i;
 
 	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
-		if (scu_irq_wakeup[i].mask) {
-			scu_irq_wakeup[i].valid = false;
-			scu_irq_wakeup[i].wakeup_src = 0;
-		}
-
 		ret = imx_scu_irq_get_status(i, &irq_status);
 		if (ret) {
 			pr_err("get irq group %d status failed, ret %d\n",
@@ -102,12 +84,15 @@ static void imx_scu_irq_work_handler(struct work_struct *work)
 
 		if (!irq_status)
 			continue;
-		if (scu_irq_wakeup[i].mask & irq_status) {
-			scu_irq_wakeup[i].valid = true;
-			scu_irq_wakeup[i].wakeup_src = irq_status & scu_irq_wakeup[i].mask;
-		} else {
-			scu_irq_wakeup[i].wakeup_src = irq_status;
-		}
+
+		if (scu_irq_wakeup_mask[i] & irq_status)
+			dev_dbg(imx_sc_irq_dev,
+				"Wakeup source group = %d, irq = 0x%x\n",
+				i, irq_status & scu_irq_wakeup_mask[i]);
+		else
+			dev_dbg(imx_sc_irq_dev,
+				"Spurious SCU wakeup, group = %d, irq = 0x%x\n",
+				i, irq_status);
 
 		pm_system_wakeup();
 		imx_scu_irq_notifier_call_chain(irq_status, &i);
@@ -164,9 +149,9 @@ int imx_scu_irq_group_enable(u8 group, u32 mask, u8 enable)
 			group, mask, ret);
 
 	if (enable)
-		scu_irq_wakeup[group].mask |= mask;
+		scu_irq_wakeup_mask[group] |= mask;
 	else
-		scu_irq_wakeup[group].mask &= ~mask;
+		scu_irq_wakeup_mask[group] &= ~mask;
 
 	return ret;
 }
@@ -177,25 +162,6 @@ static void imx_scu_irq_callback(struct mbox_client *c, void *msg)
 	schedule_work(&imx_sc_irq_work);
 }
 
-static ssize_t wakeup_source_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
-{
-	int i;
-
-	for (i = 0; i < IMX_SC_IRQ_NUM_GROUP; i++) {
-		if (!scu_irq_wakeup[i].wakeup_src)
-			continue;
-
-		if (scu_irq_wakeup[i].valid)
-			sprintf(buf, "Wakeup source group = %d, irq = 0x%x\n",
-				i, scu_irq_wakeup[i].wakeup_src);
-		else
-			sprintf(buf, "Spurious SCU wakeup, group = %d, irq = 0x%x\n",
-				i, scu_irq_wakeup[i].wakeup_src);
-	}
-
-	return strlen(buf);
-}
-
 int imx_scu_enable_general_irq_channel(struct device *dev)
 {
 	struct of_phandle_args spec;
@@ -233,29 +199,11 @@ int imx_scu_enable_general_irq_channel(struct device *dev)
 	if (IS_ERR(ch)) {
 		ret = PTR_ERR(ch);
 		dev_err(dev, "failed to request mbox chan gip3, ret %d\n", ret);
-		goto free_cl;
-	}
-
-	/* Create directory under /sysfs/firmware */
-	wakeup_obj = kobject_create_and_add("scu_wakeup_source", firmware_kobj);
-	if (!wakeup_obj) {
-		ret = -ENOMEM;
-		goto free_ch;
+		devm_kfree(dev, cl);
+		return ret;
 	}
 
-	ret = sysfs_create_file(wakeup_obj, &wakeup_source_attr.attr);
-	if (ret) {
-		dev_err(dev, "Cannot create wakeup source src file......\n");
-		kobject_put(wakeup_obj);
-		goto free_ch;
-	}
+	imx_sc_irq_dev = dev;
 
 	return 0;
-
-free_ch:
-	mbox_free_channel(ch);
-free_cl:
-	devm_kfree(dev, cl);
-
-	return ret;
 }
-- 
2.43.0


