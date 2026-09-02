Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6E2C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9YJxK+goKseFQhyyU1kBZycBjFaImkJiX1HLmgsMgs=; b=hTGCsc0ujYC8tRm1Q2Atjg+GlM
	uRadziSS0QqSiZodo/aDUzsKficX6Uq44Ae9gDCtM4/SqSTePR0708vqS6DIrPb3VATVVAfgnbvQ8
	18mWkkeNG0xd65DxqrvY8c8ZlT84n+b7M4dWIskOgxdAwVRhAJTAmyEt4jPEL1IyIwc/xbEBy9ZVC
	icQz8BouETv50SKT3hnWC7FufSI38yvMslGEFF7SIkqpWjWGULudwR1Ff2T9KdH0UOcnvAq/w4IEZ
	bcb0xbaZStW4DFC/lWrJg2Xk7EXsIORNRW8SGrmPe3KCO0Awe3YX04LFB6+L0S/wSWpzEoAS2ILvW
	N75xW+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYo-0000000EOyY-3ZRK;
	Wed, 02 Sep 2026 10:51:18 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYk-0000000EOsT-2Cyx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:15 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so5332065e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346272; x=1788951072; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9YJxK+goKseFQhyyU1kBZycBjFaImkJiX1HLmgsMgs=;
        b=hfy+uLrFMIt0TNaNTg6fBStZ8ewTrzY1zA4wWoIlgIjgjTOgywVECg3vNpOI2i/Q3M
         eoYOWNgsyhiC5rMWGlKHvV0bX4kkQvP834bu15x1xIZqn8C8ZK76gUWfxADRIfxgGJhT
         yxjHZ4lL53VMx/5ZC9TeehKAjwUkxe7nlrmpDQ21NA/hwLbAZeF2vpwXgS5GMB0h02kl
         ZrGkH/vwuWcSr1u7LY2T6AekIjPD0dnv1x4UnUhft0IxOj4qnQhbYmEOICTe7Gv0zDYr
         kIiYhi0SpYVOA1fm941jqCMzQpoPERFA4CbtvVC/0TFn8Fv55vq1tu6cHTedQugfYbJE
         WS8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346272; x=1788951072;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9YJxK+goKseFQhyyU1kBZycBjFaImkJiX1HLmgsMgs=;
        b=fTujuvI7aJann+IIc5mTNommEDh4ruY4itm/Ak+qnSEHoTIDWVYElEn099W0u0nOQl
         ZHvrAT8SwrqyV/7ebCQqA/S3VpzbbUmryYPOG3GccGoXsUfcmwoTEi9vrbO0ZN/Yh5MR
         zsikZxWwiJUgMeD6SwKDOYkUr/BX7mex3MUjr2Kb9OLB/sG5OpFr9P7s0uMBtHpTcehN
         68dmWUg+G03JkVaLZHskhfUVbhS/+ktkExoPUjQiPeuycV9LhJA5CZ2IBLB32VxU5aYv
         +DKtoubw5BIwwNkSoUWj5iG9Yg+Dsriu1PVZqrRx2hoq/T42TP38AZKXsk8X4jHlZNhg
         OM3Q==
X-Forwarded-Encrypted: i=1; AHgh+RpV7mEhopD2uxztHWgE4zwA/fRaIPs1xNgxbpBhJDMl0ZipGzY/0b4oygi6LCXw46D2vqAf4o8MQDpg6WCyGAra@lists.infradead.org
X-Gm-Message-State: AFuF++kUCYYvZzPAxqrD9fWfEXCgyW45+IUgPMD/2DNA5cS7RoZ5WGhg
	KLsbw3KUDcWsArdIeX+fjFnUlkPrLu3ObdmKecIYZsBQP9qybHim7wYjwPNWuqeDi6f97gS7fcx
	W8qn0g9kNPqrg7ox0quZekQ==
X-Received: from wmik9.prod.google.com ([2002:a7b:c409:0:b0:49b:e83:a666])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e44:b0:49c:dcf8:5216 with SMTP id 5b1f17b1804b1-49ce57e7f55mr71897835e9.6.1788346271508;
 Wed, 02 Sep 2026 03:51:11 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:06 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-5-vdonnefort@google.com>
Subject: [PATCH v9 04/10] set_memory.h: Introduce __set_direct_map*()
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_035114_570051_E1F1ED20 
X-CRM114-Status: UNSURE (   8.49  )
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

set_direct_map_*() implementations verify wheter the direct map can be
effectively set. This verification can be costly. Add an "advanced" API
__set_direct_map_*() where the direct map is modified without any check.
The caller must have verified it is safe earlier with one of the
can_set_direct_map() or can_set_direct_map_range() functions.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 88175c3fa751..5a1917a3fd52 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -34,6 +34,15 @@ static inline int set_direct_map_default_noflush(struct page *page)
 	return 0;
 }
 
+static inline int __set_direct_map_invalid_noflush(struct page *page)
+{
+	return 0;
+}
+static inline int __set_direct_map_default_noflush(struct page *page)
+{
+	return 0;
+}
+
 static inline int set_direct_map_valid_noflush(struct page *page,
 					       unsigned nr, bool valid)
 {
@@ -70,6 +79,22 @@ static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_
 }
 #define can_set_direct_map_range can_set_direct_map_range
 #endif
+
+#ifndef __set_direct_map_invalid_noflush
+static inline int __set_direct_map_invalid_noflush(struct page *page)
+{
+	return set_direct_map_invalid_noflush(page);
+}
+#define __set_direct_map_invalid_noflush __set_direct_map_invalid_noflush
+#endif
+
+#ifndef __set_direct_map_default_noflush
+static inline int __set_direct_map_default_noflush(struct page *page)
+{
+	return set_direct_map_default_noflush(page);
+}
+#define __set_direct_map_default_noflush __set_direct_map_default_noflush
+#endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
-- 
2.55.0.970.g62bdec98f9-goog


