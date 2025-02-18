Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1B4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKYgfTv9D+OpGZ+GA+Ok1Xs/9NJx+gQT6xO8EIyY3z4=; b=WwZzpHKdOnCo9KzXfmkY98x3nK
	2q46TwgVoi5+bsi6QfvrkeW0HHGvLwSmO6l4oquHypV5atnUk66hAFXvn0wZo+FcWRwEAFIaRZk6M
	W2wHk9HKcEg3yCJfMV5DJNNvvI5laPbUgVIQaFsqEwzcwG92/1RJ0GVd5aE5mf3JuNKIAqoFx2qFL
	J4RueZLX4Fjeak9bQPoyDMoaf0sOE020E/zat/X7iBlKxPmaDhppZ5DOC24Iz/hapTc1MKJJ8eAt4
	ZiDloQar5aJPUG4QepBPm4rocpFH9sBDX9rQP9rZH4l3VnmvIsexzBMJGVUon4l+b8QCipYe0m8i1
	/hnroOig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOOW-00000008T38-2u4e;
	Tue, 18 Feb 2025 14:16:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOJ2-00000008Rox-3xPz
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 18 Feb 2025 14:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wKYgfTv9D+OpGZ+GA+Ok1Xs/9NJx+gQT6xO8EIyY3z4=; b=KqU/CVzbskkZgPrHwecTTKybHj
	OsOibL3fWDUPW+XN7esTxdfaVkie424L4yYNi2Sx98KVW+jTxJIQ7y88LDdOhDrH3Roi0jcksplbg
	P8/0W//a64dULom3+Y21L5sUvfhc0CXgFB63LfPpPRgrxdBhRoH/mNVzVxAyCHgWIjPtsfuCB80HS
	bpyj/6q9FIMcOI9m/Hh6YY0NymTQIygCuVgubkSEEqDTV8D2hvqYIIgRnTN4nNMi++B5iy01weLQX
	t1qsN+pgl+CTQr7HoQgyyJlDI01JatcXsD2xWbySFDFpTs47XEZfkFYu5Cc6U+53O6Bi+o189lUMy
	wlEl71cg==;
Received: from szxga06-in.huawei.com ([45.249.212.32])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOIz-000000020EP-26y2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:10:35 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Yy1dY4T6SzpkCN;
	Tue, 18 Feb 2025 22:10:41 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id EA2EF1401F1;
	Tue, 18 Feb 2025 22:10:10 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 18 Feb 2025 22:10:09 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>, <sshegde@linux.ibm.com>
Subject: [PATCH v11 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
Date: Tue, 18 Feb 2025 22:10:18 +0800
Message-ID: <20250218141018.18082-5-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250218141018.18082-1-yangyicong@huawei.com>
References: <20250218141018.18082-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_141034_124706_AE217381 
X-CRM114-Status: UNSURE (   6.54  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Enable HOTPLUG_SMT for SMT control.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fcdd0ed3eca8..947616d37e0c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -251,6 +251,7 @@ config ARM64
 	select HAVE_KRETPROBES
 	select HAVE_GENERIC_VDSO
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
+	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC if KASAN
-- 
2.24.0


