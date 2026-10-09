Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E67CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 15:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Elt82oVIJIDR2UH2RaIC/yk8bP6X4zNjSmosDoHpGoA=; b=HAQuddEcGtrB3ZIXVOV4333NA2
	KY2ERtbw4HjMMMWTt+5VyQRXWguhfoegakWkqhwfcUza/TelorKT7EG/S4fFv/D2IV/7xuCPHq8C9
	rOoQEOrkWuopOj07SBTqDPN5awx3/jVTq1MRCnWWCH2CTphJO6uKaxj/pu9utgytlXuDL+fY+VTdK
	cxWjZ8RchkQTsTZZmuneLK/jpxHwBxdDBji0PVJW2ITu9OhDnj+dZBv8zwS2caCRHy5XXm3PTFj4F
	75l9XPSu8P4UIAa7wEEVRUE3m/WlnTS3VjY1JOZVZS2tLJCzR1Or/TXpmOPfgCeUS3A1buizeRf0b
	cbBcsBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCKP-00000006WRm-16ol;
	Fri, 09 Oct 2026 15:16:09 +0000
Received: from mail-ed1-x545.google.com ([2a00:1450:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFCKM-00000006WRQ-3onz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 15:16:08 +0000
Received: by mail-ed1-x545.google.com with SMTP id 4fb4d7f45d1cf-6ae14ecef5fso5885838a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 08:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791558963; x=1792163763; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Elt82oVIJIDR2UH2RaIC/yk8bP6X4zNjSmosDoHpGoA=;
        b=Q6Saz9ngXbh+Jxv/cukxpjgUxime1RKI9acEEQo3AlucUIK5pXv4aO//BygAO3Xmnw
         UrcILr33eYcbXiD1vwGed2JUK+wvgP1AcyOgNaFoumKfQ12u1HOZQaZ2PcOArGn/Qa7K
         of83HFv9JvEPODSVgzBRytcbyNCi+cXIOerG/PzTzrIRJWRyM6ZPHzqEEpOyJpM2dN4q
         58gUZSRtGFbL5NsKlcU8C+iZiAkIJcgyL454TMP+5QK2bLvdwOr//27xRCJnaISubwkY
         7SrFGB/z3Dw0m5Wi15mHRvT8eNvQNVl39u4kUKlGCcFkhptmgXdQJYQ4mlmrL8QG/9pw
         hGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791558963; x=1792163763;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Elt82oVIJIDR2UH2RaIC/yk8bP6X4zNjSmosDoHpGoA=;
        b=WMOSkuvxGsq/UotRV2C6qDrlnb/C8AgGFPbh94Iyq7hQyiHU4Z4QBGLrDyTeThkjuR
         vFMF1nig+lWDtEdi44NaDG6cR4AqCpdd24lrJCj0+3bylxeCKYtQgBoJjDG8KPmpymYt
         0ATE/TfpZ1BTe+FCD2hfRDr6+o9S5GSQx7BYQs4GaN8pFq5pPXgoN7SystSEu8Y32qFN
         oahjsMFbxsrXJyOBbe+rVQaQaK/eI0u9HwzqY3mwOUyWhkJXWnJo3LZp50+XWaYwl2Me
         auASMJ9Jow+Ato2qhUlGa+qPl81rIR5La46oCIXi6ha9MNXQy4XNJ60yYLBHkPE7g0/r
         1gLA==
X-Gm-Message-State: AFq9FYI09BGwA2zB/YAHHHFjVm0k7UsJyCLaSfEDATItzss3svH9dVJK
	gB5G445iv1hz98CZe8frFGfHN2fzWJzRWB+5vrKv1P3HzhTobUP7eCRxPlkQ7dqtUtQ+u9HQzA=
	=
X-Received: from edxs24.prod.google.com ([2002:a05:6402:1658:b0:6ac:c30e:4ee2])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:4582:b0:6af:dc52:3639
 with SMTP id 4fb4d7f45d1cf-6b17c27f1a8mr1833622a12.40.1791558963095; Fri, 09
 Oct 2026 08:16:03 -0700 (PDT)
Date: Fri,  9 Oct 2026 17:16:01 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261009151600.351766-2-ardb+git@google.com>
Subject: [PATCH] arm64/efi: Clear PTE_WRITE when applying EFI_MEMORY_RO
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, 
	will@kernel.org, catalin.marinas@arm.com, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_081606_963712_6AB2335C 
X-CRM114-Status: GOOD (  13.87  )
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

From: Ard Biesheuvel <ardb@kernel.org>

set_permissions() sets PTE_RDONLY for regions that the Memory Attributes
Table describes as read-only, but leaves PTE_WRITE set.  PTE_WRITE is
the DBM bit, so when hardware dirty state management is enabled
(TCR_EL1.HD), such a descriptor is writable-clean rather than read-only,
and a write by the firmware will be permitted by the hardware (which
marks the entry dirty) instead of faulting.

Clear PTE_WRITE as well, as pte_wrprotect() does.

Cc: <stable@vger.kernel.org>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/efi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index 0ec90fd1754e..6f34aef3d04e 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -117,8 +117,14 @@ static int __init set_permissions(pte_t *ptep, unsigned long addr, void *data)
 	const efi_memory_desc_t *md = spd->md;
 	pte_t pte = __ptep_get(ptep);
 
+	/*
+	 * Clear PTE_WRITE as well: it doubles as the DBM bit, and leaving it
+	 * set would permit the hardware to make the mapping writable again
+	 * when TCR_EL1.HD is set.
+	 */
 	if (md->attribute & EFI_MEMORY_RO)
-		pte = set_pte_bit(pte, __pgprot(PTE_RDONLY));
+		pte = set_pte_bit(clear_pte_bit(pte, __pgprot(PTE_WRITE)),
+				  __pgprot(PTE_RDONLY));
 	if (md->attribute & EFI_MEMORY_XP)
 		pte = set_pte_bit(pte, __pgprot(PTE_PXN));
 	else if (system_supports_bti_kernel() && spd->has_bti)
-- 
2.56.0.385.gd3acb90ef8-goog


