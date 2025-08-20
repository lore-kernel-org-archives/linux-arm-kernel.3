Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6DBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 11:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsjZMMtaBbupc4oGzIo3XvAEclb3sb0eigWneHj5NVQ=; b=phzw2xxONkmSDfnid4TFoJBRvH
	SCKNGhH7mUiCvZYF7C6eFh29bBxYFqQZ3LCmy8G9wwiWOIZxc75uiik54SohbTF1MCIVGr8X4RMAQ
	d3QObc3CNx11shPxX6wlSEzyPYlK+2Awb4rMes18GN2EWQz+KUxiKRmgXM7qVUz7p6g76ck5kfXSt
	QgYAvHXBFQgHUmY9IHjX5OTBrwr8HxFqnCxKTWabJnHJFnLYZebpaec4UmkrY0x4W8vVEG7i3kpS2
	iqkm8zXkraL+8pgAIU2JJqk7KZ2p+KikQxDpfMNp6a7ICoKi1Ldz0mXMkeYVjFgvlK7U6UzfYfC3c
	5iP32kbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoh4W-0000000DQGc-3jWd;
	Wed, 20 Aug 2025 11:33:40 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uog8u-0000000DBKS-3UjA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 10:34:10 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4c6N6g74knz6M4qN;
	Wed, 20 Aug 2025 18:31:55 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5B24F140119;
	Wed, 20 Aug 2025 18:34:03 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Aug 2025 12:34:02 +0200
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Catalin Marinas <catalin.marinas@arm.com>, <james.morse@arm.com>,
	<linux-cxl@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-acpi@vger.kernel.org>, <linux-arch@vger.kernel.org>,
	<linux-mm@kvack.org>, Will Deacon <will@kernel.org>, Dan Williams
	<dan.j.williams@intel.com>, Davidlohr Bueso <dave@stgolabs.net>, "H . Peter
 Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
CC: Yicong Yang <yangyicong@huawei.com>, <linuxarm@huawei.com>, Yushan Wang
	<wangyushan12@huawei.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Andy Lutomirski
	<luto@kernel.org>
Subject: [PATCH v3 8/8] Hack: Pretend we have PSCI 1.2
Date: Wed, 20 Aug 2025 11:29:50 +0100
Message-ID: <20250820102950.175065-9-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
References: <20250820102950.175065-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_033409_008856_B3AC7A5D 
X-CRM114-Status: GOOD (  11.34  )
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

Need to update QEMU to PSCI 1.2. In meantime lie.
This is just here to aid testing, not for review!

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/firmware/psci/psci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 38ca190d4a22..804b0d7cda4b 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -646,6 +646,8 @@ static void __init psci_init_smccc(void)
 		}
 	}
 
+	/* Hack until qemu version stuff updated */
+	arm_smccc_version_init(ARM_SMCCC_VERSION_1_2, psci_conduit);
 	/*
 	 * Conveniently, the SMCCC and PSCI versions are encoded the
 	 * same way. No, this isn't accidental.
-- 
2.48.1


