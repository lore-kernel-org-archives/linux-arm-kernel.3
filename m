Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1F3CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 07:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9c11skWlcBrFfxSYse2dgS/l/ws/5SueoJHq0on6oNU=; b=DOwR7YyItVFLYBI7oRwA/P4kAn
	DPAeU6TRQJuZ4ywJ5wvFxQGMK4W9ATCou+I0o6vEJ2fPEidRI09YuEABysZuslIxRSyNtu9q/saou
	ap8eoP+ycjelAGSXPBrxWhL/tZhf8yTMLZKZIIDdGxlsTUs9SxRkQlWpTG0DxcRo9YctACI26h4Kq
	3ysICM949K8iTopQeZ1FIxaq2TZWCKrhgFT6Budo59DZTP/D9RxkBxZPr+bKZ6ycYQh4IIZdztBlB
	g4rtZZifmzpo6Xt1IjzUcPxYS4bAwbg/gOGVU+/JZ9khVqM+dp96EGpuK9z/7gnxhqVyLzj7Jnr/H
	ZUKt0abw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTGF-00000001sT8-0Baq;
	Wed, 22 Oct 2025 07:27:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTG9-00000001sPv-362d;
	Wed, 22 Oct 2025 07:27:51 +0000
X-UUID: 99cf8d90af1811f0a52f393f94899d25-20251022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=9c11skWlcBrFfxSYse2dgS/l/ws/5SueoJHq0on6oNU=;
	b=BhZfxNHawsebvQAm2DVzx4b7RgGDNIt1pg6ndgwXWi4DJ+vsNAbcSgm/8oyhJWQDwAWZY/kkIRVHDPf4ZOcmMtbUbJ2uMMxkbuVeldc/cnEV82MrFByy/dMKajjIHx/zBSnHViRS7rFua8GDUhVGLD7TeTrFYzlJAH/Pm5d4x8U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:4168ad85-4c4c-4772-a6b3-28500a98fff1,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:33b72f84-4124-4606-b51d-d5c9eec0e7b9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 99cf8d90af1811f0a52f393f94899d25-20251022
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <xion.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1901126852; Wed, 22 Oct 2025 00:27:44 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 22 Oct 2025 15:27:40 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Wed, 22 Oct 2025 15:27:40 +0800
From: <xion.wang@mediatek.com>
To: Paul Moore <paul@paul-moore.com>, Stephen Smalley
	<stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <huadian.liu@mediatek.com>, Xion Wang
	<xion.wang@mediatek.com>, <selinux@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 1/1] selinux: export current_sid API for use in other kernel modules
Date: Wed, 22 Oct 2025 15:27:18 +0800
Message-ID: <20251022072729.14820-2-xion.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251022072729.14820-1-xion.wang@mediatek.com>
References: <20251022072729.14820-1-xion.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_002749_803320_8BED2ABC 
X-CRM114-Status: GOOD (  13.26  )
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

From: Xion Wang <xion.wang@mediatek.com>

Convert current_sid from static inline to a global
function and export it with EXPORT_SYMBOL.
This allows other kernel modules to retrieve
the SELinux security ID of the current task.

Signed-off-by: Xion Wang <xion.wang@mediatek.com>
---
 security/selinux/hooks.c          | 11 +++++++++++
 security/selinux/include/objsec.h | 12 ++----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index dfc22da42f30..0c128f323332 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -229,6 +229,17 @@ static inline u32 cred_sid(const struct cred *cred)
 	return tsec->sid;
 }
 
+/*
+ * get the subjective security ID of the current task
+ */
+u32 current_sid(void)
+{
+	const struct task_security_struct *tsec = selinux_cred(current_cred());
+
+	return tsec->sid;
+}
+EXPORT_SYMBOL(current_sid);
+
 static void __ad_net_init(struct common_audit_data *ad,
 			  struct lsm_network_audit *net,
 			  int ifindex, struct sock *sk, u16 family)
diff --git a/security/selinux/include/objsec.h b/security/selinux/include/objsec.h
index 2d5139c6d45b..787a0cd74ff0 100644
--- a/security/selinux/include/objsec.h
+++ b/security/selinux/include/objsec.h
@@ -202,16 +202,6 @@ selinux_ipc(const struct kern_ipc_perm *ipc)
 	return ipc->security + selinux_blob_sizes.lbs_ipc;
 }
 
-/*
- * get the subjective security ID of the current task
- */
-static inline u32 current_sid(void)
-{
-	const struct task_security_struct *tsec = selinux_cred(current_cred());
-
-	return tsec->sid;
-}
-
 static inline struct superblock_security_struct *
 selinux_superblock(const struct super_block *superblock)
 {
@@ -265,4 +255,6 @@ selinux_bpf_token_security(struct bpf_token *token)
 	return token->security + selinux_blob_sizes.lbs_bpf_token;
 }
 #endif /* CONFIG_BPF_SYSCALL */
+
+u32 current_sid(void);
 #endif /* _SELINUX_OBJSEC_H_ */
-- 
2.45.2


