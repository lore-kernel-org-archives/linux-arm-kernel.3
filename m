Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB109CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PHHLYFMpklN5qgGERyJ3rzXV4M63UzV92QUYzleumsY=; b=g5NbSSpmpNY1jfztiIhJEZTy9X
	vctCub0L0nQtrsQM4iapYwfoWpWZWEXJej929Zti+sLlBq95//I/X/i17i5FKKAQnmKyEeWKhVcoK
	eex6efORh17BwFsy0ercpc8OOMRrjOeudjzcMFhowDiszLubMimUS5kPoE1Faxoq9gjd+p/+skMZx
	DbSgVZ9jn6jgKIn9ysbHxLa8TlnB3Thqi+MOnctrHuwLDw75aEQ8gbTiWLdRlTmevEkFLb7JLwfDE
	DtPhrzsZXlCkOb/5cXoBivThksGsAUIrFh2XES8unxSuDVY9eGMtVkbGvAjTpMzm2YP7nC/NixyTB
	jFfYMO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsI6-00000004xKG-1jTg;
	Tue, 09 Sep 2025 06:57:22 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvpHO-000000041Hj-1sNO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 03:44:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cLV1t64B5z2CgBs;
	Tue,  9 Sep 2025 11:39:46 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id 7CDF91A016C;
	Tue,  9 Sep 2025 11:44:18 +0800 (CST)
Received: from huawei.com (10.50.165.33) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 9 Sep
 2025 11:44:17 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <oliver.upton@linux.dev>, <yuzenghui@huawei.com>, <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, <liuyonglong@huawei.com>,
	<wangzhou1@hisilicon.com>, <yangjinqian1@huawei.com>
Subject: [PATCH v2 1/3] KVM: arm64: Make ID_AA64MMFR1_EL1.HCX writable from userspace
Date: Tue, 9 Sep 2025 11:44:13 +0800
Message-ID: <20250909034415.3822478-2-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250909034415.3822478-1-yangjinqian1@huawei.com>
References: <20250909034415.3822478-1-yangjinqian1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_204426_639950_2FFDE3CD 
X-CRM114-Status: GOOD (  10.18  )
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

Allow userspace to downgrade HCX in ID_AA64MMFR1_EL1. Userspace can
only change this value from high to low.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/kvm/sys_regs.c                       | 1 -
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 82ffb3b3b3cf..f2267db1c44c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3002,7 +3002,6 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				      ~(ID_AA64MMFR0_EL1_RES0 |
 					ID_AA64MMFR0_EL1_ASIDBITS)),
 	ID_WRITABLE(ID_AA64MMFR1_EL1, ~(ID_AA64MMFR1_EL1_RES0 |
-					ID_AA64MMFR1_EL1_HCX |
 					ID_AA64MMFR1_EL1_TWED |
 					ID_AA64MMFR1_EL1_XNX |
 					ID_AA64MMFR1_EL1_VH |
diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index d3bf9204409c..a744dee30cd2 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -165,6 +165,7 @@ static const struct reg_ftr_bits ftr_id_aa64mmfr0_el1[] = {
 static const struct reg_ftr_bits ftr_id_aa64mmfr1_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR1_EL1, TIDCP1, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR1_EL1, AFP, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR1_EL1, HCX, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR1_EL1, ETS, 0),
 	REG_FTR_BITS(FTR_HIGHER_SAFE, ID_AA64MMFR1_EL1, SpecSEI, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64MMFR1_EL1, PAN, 0),
-- 
2.33.0


