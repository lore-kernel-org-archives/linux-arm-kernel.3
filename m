Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4667CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 20:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5sFw8Sj0s1wSBlDG0qQA5R+qSlafViNaiQqa98n5zM=; b=TCSg3NrXyshNhL2T/xhLJtSwx7
	B75joLCa3GcnWdZCB6WWH+SHFj3DCKMnu5oGCxpQ/S0SMMBca277cjobc+nlXgJ7u/aUVDza2kfRn
	3ng0zz6F37fGPkbwHNfVgFW3cf2NFlcsBiEJQSqDOiYiT/F1Ynp2YJ5Ww3OnPFbSXDZvdMU8pATEf
	sLJG0BPFnJ3b8UFdJuBwGfvaytGxLQRJBhjqVmuFxH5YhcDOFUZaOCDG68oTwxLOYEh/QQvOR1wE5
	ajS08nAq7DMVb4/3ok9NobdfsFGyhFITB7tPS762SFjYIgMA99QaA963uuKn4SO3QUZ+5oIjiQh70
	tEHvHzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnri-00000005lMu-2QEV;
	Wed, 20 May 2026 20:50:06 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPnrb-00000005lI2-24MW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 20:50:00 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48e89faa62eso32350205e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779310198; x=1779914998; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5sFw8Sj0s1wSBlDG0qQA5R+qSlafViNaiQqa98n5zM=;
        b=Ncj59Lp4g4Piz+Ziigq3Vse8mthqhTZthTofXaQFutrhooOdWVwx+FPXG7y5FlIEAU
         PWX/NyY3vwa/kFRIg76Ae8YOaC/7Xu/+jc9/SnXUgP1YC5ryYgeNr9+QTeLZ2eNmMO8n
         sGwgSu/ym8zwv0ZePMIPyJ4p9acqrwkv5dBa658HKr3F+XChJYRy8SnNBJ7zvqMXgA5S
         IOlUc7IxEWkX6Ag0pznslgMlocOcrq/xjilAXdB/NfCS4oct/4RYQnDPUqSaQ5PnXUo2
         r/kXAuOCmjgbrrFvhUfDojDy+kXreRVfQ3c3/dknD+WoRo85hrVsLxt5mowQ8q3POycm
         ky6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310198; x=1779914998;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J5sFw8Sj0s1wSBlDG0qQA5R+qSlafViNaiQqa98n5zM=;
        b=Pgx62rvqJRMV0IaxTDg+4oQGaoy9+ouLqnHsNl3FpMS/iaoZa+FqvoQxhs9JWvaC3Y
         w+hvDaa9jzNDKMhMQKOTRWYzM0raHW0PrJasiReQO+4CkKdM8552GzFSV8AZ5boQnKfi
         FgcLeJIjsK3uFLrgTNt/vlkUx1fhjr7uDG9UR0w9qVmUtQqIT0x91og+EylNvippJSih
         I2geWA41cxQqDMicuaNezQYtTN8rLUgbwSD8B2wdv2H7IkirPq334QO4jJqEiBYSVuKz
         QeP4XguxZ8IOVqX4BZPDMaFslYqe74mehUbJWv+vrXxyb7ZLsj6IeSl5ljBFwUEBPXK+
         lkYQ==
X-Forwarded-Encrypted: i=1; AFNElJ89ZrXIIrLFpC1SDAQy+Ig75W16ECa7VJj7yxGWs61fuyAxwdG1Z2ZhBtOiyusQ0yQrMCH64LQR7beLXyCTwWDN@lists.infradead.org
X-Gm-Message-State: AOJu0YyEkr2kznjbykuGWuSOhuSg13m0IbCwuH29JFSNoW6h6rONnuGG
	mJXDzUSHGCgLg1b36pND85GkeYc3ssDash/wXTziWCQXIUjmcqABevkxIwlRiH9K16xr3l/CgJH
	CCeNnPoxkpAGmlg==
X-Received: from wmlf11.prod.google.com ([2002:a7b:c8cb:0:b0:488:c011:ff58])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8189:b0:48e:89f9:9408 with SMTP id 5b1f17b1804b1-48fe632374fmr370978765e9.20.1779310197436;
 Wed, 20 May 2026 13:49:57 -0700 (PDT)
Date: Wed, 20 May 2026 20:49:47 +0000
In-Reply-To: <20260520204948.2440882-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260520204948.2440882-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.669.g59709faab0-goog
Message-ID: <20260520204948.2440882-5-smostafa@google.com>
Subject: [PATCH v4 4/5] KVM: arm64: Fix bounds checking in do_ffa_mem_reclaim()
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_134959_561987_25E290AE 
X-CRM114-Status: GOOD (  14.67  )
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

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index 1af722771178..e6aa2bfa63b1 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -607,7 +607,7 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 	 * check that we end up with something that doesn't look _completely_
 	 * bogus.
 	 */
-	if (WARN_ON(offset > len ||
+	if (WARN_ON(offset + CONSTITUENTS_OFFSET(0) > len ||
 		    fraglen > KVM_FFA_MBOX_NR_PAGES * PAGE_SIZE)) {
 		ret = FFA_RET_ABORTED;
 		ffa_rx_release(res);
@@ -641,6 +641,11 @@ static void do_ffa_mem_reclaim(struct arm_smccc_1_2_regs *res,
 		goto out_unlock;
 
 	reg = (void *)buf + offset;
+	if (WARN_ON(offset + CONSTITUENTS_OFFSET(reg->addr_range_cnt) > len)) {
+		ret = FFA_RET_ABORTED;
+		goto out_unlock;
+	}
+
 	/* If the SPMD was happy, then we should be too. */
 	WARN_ON(ffa_host_unshare_ranges(reg->constituents,
 					reg->addr_range_cnt));
-- 
2.54.0.669.g59709faab0-goog


