Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B92E7719D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOsYvpEfuP6cXx/Oyn2XcEqgX5/aUorsAa5EPXiB2Ss=; b=eriDtRphZ+OCmtDlLc1BRq3pF5
	miS8Goj8Euqq6KnrDWn8b9jEQL7ptmsgXA+Sx8pnTgw3tAxAYfj0zes2K4eVd53NMieTFwWCQjiNP
	+inHnPPRCp8ZSU1OdgisjB99CcfHOirWfIV+rhZTpZW8Y5e7kwBeH8KnrZQF9Ra7HXvzKz3CXrLYL
	6SMpVHJOJsxMgmlVxJKlQ2ceOao9mh5yqKEqXLQtL6V5/j6h137Zy4H1Yp2daQzzO5pM+Zn+B2mea
	iRTkz99/Fye5ynP4VqpY5LaKxW29Zm3LmDF9p3Q2eM+4B+ZZ2aItBg/jxhpNVz0drFufwnGCxeNd4
	tjraBjVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWE1j-0000000FFIu-3xzE;
	Fri, 10 Jan 2025 12:22:11 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWDzL-0000000FEhl-0kNz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 12:19:44 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-385e1339790so1257249f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 04:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736511581; x=1737116381; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KOsYvpEfuP6cXx/Oyn2XcEqgX5/aUorsAa5EPXiB2Ss=;
        b=ZG150OdnNG+2fxpWHKLQ7ZLO5ZL6VuE//p0e6twx7Go5IN90RlE4/Z+rK8k3oQ+Xry
         yb59lffsxKe/Il+WJKB8WojTDCiNrFIZyOQAORWI8x76j4ekhJAZsnJls6Tu79pn9ZXW
         y83K6VeZu5KdTad0k+MbQjy7JEH9D5lEbRYt2kWhGktVJz310pA0o69o14AgD5CIl3T3
         uAGnYJdh04rz12bJEeI18nJYmbcSRJs1ULjA37Q+Y1G7ixr8loPna76G46sT9Hn34NYy
         q9zsHzquwDTXPeBm60pcLMF5jhyJQkkcPSiNEfoF983Szlnvs+ijBXTva7Nnv7WeyoZ/
         rg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736511581; x=1737116381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOsYvpEfuP6cXx/Oyn2XcEqgX5/aUorsAa5EPXiB2Ss=;
        b=BuAaLQyFYw+IutjZN21LFAGPJQsuYAOiHIfJ/pWtbFmsHvyDHiy3HtOq8mY4b3H1t1
         lUPyQ6OusPmz0CpfkGABmAxnBXvcay5DXoNC/ANcR/xpBWcNDRcY03OOVIoRAjs2SSYj
         peYE8OsopY43MKJM1ZFOQMrZ4lxizX1nMjrU9iM9cHH7Njrdpcpj+3p4elwmbmqyyeJT
         9zUDyXfZhSLWCDB1/NHNLpSZReAcB9WKCpiATaLUjV9XrTXH/uXbrMUJp+J7OIdeys5N
         8tG9kQYxzku66SxP6AkQo/d/lAZwekElt1loAo3lnY61w3A1dWwtnUeXLVAUa2OYiUwU
         YGRA==
X-Forwarded-Encrypted: i=1; AJvYcCU2qrcZkDUvRBkPfU4/Vff0SDq0FiifXhUJe7qexUwbRzAHQC2fm/zBRhJQMIiC4U0JlGM9svUlXbHVO+HRYuKT@lists.infradead.org
X-Gm-Message-State: AOJu0YwFCedawWip66KnBW1tkI35to1+qtOMa4s1qIO+vmUifW3F7Ot5
	me7I6E4v9OUS4XPfRoDqGgG3si++dbLag4nlKQCYb4A56jqtZaezB1YK1bAT07q7A4Aw2sY4gWY
	z4adU5w==
X-Google-Smtp-Source: AGHT+IFAYtJzivhsUU52iKzNWQxnVnmG7hlKc9RgE/6e86BSJtlmWTwTC7B+OByUUTQWv/FFwWaTNzzh0SbE
X-Received: from ejav24.prod.google.com ([2002:a17:906:3398:b0:aa6:ac44:bff3])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2a9:b0:386:43c9:3ac2
 with SMTP id ffacd0b85a97d-38a87305310mr9731875f8f.15.1736511581199; Fri, 10
 Jan 2025 04:19:41 -0800 (PST)
Date: Fri, 10 Jan 2025 12:19:34 +0000
In-Reply-To: <20250110121936.1559655-1-qperret@google.com>
Mime-Version: 1.0
References: <20250110121936.1559655-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250110121936.1559655-2-qperret@google.com>
Subject: [PATCH 1/3] KVM: arm64: Drop pkvm_mem_transition for FF-A
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_041943_213122_8BBC8EE4 
X-CRM114-Status: GOOD (  10.41  )
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

Simplify the __pkvm_host_{un}share_ffa() paths by using
{check,set}_page_state_range().

No functional changes intended.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 36 ++++++++-------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 392f036bc69e..3a3d9fcbc508 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1324,22 +1324,14 @@ void hyp_unpin_shared_mem(void *from, void *to)
 
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
 {
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
-	struct pkvm_mem_share share = {
-		.tx	= {
-			.nr_pages	= nr_pages,
-			.initiator	= {
-				.id	= PKVM_ID_HOST,
-				.addr	= hyp_pfn_to_phys(pfn),
-			},
-			.completer	= {
-				.id	= PKVM_ID_FFA,
-			},
-		},
-	};
 
 	host_lock_component();
-	ret = do_share(&share);
+	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
+	if (!ret)
+		ret = __host_set_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
 	host_unlock_component();
 
 	return ret;
@@ -1347,22 +1339,14 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
 
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 {
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
-	struct pkvm_mem_share share = {
-		.tx	= {
-			.nr_pages	= nr_pages,
-			.initiator	= {
-				.id	= PKVM_ID_HOST,
-				.addr	= hyp_pfn_to_phys(pfn),
-			},
-			.completer	= {
-				.id	= PKVM_ID_FFA,
-			},
-		},
-	};
 
 	host_lock_component();
-	ret = do_unshare(&share);
+	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
+	if (!ret)
+		ret = __host_set_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	host_unlock_component();
 
 	return ret;
-- 
2.47.1.688.g23fc6f90ad-goog


