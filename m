Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF60C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/jSDbvU+sSMPsR3FEFzrekZHW/2D9icHxMI/p6LU5cc=; b=R5eq9tUu5IkS26YJu2Da3Xlyhx
	OtK65VDvg02dqUmlGAmSg6/ORLMrjcCcAr5sl+0mKqbGq6xjKT++IQ3JyHwB8PMMTjmbH8QuERNen
	HGatk3+RUHxsL4ZAWdDN7wilveZ38iQxyhOU7+i4LAZ44WGUd3BpifNZL0I9YwfigEztrBCVO7eoT
	OaIzBw8V381pq3ImSXKNXYsBsPaUlh70IPU5jovNbJ8zzLmiNQrsuKCT4kPRpYQA98ZRkVU2O4oAh
	BwzZC2wN4k42j2c8Yp/4uyJudA9c7jtvfZL/nUu8IdMblrARu4xMX7ql/G9DRXZvhFjlI6bUDijqa
	9BCkieqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITo-00000007YJq-2nZ6;
	Wed, 23 Sep 2026 08:37:28 +0000
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com ([34.218.115.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ITi-00000007YGJ-2UTo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:37:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1790152642; x=1821688642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/jSDbvU+sSMPsR3FEFzrekZHW/2D9icHxMI/p6LU5cc=;
  b=VA9DSYOUIDfqsLiHTGczUCV0CBQ2wbNDzqQnjFkYZAfyYoD8tQux/53b
   BImBjfTMGuIQXz63GkX8uTwV+28TchXmPdrFr+7DGYWS1TuarwrmGLQYm
   R8p9eTQGwuNUZHr3EOuUuRH0YCqVWRdnW6bM7d3hYUDCWWAYNJv1555sb
   ctcTCIDXZmtd1JlgTKXnT0QHwXfq7BVPwrkrSdbSEICSNDTXfyF+PfXG5
   uFYUYdee2VuWcb0CY0GZ9rcLYUWb7FEo0v+qn1NBqefn4+iRJbQ9zGDC4
   TeFmuPmhgzAavjx7Ayllj55+WCMK2Oj5haRTkJnm2AH5JSsuBD881HkEz
   Q==;
X-CSE-ConnectionGUID: ZTYL8/TwQVGnN2kzN0LScw==
X-CSE-MsgGUID: fylhUUF5QD2JNtkfbl1ZLg==
X-IronPort-AV: E=Sophos;i="6.27,118,1787011200"; 
   d="scan'208";a="29208088"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 08:37:13 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:25436]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.232:2525] with esmtp (Farcaster)
 id ec2c215a-e1d5-4a75-8e4e-823d276dbc87; Wed, 23 Sep 2026 08:37:13 +0000 (UTC)
X-Farcaster-Flow-ID: ec2c215a-e1d5-4a75-8e4e-823d276dbc87
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Wed, 23 Sep 2026 08:37:13 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com
 (172.19.116.181) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49; Wed, 23 Sep 2026
 08:37:12 +0000
From: Eliav Farber <farbere@amazon.com>
To: Thomas Gleixner <tglx@kernel.org>, Antoine Tenart <atenart@kernel.org>
CC: Radu Rendec <radu@rendec.net>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eliav Farber <farbere@amazon.com>
Subject: [PATCH 2/4] irqchip/alpine-msi: Drop redundant asm/msi.h include
Date: Wed, 23 Sep 2026 08:37:01 +0000
Message-ID: <20260923083703.38974-3-farbere@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923083703.38974-1-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.19.116.181]
X-ClientProxiedBy: EX19D033UWA004.ant.amazon.com (10.13.139.85) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_013722_688911_7F88AB00 
X-CRM114-Status: UNSURE (   9.56  )
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

The driver already includes <linux/msi.h>, which itself pulls in
<asm/msi.h>, so the explicit arch include is redundant. Remove it;
checkpatch also flags the direct use of the asm header in favour of
the linux one. No functional change.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
 drivers/irqchip/irq-alpine-msi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 0d97abb85e16..20f1f7f7612b 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -21,7 +21,6 @@
 #include <linux/slab.h>
 
 #include <asm/irq.h>
-#include <asm/msi.h>
 
 /* MSIX message address format: local GIC target */
 #define ALPINE_MSIX_SPI_TARGET_CLUSTER0		BIT(16)
-- 
2.47.3


