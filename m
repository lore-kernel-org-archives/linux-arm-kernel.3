Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD263F0183E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrle6LcPHnpw57JFxD6jZW7nwqfyHVVEsUa7FBi+veg=; b=OjTGFQmolz6E/+uBkaRwWPgIel
	iTRnXXhNWcAosGFjLs0VKCFgiRSXq2A/4oDJYfn6//qb2zUHI73H/6oo3tdt4NMdgcXaEGxdLUJ8c
	L5VAXLCDlDarlJjOE2uF75lcGrUgm3Ef00+2My2+bU/SkhaVRVGUg+77Yzt7yDN1c99b7aI2KqCi5
	ofN8aUw+Cww9GkeAbZJmYHaDfYdZop+ANXGTT5cecleiOVUSSDo4kMat25pMSMlMe/eUVY2GGd4Zd
	kmsxgjW2iruHfPpOLnQ8UHwgFS0S24iA1lwwWF6OmzRP8zeJne3OW2lMjdSE0DFYlurZeAgxN4cF3
	EVGWlHnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVle-00000003qRT-2awy;
	Fri, 06 Mar 2026 14:03:02 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlS-00000003qCS-06S0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:52 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-661420734b7so3068417a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805768; x=1773410568; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nrle6LcPHnpw57JFxD6jZW7nwqfyHVVEsUa7FBi+veg=;
        b=Tp1h+KL7IOqgMqoygmPch/drHgnge5lHTzcDhXgXuEuEznW2mTjCCJsdteQAO5mVu7
         mRH+kcNkVGePiJ5XVttwJEvvucgZLgD05cC4+yvftuAfoic4Oz9h5kT5//u3p7DqQhMO
         n0+h3KNUd8CrNtLmKVijzwvw4zck7asIX3KomAasPuQOXvu+nbglPBHke9CbgHXBDvou
         ffKdKX3lqsYdirCYIv4mp3JBOmBtnGcSB70x8GK5qEFtaF8b+UkNndEFdp9g179oo1rN
         g9nbTeJkBXTfj/QycoCoHk0lcT/NJ3YNvFJDDP+x9WlBe7HSOqNh9fHOsJNzT7RKmBXR
         U7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805768; x=1773410568;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nrle6LcPHnpw57JFxD6jZW7nwqfyHVVEsUa7FBi+veg=;
        b=SbyX2BnWkzeYasdnxUV99Fl2YZ7s1s1igOztNWvF/uPrVlnE4krOurY4oStLR8m7X7
         bOsstwsxEP0LGokBJw4VCX82vdGQOhndE1ZosEDa6xPCtoEMEJIM2RVVZ239m2ETG49K
         gDvH5E6QUL4+Qgfh/ig/crwuJV3bAM9qGfscuxHz/Qbis7ScCUxAU1t2gN3ETQm9iy7n
         +jl7NLWxTi2VXXrVBKC4CbyA9HKuvcmhj3tNdX9qmBjUuB3uLfa01AaNSzZqd8sG1eIi
         uQf64LXLi+y77R196uGaMNNUVoIjoOMv0ISrB+wDt2R7kj4dFg51IcN/eCXKxQF+JZMz
         RL4g==
X-Forwarded-Encrypted: i=1; AJvYcCU0vjaKGzwA6VIppAvJggw6v145yRAsqYUYUbgy/ezkTD5QJOSydbjoiLn7HiszCzmYI/5X4RNQ1t5WwzqamMnb@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1Q4eDr8NTR6iiUxG+ZtMuk0ZoC/FlsWlo9UP71ntD7dh44Gsc
	hi1A2pF4jlELyAnTAXQk0SRuum1GGCFxNig4nlFpDZA3zQye2acHlEwtU0hA2nlwpv//ByrEU+I
	XXg==
X-Received: from edn26-n2.prod.google.com ([2002:a05:6402:a0da:20b0:661:18d5:ee37])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1d48:b0:65f:9c21:e68e
 with SMTP id 4fb4d7f45d1cf-6619d45a9f3mr1338158a12.5.1772805767541; Fri, 06
 Mar 2026 06:02:47 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:30 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-12-tabba@google.com>
Subject: [PATCH v1 11/13] KVM: arm64: Optimize early exit checks in kvm_s2_fault_pin_pfn()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060250_100246_0782FEE0 
X-CRM114-Status: GOOD (  11.35  )
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

Optimize the early exit checks in kvm_s2_fault_pin_pfn by grouping all
error responses under the generic is_error_noslot_pfn check first,
avoiding unnecessary branches in the hot path.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 2d6e749c1756..9265a7fc43f7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1791,12 +1791,13 @@ static int kvm_s2_fault_pin_pfn(struct kvm_s2_fault *fault)
 	fault->pfn = __kvm_faultin_pfn(fault->memslot, fault->gfn,
 				       fault->write_fault ? FOLL_WRITE : 0,
 				       &fault->writable, &fault->page);
-	if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
-		kvm_send_hwpoison_signal(fault->hva, __ffs(fault->vma_pagesize));
-		return 0;
-	}
-	if (is_error_noslot_pfn(fault->pfn))
+	if (unlikely(is_error_noslot_pfn(fault->pfn))) {
+		if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
+			kvm_send_hwpoison_signal(fault->hva, __ffs(fault->vma_pagesize));
+			return 0;
+		}
 		return -EFAULT;
+	}
 
 	return 1;
 }
-- 
2.53.0.473.g4a7958ca14-goog


