Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AB7CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKy2nPJ+cV4SO6crenI0U9khbA/AjfYfGtFJYOFvACc=; b=teAzinoWCY4sIWejIpFaSHRjrp
	A6AY2Q5HvYTU6zfuEQEBLItIA4xUgzLWGA6f8ACVeEwPcysDSmtzmIZkQDb19YHUkYe5Xnjsc4LkR
	JogAXSRJ4QmS6/IMb5mXYyXAm9WNfrT49KlS/J/8TtOp8Er5mtgYBfm9P1ySZFdeQ3zP9O0B2kkEK
	ITL4ThwQouWhL7b60FfBk+YkqFxHsyzlSv4gvh7XF0AS800opX9QF0oHeWOIRBWix8W5UGpb+/B0U
	HqzCa4ggsf/p4DXBDFnqk9CPbPcIeHvkr6uPwzJSWfuoUbDwgdObI0hwIlOr0mqCaGQVhM4kn40ho
	XrmXIYvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmT-00000004MCY-48K5;
	Wed, 27 May 2026 15:02:49 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmR-00000004M9O-3AEY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:02:48 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48fdad6cce4so59317475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779894165; x=1780498965; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKy2nPJ+cV4SO6crenI0U9khbA/AjfYfGtFJYOFvACc=;
        b=ks94umadlPt1N3zlulV1F8BKcd4fm2loBlc9QLYhgvyWaE7Kxh7PUwX8qqx9B/ty9/
         JHd98MZu7udOBwQzGBPGpyc8C2Fr/7vNLEV0Jf40feKxK9PalTem8IsEK0GG8vQ4eCfb
         eRtCcJRxXMPJ6HPGT8dp0NvwvqNZVWoS1MjGTeLHyLhYjWPqXuFgqyYenNpYz2mNH0IQ
         40c09rwUuAdKYP1zpH2Qtk1MyrURXm9V1MSRX92FQ4qHr+Mi7wJ4rD/xx2ndMBNcDT/1
         XYNz2pQWgldRYH1MCBB3xIfqGFUBpSQPJz69CheU0wrbVcN3fx6QhU0nEUQG34Sk5Tbf
         RUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894165; x=1780498965;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZKy2nPJ+cV4SO6crenI0U9khbA/AjfYfGtFJYOFvACc=;
        b=OmR8a1ZgwkZFLW/KH7inNbleAJx50+n2ofO8z8tCPg9aUKRSu6Bu5WpRaS5QsoEwLF
         pX8BxbgY924yjGmdPiaj6ePuxvyMiq9TUbmp/TOCLGtwrpwRHsl0oYCcuQ5+PexwHLMm
         OhfssrinIQorEMo1KgG0zVKOmO/Mjy8qW27PfUyWqAldf86LoK/a8SJzHZSNKN/FCY6O
         iNkKCOto919uV2dOZoBSOXTelQYDHWtKxO+WITBGBh+AYrO6X6JhOkyttwx5mGzZEM6e
         3KracTpjR+i7pjTOO/k3eFrsJlJfDDCczLmfHmHO5TPMUjMKEHSbooNoGEpzOrNXUNpz
         Tt4w==
X-Forwarded-Encrypted: i=1; AFNElJ9P+rBG+R7i8IFnCrKlnHesERI3gKZz9Nn/AamDSn/5pe3XAA6bnmA7vSn8nSzifByF8hCsBwi7wYyNWIU5/NTs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr6hX+U6WvP3HS8XxzNdr5Zs1RPvpmMRiOjLVB+6kio53h9oEr
	MTGqnd1YHfVBQrXhJA3x8vETIN+Pg9Z6Cg52ElNKDrsCPl5ecqkRPjXVHlYSgMUFk4yb1OSUnMD
	3lnDG2afxqFWlpg==
X-Received: from wmon5.prod.google.com ([2002:a05:600c:4645:b0:489:1b1b:132])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2a8b:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-4904226d9camr214273595e9.5.1779894165174;
 Wed, 27 May 2026 08:02:45 -0700 (PDT)
Date: Wed, 27 May 2026 15:02:34 +0000
In-Reply-To: <20260527150236.1978655-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260527150236.1978655-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260527150236.1978655-5-smostafa@google.com>
Subject: [PATCH v6 4/6] KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_080247_804650_6D46DD24 
X-CRM114-Status: GOOD (  15.71  )
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

Fixes: 0a9f15fd5674 ("KVM: arm64: pkvm: Add support for fragmented FF-A descriptors")
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


