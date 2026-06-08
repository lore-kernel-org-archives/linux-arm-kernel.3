Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 183ACCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KH5rIhKV9wMzqwpa2BRnVpi2Cc3jQSUrPINmrL+VUWk=; b=4MBBMTMFfU9er2lDPprUWFF2+C
	sU6h+OuHyCmVDklZRcm0mKWIhw/UR/c8e/dCPvL7x2KZogbT6BioRMtWVcgY68lB/NDu/6S5wIJEA
	fP9VW0ADAyr8mPvi4F51m/9Q4yD61D1C8Kw9oqWoWkK5XmwTpkyZbksql5Zuw24AQIvHN57GANv5U
	a56nNwDr1xCwe2qMBui+bOhLRgqp2F4LeWnNxlBBPMikMq2CSS8hhCCDihgIauIAlnOHnBqey0qU+
	gvy5pLbQr7MZuW0F9cQ32riZhOz88Y4svdi5gDq+MnojEvzn1irR/MfU/HkKT5qmsPEOVe6pLs2H1
	3DSEQQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbzl-00000003ypM-0G7Z;
	Mon, 08 Jun 2026 15:34:33 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbzi-00000003yog-3ygG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 15:34:32 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8ce9e56f68cso37476036d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 08:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780932870; x=1781537670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KH5rIhKV9wMzqwpa2BRnVpi2Cc3jQSUrPINmrL+VUWk=;
        b=iPk3CYVw9WO0fGV2NQb6pIyjRGWSCQhCVrCkl5Oj9xE6sEaalFfZQ2AGhgGGDyrwB9
         X5ed8ZoPlyDN04+26MgI7fN/tebQtcWly1ZRBkzb4kWq+0fZd6qKOaZDxpMpUmCuGGo/
         gVeQSACgaZ+pm9Qh+AqXx0Jrkd/fEaoeaKUeHoaiuBKmK6+KBU/YNQvM/f3s6vVdq4VV
         HJEhpXRFieN8oBs7HM/yfUMk1bVTagnbHMzs/OuQSshhYL+OxjWNucaxMPF3Lfb0+p2J
         e2oPatSYHaBBqVonAx7O9lrW6bD0+fGiGQZUU7ab18IPUWPHcOGRcNWP0KBSMYFaU7Bp
         GI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932870; x=1781537670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH5rIhKV9wMzqwpa2BRnVpi2Cc3jQSUrPINmrL+VUWk=;
        b=X77dWUOkScox8KVWY2oIVxm3MuzVfaf/M4+ZpAJMQPnId6j9FTRWkg0t2hqQTfJinR
         0fdYdWBylPyxTJDkL6/yaply/7T5DkWjrWxYH+4w0OqI2MR/HTALq4I8MirixYCUFLvv
         R4t//J0i4MkLqpdlB81UnT8dbBHmOnZIUbATWYr/w+x6f3GR0DxTBvgIF0s4aYhrGerW
         DooPYP9RGXihwX2GLxv10iucCwP0AQ3Wd4WOySoYjmL5gnibMUyZHBQoV3VZNBWUcHYh
         BYT3gElo9/BGYewRc5qlk6z4n5IjZAqJKVWE/kRpESbwtrz6blL1j/FSmfKeAxzy9j6P
         M0WA==
X-Gm-Message-State: AOJu0Yxtr2KjgsW5PCZNEtg1pCLTVsuYiDmbkjhsWEc+e7oXElPhCM+m
	RP/H8b0o0zsP9NfH3uL2NneS1wrHsIyvMbzqFZ6Mim+PxKq7WHVnp5+TUXC5ZLfWRRM=
X-Gm-Gg: Acq92OHtHl+TgMK3aKvyBuqyx5KiPftfrJTUFgYRA4Xp+9krlVoE+ECWdyIt1Agl+gy
	/UMpR4FMvAHh5kSDqvVLMjz+nnJ5QF+LNOvWoM4zq8ews4ExtgwP3uhg1J8pAlcMvj0il/tte77
	QbXaV/M5ubIkIp4ZJb7A8Y8JbslT9F4VPa0SdZRSKjQx5oGYdUmUREMNKmNZYpsBWabqWU65klp
	YL4EcpWFXHMtSxeD31FUohIJ+H2oZEnZVhCypfKfrJtPH0wb7LTUe+dyLK38v5qzuG3cOlZMddK
	vaSIIHJK+ROtiO1jnd+5VRnxu/HthYf5M+WaIhQUjB9t9taGLDK9qJ1mkqExlkLZ1RCJYZIRk6Y
	dkqXzvzpM29JmVkyAjRYUhG7I4RAbPRU2ra0Y8xuUbGx8Gq474tMpmuTJp8fAPovekpmht/iBCa
	9cxjajHk/byzBbaxqo252p+pJl3HVwpOVPYmGAHMFNIsosepF7Fuw=
X-Received: by 2002:a0c:f151:0:10b0:8cd:b80e:6157 with SMTP id 6a1803df08f44-8cee5fcb0edmr195871786d6.14.1780932869501;
        Mon, 08 Jun 2026 08:34:29 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdb8dadsm170138786d6.12.2026.06.08.08.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:34:29 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: mstar: Drop OF node references after mapping
Date: Mon,  8 Jun 2026 11:34:21 -0400
Message-ID: <20260608153421.26910-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_083431_023907_A5B04AD4 
X-CRM114-Status: GOOD (  11.52  )
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

of_find_compatible_node() returns a device node with its reference
count incremented. of_iomap() uses the node to map the register range,
but does not consume that reference.

Drop the node references after mapping the smpctrl and l3bridge
registers.

Fixes: 312b62b6610c ("ARM: mstar: Add machine for MStar/Sigmastar Armv7 SoCs")
Fixes: 5919eec0f092 ("ARM: mstar: SMP support")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-mstar/mstarv7.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-mstar/mstarv7.c b/arch/arm/mach-mstar/mstarv7.c
index 274c4f0df270..64262b8f10a0 100644
--- a/arch/arm/mach-mstar/mstarv7.c
+++ b/arch/arm/mach-mstar/mstarv7.c
@@ -86,6 +86,7 @@ static int mstarv7_boot_secondary(unsigned int cpu, struct task_struct *idle)
 
 	np = of_find_compatible_node(NULL, NULL, "mstar,smpctrl");
 	smpctrl = of_iomap(np, 0);
+	of_node_put(np);
 
 	if (!smpctrl)
 		return -ENODEV;
@@ -116,6 +117,7 @@ static void __init mstarv7_init(void)
 
 	np = of_find_compatible_node(NULL, NULL, "mstar,l3bridge");
 	l3bridge = of_iomap(np, 0);
+	of_node_put(np);
 	if (l3bridge)
 		soc_mb = mstarv7_mb;
 	else
-- 
2.43.0


