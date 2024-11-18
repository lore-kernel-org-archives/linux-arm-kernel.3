Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56809D4922F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pV7qTF4c6gy8Bebla12zHdT3Rs1r7AjWpLzwiE7t0Ao=; b=SBhkY55A6hsCrMaLbv1Tbd7LO0
	i91UaY+os0lIQC9+2hKz/yXnQ83DM+iKtty5JCHNAp6J9CDGbBs7oKgNcWQ2ZGQGn5VK9A5TKEg2Q
	mzXQiCEpZgzE7kg2vICYzZNUJmnNf2+YO2DmCmpnViGQG86pEmT8kdqdNg+BNr3SEJuYd8HLEcPQT
	6p17C5OhLvoBhjtfqDuqPfPR+F+fEFA3HVxsD5vGo6vH2fwP5lOIUMM+pDJdNmTk3jwIpFPZucgkJ
	oM+LynV1e5HPtH2YsL2mUSuQoFTfOEPrJOSjzWJqygpMJflrrADNj05/i8a4AI1lZbvZX2sBzsRKy
	1ZzmVAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3IP-00000009rMA-0kst;
	Mon, 18 Nov 2024 15:04:09 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD3HS-00000009r9i-1Dev
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 15:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1731942187;
	bh=Y6IKnnnehrgtsOGYcC4soeo5EMiO1x9gQENuPzItkvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qKVE/HsoamW7WBskfH/JsFzqNNnUf/9fRciYOl7BrVHQXChEVo/w4I3wRgSQ5AUAW
	 Vb4vvj5ITSI/+WNv+Q2iQ2YgzjhvabKGVsAscoMYItGIak7OwlNAzTS6UQVDerSbli
	 NC2t654mYZuILJ2S2lxjBfPZgTIirWgI1p6S96sk=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 18 Nov 2024 16:02:49 +0100
Subject: [PATCH 3/3] cpu: Remove spurious NULL in attribute_group
 definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241118-sysfs-const-attribute_group-fixes-v1-3-48e0b0ad8cba@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731942187; l=1161;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Y6IKnnnehrgtsOGYcC4soeo5EMiO1x9gQENuPzItkvw=;
 b=SSps8DBII7qesqAsv+xf0NzLA2Q2RkAGnWvq5dXhTqti/ZR3bY+tTVFcPUvGfpHjOTATQg1/u
 H3o+/TmtbdRCrrDyEimbS9Q1Keupowt8TUyAnhPOvDjwEHLC8qQl6tc
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_070310_484942_1B03F370 
X-CRM114-Status: GOOD (  10.35  )
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
definition. The NULL doesn't have any effect.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 kernel/cpu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index d293d52a3e00e1e8d7c82bdf2f1365bb459f8bb6..f3ee615d2274f161857ef0180454f30b54477cc1 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2866,7 +2866,6 @@ static struct attribute *cpuhp_cpu_attrs[] = {
 static const struct attribute_group cpuhp_cpu_attr_group = {
 	.attrs = cpuhp_cpu_attrs,
 	.name = "hotplug",
-	NULL
 };
 
 static ssize_t states_show(struct device *dev,
@@ -2898,7 +2897,6 @@ static struct attribute *cpuhp_cpu_root_attrs[] = {
 static const struct attribute_group cpuhp_cpu_root_attr_group = {
 	.attrs = cpuhp_cpu_root_attrs,
 	.name = "hotplug",
-	NULL
 };
 
 #ifdef CONFIG_HOTPLUG_SMT
@@ -3020,7 +3018,6 @@ static struct attribute *cpuhp_smt_attrs[] = {
 static const struct attribute_group cpuhp_smt_attr_group = {
 	.attrs = cpuhp_smt_attrs,
 	.name = "smt",
-	NULL
 };
 
 static int __init cpu_smt_sysfs_init(void)

-- 
2.47.0


