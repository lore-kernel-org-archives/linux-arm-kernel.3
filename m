Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9339D49231
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kfw7GcU5erU0jn6umxit+XdKCvQ9/oYDTncW8OAyLtA=; b=V+xqLFJX3k5PSe8pS6946AjTL2
	hMN+OKiG50Ft+GT5RBAQMCttcN06rLJfBpK437Wg6lLOCInWEVpvp38tuykqya9Wx3pWjeGRvlkGr
	sCr/gB8+ggcbjIcILd3em8MbdtLGJXcNq/OpddBmMz+y1pQvTrcMRLSI5ALnZbdAs2nthrkF3vdZ+
	cIlm2IIizqSKMdarrsFYIQ48QeydOy6EprW00wjnd3NsMdA4F7N/OYaX597PAIk7qZIaLC7tHvQYO
	jJI6VjlTgcjIlTdEBsx/u+C28pYPVP00pH9wkn0eBY986uSKOn+QpztSiau7pG09aVdJj6xOTqaXE
	Yp8SjtIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3JJ-00000009raa-3QzU;
	Mon, 18 Nov 2024 15:05:05 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3HS-00000009r9o-1DFD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1731942187;
	bh=DmZT4xsI5doB1i+zhbofwrVYplHbfYJNLzwi59dygA0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q+9LP9dfn8kPonnhF732Ezn1AnVV9P7LCFsyl88U4Cb91wDBnq5LvbUlvG3jHj4sI
	 tTHdpN4n308s6Pj2HWHILTyy8YMXhTIFtZSXjp1dJp194kD6P1PdPt8qCCNTSoTv0m
	 e0W/IVxeLtvVllE1O6epl+iGf4rLpoP5gkvqmtW0=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 18 Nov 2024 16:02:48 +0100
Subject: [PATCH 2/3] s390/con3215: Remove spurious NULL in attribute_group
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241118-sysfs-const-attribute_group-fixes-v1-2-48e0b0ad8cba@weissschuh.net>
References: <20241118-sysfs-const-attribute_group-fixes-v1-0-48e0b0ad8cba@weissschuh.net>
In-Reply-To: <20241118-sysfs-const-attribute_group-fixes-v1-0-48e0b0ad8cba@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731942187; l=862;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=DmZT4xsI5doB1i+zhbofwrVYplHbfYJNLzwi59dygA0=;
 b=nD8J4pvnXKQqclCRBHqCv4musA1VxnMDFKDJTUm5nofKnNucxbd0ZY+On/5h0gRTZDr8zrl61
 QZKOcDJ+kLgBh7upQgIT1XjiyHiveyxsrBJS1Bvs6BwcQmLSorg+l51
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_070310_477690_5D6036C9 
X-CRM114-Status: GOOD (  11.90  )
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

This NULL value is most-likely a copy-paste error from an array
definition. So far the NULL didn't have any effect.
As there will be a union in struct attribute_group at this location,
it will trigger a compiler warning.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/s390/char/con3215.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/s390/char/con3215.c b/drivers/s390/char/con3215.c
index dcb3c32f027af6748448600bad51864f6ba5d9a1..c763c50d1454676f223e8b29a92f5fb45ddd7932 100644
--- a/drivers/s390/char/con3215.c
+++ b/drivers/s390/char/con3215.c
@@ -803,7 +803,6 @@ static struct attribute *con3215_drv_attrs[] = {
 
 static struct attribute_group con3215_drv_attr_group = {
 	.attrs = con3215_drv_attrs,
-	NULL,
 };
 
 static const struct attribute_group *con3215_drv_attr_groups[] = {

-- 
2.47.0


