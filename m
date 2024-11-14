Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507E9D65C6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 10:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olVph3cQeOWUn5eJcsuo5CyNUNQwKw8vhf+nxFUdb9U=; b=JDQ3xOHrbbFBp6RKO26TAjkZsT
	7TR9laegVW9AH+yE/kS52mE7cBbeHE9PP7dOSorbLHuRay0OvILL/Ksajy11i8YzRgXy0yZ1fsv78
	QMgovqOd+zIwWFOymham4QTvo9PzOnzWUVzCghBs6weAx/w6szAyW4WlvidHLZjPFALjtMVmJhl9P
	Dx7Omj732o6r5nJUDKXA3TcOofqB1hKIjsvb1kyAvo6/q9putqwpvcIuoUVN7QzwqOGza5ltFgHOh
	qM2BrqR61cSQ/UlRS9oqZy7MJzOhcStESVqo239lgOj4sgKHpR9JtKMGlruCwPBYFPdxbSVPTOmes
	nR88YVXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXLD-00000009alW-3NSW;
	Thu, 14 Nov 2024 10:44:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBWlx-00000009TCj-2VOm;
	Thu, 14 Nov 2024 10:08:29 +0000
X-UUID: 5b2f923ea27011ef82ff63e91e7eb18c-20241114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=olVph3cQeOWUn5eJcsuo5CyNUNQwKw8vhf+nxFUdb9U=;
	b=hNYMMSml3TVdCv1deOp8ZeB1Klm1wT2IPaSOPOlnQgRpazooVDJwlz37WvOi1m7T2aMf4a8+j44paU2tsEWgdVSHUZjMP1e3Dn1jMN//UPUiyH1paljRoEto8HRINdT47pTnk1YHQI6tCJ0kl9YwrJu/YeP7yAX3wwgh7TxGQh4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:aa7b7f0f-df32-4ee7-bc28-b24bf2223425,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:1f5f0c4f-a2ae-4b53-acd4-c3dc8f449198,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5b2f923ea27011ef82ff63e91e7eb18c-20241114
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1537796115; Thu, 14 Nov 2024 03:08:12 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 14 Nov 2024 18:08:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 14 Nov 2024 18:08:07 +0800
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
Subject: [PATCH v13 24/25] virt: geniezone: Emulate IPI for guest VM
Date: Thu, 14 Nov 2024 18:08:01 +0800
Message-ID: <20241114100802.4116-25-liju-clr.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
References: <20241114100802.4116-1-liju-clr.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_020821_857326_32313319 
X-CRM114-Status: GOOD (  12.79  )
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

From: Kevenny Hsieh <kevenny.hsieh@mediatek.com>

Emulate Inter-Processor Interrupts (IPI) handling for guest VMs.
Ensure that when a vCPU thread enters an idle state and relinquishes
CPU control to the host, it can be woken up by IPIs issued by other
vCPUs through the gzvm driver.

Add a new wake-up mechanism, `GZVM_EXIT_IPI`, to handle IPIs. Ensure
that idle vCPUs can be woken up not only by virtual timer (vtimer) and
virtio interrupts but also by IPIs issued by other vCPUs.

Ensure proper handling of IPIs, allowing idle vCPUs to be woken up and
respond to interrupts, thereby maintaining correct and efficient
inter-processor communication within the guest VM.

Signed-off-by: Kevenny Hsieh <kevenny.hsieh@mediatek.com>
Signed-off-by: Liju Chen <liju-clr.chen@mediatek.com>
---
 drivers/virt/geniezone/gzvm_exception.c | 5 +++++
 drivers/virt/geniezone/gzvm_vcpu.c      | 3 +++
 include/linux/soc/mediatek/gzvm_drv.h   | 1 +
 include/uapi/linux/gzvm.h               | 1 +
 4 files changed, 10 insertions(+)

diff --git a/drivers/virt/geniezone/gzvm_exception.c b/drivers/virt/geniezone/gzvm_exception.c
index 391168a3f737..7a4e3d76aa7a 100644
--- a/drivers/virt/geniezone/gzvm_exception.c
+++ b/drivers/virt/geniezone/gzvm_exception.c
@@ -105,3 +105,8 @@ int gzvm_handle_guest_idle(struct gzvm_vcpu *vcpu)
 
 	return ret;
 }
+
+void gzvm_handle_guest_ipi(struct gzvm_vcpu *vcpu)
+{
+	gzvm_vcpu_wakeup_all(vcpu->gzvm);
+}
diff --git a/drivers/virt/geniezone/gzvm_vcpu.c b/drivers/virt/geniezone/gzvm_vcpu.c
index 247848ee126c..5cdd6ccbe76d 100644
--- a/drivers/virt/geniezone/gzvm_vcpu.c
+++ b/drivers/virt/geniezone/gzvm_vcpu.c
@@ -184,6 +184,9 @@ static long gzvm_vcpu_run(struct gzvm_vcpu *vcpu, void __user *argp)
 		case GZVM_EXIT_IDLE:
 			gzvm_handle_guest_idle(vcpu);
 			break;
+		case GZVM_EXIT_IPI:
+			gzvm_handle_guest_ipi(vcpu);
+			break;
 		case GZVM_EXIT_UNKNOWN:
 			fallthrough;
 		default:
diff --git a/include/linux/soc/mediatek/gzvm_drv.h b/include/linux/soc/mediatek/gzvm_drv.h
index 54fa7aea7245..8fc6c6f54227 100644
--- a/include/linux/soc/mediatek/gzvm_drv.h
+++ b/include/linux/soc/mediatek/gzvm_drv.h
@@ -266,6 +266,7 @@ int gzvm_handle_relinquish(struct gzvm_vcpu *vcpu, phys_addr_t ipa);
 bool gzvm_handle_guest_hvc(struct gzvm_vcpu *vcpu);
 bool gzvm_arch_handle_guest_hvc(struct gzvm_vcpu *vcpu);
 int gzvm_handle_guest_idle(struct gzvm_vcpu *vcpu);
+void gzvm_handle_guest_ipi(struct gzvm_vcpu *vcpu);
 void gzvm_vcpu_wakeup_all(struct gzvm *gzvm);
 
 int gzvm_arch_create_device(u16 vm_id, struct gzvm_create_device *gzvm_dev);
diff --git a/include/uapi/linux/gzvm.h b/include/uapi/linux/gzvm.h
index 61ce53cd9448..d69e1abb21a0 100644
--- a/include/uapi/linux/gzvm.h
+++ b/include/uapi/linux/gzvm.h
@@ -190,6 +190,7 @@ enum {
 	GZVM_EXIT_SHUTDOWN = 0x92920009,
 	GZVM_EXIT_GZ = 0x9292000a,
 	GZVM_EXIT_IDLE = 0x9292000b,
+	GZVM_EXIT_IPI = 0x9292000d,
 };
 
 /* exception definitions of GZVM_EXIT_EXCEPTION */
-- 
2.18.0


