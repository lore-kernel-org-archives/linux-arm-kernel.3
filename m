Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB78CF0183C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 14:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPUDEvHAsE2et1uSdvC7qqWK/vawe6dJIioQ+SXcGgU=; b=3BIArK5m7TQuZKDmH3YrkSq2x4
	7P467ZTf5FTZzMwX7qTZ192L7Y63eLptimDBsZOf2KsX+wUJLG+8UnYa/X0s8le7rGSmY65LIrjpV
	ur6mOGkEDP2klz3fT6mkgi+pl61YgTMOpreROjETqvbxg9pAG6kdm1EHoOM1znrv8RgdCKktTTSCB
	AHxmG27TWlBtW1wDsj2dtfL7X3kX9dBSlnR4rBw7rbseG1bo4yldJCYE7D2+KkbKx6s2Ya77JWVFb
	tJgn/PdKDNSJkyo5LVnB/D3x7g4y1u9ZEjEm9hpqynbEl2eF5GkaCWGYQ0cDfoG6x9IM88kyuw4Ey
	eLjkLvKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVld-00000003qQ2-39YG;
	Fri, 06 Mar 2026 14:03:01 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVlP-00000003q9a-1Ybc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 14:02:48 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b8fa57213c7so585716366b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 06:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772805765; x=1773410565; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YPUDEvHAsE2et1uSdvC7qqWK/vawe6dJIioQ+SXcGgU=;
        b=pgiLlYav0Rjg2Fiay/+Ut0bvNo6VVxS4elcLyi7doGwBeKVO6pAQbtqV0cWrWr2fy1
         /nU7ihX6rPYDwWh4QCqvZYuY0pZICNJbrzE6YbTtvzTYfJivELi1gTabd8IwBA3kRx5E
         MKktqmvtyxVzTt8wotqi9D76Ap4SVGZwykqoLE9TRuhYFvhAMdZUAsyahVh4+arDqtnU
         R9tmh1tnPzbsZBt8qLiLMeP9a3hS3HoULZrBZwr+fzn3xxoNd86YlzGFeUxhoZ6z1ncj
         aiNMYnZy6NlTQQQvk1hF3zWt9JxlHFSGFbwMJSrlH9bCzyI8lb/s+3fDvMuWsymcs3ga
         V/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805765; x=1773410565;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPUDEvHAsE2et1uSdvC7qqWK/vawe6dJIioQ+SXcGgU=;
        b=psxmpdF6i8KE/2Go+hnxU4SBdW/E7F6RPCYU0rt1C24iwWIgB27hsZ0vgVRHYhcwTk
         ooCoWvxNy/fZTIw0Xd7iLqpqIyUZ99xmRqTdjue1MOw7t3JPMlr/ZKKwgQgHpf0B5cGF
         fjuaf/YAXV1xQUrD3ri/Z/KJL8ZNbRW8wuZE3DLZfflTFRjSj0wCBjWB3R7z7K7aiF0n
         bHjIRzPhDP23mxd7Di7jjCL1x42OUUkGLVaG1WiGGEnYbF5j7pNfHdF4G7dsGEzGQi8P
         kxbWWR08PJHST+miqIoYuZSyHP7TC69vyX5Odf4PJef6kXvLztJbr4+EloLFqCRmftDW
         sB0w==
X-Forwarded-Encrypted: i=1; AJvYcCUoAJApd5DstLJAEpXsElbutBV4M2k3//BIiLAN0cnousTseaCbg24OX+mccDubSYfYJrAnYArEXNBYTmJ7vFtv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8fOAjdKYkSRDGskWYGqBvav7S7c5ISPNi7lanE7HarBduM25Q
	Mb1USeC02RUrwpiabN/JdPjNkxLbag6cD/HJ1VZ8Ac1St8Ds8jPQ5A1jUMMztx1SJa1iKr0H551
	hcQ==
X-Received: from edqe20.prod.google.com ([2002:a50:fb94:0:b0:660:bf3b:b289])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1e8e:b0:65c:209e:32c4
 with SMTP id 4fb4d7f45d1cf-6619d51fd74mr1077641a12.20.1772805764944; Fri, 06
 Mar 2026 06:02:44 -0800 (PST)
Date: Fri,  6 Mar 2026 14:02:28 +0000
In-Reply-To: <20260306140232.2193802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260306140232.2193802-1-tabba@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260306140232.2193802-10-tabba@google.com>
Subject: [PATCH v1 09/13] KVM: arm64: Simplify return logic in user_mem_abort()
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_060247_442723_1DD923FC 
X-CRM114-Status: GOOD (  12.73  )
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

With the refactoring done, the final return block of user_mem_abort()
can be tidied up a bit more.

Clean up the trailing edge by dropping the unnecessary assignment,
collapsing the return evaluation for kvm_s2_fault_compute_prot(), and
tail calling kvm_s2_fault_map() directly.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 01f4f4bee155..35bcacba5800 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2005,22 +2005,13 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (ret != 1)
 		return ret;
 
-	ret = 0;
-
 	ret = kvm_s2_fault_compute_prot(fault);
-	if (ret == 1) {
-		ret = 1; /* fault injected */
-		goto out_put_page;
+	if (ret) {
+		kvm_release_page_unused(fault->page);
+		return ret;
 	}
-	if (ret)
-		goto out_put_page;
 
-	ret = kvm_s2_fault_map(fault, memcache);
-	return ret;
-
-out_put_page:
-	kvm_release_page_unused(fault->page);
-	return ret;
+	return kvm_s2_fault_map(fault, memcache);
 }
 
 /* Resolve the access fault by making the page young again. */
-- 
2.53.0.473.g4a7958ca14-goog


