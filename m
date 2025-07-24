Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8BAC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=754ZhLeV6aTccnAi72YeZAlKqe4sOON/R6H0mwMKOfI=; b=gNVxRIH53NrEgHuo5bZrPJmfwd
	zyhu/ypkyUWQLM4MFCvJOemvHpQknjvWg9sWJcQyOtPzlENWoaCe7vOxUlX+wWiVNh9MRUG1/OXa4
	aYhFuZmHxEv2KRCngjUhMZarpgSFb0zGwiXFj7XpL0P+NOcx+SGrayOBzqbcaqkYFbSR+CkWnLp6o
	jQaNR7iTLqimtmjaVBBGoD65snUSSWr+4SlHs14+dI8dtzAJGbZak2zj/mgKpu/KXG0d9zDQa22xe
	LgFVg21wqxXL6CRZdloxwVEV1oJtS7f0vStsfPglGDGbq9ZLMLPzwSGmRfMHnZh4sUzXfcvovcHcq
	kBDB4bIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrN-00000007r3s-2AI9;
	Thu, 24 Jul 2025 15:27:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQw-00000007ele-3niE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:32 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3b611665b96so616202f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365389; x=1753970189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=754ZhLeV6aTccnAi72YeZAlKqe4sOON/R6H0mwMKOfI=;
        b=YZKDOn4J9p6bkTohtNvkT/ffAKv7juF2mK9seP+ko3HelY82Vm5TJyi/DxnxCT477k
         D62538JvXvk+pqGQXA2Xsw1ySLeNojHuySZiChlk54ti/u8beZpSojWKSTil1Sf3x+LN
         0j2heYcNxQynwZUenOAklpyfF0/nFoV4SqpxqS8v3G51YIDSmrw8C/K4cBconVF0W+CC
         B0vk8Qo1/14IjTPZu5ygCvCEeHC/uIaetm1xSp5cWZ7gee7lLI54zIXx3KLSpdHUATXL
         cf7umuFS6Eyuu2tgnIoYu5POwbMYsfp/oDd3UckylajiuzIhI9zJfPiK/Ep8gUG8C8up
         0FYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365389; x=1753970189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=754ZhLeV6aTccnAi72YeZAlKqe4sOON/R6H0mwMKOfI=;
        b=cNgg/4FJOkYqB/pYQh8ghu3NqcrmKENf20ADSlsegAIYcmsH31OKfRq5kVICaUPoor
         /JGNmxnxC04JNF3eMfmvh21P0sdVdeR5VnEvMroaXRoELlBI95Hq/qgb8LIBlPia+vOP
         ww0fXGpDUlGo7QkFJXSmfvKmhrTtGw/WQ0U/fHwDyiFyF8YSM6o188wOjqaDKdPZaV2c
         Q+ZsMZ3Lg79z7jZMJwGw9mBf4jn5TjmOzw5+FKIoGKzqkLqL911bFSkE6XBXooGVFjiS
         kVPYXzIBLrW6Nef0aOFbxWyA7XjL+UfTM+BOcrF6fx3H7kn7+n3mgMoGkjsioS6rcxuN
         P2DA==
X-Gm-Message-State: AOJu0YzG/k/8hQQR3Aogsx5tnpWtBxq60Z3dVxLbkP0aWLFULv4voXe8
	eneIeWJmVWCXpnnybe31RRJQdsUDHr/6bpJiReTc04iCByJAYe8+EcGnY0wq1M41Obo=
X-Gm-Gg: ASbGncvMDMC+y5sEZGmxjD8xKNAvgLSRBYbUIbYh3mB/RUh7zvPghf2FPGZ2qg8nYXC
	Kartc9Tm5IaAPbaGCjNCZGe/lHCxTT3fLcyBFKcxktt1gBgAbICWNqSeeMaVTQMLczAU542h3TI
	bPSOW2cwQ12Z44vM3GSeDjJSZY14cc78nk1G2PDle6COfpr5eR6NCgR2uIOOmmMROuAP2TM2hve
	/XaQBoa6sjM+ZQ6s1aJaLGmt3Xmo3Cys3VbaVGH9yMGkjPGjf7mkNb4IUpPVqM5B9kjfNR3oJZJ
	dKmtUU4hJdXh4gCGsbHQUZgS4UIRAkDh0bfma4COEjoXL03/CI03NlF6u3XhEjSV4r5XSdz3VEN
	wR8nPvDDOzh+G/XeqmEg4+cJCGYL/NPeLBChkLXpz4jJbh6nLEOIBsSH8tD7BnP+Dx5iMs5blLa
	GfCza/5v05c3Cp69f5hq5q5E4=
X-Google-Smtp-Source: AGHT+IHl6TFfQx8To8y+XEm2d27DSKV0h+MO3rvshokYEfPVyki8zgMiinC0EkzG8gsJheCG6bV65Q==
X-Received: by 2002:a05:6000:188b:b0:3a8:2f65:3745 with SMTP id ffacd0b85a97d-3b768f11dfbmr6433064f8f.51.1753365389405;
        Thu, 24 Jul 2025 06:56:29 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:29 -0700 (PDT)
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
Subject: [RFC][PATCH v2 08/29] cpu: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:51 +0300
Message-ID: <20250724135512.518487-9-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065630_944482_B92A9DC4 
X-CRM114-Status: UNSURE (   9.15  )
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
 - __cpu_present_mask
 - __cpu_online_mask
 - __cpu_possible_mask
 - __cpu_active_mask

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index faf0f23fc5d8..d48e4dd979e9 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -38,6 +38,7 @@
 #include <linux/random.h>
 #include <linux/cc_platform.h>
 #include <linux/parser.h>
+#include <linux/kmemdump.h>
 
 #include <trace/events/power.h>
 #define CREATE_TRACE_POINTS
@@ -3092,18 +3093,22 @@ struct cpumask __cpu_possible_mask __ro_after_init
 struct cpumask __cpu_possible_mask __ro_after_init;
 #endif
 EXPORT_SYMBOL(__cpu_possible_mask);
+KMEMDUMP_VAR_CORE(__cpu_possible_mask, sizeof(__cpu_possible_mask));
 
 struct cpumask __cpu_online_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_online_mask);
+KMEMDUMP_VAR_CORE(__cpu_online_mask, sizeof(__cpu_online_mask));
 
 struct cpumask __cpu_enabled_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_enabled_mask);
 
 struct cpumask __cpu_present_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_present_mask);
+KMEMDUMP_VAR_CORE(__cpu_present_mask, sizeof(__cpu_present_mask));
 
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
+KMEMDUMP_VAR_CORE(__cpu_active_mask, sizeof(__cpu_active_mask));
 
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);
-- 
2.43.0


