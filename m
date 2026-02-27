Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C85DFD9E34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3O+AOzmpnyfwQS2PkJNqr9fWBcdHz7jMhU/F79la4Nc=; b=Jm48UNLbl3EYzCdOPJU88QNa0e
	Hy2BIGjCW+97uRmc0zsARcBpPdx2j9HKDXFO0bh+JG0dwFSiQjf9B9fRNug+HnoN0I7h8yj9MIjFr
	Z6YpEAnsDDJ2WMRXEFu/aroOYkOj5+EpO98G1cGx2w+AZxpYomjSGg6msUUK2lKwNWYJl0zjBfRc4
	osay0/VQCCdhxCWkbXaVqHL2NTPHoPIq2T+rie83ESH9y7flTyx/I9Uxb3833+gzP4izNpVpkC379
	tIz+xEfVkPCkS1LFNMHb3JSXLlAH3HnqH3b9CX0dCvrDb/Q4fAb63qAHuwhoKneM7z7ep1191HtL2
	dRkC5PoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoQK-00000007b1S-1EIN;
	Fri, 27 Feb 2026 03:21:52 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoQI-00000007ZyL-0DOZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:21:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=3O+AOzmpnyfwQS2PkJNqr9fWBcdHz7jMhU/F79la4Nc=;
	b=jfiWMjBwS+GANZQLHHyx61TDrpi3QFYYI0+ISP1NzZjxSsSCxiLub/69evp5v/8OKLtBF1dJe
	kIs9SjkkU0f8rouNSr8VY7Vv3VHGEKRVNEJAfMjvNfw1fo4NVc1ScbTn/OU1+EGEl88bSsn5eLV
	CYsWg6DMh5tpCMdKraaZEh0=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4fMYNJ1XyXz12LDR;
	Fri, 27 Feb 2026 11:14:56 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B561F40561;
	Fri, 27 Feb 2026 11:19:35 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 27 Feb
 2026 11:19:34 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <shuah@kernel.org>,
	<broonie@kernel.org>, <yeoreum.yun@arm.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH 1/2] selftests/arm64: Implement cmpbr_sigill() to hwcap test
Date: Fri, 27 Feb 2026 11:19:32 +0800
Message-ID: <20260227031933.4103333-2-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20260227031933.4103333-1-wuyifan50@huawei.com>
References: <20260227031933.4103333-1-wuyifan50@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_192150_253618_4CC5D89A 
X-CRM114-Status: GOOD (  10.19  )
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
 tools/testing/selftests/arm64/abi/hwcap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/abi/hwcap.c b/tools/testing/selftests/arm64/abi/hwcap.c
index 9d2df1f3e6bb..0d229804a857 100644
--- a/tools/testing/selftests/arm64/abi/hwcap.c
+++ b/tools/testing/selftests/arm64/abi/hwcap.c
@@ -56,7 +56,10 @@ static void atomics_sigill(void)
 
 static void cmpbr_sigill(void)
 {
-	/* Not implemented, too complicated and unreliable anyway */
+	/* CBEQ x0, x0, +8 */
+	asm volatile(".inst 0x74C00040" : : : "x0");
+	/* UDF #0 */
+	asm volatile("udf #0" : : : );
 }
 
 static void crc32_sigill(void)
-- 
2.33.0


