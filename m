Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C41BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 06:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=sNEFbUB8zkEiOY+7siydPf06XIZN3M0pujEkAF8JWKg=; b=4F0tRGUvCijZqsP76DmHMi6r1n
	zY6Kz4OHCc3eFXrn4QCSgPNMAJ3CbogVza39XTWj2dqTJJTORAOcFzuuGRRYlfCn6uXGHj8ZMPdtI
	rK7SS9G9CdG5DC0y8FfMUxUgSt388UAs378pJIuGu64j3831P1Ji9M5r3w0XNNMD9vgsjSRmUcd+n
	KoggATobxnAqdpn2fwOdqXJSg/JwhLy5LtYqbPTmrDvlE4vww9zeQunMbVRI158IcrPDHjZqsEBh6
	rhz0c2mde0yqlMtxdbdtdZA3g6xkwCWqTdl0iS+ZtUhN+SYlXCNiBaATQkqBREzRKwUg3Oo4rUlKc
	J3jHnVgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTF96-00000009qCn-16i1;
	Thu, 02 Jan 2025 06:57:28 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTF7u-00000009q6t-310J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 06:56:18 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250102065608epoutp032df4fc8207b852bf00803446cea1aa99~WzcjRT2cY1627016270epoutp036
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Jan 2025 06:56:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250102065608epoutp032df4fc8207b852bf00803446cea1aa99~WzcjRT2cY1627016270epoutp036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1735800968;
	bh=sNEFbUB8zkEiOY+7siydPf06XIZN3M0pujEkAF8JWKg=;
	h=From:To:Cc:Subject:Date:References:From;
	b=m8Gq+02V5thMeV0+V7yRMqPtKsWWOz4WngveGYkSMF0N0PCLdnyQ0mHXEsLMz4708
	 HIFNW/irEhnqjeV5K/Q2+70iW1hQOQvPrAmjqZosbk0m555g/HWv1LNWRD0aUsjFO0
	 m6nZzcR1XHQ12fZ99AfX+fZIdFathgwc48RxR8Vs=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250102065608epcas1p254a56b40f1c2d8a0294d221363c825cb~WzcjB92qO1051810518epcas1p2A;
	Thu,  2 Jan 2025 06:56:08 +0000 (GMT)
