Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B76ACA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 02:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RvyuPP6Uu97X9onff2AVK1MWG8HcesunDkoHGFLLHQ=; b=G3T8UtUe4TWPj0buc9FLMhjrw5
	pdm2ySUnU+NLsd6B9Gw4b5mPAzWfWzZS40mjWHDQiBYFH7AiZxUZT8Q2SgOv2zEq6REqOCIOHKofU
	WELnZW5czjXdT5jcfiCX2Gdmhd9Pq1naRpggm3nqvQAZ/iF2ZZj8x8Yd+DSBMH6+s2etq1IjQtVqJ
	ouCzulY64X03FVEhjWxbOEmkGbynPasAUPvMdOTC79pCSrqK/bXfEgUiTYmrKKoVRr18SP5qX0eV0
	4FiCkiVGCcC8YEojx2LAJCyembWjFiO8mwWNIi4Xby0+3qj/LHGqeu1QyEjKwJIIG9yfiPQeci0Gh
	/zVP9Mjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNPc-00000006lxN-1dUW;
	Mon, 25 Aug 2025 02:58:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqNFC-00000006ks6-2G4U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 02:47:41 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4c9FW91nmCz24htJ;
	Mon, 25 Aug 2025 10:44:37 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id E1E95140276;
	Mon, 25 Aug 2025 10:47:31 +0800 (CST)
Received: from kwepemq200004.china.huawei.com (7.202.195.237) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 25 Aug 2025 10:47:31 +0800
Received: from huawei.com (10.90.31.46) by kwepemq200004.china.huawei.com
 (7.202.195.237) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 25 Aug
 2025 10:47:31 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
To: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
CC: <maz@kernel.org>, <oliver.upton@linux.dev>, <tangnianyao@huawei.com>,
	<wangwudi@hisilicon.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>
Subject: [PATCH v2 3/4] Documentation: KVM: arm64: Add GICD_TYPER.num_LPIs writable description
Date: Mon, 25 Aug 2025 10:39:53 +0800
Message-ID: <20250825023954.3516381-4-wangzhou1@hisilicon.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250825023954.3516381-1-wangzhou1@hisilicon.com>
References: <20250825023954.3516381-1-wangzhou1@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200004.china.huawei.com (7.202.195.237)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_194738_761668_B7C70676 
X-CRM114-Status: GOOD (  10.40  )
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

Add GICD_TYPER.num_LPIs writable description.

Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
---
 Documentation/virt/kvm/devices/arm-vgic-v3.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/virt/kvm/devices/arm-vgic-v3.rst b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
index ff02102f7141..f4bd63e10b99 100644
--- a/Documentation/virt/kvm/devices/arm-vgic-v3.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic-v3.rst
@@ -127,6 +127,7 @@ Groups:
 
       * GICD_IIDR.Revision
       * GICD_TYPER2.nASSGIcap
+      * GICD_TYPER.num_LPIs
 
     GICD_IIDR.Revision is updated when the KVM implementation is changed in a
     way directly observable by the guest or userspace.  Userspace should read
@@ -142,6 +143,11 @@ Groups:
     to determine the supported value(s) before writing to the field.
 
 
+    GICD_TYPER.num_LPIs allows userspace to control the maximum value of
+    supported LPIs. At VGIC creation the field resets to 0 which indicates
+    maximum value of supported LPIs is defined by GICD.IDbits.
+
+
     The GICD_STATUSR and GICR_STATUSR registers are architecturally defined such
     that a write of a clear bit has no effect, whereas a write with a set bit
     clears that value.  To allow userspace to freely set the values of these two
-- 
2.33.0


