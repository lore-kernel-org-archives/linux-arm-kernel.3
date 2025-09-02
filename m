Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DD3CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8wzm/mr5xp7tXM1oehlTTQpv32VYRWQAoA0cZh04As=; b=LXVBg/jE4cd2wa+S4XulqjbvoP
	RcDhaXikY52Lykk2Yl2Siqpg3+nKCIrKJn5C4JyNSOb5SOPpZ3m5mWA9rPElv6ELZFXoaFxAofn0c
	4vi2Ui5zrUccFWnMUS3E1yFXdfgbZZFRh+Q0rBoxJFyZOGoqQdOKzC522lNNPeYBNkdzg/hgr/ElS
	LPR8eN10Sz0tHLQJLUmuat3jY12iEimIZUGeNT8xzVaedZnDLwO9qvW29wDH33qGhQCaKrAEAgf94
	/AHOixeuDNrigPbGLvyRWHnzPAgywNP8pt7I4DDV9WnwOfqv300OvvWDyUC61Ut7CQVY8jwv1Ayxy
	RV0sUEfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWQp-00000001dw6-2tDp;
	Tue, 02 Sep 2025 19:12:39 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSEk-00000000R7L-2zot
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 14:43:56 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso33861495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 07:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756824233; x=1757429033; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8wzm/mr5xp7tXM1oehlTTQpv32VYRWQAoA0cZh04As=;
        b=SOaCHnJauQLNropxMz8mYWL7tYnokWyIWYCP/GZJL4t+j9Oh6wY56IMIw6Yia6OLuC
         XF2VhNa+fBO+ylm5RVd48bDVQr1xUU1IFPIQVuS6SN5eTtKzq8vzolLIfcYkCjA2Xwl1
         9n+zG6+3PCJtkCsE6lD+5LpdC79+XiKh/pa1Tv+9AC7IEO/oXMctCCTylNkRajlyMb4G
         PyRpOkQ1NaIq4LLAVjsld9M+kb73yUlu7+0fB1at6XIUCfrdjH8l1pW+T5stBQSw5kOI
         WTreyKZitKDDt0YAdzX+zYcbPDFrO/DR+7I51HuNWoaqc3tO0hhkXvUIJdSPTjqRq74W
         m+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756824233; x=1757429033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8wzm/mr5xp7tXM1oehlTTQpv32VYRWQAoA0cZh04As=;
        b=YrZGufmRMmKjubiVK/Dterj7t3+VydTYjuXccjI9jTy7EEFwDdu8jK87XzfAbxYCix
         Iz/SJRD3kaJ0BRGoNjTNvFQ6SrP0Tkg7hfSA53VT3r4na7wh5REx4kUpuM+Ud8d6R2Q8
         uP1KiFHa7pLdeXtXyAR7VzZnlEmr90s1PcOtR41TGGtIET36uGlSIexxu4+ik3yUCT8j
         VurvBUOGUEsYhXarDRD9L7xnZ9LB/KlzhS3ria1ImSJPuoaFCU5J3q3aqLkC4VJXVDcU
         YkFqz6DbXRW/rB6HcmbqHZoEYvnRTJ2C7Ogm8PW7MSWWR3HfS9ZdXzAubWKj5KRSghMf
         rr1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUluIUqlNFxy+igOEdiiXJCNAUi5wWEGyL55bBEbpf2ce30O2GBKVCz90x0U8OAaGcESDKpxzZY3/fnPahuof+u@lists.infradead.org
X-Gm-Message-State: AOJu0YwsGo2UjWP0RgOn/08ogwz4I7a0QpzcQPH4LVX1I2+1twhEt2nj
	hXk+NZNFZcLPfDwMu1o1YyQHzmRRzJ7b9lgnK1twwxAPvZImlAuPkfUm08P6FQj94bQ=