Received: from epsmgec1p1-new.samsung.com (unknown [182.195.36.224]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4YNyCr02Wfz4x9Pq; Thu,  2 Jan
	2025 06:56:08 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmgec1p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CB.96.31735.78836776; Thu,  2 Jan 2025 15:56:07 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4~WzciQ4CEy1331213312epcas1p2u;
	Thu,  2 Jan 2025 06:56:07 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250102065607epsmtrp13b215c3c8fdd22b0bed816425b19b8f5~WzciQIYc82835228352epsmtrp1L;
	Thu,  2 Jan 2025 06:56:07 +0000 (GMT)
X-AuditID: b6c32a4c-4e33d24000007bf7-73-677638872764
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4A.D1.18729.78836776; Thu,  2 Jan 2025 15:56:07 +0900 (KST)
Received: from localhost.localdomain (unknown [10.253.105.252]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250102065607epsmtip28bf1b259f7ff31a9f81095f26868ac2f~WzciEPlfK2521325213epsmtip2B;
	Thu,  2 Jan 2025 06:56:07 +0000 (GMT)
From: Sangmoon Kim <sangmoon.kim@samsung.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Sangmoon Kim <sangmoon.kim@samsung.com>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: arm64: update memory layout for vmemmap region
Date: Thu,  2 Jan 2025 15:52:37 +0900
Message-ID: <20250102065554.1533781-1-sangmoon.kim@samsung.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFKsWRmVeSWpSXmKPExsWy7bCmvm67RVm6wdapVhbvl/UwWjw50M5o
	senxNVaLhW1LWCwu75rDZnHrQSOLRcsdUwd2jzXz1jB6bFrVyeaxeUm9x+K+yawefVtWMXp8
	3iQXwBaVbZORmpiSWqSQmpecn5KZl26r5B0c7xxvamZgqGtoaWGupJCXmJtqq+TiE6DrlpkD
	dImSQlliTilQKCCxuFhJ386mKL+0JFUhI7+4xFYptSAlp8CsQK84Mbe4NC9dLy+1xMrQwMDI
	FKgwITtjydsjrAXXJSv+brvC2MDYLdrFyMEhIWAicanDtYuRi0NIYA+jxO6WKWwQzidGiWvn
	L7NAON8YJS5u2gWU4QTr+Df7KyOILSSwl1GifxdU0RdGib2PH7KAJNgEdCW+zLsMViQiUCCx
	cs9OJpAiZoE+RokF746zg+wWFnCV+HHLCaSGRUBV4tCHZewgNq+AvcS0FxPZIZbJS0xa08oM
	EReUODnzCdh8ZqB489bZzCAzJQSusUtMO3CCEaLBRWL2ot3MELawxKvjW6AGSUm87G9jh2jo
	Z5Q41d3FApGYwigx95omhG0s0dtzgRnkOGYBTYn1u/QhlvFJvPvawwoJL16JjjYhiGo1icev
	7kKtlZHovzMfaqKHxOZlr5khARQrsWnfZ7YJjHKzkLwwC8kLsxCWLWBkXsUolVpQnJuemmxY
	YKibl1oOj8zk/NxNjOBEqOWzg/H7+r96hxiZOBgPMUpwMCuJ8EaEl6QL8aYkVlalFuXHF5Xm
	pBYfYjQFBuxEZinR5HxgKs4riTc0sTQwMTMysTC2NDZTEuc9c6UsVUggPbEkNTs1tSC1CKaP
	iYNTqoEp6uL+5H2Ce/m2NNdbJyhs8za9MHeapKT8pC3rVnSJlJ+o/3rj+Tz7uFmfDn8TjWhg
	iuZak2rEeX/CvAcl95uEuLnmLD+yUbafR1RPt2qX5Zq3Nd16aTudt5kqTbKyy3R6yM67Z93v
	IttyJYfpsxds0bo3TXr6TBuuzacf7Svn25K72f6qsu0O46aTbG+Liy25DHctPjPl4cSHx2ND
	PvjPZmBQdpKT9Ixc2T3zsM+5qRqv13U2uHb5nnnLaPIpWi3P8/Hd9T1OJ5uXCX+MlPuzfJ1D
	IfetpN1L+ldNmnTBcsnCV5ONWl8c+P9g9fwzhUdLBJwNg38dsOR43jy3yvNb7Bb1pULpPe7p
	umc7VpjvV2Ipzkg01GIuKk4EAJcYIWgNBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSvG67RVm6wblfyhbvl/UwWjw50M5o
	senxNVaLhW1LWCwu75rDZnHrQSOLRcsdUwd2jzXz1jB6bFrVyeaxeUm9x+K+yawefVtWMXp8
	3iQXwBbFZZOSmpNZllqkb5fAlbHk7RHWguuSFX+3XWFsYOwW7WLk5JAQMJH4N/srYxcjF4eQ
	wG5Gic1nj7BCJGQkdl7czNTFyAFkC0scPlwMUfMJqOZTOztIDZuArsSXeZcZQWwRgSKJ1Rv/
	MoEUMQtMYJToubSRFaRZWMBV4sctJ5AaFgFViUMfloH18grYS0x7MZEdYpe8xKQ1rcwQcUGJ
	kzOfsIDYzEDx5q2zmScw8s1CkpqFJLWAkWkVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7u
	JkZwqGpp7mDcvuqD3iFGJg7GQ4wSHMxKIrwR4SXpQrwpiZVVqUX58UWlOanFhxilOViUxHnF
	X/SmCAmkJ5akZqemFqQWwWSZODilGpjUZ69s0zN8udJYeT9Hx+mnd6LVpEz2eK62jpsZYlj0
	5/zT6+ptqanfdk/aqBca1R+7UyRTRWhCg+zM2X7BcUGfVYUMF7f9y/HO8rywNveA5L1t53l2
	hAR7zDqwYtvKRAO534uFPJadO3DI+Ma+DX9trgrdiE848KmqIvXCueuqzIttJgsI8xd/3pHU
	2bXv5d9PQZHTMjZXlKVd/1JeccGsflqKptLnwO171ke9tfr55KMQy4l98xZVqj2Z+rNCylzy
	5+6py/kUpbP7apccOJRv6WsetTvJWXrFZwG2xDKWreommwpvms8LXP/b4PbUSW1LMnbYfeK4
	umBmZebzK65u96pvnZ5XVHGO95lx6L+TSizFGYmGWsxFxYkA+bVu18QCAAA=
X-CMS-MailID: 20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4
References: <CGME20250102065607epcas1p296c550a7ba26884e1c2810f872e537f4@epcas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_225615_324278_0CCDB3AF 
X-CRM114-Status: GOOD (  14.22  )
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

Commit 031e011d8b22 ("arm64: mm: Move PCI I/O emulation region above
the vmemmap region") and commit b730b0f2b1fc ("arm64: mm: Move fixmap
region above vmemmap region") have placed PCI I/O and fixmap region
above vmemmap region.

And commit 32697ff38287 ("arm64: vmemmap: Avoid base2 order of struct
page size to dimension region") has moved vmemmap region to higher
address.

Update document as the memory layout modified by the previous patches.

Signed-off-by: Sangmoon Kim <sangmoon.kim@samsung.com>
---
 Documentation/arch/arm64/memory.rst | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/arch/arm64/memory.rst b/Documentation/arch/arm64/memory.rst
index 8a658984b8bb..43c15cea2ec9 100644
--- a/Documentation/arch/arm64/memory.rst
+++ b/Documentation/arch/arm64/memory.rst
@@ -32,13 +32,13 @@ AArch64 Linux memory layout with 4KB pages + 4 levels (48-bit)::
   ffff000000000000	ffff7fffffffffff	 128TB		kernel logical memory map
  [ffff600000000000	ffff7fffffffffff]	  32TB		[kasan shadow region]
   ffff800000000000	ffff80007fffffff	   2GB		modules
-  ffff800080000000	fffffbffefffffff	 124TB		vmalloc
-  fffffbfff0000000	fffffbfffdffffff	 224MB		fixed mappings (top down)
-  fffffbfffe000000	fffffbfffe7fffff	   8MB		[guard region]
-  fffffbfffe800000	fffffbffff7fffff	  16MB		PCI I/O space
-  fffffbffff800000	fffffbffffffffff	   8MB		[guard region]
-  fffffc0000000000	fffffdffffffffff	   2TB		vmemmap
-  fffffe0000000000	ffffffffffffffff	   2TB		[guard region]
+  ffff800080000000	fffffdffbf7fffff	 126TB		vmalloc
+  fffffdffbf800000	fffffdffbfffffff	   8MB		[guard region]
+  fffffdffc0000000	ffffffffbfffffff	   2TB		vmemmap
+  ffffffffc0000000	ffffffffc07fffff	   8MB		[guard region]
+  ffffffffc0800000	ffffffffc17fffff	  16MB		PCI I/O	space
+  ffffffffc1800000	ffffffffff7fffff	 992MB		fixed mappings (top down)
+  ffffffffff800000	ffffffffffffffff	   8MB		[guard region]
 
 
 AArch64 Linux memory layout with 64KB pages + 3 levels (52-bit with HW support)::
@@ -49,13 +49,13 @@ AArch64 Linux memory layout with 64KB pages + 3 levels (52-bit with HW support):
   fff0000000000000	ffff7fffffffffff	  ~4PB		kernel logical memory map
  [fffd800000000000	ffff7fffffffffff]	 512TB		[kasan shadow region]
   ffff800000000000	ffff80007fffffff	   2GB		modules
-  ffff800080000000	fffffbffefffffff	 124TB		vmalloc
-  fffffbfff0000000	fffffbfffdffffff	 224MB		fixed mappings (top down)
-  fffffbfffe000000	fffffbfffe7fffff	   8MB		[guard region]
-  fffffbfffe800000	fffffbffff7fffff	  16MB		PCI I/O space
-  fffffbffff800000	fffffbffffffffff	   8MB		[guard region]
-  fffffc0000000000	ffffffdfffffffff	  ~4TB		vmemmap
-  ffffffe000000000	ffffffffffffffff	 128GB		[guard region]
+  ffff800080000000	fffffc1fbf7fffff	 124TB		vmalloc
+  fffffc1fbf800000	fffffc1fbfffffff	   8MB		[guard region]
+  fffffc1fc0000000	ffffffffbfffffff	  ~4TB		vmemmap
+  ffffffffc0000000	ffffffffc07fffff	   8MB		[guard region]
+  ffffffffc0800000	ffffffffc17fffff	  16MB		PCI I/O space
+  ffffffffc1800000	ffffffffff7fffff	 992MB		fixed mappings (top down)
+  ffffffffff800000	ffffffffffffffff	   8MB		[guard region]
 
 
 Translation table lookup with 4KB pages::
-- 
2.47.1


