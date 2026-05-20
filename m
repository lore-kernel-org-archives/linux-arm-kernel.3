Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61A7CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tlJTNnuSEkuOFcK//QE/3Ty9SdRnFwE8BVFotGGF+Qo=; b=a8XenWZaREPLMryyxrnhahRbdt
	0P9ff7ajPrOYvU0rhTWd1PhpGGh//1koxdwJGCHe7zdxFWLLDlUnT5Bhqy7c8LwIyQTU8FFXduBGt
	iJuDkFxicZV+IoA5A9rNGqQD8WUpzgQw/l0znu6xkPT3povSCtS0jEpuz0E2KytXb6gahV0Sw0wWA
	E7d22Sv7aGQ1xqFOIPEFwDmXKBDfINxl1Wus7aMz9ZXCvBwoKF68hXgmvGDoc/reWOfJGbexwIw6j
	19Slu3ZewdC5jJV+96TvkFYR1HRT2oxuCVL4yii7H5e+ViFPmu1022BSxVapibmHE/OfZ32gyk/fC
	rHODSJNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd58-000000046Eb-26ME;
	Wed, 20 May 2026 09:19:14 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd55-000000046CE-2u9h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:19:12 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-c82a6278a4cso3571317a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 02:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268751; x=1779873551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlJTNnuSEkuOFcK//QE/3Ty9SdRnFwE8BVFotGGF+Qo=;
        b=E/56IJnWJBxHQu872REyMYghclNbpooTl0ABm8iRv+ASC/2dGWn8nztpZCrmEQd4/F
         D67huKi4ytU9P/jslK8j9EvX4M2IzX2w3uk8iXPvkS/tdrjL4GSA1q4LjAvDmE8JnFH5
         usvLNgfhgP645BEwO/l6PfJ2rwxxEIuLlQ7CZ/oJyOCk4owDfitDiLdni/uswdR19vGt
         5xRJD5k/XnP2/rExtr0NpYgCnuV2TWaJkcMkjHKVNPpnxjC4XROb1emJb5ZGRIVEZk8J
         o+Qc8IeQRIWVs42QyPzooF/pc8DIm1tylfN9MbtHMMdrkHItRugH43c75GZ50xTyuhI7
         DHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268751; x=1779873551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tlJTNnuSEkuOFcK//QE/3Ty9SdRnFwE8BVFotGGF+Qo=;
        b=tD4/QrDVEk8j9MHnsODjZobrvJUs1KH5QlBrKZZ9dD7QBdB34zfRZEianzMxid4qEx
         5n1Y6CQRll+83Vl8PUpTDh7VxgiUGP07vj0t8sXEdDZCW5UskAzdj0rhH1xHdLML+tci
         pRnUOxGoLLCrXeczhl0DoHDSP2qU9Oi92nH7XM/9qeW3vqLkGho/nZ2WbQgHZdIVGWdf
         bOoZGFME79iolxpQfvRJQfU8/D8cFnFvqmN00H0MR/HB4Fva+c10FXs0ARJd2Qxtk69D
         xVVYKU3wqbRTGoXcLhYQ07ohdUxG99+5y0M2GKeBwheuUF4zVuORzUE4idcuMRu3/sIS
         7LwA==
X-Gm-Message-State: AOJu0YxyFCYBPFlRNEQ5gF1jYaUQ73aTzwG74BGBap/XlfYNziVJVzC7
	4NxBKIJ4YGLjUl0DSqxL8V4SgW1W5cDfp/yLo385i8Xr/eHMhZvxTH8wkFHBSiAlJMmJJDx9
X-Gm-Gg: Acq92OFthe9kVjdZn886ttynx6e+dXd44xpTve6Vx43oEQ17m6gMEK/fA1ACJ+y2X9e
	OKv2Xt/VvlJj9Bb/9+dz5QtrP0MxUC0w9XvI8zg+FRpCfIj4s/QelYTe/ju4iQtbIWwOxm8CJ6J
	wB0/XMYHS/XqMABHq1XdgyvAScs+0HAVxn1o1SPHnv4YdEK1WqJseOo4J6ZBS+8uyNh1Hqzbn9z
	SOYn7VsA2Zu/LlqUEowLoq9XYoVkRIIJvquHcQhUGhfDt/kbLfCJ5YPRjt9OPW4qxxiSYfOzKvz
	23+ZW+Wl7jIv0e/TUQAwa4ydUd5RbGlNy1WLatA8hg08vzunnAWArqFV3kMjL/tjB6duqW8CruQ
	liP+2M/k5dpHaNRY8fXJz9uYpvHk58sna/kqHzy2lqY8BuMCQT00MIYl387f9HAP7BIW8EfKVAF
	Ib27Oh0AxGyBYC++rtb2X2REr0COS7/3JRMlsMQQ==
X-Received: by 2002:a05:6a20:2454:b0:3aa:ec28:edc6 with SMTP id adf61e73a8af0-3b22ec63eaamr26158763637.39.1779268750848;
        Wed, 20 May 2026 02:19:10 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.19.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:19:10 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 1/8] of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
Date: Wed, 20 May 2026 17:18:37 +0800
Message-ID: <20260520091844.592753-2-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_021911_736954_2DAA33C2 
X-CRM114-Status: GOOD (  11.93  )
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

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that appends /memreserve/ entries to
reserved_mem[]; such entries have no name.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..313cbc57aa45 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -788,7 +788,8 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 
 	name = kbasename(np->full_name);
 	for (i = 0; i < reserved_mem_count; i++)
-		if (!strcmp(reserved_mem[i].name, name))
+		if (reserved_mem[i].name &&
+		    !strcmp(reserved_mem[i].name, name))
 			return &reserved_mem[i];
 
 	return NULL;
-- 
2.43.0


