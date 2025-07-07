Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4CDC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krhFSts2Ny4KtwzLCGZ3q9qsBqTby6hrGjVeTlezd7o=; b=DN8sQwZGAZkNHvlmGJKzs4zOU8
	hCDIpTCwlHpTpEsZawRNeq2BMfzbCxPDMNXHEhjThuFgVNkDj5efVx4bGuLFOAUHGMzvbp4LHfQE9
	vOZH1iNcG12CSrx/X/+UonZVa9Lc1DfFObqDi0BqNidnTBXib7xBI8NkUZfwHSzq7zz8CpPwDmfQt
	U2g0JJhQGmxSOxkuoh9nrFc6mygvTb7+C8KyynJienAcEKV3b54sXQVJ/u+ytJ+Tu+ViKK5U27vtn
	EEhLFoKpx47AiXk5TCVWSL4B3+NMoz8AKfrDVHvhq4duZuOOYz2OzS9DiNQEQ25DAkts7YEpmlAvv
	MKyzn3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnzG-00000002u6l-1lLy;
	Mon, 07 Jul 2025 15:42:34 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYnsv-00000002snc-2RR9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:36:03 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a510432236so2269003f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 08:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751902560; x=1752507360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krhFSts2Ny4KtwzLCGZ3q9qsBqTby6hrGjVeTlezd7o=;
        b=aHmRmsazEKj7h6YqfiUzi90q6TQnEr5gCT9wFqhIq18l5SlfClAhcHSlw8phwjmwk2
         WvnVHa33JWKJ+8TwIU6w3liRpE5BtD+ThhLWTrYeeMcwUZ2FGJNd67k9Lp4AyjlHf5TN
         UqMDTVcG9wS5ejZJ6jPoaF0+gka9iX6cbFJrsuK+fjh276NEtrDEMQSb9KaQN4kw8+IC
         owB+Fi5s0eEsapbWf/n2k/yx+JOXk20777FjOnk4a5A5cmlp0yWACh0gjGNOGaK8/fBb
         enibpl7Wi9BwQeBxghHSQIQFRgubyAvTPeJug/Wgan/EpsES99gbmyZ2DiZLFoTa+MNR
         0DvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751902560; x=1752507360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=krhFSts2Ny4KtwzLCGZ3q9qsBqTby6hrGjVeTlezd7o=;
        b=qURgx3vyzYrSfYHzP1aE2rl+FJvOyM43i3H0ccUhLbYsFnsL2I7dnjFYwesKZuxAFB
         4sCiYz+1Ou/Pm1bYkJ2gtM6IoPmPWkCbmAt6AbmcRKbeeqhpLhbzPj5MrYu+bJXNpZFX
         3YBv31R43Iym4aIdkveJOrSPEyKI3x1XC+3inCGS+pFjQvZXql9kF+uvrpCC4FVKWm+n
         XAmV5a5eSCzyoDxV8ns3A0XfyM+lDxlPGuNmVq/UvPeedrzaF9ZMbJ66KPtR0Nlh5bKr
         HofsvRbJvEhxspuuf5Enc5uyCdc8xTsZ7oT9gl7bGlUJXAYnLFYQIO6sI44SLE619FKF
         rSPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWW4TZIqIWq4+Ddb79Rfc3Hs23ZhF+VDqAH5pC550+s7l5Uqc/GICwNAuXq2Xk65xuJdkA+nbgoUVb0mO6OtKSN@lists.infradead.org
X-Gm-Message-State: AOJu0YziTB2dnCUbgNsJUAWCjCDiggVxxT+LjE5y/Xiza1Ws3Y8vWyEf
	s0KjRz7sQLPleR7vu84ZrGne60by/juQrgULaohaTnRYg+qR20C1LVSoEHJIKZqAnv4=
X-Gm-Gg: ASbGncum4vx6XHzNBk0rLpwJtl23OkDZM1BblNACGrfi8+CR+qHwf/yJDqTSoA3EFK+
	WzQ9xYi2BDr7/drkyGWZS+Dpb4ckzB2pgmOXIOB+UKchEdvXG3GOMKKDU1DoPyeacBf8HGFGChd
	RndrPkXOWTuaT+cCYzh44qItjwqBxMJvqns58tNCZL62aVpz9oWfUJZsRRiwKp1Z4TRfocSWnYG
	bV0jeYI0HYOnESFNdvIjwK7sNCS1/AirptZeLpackqzMr2djfL5efAdnvH1zxkA/MJFkvEhFk6U
	7x7Lw36UQxB/uMzAql3wAhd4VlT3z4wR4ws43oUcAUaE6qXm4fSISJwjYnmVTMpcBX4RhTwtPbh
	F
X-Google-Smtp-Source: AGHT+IHgGoCbSgy1IfUjK41jBubHWfqMXcWrfJyrbNDfMrkOQPZqQJ3xInRzN/3XX6mg8lF8YgcYsg==
X-Received: by 2002:a05:6000:400b:b0:3ab:27f9:e4f with SMTP id ffacd0b85a97d-3b497031623mr11893080f8f.35.1751902559976;
        Mon, 07 Jul 2025 08:35:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:43f7:96cc:da3f:e6bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd4dsm10409968f8f.7.2025.07.07.08.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 08:35:59 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Mon, 07 Jul 2025 17:35:57 +0200
Subject: [PATCH 1/2] kernel: irq: msi: Export symbols for TI SCI INTA MSI
 module compilation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-timsi-v1-1-80ae43b2c550@baylibre.com>
References: <20250707-timsi-v1-0-80ae43b2c550@baylibre.com>
In-Reply-To: <20250707-timsi-v1-0-80ae43b2c550@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>, vigneshr@ti.com, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
 Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_083601_633531_479C9B4D 
X-CRM114-Status: GOOD (  11.09  )
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
driver to be compiled as a module. The following symbols are now
available for module use:

- msi_domain_insert_msi_desc
- msi_domain_free_msi_descs_range
- msi_setup_device_data
- msi_create_irq_domain
- msi_domain_alloc_irqs_all_locked

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


