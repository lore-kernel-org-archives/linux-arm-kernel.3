Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B5FD65C6D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 10:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVCImlwKUuC7utEP6+QkS0VxR9+gKiYUNCGA0LPcTLU=; b=n1gkb1repj1iIr1k1ygIfxrSti
	ejLLxd1VhzMN8+jEhXkgy/sj9OnuhdtYzyVdoFjixZBAile2HoHUeob8+FxgZ2HECGEMKuENH7wdf
	y6uC9oleYciJsdu6/JmVKotF7NFOFUGP7pj4vOly7ckQ4BlYUn3uDt+uj7+VaN6v+6iOJQjJWogjB
	Dv+Nz7LQQh2sAMjRehq1fop4DcIejGKggHitOOCHFmJq82hjK0FYwfkwLOd0OcsOpirP0ykvQUJWv
	DrbtDCh7OODzjPjE+NcYVguaMFdS6M5hrKTQb2BTYQi6rIE9XUSA59U5R9SjXd1ZtmykV+EQILQNj
	uGuC1hgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXFf-00000009ZeP-3sGN;
	Thu, 14 Nov 2024 10:39:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWlt-00000009T6Z-3fSN;
	Thu, 14 Nov 2024 10:08:28 +0000
X-UUID: 58824702a27011ef82ff63e91e7eb18c-20241114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VVCImlwKUuC7utEP6+QkS0VxR9+gKiYUNCGA0LPcTLU=;
	b=LinfFUaXcf3qjb7s+iHvKAqQ9nhS7GSxQE1GFuG7lYTtVixpAUwSXHM8f51R8Qq9kmRwan/LFI8qBS8+c4/IYcJ5r7LkI85lg+DfklgJniZwmO3a8fqcY3cCpZkgkSmAFRX6nPL3xjs/OjyBqvo3wtjWeN15+vUdqGOSw+Ja1LY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:b58036c6-b6e6-47ee-843d-eacd16738c82,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:553fa25c-f18b-4d56-b49c-93279ee09144,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 58824702a27011ef82ff63e91e7eb18c-20241114
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1424429230; Thu, 14 Nov 2024 03:08:07 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Nov 2024 02:08:05 -0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Nov 2024 18:08:05 +0800
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Richard Cochran
	<richardcochran@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liju-clr Chen <Liju-clr.Chen@mediatek.com>, Yingshiuan Pan
	<Yingshiuan.Pan@mediatek.com>, Ze-yu Wang <Ze-yu.Wang@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Shawn Hsiao <shawn.hsiao@mediatek.com>,
	PeiLun Suei <PeiLun.Suei@mediatek.com>, Chi-shen Yeh
	<Chi-shen.Yeh@mediatek.com>, Kevenny Hsieh <Kevenny.Hsieh@mediatek.com>
Subject: [PATCH v13 13/25] virt: geniezone: Add dtb config support
Date: Thu, 14 Nov 2024 18:07:50 +0800
Message-ID: <20241114100802.4116-14-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
References: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_020818_079687_AB2056D8 
X-CRM114-Status: GOOD (  16.04  )
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

From: Jerry Wang <ze-yu.wang@mediatek.com>

Hypervisor might need to know the accurate address and size of dtb
passed from userspace. And then hypervisor would parse the dtb and get
vm information.

Signed-off-by: Jerry Wang <ze-yu.wang@mediatek.com>
Signed-off-by: Yi-De Wu <yi-de.wu@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 arch/arm64/geniezone/gzvm_arch_common.h |  2 ++
 arch/arm64/geniezone/vm.c               |  9 +++++++++
 drivers/virt/geniezone/gzvm_vm.c        | 10 ++++++++++
 include/linux/soc/mediatek/gzvm_drv.h   |  1 +
 include/uapi/linux/gzvm.h               | 14 ++++++++++++++
 5 files changed, 36 insertions(+)

diff --git a/arch/arm64/geniezone/gzvm_arch_common.h b/arch/arm64/geniezone/gzvm_arch_common.h
index dabd11438e94..4366618cdc0a 100644
--- a/arch/arm64/geniezone/gzvm_arch_common.h
+++ b/arch/arm64/geniezone/gzvm_arch_common.h
@@ -23,6 +23,7 @@ enum {
 	GZVM_FUNC_ENABLE_CAP = 13,
 	GZVM_FUNC_INFORM_EXIT = 14,
 	GZVM_FUNC_MEMREGION_PURPOSE = 15,
+	GZVM_FUNC_SET_DTB_CONFIG = 16,
 	NR_GZVM_FUNC,
 };
 
