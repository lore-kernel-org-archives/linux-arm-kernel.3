Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72273C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJKFOh1t0BpMtsqdCvtkoNZefWX67AppBNjz3MRLfF4=; b=RXyHayP4z6rmq8nf4ZMXrhP3CG
	9gk4ErzS7+DAxOmNSp92ha+YlpqhHKyzHAUO2I1VYoHIKBYUZNYecn5Xz1t8UptQS+XDgyNkUzDVk
	MU/Ca7DpjXy+aMZXbKs2updE+FgltlAn5JJCUcQika4HmJZQ50cWGpGk5kPoFZPo/haxcP4U9b8hT
	+Gfmn3U2sU0d8ULo6bae2meHhTThICq1rFyC/Gj3R1XBxNnU3E2FI3XuKf6A5jq9aS5w/uhjiXVJt
	sVQ4Ccq6f0pMaP2er5w6XaZivZ3tA/6kDurp7AcXi+iZTcdXynFIoHDqjXpRP11rh/OGoEs/NVENW
	8IeXVmOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrU-00000007rGb-3HtF;
	Thu, 24 Jul 2025 15:28:00 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR6-00000007er5-1zct
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:41 +0000
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-455b00339c8so6846115e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365399; x=1753970199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJKFOh1t0BpMtsqdCvtkoNZefWX67AppBNjz3MRLfF4=;
        b=X9VvbsC8AR0/s/0rgeWUBkPMrIkYk50GokGVjxXhzxyGIDqW+9PhzTqwhkTDmF5urP
         rmrVyB/Y0r/FP32OVgTGIrtLaOs3nCpX9+rdY7li/8YB4aZ0WKQLOuEzKzI5GAHDsKO8
         Pex2tsM/EXIE2cPpjcQZd9+/QID/h8rHPYj+9EaxJLWX8kEuU7sdWVRRdQMZbT1mUc0X
         BBzA2b7hvDCIno+67x6AWTfVdyuVZmgdwt5lj3DeOqukHFj652kU2vD2K1QhsanAGbBM
         GDhnl6P7AjfG/6Qi7ibveKyJQO2afucb0z66UjsX8PNcOHKHfmjkxKO2YRRq72ZWRYkq
         KWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365399; x=1753970199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJKFOh1t0BpMtsqdCvtkoNZefWX67AppBNjz3MRLfF4=;
        b=gCtOaBg7IQbZEAhHGoHZW44u5v8ub6RvTdICLPgtFff5CLBgcq9icfF/7ppX9j2LXx
         zazYIIeS/3dHQti16IMw5XKYbbhaF2j19UOWBizntTTkEF9UbeST/v5NCPfIX7yzMEDe
         8eSDHe7GNIojFMoOz6wKae5HYBfYkFdaVle8j0B8m2+mlZy3JjtjUj3NRs6tlNK3wdZH
         pzhZvE9DzDVPSGrH38QN7eB0BPQM1W8IIt4hbfpRjcZMTGnitU1sE+DZXHSoD/X4JrC/
         bMveBi3jTpLoCm3gVeIbEWYhNuiuUJEd1c/hYbOkz8KvVK+aYOKt30eGDvrwMMn0GN+A
         y3XA==
X-Gm-Message-State: AOJu0YzWTC1yxeYo7RKP0mydNyo2hR4xahRq+9uQ4nn4cP++Lj29dXWF
	5p3DOQVMDWYL6uKvreOT9R0vs/VrEZfkoODMtvX4EBlQdcGZpyseTnqe97oYYVMFfao=
X-Gm-Gg: ASbGncsjR86jK66ioAFN8oQDMTb3M4WCPinFqjGK0CMY5QysuwVdd7+LifYYUpsSEgz
	nDjdD2DUvqIPbTux4z8wCJcAGLbcrzJNeBzKh0U2NTHjcGANxFksGVq3/1QtEUyuj1SeXyOP4qy
	xcvzkVQeNlerF2rLkRWHOgAi5P4yKUq1ZOl+d0Wje6Y2xDTuoRv7bDPZeg5qNBTQp5zVdEtycXP
	67pfxg1pjxqgzY0vNjRmJPvIdEg7qbhmridkouLvMnhDwD4QL4HR5Wir57meWhBPSMIwKWzuvyj
	5sFe0sW+dRpyH6w0DUX6S1bM76xDtqo4Tl6Z7MO65wONlzzl6ekvgxUmW/YoRqGfYM6XPG2rTD0
	dFxm0UmC3CGLjY3FZ3e93T9h76cF5BYcXVIZkIFULpYn6JuEOt+KL9ERDvuW9SjL96waUMw0ptn
	rmV5Ur7REcPpWG
X-Google-Smtp-Source: AGHT+IFBpfszojCM9BH8+214LoTonUL/68z7rgbLH3wV7lPKq/S6zSGoTIX7zNxB5lRzwaUzCOOn2w==
X-Received: by 2002:a05:600c:3ba0:b0:456:8eb:a35c with SMTP id 5b1f17b1804b1-4586ef5cdb4mr25803445e9.31.1753365398629;
        Thu, 24 Jul 2025 06:56:38 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:38 -0700 (PDT)
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
Subject: [RFC][PATCH v2 18/29] mm/percpu: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:01 +0300
Message-ID: <20250724135512.518487-19-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065640_511637_9F4F9A22 
X-CRM114-Status: UNSURE (   9.53  )
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
 - __per_cpu_offset

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/percpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/percpu.c b/mm/percpu.c
index d9cbaee92b60..0cfe4d7818e9 100644
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@ -87,6 +87,7 @@
 #include <linux/sched.h>
 #include <linux/sched/mm.h>
 #include <linux/memcontrol.h>
+#include <linux/kmemdump.h>
 
 #include <asm/cacheflush.h>
 #include <asm/sections.h>
@@ -3342,6 +3343,8 @@ void __init setup_per_cpu_areas(void)
 
 #endif	/* CONFIG_SMP */
 
+KMEMDUMP_VAR_CORE(__per_cpu_offset, sizeof(__per_cpu_offset));
+
 /*
  * pcpu_nr_pages - calculate total number of populated backing pages
  *
-- 
2.43.0


