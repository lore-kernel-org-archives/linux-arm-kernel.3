Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78232606C694
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XeUk8BJ5;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=KMTg2zad
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=o3LJ0Hj1WCiPYc9EufOE1mRGFeHL/H8/8bQjlcMAaT0=; b=XeUk8BJ5REApJG
	u6keqjIGTvr7JVN9TYxAdylzhnFMkRLN/w19EJG6Mx96Vhh9ZJa315CC34iAV+04rrOmZzklgePLc
	qtL31UpZsZ11a/3/h+L7zurL2QkYFXJqf7uneV9W+NCdXgQM0EgsYvyMBLh+uHFtCSrJFrvHBszmW
	rKbTpVSr//LtBY3vHQdhbNW7R14H6xDi/0St21zzq55h1PMplylrHUhQJ+lYk4916ypeXxKiiF0YA
	O8tIaGA2lbF1tUAOpH7j/7pnEQsCOKjvdznJuHu/JqhLGHdMCvLuTP6FHSGZgmyIrJbqBQe1Cb3U+
	yhLmKj1qJ/vkTZmOUnuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9u6-00000001Xdd-2uas;
	Tue, 03 Nov 2026 08:30:02 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9tw-00000001XXy-1bnk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793694599; x=1825230599;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=EHNvnomPYWJp5Iwb8XgCJS4byDJYYpzu7MQG1ZHfDDs=;
  b=KMTg2zad6MZ7+jaud3pPbYoHhb56C+UIQAI+cqG2kOT4+PhjlpcHBac4
   1Lu8kY+X6SL/qlrJJizQlkbtfZGrPQJNfq1UE5OZ6LxBwF5tKmLc/jWy0
   rtOZc5kbpZujtG/R6tnp4rPwhtKyiS+l314oGvqhtwu8jfCuPEwvdbIsI
   yQn/yzQGwVbpXZ7YkQjRIGXpGrmKKu+vWmse3oy3GzMwqK+qhlF6kxUa2
   yoAjuhtl2/ZXeGEL9aWrybrIMlMO1QXtKcH1KyQP+UFzc0K+Ukv5D4t8B
   HeQe6fX6z5J3TG9beJJPez9WRnohvhzQjQdtdBPOmNV0hQI+lUxIVz3Ri
   w==;
X-CSE-ConnectionGUID: /jxLnuPQSRiIqrKHd133PA==
X-CSE-MsgGUID: BVqUZLkCSqyJdxJRwbUgDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:29:55 +0200
X-CSE-ConnectionGUID: yzbgF8sjTtuqhosP4VXsfQ==
X-CSE-MsgGUID: PhbRgaCpRbupdCDZWfycYA==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 03 Nov 2026 10:37:33 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 03 Nov 2026 10:29:46 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 03 Nov 2026 10:29:37 +0200
Subject: [PATCH 1/8] i2c: nomadik: optimize struct layout, change unsigned
 char into u8
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-i2c-nomadik-fixes-v1-1-655c6af2cb70@mobileye.com>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
To: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 srinidhi kasagar <srinidhi.kasagar@stericsson.com>, 
 Ben Dooks <ben-linux@fluff.org>, Andrea Gallo <andrea.gallo@stericsson.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_002952_723424_E7C0575F 
X-CRM114-Status: GOOD (  13.41  )
X-Spam-Score: -4.0 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Change type of `tft` and `rft` fields of `nmk_i2c_dev` structure from
`unsigned char` to `u8` and `buffer` field of `i2c_nmk_client` structure
from `unsigned char *` to `u8 *`.

Put two bool variables `xfer_done` and `has_32b_bus` and two u8 variables
`tft` and `rft` together in order to reduce struct size wasted for padding.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index c3878670da9c..45b4815b0945 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -170,7 +170,7 @@ enum i2c_operating_mode {
 struct i2c_nmk_client {
 	unsigned short		slave_adr;
 	unsigned long		count;
-	unsigned char		*buffer;
+	u8			*buffer;
 	unsigned long		xfer_bytes;
 	enum i2c_operation	operation;
 };
@@ -187,13 +187,13 @@ struct i2c_nmk_client {
  * @clk_freq: clock frequency for the operation mode
  * @tft: Tx FIFO Threshold in bytes
  * @rft: Rx FIFO Threshold in bytes
+ * @xfer_done: xfer done boolean.
+ * @has_32b_bus: controller is on a bus that only supports 32-bit accesses.
  * @timeout_usecs: Slave response timeout
  * @sm: speed mode
  * @stop: stop condition.
  * @xfer_wq: xfer done wait queue.
- * @xfer_done: xfer done boolean.
  * @result: controller propogated result.
- * @has_32b_bus: controller is on a bus that only supports 32-bit accesses.
  */
 struct nmk_i2c_dev {
 	struct i2c_vendor_data		*vendor;
@@ -204,15 +204,15 @@ struct nmk_i2c_dev {
 	struct clk			*clk;
 	struct i2c_nmk_client		cli;
 	u32				clk_freq;
-	unsigned char			tft;
-	unsigned char			rft;
+	u8				tft;
+	u8				rft;
+	bool				xfer_done;
+	bool				has_32b_bus;
 	u32				timeout_usecs;
 	enum i2c_freq_mode		sm;
 	int				stop;
 	struct wait_queue_head		xfer_wq;
-	bool				xfer_done;
 	int				result;
-	bool				has_32b_bus;
 };
 
 /* controller's abort causes */

-- 
2.43.0