@@ -46,6 +47,7 @@ enum {
 #define MT_HVC_GZVM_ENABLE_CAP		GZVM_HCALL_ID(GZVM_FUNC_ENABLE_CAP)
 #define MT_HVC_GZVM_INFORM_EXIT		GZVM_HCALL_ID(GZVM_FUNC_INFORM_EXIT)
 #define MT_HVC_GZVM_MEMREGION_PURPOSE	GZVM_HCALL_ID(GZVM_FUNC_MEMREGION_PURPOSE)
+#define MT_HVC_GZVM_SET_DTB_CONFIG	GZVM_HCALL_ID(GZVM_FUNC_SET_DTB_CONFIG)
 
 #define GIC_V3_NR_LRS			16
 
diff --git a/arch/arm64/geniezone/vm.c b/arch/arm64/geniezone/vm.c
index fe1caf841de8..44cf1c5bfdb9 100644
--- a/arch/arm64/geniezone/vm.c
+++ b/arch/arm64/geniezone/vm.c
@@ -163,6 +163,15 @@ int gzvm_arch_memregion_purpose(struct gzvm *gzvm,
 				    mem->flags, 0, 0, 0, &res);
 }
 
+int gzvm_arch_set_dtb_config(struct gzvm *gzvm, struct gzvm_dtb_config *cfg)
+{
+	struct arm_smccc_res res;
+
+	return gzvm_hypcall_wrapper(MT_HVC_GZVM_SET_DTB_CONFIG, gzvm->vm_id,
+				    cfg->dtb_addr, cfg->dtb_size, 0, 0, 0, 0,
+				    &res);
+}
+
 static int gzvm_vm_arch_enable_cap(struct gzvm *gzvm,
 				   struct gzvm_enable_cap *cap,
 				   struct arm_smccc_res *res)
diff --git a/drivers/virt/geniezone/gzvm_vm.c b/drivers/virt/geniezone/gzvm_vm.c
index c2e4568d2d3f..5fc0167d2776 100644
--- a/drivers/virt/geniezone/gzvm_vm.c
+++ b/drivers/virt/geniezone/gzvm_vm.c
@@ -281,6 +281,16 @@ static long gzvm_vm_ioctl(struct file *filp, unsigned int ioctl,
 		ret = gzvm_vm_ioctl_enable_cap(gzvm, &cap, argp);
 		break;
 	}
+	case GZVM_SET_DTB_CONFIG: {
+		struct gzvm_dtb_config cfg;
+
+		if (copy_from_user(&cfg, argp, sizeof(cfg))) {
+			ret = -EFAULT;
+			goto out;
+		}
+		ret = gzvm_arch_set_dtb_config(gzvm, &cfg);
+		break;
+	}
 	default:
 		ret = -ENOTTY;
 	}
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 8e98b3145881..835706586e93 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -199,6 +199,7 @@ void gzvm_vm_irqfd_release(struct gzvm *gzvm);
 
 int gzvm_arch_memregion_purpose(struct gzvm *gzvm,
 				struct gzvm_userspace_memory_region *mem);
+int gzvm_arch_set_dtb_config(struct gzvm *gzvm, struct gzvm_dtb_config *args);
 
 int gzvm_init_ioeventfd(struct gzvm *gzvm);
 int gzvm_ioeventfd(struct gzvm *gzvm, struct gzvm_ioeventfd *args);
diff --git a/include/uapi/linux/gzvm.h b/include/uapi/linux/gzvm.h
index 6e102cbfec98..7aec4adf2206 100644
--- a/include/uapi/linux/gzvm.h
+++ b/include/uapi/linux/gzvm.h
@@ -364,4 +364,18 @@ struct gzvm_ioeventfd {
 
 #define GZVM_IOEVENTFD	_IOW(GZVM_IOC_MAGIC, 0x79, struct gzvm_ioeventfd)
 
+/**
+ * struct gzvm_dtb_config: store address and size of dtb passed from userspace
+ *
+ * @dtb_addr: dtb address set by VMM (guset memory)
+ * @dtb_size: dtb size
+ */
+struct gzvm_dtb_config {
+	__u64 dtb_addr;
+	__u64 dtb_size;
+};
+
+#define GZVM_SET_DTB_CONFIG       _IOW(GZVM_IOC_MAGIC, 0xff, \
+				       struct gzvm_dtb_config)
+
 #endif /* __GZVM_H__ */
-- 
2.18.0


