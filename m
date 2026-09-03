Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96727C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 05:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rxb5cz+aSvBnrWoCOxzWlVzJZ5tSCCCd5DAPkTxazgY=; b=4MrQzZMaFOTklF0KrvPwlvloEB
	sFw0Khv4hHRfgSNfZ/3v67pSqBsZnaLz+XT83RIDkSwAdPba8gUKODwKQ3jl9Az2eQJlvPPtMXgiV
	FVj4TKycf4Pciv0OBfHz2sMQqbZKdAso9vt5BqyPOFYJor/l5HTQvNnhfIPxZYYhuYOQ+E4NAQZPl
	S3wFtv9XRkEd3wnDirlL2TelIywv4USHdJl5M9933iU8ctS5RKREfMrZzzrSf/zuuXIabQ9rrhEKG
	IJdHsZANh2qE4SQPEXv4LTXjHDKAXmpXyX5D7EKmbthn2Re4gnDWOuC5shgc8PMD5+2821k5sxUEf
	iQb7F2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x20A1-0000000GPSZ-1Bqz;
	Thu, 03 Sep 2026 05:38:53 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x209u-0000000GPJv-2LU9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 05:38:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1788413926; x=1819949926;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=PNI7MueqC5h/YY2PhbaG1O/1pTebA97FxujwfRwmfw0=;
  b=Gsx12VnagYwZHgXKay289XtDHAIst/KRcwroFVNldb0ItgjxgAGQDL/y
   OgvJUsRbX8fZi64Cm0OEpZ0T7f1ZppY8/TdoIIp+uZSbc8k2l57Ji4DcH
   A0UiHVdJTTg74sNMYZIkmPpJE5iun01DjmGNuntxQkGDOX070xQAwplho
   TZBNtap2PiX4e0qXcJzQKYNrA1YFCuKCs4SG+Cfk9mAE+F601WVYpG5IV
   5wAhS4ueDyTCtK0igSta0gwN11DixKOYNcqnUBTlMd0VG+f2T4gxNR0cz
   tgmKO7ArpKmYaazhscw8NEhQ3QCULDn3UgmHMn5b1O8Re9Zx9kyAmPGRL
   g==;
X-CSE-ConnectionGUID: HEUEMwveRnCWUrp8fs3GKg==
X-CSE-MsgGUID: 4d5i1FaZRQCceCNNU4Nm4Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:38:45 +0300
X-CSE-ConnectionGUID: +5PfWTSgRT+W4mKBZF2RYg==
X-CSE-MsgGUID: VzPzu2k/TLmp0Oeb2pFa8w==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.3])
  by ces01_data.me-corp.lan with SMTP; 03 Sep 2026 08:45:25 +0300
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Thu, 03 Sep 2026 08:38:44 +0300
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Thu, 03 Sep 2026 08:38:15 +0300
Subject: [PATCH v2 08/12] i2c: designware: return proper fault codes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-i2c-fault-reporting-v2-8-fedeb91792e6@mobileye.com>
References: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>
In-Reply-To: <20260903-i2c-fault-reporting-v2-0-fedeb91792e6@mobileye.com>
To: Andi Shyti <andi.shyti@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_223846_932030_8E188C33 
X-CRM114-Status: GOOD (  18.43  )
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

I2C documentation Documentation/i2c/fault-codes.rst defines fault codes
for different negative results in I2C transmittion. Previously,
i2c-designware driver didn't implement them properly - it returned
EREMOTEIO on NACK either on address or data phase instead of ENXIO and
EIO respectively, and EINVAL instead of EOPNOTSUPP if a message cannot be
sent due to controller hardware limitations.

To comply with the documentation, return the proper fault codes for
different conditions, namely:

- EOPNOTSUPP if the controller cannot transfer the message sequence
  requested (for example, target address change without STOP condition)
- ENXIO if target address is not acknowledged
- EIO on other faults detected by controller (for example, NACK on data)

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 8 ++++++--
 drivers/i2c/busses/i2c-designware-core.h   | 3 +--
 drivers/i2c/busses/i2c-designware-master.c | 2 +-
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index a1eca6cd4b75e9a76f2fc10afba8877d2b45417d..e934bcbe766042483874b3e43d10ffff30c59e04 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -776,11 +776,15 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
 	unsigned long abort_source = dev->abort_source;
 	int i;
 
-	if (abort_source & DW_IC_TX_ABRT_NOACK) {
+	if (abort_source & (DW_IC_TX_ABRT_ADDR_NOACK | DW_IC_TX_ABRT_TXDATA_NOACK)) {
 		for_each_set_bit(i, &abort_source, ARRAY_SIZE(abort_sources))
 			dev_dbg(dev->dev,
 				"%s: %s\n", __func__, abort_sources[i]);
-		return -EREMOTEIO;
+
+		if (abort_source & DW_IC_TX_ABRT_TXDATA_NOACK)
+			return -EIO;
+		else
+			return -ENXIO;
 	}
 
 	for_each_set_bit(i, &abort_source, ARRAY_SIZE(abort_sources))
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 2c929a6e8da2a35b3b2d8ad886e326e2df285927..025311c8662c612aaaf772fb223af38278217c90 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -112,10 +112,9 @@
 #define DW_IC_RX_ABRT_SLAVE_ARBLOST		BIT(ABRT_SLAVE_ARBLOST)
 #define DW_IC_RX_ABRT_SLAVE_FLUSH_TXFIFO	BIT(ABRT_SLAVE_FLUSH_TXFIFO)
 
-#define DW_IC_TX_ABRT_NOACK			(DW_IC_TX_ABRT_7B_ADDR_NOACK | \
+#define DW_IC_TX_ABRT_ADDR_NOACK		(DW_IC_TX_ABRT_7B_ADDR_NOACK | \
 						 DW_IC_TX_ABRT_10ADDR1_NOACK | \
 						 DW_IC_TX_ABRT_10ADDR2_NOACK | \
-						 DW_IC_TX_ABRT_TXDATA_NOACK | \
 						 DW_IC_TX_ABRT_GCALL_NOACK)
 
 struct clk;
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index a1bcc3797e4ffef0edb9d3e978eab20a3c09d6aa..d10f46cf4aa44344fa1c53b9b8798a8b0f0c193c 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -894,7 +894,7 @@ i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 		 */
 		for (cnt = 1; ; cnt++) {
 			if (!i2c_dw_msg_is_valid(dev, msgs_part, cnt - 1)) {
-				ret = -EINVAL;
+				ret = -EOPNOTSUPP;
 				break;
 			}
 

-- 
2.43.0


