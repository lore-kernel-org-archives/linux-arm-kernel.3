Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5113CC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la6fP9HkJphfM0jMf+9F231C5ZYtMe+0kHUA15eBYp8=; b=cGVGhWCSQko9n2jU5qKtmMv7oT
	Vb1ywT7YtMcZqG4UarRj3/k7ztyfTtOghpxJ7xCA4oWJDark0o7+gkLFlxvn/9ctlgC+cv8GEedj3
	j0GMUj4cuTltPCuftvXf84qLg+57PIbjj3+FKvuh/Bry7AmCRUMj3Vkg4D2qiqBBIeQwTF+j1urz+
	BAqJ0ETyMs2zobGa2sNis+K0yg088CdrVEUAkel2qhxEaqb46SGNJKVnJVhXXNicQslbv2mpC6PVn
	nilCNjKEaYhGUfciwc7yVfn0FPgqa0t9thlf13Rc2h3IQC7EkyKte/PBuDVIdocsfp/UVVmUO7S/9
	wA9MCECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexri-00000007rfV-0oaz;
	Thu, 24 Jul 2025 15:28:14 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewRE-00000007eva-0iIh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-456108bf94bso6530565e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365407; x=1753970207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=la6fP9HkJphfM0jMf+9F231C5ZYtMe+0kHUA15eBYp8=;
        b=v1Pa/By0cvVEloMbZSYGUBOCesPjdu2xNy/rfR8n9qhJ/tV3L8pyV5APfmumESa4MF
         1LRCC/0YQHLSB2QTK0yEIHlF2/IZ1LAKHKZ9E0IAC+nGvGG7F80iIZh3XmAaEOFHQXhK
         71Hg1qWQB3GFuUttj7gfhadBUaSy01OQSVku+9EqVzxfIrWtuDd3K/ROQAIUK6k+NbxO
         hoL50DZKa+IWMRWDhYKRmsHUxKWwlxlEEAAfyVhDrZrTOsKpWV2BZQDVHL74+SoU1wjs
         UkZXGkCz/58fCPyN1lrFPrrKB7xeONDua9gX+BbJbpNceoT1TKvRtEh67xMnTdcwLmHw
         v4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365407; x=1753970207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=la6fP9HkJphfM0jMf+9F231C5ZYtMe+0kHUA15eBYp8=;
        b=VEpfxOOl9gd2ssAdYjUPZcYTwSdXxkZNl1ZvLnn63La1ehntQMLArBuY+ytT5NF7RT
         Vyeul4fJ++ygqYJ0zPr/fQmQL5CTBQIuJeKziwCY6qG60isupriw4lG9xMhxklhi/I8u
         G2Y84EtD4s8ionmPZNZHYK22YSiykBb+mkW9rqK9z6NKYMmaY2+Fdiz0jXjrU8H1By0M
         dxKvA5T2H0eda7AFAV5vqgOJn0VIC4tSWnK7fN5TzLx55hXgODa07bSBeBUNKsd9uc/C
         mqWq78oT1GnB3omN8RsLUXo8CDtG6xWL4Nj+SoeWQbS6oEM9pd71UOa6IFCY8dV/6L4s
         ojHQ==
X-Gm-Message-State: AOJu0Yx5nfRUmHLKF8upRAA8yCRw3BQJn4JzgeAB3A6jdXclx/aAHvrx
	NQyI+VlhjyZFhtctlrI253KcupBsvMUEAkDkH9RXWUe0BX+U6o8lqH+9zv01LRl2o7A=
X-Gm-Gg: ASbGncvJnmYHtKW29Jylpx0IO9WbVWdH6pgTVAT74DouHfYiLzDR+0ozlBEGbr7eccH
	tcivbvNx8zIPaG30pLPaxLl5UolX9M+1kqLl3oQSXGIUee9CA6CvROh8D4xMzvf3XvKvUgr58rQ
	MgFSLcVWunINTD7w8ya7Gyd+0W5+m7HY3WDZG8yd7pDC7MMSwV5LlmsSOxbRskuoIxntjD8eoFM
	G/ixofUhq1r6x0A9fGyO0+qE86a2B3ZbLsUwQuAvSSw2tmWANKxNMsAP06fESceiHSIT13KzWjR
	WTk/T7ohPmhJcTwx6mHVGbl8xYoaSc7ZRyLtqmasrIj+/ubaegHrxIbNoh27vwt6z1LNnIwiQxg
	PpzCPdFrUCjepLxrZL1rWCwL7pYAAF3i+x8aPmnskBsCU4vJ8neD3VBL1sIhzIuylyAB7NlezBH
	vlv7dqAjCTl0v9
X-Google-Smtp-Source: AGHT+IHN52iDsRUI3MC45fB2NHZ78a+PI04sVz+MJmf9Pj70BNaVdCA6rPCjq4NJ6xqIYAMwjrcKOA==
X-Received: by 2002:a05:600c:4693:b0:456:19be:5e8 with SMTP id 5b1f17b1804b1-45868cff3ddmr60788825e9.20.1753365406597;
        Thu, 24 Jul 2025 06:56:46 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:46 -0700 (PDT)
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
Subject: [RFC][PATCH v2 27/29] kallsyms: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:10 +0300
Message-ID: <20250724135512.518487-28-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065648_206059_8539D341 
X-CRM114-Status: UNSURE (   9.43  )
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
 - kallsysms_num_syms
 - kallsyms_relative_base
 - kallsysms_offsets
 - kallsysms_names
 - kallsyms_token_table
 - kallsyms_token_index
 - kallsyms_markers
 - kallsyms_seqs_of_names

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/kallsyms.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 1e7635864124..442dc13d00cf 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -31,9 +31,19 @@
 #include <linux/kernel.h>
 #include <linux/bsearch.h>
 #include <linux/btf_ids.h>
+#include <linux/kmemdump.h>
 
 #include "kallsyms_internal.h"
 
+KMEMDUMP_VAR_CORE(kallsyms_num_syms, sizeof(kallsyms_num_syms));
+KMEMDUMP_VAR_CORE(kallsyms_relative_base, sizeof(kallsyms_relative_base));
+KMEMDUMP_VAR_CORE(kallsyms_offsets, sizeof(&kallsyms_offsets));
+KMEMDUMP_VAR_CORE(kallsyms_names, sizeof(&kallsyms_names));
+KMEMDUMP_VAR_CORE(kallsyms_token_table, sizeof(&kallsyms_token_table));
+KMEMDUMP_VAR_CORE(kallsyms_token_index, sizeof(&kallsyms_token_index));
+KMEMDUMP_VAR_CORE(kallsyms_markers, sizeof(&kallsyms_markers));
+KMEMDUMP_VAR_CORE(kallsyms_seqs_of_names, sizeof(&kallsyms_seqs_of_names));
+
 /*
  * Expand a compressed symbol data into the resulting uncompressed string,
  * if uncompressed string is too long (>= maxlen), it will be truncated,
-- 
2.43.0


