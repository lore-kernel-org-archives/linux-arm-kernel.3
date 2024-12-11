Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EECAE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 23:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=; b=l7Mdu+Xz2MAgW6X5aFqaDEh8Vj
	PGw/YEHkOtbjo4+0CgAMSiSxkpGPkHUovb7abmuePvWMMxh3/ZcVfbyxxs6ulaoKQwmnpdEQS8Qra
	RdqFfldycMMNrL8EjKV8q3lCw/FKBzaKIwO1Qvf/b9dp/sCoFp0scKJ1poDgDnueEv2st3xk0ZoNz
	45esleFuajRWwLInQrOT7cQaYIiiAxIXvoDWQ2m89MxiSgQX+fCvSMOEDiCF+Xwo0B/zGv2rG/mkT
	7dFTTxB5I2HWCdWsifCvoOfnblbfodVWcfWew6SYJuq+Ti0QVSkFPy4nZc75K0rxSPYVc5Y+PJkXW
	jhrN4hbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWNB-0000000GW6F-0iXs;
	Wed, 11 Dec 2024 23:44:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW86-0000000GSfO-2w3n
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 23:28:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=; b=o3AjDsOX4U3AI/UNIzKR0PgQ37
	4LvMIsnUgViC0HRuUGsQHwQOYOonAC6hrcQsGBSBhp7R11V08KKfG5hhnC+CqbusQs+SrLvbd/nBO
	iAgcTmJh7Py6cYbV3JjTgK9y6GBcthy6VDN0skw3jII7Tp/Cm4GCy9tJEDRFV+APZGbHHqCXxPjX2
	1KgYH3gNC7PJUJ2lc/S9J8LpW9h1WbH3rnZccc10vzda08KbNl6d1DzAE2nycvq0CtzjEC8PbI5I6
	ggcHD3DHHrm3O6J6bsDk3e8puoWerVKWi+84nwAzEodb0nwnkyeVYNPtOCME4JePudH5DRzj17/3S
	U7tg0DWQ==;
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLW83-00000003w77-2STk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 23:28:29 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-5f2d927fe56so11238eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 15:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733959704; x=1734564504; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=Sl5VMlULaaO9iPZ6Qo7l3Rl1aTQIjQ6N20DmSeRRhpZxPf9/F8O50hKFLMa1K5PvGB
         HGEhO7HWICiB/r+D8yjmQLCtQuc5PAQFz5OYa1RRWyHOGb2xtF+ddU1B5re1KWUuk0KL
         qHhZYmD2XnSq9ekqlf7dCb2jbWD7+STZzRKt0b7TVCVXcXmbfljTT2sf+p5zTjMh5lZa
         TZOow3rXsgfksNJ+sC5LAAaa7J7gcJHU8jsK4ZFrgY0+NO85RP1hG9jlM0r/+wSobEwt
         Xe6q1LtK18EBWnzAtfZlZLGBbsQ45YibdEbLQnVdZI3PbSHtnXWZz8um2/uiv1j8RIZ+
         N81Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733959704; x=1734564504;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Hm5oOLdBb7ho6/nkMyyfkvkknoYZ/+aPdlC1ktc9c=;
        b=Ak14pduQ5lRSD9Ty/NOT/iRFpV+V0pnwR+RPYiK3GiWx4LQI/A8A9IujZmlL+I36ea
         /IlFQ30wR5xfMAqtYa12w7Sk3gMFNBqu50yl3SllF8Op57ZhRqpOSjLSn07dc28/fQgU
         JOaysN1w0fIUJ6SiSDUJFNjZenV6JW6ybImGC8JRZD4jtx5Gbk+CYXdRqfiYSgAlUXjC
         /TR8WM5hBBl//8pw4KipZge6VSGx7gaPXqiKK4HrGir6NstB8cYAObmqj9HX+NXrgUi/
         HJqSdouftJBJTgwM/1Ad/fMfbiVnczW5qV/OtDgTJglBAgMGF+hvZ3mVFiJmpFuln5m/
         EHpg==
X-Forwarded-Encrypted: i=1; AJvYcCUrHE5PnB3s/ruV3DuiV6c6Ea78M3OmCN0f9uwQE3Vk4XGyhOC6wAlWz3uandtyI/MQ83zVfoqhyCGBJ9Pem+sK@lists.infradead.org
X-Gm-Message-State: AOJu0YyesJfdxYesvhYHrax91mfJYfTQHi5SbjmSZ/TOS9tnh42YV5BW
	nYcLKE/AtDR21rustML+rYvicvcss53VVg6EjhwdRHgffW/MIAtZSbMt9xti1srRSUJXPFucsAL
	jo9YsQQ1ipGdAc+96VcaX8A==
