Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F39CE7A96
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 09:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9t6XSOX8HZTnF2BPcLdwdRlHvEGunVrPJasMTDsylTI=; b=RixsS8O4gMIehhrZ2KLfGYUgTs
	grcFNI7Yyl6acEhad5XkIrqD6WiF+m1T8JYkLM3TaDgheBoWqOs/sgM1WbgXOMd2ke+dgzAVDcJ61
	7ZDcOBaE8GH2sc2oHwmR5BeUMjz3oazM470h3j1ILSOFtgSE+b0L0bMqRNPkHI7NnZlTsjTJ7MxhH
	DqKL/kAPCrTanoj8rucolCEGe0RFh+SWGtgz25YqzA1KBPeOsXSudYxHM9TJg1Qelj5V5KAH945b3
	8ixJfZBM1zZYvqyql/cBIOW5CFG1C/IfK9/fuZPKZCtWdoJkyi0rTMdIr78s+kgmdxwaZ1vwiE32Q
	pJ0Cw9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpoZ-0000000BrjD-0Yuu;
	Fri, 14 Nov 2025 09:09:55 +0000
Received: from mx-relay25-hz2.antispameurope.com ([94.100.136.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJpoV-0000000BriE-2FZq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 09:09:53 +0000
ARC-Authentication-Results: i=1; mx-gate25-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=9t6XSOX8HZTnF2BPcLdwdRlHvEGunVrPJasMTDsylTI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763111384;
 b=OXcbBr5gBA5xe8rcSwC1jSwV9VSkXJTPmN+s0c7vKPIm2AGgz7qlxf5hG92/ye4Cy1YfeoAC
 UB0fJ5+qv4MRL22x5yxCyuCotypP42G3o+s3ZjWPNVGMtI7P/vBrvvf91SL/tgFVoNYOTRzcC/R
 xt5aLLLXoVQnT0I4eUhX9JS5zs/O/0g1bwlTSkunFJI8KiiMiunSMihZfgzBvWNs8prG2JYOwp5
 P9O5qZg8P9Odj5APc+picU8xqveofxhfHPtE251iYkwfIGOTR7vSMtMa8YxNlao7eJaRAc2d1wH
 BplQW8db5zVxBtB6OgMBX96NQzGCg7Ypat5nYYvsE1J8Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763111384;
 b=ADgX3Ex2kWg0XZYT009p17jlPzFg9+8xSEOtr4mTFO2tldOdS4y21NiUAbqp5kmNJyErfBoj
 kQh2H+S1l/oQuPx0OsRBmZKvt29GyR2L9euPk2hpUXYDZalKCb6GkftIPfH0H8hk1qK/gx8oJL9
 VVyfJqz2N5uqIwb5OzY//yktwD4FfiV5QEFGK/5qV4D9ItRQHbWoMccjPQMktQhaJ+7LSz0sgg1
 h956Y52mUZmuzQCUUfw+n39RHQygNjqpBdxH6Q/kkkaeC0Z2l0Ep0VgTsRy5RZLjzCYHXLZZtbZ
 KkI7NsHClXatQHq4Yw1d+hFUo0WLLLILaRr8r2Zj5d1lw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay25-hz2.antispameurope.com;
 Fri, 14 Nov 2025 10:09:44 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 19D4AA41060;
	Fri, 14 Nov 2025 10:09:38 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/2] clkdev: increase MAX_DEV_ID to 64
Date: Fri, 14 Nov 2025 10:09:33 +0100
Message-ID: <20251114090934.1471533-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114090934.1471533-1-alexander.stein@ew.tq-group.com>
References: <20251114090934.1471533-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay25-hz2.antispameurope.com with 4d7BD23r2XzvfqC
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 23328006b1f1cc7c5afda73fc5950132
X-cloud-security: scantime:2.225
DKIM-Signature: a=rsa-sha256;
 bh=9t6XSOX8HZTnF2BPcLdwdRlHvEGunVrPJasMTDsylTI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763111383; v=1;
 b=TVv6CwzN6uNVBtmtEPeCYcJJQDYa6xOSNqWWvzc555trJAZwNVm/p70eWHeG36EQfPxegVGl
 x0PWVURrj4iFo/eWRjsbyNfhVJ+ln9UjTiwBa8tUaI6ZhsUJBykBQ59cvbp/fRF1gNIZ6IV561N
 khnRy1kqJ2mScimQsiOoO/oukrKOQhPXe8iwLmOTkhPkcSS1Vljh8mfWnMVOQnOIyau+4Da4jw/
 bZ7Pik+SSC897eMUw12p4Neb4P0A3PuFVBcNhW6Podavb0aB+OkcVkpN8vnIi2d9CrWgBNtsp/e
 eE6eTSoAycsT718cb93a+0MsMrQhpa5j5iwcvUFmslCXw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_010951_718828_7B2C12CA 
X-CRM114-Status: GOOD (  12.08  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

On the TI AM335x, there are clock IDs like
"48000000.interconnect:segment@200000:target-module@0:mpu@0", which is
58 characters long.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/clk/clkdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index f46324622cca0..8771fe9453830 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -144,7 +144,7 @@ void clkdev_add_table(struct clk_lookup *cl, size_t num)
 	mutex_unlock(&clocks_mutex);
 }
 
-#define MAX_DEV_ID	24
+#define MAX_DEV_ID	64
 #define MAX_CON_ID	16
 
 struct clk_lookup_alloc {
-- 
2.43.0


