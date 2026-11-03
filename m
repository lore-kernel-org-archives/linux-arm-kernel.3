Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C377B606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DaAWL4PX;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=gSUEN+EJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uw3KvG+PK8eM2CabI2O1bfrEegYb6WR8U15r7XjoD6o=; b=DaAWL4PXEXuiLq
	xbcGYJnIBpek9dZAoOszqweGVXlQmdUSQm0HJ5/LBgpCGhJNQ1vhcGw6up5EUKSDZMvO7WphMPB+3
	xC+yMXmSB+TAXbHqPWsVeL3giqqjRIcKYKXTPSqSLFTpqUYoWmjncXLs/OLMG7Mg+nb6Tf0qiLv9e
	DYEfEts05/BG9sfszj2lIRUDOFlXud61Fuln5GxnoNzunKkIakt05zRF1sLNGXSiDMIbzBDad6thb
	FFj+aqc6GgLnlyi8XpYHU9LhRLAIY0YLoKeUzVQAzPxKJBuAAuk43yDVUN1QQ5nqDjHuKoU2XHqhi
	/lrEhd+/dAQdV1XhzfpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9u7-00000001XeB-0FMO;
	Tue, 03 Nov 2026 08:30:03 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9tx-00000001XYm-0DuA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 08:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1793694600; x=1825230600;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=UphLcdo9RHlivP4kKmdKbKimucYDRR+v25gGpEyZICw=;
  b=gSUEN+EJXyd+23Xs7/pNfDlOP4W1RBi0hzGCJd6qteYX5sx9QKETdpQx
   KZtmcOzRRoFffbIcy6nS23Mhzk4gAMlBTenHq+LFH/eFyfdzIW4jnRbfl
   nLBDQv9tyOAmJSxPJ0rAs9O8If/boo84qyMb25iyqk5YjgV/gE+XWgHUG
   ts2lrcNR/qARv0vvxalWBpGsNlVxd81O/bUaqFPRaK+AqrwyjRLG1flhv
   9TOmIWq1txyzMWRx6EIRliuiyPlPvATM1oT0w8aP/eBoolgP5C9haj/v3
   iQ4eXFbUBEZMxsSmOIAXhswg6DGNZvsvaYT0uuLl55Ph8rzLejsE734kn
   g==;
X-CSE-ConnectionGUID: /jxLnuPQSRiIqrKHd133PA==
X-CSE-MsgGUID: Qmn5nnDNScy+nJHepphyzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 10:29:58 +0200
X-CSE-ConnectionGUID: Z/IpEXidQsevqic4iwnu5w==
X-CSE-MsgGUID: RFQ4CpKzSaWSVJGFKkqrYQ==
Received: from unknown (HELO epgd056.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 03 Nov 2026 10:37:36 +0200
Received: by epgd056.me-corp.lan (sSMTP sendmail emulation); Tue, 03 Nov 2026 10:29:50 +0200
From: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Date: Tue, 03 Nov 2026 10:29:39 +0200
Subject: [PATCH 3/8] i2c: nomadik: return proper fault codes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-i2c-nomadik-fixes-v1-3-655c6af2cb70@mobileye.com>
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com>
To: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 srinidhi kasagar <srinidhi.kasagar@stericsson.com>, 
 Ben Dooks <ben-linux@fluff.org>, Andrea Gallo <andrea.gallo@stericsson.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dmitry Guzman <Dmitry.Guzman@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_002953_402692_CEE59B91 
X-CRM114-Status: GOOD (  14.98  )
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

I2C documentation Documentation/i2c/fault-codes.rst defines fault codes
for different negative results in I2C transmittion. Previously,
i2c-nomadik driver didn't implement them properly - it returned
ETIMEDOUT on most errors and EIO on master arbitration lost.

To comply with the documentation, return the proper fault codes for
different conditions, namely:

- EAGAIN if arbitration lost
- EOVERFLOW if message is too long (>2047 bytes)
- ENXIO if target address is not acknowledged
- EIO on other errors detected by controller (for example, NACK on data)
- ETIMEDOUT if driver gets timeout waiting for message completion
  without any fault condition detected by the controller (for example,
too long message, or SDA/SCL line stuck on 0).

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index ca9366e09e71..a3cef4b66190 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -226,6 +226,18 @@ static const char *abort_causes[] = {
 	"overflow, maxsize is 2047 bytes",
 };
 
+/* Linux fault codes for controller abort causes */
+static int fault_codes[] = {
+	ENXIO,
+	EIO,
+	EIO,
+	EAGAIN,
+	EIO,
+	EIO,
+	EOVERFLOW,
+	EIO
+};
+
 static inline void i2c_set_bit(void __iomem *reg, u32 mask)
 {
 	writel(readl(reg) | mask, reg);
@@ -653,6 +665,8 @@ static int nmk_i2c_xfer_one(struct nmk_i2c_dev *priv, u16 flags)
 				cause >= ARRAY_SIZE(abort_causes) ?
 				"unknown reason" :
 				abort_causes[cause]);
+			priv->result = -fault_codes[cause];
+			status = priv->result;
 		}
 
 		init_hw(priv);
@@ -865,7 +879,7 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 
 	/* Master Arbitration lost interrupt */
 	case I2C_IT_MAL:
-		priv->result = -EIO;
+		priv->result = -EAGAIN;
 		init_hw(priv);
 
 		i2c_set_bit(priv->virtbase + I2C_ICR, I2C_IT_MAL);

-- 
2.43.0


