Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A863AFF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 07:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdPUSNZa1GQSmPLR1t+9TeqsXDsmmJUoT9yPrzoYHzg=; b=kPvtlHaIGEkYJ1jMEEki9/n13V
	6a3VvnLeOko3rJOZDdZ6i9Dosq5sO8Nmc//VkdR8bcT0LNhccOafdo6oTXqrlCGBThqtBTJkL2b9u
	THbEFdxuE+9GdSg8bzL7r8OAHVPgtcldLjytk6mS2vt+p1ms+89YLUoL1A9K57DeiE2yULckR1onj
	FL/VJVbSTpl27X4y38MjdpyVpit/OarZKEdtFg95io4xDzx0LCSzLicoBiK3F5+CV0dNE6cF5bvng
	XcrqJf5SZf7xYFqogRqrWiYWebROQYO+C0rRPx5XxQym08NgGzChr3wLT4pidsGUvr/ibPe2B3xuu
	4wWdOZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWzg-0000000E8pv-2Yz6;
	Sat, 25 Apr 2026 07:00:00 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWzc-0000000E8mJ-1cg1;
	Sat, 25 Apr 2026 06:59:57 +0000
X-UUID: 5976835a407411f1aa26b74ffac11d73-20260425
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b382d7f5-7ed2-4757-b49b-748a729d1c86,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:feb819b6dc55270ad3a2f05111c21055,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|898,TC:nil,Content:0|15|50,EDM
	:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5976835a407411f1aa26b74ffac11d73-20260425
X-User: aichao@kylinos.cn
Received: from thinksys.. [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1340601746; Sat, 25 Apr 2026 14:59:48 +0800
From: Ai Chao <aichao@kylinos.cn>
To: deller@gmx.de,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk,
	dilinger@queued.net,
	adaplas@gmail.com,
	James.Bottomley@HansenPartnership.com,
	FlorianSchandinat@gmx.de,
	alchark@gmail.com,
	krzk@kernel.org,
	kees@kernel.org,
	rene@exactco.de,
	tzimmermann@suse.de,
	rongqianfeng@vivo.com,
	thorsten.blum@linux.dev,
	chelsyratnawat2001@gmail.com,
	soci@c64.rulez.org,
	gregkh@linuxfoundation.org,
	daniel@thingy.jp,
	linmq006@gmail.com,
	fourier.thomas@gmail.com
Cc: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-geode@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH 03/35] fbdev: sisfb: Use safer strscpy() instead of strcpy()
Date: Sat, 25 Apr 2026 14:58:54 +0800
Message-Id: <20260425065926.1091168-4-aichao@kylinos.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260425065926.1091168-1-aichao@kylinos.cn>
References: <20260425065926.1091168-1-aichao@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_235956_797888_073CE10A 
X-CRM114-Status: UNSURE (   8.46  )
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

Use a safer function strscpy() instead of strcpy() for copying to arrays.

Only idiomatic code replacement, and no functional changes.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 drivers/video/fbdev/sis/sis_main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/sis/sis_main.c
index 84567d67f71d..e87fa261f76c 100644
--- a/drivers/video/fbdev/sis/sis_main.c
+++ b/drivers/video/fbdev/sis/sis_main.c
@@ -205,7 +205,7 @@ static void sisfb_search_mode(char *name, bool quiet)
 	}
 
 	if(strlen(name) <= 19) {
-		strcpy(strbuf1, name);
+		strscpy(strbuf1, name);
 		for(i = 0; i < strlen(strbuf1); i++) {
 			if(strbuf1[i] < '0' || strbuf1[i] > '9') strbuf1[i] = ' ';
 		}
@@ -5947,33 +5947,33 @@ static int sisfb_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 #ifdef CONFIG_FB_SIS_300
 		case PCI_DEVICE_ID_SI_730:
 			ivideo->chip = SIS_730;
-			strcpy(ivideo->myid, "SiS 730");
+			strscpy(ivideo->myid, "SiS 730");
 			break;
 #endif
 #ifdef CONFIG_FB_SIS_315
 		case PCI_DEVICE_ID_SI_651:
 			/* ivideo->chip is ok */
-			strcpy(ivideo->myid, "SiS 651");
+			strscpy(ivideo->myid, "SiS 651");
 			break;
 		case PCI_DEVICE_ID_SI_740:
 			ivideo->chip = SIS_740;
-			strcpy(ivideo->myid, "SiS 740");
+			strscpy(ivideo->myid, "SiS 740");
 			break;
 		case PCI_DEVICE_ID_SI_661:
 			ivideo->chip = SIS_661;
-			strcpy(ivideo->myid, "SiS 661");
+			strscpy(ivideo->myid, "SiS 661");
 			break;
 		case PCI_DEVICE_ID_SI_741:
 			ivideo->chip = SIS_741;
-			strcpy(ivideo->myid, "SiS 741");
+			strscpy(ivideo->myid, "SiS 741");
 			break;
 		case PCI_DEVICE_ID_SI_760:
 			ivideo->chip = SIS_760;
-			strcpy(ivideo->myid, "SiS 760");
+			strscpy(ivideo->myid, "SiS 760");
 			break;
 		case PCI_DEVICE_ID_SI_761:
 			ivideo->chip = SIS_761;
-			strcpy(ivideo->myid, "SiS 761");
+			strscpy(ivideo->myid, "SiS 761");
 			break;
 #endif
 		default:
-- 
2.34.1


