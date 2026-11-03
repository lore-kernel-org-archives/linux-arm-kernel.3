Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71E9606EE9B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4tkA7Xrh;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=caxsn5iV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vAJsDviy3Fr5desxJFh65jr3SkocS+1xF/1kHL4MgFE=; b=4tkA7Xrh3xLSi3
	FOtA1tmqFzShzdc0wle7HzaqNjOM/xjICh2I69FqLFi1aEPvOG5sHKnonEZ0W0OfScE5pWzzLzyZN
	S70Sf8jcxWX8VyhA+x6KTbqafRhYzueMAPUuxcrCwDcnkCE5zJAa8RKop39phBxO5Xh+Hf0iP6ZKq
	U84U2+0afsCT27/cuqUz3mY94eL4qARkfl8DjPMehKQRXfn9pI4gfvmiDaImBjYfJhzD3SJE03lYd
	/einuO6LAan2ggwds0jf+gd8flSjVBsHVlN7+Cymoz0pIyblO6zcFubQnEXYslxjk1sHHkGeuEbgR
	RSHRAX2DkunYfCO+lQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9uH-00000001Xjm-2UGI;
	Tue, 03 Nov 2026 08:30:13 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9u0-00000001XaQ-2txr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793694603; x=1825230603;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=GKnijHUVVD7v3+YYQuJyw1BFy9XJ5bZ03qErcUlJTPA=;
  b=caxsn5iVt2p2gtE4gJTcG75b9XKGy9Xb4gUDayesKuTtGIiC225Tzshb
   WUZw9xhYHfoNreVilZdWmsNrpJV0ZJCvCnA+ahgxI0PF8h0bOX1//r415
   fTbzN+1k8BDM5O7qtEwVBBxXztz7BfvQiRrHbcB+4aXPlZQjOonX5GXh8
   /qfT7cU73XTzMGycv+KEelBZnPO7bTXbkBYHoVSrJ9Zw+78U41k1X2Vvq
   43AuDOPE8BYbOYjZ1APh0uPnHPDdbIoDj0mcCHnH97fss2O9kGdSRTBox
   SmD5koyHmWUOt3usiTQsqfVCt0vbP1pBhbeUiD0G7lyrJGmfSfwxQq7Ey
   A==;
X-CSE-ConnectionGUID: /jxLnuPQSRiIqrKHd133PA==
X-CSE-MsgGUID: lxK3pN6BRjuDnM0z8GBsYQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:30:01 +0200
X-CSE-ConnectionGUID: AU8Asm2xRRWrzXa6a6BCmQ==
X-CSE-MsgGUID: mIf+bvJPQCu52rWwts5/BQ==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 03 Nov 2026 10:37:40 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 03 Nov 2026 10:29:53 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 03 Nov 2026 10:29:41 +0200
Subject: [PATCH 5/8] i2c: nomadik: add quirks max_len=2047 and
 no_zero_len_read
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-i2c-nomadik-fixes-v1-5-655c6af2cb70@mobileye.com>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
To: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 srinidhi kasagar <srinidhi.kasagar@stericsson.com>, 
 Ben Dooks <ben-linux@fluff.org>, Andrea Gallo <andrea.gallo@stericsson.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_002957_087325_5CFF226B 
X-CRM114-Status: GOOD (  15.38  )
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

In Nomadik I2c controller, register I2C_MCR has 11-bit wide LENGTH
field. Its maximum value is 2047, so this is the maximum length of a
single message. It is less than the common maximum I2C message length in
I2C subsystem (8192), so define a quirk in order to report the
unsupported message without any attempt to transfer it.

Zero length reading doesn't work properly on this controller, so add
`I2C_AQ_NO_ZERO_LEN_READ` quirk flag.

Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 9c7658148bd4..d07246d11b35 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -79,6 +79,9 @@
 #define I2C_MCR_STOP		BIT(14)		/* Stop condition */
 #define I2C_MCR_LENGTH		GENMASK(25, 15)	/* Transaction length */
 
+/* Controller hardware limitation of the message length */
+#define I2C_MAX_MSG_LENGTH	(I2C_MCR_LENGTH >> 15)
+
 /* Status register (SR) */
 #define I2C_SR_OP		GENMASK(1, 0)	/* Operation */
 #define I2C_SR_STATUS		GENMASK(3, 2)	/* controller status */
@@ -1087,6 +1090,12 @@ static const struct of_device_id nmk_i2c_eyeq_match_table[] = {
 	{ /* sentinel */ }
 };
 
+static const struct i2c_adapter_quirks nmk_i2c_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN_READ,
+	.max_read_len  = I2C_MAX_MSG_LENGTH,
+	.max_write_len = I2C_MAX_MSG_LENGTH,
+};
+
 static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 {
 	struct i2c_vendor_data *vendor = id->data;
@@ -1161,6 +1170,7 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;
 	adap->timeout = usecs_to_jiffies(priv->timeout_usecs);
+	adap->quirks = &nmk_i2c_quirks;
 	snprintf(adap->name, sizeof(adap->name),
 		 "Nomadik I2C at %pR", &adev->res);
 

-- 
2.43.0


