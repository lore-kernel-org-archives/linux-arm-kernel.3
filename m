Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF34CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 04:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+Gj9i6XXhBeEkETP8dtrWAdE9uX+Fdm6RoGUY88HMo=; b=pg90OXZBv5io/h6HeuK7xDgNx/
	fkohlCx++Wuj5aFzkx60R/5E3Wmcfer5QCg9zyP0qvYAyjlMqeUWYz4ii5YlTrfIONScEYT4b+B52
	PCItohXx0+21ZFGnh96Mg7CV3qLflRosFP9TQoaxowp7ExtpqPJcqqmpKdHexKHbDDX421wpkmZdu
	YRRbPvAL1EK+qJT7jQk7mKhUEYQ/9BVsoSNShySE2xnJnrvSUGNbqI496BoJKI9o9FgnpnvtmPq6Q
	zSwlLqC+HT4ZXrfJsEETgviLHs0QmGjh4XnvJNufjxp98WKFF49LtiCuP8cTtXdJ5eDzwo3B3oEoi
	ZcmBRl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXAM2-00000006m8h-1ZOD;
	Wed, 10 Jun 2026 04:15:50 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXALz-00000006m8K-2ygm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 04:15:49 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-36bcbd7821fso2749321a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 21:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781064946; x=1781669746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6+Gj9i6XXhBeEkETP8dtrWAdE9uX+Fdm6RoGUY88HMo=;
        b=Ob8QsVYx/G1eKsWMaLMrQX4wpvaMDXU9Qq63Kqjp94bkao/1jDT0kwJF+kGTJkJ5AC
         AJELAQ9iG3AisWmgWpWIGz98JNnXD30ncvAwGqqN7gRrnBaqOnkt6YUOJpq/OYexTM4j
         Z8OZYevvLV1XW+5r5OxDVrj/JPY2bOHWat/tlTk3SNBwcuBv1SvIUJ6fDwq5qs18Y2rD
         oUtZfkGvVA1bqC11psuT9z3KqspTCgqt7dxGOlwWeXO1I6NbUejxFxADXg3C+nf7mwdR
         sJpw5B0w+VztdqhOfDk29AqwdAWonf+DgQoqL/ywfIRyCaLu/Rwl6m314MNbE2YSQz1e
         JcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781064946; x=1781669746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+Gj9i6XXhBeEkETP8dtrWAdE9uX+Fdm6RoGUY88HMo=;
        b=gWsp8utaF5TM7E9vys9I/jRCh+kuewnlIRBWyj45yTSA6FXXdluWiGXFAheL+KAgUl
         N79+cGjsjotX7IzUTCRuwnQkBQLBK6cL31jyph9J2UvQQnIeEq4j+9wF6QTTHHaJKApo
         W9DFq8GCvJZmffLS7sMga/vW4DYdY7mpJyLP0VFZ22CgNfOnV8g8Cm/UDxf1t77rlmVy
         4x2yW8EC9LYbGWZ7ol6XdmvdczjgqtwiFXEhBiMDXi6tBPAJ0JmUmlKcIx/TNDYEJaXv
         ZnAn1HYEXEe2zcbwJjD99kVJsJZgJpOwgo2njpQxAdwoSJySRYqvo+gtGNiDj3pLWene
         agIg==
X-Forwarded-Encrypted: i=1; AFNElJ9d8KjBwFD3GFEmXgr0AzvzMCm5qK/lZTFaZeQ423zcZccWa93i0IuBO2JFm33ehP2iE30nj1eDTGtWahk11lDp@lists.infradead.org
X-Gm-Message-State: AOJu0YzSym4zRnaIF2CmP9qmHJDwY57IEwlvLbKqPGSNKNAAc/I625eo
	VoU+Km2pquXA7RgdbEnyyfJTMjg84ETKACGF2jjD2Vzc7sIxUb8/pH7l
