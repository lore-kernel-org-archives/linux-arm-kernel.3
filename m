Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20974C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQxVhQs93RF2j5r69/kyB3XsN/D2SLMeChyoBk7vwm4=; b=3nq+M5kJAguaUXKFad8wZhhagT
	BZHpyHcFumB2WQYhj7wo2fa49eNMsquf+SY9gngmsJYflnq8osNbUMa5BlwentqeEmZe4cMgVhqQ0
	jbU8vGUBsy7b66dSiKYXgEcBJdCCz7dARoJc0OTOqIz30dqxCm1J+Iymyl0yY0Swm9KkofBJVyXIO
	CJ13qdUvG0C4LY405USIaFQtWOUWRAXXSCqjb5Am+/mfmU5bsk/EE7Cof3NKptg2A3DrYx8pXgUt5
	Dkj+Q7nrjbgNtowD9Z9RT9jFJgoMzsW555Zr2ouymZl1b7PXBcTrDVfhriBxisYF8AdG9I/1nWiOU
	A6kh4wcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrR-00000007rB7-3SL6;
	Thu, 24 Jul 2025 15:27:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR2-00000007epH-1i2g
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so11782565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365395; x=1753970195; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQxVhQs93RF2j5r69/kyB3XsN/D2SLMeChyoBk7vwm4=;
        b=D1nN5Zl8DqMuP4mDSjwIbQlARrpCmDTTTRFfWJXv7vBUREA2C8ydUd0ujQojTDVyjE
         AfxD72r5oLtWbxI2lw4jP/A54xO5d5a/hfnQfCoiWnKnEnBviHp0QS2CH0rSdBPSH4C3
         mQxhtaSNEM/gnhnwPmiW6jKJzKsIpyVuFW0nL42bwzk9ypgfsrvFEW1xn8x7YZFYsvuO
         8Ujk0jqAuUdCwannjoxq4cRDiqZ/cDvRgE3MI0sAmriE3xDj0edS4uDHG/j7by/24gJ7
         jjowrw6eavAclJ3YDB1A2WyU473Ms304VS967f2bz+sApbrtjtgC3dHUnIFbsq1JQTmI
         YK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365395; x=1753970195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQxVhQs93RF2j5r69/kyB3XsN/D2SLMeChyoBk7vwm4=;
        b=H8mGKsfpOmUn/101ru0Vss8a0jVMiJGi4p7VnI1Wu+x4gkEjaXaauqJ/BfTnPzQOwL
         IaghvGxO0z0QKbJueQAinxOr6rCH5jWFM/kuzyn+qs9EADoUBj8A+noPNkpRloOVoNMZ
         HVTYVwSo52BJYmwlh9MBUxbj0NLKagWe+TDolnmtgQdN3ufEnLyj2WobaWwwqQevMOIy
         OtTUqw2j8olrGWs923cZm3mleXu0IoT+b/ei9YXMh5XFzfCVytzW3fv3/nBXiwrn5HNG
         +Bcd52EYoqeeOYbW0SFYFgE3EJ3PvZgMKtp3mQEE8EWCiBJKpm2gkxPukeoz4awMXeKU
         JiCQ==
X-Gm-Message-State: AOJu0Yz5EjMu7FrK+tLTmhWPCJ62+HzNXWHiLjnqDcVr6WFCr5tA2M3m
	Y5HqxII8FM0gR5O8ka4OoG54Ff406+AgDlmaLyXKsxXO6GPXstVu3RZeoK9xlkUIznI=
X-Gm-Gg: ASbGncsvtXDANmeyvjRiLhOmANmMsdWJzV91zHNINX0H7Pomnc7jdGB3NQosCaTkRXl
	DxkmeW3cjMtWhsOb9mC0yeeaJQk/ii5Ma+V8PSYbEvVUoIVVPLRhYL7q8RLiM12t2L+mZHgHZ+R
	oJIGpTzxwKm/rQ6hgdohVo7AB0jcFDfvzalCs2aIec3Vs0881lqQy5L0DeJmdH/KJkRYKQVPC6I
	YBYzaukAhNkSY+hcfYBRKwxYCEeldegxlZTPfSquBHAHr/E42xzLDpZ8aI4wJ9hWTbfGNGxzZ7U
	swmZ4B93+hFZGRKP9BCmMH5lF/3KCFWqJicoaNrfm2skd9xFt5OpWY2ksNvhBJsUXaS07s0pfs8
	Ckkz660KLI2JE+JbyFwsG2rlDDIhEw6zQg5fkoX0mHsL26GvCqdfHkUyxV1xY1cOXA6pQHnTmrq
	XXji1xeG1VN5L4
X-Google-Smtp-Source: AGHT+IGhn2BhSHWFDoozkG8rL01GLeqFkYg2AyJwTWU+9+XF/fbe0VNyrElgCTmDYeBHx6jzMQbcKw==
X-Received: by 2002:a05:600c:4e4e:b0:456:1bca:7faf with SMTP id 5b1f17b1804b1-45868cf76e4mr72058865e9.16.1753365394813;
        Thu, 24 Jul 2025 06:56:34 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:34 -0700 (PDT)
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
Subject: [RFC][PATCH v2 14/29] mm/page_alloc: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:57 +0300
Message-ID: <20250724135512.518487-15-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065636_443419_58575E0B 
X-CRM114-Status: UNSURE (   9.46  )
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
 - node_states

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/page_alloc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index fa09154a799c..5f0015e27a30 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -55,6 +55,7 @@
 #include <linux/delayacct.h>
 #include <linux/cacheinfo.h>
 #include <linux/pgalloc_tag.h>
+#include <linux/kmemdump.h>
 #include <asm/div64.h>
 #include "internal.h"
 #include "shuffle.h"
@@ -207,6 +208,7 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 #endif	/* NUMA */
 };
 EXPORT_SYMBOL(node_states);
+KMEMDUMP_VAR_CORE(node_states, sizeof(node_states));
 
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 
-- 
2.43.0


