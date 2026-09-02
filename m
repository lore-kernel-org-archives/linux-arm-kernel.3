Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C9CC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nz0QJrsFl6sXg/0SkB/zVAyOBBHBg8ebGgd7F8eNZsM=; b=bAu5ztYrQcHuJYGxwE3qBrTfFV
	sf9Jg+Igozhx3B3RHp6FfjuzQQTfe9MF/k3Dxzq0uaatsDD4enY3y+nZDksYAhzee2TQ25FpaELwu
	H/0EuOUC1Le/0E7ZTM0u6TjWbxCMqTa4gyIR7v0DPpVOIwDvHsIWSGKpr4iQadIgs8+eG5Y+JGfwu
	41PSpPPzChWBCrHd+7xGo8ARzb+D0Op3rl8Q5qPo3SCWFj95DTuOuSKp7LrOIsOSQLWeS3P/FM0Gv
	ZIVBp9Bm9dxAAXOdKOPJxU0+ONu09OrF4pXinGf6nROfHBZIRLEDhdPjD9vM55dVJ7168LyX2Wr3o
	DK6cDjRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYl-0000000EOue-19BK;
	Wed, 02 Sep 2026 10:51:15 +0000
Received: from mail-ej1-x648.google.com ([2a00:1450:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYj-0000000EOsI-0O1z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:14 +0000
Received: by mail-ej1-x648.google.com with SMTP id a640c23a62f3a-c2542cd4faaso108882566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346271; x=1788951071; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz0QJrsFl6sXg/0SkB/zVAyOBBHBg8ebGgd7F8eNZsM=;
        b=TMDZZiYbB39XolQqb/OBedkiMHBbXlIrp7IlLXWo8KYWze2BoHSUuO77sAFnJcRNhv
         LOSYDZ0UJv8AnImScjiKT6MTCFA+B0vyuxy85kdUVcu2IrpLV/meSM+qZIBHGOJHIs15
         vZRBcX/pE4389d3z4wTZFEFsJ3+g2kpJKYkI+uRovBSlhjenveoLEsKyRuUKQL50Nu9H
         OWYp1vJ7gpK/eWRYdh5JAvzkU8XvmSypVGA+Ozb5HHtc79Oh5qLSlotXJ21/yMO0pyXI
         Vvb83/nkcANfSDJGiyLVjj63a2XCuCGQ50vJYl71sEtaftN9w1wCOwz+X9HjnsRzjRog
         K6pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346271; x=1788951071;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nz0QJrsFl6sXg/0SkB/zVAyOBBHBg8ebGgd7F8eNZsM=;
        b=GRhOCmi6D5zt1X3CnYItnjpu8pt+4e3V/3OkL2S8uOBdNyq18eakv0I3f59Tb8Dtm/
         S59nc8CBeASZA8UUnMHYcSzbZ15IDUZoZ9MpcOWCzv+lhf/PSeRlo2R0PK6iZ40ZDvlP
         IHlXq42xVb2k7lijfS5dqh0qT+PgVqFhLqzW0LlwRnrXry3HRbXe9tTRfPCkAfCVmUHa
         AyR63wzSknnRvMgPj/kAGWfPKqBqztdRClIdmndQmF5Feq8yS0fylbaE//0acbnSDRaH
         sxWMMwR8aB8sz2m5NKvKiV8d2JLEM+efUJ26+EG1ERMPYEFnqumPScgFMZbga0UAVPXc
         QDRQ==
X-Forwarded-Encrypted: i=1; AKwUvByirhzevJJwuPv7qttCN9FQYKxGlK/TSoCLJIcj2B8T+ZnT6UyVUUywv+95QoeTzK7SQocXg4JETHh3xDrKX05G@lists.infradead.org
X-Gm-Message-State: AFuF++laUM2YgSEnX4kWR2tUKnmr3f96ee0bPbZ8h8s4JYrX10fqzcHp
	89C2GSgtljHueB/iMxQYeu0vT8OIdQbgMWL0zNqPrJGI6naS+iRcuoS+gAOHiFvyZ1u6yVU8jtJ
	xmK6edviUM+q1m8X/7XnmUA==
X-Received: from ejcz24.prod.google.com ([2002:a17:906:2718:b0:c25:3006:b1a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:807:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c25d544f52fmr257827266b.4.1788346270231;
 Wed, 02 Sep 2026 03:51:10 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:05 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-4-vdonnefort@google.com>
Subject: [PATCH v9 03/10] set_memory.h: Introduce can_set_direct_map_range()
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
X-CRM114-CacheID: sfid-20260902_035113_139102_5B07C1B4 
X-CRM114-Status: UNSURE (   8.72  )
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

While can_set_direct_map() tells whether the direct map can be modified
globally, can_set_direct_map_range() checks if a specific range can be
modified. e.g. if mapped at PTE-level.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..88175c3fa751 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -44,6 +44,12 @@ static inline bool kernel_page_present(struct page *page)
 {
 	return true;
 }
+
+static inline bool can_set_direct_map_range(struct page *page,
+					    unsigned long nr_pages)
+{
+	return false;
+}
 #else /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 /*
  * Some architectures, e.g. ARM64 can disable direct map modifications at
@@ -56,6 +62,14 @@ static inline bool can_set_direct_map(void)
 }
 #define can_set_direct_map can_set_direct_map
 #endif
+
+#ifndef can_set_direct_map_range
+static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
+{
+	return can_set_direct_map();
+}
+#define can_set_direct_map_range can_set_direct_map_range
+#endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
-- 
2.55.0.970.g62bdec98f9-goog


