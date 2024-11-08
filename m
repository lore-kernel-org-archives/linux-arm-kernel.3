Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E63BD5E147
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y5aZ+Qr7uBJihwHSMM10XcZFpa18UKc4xjfgChU2A0Q=; b=HLVfb4sRbmdY4JxdyTRGlg3lC2
	j4HdjZKzcgbRvhl/M5iTzZqwoUHH1lxdIElFhvxYgcvIjThy4tHtopNH3Pq2xWBjATm7CG+H2p1Wd
	9JiSIDhdcgADmati8y9bxVfbzDNUwpY0rY5eJzP4Zb2BJXXyQ7CR+jJA8vt+cCginHl5p4GmpBR57
	WsHslyJg5hGcmXf2B5qo0JjmkV/TIUE83boqaJB/ZNno/PviDZsv156UQeKoLocFC+nltBQBnzk8e
	PnpbJ63xv+nn4SeFt3BuEDhE/RRFpV883j9y+zcM7SYE6KfsCKE1EmP9A6qowA/bNb2dMDmCMEHLz
	gugE9DlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KQ8-00000009mms-1XrD;
	Fri, 08 Nov 2024 08:32:44 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KJz-00000009lYk-2JVR;
	Fri, 08 Nov 2024 08:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1731054318;
	bh=Y5aZ+Qr7uBJihwHSMM10XcZFpa18UKc4xjfgChU2A0Q=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=GWcHLQdo69wBfPUeDpF095h/U0zijx7IcChhxevxkH4mc1wr1OJKCglNZXlASpe0U
	 KKn3lI9BR4Yzgc2+1T9L7QKenjkeZxnFgInExC+eSgaeTGviUKjuVAyv2F7b9qQEZp
	 YrpLy4gNnsbGiRSZJckKz0ckjeHqaMVYcHex2zmo=
X-QQ-mid: bizesmtpsz12t1731054281tg0oin
X-QQ-Originating-IP: Sx0xA5UTm3rmnPoQf4T0Y5NJKNDLks94XZpHSFSsZpo=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 08 Nov 2024 16:24:39 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12830856679117254942
From: WangYuli <wangyuli@uniontech.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	johan.hedberg@gmail.com,
	matthias.bgg@gmail.com,
	hello@felixjara.me,
	wangyuli@uniontech.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	aaron.ma@canonical.com
Subject: [PATCH v3] Bluetooth: btusb: Add MT7925 support for ID 0x13d3:0x3608
Date: Fri,  8 Nov 2024 16:24:18 +0800
Message-ID: <D3E1285F7DBFAB3E+20241108082418.187499-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MRPQukou9wBmtIoxkX4J6YWKSNjospfUU4eivDK7LT8qv3nUNqNWqIJG
	+6ttL/xTmvSMAAOSI0Q/R3BrBowjhIU8+S6MybpV0/9Bz0L7n2Oj80bC0CIzbGzWGpItlT9
	rql5web14XTGDzl04pqou9LBK9E/EIbgjh9ugvrDprpn/u52kIAonJ1ZDRJ8z75J3xN8cJA
	Qb/imEcyXz6DnaJrnTPg0EKkdbMuQ9JF4KdVQ8tZNKBRJA03TCz8upUPZWS0+IDsxcfcP9G
	dZpf28roZ5ZpzjVN1xoMO82K/PIkUz48xTqLnqkPBLVqUDb7yKSWJZ5L8NgMrfWPjaNZklG
	xmABN8FzFemipuIsfdiuBf9XhLRlegGFgV+GTcClFov/JCFQUWnvOPFhmttP2kMDOicJE0a
	pubgeqwTmAcixu085F715xPX997qP2dt5hf48K0LWXY4gAypJinHRa5dDyrwEg1SZQYR4j1
	nVuHoebZGNUaXC1z8XzHqeYJk4RaT1h9eqGRtdpoqwICTLfAXr4tRxu5306hgP92UjEJVgH
	rrvUdQMsBoh1T4XeRROHvEXfcajJzBIeLdL3QzkL0x0Jx8RowSdjKTKAV4ebo/ieapxGnfm
	VfId54Xpl5n4oaYchIKyQ+r11tv20Vdn1S5fG/JCg+8bcz5dvZW1KMm1eXGjuFQUvVrrtvo
	9D8XfaymkQlLi5egl7qPY3fuKLdk/xJgndECOfvm5W9T30tomSf/tI9fNOqx9zJXxhbs7ZR
	QAtKNJmChlGqwyvzl6LXrfvhKziL7EV+1NCJclZ0Ak8mjLqsRrcDNL/PWA19EI4RnOKD7rP
	uebLfSvS0lw0hzA5rtz7rhpbMM+hP2w9JMqyT2UW/iO4knoRp+J66WbUFE/P5qsVP23xrrP
	ATFuRcKKQGGv8y2vyYmH4ihs45CG1/FkvXrgIyXhh+IJYNDxQzw0v12PnmEgqTjpGiBlVSZ
	Ks4vr1RD+PrsSNWKte/9AslWsicBvicDgSGYhXr85cztq4gzHp07U/EytGFtja/CKJbneHE
	tv2MYVGUcq4yaiTW16
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_002624_518726_CC59832B 
X-CRM114-Status: UNSURE (   9.12  )
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

From: Félix Jara <hello@felixjara.me>

Add compatibility Bluetooth device MT7925 for Asus UM5606 with
ID 13d3:3608.

The device info from /sys/kernel/debug/usb/devices as below.

T:  Bus=03 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3608 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
I:  If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Tested in Asus Zenbook S 16 UM5606XA

Co-developed-by: Félix Jara <hello@felixjara.me>
Signed-off-by: Félix Jara <hello@felixjara.me>
Tested-by: Félix Jara <hello@felixjara.me>
Link: https://github.com/openSUSE/kernel/pull/10
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/bluetooth/btusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index e9534fbc92e3..2175a09e21be 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -645,6 +645,11 @@ static const struct usb_device_id quirks_table[] = {
 	{ USB_DEVICE(0x13d3, 0x3608), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH },
 
+	/* MediaTek MT7925 Bluetooth devices */
+	{ USB_DEVICE(0x13d3, 0x3608), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH |
+						     BTUSB_VALID_LE_STATES },
+
 	/* Additional Realtek 8723AE Bluetooth devices */
 	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },
 	{ USB_DEVICE(0x13d3, 0x3394), .driver_info = BTUSB_REALTEK },
-- 
2.45.2


