Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D52CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XgllFUx1hMJXZthKN6RSylNEPxNp90PjmGPFYCczU3c=; b=qxnGvGuvWLirKMc7VZhcPSaylm
	KR68PsFNQsK5NEFPvN/9zMZru44wUGPbL6C3cnWYKrbc2WBVa/j4ybfqXQCT5pVY0pDs67nXgcuYp
	YghHtwkHQFrgpui3Mo5Y4mqz/esohUWAMTk+NLmA2TQZhp58nVUujrXtq9wiRjEu8I4l7ZFCtNRoX
	nh11Adgs5GJiA96x1VaZKTqC+t8wyvJr7L27JDGFNsrhEdWoxS9RxOfj8Ar3gMzHghVcb83CrI/t6
	sv7w+WJqPssvZZ3D9HaVSzlDeY2tqIR27ALktdD6tHi3kGDoJrF02zkNwUWr9F4S5PKr2esVPSzsn
	DpS3nbwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xe-00000008qPV-1sA5;
	Tue, 09 Sep 2025 17:16:54 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvww0-00000006tg2-2RIQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:54:53 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0E90814000E9;
	Tue,  9 Sep 2025 07:54:51 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 09 Sep 2025 07:54:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1757418891; x=1757505291; bh=Xg
	llFUx1hMJXZthKN6RSylNEPxNp90PjmGPFYCczU3c=; b=MKxJp5kiaP89vLxg22
	BOn2h0ywmis0W9knLLvxaGguspj1X7X+/7R94Doj3VQvQC/qyWWfq/uay1MryUK7
	LLeLQLN6fyE1elg07CMRvpEX7E/+doRX6IskuWB3ZkjzdNHycdGZUj7jMewHuw7w
	f+8Jl44ECgmO1ktauce3xwuIFMAMujRh8DBYj2BrKMUDQXkVKUTjpATwxSzlUDjz
	/mYvjJtYPbrv5VDCAVRC9iHjGbDX0HIewM2yG82lql5UxxkzjljwbycDoa3Pan/H
	gcYnSKRP9c/n0fUWZIRNOy8G+Rff7xhbS0dQFfFL3wTaLInnKfgE6P+NeoXMekZY
	66eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757418891; x=1757505291; bh=XgllFUx1hMJXZthKN6RSylNEPxNp
	90PjmGPFYCczU3c=; b=k/KfuZm7zAtskYp6dq5+d9FFBiL4NmLmgcKo2gl7PjN+
	xRLrZD8wJ2SPtXdSPMpH5EkgP8pmwUHK/UOXkA/AuI4o9eIjXscvBQyo7UyXIUYf
	F0xd9aUcbAc4DYR7c+5aC1K+kzHj7k83M9LvrqSVoDS0LjZ1VlsJyuCh9qKgujEZ
	SczBhQKu4vXqXb9q92DEA+e+A1NZv8d3km+UhiGj+rzaEmd+K33qOLsv0rN0JUd3
	Ve26ty/i4eh4hoeEZ1rt0JjKOxoVaS5FmWEDtPR/0CGfSCNfwlAwg5cT0YdA0mwI
	VCWQyK/tDxorjlzDo7Srb8KrxQhRlfl1QJ+ojjva1Q==
X-ME-Sender: <xms:ihXAaAkqbFOIv3rIpWZwCV5q5O3LbQALK0RmlDCt_fTMtKTs8jFv8w>
    <xme:ihXAaHFJlQiWPSEgiJLcEluQskKXzVqPbVosgNMaCQEV1I2BTv6TZ27vNPZh63jnB
    peqFoD5TTBdqy4z848>
X-ME-Received: <xmr:ihXAaJgSOKqGwFM3T6r1NZqrmAhx1xhvd5oTRFeZe0DXwDTZNzHIAyNMnLkUJo8vGDbdI6o2fJ_434H6P9o9RbFgs_HqEa92LGL6zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtdefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
    uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefheeltd
    ehfeetjeefvdehteeutddtteelgeduueetjeevteeifeeuvdefffdvieenucffohhmrghi
    nhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedufedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopehjohhroheske
    gshihtvghsrdhorhhgpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgr
    rhhordhorhhgpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpdhrtghpth
    htohepjhhovghrghdrrhhovgguvghlsegrmhgurdgtohhmpdhrtghpthhtohepfihilhhl
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhiesrghrmh
    drtghomh
