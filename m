Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7979ECDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 03:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXRbQdsGUO+OaF2qH7v2uVNyKE0DcMPVyC/pru11U+0=; b=Svk2XmJBi5ncQhIiasmFulKOEh
	uZeO4tV8Uey1pQZdeR8nSBiTyH8H0Fp8BxG5aSe8uJ29Ldw/4BnMDadpERTbPfOA/gHok9A8RBsiz
	5Tx75o7rMph2cpBrmOKixK0xqf5J8ug562aLLn8AvyEBdPlF9ihcG5t/OaBdPct90/mekyFP+J1fa
	b5Yec1q0GUFF7+TFQgWvnGmdbsmQVTwZS0gHBLVyY89rF/dFfnG/9yFKmnZLKetUqZcdKGEfN4k69
	51d00glVPAjIu9h72xv7Xk0wO438bRwu+SXd5WYF7Mr0iIDKLQMaESYd1mGTEbk4DbaKjqbgqdNnJ
	sBA/ZbZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxO8-0000000ANvH-0BjO;
	Fri, 26 Jun 2026 03:37:56 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcxO5-0000000ANug-1y5c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 03:37:54 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-91587626a3eso80898985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 20:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782445072; x=1783049872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DXRbQdsGUO+OaF2qH7v2uVNyKE0DcMPVyC/pru11U+0=;
        b=NkfaxIGb5qGzxtpYVgPkYh+GwE8vFrVPsRE7GUfHFT98QT5djvKwwLDiyUd/1bD7pf
         8hIE/lcOEUpPs198S7+KgyYdGHdNrlLT6UyP5I89Y9xua5ZieDxDIJyTbpT1WgXsQUmr
         03+xqY6cADaKWJFWvNX+QC6msyhxlPFsJanJPWCCzDW9ALRyH4Oh2t33eOCG8CyuNyDQ
         hEfPPZKfZ/SMjeldG0I2mwomNErpRY4oskRNZk/e56a5CvKf/Xw0YX3I3ioWE+n74I+G
         6R3iyemY+4sVH5yQRl+qeDnSHljTAd+QO+FSGoHZL/qWH1KzE46S8KnWAKd9fBh91YT7
         zfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782445072; x=1783049872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXRbQdsGUO+OaF2qH7v2uVNyKE0DcMPVyC/pru11U+0=;
        b=oJ4O/Qv2CnL35GLhZFaCds1YqZmNfK04zYKYrv3zc6IbzOzVQwvhGGfr7OzNkT7PxD
         XfNSA1xpVNNXqOeKk73jPsp09dWtGXvcmhyC7MUeM/CwEoVNbuIYrRZpt4GxwNK7p1SN
         /0C2d1M3RyOuuuhrFX+vX52oQgkPLhPmfiOLXlna+9kBUI0ske9IuICJhAz/Qe03n/ek
         UTZMPGiSTFTzFB8NDaU/jDvEaCv+9gXvkQyiIZvP9yQJWrR8YoyIqvKynxgIRqLV047E
         kMWNjiT1bxs4pnv1TOVaQjjpHI6f+VDqb4sVMUafPy7/3GcGY02myu1saLu/WNixdsd1
         WrKQ==
X-Gm-Message-State: AOJu0YxlN5NpiHJtA5N9TNkU/yjYXl/jgXlQV6VjT7u7J5Db8b+SSsfT
	3LpFKi8kWWOr7lkfnQ4I1Yk6/OO6tcC9BnpDeRqxi3IlPDRwszDvX2U+GY+kECKdJdU=
X-Gm-Gg: AfdE7clA47nZLF8lc7L2U/0NiO2GUdhLaveTP9gMMTYNigueKj7SrTK/e2zhtWfsNjn
	eOv31l+u9Hpx2eGnEF0TdSos8lFs8WKeRDlYgWBRDxKm6PxPQ49HFwz8svNvfctvvJoekDK/iM6
	5uRHXdGugaiwmxxaImi4F4NbBi7x+ZsTuDUUPvoJICmD+cMqU1MGzXbgsGZKnfFoRqhz1LiXxz2
	F/8to+tIBbJLYiZnqA7mYDMblxP5hQtkpe4L3DaaoNiPpN15TrButDcJ8uxVZQat2xFXoKymf2N
	5Tcy1RW+/zcpLdZnjMULoMLTCbgBhWIKZ+7TtWs+tbAXQ96BNf7LwPaXu3iaMnFsZGqAkSqmbfC
	L5nmJwIeg3TYXcoQgoQWy+gjVBlyNPWMBrOvAYLhjxuldkwYNmQm1wgRJ7JzOubf5BVTZkJ91Xp
	XN8L1L2yECU8UKwBbjOTIBVpa3Q8k3oSw5u8VR6SCb
X-Received: by 2002:a05:620a:271a:b0:923:3062:9046 with SMTP id af79cd13be357-9293abaeb24mr803214385a.23.1782445071924;
        Thu, 25 Jun 2026 20:37:51 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-925fe040904sm1032082985a.20.2026.06.25.20.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 20:37:51 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v2] irqchip/gic-v3-its: Fix OF node reference leak
Date: Thu, 25 Jun 2026 23:37:47 -0400
Message-ID: <20260626033747.1515585-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_203753_528533_7EAD7152 
X-CRM114-Status: GOOD (  12.65  )
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

of_get_cpu_node() returns a referenced device node. In
its_cpu_init_collection(), the Cavium 23144 workaround only uses the
node to compare the CPU NUMA node, but the reference is never dropped.

Use the device_node cleanup helper for the CPU node reference so it is
released when leaving the workaround block, including the NUMA mismatch
return path.

Fixes: fbf8f40e1658 ("irqchip/gicv3-its: numa: Enable workaround for Cavium thunderx erratum 23144")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
- Use __free(device_node) for the CPU node reference.
- Correct the Fixes tag to fbf8f40e1658.

 drivers/irqchip/irq-gic-v3-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index b57d81ad33a0..63942cf1dbe3 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -3290,9 +3290,9 @@ static void its_cpu_init_collection(struct its_node *its)
 
 	/* avoid cross node collections and its mapping */
 	if (its->flags & ITS_FLAGS_WORKAROUND_CAVIUM_23144) {
-		struct device_node *cpu_node;
+		struct device_node *cpu_node __free(device_node) =
+			of_get_cpu_node(cpu, NULL);
 
-		cpu_node = of_get_cpu_node(cpu, NULL);
 		if (its->numa_node != NUMA_NO_NODE &&
 			its->numa_node != of_node_to_nid(cpu_node))
 			return;
-- 
2.43.0


