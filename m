Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8DDCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y6eUtUQ02u5rezVEVOgcTxRprhXqjnk3WqB6i5j0+DI=; b=SRqvnTnRtwRTvCr5gsbr0CSr0A
	8Ycna1BH/hCo+RIo67EK8ySFrs18o8zzEmr30vxotIf+eYTsz3+DlVnsGF7XV1nOf1rhRGFdCZTj6
	6NhBcMI4jTfEALTVjFo84/PFU89qG1bOBJIti3qGJNxEutKnobZsZo6f3etR8jClbS4fx3fePgy1v
	0P4ovsNOtu3zBUVqL/DwVdC0IeWmy6pc4NIZ6T93x/lCUrrBDigq1Rz43KEP2Qj1snX4/YwQJiGKc
	4nk9VqnAzcfbJ7rln7VDd5scuHL4TVmP+cgYawB185PwWxHqA7PWKww71RknynT/43u9Gp12UAERx
	f0FjNxIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJSl-00000007mqc-1ue6;
	Sat, 30 Aug 2025 11:09:39 +0000
Received: from out-183.mta0.migadu.com ([2001:41d0:1004:224b::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJOl-00000007mSn-3bn9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 11:05:33 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1756551927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y6eUtUQ02u5rezVEVOgcTxRprhXqjnk3WqB6i5j0+DI=;
	b=dsyx5OLaLkbGBVOV2cA+VO323Uaoo28CF7YowEEWLL1EjbStcsce8x4ke/e+jbvOo4uQBb
	IfWce4okynDccVnJ4+9cRL2wmuIpzvEnC4jVdtTxUBNPYULxpwPrlSmWYZcLOXJXp4cGTj
	aZeUNFxEevxjH2FacO90OYwhw26VAoI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Fedor Pchelkin <boddah8794@gmail.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Al Viro <viro@zeniv.linux.org.uk>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-usb@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: ucsi: stm32: Use min() to improve ucsi_stm32g0_fw_cb()
Date: Sat, 30 Aug 2025 13:04:20 +0200
Message-ID: <20250830110426.10007-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_040532_394774_0EC2D8A3 
X-CRM114-Status: UNSURE (   8.93  )
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

Use min() to improve ucsi_stm32g0_fw_cb() and avoid calculating
'end - data' twice.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/usb/typec/ucsi/ucsi_stm32g0.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index 57ef7d83a412..838ac0185082 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -10,6 +10,7 @@
 #include <linux/firmware.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/unaligned.h>
@@ -523,11 +524,7 @@ static void ucsi_stm32g0_fw_cb(const struct firmware *fw, void *context)
 	data = fw->data;
 	end = fw->data + fw->size;
 	while (data < end) {
-		if ((end - data) < STM32G0_I2C_BL_SZ)
-			size = end - data;
-		else
-			size = STM32G0_I2C_BL_SZ;
-
+		size = min(end - data, STM32G0_I2C_BL_SZ);
 		ret = ucsi_stm32g0_bl_write(g0->ucsi, addr, data, size);
 		if (ret) {
 			dev_err(g0->dev, "Write failed %d\n", ret);
-- 
2.50.1


