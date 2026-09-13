Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BF9C88E56
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 03:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uJp5ud/myTFefNhCI2ZzWiRr2kbld/3n70B98OUzWtQ=; b=am7MQ9C6Qfpw9ju5k4aqCaepF9
	wKpPaZBlVqG0r0D/GLb7aFs1sOoR3n9XmBBebNFV8KG+TK6xPMCKE0DlKc+OtET1AvLrGGH1bLiIU
	vq5VMXE1blmSEi0uopHmoIOD2JV88w6wVB2sGeBf3H5RtB8x+3cqtFmSN87YkRwKEAGiCSsxQF2b4
	7y6T1kIThtEtPkj0BTUiQ8j1ZXE4Fdk+N/FVOolDPZAZzXWbrr9mlgqv9hZ8XGGsCzyAxZGGOh/o1
	8SGq1SraUplxX6PzJAMpOAd1YpD+8X+g92zb950sj+rSF8ECeM5bsStxhLHpfNKW9UswrOWHW1pFU
	4MWbJhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5b6R-00000001LbR-0KrN;
	Sun, 13 Sep 2026 03:42:03 +0000
Received: from mail-qk2-x10.google.com ([2607:f8b0:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5b6N-00000001Lad-3KH8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 03:42:02 +0000
Received: by mail-qk2-x10.google.com with SMTP id af79cd13be357-939ca12ab70so133758885a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 20:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789270918; x=1789875718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uJp5ud/myTFefNhCI2ZzWiRr2kbld/3n70B98OUzWtQ=;
        b=IRvbPHjUaz7RVl3xOsUibO4c0bRAoIS8JeIHC5zcDuFVOXrsluAeXuxNc0Hf2JU7T5
         MlHCbnlIugVo7YbmDx1NWkUN0vWlU/naOwLFXPgvC8mdo4APrZMtJyxwxjHVY4D2+G+a
         yircdHs4AefNtIXhRgLIk8tm+VPOe2Ib9x1WGVofFQAF2bOidmiN3/T3X4kZ92+qdAhv
         hD1rM5y4I9hM5g8hk46PBehwlFRycsBKKNdXvNGFa++aByFkYPtNcvWzULVdmCTP+eFN
         DsgBSO6qYaNoMnvh+nMtKPSLARISZ+n2kbjrt9sqpPDQHtV4U/pTggMGIRPHVDrH8Tq2
         1PwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789270918; x=1789875718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uJp5ud/myTFefNhCI2ZzWiRr2kbld/3n70B98OUzWtQ=;
        b=rVvRzGhro0DssW04SPfGVk8qZ19GzaH3mAZfZV374SJGlgl7pLQuRHB30+4fDgr7vx
         vVHahEuSv8KPBTCdI9qjUQBmLPOwJzsMLuJOCpx94WXZa8zNgZf+oI4qGJTokpmis/AQ
         dVCc1tgZhOxOSh1Z+NJ8NHHpztIEW1nDB/q1ztrt0U0wSF24gWblKaEIWVVNYhQO8QgM
         JPoxlP0/GJdO6Uo8uy3IoNDf6ipzcR7mBLAzIj+rJk/upTj4dXrkSj33LDP2uGM2JMTH
         PO2Be7q8n5vStdS2/bRE08TZy2Weps0+zTKsBEL7kW+U5XYVyhRrcQXFJ1nQL5tdOIZv
         i+jw==
X-Forwarded-Encrypted: i=1; AKwUvBzAd31Syev6nJWJHwowRTgpG1iOn6HiV1bFye5uFfDZTK0PUlVT6I6vwEcA+z8kvalrpxOIwhFarpPVWxsUdLHU@lists.infradead.org
X-Gm-Message-State: AFuF++mEN8XW3QG9pqOexuXUdAKLH6TznixsLK+qBCOcPdq+FAvnVs8W
	qRuHpfkcj8mWLByWLWeMu9kucH9+rtkFquLUBpfdEJgOtS8eBGlTR3o=
X-Gm-Gg: AYBFou0hjeYZMqbAyv9dTNzF1L1u+ei6OUx4NuE3njJKpN/cBhqjiyRM2mvjnPZbDsy
	ZDTim44mEqfdSAbN5Fn4EVcJIYg0E0nS117Zo4ApyJQ6JuNx835D6zwb1g5vLeADkHUSF3oT+H8
	Y1PHxpY0MU3/KkOdHF9a7gDLGxQYeF4PsYGma5rO1b3t/8hmh9pDYHOqIYsum7lz9lRH+8XnYqC
	qOZVPc87k4t+4WkiEW1OXo4iezQdcRaUnhv5Jk3HRRu5NuzlVHsTP+5nfaiww6ZjvRViGJ1iFxd
	9yqr7T9GFSqCLSx/qlQAE3PLapUrJBnyG1zsrAOActQO9AuiYIGvmWL5fxuvAQs1fvEWrvjexVi
	uoXvezgK3+XpFuvBayhC91DD7ykGNey4ExBX4tUfFrfRwJLt4X/LW7Vgz5qyb+yagLlIseLp6RX
	v/St1i35KtnwNOMV2+Te3AYkzzXqAEn+d0snRHPq/HlSPbVO+fs/FkdgwcuUlxWdCTa/jx9BLY0
	T8JLfnTUm2M5RtDjLg0XnQqAW0LnpIyyYimRnyzzsARSG/EKk3aA/P3Jsnl7lX9V/3nAKXTzElk
	xKqgsk5IV9TZ2s4cu4Sj3iCWnY7d
X-Received: by 2002:a05:620a:d8d:b0:939:597:e7af with SMTP id af79cd13be357-93a038fa617mr775671985a.35.1789270918119;
        Sat, 12 Sep 2026 20:41:58 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939e80d453esm652916385a.38.2026.09.12.20.41.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 20:41:57 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Dmitry Rokosov <ddrokosov@sberdevices.ru>,
	linux-serial@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] tty: serial: meson: fix UART driver lifetime
Date: Sat, 12 Sep 2026 23:41:48 -0400
Message-ID: <20260913034148.15068-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_204159_851341_3B09BAD2 
X-CRM114-Status: GOOD (  20.58  )
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

Moving Amlogic UART registration into probe left the first driver
registration behind if uart_add_one_port() failed. Adding the separate
ttyS driver later also exposed a global last-port test: removing the last
port of one driver kept it registered whenever the other had a port.

Track whether probe registered the driver and undo it when port addition
fails. On remove, retain the current driver only if a remaining port maps
to that driver. Serialize the shared lifecycle decisions against parallel
probe and remove operations.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: bcb5645f99ef ("tty: serial: meson: redesign the module to platform_driver")
Fixes: e71aab9d6132 ("tty: serial: meson: apply ttyS devname instead of ttyAML for new SoCs")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/tty/serial/meson_uart.c | 52 +++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/drivers/tty/serial/meson_uart.c b/drivers/tty/serial/meson_uart.c
index a6cb2a535..4bd9d9826 100644
--- a/drivers/tty/serial/meson_uart.c
+++ b/drivers/tty/serial/meson_uart.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/kernel.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -80,6 +81,7 @@ static struct uart_driver meson_uart_driver_ttyAML;
 static struct uart_driver meson_uart_driver_ttyS;
 
 static struct uart_port *meson_ports[AML_UART_PORT_NUM];
+static DEFINE_MUTEX(meson_uart_mutex);
 
 struct meson_uart_data {
 	struct uart_driver *uart_driver;
@@ -692,6 +694,16 @@ static struct uart_driver *meson_uart_current(const struct meson_uart_data *pd)
 		pd->uart_driver : &meson_uart_driver_ttyAML;
 }
 
+static bool meson_uart_has_ports(struct uart_driver *uart_driver)
+{
+	for (int id = 0; id < AML_UART_PORT_NUM; id++)
+		if (meson_ports[id] &&
+		    meson_uart_current(meson_ports[id]->private_data) == uart_driver)
+			return true;
+
+	return false;
+}
+
 static int meson_uart_probe(struct platform_device *pdev)
 {
 	const struct meson_uart_data *priv_data;
@@ -702,6 +714,7 @@ static int meson_uart_probe(struct platform_device *pdev)
 	int ret = 0;
 	int irq;
 	bool has_rtscts;
+	bool registered = false;
 
 	if (pdev->dev.of_node)
 		pdev->id = of_alias_get_id(pdev->dev.of_node, "serial");
@@ -731,11 +744,6 @@ static int meson_uart_probe(struct platform_device *pdev)
 	of_property_read_u32(pdev->dev.of_node, "fifo-size", &fifosize);
 	has_rtscts = of_property_read_bool(pdev->dev.of_node, "uart-has-rtscts");
 
-	if (meson_ports[pdev->id]) {
-		return dev_err_probe(&pdev->dev, -EBUSY,
-				     "port %d already allocated\n", pdev->id);
-	}
-
 	port = devm_kzalloc(&pdev->dev, sizeof(struct uart_port), GFP_KERNEL);
 	if (!port)
 		return -ENOMEM;
@@ -748,11 +756,22 @@ static int meson_uart_probe(struct platform_device *pdev)
 
 	uart_driver = meson_uart_current(priv_data);
 
+	mutex_lock(&meson_uart_mutex);
+
+	if (meson_ports[pdev->id]) {
+		ret = dev_err_probe(&pdev->dev, -EBUSY,
+				    "port %d already allocated\n", pdev->id);
+		goto out_unlock;
+	}
+
 	if (!uart_driver->state) {
 		ret = uart_register_driver(uart_driver);
-		if (ret)
-			return dev_err_probe(&pdev->dev, ret,
-					     "can't register uart driver\n");
+		if (ret) {
+			ret = dev_err_probe(&pdev->dev, ret,
+					    "can't register uart driver\n");
+			goto out_unlock;
+		}
+		registered = true;
 	}
 
 	port->iotype = UPIO_MEM;
@@ -781,9 +800,14 @@ static int meson_uart_probe(struct platform_device *pdev)
 	}
 
 	ret = uart_add_one_port(uart_driver, port);
-	if (ret)
+	if (ret) {
 		meson_ports[pdev->id] = NULL;
+		if (registered)
+			uart_unregister_driver(uart_driver);
+	}
 
+out_unlock:
+	mutex_unlock(&meson_uart_mutex);
 	return ret;
 }
 
@@ -794,15 +818,19 @@ static void meson_uart_remove(struct platform_device *pdev)
 
 	port = platform_get_drvdata(pdev);
 	uart_driver = meson_uart_current(port->private_data);
+
+	mutex_lock(&meson_uart_mutex);
 	uart_remove_one_port(uart_driver, port);
 	meson_ports[pdev->id] = NULL;
 
-	for (int id = 0; id < AML_UART_PORT_NUM; id++)
-		if (meson_ports[id])
-			return;
+	if (meson_uart_has_ports(uart_driver))
+		goto out_unlock;
 
 	/* No more available uart ports, unregister uart driver */
 	uart_unregister_driver(uart_driver);
+
+out_unlock:
+	mutex_unlock(&meson_uart_mutex);
 }
 
 static struct meson_uart_data meson_g12a_uart_data = {
-- 
2.47.1


