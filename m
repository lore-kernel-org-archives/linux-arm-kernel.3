Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54153C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 01:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VZeubaZqe8i/GzWhFkMo7SOtFo8/XN71Pnvz46i5xvA=; b=eppAYs42VSIUvmPfz/MfjGcUtQ
	vOtOtAfDajGjLWfmhBp/s+3ke9ovHuJBxssYkuNet73w4Xg2CFutC5k1oPmhhiCPmlMRdyFU5rWae
	09qfMuUuHG6myZAMsZSNjXcdVWSoNO9WTy0SNTneJ3jgvqGCqoQpkpozlgcTj3ix/rNVjxfDZ34NS
	MNi3Z4JdJ+CJ/HPSfMstPz1wO/WExktxhZq0DlQ3LV1TAvZqyw3uDZT5HNUOrc8zzJVMsH2ZtV2fR
	uS8UyLSIp9EHFgWeSys13fp5uvcLS8HHWiP/+F/W73Q0Yrv3lal4krrSN1TvOBjBUXv6Bl/NrAqjN
	CEQ61b6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qYC-0000000FgCA-0BXR;
	Fri, 11 Sep 2026 01:59:36 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qY7-0000000FgBF-3H2Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 01:59:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4hgyQR6MWFzKHMP3
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:59:11 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 60E774056B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 09:59:17 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP1 (Coremail) with UTF8SMTPSA id cCh0CgDHrwpnYKNqFM8VBg--.41007S4;
	Fri, 11 Sep 2026 09:59:17 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: anshuman.khandual@arm.com,
	gshan@redhat.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	suzuki.poulose@arm.com
Cc: zengheng4@huawei.com,
	linux-kernel@vger.kernel.org,
	wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] arm64: io: Reject non-user protection in ioremap_prot()
Date: Fri, 11 Sep 2026 09:58:59 +0800
Message-ID: <20260911015859.71164-1-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgDHrwpnYKNqFM8VBg--.41007S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww17Kry3ZFWkWr15Ar4xWFg_yoW8Zw15pF
	n09w1rWrZ5WF10yrWkJr929F15ua1fG3yvqw18Xr1jv3WjqF48tFWxWFy5ury8CrZ2yw48
	Wr4Ig3s8XFyjyFUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
	kF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
	x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
	CaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28I
	cxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
	IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
	42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
	IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
	aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU17KsUUUUUU==
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_185932_192236_E2FCAFAB 
X-CRM114-Status: GOOD (  12.13  )
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

From: Zeng Heng <zengheng4@huawei.com>

Mapping a stack-top page via /dev/mem with PROT_NONE and then
reading that process's /proc/<pid>/cmdline triggers a spurious WARN
in ioremap_prot() through generic_access_phys():

  WARNING: ./arch/arm64/include/asm/io.h:275 at generic_access_phys
  Call trace:
    generic_access_phys+0x1c8/0x228 (P)
    __access_remote_vm+0x2b4/0x398
    access_remote_vm+0x14/0x30
    get_mm_cmdline+0xf8/0x2a0
    proc_pid_cmdline_read+0x68/0x120

generic_access_phys() passes the protection derived from the user PTE
to ioremap_prot(). On arm64, a PROT_NONE mapping is represented by a
present-invalid PTE, so pte_present() still returns true and the
protection reaches ioremap_prot().

A PROT_NONE mapping does not have PTE_USER, causing the existing
WARN_ON_ONCE() in ioremap_prot() to fire even though this is a valid
user mapping. Execute-only mappings have the same issue and must not
be readable through this path either.

ioremap_prot() should therefore reject protection values without
PTE_USER without warning. This makes the access fail cleanly for
PROT_NONE and execute-only mappings while retaining the existing
user-protection contract.

Fixes: 8f098037139b ("arm64: io: Extract user memory type in ioremap_prot()")
Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 arch/arm64/include/asm/io.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 21c8e400107c..31e67f6bd4a7 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -272,7 +272,8 @@ static inline void __iomem *ioremap_prot(phys_addr_t phys, size_t size,
 	pgprot_t prot;
 	ptval_t user_prot_val = pgprot_val(user_prot);
 
-	if (WARN_ON_ONCE(!(user_prot_val & PTE_USER)))
+	/* Reject PROT_NONE and exec-only */
+	if (!(user_prot_val & PTE_USER))
 		return NULL;
 
 	prot = __pgprot_modify(PAGE_KERNEL, PTE_ATTRINDX_MASK,
-- 
2.43.0