X-Google-Smtp-Source: AGHT+IGQDLulfLF8RwhcJUV0HutTvJeMfbYLu8JUEjKppHvTG+7VWlPJjZzjhgEci5/4OsV71lgRhbIjtjk4C1ysLQ==
X-Received: from oabrl17.prod.google.com ([2002:a05:6871:6511:b0:296:1589:4069])
 (user=kaleshsingh job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:224d:b0:29e:f61:3b62 with SMTP id 586e51a60fabf-2a38236803dmr971354fac.7.1733959704488;
 Wed, 11 Dec 2024 15:28:24 -0800 (PST)
Date: Wed, 11 Dec 2024 15:27:52 -0800
In-Reply-To: <20241211232754.1583023-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20241211232754.1583023-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241211232754.1583023-15-kaleshsingh@google.com>
Subject: [PATCH mm-unstable v2 14/16] mm: xtensa: Introduce arch_mmap_hint()
From: Kalesh Singh <kaleshsingh@google.com>
To: akpm@linux-foundation.org, vbabka@suse.cz, yang@os.amperecomputing.com, 
	riel@surriel.com, david@redhat.com, minchan@kernel.org, jyescas@google.com
Cc: linux@armlinux.org.uk, tsbogend@alpha.franken.de, 
	James.Bottomley@HansenPartnership.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, davem@davemloft.net, 
	andreas@gaisler.com, tglx@linutronix.de, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, chris@zankel.net, 
	jcmvbkbc@gmail.com, bhelgaas@google.com, jason.andryuk@amd.com, 
	leitao@debian.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@android.com, android-mm@google.com, 
	Kalesh Singh <kaleshsingh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_232827_944857_4BFED0AF 
X-CRM114-Status: GOOD (  13.12  )
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

Introduce xtensa arch_mmap_hint() and define HAVE_ARCH_MMAP_HINT.

If a sufficiently sized hole doesn't exist at the hint address,
fallback to searching the entire valid VA space instead of only
the VA space above the hint address.

Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - MAP_FIXED case is also handled in arch_mmap_hint() since this is just a
    special case of the hint addr being "enforced", per Yang Shi.
  - Consolidate error handling in arch_mmap_hint().

 arch/xtensa/kernel/syscall.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/arch/xtensa/kernel/syscall.c b/arch/xtensa/kernel/syscall.c
index dc54f854c2f5..6bbe10c2a633 100644
--- a/arch/xtensa/kernel/syscall.c
+++ b/arch/xtensa/kernel/syscall.c
@@ -54,12 +54,12 @@ asmlinkage long xtensa_fadvise64_64(int fd, int advice,
 }
 
 #ifdef CONFIG_MMU
-unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
-		unsigned long len, unsigned long pgoff, unsigned long flags,
-		vm_flags_t vm_flags)
+unsigned long arch_mmap_hint(struct file *filp, unsigned long addr,
+			     unsigned long len, unsigned long pgoff,
+			     unsigned long flags)
 {
-	struct vm_area_struct *vmm;
-	struct vma_iterator vmi;
+	if (len > TASK_SIZE)
+		return -ENOMEM;
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -71,16 +71,27 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		return addr;
 	}
 
-	if (len > TASK_SIZE)
-		return -ENOMEM;
-	if (!addr)
-		addr = TASK_UNMAPPED_BASE;
-
 	if (flags & MAP_SHARED)
 		addr = COLOUR_ALIGN(addr, pgoff);
 	else
 		addr = PAGE_ALIGN(addr);
 
+	return generic_mmap_hint(filp, addr, len, pgoff, flags);
+}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags,
+		vm_flags_t vm_flags)
+{
+	struct vm_area_struct *vmm;
+	struct vma_iterator vmi;
+
+	addr = arch_mmap_hint(filp, addr, len, pgoff, flags);
+	if (addr)
+		return addr;
+
+	addr = TASK_UNMAPPED_BASE;
+
 	vma_iter_init(&vmi, current->mm, addr);
 	for_each_vma(vmi, vmm) {
 		/* At this point:  (addr < vmm->vm_end). */
-- 
2.47.0.338.g60cca15819-goog