X-Gm-Gg: ASbGnctj0vn2whI2NW62gLlDO/Od2xjNkQYkxvwf7T3lG9pof+FYtRIT/ov8gRNsmDc
	jRAKcyW+jgyBelZL5k/2JJ8Ek3F0KQPtrYgCsT40a7gVWdcy9KVe20DiB8vzyHAsUTLKCAXfVcG
	xcqOVjQLY8pVwyDgW7ab3Ul80FCJSpC0lzCKaaILCC5VVgpOj8tCphmY/dvvDNgAtVovVcD3C9g
	/0H+9y2991M/AS5Vg0U+yLOGT+92tRbSXHwzR58nq1ip1FnhluFGeDlNv9KSLvWgdzzOYgriRwl
	Q6UZwL5XfxmqnJSRhH8O6FPhCeHMvDU1BK14JTYZXFqfsDe8zF0qJdLwPo9bzZWdpzhZRfjZfSp
	9w35O0uK6r/aDFVArpdINGpAJJQ==
X-Google-Smtp-Source: AGHT+IHRnjnVV4+h89iJA6vomGUrvNgbPO9WKrF6Sr0B7KSXUlhBS820UObNuEt6/CaNgmJwauk31A==
X-Received: by 2002:a05:600c:35c8:b0:45b:8939:8b1c with SMTP id 5b1f17b1804b1-45b89398f5emr74684795e9.27.1756824233151;
        Tue, 02 Sep 2025 07:43:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:5982:3242:38ad:8b12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab093sm209604635e9.22.2025.09.02.07.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:43:52 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Tue, 02 Sep 2025 16:43:49 +0200
Subject: [PATCH RESEND v2 1/2] genirq/msi: Export functions to support TI
 SCI INTA MSI module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-timsi-v2-1-a5bf0f32905b@baylibre.com>
References: <20250902-timsi-v2-0-a5bf0f32905b@baylibre.com>
In-Reply-To: <20250902-timsi-v2-0-a5bf0f32905b@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>, vigneshr@ti.com, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_074354_764775_F12F8CEA 
X-CRM114-Status: GOOD (  11.65  )
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

Export MSI domain management functions to allow the TI SCI INTA MSI
driver to be compiled as a module.

The following functions are now available for module use:

- msi_domain_insert_msi_desc()
- msi_domain_free_msi_descs_range()
- msi_setup_device_data()
- msi_create_irq_domain()
- msi_domain_alloc_irqs_all_locked()

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 kernel/irq/msi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
index 9febe797a5f6..4af232b6796b 100644
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -163,6 +163,7 @@ int msi_domain_insert_msi_desc(struct device *dev, unsigned int domid,
 
 	return msi_insert_desc(dev, desc, domid, init_desc->msi_index);
 }
+EXPORT_SYMBOL_GPL(msi_domain_insert_msi_desc);
 
 static bool msi_desc_match(struct msi_desc *desc, enum msi_desc_filter filter)
 {
@@ -235,6 +236,7 @@ void msi_domain_free_msi_descs_range(struct device *dev, unsigned int domid,
 
 	msi_domain_free_descs(dev, &ctrl);
 }
+EXPORT_SYMBOL_GPL(msi_domain_free_msi_descs_range);
 
 /**
  * msi_domain_add_simple_msi_descs - Allocate and initialize MSI descriptors
@@ -342,6 +344,7 @@ int msi_setup_device_data(struct device *dev)
 	devres_add(dev, md);
 	return 0;
 }
+EXPORT_SYMBOL_GPL(msi_setup_device_data);
 
 /**
  * __msi_lock_descs - Lock the MSI descriptor storage of a device
@@ -910,6 +913,7 @@ struct irq_domain *msi_create_irq_domain(struct fwnode_handle *fwnode,
 {
 	return __msi_create_irq_domain(fwnode, info, 0, parent);
 }
+EXPORT_SYMBOL_GPL(msi_create_irq_domain);
 
 /**
  * msi_create_parent_irq_domain - Create an MSI-parent interrupt domain
@@ -1472,6 +1476,7 @@ int msi_domain_alloc_irqs_all_locked(struct device *dev, unsigned int domid, int
 
 	return msi_domain_alloc_locked(dev, &ctrl);
 }
+EXPORT_SYMBOL_GPL(msi_domain_alloc_irqs_all_locked);
 
 static struct msi_map __msi_domain_alloc_irq_at(struct device *dev, unsigned int domid,
 						unsigned int index,

-- 
2.34.1


