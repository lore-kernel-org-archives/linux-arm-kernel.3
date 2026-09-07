Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353BEC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 01:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OzgRAz+t0pvu1F0bGXuWPazB1YZpsW2di9FQ9hUcZ7o=; b=kFt0M1MabQgEluj2BieRDmmtaQ
	dBq9S9D/JxsoOMLMXNRY0Ej0MbeS74Yrp9yYMGa9S3HoOjxtDSllguUfXUNlf5JXG3ufT2t4DOb3W
	XcLtii4WLRBxeReE0cb7Q9ZSJLzt8CkB/GyqaE8HKB06hxqNQiaFo4Ea2eB5ESDb2ROCxcj/JnIqi
	qHNRN4/8NYW88w6eMTV39ZfZcTyb3a7uRwiISfFlzgBjuH8kYMu17Mq/iTuu/6FDMotMjGMJKQUC3
	Dx7i/BMA1vSbSLL7IT6a8LfZM1rRyIlinDov4Kfdw/2oS6bfPvrUzuqpvsvjabx9Xy9s0By4r9i32
	4DdqdUKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3O6B-00000005ff3-2ZcX;
	Mon, 07 Sep 2026 01:24:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3O69-00000005fed-1GbL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 01:24:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-484374f54d0so1679581f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 18:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788744275; x=1789349075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OzgRAz+t0pvu1F0bGXuWPazB1YZpsW2di9FQ9hUcZ7o=;
        b=K0S9Kxa2cMGSCg6AVQON8nduuDoWPowId21bUnkCQ6wGm2rjtvbNYN2soGcAgfgkTf
         b2HjluZsiYhb5cm03qRoTs3nDJo3JQZxNf3Vjg1Q3Zz3kOY2HsiAYv9rbt6ahc5L1ZEo
         jhN2lLBS4YvpyV4vEl30ekszXV6H0FSfPAMJtJb+nTbKyHONdEL6zlxRV1Sf1H1fVlDf
         Vep7HlgoIC98VqDJrIuC9qs2WOrr/YelUL6getWyGngXpRotaSmme4YUjuvDNEv1Xyze
         qxTf4zB2/qrPAGA8Z6Wyw05RmsyWRXaZYLAXIrz4VJSK4iPPEmZSW3uhT7jISJe8KzYG
         4OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788744275; x=1789349075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OzgRAz+t0pvu1F0bGXuWPazB1YZpsW2di9FQ9hUcZ7o=;
        b=BWrnfXOo1TERIF4VyxeCpbrEElGix8eDt40Ie3B+pjul+vnHcrcCoDyEpOySG4jN4r
         7A6ybHahxuqVLwQu+Znx/0PkUhd83KckXqeRN4bpcNmpzicOn5AwlHN6W5Hl/lj6z86I
         UUdCP+J1jMPwR8Gh3WYP6bYGkbiVZ1/Rt0xYrvke8Pbn2JaRbbeZmH36QmAQZa/+/PFB
         ZdGSP6Us92nbzOyT+l6U4RcOkWmiu/QPH6x9o507VWq/E+TOfw5OJj50hBA+d6alSQRB
         NJ7skwUEgzADRLOATwNIDIHhaw4NJ3d3MHRXxsk9BPfc4EJfb3suhtOT2jbUqsniQ7Nz
         JygA==
X-Forwarded-Encrypted: i=1; AKwUvBx99quCgDaKapWLx0ASzooHhexsBfVoGD7YsITKUGfx/ossac57difvxoo/NZG5/5oHRih5vmBX+6H6Uj0aOLUs@lists.infradead.org
X-Gm-Message-State: AFuF++m9Ju/Ei1WZWPEqN/X8i2a7mBcE1kRgPnyrnoLAZx4ZwhLNJhxB
	YmJwGh8jPgVwTnLKslSDVrfHjUWiak0jCPa9sNMCnuQdern42QsG5ehr
X-Gm-Gg: AYBFou0woMjYSNYF25zV7cLtoz6SVP+AlNonSVpwuaIq+NTDJe3+JlVQWrNQwUismjq
	KLtK11am+edKfxb90Dk4+JsPGsrdrO/Y/PRYkwD6Ffrx90Z0ykNI7RntWGdtk5LbqHa8iS2klKe
	grVeoxlKRHN5CcXTwIDfwwH4X55lWdFSknDd03ZI51eXkTGlTcv4IGKUFKG0K6avjbcAT/Uklii
	cKOqP/lYbTJZzRgv5FRMT8ZnlMhi3w5hTsnhsNEgDZuV9Gd//zXSMKTAfwRY6gZdMz1f4xKZqwf
	jS3rzJfVOo7/T7v8a1ATEv4V0vlruUIo/8BWq7LAXXj2KV2DogVgE8Ee1z3a1X8qPLv8dqlmzBh
	GJTfOy4tbZJtAQBVRoO7lQg8Ii2khXfW1d6JkO0wndQw7XSk0Qm5y71Jt2hhv3AsDt7nLe+UL63
	hhwzXPGq7m/22uZBaniWJHFwR0whAhcgJANShotHb7kMNKOXfUgpWbVGSq4Ldrc+ul4n5b9pMMl
	hb5LdwPECv8R7PDoKXpG0Srp2VcP711QZSPXawVcamZjAtdhxraUsKD2ZlRaW+ZVBRLwVDWFHil
	a1BFSrUdnuu5N67gsbZkOS3OaQMDCmDI2sjffqNkqpdwC9Jk2+bwzUW0bEtjHXW+rrc=
X-Received: by 2002:a05:6000:468a:b0:484:3310:710e with SMTP id ffacd0b85a97d-48587291a2cmr31033495f8f.26.1788744275141;
        Sun, 06 Sep 2026 18:24:35 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d84-5101-9c80-d25b-14b6-410c.310.pool.telefonica.de. [2a02:3100:9d84:5101:9c80:d25b:14b6:410c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm25538034f8f.21.2026.09.06.18.24.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 18:24:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	xen-devel@lists.xenproject.org,
	linux-arm-kernel@lists.infradead.org,
	Tejas Mutalikdesai <tejasmutalikdesai@gmail.com>
Subject: [PATCH] arm/xen: Point the comment at the YAML binding
Date: Mon,  7 Sep 2026 03:24:30 +0200
Message-Id: <20260907012430.21823-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_182437_369422_1DE36431 
X-CRM114-Status: GOOD (  12.28  )
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

The binding was converted by commit 4dbfe5467485 ("dt-bindings: arm:
xen: Convert to DT schema"), so Documentation/devicetree/bindings/arm/
xen.txt no longer exists.

Point the comment at the YAML schema.

Fixes: 4dbfe5467485 ("dt-bindings: arm: xen: Convert to DT schema")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/xen/enlighten.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 25a0ce3b4584..0b7b7e3417e3 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -251,7 +251,7 @@ static int __init fdt_find_hyper_node(unsigned long node, const char *uname,
 }
 
 /*
- * see Documentation/devicetree/bindings/arm/xen.txt for the
+ * see Documentation/devicetree/bindings/arm/xen.yaml for the
  * documentation of the Xen Device Tree format.
  */
 void __init xen_early_init(void)
-- 
2.53.0