X-Gm-Gg: Acq92OGSTGPwGPBoUkVuyKi+MA4W1YA3d65Dq48ta7Q0e/bDbtVD9rPSa7zHck8IfxY
	zP6ea3GAhp2xpkAipZJ14SBxF/sBg8I0YOjPrYzWCl1gmS9eHcdv7M6pmoAKF4ZbdrFRFf508l+
	JzsH3eTGUM5PZdR+CHbN73XsBceDg0StrtXUqnMJL2JNJHEMA10foCKkolf9l1UVeBeh4vvhLTc
	A+1hqKWnA2/0+ZPAjB5M+S3+8z8RkBvG/247iaPtwDx7dseiNCQoO0ODChnDBH+rSV1N8KGbaUo
	Mj9M5ZRIQQwIQnDwdr9DX6o1ZVCU0Gwn/tmY5G+37vAkb/bp2qxQ/FMAA1Jnc8ESJ3NngmrAFan
	pABTIKR2eNM90CetPHNcqRocU6YpRkMf0JE6+Mi8EyTrxsfevVVxCdaCvB+2k56vk6CyqqLPxJl
	aSljY4efzoCmTjYy0lNmoaxMq4Z4ybrxJfwr94Yp0ZyaBNC8v42CBOlttpGf2vmjTI37GfdMqPK
	QjMOMctqNUvrh1HemB0tnwkOM6J71o4n5TV38h1wg6n4861ZeViUw==
X-Received: by 2002:a17:90b:4b0f:b0:368:78da:803 with SMTP id 98e67ed59e1d1-370ef0f15c3mr26348541a91.12.1781064946336;
        Tue, 09 Jun 2026 21:15:46 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-376465ca306sm591038a91.2.2026.06.09.21.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 21:15:45 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH] soc: dove: pmu: fix device_node refcount leaks in dove_init_pmu()
Date: Wed, 10 Jun 2026 14:15:36 +1000
Message-ID: <20260610041536.2164285-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_211547_785796_CF725D85 
X-CRM114-Status: GOOD (  16.58  )
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

dove_init_pmu() acquires two device_node references that are leaked on
several exit paths:

  - np_pmu, from of_find_compatible_node(): leaked on the !domains_node
    early return and on the !pmu allocation-failure return, both of which
    occur before the reference is handed to pmu->of_node. On the iomap
    failure path it has already been stored in pmu->of_node, so it must
    be released via that field before pmu is freed.

  - domains_node, from of_get_child_by_name(): used only as the iterator
    base of for_each_available_child_of_node(), which never drops the
    parent reference. It is leaked on the allocation-failure return, the
    iomap-failure return and, most commonly, on the normal success path.

The success path keeps np_pmu alive deliberately: it is stored in
pmu->of_node and the pmu structure persists for the lifetime of the
system, so np_pmu is not put there.

Release np_pmu on the two early error returns and via pmu->of_node on the
iomap-failure return, and release domains_node on every path once it is
no longer needed.

Found by static analysis tool CodeQL.

Fixes: 44e259ac909f ("ARM: dove: create a proper PMU driver for power domains, PMU IRQs and resets")
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/soc/dove/pmu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/dove/pmu.c b/drivers/soc/dove/pmu.c
index 7bbd3f940e4d9..d8819ad50db5f 100644
--- a/drivers/soc/dove/pmu.c
+++ b/drivers/soc/dove/pmu.c
@@ -383,12 +383,16 @@ int __init dove_init_pmu(void)
 	domains_node = of_get_child_by_name(np_pmu, "domains");
 	if (!domains_node) {
 		pr_err("%pOFn: failed to find domains sub-node\n", np_pmu);
+		of_node_put(np_pmu);
 		return 0;
 	}
 
 	pmu = kzalloc(sizeof(*pmu), GFP_KERNEL);
-	if (!pmu)
+	if (!pmu) {
+		of_node_put(np_pmu);
+		of_node_put(domains_node);
 		return -ENOMEM;
+	}
 
 	spin_lock_init(&pmu->lock);
 	pmu->of_node = np_pmu;
@@ -398,7 +402,9 @@ int __init dove_init_pmu(void)
 		pr_err("%pOFn: failed to map PMU\n", np_pmu);
 		iounmap(pmu->pmu_base);
 		iounmap(pmu->pmc_base);
+		of_node_put(pmu->of_node);
 		kfree(pmu);
+		of_node_put(domains_node);
 		return -ENOMEM;
 	}
 
@@ -443,6 +449,8 @@ int __init dove_init_pmu(void)
 		__pmu_domain_register(domain, np);
 	}
 
+	of_node_put(domains_node);
+
 	/* Loss of the interrupt controller is not a fatal error. */
 	parent_irq = irq_of_parse_and_map(pmu->of_node, 0);
 	if (!parent_irq) {

base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
-- 
2.43.0


