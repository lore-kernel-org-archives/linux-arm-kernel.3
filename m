Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD96CF3941
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TG3MkEScUQgKy+QWFE7rEK/ceT0KdBZscolLPvZ1jcY=; b=QvwYX3Xz89dy/JUlpMFx3ToEXC
	5C2mKp/E8kGJMofV58OEgy7xeiRzwwdnk+rZ5p4yLRFFx9N7eusUHz9qYMfXNPZKGQOocmw8TV793
	Ik0UDJs3m5wqmFtFPgP79BliYdKQbr3tQBOqQEENplhwMrK4ELsCSwbKcmVEyOenlOlZ+oOgz3TWA
	3j4knkSAuqBEBoc1+cbIpsyQnao7mxWG0RXzPti7KX5GmbZ9BcJVG5EckWOIvWfL+0IMMwPlRrVWJ
	Tldjl1MrQI0bmiEtMPEsLwpzy9t66CKFZI4/dTqZ3g7CgEINkqczJvr2pPYNkK3i5OSkNtF5ZtOI4
	D59VHvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkOB-00000003XLM-3n0n;
	Wed, 19 Nov 2025 15:46:35 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNU-00000003WSb-2u0Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:53 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so75161995e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567150; x=1764171950; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TG3MkEScUQgKy+QWFE7rEK/ceT0KdBZscolLPvZ1jcY=;
        b=YUusMjMi61KxqZRyKCiTEp54eVReQklh18bYGlzmZDJFZ68K0a5AKKm96Jw2Bn+KoK
         fQ5HjhaQfhIqjwWMHd66whA1DEY7EfY5fCLx1q1ENGsEjNnXUfpd4r4J2h/WA+9QMS0F
         E8OAI+VsHaRuLnTWEZXAidUVkDo+tU6RRugDTNVRZ/SyOu8T0IDn6ws4jIwuocMq3NZE
         R/Fc65SC/Af60useQva/jITAH0okjay8mdTRdyIwe29Lfj+gVgpmYZl+IJFxOE9wLBFu
         AyO9pquMxv6u7E9E2DX8o5e4WoDkUDRV989D9kk/paccOtMfS+A6H35pmOXgAayln4GQ
         NePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567150; x=1764171950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TG3MkEScUQgKy+QWFE7rEK/ceT0KdBZscolLPvZ1jcY=;
        b=m5hPkgjMkBLiB9rgSE10daPbgRlbxXHWgDg5WY5jvZzBWfs2fQR9V/J3p0eC+5Q65v
         oRsBgiMCcYaD2aL+OyTnUnt7VTih5+oL/tz9QrkI1yLhgZr6xfBA2ZmK9RqX3R850reW
         mH77xUJER9rCK5KOZtlvSbnPBXqCBmB5+ng5kDwWeBB6CQYqwZKGSTEDLB4wRQ2zdh+r
         Mt+0krOUZZsPaSvF0BNExKS3/I/uc0HqotumvcmdASHSteWyt8Y5HzUTbq7wVqGw884V
         b7aXnjJYQMBcIsbWJoOqkyKaFcd+rMm+rABv26jJlAZYy9LVJlKuiQ1+UtcQTX2tB0SW
         Zo9A==
X-Forwarded-Encrypted: i=1; AJvYcCWrOSaFIEEGqQ11WOFhS8L+oyUh8p+M6yoMvoMLr508q7QDgei5lgxuTSrl3sIsFVN67teZpyMlgJ9/7Sg6KEyj@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0kH0uLklLC4wcXOrH/jWttX4YlnM0K/pkmqiVzKIwRNB8ri7S
	ym52DbNQFV7VBlHdGw2jekXoUL1YfEN5VtIMFIAIxbkgYMfuB5fZLbZVBeKH3Y48wls=
X-Gm-Gg: ASbGnctjt0E0Xd3n2fBz4IBcNkaH2I0z6a3wpVLaiKcHGCrno3UyBUmaBEDFLxcyEuG
	bHwbXDTjGsFkyUPPBgZlqvKSiGXVqBn8wqr+4QBe8dSyXsl5eHESr68DuI5cntmvMly73hshFUe
	5gRfQeZZQNg53c5xG2iQbg9Ips+6Ujcsurvn+t7lOCzLodP3TkGl9VGOyZGHFQHMafGQ+aSH9fT
	UzodsvylgD5mXb5juf+OPQkiim++uKmViM8tR6w10W1k2yMKFaqX0Onm2+mUIIJX34DKS/OXkI/
	8mMcF6emoDY2ce3K2dR5sHebjSWSx1UVk33nuZoomf5xecV+zr/M1D64WI0Ev8x38E775tmDibD
	0626Jna6ocxOeiVmlvQNf3CdggfbfBHpkdIO6/IxP+aK9H1WGrNb3Dw70Y6jTaQ6pqTnmGx1hGM
	EoAfZtlMb0AQajbukeT0jBZRZwthQgUg==
X-Google-Smtp-Source: AGHT+IHArpVzpD3LO0mA1+dNKflLF3LKgYCdBzRW5r7OQjPk30YRri90746lAxdaW694nNfBsFGkIg==
X-Received: by 2002:a05:600c:a05:b0:475:dc5c:3a89 with SMTP id 5b1f17b1804b1-4778fea881fmr202472465e9.34.1763567149948;
        Wed, 19 Nov 2025 07:45:49 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:49 -0800 (PST)
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
Subject: [PATCH 19/26] mm/numa: Register information into meminspect
Date: Wed, 19 Nov 2025 17:44:20 +0200
Message-ID: <20251119154427.1033475-20-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074552_735745_77E76BED 
X-CRM114-Status: GOOD (  10.06  )
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

Register dynamic information into meminspect:
 - dynamic node data for each node

This information is being allocated for each node, as physical address,
so call memblock_mark_inspect that will mark the block accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/numa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4..379065dd633e 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -4,6 +4,7 @@
 #include <linux/printk.h>
 #include <linux/numa.h>
 #include <linux/numa_memblks.h>
+#include <linux/meminspect.h>
 
 struct pglist_data *node_data[MAX_NUMNODES];
 EXPORT_SYMBOL(node_data);
@@ -20,6 +21,7 @@ void __init alloc_node_data(int nid)
 	if (!nd_pa)
 		panic("Cannot allocate %zu bytes for node %d data\n",
 		      nd_size, nid);
+	memblock_mark_inspect(nd_pa, nd_size);
 
 	/* report and initialize */
 	pr_info("NODE_DATA(%d) allocated [mem %#010Lx-%#010Lx]\n", nid,
-- 
2.43.0


