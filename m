Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5C8CD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I12sMqC6/04DUeHmMWlOOJ5aYC5HrERy4a3xEEa3sfM=; b=J7hjq868iMQ9rxVFeH7+OkIwsO
	p6lSerZXyWK5/6rUNVuoKFVxmq+DOosp67YbwBqRL41b2kbCGQEqMmbNzA2rIr9xsD58spDi61H9p
	+vCpYNlOMpAxaG7CE3ILsS0U9XchL+ndSQ5nzBew7OlQQ0xcNOXPaQR64q546OYJ6PP6cO4mRgEcv
	ybW2b7A6bNX3UY0O4E5XTCnulDNzyDRDfLqSJac78MC3SO4GVQ5QXlKyU/JSDiQ0I70tyv/+OdbHV
	sKgo3ZtKEghsyxSxWinhSKNHyZEVbBglImqV1u/utIo7yFGPlnwIdEtDEq/7Fjjf6ss79Afz0iSs/
	c4EmYqEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW96u-0000000297s-13O9;
	Sun, 07 Jun 2026 08:44:00 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW96s-0000000297A-1Yz0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 08:43:59 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c8584bbbf2cso2196800a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 01:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780821837; x=1781426637; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I12sMqC6/04DUeHmMWlOOJ5aYC5HrERy4a3xEEa3sfM=;
        b=elnBsA0IW+Ec1UMMMN/8H5BHc8MosVDXdMTTxaF3gtAxGBcvVoHHIBED8lJsWBBkzf
         fCiFIqxDBYoYMV7Z2Uhorw/SwlaLAfl03wgizedZXDgUfCX8LXr6kS6UgEBhp5Fam9K0
         mYNirunx9k289hC02mt/hwpiHmGoORYOzfJ7E5ajuE6s83eFHBbsNwwjOoTu2KaNRtMw
         vlNF/VSMAD/dM7st1BOLfaA3LmVToQjZ9WBfkoHhjvK7o/wD9DTkGF6FPZlmPuzM/q0s
         2xFXND4YR5wnFdOF7mWPKqkfDLFKaKsOBXAx9bdjm4Tbp86CHGRk/rgkto6oU7NSJS5e
         LCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780821837; x=1781426637;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I12sMqC6/04DUeHmMWlOOJ5aYC5HrERy4a3xEEa3sfM=;
        b=oTH8IDIsDAzlkVZOn6bCyKumg0GkTE+RBoXNvN8ThtEHs23XdSlkgMbG/uPFvxwWqE
         /LnSZZx3SMy3hcL9wA0cXEd3ULa232DlnleKzP6XxItOTng9vzweK66fKEPzEtaLiqvQ
         c7mQ4FlFVPVQioN9pmIFjKtQjLIyGWBPKt+SHGWVWaVrh33MGZxN16l+t1YEiz7KZOJL
         oQDsI2X11RR15oGFENpNonl5Pp5SANnQ+0DnTZxuD8R4lTmV48bdoUqhHdoHZMjuwMHb
         5tFDw+IDhOo0FUM3jKIcgKSMAuaLXX83EAIl5Vl4+T5WdCzKQ4HcSoey+0RprATcyfT6
         +JRA==
X-Gm-Message-State: AOJu0Yz07f8lFzTxpMF7Ck1SnsiuZAq5c9Tb8PNTfTgp7bcL/8jQOMIi
	sRmlgJvcl5EwqLjsaniACAIZez4vM5X2TvV2Qhls8MstKRi8ccyWAN+k
X-Gm-Gg: Acq92OG/Cqp7Gvjhr8hlCBkG7UCOXoC76eFX5vtFxiPzokJlQ0TdC0+EHP6YReGTk3X
	akpSSnHQAmXjlhaMEjHsXbF8mOo4YygUtTa9HarGFzDY0ZYH95eMrnIEI87NIjqvfUMBzZldXXM
	DdMl8SGhdIspgDbcTBZRXOdWpHbQjNddiBzYYbT2VgTk6UI0SsiOxOSvfhMp967tMOqL/+/opw3
	cdts7Jzy4OUi/hDFxnNN94Fiy7PcCCU5J0B5P544q9dEU/X7fisE7v3Ga400zmvjj9tGBZrOxBY
	lx03dElWUj2xGK61cxD09XNqHtoOeJDknBm0jJ4yp7ONbgSnIgZDhGY/lsH/5q6AoFXPkk9laow
	eLBqV2zahsdzo3O3nMYX9adjZOgjlq/7QOf/9z26ag8KfwPuhHepWGz+/zd2YoTV6Fq8xvbDo5r
	VMfAyakOil9pwAWWBPay3pHKVxXNuB3Rb4i6KOEzJoNXK5xde7dK1u0Q==
X-Received: by 2002:a05:6a21:4d92:b0:3b4:6c68:b100 with SMTP id adf61e73a8af0-3b4ccdb61f6mr12356449637.19.1780821837181;
        Sun, 07 Jun 2026 01:43:57 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm12177119a12.0.2026.06.07.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:43:56 -0700 (PDT)
Date: Sun, 7 Jun 2026 17:43:53 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH] KVM: arm64: nv: Skip vCPUs without a pseudo-TLB in
 invalidate_vncr_va()
Message-ID: <aiUvSbrWndQeUPc8@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_014358_415220_29605241 
X-CRM114-Status: GOOD (  11.83  )
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

vncr_tlb is not allocated before a vCPU runs for the first time, so
vcpu->arch.vncr_tlb is NULL for a vCPU that has been created but not yet
run. Code that iterates over every vCPU's pseudo-TLB must skip those.

invalidate_vncr_va() iterates over the vCPUs with kvm_for_each_vcpu() and
dereferences vt->valid without checking whether vncr_tlb is NULL.

While iterating, skip vCPUs whose pseudo-TLB has not been allocated.

Fixes: 4ffa72ad8f37 ("KVM: arm64: nv: Add S1 TLB invalidation primitive for VNCR_EL2")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/nested.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 6f7bc9a9992e..063e079d1d1a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -969,6 +969,10 @@ static void invalidate_vncr_va(struct kvm *kvm,
 		struct vncr_tlb *vt = vcpu->arch.vncr_tlb;
 		u64 va_start, va_end, va_size;
 
+		/* Skip vCPUs whose pseudo-TLB hasn't been allocated yet */
+		if (!vt)
+			continue;
+
 		if (!vt->valid)
 			continue;
 
-- 
2.43.0


