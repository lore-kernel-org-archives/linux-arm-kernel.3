Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D82CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jDd8jJ35868JbrLywcT7hNycuJ3ed0FdA+yekPeeQsY=; b=p3+Qowp2Wwnrlxiz/6JzdJEOIh
	MuRVH1MQDEp8KQ855mnovGEmmHwSORc+/mh32wDI76U6K10y8Ij9XSQ5/OFuG5ryZaJPyHY88FCsJ
	+Qg7sGmK+lHyhxNUerX4gs8LLgOSCoKdBq/8j3T/adDjmu6Fk+kuOWYtSSKDZymuDGDEDg8w9H+Ja
	OgAPZ9eDXaNqYX3sMiBBN1Xh4ue7GCGAnM3g1sw/RwDesDCGz7TMJpJAG2+5bM/tHCd2oMFtcRvzF
	wYCvv55voA+rFFYIGHBWh6aq4I+CIwhMPy/YLSAoSfXnsGmQD6N4B0q4wDHtQPcekAG59jUft5SKf
	iK8dnENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfl4-00000002nTl-49Lu;
	Thu, 11 Sep 2025 11:46:34 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwfl2-00000002nQm-17Tc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:46:34 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4cMwff1FNbz24j7v;
	Thu, 11 Sep 2025 19:43:06 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 08FDA180042;
	Thu, 11 Sep 2025 19:46:23 +0800 (CST)
Received: from huawei.com (10.50.165.33) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Sep
 2025 19:46:22 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <oliver.upton@linux.dev>, <yuzenghui@huawei.com>, <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <liuyonglong@huawei.com>,
	<wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>
Subject: [PATCH v3 1/2] KVM: arm64: Make ID_AA64MMFR1_EL1.{HCX, TWED} writable from userspace
Date: Thu, 11 Sep 2025 19:46:20 +0800
Message-ID: <20250911114621.3724469-2-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250911114621.3724469-1-yangjinqian1@huawei.com>
References: <20250911114621.3724469-1-yangjinqian1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_044632_497799_B044C597 
X-CRM114-Status: UNSURE (   8.45  )
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

Allow userspace to downgrade {HCX, TWED} in ID_AA64MMFR1_EL1. Userspace can
only change the value from high to low.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/kvm/sys_regs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82ffb3b3b3cf..db49beb8804e 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3002,8 +3002,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				      ~(ID_AA64MMFR0_EL1_RES0 |
 					ID_AA64MMFR0_EL1_ASIDBITS)),
 	ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
-					ID_AA64MMFR1_EL1_HCX |
-					ID_AA64MMFR1_EL1_TWED |
 					ID_AA64MMFR1_EL1_XNX |
 					ID_AA64MMFR1_EL1_VH |
 					ID_AA64MMFR1_EL1_VMIDBits)),
-- 
2.33.0


