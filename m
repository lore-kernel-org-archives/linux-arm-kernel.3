Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F59CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 11:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/c7XSV5t7WJ4QG05qOnnWkNZKkZosK89PH6LreF4fq0=; b=v7iHidIBAw+33kucwB6Xb/ztmX
	RdwQfMPmQamEIgtD00i2bpGKWe/oXTk8jogHGnsErxTBQohdTLCtzuq6kEgGPR767Olso3wDg+T7a
	ZPyWXTf7hWAsu8ZqJKhd8eXangsBaubP5LcDM8UoBqq39Ln4+NT+ByuY9yoVP/BHJPeRpIgwiQK02
	+1YspVjIiPCTkyVwI3H7LA01jVY7WbluhRhrhjkj8shLjkxiMcyLPHLrrxW8v+ofv3uJGIQJ1x8LW
	bWQNcSZt6BqL/RiQX3R+1gyNs2GUtblFSI1TIHt62osTbvak4C+e1drsfED93DQ8wCEkfQ/vCVPG0
	WhWL5tJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwflI-00000002nb2-2gpP;
	Thu, 11 Sep 2025 11:46:48 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwflF-00000002nYj-29Y7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 11:46:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cMwd52PKqzRkHY;
	Thu, 11 Sep 2025 19:41:45 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 63E53140156;
	Thu, 11 Sep 2025 19:46:22 +0800 (CST)
Received: from huawei.com (10.50.165.33) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 11 Sep
 2025 19:46:21 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <oliver.upton@linux.dev>, <yuzenghui@huawei.com>, <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <liuyonglong@huawei.com>,
	<wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>
Subject: [PATCH v3 0/2] KVM: arm64: make EL2 feature fields writable in ID_AA64MMFR1_EL1
Date: Thu, 11 Sep 2025 19:46:19 +0800
Message-ID: <20250911114621.3724469-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_044645_719318_23BBAD7A 
X-CRM114-Status: UNSURE (   9.04  )
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

Allow userspace to downgrade EL2 features (TWED, HCX) to ensure VM live
migration compatibility between hosts with varying feature support.

Although ID_AA64MMFR1_EL1.VH is an EL2 feature, it is still kept as non-
writable in userspace. When FEAT_E2H0 is not implemented, HCR_EL2.E2H is
res1. When E2H=1, EL2 operates in VHE mode. In this case, if userspace
modifies the VH bit to 0, the Guest's kernel will still run in vEL2, leading
to inconsistency. 

v1: https://lore.kernel.org/linux-arm-kernel/20250325121126.1380681-1-yangjinqian1@huawei.com/
v2: https://lore.kernel.org/linux-arm-kernel/20250909034415.3822478-1-yangjinqian1@huawei.com/

Change Log:
v1->v2:
  -Added support for downgrading TWED and VH fields.
  -Added corresponding test cases to the set_id_regs selftest.

v2->v3:
  -Kept VH non-writable.
  -Separated kernel patches and self-test patches.

Jinqian Yang (2):
  KVM: arm64: Make ID_AA64MMFR1_EL1.{HCX, TWED} writable from userspace
  KVM: arm64: selftests: Test writes to ID_AA64MMFR1_EL1.{HCX, TWED}

 arch/arm64/kvm/sys_regs.c                       | 2 --
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.33.0


