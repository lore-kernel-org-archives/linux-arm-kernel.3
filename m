Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0ACC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 14:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ROhVGMzsFKUKcbl+uc4M+NtezlfJHXVXpAYtpBvAgk4=; b=ZLRy1ni0tJMRjJt9AwP6pEpgN/
	IvIZJw91gKs/4PdEJpr5mFVH+UcsVphdpEStBUAclrnQczXqCeBX688I1WSggIIUJcEor2gd4WLCM
	t2oOytTIhfUQq6D3BS4eWnctTSbdgDpsh1NpIioUiftF013pPxJTldht726YtaE3pew8VWZew+YkE
	bC1CuMR+0EO/Su4ob20bmoaEHNbiZXp9+7w4eF1RAYn8O/JL5koWvPZHUrAFVd3rcbmF5fz2AdqoF
	YHqmAoxS4ji7b8dnbOyX3+4PkVfnBVNz3Wq2JxgAoKBIjmCHNL7PicZroZVdL56+fyfruZp09+rwC
	4MPE88IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvot-00000003dLX-34wH;
	Fri, 16 May 2025 14:13:51 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFvJ9-00000003XuV-30XZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 13:41:04 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-442e0e6eb84so14758125e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402862; x=1748007662; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ROhVGMzsFKUKcbl+uc4M+NtezlfJHXVXpAYtpBvAgk4=;
        b=p5RMMRRfujXU2vMigvlcsmpwdlKxpxsmWQeFSso5Y4l5kmiyjIu/Q82+S1pXcY4/a7
         SShyuGTCwjPI0KRDpCRDUnIe1fOQ5lJ2P4IPqPQWVUSV9J79ArQWL0Z7EZC4AJ2C1ytk
         w6Uk/ttjwKyG69Qb1sW819DMzblbty+Ou1oqo/DyMLuoTZcuPgLHe9asPYCs0fN9n0di
         dJOsP2abX89hqnN0xpFgzq++iB7st97R/h8b94uXfonaYXA3ASLCKHaLzxpBtM4wNdAC
         Fpyl/hX1HolQiK1B87CezPDGWWvSDScC7abMvjuM7qVD7qFT/Q9foQJz4o801kG1X0wf
         KMHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402862; x=1748007662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROhVGMzsFKUKcbl+uc4M+NtezlfJHXVXpAYtpBvAgk4=;
        b=MmO/3HDm5cZJkao8FY64UDocrh5FlqlarCBQhOnRk15mgVw/OMegIShAWno2oPd7Xl
         IdGfsvQuvDUFWEYJztsAkgS3t+yDOm9FB8+Zi6Q/xu2QkkSkkbGgLbxyTvVk4LnYtX4V
         5Lmo9WVwiDCHlb0NmDhw5kvZrFTjzKYokcbbuShYBNTJd6dNwCa634ShGOEjSpjloUJF
         PeJPBdFYT9cnmXhEqBchOtWJpyCgB6txUpCOoBeKMH4L+AdesrY2cQlKWBWDAijEgts9
         27JyxdArC/Yz6cIoBIDvElVwk/IRV+gSMpBiYV1IFJbeYBipKJ5PeGbj9c2Lnwrz7VJz
         CHeg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ6AF9quxM5XsfxghdCgulchfHSz3OPiCvXKXWfQBgLHlbf3DwgKfPHIZroQ5Zh7Wtg28kQbRx/OV3GHALgLXD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5E9n1zuI5ure+3kD2gRXh/zyA2nK3+6OKUk7sawMtl8pqdOI3
	BAw14wsRm4qQs6ty4+DbSgBPUh6iAx3eb/PHPSXSskA264r6ai3hXjUKnjuUOr30ne7naWoNOki
	tW1m7GvEPz8G2U0JDPES1Rg==
X-Google-Smtp-Source: AGHT+IE25G0/BjDIzRGhaY+tUE0a1T8as9PDGc7bUXR9TD/pYwUJpZs3atjTMCsK34rjbeQcFKFoizPiNPQFaZsH
X-Received: from wmbfm27.prod.google.com ([2002:a05:600c:c1b:b0:442:cd25:eed8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c3:b0:441:a715:664a with SMTP id 5b1f17b1804b1-442fd6607c9mr27539065e9.20.1747402862237;
 Fri, 16 May 2025 06:41:02 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:21 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-16-vdonnefort@google.com>
Subject: [PATCH v5 15/25] KVM: arm64: Support unaligned fixmap in the pKVM hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_064103_752620_45A23569 
X-CRM114-Status: UNSURE (   7.50  )
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

Return the fixmap VA with the page offset, instead of the page base
address. This allows to use hyp_fixmap_map() seamlessly regardless of
the address alignment.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index f41c7440b34b..720cc3b36596 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -240,7 +240,7 @@ void *hyp_fixmap_map(phys_addr_t phys)
 	WRITE_ONCE(*ptep, pte);
 	dsb(ishst);
 
-	return (void *)slot->addr;
+	return (void *)slot->addr + offset_in_page(phys);
 }
 
 static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
-- 
2.49.0.1101.gccaa498523-goog


