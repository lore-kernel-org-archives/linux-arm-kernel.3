Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADBEC4450B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PmTVIz1mGBUp/pqE1gE1VL/kInhOIxWxCgAeb1nblhs=; b=m3Z4KuxeDIKW9GXHRmM4YhyETr
	B8JFzXSbq+lXVSUO1AGs/9t5J9ggLht2mFpsA50jfiYEB048ehUaRci33x4gTFVLGEMfI+JYdKD31
	IToohXzWlVJqv9hk2I6GwNSFQ5ZLzVSLr+F96XuuU4nXtNSKD5AoYLY8FY+/QBl9sJUAhWfDgd+Fr
	KfmvgZBK5BlZC3Hjl4ZHmqI7DSEvj+Hza9bFjXU3erSJ/7tQOajql5hZuxhptCiJeMoVhmPP5Mua/
	DGvlknXDG87CsQXwEomOPO9/rw8YOEwzvyBwG/GfuIiu8DRMHy7aA/ZUDCqvSK8oRykaweRgZHv1U
	DKWVAG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtqr-0000000DzhM-3VO2;
	Wed, 15 Jul 2026 07:16:17 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtql-0000000Dzch-0HPg;
	Wed, 15 Jul 2026 07:16:15 +0000
X-UUID: 0a3b0c14801d11f1aa26b74ffac11d73-20260715
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:8bd619c9-c0ae-440f-b457-a8080b9c57a1,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:81dca6387843a2ed6db1532fab7a2c30,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|865|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0a3b0c14801d11f1aa26b74ffac11d73-20260715
X-User: pengcan@kylinos.cn
Received: from lenovo [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <pengcan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1823525892; Wed, 15 Jul 2026 15:16:03 +0800
From: Can Peng <pengcan@kylinos.cn>
To: daniel.lezcano@kernel.org,
	rafael@kernel.org,
	heiko@sntech.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Can Peng <pengcan@kylinos.cn>
Subject: [PATCH] powercap: dtpm: constify OF match table
Date: Wed, 15 Jul 2026 15:15:59 +0800
Message-ID: <20260715071559.202016-1-pengcan@kylinos.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_001614_596735_584144CF 
X-CRM114-Status: GOOD (  11.20  )
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

dtpm_create_hierarchy() only passes the OF match table to
of_machine_get_match_data(), which already takes a const struct
of_device_id pointer.  The DTPM code does not modify the table.

Make the DTPM API const-correct and mark the Rockchip match table const as
well.  This documents the read-only contract and allows the table to live
in read-only init data.

No functional change.

Signed-off-by: Can Peng <pengcan@kylinos.cn>
---
 drivers/powercap/dtpm.c     | 2 +-
 drivers/soc/rockchip/dtpm.c | 2 +-
 include/linux/dtpm.h        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/powercap/dtpm.c b/drivers/powercap/dtpm.c
index b7a65e543f19..0a503dc38eb9 100644
--- a/drivers/powercap/dtpm.c
+++ b/drivers/powercap/dtpm.c
@@ -546,7 +546,7 @@ static int dtpm_for_each_child(const struct dtpm_node *hierarchy,
  * Return: zero on success, a negative value in case of error. Errors
  * are reported back from the underlying functions.
  */
-int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table)
+int dtpm_create_hierarchy(const struct of_device_id *dtpm_match_table)
 {
 	const struct dtpm_node *hierarchy;
 	int i, ret;
diff --git a/drivers/soc/rockchip/dtpm.c b/drivers/soc/rockchip/dtpm.c
index b36d4f752c30..6f1ad9b24289 100644
--- a/drivers/soc/rockchip/dtpm.c
+++ b/drivers/soc/rockchip/dtpm.c
@@ -41,7 +41,7 @@ static struct dtpm_node __initdata rk3399_hierarchy[] = {
 	[9] = { /* sentinel */ }
 };
 
-static struct of_device_id __initdata rockchip_dtpm_match_table[] = {
+static const struct of_device_id rockchip_dtpm_match_table[] __initconst = {
         { .compatible = "rockchip,rk3399", .data = rk3399_hierarchy },
         {},
 };
diff --git a/include/linux/dtpm.h b/include/linux/dtpm.h
index a4a13514b730..05993a55138e 100644
--- a/include/linux/dtpm.h
+++ b/include/linux/dtpm.h
@@ -67,7 +67,7 @@ void dtpm_unregister(struct dtpm *dtpm);
 
 int dtpm_register(const char *name, struct dtpm *dtpm, struct dtpm *parent);
 
-int dtpm_create_hierarchy(struct of_device_id *dtpm_match_table);
+int dtpm_create_hierarchy(const struct of_device_id *dtpm_match_table);
 
 void dtpm_destroy_hierarchy(void);
 #endif
-- 
2.53.0


