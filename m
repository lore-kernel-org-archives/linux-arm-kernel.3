Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAFCC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx+zx3hCg8Qz6JMSxLg+rjsObdnsN3uv3uvSypyoc0Q=; b=3LrdoPUAFWZptPMthZXgUwN7LP
	Odty+jhUqDwas779QHT62DXeSifPHAWgO2F5osNzU+AsjvBEy75HW2GLVBjR581yu4CzB5qEIRckN
	R5goZlt1JnU7GUFNfKkDWZeFBxbCwNbXOQHlPUdoJfuge5tvjcbSrZuV1xLU9ag/XdQXIU5Y0/S0U
	UHoCmGZL4yDQWpIabejO00jr5t8XVvgFqYw87RfdhQtB6XQsnkJCc/Xczbc91CsSG+YiX2/TTGlCy
	c6/FSfZEfXpOgwhWLkuO8roz3W8w0IHU7DZfGfHO1YB7vIo3CIxSetQvhA5UCzdzHEAj1KPfFsscG
	hOHXeOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrZ-00000007rPs-3eSd;
	Thu, 24 Jul 2025 15:28:05 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewR9-00000007et8-2p8D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:44 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45555e3317aso5296295e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365402; x=1753970202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dx+zx3hCg8Qz6JMSxLg+rjsObdnsN3uv3uvSypyoc0Q=;
        b=FmepR+b2F+StdmCn0l89bYmAhru+sB/1VAtQ4IMNqPI9WfUzVuynBDytktJfVJy4ow
         amVddarlXimbyQ9z+Uh9Ls0VwXN9Mh+WRD120705U7DH5VZlNllY9bQdvf6wYfssnxS8
         iqLz4UgFZVer7sWK0F0AOiGYGjxNqmun2zldEtZ7mhQhk5GTNMBMYWnxvR3vKg5hFvHb
         hg2uPUFNDKPNpU3W6h/uLy/kihUUAulk1sMiRwgfzrbXKbRkSdgiLb1JAa0bANT4RV0F
         T3O1Whhselx3atESQPW/TfWzV2cc1EAm0HT0kY/YsRHCdRBryLdjlJApHvKWz/ftSVo2
         2ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365402; x=1753970202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dx+zx3hCg8Qz6JMSxLg+rjsObdnsN3uv3uvSypyoc0Q=;
        b=q6EoV/w+dBZfHc2VHqmBr5gMan/SrbIBHOJTIDnVUSFuoPAaJNCaRZLZrrmO//wdUp
         KG/TJ9ED7XpYM2l+FOqy9OLK9dMuCAVdwn6n1R0OtPvYfYzyvAbXHCVcquCHpJNEAHBt
         5ydcsxw538xjUrpqPI8wUCYS3U3OsLQKASGhlMyhSgw7Zn0EgOcmR2ylDuLln3lHDg4v
         dV4aQUcg/2Ls5+KIBBasWhTcb4sn0IR5JXna69XQ0iAs0BaOVpBgdhYp25+zAfcyizit
         KATKEZIGfw+u/9uEZ7tqAxc6w0dcVxZ9yTJrnjRtsZ2TYgj7eW0yx4iGi1y/vl9o0xUt
         u59Q==
X-Gm-Message-State: AOJu0YxpCWotFA1CR8USkAblIdDteQ2csmLaTZI7CbveNA5KJ6YyAHt5
	48lPcXVMiA3Pi/paYtPvgc9WSlU+QDfkIrPEF9f5biSF2b6taRI9F8jN1jdmJS8hNB0=
X-Gm-Gg: ASbGnctEZVtwG5CtSV2k6GsHCHI5X9iZtlpYd7Fbs6vGijk5LSOFINxlM+WHu5pnbx3
	A+gtRTEVJ8EJ38VWHkHFpel3tdIt3YrWqCaiC/2Wwa4WeAo9WTPuUcQ7fqSZsUMlh2bLjHiaj3P
	2sNr5oFEuw/dCPiVSE2o6Mts4Igq6IDWEVanbz1FPgUKCvgXOYsnNb4D/6bw3fN2JBA+LNU9j1A
	kQSfMdiHbv9jMAiX2V72XqgTj9L1b4wBpRvMGmqFCveGdIuT1CbNE0+C+sqCxC42TwYKXEaQ06h
	XhlS9RZyTwlD7xoJHA++LgTnGfcJ6e6+kOi4R7u6K5T4MDn9Uk0nfA9spulqj6C151ZuXGrbV3O
	Mxpyz8oZz/Xxn4BDBYTV0K+Sc+tiSeg50UlN4kA7MWX+ea2ELroLLlbpL6+52ibFtCkdo23m1r1
	u15hH9k7Q3ZYZL
X-Google-Smtp-Source: AGHT+IGliARSjFjzMbqI3XaGwe/LefU8e+9kx8i0i+1k/+nyeMB8SAYvSTjLiytSObV6pAe7PVl9aw==
X-Received: by 2002:a05:600c:3583:b0:456:161c:3d77 with SMTP id 5b1f17b1804b1-45868cff2b8mr75404365e9.16.1753365402037;
        Thu, 24 Jul 2025 06:56:42 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:41 -0700 (PDT)
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
Subject: [RFC][PATCH v2 22/29] mm/numa: Register information into Kmemdump
Date: Thu, 24 Jul 2025 16:55:05 +0300
Message-ID: <20250724135512.518487-23-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065643_728083_3954986B 
X-CRM114-Status: GOOD (  11.33  )
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
 - node_data

Information on these variables is stored into dedicated kmemdump section.

Register dynamic information into kmemdump:
 - dynamic node data for each node

This information is being allocated for each node, as physical address,
so call kmemdump_phys_alloc_size that will allocate an unique kmemdump
uid, and register the virtual address.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/numa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..88cada571171 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,9 +4,11 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/kmemdump.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
+KMEMDUMP_VAR_CORE(node_data, MAX_NUMNODES * sizeof(struct pglist_data));
 
 /* Allocate NODE_DATA for a node on the local memory */
 void __init alloc_node_data(int nid)
@@ -16,7 +18,8 @@ void __init alloc_node_data(int nid)
 	int tnid;
 
 	/* Allocate node data.  Try node-local memory and then any node. */
-	nd_pa = memblock_phys_alloc_try_nid(nd_size, SMP_CACHE_BYTES, nid);
+	nd_pa = kmemdump_phys_alloc_size(nd_size, memblock_phys_alloc_try_nid,
+					 nd_size, SMP_CACHE_BYTES, nid);
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
-- 
2.43.0


