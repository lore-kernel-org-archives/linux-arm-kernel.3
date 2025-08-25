Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81ACCA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X4DPtLl5IrIynjpjGtlWEHRVfkwFu8gJ5N5pGgPIdqQ=; b=xczqPtyFEVu9R7N8cBlTeixsWa
	vIhQt3CfzTo7VXmhWxrjFfE0EABtz2Nej/FcTzCLZnvOsIePHRspQBcL9aEm4tQWdm1ddVRRQquiK
	KtJh3kqswJnWIKcn+4KM+Cm10WP+lwSjPFnxP0pTkHY/nK/6e6Ks39Bl2418eYLgYZC6v8bt7ja7N
	i3kHCluyxMq2xCYwMOcgoAqIdD/MT8pgnOQLaYooyAS9fjzLS7a1+TRN93hSl017I6GBSeG7RGM+V
	6CCqrcCQAS5YUfp3mpbARlRtkGRdQO+VFq5MZw7d/t43KEmmIg4doO/a0VbfJcS4jU3oO1byyIwQa
	hMQXKwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqT25-00000007QCw-0EwM;
	Mon, 25 Aug 2025 08:58:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSlb-00000007MIj-1aKB;
	Mon, 25 Aug 2025 08:41:28 +0000
X-UUID: 471f9e7a818f11f09f706fa2197c6ceb-20250825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=X4DPtLl5IrIynjpjGtlWEHRVfkwFu8gJ5N5pGgPIdqQ=;
	b=MDXCrUx41MXHgzMvY4CbAR6cCE8c4wDxG9JzlpwBRAQOJAGd5bzdijbW8FvqXRRsf0iQ1lwAt/Vmalrn6AeV52X0iqtVLrbvleBvReVN1MEQjAT4wcZKWQjnmCH2ICygc6rmo/oToocWFMFXbbfpDWFFtQMQbu59QRb3Rnvmk28=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:d6417ea4-c3d0-4506-a26c-952d540961ce,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:d390d644-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 471f9e7a818f11f09f706fa2197c6ceb-20250825
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xion.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1058386385; Mon, 25 Aug 2025 01:41:22 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 25 Aug 2025 16:41:19 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 25 Aug 2025 16:41:18 +0800
From: <xion.wang@mediatek.com>
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <wsd_upstream@mediatek.com>, <huadian.liu@mediatek.com>, Xion Wang
	<xion.wang@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/1] misc: Prevent double registration and deregistration of miscdevice
Date: Mon, 25 Aug 2025 16:45:46 +0800
Message-ID: <20250825084556.10358-1-xion.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_014127_425406_02224DFE 
X-CRM114-Status: GOOD (  11.73  )
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

Dear maintainers,

I am submitting a patch to improve the robustness of the misc device subsystem in the Linux kernel.

In the current implementation, repeated calls to misc_register() or misc_deregister() on the same miscdevice instance may result in corruption of the misc_list or kernel crash due to multiple INIT_LIST_HEAD or list_del operations on the same list node.

This patch introduces additional checks in both misc_register() and misc_deregister() to prevent double registration and double deregistration. By using misc->this_device as a status flag, the driver can safely determine whether the device has already been registered or deregistered, and avoid performing dangerous operations on the misc_list.

With these changes, the misc device subsystem becomes more stable and reliable, reducing the risks of list corruption and improving overall system safety.

Feedback and suggestions are welcome.

Thank you for your time and consideration.

Best regards,
Xion Wang

Xion Wang (1):
  misc: Prevent double registration and deregistration of miscdevice

 drivers/char/misc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
2.45.2


