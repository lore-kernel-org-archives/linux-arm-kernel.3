Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA90CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=osub7jqB1KkbojdE6IP/r6iEAlyJyU/eaCe2RQB9Q9c=; b=bg8BJqRjC1MG9Hg50WcMNwD/dT
	m6G2yMj/TUcJd7SVDaAcONasohWixCL2UPqvAedRQJ2aBGeymuQGKpXPE47kegGXx/gqasJaT41lW
	xDT1A0Wl/QnbMCOArCgjP+YcVqCXx5Z+W2f2RshkiYbiua4AOPUVuhe+Zh2rXqCSN8AtlzkK8Vt2z
	sTVn5+iGQCCPUnx1RtMlK33vu4tO7j2lcNaW/ZEzuf9BXC4QaTMh2n6DKYn4Ksx9Ei6t5a9U+j9XC
	yo78+4/nAzJS+LCO/BO7MxF3nkwBa59roVK3oSerVr/uZaXZC2s92bIn20zmUerWHrsJof7t1YPqO
	jxKF639Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xm-00000003ESG-0MHV;
	Wed, 27 May 2026 03:29:46 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xi-00000003EPK-1PR4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:29:44 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-83659d38e38so4603971b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852581; x=1780457381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osub7jqB1KkbojdE6IP/r6iEAlyJyU/eaCe2RQB9Q9c=;
        b=UBVZHyiR9v8k3KOo6WtdJqSHeUOW8/lw7rLcCabFnjp5O18AfEuwHm9iQUC2uFm6lV
         v2rpWFF4kDjsPzSQXQH+1wasZVQSSAUjOtIgJJX52/ANGN6NHGGdTU9fu3wfI+hJtKM4
         W+KVfC+bUX6wuAiuJIY7iow+FN0yWAK1UegFeKbx2BgYSQbW+rDtFKK18InUF+QsA/T1
         KAOa4B6lmIUOlwNir336VfmK7KY/fb8GaJnPI6l0rvY6o7gldgjQfE20YZsV9d5ghrml
         5AynPYDf/JdaI7FF4B0JY5P7iJMDdClMFE91aP+lEHYb1DCZ9ObDfa5HysbdjpKMS9VA
         fnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852581; x=1780457381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=osub7jqB1KkbojdE6IP/r6iEAlyJyU/eaCe2RQB9Q9c=;
        b=EzPX5nL8uGWVbjtDp9r/ynhjzVDv644Og/r6Qpoy9NJguDxgU4A+RKyWT0QwcU8pKN
         mBobUaiGjlXjbD04u/uY4xF7Dubq5RtBCk1PcBFZuHtfcjJualeXB5j05ykX1jI0Wydr
         1yAOlU0PmTq3sI/qtyLOa3oQ3zg7AF1xornqAYe8OfLGh+Cmt36Br0aTvw+rkk2aCLtG
         B/jG46rekX6fvHy/m59qqPaSizttpoRErbXdVtZVPaLhn5gm3dJcYkYzrP2hLnQzc6ak
         To5EN1TmSfyYCuVZETH4fOTgEfJ5N5t9nK76Li1Uz4dg6XhK43GZfzseIF0BKvrI0oi2
         gbSw==
X-Gm-Message-State: AOJu0YytHBdOM4EPONYWTwWS2ibAAygE2TzVFj3xNekNrrh1pAhWV1Zu
	1gpHSlUbqVNidGUqro3fcVI5tDS5FeMGmvkLjZTGYHA1w+AZ2rkM2EC/XQ1DXFQBnoV/VQ==
X-Gm-Gg: Acq92OFmt2bey4g5lN+E8G1kul0S4q/LTVLKs8ZIoc6qSxA4sfeBGsFkFphtrCk+fv6
	VgC/Pf7W3vPLdnsJHnfAoQq0o2h5yyjNyEaIPcFRbDHEu5SXMMHr1MxGzUfXionFpgyUgUjufEd
	El1alemIAsOgOHQmsh3651wQTpBdMVY7XfUsbOXM2BpEwQHXQviQ5vT+Y3O5xNnEu1hT6OjviRS
	jfIGc9YsJ2CEAhiJSE1JyXrFNqnJtdZPf38/xogArVVzFZ/VCSy61zOttw6R8Zke3hXHeyLNZS6
	gqCaISEnUjY4KBF3nA7MU5BSAI07VtzD239Ej1RJgIYKzJgPR7XUvS1vY4Zm+2RoIqqvEZV+xOU
	X3I1WK7LvEKFbxbFoNwz6RtrazMXWm+w9ORqPzYHbxa+rVSxrS3sYW95VFdLDvXlFY5GOFmr/ai
	UXGX8rg+AjMDyvqIBySgKNy9lGNAqztNP95G14
X-Received: by 2002:a05:6a00:7702:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-841dc7d511cmr264256b3a.25.1779852581229;
        Tue, 26 May 2026 20:29:41 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:40 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
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
	quic_obabatun@quicinc.com
Subject: [PATCH v3 01/11] of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
Date: Wed, 27 May 2026 11:29:07 +0800
Message-ID: <20260527032917.3385849-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_202942_372130_A52E92F2 
X-CRM114-Status: GOOD (  11.96  )
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


