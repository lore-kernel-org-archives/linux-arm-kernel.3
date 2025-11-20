Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9FACF64A1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 01:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uwrpkl7zbFrAgnEGRIXjPeKubGZS4PCBbwYxIUmugX8=; b=su98MbVWkRcLGgZsH20MDf6QCn
	ZL5LVg9avwyHPt6nhitsRPYQCX0tznXS1yfBKOdfGgSfZmDtSns0UQt2THwuOUa/r9vR5ZjszhSPX
	iYw37KKjzJT2sij6SRd6n6mV11JcWvZadGQKyegKDfY93OSeAjWONnGjBEknjEKVjAr99xUutR8Ab
	DQGuq1BC3n+/rfJ4+3HPK2Z415EyKTKmTSyETISXh0g6/WMS+4fI8LMQQit7AvhVLO2L6QjEpumIl
	bSzTHfydYxjeZ7Z1jAHR0WuZJBJMwHuEOPEdQqL/GxUtI6Q0HWAnG2kmhQQXsgBmuRWvnq6sM6j7C
	L6WI42qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLtjr-00000005wQp-2RwZ;
	Thu, 20 Nov 2025 01:45:35 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLtjn-00000005wPp-3CCU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 01:45:33 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=uwrpkl7zbFrAgnEGRIXjPeKubGZS4PCBbwYxIUmugX8=;
	b=mke2N297u+d/Wi/xwXDfdAPqBH7Va6KlxN29APXFU9xKgS7QBMqxrryhmD5/zmJJ9WiD/2skW
	DviNfV3fPBW6jd43+Dac+vz0mM75TtMcF30QCkn7d9ZRv4Qz/3wZNPCEgxa7PGcAHjjo7AUXpT7
	eCD+T/RjHS+I5KTq4nq5hpc=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dBh290Rjfzcb1s;
	Thu, 20 Nov 2025 09:43:13 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 91105180BD0;
	Thu, 20 Nov 2025 09:45:16 +0800 (CST)
Received: from kwepemq200017.china.huawei.com (7.202.195.228) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 20 Nov 2025 09:45:16 +0800
Received: from hulk-vt.huawei.com (10.67.174.72) by
 kwepemq200017.china.huawei.com (7.202.195.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 20 Nov 2025 09:45:15 +0800
From: Cai Xinchen <caixinchen1@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <lujialin4@huawei.com>, <caixinchen1@huawei.com>
Subject: [PATCH -next] arm64: remove duplicate ARCH_HAS_MEM_ENCRYPT
Date: Thu, 20 Nov 2025 01:30:25 +0000
Message-ID: <20251120013025.1791800-1-caixinchen1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.72]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200017.china.huawei.com (7.202.195.228)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_174532_333509_55017871 
X-CRM114-Status: UNSURE (   7.76  )
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

The commit e7bafbf717775 ("arm64: mm: Add top-level dispatcher for
internal mem_encrypt API") adds ARCH_HAS_MEM_ENCRYPT. And then the
commit 42be24a4178fe ("arm64: Enable memory encrypt for Realms") adds
duplicate config. Just remove it.

Signed-off-by: Cai Xinchen <caixinchen1@huawei.com>
---
 arch/arm64/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 893e0af0bc51..0c88aebce43d 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -47,7 +47,6 @@ config ARM64
 	select ARCH_HAS_SETUP_DMA_OPS
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
-	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	select ARCH_STACKWALK
 	select ARCH_HAS_STRICT_KERNEL_RWX
-- 
2.34.1


