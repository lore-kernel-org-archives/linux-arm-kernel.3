Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF71CC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 08:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jwBwKePMwisgX/lU9IAZmEPQkxHFHd6vyr4mP3uxIq0=; b=GwX9Ls0giv6nYGUtvDehTlmi2U
	UOnzEOC2tZuLkpwuyPGYFiJnEr5Ot8HsiPnZvU4VE9onZxKZTCt6LHXX/EynI8cqoClPDri+BtmKN
	zCoXEBen+AmvXSQQc+AUi38Auq4Ej7Kb27UUiylp3kTpl7TJ9wSHsloUxnFK6cp9Fnvpt2gVrxvKw
	JYKz3aTn5PSTOfNthnYbJIEEqmvU7gtyLVjDGTD7r1n1MqR75ZWu/YyevYRjw77ab7af1UWZGbXGJ
	zhc7++OrqYQ8SB4lIHh3om0ZIhmYcRQDvssyr5hScqYd6LZol6osOAGbImFRn5gXhZ8udsuxg+kty
	Ivkb7Lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbF7S-0000000EGC8-0UK3;
	Fri, 24 Jan 2025 08:32:50 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbF66-0000000EFyB-0ITF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 08:31:27 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4YfWBp2PXyz1W4jh;
	Fri, 24 Jan 2025 16:27:14 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A6AA6140159;
	Fri, 24 Jan 2025 16:31:16 +0800 (CST)
Received: from huawei.com (10.67.174.76) by kwepemg500010.china.huawei.com
 (7.202.181.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 24 Jan
 2025 16:31:16 +0800
From: Yuntao Liu <liuyuntao12@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <linux@armlinux.org.uk>, <ruanjinjie@huawei.com>, <kees@kernel.org>,
	<masahiroy@kernel.org>, <ardb@kernel.org>, <liuyuntao12@huawei.com>
Subject: [PATCH -next] arm32/boot/compressed: Force hidden visibility for all symbol references
Date: Fri, 24 Jan 2025 08:20:30 +0000
Message-ID: <20250124082030.764417-1-liuyuntao12@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.76]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg500010.china.huawei.com (7.202.181.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_003126_264617_2A3C2668 
X-CRM114-Status: UNSURE (   6.65  )
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

Eliminate all GOT entries in the decompressor binary, by forcing hidden
visibility for all symbol references, which informs the compiler that
such references will be resolved at link time without the need for
allocating GOT entries.

Include linux/hidden.h in Makefile, like x86, for the
hidden visibility attribute.

Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
---
 arch/arm/boot/compressed/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 945b5975fce2..d8a17760ad29 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -93,6 +93,9 @@ targets       := vmlinux vmlinux.lds piggy_data piggy.o \
 		 head.o $(OBJS)
 
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
+ifneq ($(CONFIG_LD_IS_LLD),y)
+KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
+endif
 
 ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
 	     -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
-- 
2.34.1


