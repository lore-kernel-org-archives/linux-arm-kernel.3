Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369F4CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 23:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iGLCDZv1hdB2MgIaz/XQKoXR1JnQneRt9RRBxPzdNNA=; b=w1zC9ikbqTL91LhdBJuXC8iu0V
	xuQ26NuW+0PBNUkhGDWk2y6SsE9Iyi36iG4QvDNQaN+8v4ulY3v4MR34ttuKiur9jEdCnQoP+tWy2
	hUqyQbPiSpBsyd7+FlTZm60ObuhbXKXVOhvfEc0uxLHH7ftaPf+lyR5UD8SggbNxQvNwo1BaL5+QV
	CR7pb2mDM+xhV+/CnsH1xIX7mNhPEJJEokmdbfCeUxWc9Auk/lbOeuqaTdZKi4v+koH+Htepk7O+t
	VGo9nV4qMFEKW40PxpgF7rD4GkQUbcgVGkhQ48kaHRX++jCeUYLiWcWdqlDNPM0pQ8jBkbJ0eFHkX
	tdn/WQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3O-000000042M0-0xfG;
	Wed, 13 May 2026 23:31:50 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNJ3J-000000042Ka-3leD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 23:31:47 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-512f750d4b2so58464871cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778715105; x=1779319905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iGLCDZv1hdB2MgIaz/XQKoXR1JnQneRt9RRBxPzdNNA=;
        b=kBtakmVb04omHZzic6iZ9CUS/RwRLRZLmVd7R6cITPfVo0SkmW2YFB1p5O/3/waov/
         rNpqZuSY9d65lrd+4R46huifn+NBTEQmuOuyWXwoQQ6z6S0bbQgxJ8/lBs9DKMlJ+g9n
         R9mJ/l0c5wbpLBFU42ROFf0LSF8hRjV6X2SBGZUJ5Nt/rOKcQ5RDKB2IjbxT8M+eqh+g
         +mANovX/sC94NxNILI5FWdAHVidvsZJ+6wgDUy4ZZ2MZhLZXJKG3Gwy0pmmU0bvYKnCD
         v7gCsjSTgaDZY1dOfnXFL6Ah6jHqIC0pl3sIpn6+orN3FJoqXL/eFnxzmgVfO5NI4Me1
         OPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778715105; x=1779319905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGLCDZv1hdB2MgIaz/XQKoXR1JnQneRt9RRBxPzdNNA=;
        b=msu8R60ICgeVItStK8cMGqnNBY6EvD72J2oyjle+R9c81WS+TPa4DVZfgGiY8Eu02M
         WMLyef6eKufvFOD6GlTZXKkYA0ki0egbywAPRos3iv9uyTF2Wwxyoc4jcSkaK7TnY20O
         r5p5m6OU6MX3wAPEAGs1NyCOwBh6GKEzsFOSGFrWTpCxkrh02zgpP22gqBJleCpyDi+8
         ks6WfTzP+MPEHGbBVHs6T228y/BelNGmzXtladgGKGq8kuC9XNHsErVzEFJfKmZGZujb
         k9cdkD5G7FvVrJUAgrBSVZBAx5W/yTDOswVACZjtdc3z9lHF48+QkIE4wxJTNNff6nNH
         EtYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IX5SbbZ7PN08ZczpePW5G5s/b8ycB/cKF/v0fa5plAWLBr9XxtNExI+aX839ig/TheeNXyoPlXKyfJdkjvesm@lists.infradead.org
X-Gm-Message-State: AOJu0YwRiUQQGXZ3lf0UA+RbNdQJKkA/dC9fbvtA1ruInpEwI1i2AzEm
	ybvLKpLAQ/LmymTJnTWsrHHSDrt1U2K11gq2pgokFZEgjuyaX/3zVuFV
X-Gm-Gg: Acq92OHjhFnBVsQKJ8E3jAlRiBwDgObVaXvh7Y+iB79sSmC3rhWdLmqF72CQqzfp85M
	NWKdAnFLVgkXVt5VgZPKlEXscdLvqoZyXEdEB+IRprrqGZ2eSHyAF3Yjd51KU4okxL8xoslArZc
	/YJDu5Xtsm1bK/FGkIIUCJKoisAy1J2RVOxyLilZnDpk9g/RsDkeiMYM1POmGbLJ2gddRa9SjCY
	o42bGkY4GEAXKmT4kVQ3f0pjeHnv8P7yDo/MGjVCiF1iOttcBmDsOhBv8t9vQZ23N1PkyWTqQ94
	uE5If/QCm3OJCykBNl+7WQzGsry+M2HfhEL8y4B4MdbdpLLS+e4ZV+7eSKzkQlLMd0AkreiwVsf
	O+MwHZm4Jf0/+FBJ6Y9JolhT8HTARwMyR4bUSYhlZLoJTJm0YkjCSuKWYve66Dgnuac+HMQEDTY
	a5NU0B9IZ+JEJJIJ9UgKG3fWAFq6Dboew106I240m2
X-Received: by 2002:a05:622a:1648:b0:50e:6183:beea with SMTP id d75a77b69052e-5162f4c3999mr78168821cf.23.1778715104578;
        Wed, 13 May 2026 16:31:44 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bd620fbcsm94689185a.42.2026.05.13.16.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 16:31:44 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] irqchip/atmel-aic5: Free SMR cache on init failure
Date: Wed, 13 May 2026 19:31:39 -0400
Message-ID: <20260513233139.659956-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_163145_971251_AEBA9836 
X-CRM114-Status: GOOD (  13.16  )
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

sama5d2_aic5_of_init() allocates the SMR cache before calling
aic5_of_init(). If that fails, the cache is left allocated even though
no IRQ domain was installed and the cache will not be used.

Free the cache on the failure path and clear the global pointer.

Fixes: a50ac562ef48 ("irqchip/atmel-aic5: Handle suspend to RAM")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/irqchip/irq-atmel-aic5.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
index 1f14b401f71d..58650eb16880 100644
--- a/drivers/irqchip/irq-atmel-aic5.c
+++ b/drivers/irqchip/irq-atmel-aic5.c
@@ -358,13 +358,22 @@ static int __init sama5d2_aic5_of_init(struct device_node *node,
 				       struct device_node *parent)
 {
 #ifdef CONFIG_PM
+	int rc = 0;
 	smr_cache = kcalloc(DIV_ROUND_UP(NR_SAMA5D2_IRQS, 32) * 32,
 			    sizeof(*smr_cache), GFP_KERNEL);
 	if (!smr_cache)
 		return -ENOMEM;
-#endif
 
+	rc = aic5_of_init(node, parent, NR_SAMA5D2_IRQS);
+	if (rc) {
+		kfree(smr_cache);
+		smr_cache = NULL;
+	}
+
+	return rc;
+#else
 	return aic5_of_init(node, parent, NR_SAMA5D2_IRQS);
+#endif
 }
 IRQCHIP_DECLARE(sama5d2_aic5, "atmel,sama5d2-aic", sama5d2_aic5_of_init);
 
-- 
2.43.0


