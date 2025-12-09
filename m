Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A36D1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 04:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+hA+gu9PU+4/uBQ9nfvS85274grGkWICOSAQs78uTA=; b=u7Ju7+y29ZyDG+Kp7sS3S6ZRTa
	ib+XUOX3GlArm2kD5JXarLQxD5J7cPYt97P5527/Cd3vDmbZUO/gfI5duKB3Fhu6cPtQgM65QD5xA
	MZ3Kyak/ubVV0vfSYtiAluPC9mkNNtYxCT3XgTf49kx9rTmVgTE4i2S3im4qyhicmzrAzWw1mN83x
	5BDVJ25yElv4NuSjwY6jG5cFiR/+R0aOFpbd2k97f6sX3ZugHA6ICyvaluX76ShqRJzfib0pw2PK6
	/jh9WjD8vnMDW/Jr9wdT96SqGfHOI1LzKpaTc0+G5K8QAl0uqVfG65D5+bOpWEi+8u6i8yfYI7bpk
	xNGusFQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSow1-0000000Dn5s-1pX8;
	Tue, 09 Dec 2025 04:02:45 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSovx-0000000Dn5M-3HjM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 04:02:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K+hA+gu9PU+4/uBQ9nfvS85274grGkWICOSAQs78uTA=;
	b=5aQe7ERi50yeolqCo9h5efu36ejtuqUKngBMciApRevl9vWnRqczrVSaimj+hXaGXHvlDpAPf
	vT/YPGqYfmyi+5yoO61M0fW73JRdd7/+7837ya2qtlnxdOY8ui0OuGQkgdyI+2q0M/R31/xPdyG
	6LU3QqzzLowWqeae8bJaQuY=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4dQQ9y3rVRz1cyPb;
	Tue,  9 Dec 2025 12:00:38 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 8E603140143;
	Tue,  9 Dec 2025 12:02:34 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 9 Dec 2025 12:02:34 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <rmk+kernel@armlinux.org.uk>
CC: <linux-arm-kernel@lists.infradead.org>, <torvalds@linux-foundation.org>,
	<viro@zeniv.linux.org.uk>, <will@kernel.org>, <xieyuanbin1@huawei.com>
Subject: Re: [PATCH 1/3] ARM: allow __do_kernel_fault() to report execution of memory faults
Date: Tue, 9 Dec 2025 12:02:23 +0800
Message-ID: <20251209040223.25069-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <E1vSaS6-00000000Ni7-1FDb@rmk-PC.armlinux.org.uk>
References: <E1vSaS6-00000000Ni7-1FDb@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_200242_312364_27FB5E2B 
X-CRM114-Status: GOOD (  14.29  )
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

On Mon, 08 Dec 2025 12:34:54 +0000, Russell King wrote:
> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index 2bc828a1940c..f0884bf91dfa 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -162,6 +162,8 @@ __do_kernel_fault(struct mm_struct *mm, unsigned long addr, unsigned int fsr,
>  	 */
>  	if (addr < PAGE_SIZE) {
>  		msg = "NULL pointer dereference";
> +	} else if (is_permission_fault(fsr) && fsr & FSR_LNX_PF) {
> +		msg = "execution of memory";
>  	} else {
>  		if (is_translation_fault(fsr) &&
>  		    kfence_handle_page_fault(addr, is_write_fault(fsr), regs))

This patch caused a compilation error, is_permission_fault() is not
defined. Fixed with:
```patch
diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 6ba5a11cc..066408523 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -192,6 +192,21 @@ static void die_kernel_fault(const char *msg, struct mm_struct *mm,
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
@@ -305,19 +320,6 @@ void do_bad_area_user_fixup(unsigned long addr, unsigned int fsr,
 #define VM_FAULT_BADMAP		0x010000
 #define VM_FAULT_BADACCESS	0x020000

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
 static vm_fault_t __kprobes
 __do_page_fault(struct mm_struct *mm, unsigned long addr, unsigned int flags,
 		unsigned long vma_flags, struct pt_regs *regs)
```

