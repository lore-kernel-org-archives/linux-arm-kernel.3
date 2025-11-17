Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF81DCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 01:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/LsyDl43Ap26Ql0cULqqInjzu/MILNJXqLniDEEwKSc=; b=oEl7kySdCt2kuoifD9WkM19PzV
	yZAgxp18N5GSRBregyle2pG3BjAgn72vPclz/6z/kN+cRs3doLgi+Z1LhBK79uAJ9Hzb5vzlgU+G+
	QQ8mFRt/HoFXHmFHcMng40rB3DQaxFA79tACBOj2IW6q6QUzhLNKSqXIjzixbmY0ZsPMFWnu5QhRE
	+P8NVMioGJmxjOJn6zxgO71lLY+gbW2Sv4QsBEF55ndF2p3uhXTS7w0lRxQIr6vRj3Jd8w0qvmf5m
	cpnP+chf8Ys+WCg8xl3gwJeIcsBA9ZNtTVs7jhD8nN7U0L8s686JJp64YENM/Wzq9f1hNL6ypGimG
	xjDsY9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKo8r-0000000FGga-3pdh;
	Mon, 17 Nov 2025 01:34:53 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKo8n-0000000FGfb-1zM2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 01:34:51 +0000
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-05 (Coremail) with SMTP id zQCowADn4GGlexppPSADAQ--.76S2;
	Mon, 17 Nov 2025 09:34:38 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: stern@rowland.harvard.edu,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	stigge@antcom.de
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] USB: ohci-nxp: Fix error handling in ohci-hcd-nxp driver
Date: Mon, 17 Nov 2025 09:34:28 +0800
Message-Id: <20251117013428.21840-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: zQCowADn4GGlexppPSADAQ--.76S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWxCF13XrWUJr4kAr4fZrb_yoW8uFy7pF
	nrWa4YkFyDG3yIg3y3AF17XFyIkw47t3yrt3y7Gw17Wan0y3sIvFyvkFyjvF43XrWkGr1F
	9an8t3yYyw4UAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4
	vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmQ6LU
	UUUU=
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_173449_943059_4DFE73BE 
X-CRM114-Status: GOOD (  13.27  )
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

When obtaining the ISP1301 I2C client through the device tree, the
driver does not release the device reference in the probe failure path
or in the remove function. This could cause a reference count leak,
which may prevent the device from being properly unbound or freed,
leading to resource leakage.

Fix this by storing whether the client was obtained via device tree
and only releasing the reference in that case.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 73108aa90cbf ("USB: ohci-nxp: Use isp1301 driver")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v2:
- only released the device reference when the ISP1301 client was obtained through device tree, not in the non-DT case where the global variable is used;
- removed unnecessary NULL checks as suggested by reviewer.
---
 drivers/usb/host/ohci-nxp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/host/ohci-nxp.c b/drivers/usb/host/ohci-nxp.c
index 24d5a1dc5056..081b8c7f21a0 100644
--- a/drivers/usb/host/ohci-nxp.c
+++ b/drivers/usb/host/ohci-nxp.c
@@ -50,6 +50,7 @@ static const char hcd_name[] = "ohci-nxp";
 static struct hc_driver __read_mostly ohci_nxp_hc_driver;
 
 static struct i2c_client *isp1301_i2c_client;
+static bool isp1301_using_dt;
 
 static void isp1301_configure_lpc32xx(void)
 {
@@ -161,6 +162,7 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 	} else {
 		isp1301_node = NULL;
 	}
+	isp1301_using_dt = (isp1301_node != NULL);
 
 	isp1301_i2c_client = isp1301_get_client(isp1301_node);
 	of_node_put(isp1301_node);
@@ -223,6 +225,8 @@ static int ohci_hcd_nxp_probe(struct platform_device *pdev)
 fail_resource:
 	usb_put_hcd(hcd);
 fail_disable:
+	if (isp1301_using_dt)
+		put_device(&isp1301_i2c_client->dev);
 	isp1301_i2c_client = NULL;
 	return ret;
 }
@@ -234,6 +238,8 @@ static void ohci_hcd_nxp_remove(struct platform_device *pdev)
 	usb_remove_hcd(hcd);
 	ohci_nxp_stop_hc();
 	usb_put_hcd(hcd);
+	if (isp1301_using_dt)
+		put_device(&isp1301_i2c_client->dev);
 	isp1301_i2c_client = NULL;
 }
 
-- 
2.17.1


