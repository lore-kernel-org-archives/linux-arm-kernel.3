Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE5FCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeoRdqb2W8o2rKYS6Num15n8gkt/ODkSyZpzjjpRQD8=; b=O9QIvy2sUW3n7RF1oxnRJA+xmN
	6DgNySNdPOQ8c2HaQXgwMoxwa0rIFeYJm0NmJEM/2W0ecM8fAykOjB0ZY9TfUw6icg96lj2ZG05M6
	Wip/Gvdzf4rh6oQiH3oKGReR0Hp/tNUR/aT3MMNOnR0LqGDmURQ5TgMYTOLO65UuMOrgX0JlOsww6
	Z4TjT0YbbIJYpzzMBS38sObJr39vNZRmb2NaS2oU7t0Ns5w6GFxaO5j8v8vFhzCkMffmtO1WBuuLf
	3L/XVu8SxCxLtDKiOeLXdEllqY40a0FM6y0J1oKn8iksWgg7QKrip8YrYbfnv+K2yJkso2cdcMib5
	HB4/yHHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZX-00000002LdH-2XxH;
	Tue, 26 May 2026 15:19:59 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtZQ-00000002LYL-32nN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:19:53 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-688066440a5so6789275a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779808790; x=1780413590; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UeoRdqb2W8o2rKYS6Num15n8gkt/ODkSyZpzjjpRQD8=;
        b=DbA2VF1Qj9aduibI50nSxLYqHdCwjb55FKfhjEwMlE0tlkZTVuQ81gKpTi2o7A0iqL
         hqAQkEePEiAtjAVmKvO/CcIVf6NIgE9nI5bv6nulyTpJaijTW577DuqxeWaKnGscrDSP
         oKF05lR+7uZXVMtzP76kh0UYNeHDnt+CrP5xuHcj84KpEFAOTyGQnYXSyKUVtdZBU8nE
         2gRxJqLfj+bPqxy/4jbxHPFYApKhAvIr7oeMwV1b56qcs+DzNvv9VBDi8P0/1GmeRH6V
         HWYZ6CZtxYHtlAKSF+SNLd1kSYag9hEpu7wINPH0eOauPhpXHOA57ibepsULp8Ex1sbk
         PgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808790; x=1780413590;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UeoRdqb2W8o2rKYS6Num15n8gkt/ODkSyZpzjjpRQD8=;
        b=fOylYf+9+m1DKiSk+lU7N6Em/GnU/GAhr5xGHA3PJ7tmyXR1Jb/ZMfgGupyoWiIrcN
         X3WfhcWrls0vdCfVjWOKMHsZtoDlYY+eucgSZG93p2bo/pdcWWS/wrnvyG/eILE78YTY
         0bhU4kRMu4xBdyZti5Y7lrvVBSex/5APp/uCB3nnpDUgKFCRKeqNhO+gVMr4+jeCkjc0
         ND9l/iFzidUP73QmFus7vesdnH3eD4/ALmdZFr2Q2HzfjpiniLBWmtev7W8UbmuGrP5s
         ukvuKTJWl7eo0BupVGpa0GgvrDYSPRbudkYMQkmsDpa2W+E/ZkMYa2ULVlTHi+42NZef
         sIZA==
X-Forwarded-Encrypted: i=1; AFNElJ+n1oFDhHNoPsJpcXFZXfxSf0IgPrQBHqqRN/OpRcVFCq9WG1L2pfOklNxCgLIlBiEdkKg+NhvYUmHoD3KAYIDv@lists.infradead.org
X-Gm-Message-State: AOJu0YztPS0qMGDMTGOx2OpFqd5rGF3aaAnrbq4ZUhFfRZryCsIUdLFt
	rogC5glimnvcC5X4tcVKrONHRerlrL5UtzUfgeXZXn+VmwAaheqBoyjWOsGW/Ef9+g0jbShdJOt
	I1DpTivIxUU7uXg==
X-Received: from edbcr16.prod.google.com ([2002:a05:6402:2230:b0:687:17de:d8b5])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5107:b0:67e:96a8:40d0 with SMTP id 4fb4d7f45d1cf-6889cc429a0mr6652238a12.21.1779808790002;
 Tue, 26 May 2026 08:19:50 -0700 (PDT)
Date: Tue, 26 May 2026 15:19:32 +0000
In-Reply-To: <20260526151934.3783707-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260526151934.3783707-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526151934.3783707-5-smostafa@google.com>
Subject: [PATCH v5 4/6] KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_081952_770184_94C440F0 
X-CRM114-Status: GOOD (  15.38  )
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

Sashiko (locally) reports out of bound write possiblity if SPMD
returns an invalid data.

While SPMD is considered trusted, pKVM does some basic checks,
for offset to be less than or equal len.

However, that is incorrect as even if the offset is smaller than
len pKVM can still access out of bound memory in the next
ffa_host_unshare_ranges().

Split this check into 2:
1- Check that the fixed portion of the descriptor fits.
2- After getting reg, check the variable array size addr_range_cnt
   fits.

Also, drop the WARN_ONs as that will panic the kernel and in the
next checks there are no WARNs, so that makes it consistent.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..b6cf9ad82e12 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -607,8 +607,8 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	 * check that we end up with something that doesn't look _completely_
 	 * bogus.
 	 */
-	if (WARN_ON(offset > len ||
-		    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)) {
+	if (offset + CONSTITUENTS_OFFSET(0) > len ||
+	    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE) {
 		ret = FFA_RET_ABORTED;
 		ffa_rx_release(res);
 		goto out_unlock;
@@ -641,6 +641,11 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 		goto out_unlock;
 
 	reg = (void *)buf + offset;
+	if (offset + CONSTITUENTS_OFFSET(reg->addr_range_cnt) > len) {
+		ret = FFA_RET_ABORTED;
+		goto out_unlock;
+	}
+
 	/* If the SPMD was happy, then we should be too. */
 	WARN_ON(ffa_host_unshare_ranges(reg->constituents,
 					reg->addr_range_cnt));
-- 
2.54.0.746.g67dd491aae-goog


