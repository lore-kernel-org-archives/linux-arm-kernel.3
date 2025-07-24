Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E34C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYTWTc09XiaelzjVtYPzYhjlFtDK3ChqlxDovLkTtoE=; b=X6if/XbDOLIRwNkWzujSStaDRZ
	0h3hJ2E9CcTmdvyM0dtl9toYI23vdWuuB9rg2Ll9UtMdT6bldTHCvoM9GASI1lPW0gM5Xz13sO2r5
	Pa5QdrO2XWRZZTE26rX8NCjuojb/d6t5CGlsOKafvx8rBzmPdamUiVZu6y/R9a0VHLSzVje/eY8Ix
	3dMGpWfUAil98bB7vu/C9HTFtjcKYPqelxS9SsovJkN5D7PcxYt7GVkOCD8Y7SLa1exRYP2b/X/tR
	aYBwElr8p4Ak1EhctmZHsDcFxEJJTHx3hRixGJBEn6CUiMfy79/YJyfNHWYMs/2Z9RIGFoPfMR7wt
	y1XZMyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexra-00000007rRi-3zWQ;
	Thu, 24 Jul 2025 15:28:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRC-00000007euT-0A9H
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Jul 2025 13:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tYTWTc09XiaelzjVtYPzYhjlFtDK3ChqlxDovLkTtoE=; b=AVrkPqAROs/hOACImfHeCcvGjh
	s783RDYqVgZu+1NsOW1xaDPPj6skxuogRaxo61GuJk1B3tx9otOpx0AZ+zS3/CKSc1A+3oid4B5VF
	QjxB4D85a1ayYwUCPjUSZduCCiWjxYBRg+RVB+sEWYy5N2IJ5JzfV0oqoX+WkjZjcKN4ejkhDU+4A
	gz2tx1U+WBdhvCFHPg2PrEYvNIRVWhVWpMwzeFA+q0r869R35ZtEKLmOo1PfA22S2yQuxdbVOPRQg
	+b5t6Q9a4Gh8jiRFT79AaVpIFlfegP2wjn0jbMOAVXlld0sonS5vFYs0b/rRPBkDSnc9ZddxEYNoR
	9HZ2Rf2A==;
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR7-0000000Bd4d-2kLG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so10700135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365399; x=1753970199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYTWTc09XiaelzjVtYPzYhjlFtDK3ChqlxDovLkTtoE=;
        b=MCeT1b2Ny25rpKxpNSb2bd5ddyxa1H9C3L9fOIcB9a9nUhEL1XL69S/5qYrfJYazEy
         ZV3zXCR7dVidHZgsoiPwoWVc2+awCaudkc1As2aG7XzFQmuSt/ZUAFgivlyRtmGNraoV
         78+RM/Bbe5fU6ZSZ62TQ4KB+HJIeSLj6tbJIlMWpvs9ANXufGGPPWAawKSrHfDJ8Ms4c
         gWY087S+QhkIdg6vN82Fj8nBMlqvzJOGcrQ9o5YfnW4Cm5YJQexBBQoR2ULH8k/c8DBy
         n/WJZEoYhiVrWHJQf61Lu8GFeAg3z/QwH1iNI1HyKbcZBTkXuCbhKP217/QLhVxhJEFb
         OH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365399; x=1753970199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYTWTc09XiaelzjVtYPzYhjlFtDK3ChqlxDovLkTtoE=;
        b=FuQPCKM0lMAs0pL+vBA/Gay4iPXmP8npSRLsqzILIpHpQSC5cFR+WKIFSz6McMUEUy
         +ip4ZQLmLQbWu2f7hXqbp4hQjgr0b+F+L5fJ309QwCzRw+dZrcUlaxfdW2+kC4328jVJ
         CvujRp26nLIhswKICMgZeGtkAZ4S1+zGblsmzs8kAidlDDPMCX6CUXpGOse6tfdCAdjb
         qVAkQHk6kfWiDbO3AcURHzzDS4+NOFuVfbedD4c8vxcxceei4MuQ9cvlhVYziiXtnc9b
         vJQdUhrjLrFVyreJAnd/MTQUhPGQXyqfuumA07ZNkBTYvzBj/u/pmh3J108uTh21e7OM
         fgAg==
X-Gm-Message-State: AOJu0Yy1YhC3JM9PslKEaPHZL83hQCDiMGKec4Rn5NVSC+/R2w18FSR8
	AyrCXumaWpK0GuhkP8ipN49BVL60YZAXNy2Fwtn2VXQPYkNLdEv6hcEIh08F9AJN0iA=
X-Gm-Gg: ASbGnctlkRRQJ96dn1qMu6YkEFirryFMaBm3BxBjVu9Y0tP94P5Worw0TJ+A1gRb2EW
	8jEsavKLtcsHl9lEPdAx3EZETYUcB2cUuFKJurr+GuXrHABOKlu0MTUoqDAnAi/WK8+5deBBx4C
	Yp9Wt672Gi728jsns7VG3Htkyu9xCMOvWoye7Ld5dlxQlsjeOzMgX8pCyy9xUOcwrl1ODIATJAP
	bcjCJVU801wHpSe0NFSCOYrrQzRtkQJj38yfts3jKJUnfCh+o8KIax04OLNqR5U0LFERQNVkl0d
	pJhQOKeWOh8+q9ZP7E5cCg556tOQrsJ5M6gLIwp35/GJDol5/DaVAlUl5iRWOd01w0sG74t9U/O
	A2JcM5234CHzmRGm24ZAkT7ESyEVv54lfRX77YUCZD6appBe3jo9+zGvl7qMci/b1WdmaH+oHN+
	nLMdB1T0PjXbM3
X-Google-Smtp-Source: AGHT+IFkEigCZ6sJ1rjDkc3I8yrqrXhO4W8lU33Z9QEAlANeXLFiBfl+v0dIWKjOVtP26nHzmGjQhQ==
X-Received: by 2002:a05:600c:1d22:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-45872668487mr2491595e9.30.1753365399512;
        Thu, 24 Jul 2025 06:56:39 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:39 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 19/29] mm/mm_init: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:02 +0300
Message-ID: <20250724135512.518487-20-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_145641_898322_96A8C2F5 
X-CRM114-Status: UNSURE (   8.97  )
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

Annotate vital static information into kmemdump:
 - high_memory

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/mm_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 5c21b3af216b..fd577f988f79 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -32,6 +32,7 @@
 #include <linux/vmstat.h>
 #include <linux/kexec_handover.h>
 #include <linux/hugetlb.h>
+#include <linux/kmemdump.h>
 #include "internal.h"
 #include "slab.h"
 #include "shuffle.h"
@@ -52,6 +53,7 @@ EXPORT_SYMBOL(mem_map);
  */
 void *high_memory;
 EXPORT_SYMBOL(high_memory);
+KMEMDUMP_VAR_CORE(high_memory, sizeof(high_memory));
 
 #ifdef CONFIG_DEBUG_MEMORY_INIT
 int __meminitdata mminit_loglevel;
-- 
2.43.0


