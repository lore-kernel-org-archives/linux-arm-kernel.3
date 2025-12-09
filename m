Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B35ED1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tcMF3cRpzEEtF2/VObJ0uvDxmFVvQ5pPLVgCyu1MVSg=; b=hElmG4RAm/sEJbk8TefKydX+Cn
	ElUrTdvcOnp1XTE+psahGt86WxTovpnyOTiXwRMevvS7tNf9AQLk+eQSO407b9Y4h5c4ZxBJTRHYN
	B7Oht8JvTciyJ251bLSL4AvE8xoRpjWz/SYX//JdmgwtyyfPH0yiCAygSl7AxVRqjesPv6DQsivf/
	++AY4QHI3La2T0sVz5I3qSKUqT0nCTCkZjPXwpoOOcrYFK0S3k737dfhFYpw7BWs9uiQdSgGYl63H
	DngzwbtP5/94SC3YhdgVYiakxks51lLrCsqhMC9Nhw8SXHrX3fnyGXg8P/qnWP9L/R2vk9m9QHlPn
	7h/z7RoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStWj-0000000E17b-2U8q;
	Tue, 09 Dec 2025 08:56:57 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vStWe-0000000E15q-3ngW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 08:56:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=tcMF3cRpzEEtF2/VObJ0uvDxmFVvQ5pPLVgCyu1MVSg=;
	b=5Jli9XAOtKMhf4UrEnIIvVb5w79AyEExd8n1YP6Ws55z3BuiuZfBRnKxVzdLyjbjODHK8Ac52
	uyOPzMpZPvkpbPw3mGZcV5TupuUjdgeDYJREEMfwlER3O12cWaBmZPS5y/GI/5SlrPEzzuPmG2S
	uuNkEYdSlRnB0RAYvjuk0TA=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dQXjN6fjGzmV69;
	Tue,  9 Dec 2025 16:54:48 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id D92261A016C;
	Tue,  9 Dec 2025 16:56:44 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Dec 2025 16:56:44 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <torvalds@linux-foundation.org>,
	<viro@zeniv.linux.org.uk>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 0/3] ARM: fix hash_name() and branch predictor issues
Date: Tue, 9 Dec 2025 16:56:27 +0800
Message-ID: <20251209085627.64057-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <aTcBHKFDBkSEp5mi@shell.armlinux.org.uk>
References: <aTcBHKFDBkSEp5mi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_005653_560097_EC4864CC 
X-CRM114-Status: GOOD (  22.21  )
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

Hi, Russell!

TL; DR:
patch1 and patch2 with compilation error fixed:

Tested-by: Xie Yuanbin <xieyuanbin1@huawei.com>

patch3:
The simple test case passed, but the syzkaller test (the original
scenario that triggered the branch predictor issue) is still running.
The syzkaller test is better to run for a day.

All patches with compilation error fixed:

Reviewed-by: Xie Yuanbin <xieyuanbin1@huawei.com>


Detailed Description:

On Tue, 9 Dec 2025 10:52:16 +0800, Xie Yuanbin wrote:
> On Mon, 8 Dec 2025 16:47:24 +0000, Russell King wrote:
>> Also, would you mind giving ASAP some tested-by/reviewed-by for these
>> patches so they can be pushed out to linux-next for a bit of testing
>> there pelase? I'm on vacation from Thursday, so time is very short
>> to get these out - if we're not ready by Wednesday, then it'll be the
>> new year, possibly after the 11th January, before I can do anything
>> further (medical stuff.)
>>
>> Thanks.
>
> As mentioned in the previous email, this(these patches) should be the
> best solution, I think. And I have carefully read the three patches, so:
>
> Reviewed-by: Xie Yuanbin <xieyuanbin1@huawei.com>
>
> As for testing, I can perform some simple tests myself, and I am trying
> to let the testing team to help with some further testing, like
> syzkaller.

Your first patch caused a compilation error: is_permission_fault() is not
defined. I fixed it with this patch:
```patch
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 2bc828a1940c..7082ba87e886 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -143,6 +143,21 @@ static void die_kernel_fault(const char *msg, struct mm_struct *mm,
 	make_task_dead(SIGKILL);
 }

+static inline bool is_permission_fault(unsigned int fsr)
+{
+#ifdef CONFIG_MMU
+	int fs = fsr_fs(fsr);
+#ifdef CONFIG_ARM_LPAE
+	if ((fs & FS_MMU_NOLL_MASK) == FS_PERM_NOLL)
+		return true;
+#else
+	if (fs == FS_L1_PERM || fs == FS_L2_PERM)
+		return true;
+#endif
+#endif
+	return false;
+}
+
 /*
  * Oops.  The kernel tried to access some page that wasn't present.
  */
@@ -225,19 +240,6 @@ void do_bad_area(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 }

 #ifdef CONFIG_MMU
-static inline bool is_permission_fault(unsigned int fsr)
-{
-	int fs = fsr_fs(fsr);
-#ifdef CONFIG_ARM_LPAE
-	if ((fs & FS_MMU_NOLL_MASK) == FS_PERM_NOLL)
-		return true;
-#else
-	if (fs == FS_L1_PERM || fs == FS_L2_PERM)
-		return true;
-#endif
-	return false;
-}
-
 #ifdef CONFIG_CPU_TTBR0_PAN
 static inline bool ttbr0_usermode_access_allowed(struct pt_regs *regs)
 {
```
With the compilation error fixing patch first, and then your three
patches, and then Liyuan's patch:
Link: https://lore.kernel.org/20251127025848.363992-1-pangliyuan1@huawei.com
The current testing situation is as follows:

1. About the hash_name() fault issue:
Simple test case:
Link: https://lore.kernel.org/20251127140109.191657-1-xieyuanbin1@huawei.com
that can trigger this issue, as well as the original scenario which
trigger this issue, have passed the tests.

So patch1 and patch2:

Tested-by: Xie Yuanbin <xieyuanbin1@huawei.com>

2. About the branch predictor issue:
Simple test cases (Link same as above) that can trigger this issue, has
passed the tests. However, the original scenario which trigger the issue
is the syzkaller test, which might take some time, possibly around a day.