X-ME-Proxy: <xmx:ihXAaMgCH-4IFoKCggPJRdhxxW_c-NLDQP3qwgZ79ru41V7mdDxhig>
    <xmx:ihXAaEkeMt5QMGal3ky7Tqn-Mqao_QI1w6eu2PeUcljYnqXN1j8JmA>
    <xmx:ihXAaIYOVL61-M9FdeLfj571KiOEpwuA0qVoWP8Ib6h-KZNLxAU7EQ>
    <xmx:ihXAaPwSP2fXcwlz-ZgHq9sKh5xvsk87k3wSg6sfg7Hgze-xfsY8pw>
    <xmx:ixXAaEHyLufroOn5rObo_ro8rYL8z--t8DvyYpvhnUrNEtlSWLzGoYdE>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Sep 2025 07:54:49 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Tue, 09 Sep 2025 13:54:43 +0200
Subject: [PATCH] iommu/io-pgtable-dart: Fix off by one error in table index
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-iommu-dart-tbl-check-fix-v1-1-c800a0375660@jannau.net>
X-B4-Tracking: v=1; b=H4sIAIMVwGgC/x2MSQqAMAwAvyI5G6gVhfoV8dA2UYMrrYog/t3ic
 QZmHogchCM02QOBL4myrQmKPAM/2nVgFEoMWulKGWVQtmU5kWw48HAz+pH9hL3cqEuqLFHtXG8
 g5XvgpP91273vB7vYJAZqAAAA
X-Change-ID: 20250909-iommu-dart-tbl-check-fix-23d5add6bbf9
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Hector Martin <marcan@marcan.st>
Cc: Joerg Roedel <joerg.roedel@amd.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2070; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=6iXD5m0xbJJ9yI3fFImUYVSx/Zs/cga4QJHzGSzB/10=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhowDoh3bfa+euaByMivv3/Kd+8yeirNcuFa7ZNsUc84+p
 Q6ZioiojlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABPhN2X4p+03de+iP49CTjDf
 an/B9UrtnKxKhVRyRGSSw/OcLpaOl4wMt1IePKoXWPlA66bcbsHdupYcn64m6Nm4M/2qPJ/yWHQ
 lBwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_045452_695454_BFC25D86 
X-CRM114-Status: GOOD (  12.18  )
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

The check for the dart table index allowed values of
(1 << data->tbl_bits) while only as many entries are initialized in
apple_dart_alloc_pgtable. This results in an array out of bounds access
when data->tbl_bits is at its maximal value of 2. When data->tbl_bits is
0 or 1 an unset (initialized to zero) data->pgd[] entry is used. In both
cases the value is used as pointer to read page table entries and
results in dereferencing invalid pointers.
There is no prior check that the passed iova is inside the iommu's IAS
so invalid values can be passed from driver's calling iommu_map().

Fixes: 74a0e72f03ff ("iommu/io-pgtable-dart: Add 4-level page table support")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/asahi/aMACFlJjrZHs_Yf-@stanley.mountain/
Signed-off-by: Janne Grunau <j@jannau.net>
---
Based on today's iommu/master (9bffaa5ceb26) [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
---
 drivers/iommu/io-pgtable-dart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
index 9a63c80a2786bf70fc2544b1f96d2e4c8591c2f8..54d287cc0dd1b8bb07eb437a23ae0e493645a80d 100644
--- a/drivers/iommu/io-pgtable-dart.c
+++ b/drivers/iommu/io-pgtable-dart.c
@@ -177,7 +177,7 @@ static dart_iopte *dart_get_last(struct dart_io_pgtable *data, unsigned long iov
 	int level = data->levels;
 	int tbl = dart_get_index(data, iova, level);
 
-	if (tbl > (1 << data->tbl_bits))
+	if (tbl >= (1 << data->tbl_bits))
 		return NULL;
 
 	ptep = data->pgd[tbl];
@@ -246,7 +246,7 @@ static int dart_map_pages(struct io_pgtable_ops *ops, unsigned long iova,
 
 	tbl = dart_get_index(data, iova, level);
 
-	if (tbl > (1 << data->tbl_bits))
+	if (tbl >= (1 << data->tbl_bits))
 		return -ENOMEM;
 
 	ptep = data->pgd[tbl];

---
base-commit: 9bffaa5ceb26d73344b1a16b745f363fb2a6f6b4
change-id: 20250909-iommu-dart-tbl-check-fix-23d5add6bbf9

Best regards,
-- 
Janne Grunau <j@jannau.net>


