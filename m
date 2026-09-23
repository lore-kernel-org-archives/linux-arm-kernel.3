Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0473C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XoMn1hm3woLIoz+/tRipkpbGXRndkvfVU8WHGny3VZ4=; b=tQGu/6O+pmSnkGpV1q+rHdY8kP
	kL9Xjs794rCh6MA32ZUHIdkFS9I7twcnTlCJuc5xp2EeNgTSuMCvzUyFPgJ3bA7WaLg/t6yLo57OZ
	c8PZcUTvandPmxC4imIznsjoWp6kHnaKLPZ7rAhSlcAdS4g05eBxYGi/ApCIRx0d76Bo6uAbHG5XL
	tWtNF9lk4gYn1lJ9NjhqBwU/CCuCeVr1LY2XSDAOsspVA4b464Y6oeHXJCxUqbi8+d58kWqLX4vYJ
	dP3LtdUb1QPi1Non8hfYU3Lj0GIWg3Iajd5UHLbVdtdEyBXUnCVdWHLNV+4gJFpKNhBUjpaD3e9oC
	fm/MwZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QFa-00000008wK0-19BN;
	Wed, 23 Sep 2026 16:55:18 +0000
Received: from mail-qk2-x0e.google.com ([2607:f8b0:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9QFE-00000008wCi-1IGh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 16:54:57 +0000
Received: by mail-qk2-x0e.google.com with SMTP id af79cd13be357-93bef17c191so84992785a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790182495; x=1790787295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XoMn1hm3woLIoz+/tRipkpbGXRndkvfVU8WHGny3VZ4=;
        b=Imh4zbxBLqurwrs23RELsuC15zpwB/ykUfS3QlQjPBtbb+GR72U6sE92XMNSpNIY+2
         cbY9uHMn0w//rGuqLITbcJCyfZ+cSHFx0Xpp8TnJPX0mecZvgJUX8X0DhsxG29UPGkAH
         o95RimnvdFnmbnUnFyypkYBtJ47NAOC33QcfM3Sv6P20t3xkucZPeXwYMu0M1J+lkLA8
         MS0yXAgIS7Q2/T0NpwNyOyhI719qKdNpoZg23yG8g+GzZwpBm0y/1Sko19vIhYrcanxk
         TNa4eVtoSs9VGQdlwyCGial13EhhUnc/fJiGMQ99ujsTJxXm3UavrsyAywjlE6UJm2h9
         +tUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790182495; x=1790787295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XoMn1hm3woLIoz+/tRipkpbGXRndkvfVU8WHGny3VZ4=;
        b=2wCPhgCoddPjYlPdFJyLADDxqmQ14qOGOP5GpaG2ckkWXm3oHWiGo9XVVHvM2QXC6j
         UOcEsvB4YmeG/H3uTAzQMg5YXImho8spWNk+PNDJH9+jhyi3po/TiGzvu3W0hdWlrpqn
         nidQSQwGbRtWrPtrQ9BO9EgSvD/nebD+BKWQIz6IeRySIjoMQySJ7XeWkeDL1LhOWhiV
         PT/908mtymLmFY/3UJB58JC6lkwCUfHxPkcjhBgqYRic7BYYkzL9EM8f1mJa+jNjaZJT
         dQGxhGt1rfPpe2WrC6rwS/Jq1bMFRRrWdCAOnVPmwDQD1VKCqj11l/9kVBeqN3766jWn
         Xgvw==
X-Forwarded-Encrypted: i=1; AKwUvBxBT6S3zBZaz9gR7srqSjwUg55l9MguVdaDgyIPsbpsns9eB615YcyLXzIIHeYrhdMyIWm5PAn83JsCvKCl8Gcx@lists.infradead.org
X-Gm-Message-State: AFuF++kEcM4QRkpPxMYFJLUNQ7h+tjG68svdUO+RRTwmRtdEg1jXgGG2
	m1Pbq+Q9YREn/wp+guW9AjHFt11FTR+3NTHw5TBtsLAcahFzr8q4q6Rz
X-Gm-Gg: AYBFou37VBCugB5VcGh5pcqs5CZSguZgFiUxAypR9vG+05TADBeTXDZEizDavLpUJjR
	gXmgOAG5mIGxVmceC2sNIoQx698yxbKiOD/RxZbLI8YX6h0pN5Gm72MsCA+OZx1M5P5bvHhi51u
	y50CXahjZtn3ZlXB5s1IN87WoGHg+iUBKuho4xXn0XQa6dHa6cajEoFyERjes3D/x/pR3ixVat8
	9eqAEYBRBKxJb8INvOQ87ROzXJsCIJVM02CXqXZuEyF5UYfMl8P1o1gD1ZzMyRaXP20Ri++Qv4/
	kwFJh+vrr1u3E9KOKgQGezoknuRikJpJvNd6VMq+mn1vb5gpydo37qOAbL5ZPOU6EDxYz6GI6+0
	ojr5014V81/0hcIpi/BD8UKSM43+5NuhGcuUaTsLevYAlzklTzJCMUxuV6bhfQm5S1atWgs0Px7
	eMfCYnui0ouuaDKU1aRLJShUo083sC5vxuecGYUcCkfKGReqyXWNIl7ueMlt+7dS6XSI+bo7Hgg
	JR6mhyRjo58b/fqDnd2GZIZLVMw2WBt
X-Received: by 2002:a05:620a:3710:b0:93a:855b:b95 with SMTP id af79cd13be357-93c251e370dmr503428885a.52.1790182495034;
        Wed, 23 Sep 2026 09:54:55 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c2c22f729sm137899485a.13.2026.09.23.09.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:54:54 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] irqchip/gic-v3-its: Drop ITS node reference on its_of_probe() errors
Date: Wed, 23 Sep 2026 12:54:40 -0400
Message-ID: <20260923165447.619477-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_095456_358208_9FA8D4CF 
X-CRM114-Status: GOOD (  13.30  )
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

its_of_probe() walks the ITS nodes with of_find_matching_node(), which
drops the reference on the previous node and returns the next one with
its reference count raised.  The loops are balanced when they run to the
end, but the three error returns (a failed its_reset_one(), a failed
its_node_init() and a failed its_probe_one()) leave with the current
node still referenced.

Drop it before returning.

Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register before probe")
Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisation of its_node")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (arm64 defconfig, W=1).

 drivers/irqchip/irq-gic-v3-its.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index e9807af23537..6361d20bd920 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5579,8 +5579,10 @@ static int __init its_of_probe(struct device_node *node)
 			continue;
 
 		err = its_reset_one(&res);
-		if (err)
+		if (err) {
+			of_node_put(np);
 			return err;
+		}
 	}
 
 	for (np = of_find_matching_node(node, its_device_id); np;
@@ -5602,12 +5604,15 @@ static int __init its_of_probe(struct device_node *node)
 
 
 		its = its_node_init(&res, &np->fwnode, of_node_to_nid(np));
-		if (!its)
+		if (!its) {
+			of_node_put(np);
 			return -ENOMEM;
+		}
 
 		err = its_probe_one(its);
 		if (err)  {
 			its_node_destroy(its);
+			of_node_put(np);
 			return err;
 		}
 	}

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0


