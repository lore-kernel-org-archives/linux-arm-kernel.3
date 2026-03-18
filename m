Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479D6FCD0DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d2Scc3VMGSFJkqbMS+pb9UplSoOEn1mN86qKrOTdOXs=; b=4MgVrC9Jw92xq6Vc2Zb89Ycotc
	OxIb3PJrmhEXkUsaYFiPH0G2K9WexkxlBLSUkXqxOpr0PaqNofupfKr7WmaC8MBNh9KLCe6IBLxgO
	QkLh23ByQEXLexuK2/hJl5nUvmmEq1pex1YbEcjOVnMwjKRNamA/7IazwAli8YJP7+5BxEA+p7WWi
	6aDAxUpR0s830ikg+6H2khj6EJ/LOtFAr8h7cObCz+QsUOoxwtFx8VrRV9MQARE2aSOU5egVRgRa+
	oFscApG2wDQKKOpGdNH7PpvgWc52qGNWeXZ2bUc39gi+uIuupVKwxtO1BX4RyGwbianGuOJsn5egY
	oWukGzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2miK-000000085b5-1ssX;
	Wed, 18 Mar 2026 08:57:16 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2miI-000000085Zq-0nWZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:57:15 +0000
X-UUID: 714d146022a811f1a21c59e7364eecb8-20260318
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:c774026d-9a3f-42fa-920d-cc4a7e7c3a9a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:28739ae63570eba5860e610ed7f65c9d,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 714d146022a811f1a21c59e7364eecb8-20260318
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1253271398; Wed, 18 Mar 2026 16:57:07 +0800
From: Li Jun <lijun01@kylinos.cn>
To: andrew@lunn.ch,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lijun01@kylinos.cn
Subject: [PATCH v3] arm: mvebu: fix null pointer when access
Date: Wed, 18 Mar 2026 16:56:49 +0800
Message-Id: <20260318085649.2607230-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_015714_545142_4E800392 
X-CRM114-Status: GOOD (  10.99  )
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

the kzalloc&kstrdup may return null pointer, will cause kernel panic.

-Fix null pointer.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 arch/arm/mach-mvebu/board-v7.c      | 6 ++++++
 arch/arm/mach-mvebu/coherency.c     | 6 ++++++
 arch/arm/mach-mxs/mach-mxs.c        | 4 ++--
 arch/arm/mach-versatile/versatile.c | 6 ++++++
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-mvebu/board-v7.c b/arch/arm/mach-mvebu/board-v7.c
index 04ad651d13a0..25a9853f925e 100644
--- a/arch/arm/mach-mvebu/board-v7.c
+++ b/arch/arm/mach-mvebu/board-v7.c
@@ -128,8 +128,14 @@ static void __init i2c_quirk(void)
 		struct property *new_compat;
 
 		new_compat = kzalloc(sizeof(*new_compat), GFP_KERNEL);
+		if (!new_compat)
+			return -ENOMEM;
 
 		new_compat->name = kstrdup("compatible", GFP_KERNEL);
+		if (!mew_compat->name) {
+			kfree(new_compat);
+			return -ENOMEM;
+		}
 		new_compat->length = sizeof("marvell,mv78230-a0-i2c");
 		new_compat->value = kstrdup("marvell,mv78230-a0-i2c",
 						GFP_KERNEL);
diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index a6b621ff0b87..2c1668f3174c 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -191,7 +191,13 @@ static void __init armada_375_380_coherency_init(struct device_node *np)
 		struct property *p;
 
 		p = kzalloc(sizeof(*p), GFP_KERNEL);
+		if (!p)
+			return -ENOMEM;
 		p->name = kstrdup("arm,io-coherent", GFP_KERNEL);
+		if (!p->name) {
+			kfree(p);
+			return -ENOMEM;
+		}
 		of_add_property(cache_dn, p);
 	}
 }
diff --git a/arch/arm/mach-mxs/mach-mxs.c b/arch/arm/mach-mxs/mach-mxs.c
index 6e017fa306c8..16506d9392b4 100644
--- a/arch/arm/mach-mxs/mach-mxs.c
+++ b/arch/arm/mach-mxs/mach-mxs.c
@@ -178,14 +178,14 @@ static void __init update_fec_mac_prop(enum mac_oui oui)
 
 		newmac = kzalloc(sizeof(*newmac) + 6, GFP_KERNEL);
 		if (!newmac)
-			return;
+			return -ENOMEM;
 		newmac->value = newmac + 1;
 		newmac->length = 6;
 
 		newmac->name = kstrdup("local-mac-address", GFP_KERNEL);
 		if (!newmac->name) {
 			kfree(newmac);
-			return;
+			return -ENOMEM;
 		}
 
 		/*
diff --git a/arch/arm/mach-versatile/versatile.c b/arch/arm/mach-versatile/versatile.c
index f0c80d4663ca..07f2a299c770 100644
--- a/arch/arm/mach-versatile/versatile.c
+++ b/arch/arm/mach-versatile/versatile.c
@@ -147,7 +147,13 @@ static void __init versatile_dt_pci_init(void)
 		goto out_put_node;
 
 	newprop->name = kstrdup("status", GFP_KERNEL);
+	if (!newprop->name)
+		goto out_put_node;
+
 	newprop->value = kstrdup("disabled", GFP_KERNEL);
+	if (!newprop->value)
+		goto out_put_node;
+
 	newprop->length = sizeof("disabled");
 	of_update_property(np, newprop);
 
-- 
2.25.1


