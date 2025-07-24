Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F00C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qf/VqrIHQh0utzrTdiqqaO7yt4rF9Ojfq/Zu+7lemII=; b=TjQ4tGazOG1QvhZWROLogQnc0j
	9LSZkkP4w7dF2chI0AWLr7peLq1bgc2/HxW2i2KRkzT/pUdhPufXhDy6TgrJXbctWw3XiJbhgZk63
	IsvPEFiBMw5DfGtvvA3CsTPTyMY8L6gOvXPROQd1mB+znWwNcj4ZLTRZmHOg/yeMvBlQyTHKENojO
	vZGEHqmM2LWqQFjUHRYWYKWFC/R6Uf2U2bLx4N3TNgG6KrRJublHREIvg+NROo98aCm5ojk0LKPSA
	9ax1xxIAqfGTtt5JiHG11FPxqyQlV6kmSieCuET9O6/MY7taT1G4PN0VDhkpfC+XQdfZM1x+fQFPe
	3lG6dWfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrS-00000007rCp-34WB;
	Thu, 24 Jul 2025 15:27:58 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR3-00000007epm-1oC6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:38 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45629703011so7323605e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365396; x=1753970196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qf/VqrIHQh0utzrTdiqqaO7yt4rF9Ojfq/Zu+7lemII=;
        b=i3ljPXcn9/t099k7pgRVEhaE4Cx1zBoxoli6oVXJFbBwgWv7E3V7J2Zz6ylvQdMKCC
         6TFW84Va3N7MD/f5ZiBDJIb1jTWW7+cmxuEKyXxZQ+xD/yI/2Uz+TF33PDjRozQgoiLD
         OXY6KtfwECeYLNaoGcYELnEAymhUF1lO/4zVUEorwdVp7oVfIbihN18eLfvHhpRShl2F
         n0ssAwg7QQwajUuCPTH/+K0NVgCvkV5dkwLU81zRMo+V/R7//bRGV6eL6cyPTsqNjF7f
         w18p4rw5+QAnMyBRZzXZFdmSXg3iBDZ2BH9vgatgfZJAohJtiMNXnTPrmRWdLctLSkQn
         zJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365396; x=1753970196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qf/VqrIHQh0utzrTdiqqaO7yt4rF9Ojfq/Zu+7lemII=;
        b=qAZyViOS0iIeZF1YStOlKB+TUqWCPscE9AUUnOxmSpsexTNf/jY5zPrZ5ZAdB6QqmA
         c7QaqiLMfFF3aV0OGuVME3jISIBcoGhFJIqxg2pwAhOd/TH3XdkGJKJ4Dl1RLqO+kadD
         3hSPzMdOVwc2pexXdloolB28p/bTE7AgnsUL3NsuPolBQoZQlywz/RXO0qh5W35+0lTD
         f+LBugYWGxoT7fD5KRcX4EmF2wIH/DaAj1+AFBzxq+awI5uSAw0w/d4GSivHHs/DQJwq
         kXbQ7hDoNrdAGEOvITK5FwTAGJX3lUEoAa6qWwg+dHwO2lLUQmoSxUeRWvw/XuJ+voqg
         timg==
X-Gm-Message-State: AOJu0YzK1Eqjc1PfYETsx5s6G0gENbLl+aKQqhdCO/mhVeJJcw7w3vVp
	Xjss3Fh6taJ6OcAAB4R3kj70Wu9mSetVBpVIX93UXi11/9pn3h1q45DxmFJKmcUC1t0=
X-Gm-Gg: ASbGncuMCgBsyTmRY8W6H2MbmDiWpNh1Oyz9olQLoMpDBX7n0+1rKEls51BSOTy7FRq
	Xbl4b+dA+bIn28a0Ys+lXKsGqaWNJ3398Q/ml1RDFK1yotYOi1oEtUxzWlG85JQQuUQMOEsOonl
	1/JO8fvmqic3iEhBNY6euDkOP2mAaj8AS8V+l5iWHwAg/V/LzFBwMV7QH7ok0PmzEMU7quH2kCu
	I5A38M1y40AlvHovocVFjh0+IhPjEStKcx9qz3CHcz1yyI49suLdT90Q0Zw55xv5zC5YEo152/u
	Td9gZa+k1+HvQUS5t8IuK5Om8IGI+ChWVp8Jikte2NoPDDzJpnsTP2eRgZlQddBF+ccIGm5n4Ym
	T8Y8ic98W8MGDNUiRfnktKb8wZX2/C63IO9FJOGnUZFHvmXygsv9OiMy6vwxj7aYj2073b5Rn1g
	mslsibGGKnWRzT
X-Google-Smtp-Source: AGHT+IFzdwFCiaRsVqkw+Vzf0TWhLQA78AFXGtgtYDTFYK39RF9ZemaLlLUrmcl7qJaLyA5hKTyeLQ==
X-Received: by 2002:a05:600c:3b28:b0:456:24aa:958e with SMTP id 5b1f17b1804b1-4586a8cc2famr61338095e9.0.1753365395873;
        Thu, 24 Jul 2025 06:56:35 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:35 -0700 (PDT)
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
Subject: [RFC][PATCH v2 15/29] mm/init-mm: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:58 +0300
Message-ID: <20250724135512.518487-16-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065637_467144_02478901 
X-CRM114-Status: UNSURE (   9.65  )
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
 - init_mm
 - init_mm.pgd

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/init-mm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/init-mm.c b/mm/init-mm.c
index 4600e7605cab..2dbbaf640cf4 100644
--- a/mm/init-mm.c
+++ b/mm/init-mm.c
@@ -7,6 +7,7 @@
 #include <linux/cpumask.h>
 #include <linux/mman.h>
 #include <linux/pgtable.h>
+#include <linux/kmemdump.h>
 
 #include <linux/atomic.h>
 #include <linux/user_namespace.h>
@@ -48,6 +49,9 @@ struct mm_struct init_mm = {
 	INIT_MM_CONTEXT(init_mm)
 };
 
+KMEMDUMP_VAR_CORE(init_mm, sizeof(init_mm));
+KMEMDUMP_VAR_CORE_NAMED(init_mm_pgd, init_mm.pgd, sizeof(*init_mm.pgd));
+
 void setup_initial_init_mm(void *start_code, void *end_code,
 			   void *end_data, void *brk)
 {
-- 
2.43.0


