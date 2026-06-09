Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2001CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 00:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tesMMbJg66rsibsRX5rCnW0ZEhu4w3n/5kZdHI2yrMU=; b=hqPA/mevNEONN5XV1+3jPE07kj
	vdiKHiPMO4+iN1uAis96GzPM8yK9kuvaA8qOv2nAvY+LT/3ksmh1K+iWcLdnXkBuqn1eDVe7ZrVdK
	Gg4dGH+CT0U7owiA1pADlP62InWGKAfezZsLiBipGBT8WO1iBTLNySvwXPgit8t2KNXWb9DU0Y5LU
	jgizlVKWpBOHk11JWso6vMVZUHMA4gxKH/icjVAYqRq5AMBTYNixc7ahCszYEVCEtP/VJLFBBxbZ5
	2T/Li+qLA0wljzZjwNF1iOD4QdBmux6tIMIqcHrT+r3GM1+qHd2mIDNOBcbL5HJthMWLQnltlDRhg
	VN1k39PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWkbE-00000004ZG2-20QQ;
	Tue, 09 Jun 2026 00:45:48 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWkb1-00000004ZFI-3BxQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 00:45:47 +0000
X-UUID: 7ce009e2639c11f1aa26b74ffac11d73-20260609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:97fa0a8e-3812-415a-a1ab-3f3d187c49aa,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:96b90a1ac25208bf092af7dcb6fe5b72,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:2,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7ce009e2639c11f1aa26b74ffac11d73-20260609
X-User: lijun01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijun01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 268352082; Tue, 09 Jun 2026 08:45:18 +0800
From: Li Jun <lijun01@kylinos.cn>
To: lijun01@kylinos.cn,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	peng.fan@nxp.com,
	shawnguo@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] firmware: imx: sm-misc: Add NULL check for kmalloc in syslog_show
Date: Tue,  9 Jun 2026 08:45:04 +0800
Message-Id: <20260609004504.3402281-1-lijun01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_174536_266996_BC08A7E5 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

Add a proper NULL check for the kmalloc() return value in syslog_show().
If memory allocation fails, syslog would be NULL and passing it to
misc_syslog() could lead to a NULL pointer dereference.

Signed-off-by: Li Jun <lijun01@kylinos.cn>
---
 drivers/firmware/imx/sm-misc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
index ac9af824c2d4..fb8d7bdb5b08 100644
--- a/drivers/firmware/imx/sm-misc.c
+++ b/drivers/firmware/imx/sm-misc.c
@@ -79,6 +79,9 @@ static int syslog_show(struct seq_file *file, void *priv)
 	u16 size = SZ_4K / 4;
 	int ret;
 
+	if (!syslog)
+		return -ENOMEM;
+
 	if (!ph)
 		return -ENODEV;
 
-- 
2.25.1


