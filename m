Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FBBEFCE53
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 01:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfW3VplqAwqPnYpDi9Xi2kjGv6UcJGL67/vONLonH0k=; b=ZP7SDuyZCMZA0M6UK0x64v4PWN
	PGJZnvkOdWdPdTIuouJHOkqcLzZMQG6DRBkTXLcr03Ji9b8/0T4Am1kkGqlRuIggP4Am37hWlSh16
	mo0rXzFIBN32teMcnNoWwNBlmxYfqowbGLzwC+fTBGmV2wbW4dmklBpYX7FPlKwpVrIVvRtBWhuyF
	mLXhPampUEGNT0emygXljAj2Hxw9Ds3upAEm0/MRsECKpYSeJl3vdDVf/wYibU7DjNcVWviY/2y2a
	x68Y8H9xxRcjBAK/EjMljRp/5qB9+HPoNPi9lq54vTlWl2pixslLj6UIjWnRbefClwKV5zmau2Asj
	8qoTZiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxxeO-00000000kar-0ILk;
	Thu, 05 Mar 2026 01:37:16 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxxeL-00000000kZp-21AN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 01:37:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OfW3VplqAwqPnYpDi9Xi2kjGv6UcJGL67/vONLonH0k=;
	b=DvCG0FyUOHOUTxq1Ky6Vqx/hHHDjVHJ1DiomkbGf127J7h2OSB/q4jJYeB3hz7onFDsoSuKec
	pI9PfXuJu6AEZ4O3TBBe3xzPWUnDrtmVS+o32kiOjk+aveJqUQxxWKky0t3SNto05J29PTJOW0p
	s6Fx/cc3+uQ9UPp0u32TbLM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fRBq01VLjzRhTj;
	Thu,  5 Mar 2026 09:32:12 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id 02EC54056B;
	Thu,  5 Mar 2026 09:37:03 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 5 Mar
 2026 09:37:02 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<broonie@kernel.org>, <yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v2 2/2] selftests/arm64: Implement cmpbr_sigill() to hwcap test
Date: Thu, 5 Mar 2026 09:36:38 +0800
Message-ID: <20260305013638.992301-3-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260305013638.992301-1-wuyifan50@huawei.com>
References: <20260305013638.992301-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_173713_686862_2332638C 
X-CRM114-Status: GOOD (  10.47  )
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

The function executes a CBEQ instruction which is valid if the CPU
supports the CMPBR extension. The CBEQ branches to skip the following
UDF instruction, and no SIGILL is generated. Otherwise, it will
generate a SIGILL.

Signed-off-by: Yifan Wu <wuyifan50@huawei.com>
---
 tools/testing/selftests/arm64/abi/hwcap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index c2661a312fc9..e22703d6b97c 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -56,7 +56,8 @@ static void atomics_sigill(void)
 
 static void cmpbr_sigill(void)
 {
-	/* Not implemented, too complicated and unreliable anyway */
+	asm volatile(".inst 0x74C00040\n" /* CBEQ w0, w0, +8 */
+		     "udf #0" : : : "cc"); /* UDF #0 */
 }
 
 static void crc32_sigill(void)
-- 
2.33.0


