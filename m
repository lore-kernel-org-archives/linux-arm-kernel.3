Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34777CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 15:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lpdr13Dtlhg01cWCXIYI35AG1Y3QRBsSx2SpN+S+hFU=; b=oVdY3U9H/1pN0JUWRxjCGFZIVS
	paNtn5D8YWQ/LziTq3KK3s9+SJCAtO5yr47GUzQMSoL/LYfhrbIAEqzhpOmGEej56Vt3kwUs+MiQs
	crmY3uwDsnlkMAevwOQBeTWu+PlSblljuXNMDDQq1Cq7nRDXR2auXMHx3W/9Rtomx9JQjO2CEk9Ba
	+bNQrUjHv1qq6MKZsSMyKjxP8iz3ZqQa3tQgcjC4X3DV7SdR4Yv+o/Xx+8pt9zCIJ+VUBFdEzI1Op
	bpPNQ3CmAIVZGKzHQP5uYA+EmmKJCt+L/56E3iz81888JwK5gKcptIcfkOiRXTcPtf/98AJ2nIw7N
	qBS/XGfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G8i-00000002pY1-3Sag;
	Mon, 29 Sep 2025 15:50:12 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3G8g-00000002pWk-2koM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 15:50:11 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-afcb7338319so388486366b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 08:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759161008; x=1759765808; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpdr13Dtlhg01cWCXIYI35AG1Y3QRBsSx2SpN+S+hFU=;
        b=3smDbdZpAaYpIlgGWgWys0WTH+AhUvuyLCE4Lgtm96ZV5sKR/qCYyGKLeF0UD3qBgQ
         TAos0YVOJVmMk3AzKabENplv/yuHgo0KINbobTNyKe89pQHy9bSaR7ktObgXzLCRJZw9
         /NSmw9ZvBHXK8hO+utu6hkniAYcP8hNjCBuCZk7R8zCsnBx21InjdmzpP/C/w5dh631J
         GQXze6pUcUxxOP32xkUIuh21IAHddqD158ewS9fH7MS3U/AJc8bYP4VrLkBy9z9YNjxr
         dE12zSlqjm1M9LKwfwI8+Y//7MjLuV2w8eTkqaCIZrPLltv4IcZVsdZqDUD/f0EGS4ST
         TN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759161008; x=1759765808;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lpdr13Dtlhg01cWCXIYI35AG1Y3QRBsSx2SpN+S+hFU=;
        b=fwL6BQ+o05aOrdiUzbx3RSjXDHKlyVuzX1xzNe55WybuepUWWs7aWORntzlJGgzg0S
         EH6WDSjioYL6pg/moa5VguTU0yFN/PFNCUJIvQDQaMJnNvYNixjqot/gWyWauBQV4dIA
         9tuGEznA9k6OhM6XOdFhyySdXLma54v7geYxH9fJqshaZJr2ftnruNKXD94WaOn7fN17
         JxSJ17PVIBC8bGJhuUY9/OcLaDNey6f+YTZgTP816f4xGVQXTPHP2fi6ECxYXY2j5VPr
         9ZWBiyQxsAKkSMaJ+es6ihECGrG1gwW1zx4Iq7xPQh3Y+rIHdP70+C9dvN3l3SQ6aV5d
         OkyA==
X-Forwarded-Encrypted: i=1; AJvYcCVFJ0ayZn9fEnIZZjOu5kiIE2oqdDBCtZVv6I5GXiVIzEgQC8P9yOEqsDu/d1LdgcDTLcCORO+67Y7je3JUu0Nl@lists.infradead.org
X-Gm-Message-State: AOJu0YwpXdV+weBzA4ATa+ctPrP6LfoRFKVeBVXtYMYyUF1EuipuKxkm
	NFB4+Qw1dm8PSzGiNS7IJZYw7KK4do05Uc99Ab0lKSigPBevhu4pmPWqqx2z9sBXotso9ZOMUgk
	Gwswu28tf5jtaTg==
X-Google-Smtp-Source: AGHT+IFx3LiQcFYe261z/EWWagWvnj6dQR302njS+xm6S18t3FOG1/h2C5xa6C/Nr1sj0mZq6rNxxvXG2ayzJg==
X-Received: from ejrn23.prod.google.com ([2002:a17:906:6897:b0:b3c:699c:2f83])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:6a0e:b0:b3e:c7d5:4cbb with SMTP id a640c23a62f3a-b3ec7f3d880mr431947266b.35.1759161008650;
 Mon, 29 Sep 2025 08:50:08 -0700 (PDT)
Date: Mon, 29 Sep 2025 15:49:56 +0000
In-Reply-To: <20250929155001.3287719-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250929155001.3287719-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.536.g15c5d4f767-goog
Message-ID: <20250929155001.3287719-2-smostafa@google.com>
Subject: [PATCH v5 1/4] iommu/io-pgtable-arm: Simplify error prints for selftests
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	praan@google.com, Mostafa Saleh <smostafa@google.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_085010_707911_9AA39D24 
X-CRM114-Status: GOOD (  13.47  )
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

At the moment, if the self test fails it prints a lot of information
about the page table (size, levels...) this requires access to many
internals, which has to be exposed in the next patch moving the
tests out.

Instead, we can simplify the print, using ias, oas, pgsize_bitmap
and fmt is enough to identify the failed case, and the rest can
be deduced from the code.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 7e8e2216c294..00218af5d5f7 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -1299,14 +1299,10 @@ static const struct iommu_flush_ops dummy_tlb_ops __initconst = {
 
 static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 {
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	struct io_pgtable_cfg *cfg = &data->iop.cfg;
+	struct io_pgtable_cfg *cfg = &io_pgtable_ops_to_pgtable(ops)->cfg;
 
-	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
-		cfg->pgsize_bitmap, cfg->ias);
-	pr_err("data: %d levels, 0x%zx pgd_size, %u pg_shift, %u bits_per_level, pgd @ %p\n",
-		ARM_LPAE_MAX_LEVELS - data->start_level, ARM_LPAE_PGD_SIZE(data),
-		ilog2(ARM_LPAE_GRANULE(data)), data->bits_per_level, data->pgd);
+	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit oas %u-bit\n",
+		cfg->pgsize_bitmap, cfg->ias, cfg->oas);
 }
 
 #define __FAIL(ops, i)	({						\
-- 
2.51.0.536.g15c5d4f767-goog


