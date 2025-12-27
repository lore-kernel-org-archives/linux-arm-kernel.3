Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D97DE8FDD5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 09:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MC190JDsuOBd4MEKKHCaYvp0ToUbGIR7G1lcWWgrwQc=; b=NsecTWHt96o3RjoJPmXriz/KNY
	B5gOZliMTK98br9rX2beMwjFfR1m09fHmN6DhrNJj0Jb/BZ6jsvCWh6ntcvmlJWvxoYqGmq9+IJ7V
	cBdaReX93PyUkW4jE36vEUBJUCV+XFgd07jZ/4aF6IulrsDyldszuSBBCBML8/AS/veCvF1hLI1Nb
	5IKRjR4L8XGBn6+0k5OjBGC164VUilELQ/MNUNUMuZ+sjMLWaNcGYcWp6TzfuxOZ2yrVA6njaUrXR
	7cJmBXxJh6kOhLkEt+ozM3jQYwFOrqUCbJCXKVGDb2wos9wCmtioGWsPiAQiUqrfnHyzlVM/CRRwP
	V862kwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQXr-00000001pDs-3EOk;
	Sat, 27 Dec 2025 09:25:07 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZQXn-00000001pCp-3nj9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 09:25:05 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MC190JDsuOBd4MEKKHCaYvp0ToUbGIR7G1lcWWgrwQc=;
	b=PBI2kFBtOjbmlMC81d3cP/X0aLaudO1Kh1YpcceIOBFYHqJP+51F+LO7hhSwFEpcDhE953KaO
	3ofN8pAXkWtyIX1baM9/1DFl9e7cooTY8LzVf4UQSKhIY/Il4F+7eMR3PtXgWybMMYVsrtbTlja
	Eb09EaIn4oL/gAlENptcNxQ=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4ddcS715Bfz1prRC;
	Sat, 27 Dec 2025 17:21:43 +0800 (CST)
Received: from dggpemf500013.china.huawei.com (unknown [7.185.36.188])
	by mail.maildlp.com (Postfix) with ESMTPS id E75FA40363;
	Sat, 27 Dec 2025 17:24:53 +0800 (CST)
Received: from huawei.com (10.50.163.32) by dggpemf500013.china.huawei.com
 (7.185.36.188) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Sat, 27 Dec
 2025 17:24:53 +0800
From: Jinqian Yang <yangjinqian1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<wangzhou1@hisilicon.com>, <shenjian15@huawei.com>, <linuxarm@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH] arm64: Add support for TSV110 Spectre-BHB mitigation
Date: Sat, 27 Dec 2025 17:24:48 +0800
Message-ID: <20251227092448.732059-1-yangjinqian1@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500013.china.huawei.com (7.185.36.188)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_012504_436292_F0CF2F55 
X-CRM114-Status: UNSURE (   8.93  )
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

The TSV110 processor is vulnerable to the Spectre-BHB (Branch History
Buffer) attack, which can be exploited to leak information through
branch prediction side channels. This commit adds the MIDR of TSV110
to the list for software mitigation.

Signed-off-by: Jinqian Yang <yangjinqian1@huawei.com>
---
 arch/arm64/kernel/proton-pack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
index 80a580e019c5..b3801f532b10 100644
--- a/arch/arm64/kernel/proton-pack.c
+++ b/arch/arm64/kernel/proton-pack.c
@@ -887,6 +887,7 @@ static u8 spectre_bhb_loop_affected(void)
 		MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
 		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
+		MIDR_ALL_VERSIONS(MIDR_HISI_TSV110),
 		{},
 	};
 	static const struct midr_range spectre_bhb_k24_list[] = {
-- 
2.33.0


