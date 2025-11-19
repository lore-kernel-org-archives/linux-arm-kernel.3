Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0485CF34D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qf0q06JpGKFVTNkejD0yb20CFvUyN2OLH5ZYFwRjaWU=; b=rI+OwsDq4b14fTQB9s3a1oOvgY
	R9GQMVPw3BUrP5g08+YMQlo3tijyZBSvdiJs98KmymiXTU27kYueecYEa+RcGK480p8logoFYheqf
	0hkV3pU2o+pqnjndL+/xu9B9F27dsRMiKbO4ZCv4KJbAZ0vcj7rcau2s74taSF+i2TOiWLh5AXXJ8
	bSKIK5fAwIeFR1jpD3KJE6Cxoo5LetVHg8rZvjxPOxpyipy4t+OLwWUd85tQG0z8MdBM/BoMgDoPg
	Ltu1NvpHa3lSOBZUzZkpl5n+Bvam0kuwITFt2ljFBY+qE3J+kxKvaRDylGDc5P4ArW9qC0UkLCLRO
	8L5ekXuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNc-00000003WfR-0Hfb;
	Wed, 19 Nov 2025 15:46:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNS-00000003WQs-1ZOb
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Nov 2025 15:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qf0q06JpGKFVTNkejD0yb20CFvUyN2OLH5ZYFwRjaWU=; b=ELVqvvv98M2ymvvzBY7cO/xHud
	8b+kgCzH1Pu7pQna92/NsZjScw35fhbTmC5mFEB05s0tvXDlGAXReNdw3pv9eVjjfCF8QT1zV1F4P
	6kq3EIcJoBSEuvx3Xw0s9D3QjzBaM62G31gSCs+KUa4S+1btZ5PH9IBynajuiTLVyFH3Ty8Tmh73o
	2+EfA1UNM2t6IJb3+BG1K/gGV4XCwvSGHXhMC9CFDhAiLDlJ9WIbpe6AxUD95tCChf/uhK1s4L13m
	oAAtFrceOCB+9uCWps9H2AidyrlYxNMKgFh9yVk0h/AdPsZJ7hGRDe+iAf1Xc1Y/NGztledniIY37
	rac1HUgQ==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjVl-0000000CYnJ-1Uw3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:50:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso4603935e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567145; x=1764171945; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf0q06JpGKFVTNkejD0yb20CFvUyN2OLH5ZYFwRjaWU=;
        b=EGY9RrGClAblw5npnD/W5SS3XqH6YvwV21iVPTrbWE72oLdGs6whkcXyyIbOWGn+yl
         NhHO3rstvFKigYAjOn/au57JEQSnWU2jT8lzRag7SyNVsTYYcyMEyqiFt6cMVCzvn/be
         0KVjzRsdBJivgq6UxuJEqVUkb5+LpEhI/M6O7ML8udl5gmShjG65qYXyHIvap1s1irdB
         Hp8iFPzmNyrDoVEPsv6B1b63+uwga/inGT2GyiiqzJmz6Gqw8kMUJn2/+K1EfoK6pLco
         OxJm+M0r+U2HuT35CRI69k2ZwXbnoH0gvppI0p7aVSYTHJCCDzZeLGwMybZimbp8RsA2
         O5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567145; x=1764171945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qf0q06JpGKFVTNkejD0yb20CFvUyN2OLH5ZYFwRjaWU=;
        b=Tfm5+7bTA6qy1X7wFwNFIcPfjS3Hwq4zvdjAHTCo2kzn/+MXXsNaxBFQ3HaP4kW6CZ
         JuMapSPqYWXSRKmQB/I96kzUuTbS5PShT/WZzm/b9z4TcH50yCQnHTNogcmOLLky93T+
         MCJw9pOHMxs9Tvze/Bm04IIswVGi3BD6t0EPhvrV7Z3H5IChh4y7W/aKs6WDq4UksDtE
         skUEuzOx9UpUoVv8EFGM4NjsuIzWZ/xC4ByPTeTKPCN8FZJlPozIhiL2MWrMkTZdeXts
         5oh1LssJhDkJGG1C/MDLNtYGsz9RkdtUV2AjJlYeoGfGJ1gcmwZQnAiZb9WVe+lIECVc
         UQFA==
X-Forwarded-Encrypted: i=1; AJvYcCUDl0lSoBWhweZtxBbN+yRLdDndlyrQkR4rJu0z6tnkjybgypD+m1e3Dtfq3euhCPo0HiIu7aeDHoCs5mhP3mLB@lists.infradead.org
X-Gm-Message-State: AOJu0YwMNV3MBcqkqtxgKnegI9bRDXWu5tAbE5RBgGQ5PeXr3LBEYUkm
	V4uCMZjMsOJnQbdsZWLQpWm7BaruUr0v1rwhen6XQyp1hZNy6XQcz7phFNJPzBWcBUs=
X-Gm-Gg: ASbGncte/TfTW6nhmusZ7raEzfHWFVrXqpJw6gBiowz6Jrpfpx7D97rYp5bzBaKWSTP
	aOZd95EsaFDpu69wxhA72uWPWILT679sGpyTQPrweDv4SBcQvviyJwlUZN9bjCr72YFJ/6u4/HP
	fdVHkYczUst53bP605c1vU82rvE7eotBD4w9lzf6biPo7NTcBV4uGccvhLj/WU7Dw5dmkrR5WBP
	H22oVtDdFSDamFAJuBUAweFrcEhJI+xgSqYFLb6kpkdc7x7gfFtETmfRnt/yxAZ4JfQj1b+Rm8K
	l/1tcBsGknF/zuy6rSNrEzK4oP7JtImvgWJ57ORgq3g6GmNAoCtA2KzU7a3/hX07ZtUT2gIhXB1
	WJEHvLb3kmiiTsXFqNLbrXktlBlHQXj1VSOsr8Tcfo/vV4vCMIUIwJTsQAuRBZYNa68OpaVVqCz
	0Zj7ZCBSmLlAqBHpRX9sIapPqhxws8xA==
X-Google-Smtp-Source: AGHT+IG9WtxjjgmkiAX9yQZlIznike3yBomBYuHSDjoJXaquW6OMMeXhxlHfzRespLZJBzb+ERriSg==
X-Received: by 2002:a05:600c:2313:b0:471:793:e795 with SMTP id 5b1f17b1804b1-477b1787bafmr21362035e9.0.1763567144657;
        Wed, 19 Nov 2025 07:45:44 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:44 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 16/26] mm/mm_init: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:17 +0200
Message-ID: <20251119154427.1033475-17-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_145022_691013_E2619F38 
X-CRM114-Status: UNSURE (   9.48  )
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

Annotate vital static information into inspection table:
 - high_memory

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 3db2dea7db4c..c31062a3ff47 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include "slab.h"
 #include "shuffle.h"
@@ -52,6 +53,7 @@ EXPORT_SYMBOL(mem_map);
  */
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
+MEMINSPECT_SIMPLE_ENTRY(high_memory);
 
 #ifdef CONFIG_DEBUG_MEMORY_INIT
 int __meminitdata mminit_loglevel;
-- 
2.43.0


