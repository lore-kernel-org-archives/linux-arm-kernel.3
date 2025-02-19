Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928C6C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1cyu4qLCW+G5IS8eMs/nlDOlaE0XI3DusDqdVY92os=; b=I6A6NWMbVyT9EoIX0jVNP61DEA
	waN6bRdBbvD7R/nObdpGEDu9oxEcyqHq3CB2aQznHh411P2xc9MZlsG+1pWombBQ7lvXXJOT8KaCl
	Y6ERxd87LHHR8oKY72A6D/ZWH3pAodYn281L6avPbsdho68F3ZRygWmLAU4Wz4KhbI1SOD+0utnrI
	nPZz6KuywyrqjsaYOH3M4bleYVSQFORdY4o/rlMneul7nm8bLyrBUHotngBy9U8t16gNwWX4qfmhN
	Ere44pa5RcY55bXvG8xHqRoxYxhDRqFebWIqoGbxH92sYyDzT+PtDml14+g6vDzdc8aZf4DiQWgaz
	/9Lb7SQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmQm-0000000DfOA-1yKJ;
	Wed, 19 Feb 2025 15:56:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tklLG-0000000DMK7-2dvI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Feb 2025 14:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S1cyu4qLCW+G5IS8eMs/nlDOlaE0XI3DusDqdVY92os=; b=SN2aC96RoBTOAg49+w+VQLrQ09
	Op+F6msNc556ma0Vn+lpnkeYOzT81vBXuEAW4sNj5gg4AcjTxyzqzDWHxN7scEES8tywuO7a+OmcV
	8jDpaGJ8G5Yorjc7QvuM6D8514j6cqGf+mEBz8Fn/I5S2R7+zmlp944G+bRGE3TXgDuGFjiuKkXhB
	k/Otn9uDAjRe5NtjslsGNPDIyrfInRDN+H+MauCU+375bYCdKQu3XOSJPMJRrdURAHt2uyZv2zLN4
	A+n3vhukAgSLj7OqWYMQJKeISdlEDffSypWau0i8Adu68yKz+cxgeigASQipiZn6zPsVL6+eiAtHW
	t8JFdoIQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tklLD-00000002CpS-3LfK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 14:46:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9499C202C;
	Wed, 19 Feb 2025 06:46:41 -0800 (PST)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 40E293F59E;
	Wed, 19 Feb 2025 06:46:20 -0800 (PST)
From: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
To: ryan.roberts@arm.com,
	yang@os.amperecomputing.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	broonie@kernel.org,
	mark.rutland@arm.com,
	james.morse@arm.com,
	yangyicong@hisilicon.com,
	robin.murphy@arm.com,
	anshuman.khandual@arm.com,
	maz@kernel.org,
	liaochang1@huawei.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	baohua@kernel.org,
	ioworker0@gmail.com,
	oliver.upton@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Miko=C5=82aj=20Lenczewski?= <miko.lenczewski@arm.com>
Subject: [PATCH v1 3/3] arm64/mm: Elide tlbi in contpte_convert() under BBML2
Date: Wed, 19 Feb 2025 14:38:40 +0000
Message-ID: <20250219143837.44277-7-miko.lenczewski@arm.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250219143837.44277-3-miko.lenczewski@arm.com>
References: <20250219143837.44277-3-miko.lenczewski@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_144624_026805_56A716AE 
X-CRM114-Status: UNSURE (   7.95  )
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

If we support bbml2 without conflict aborts, we can avoid the final
flush and have hardware manage the tlb entries for us. Avoiding flushes
is a win.

Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
---
 arch/arm64/mm/contpte.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index e26e8f8cfb9b..26a86248f897 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -72,9 +72,6 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
 		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
 
 	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
-
-	if (system_supports_bbml2_noconflict())
-		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
 }
 
 void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
-- 
2.45.3


