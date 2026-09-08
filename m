Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E52C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZDBZEDHHg8SYIZt8YZAuqtQEWKDYqBFdIUGpOfM1ng=; b=FqMnbHNPQhW+vCKtJmhjAqhhib
	LnkwViMVYzmc1agB3i6DkOPIDNBt2QrQIbxkY61Vgsd2MWAoOadv6vGpWMcaw/OoMgB945dayVSJm
	Ybtm2xS30KgLs8OFkq9VdwLdjGQ8uMy+ur7TQRJwnQMyGkW6Dwr2p9lWmU5fnZEWDmf4X46milbBz
	+gKrzSmo4PgsOsQnFDKiCSZgPKjnHpPDbzZJ4XXeAmZd12CBrRjR06BHSqkMEfwg0gARXPY6LY7s7
	birrazrunJ0rkBZWxpbFe5ak4Xh2WXS4kfSOY6GA4/BNHbZn0hMlagrDSLO/zYXbqHvD0siWAajHb
	N3JMyWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ6-00000009QoM-377E;
	Tue, 08 Sep 2026 15:16:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ5-00000009Qnb-0Hid
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 15:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=jZDBZEDHHg8SYIZt8YZAuqtQEWKDYqBFdIUGpOfM1ng=; b=Q5o+3IVKjWLtpxMVYHBz7hmc5K
	ianHOwi5adTJcalNW/ty+WNCFTFxZD594pzJ3TAjnsVA30L0yAokdvyKU8TrV7yv5NvNqiL+bbUmN
	AVWPsoLSVMDXsjQc1mMPQgGHgg3gnFNwhlC4VkOfAGk/2ppf1tE02E7uPWyRlU8WFBITef8PLoDwl
	QBAb6w7tjHDX/8Kfs9D7D3VDIV3ky1tpmFi322VQxd2Hk25wneLPragZpTMcDqtK3N6wUWJvNi7aH
	vHvnCLep7E0eIL9JIWXVYbEwTyHQoCdpBCHJQ294h/oFKx5HvYb1rdCUBTsJq+ba33uk++jEiZVod
	qGR/Ho3w==;
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3xZ1-000000000AX-0KA3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:16:50 +0000
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688EYqqE1082297
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 11:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=jZDB
	ZEDHHg8SYIZt8YZAuqtQEWKDYqBFdIUGpOfM1ng=; b=pi2SEGTTQ3BGzxs7ah1L
	v2Q4FGn8fd1y6BTX/hVySPBNMfu34Pyg5I6AczMna0PydZJ4KnwOJSdvqZFzekd6
	LR1vfVFEhSaCiJc6KFf59RB8DZnxJnp2yE8cxGnja/jLGmZGR82PEtLSZyvTL0og
	5lFxuBd1ByPKYHK6FuUe393kiyB7OUywBvAWrXvCdA4BVroFPPdubZLE0iaSr0cX
	dlw6PArfthab3j8BNdMqq5hChipn6lO821E5zA1Zs3h9gTXGv+hrurQtCoTRmtFa
	FGLYkf7t9pGA0/C4o/xGnblYVaoStnvEy3iQ3LpScPxzsOzwtbeeiLQzcFejHqx+
	Cw==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjhqktawa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:16:44 -0400 (EDT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66f8a19cf9cso5124268d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880604; x=1789485404; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZDBZEDHHg8SYIZt8YZAuqtQEWKDYqBFdIUGpOfM1ng=;
        b=vot710CT26XLvDPtTBGvfhr85xQN5ZyUqkutQlXarM2ofXFdiq4B52APowqL5LM5zm
         bXE23dd3UpOasfiXxNvI4WCh4ovbN3OFuzKyVLYCWUDFRHuNZUxbUXHVr+RYm3kyC1Ce
         bcE9jqmfMQa8dogF/yRZHK2OnZbZe8EmZtfKmSaKvYn6dMl/bzKuKujxLMBwQc/zLgwT
         2SWJ/T54vHULtceRRACiaReBnA5zVP82k6pv7l+a3YUadlPg5CccvRKUW/5m6HnZRa5/
         2RLo3KyPNP4VIGi3gcXSpffSFb+2/rkchYsATWj0daf1d2GU+PH9In59fA13Q9ZO4GxP
         ZljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880604; x=1789485404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZDBZEDHHg8SYIZt8YZAuqtQEWKDYqBFdIUGpOfM1ng=;
        b=tJu1GzmK0e1uIBQXEecTyXn8mn+QJbc11j564oWMTqunrllTs0lmksfbP7BMOQmyjU
         nV4S5IK1nUe2wUuN+aIYw3No1isdGmeJWn62b5wAZb+rYBlsxuYkljoua9Eg1eRBMG1c
         xQKvitfXd9yuHacH66q3D0pi+3Wtg+SRD+t+c4+1srp5Em1KZzsEn3fJpvFtlCRIAmW/
         1IYdlGNGWxHBpoJx132zwbadbldgrD54uBygBypo5UOA/i5+89lLobI/t6zGpyY4zjtK
         KuRujGmYQzKCmeTMkt1T11XD0q9sx1/SD2LtMptuopLYO905Q91hHjfw3E2EF0yVYGnJ
         fD+w==
X-Forwarded-Encrypted: i=1; AKwUvBy5Ff4D+cJ2P5z9JMy0Ujo3DsEjoYmChxZYIOMxzgLoZqF5DQU9WwKbQlGQSQzaKR2uEABTk7wLv6sylygS2SGC@lists.infradead.org
X-Gm-Message-State: AFuF++kXSK0ViizURYTernabjN7+iL68+WgquE9ka5AQE1mKg98ygxo2
	basW4keBSfaMJJlNCS3nM2o8HSGiicxB0yYgHmvoHQetDvjWfJJ9Cm9xCfiuvgfuH6Dv+tQdVER
	VbamM96JsNR52bn1iOqJpoQTHna9Fv2JkBUW3d6EOGdS0iXVBH2PChL8MScD/HdNw7iRqIFOe
X-Gm-Gg: AYBFou0wT4SRPmFs3ImTnziOvdIZLphp3DaNMIo6pGjCDmEs6T3TlP/AZJsqxxQPx4m
	Q+0nJYFfnuku901HywgE/vKFFdEbHR7AXKt2LWehiPiBIP1a4HEm7HwFDNQLYi9dryjFBjJejYh
	9qz/C2HMoiwVdVLRHxjI2dXTYlK9iUQzSP2GtXVEc2jFk+KJeZ/MdyBTBIC1eZjYt202wO5rSTp
	PG945CRyHEayGMLcW4EPowW/EUJQUPOzlOTW2Oz7PN5IsMWrCCy0om0l0cM14y3uY5KFx5ZojnT
	cW+1CaPCZNtQ4cEck5tC4fxenmPKCJqGh3PtdKelQtwnjDae+TRBCfzOgqQ2lUFb1Zpy3A86fEc
	y9Uo3p/82ZvAVyi3Bv5XNZ26y9eT3V1ercl3drzcE7MQq9aOWcUdfIg==
X-Received: by 2002:a53:a0c7:0:b0:66f:c1bc:87ed with SMTP id 956f58d0204a3-66fc1bc8c18mr5315810d50.70.1788880603838;
        Tue, 08 Sep 2026 08:16:43 -0700 (PDT)
X-Received: by 2002:a53:a0c7:0:b0:66f:c1bc:87ed with SMTP id 956f58d0204a3-66fc1bc8c18mr5315741d50.70.1788880603125;
        Tue, 08 Sep 2026 08:16:43 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:42 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:31 -0400
Subject: [PATCH v2 1/8] mm/swap: add folio_swap_entry() and
 folio_page_swap_entry()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-1-ee6d01dfa5e1@columbia.edu>
References: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
In-Reply-To: <20260908-folio_swap_entry-v2-0-ee6d01dfa5e1@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
        Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R. Howlett" <liam@infradead.org>,
        Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
        Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
        Lorenzo Stoakes <ljs@kernel.org>, Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
        Jann Horn <jannh@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
        Yosry Ahmed <yosry@kernel.org>,
        Chengming Zhou <chengming.zhou@linux.dev>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=2036;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=1JS3V+JXyWaTrz9bNNi6UKDOHKnZIpXXTUnttstZ0Is=;
 b=w9CAxnD5RZ/nskXa7WUspsk5TqZ4u0clJSlm+62svGyMiXevHQW2C9NobE10fXR3pxRsqiJna
 uE3QKWw5vWDAR4klvdmTEM6ALzGzAN5N5NtTGukn08tXaIj2hcLErkj
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX9jMuIkp8EbBf
 MXr+eYeQAUUrRiL76LBq0vO5NIr+nEgNpSQshgxMwp8DFnhqRP+87PSTg0PN2rtQSgvFs1B320w
 2i0LRUz07U+u8kAyXmW7i9nstZ+d/fQmIgwLAsZqhhsKdWOWtWPHjUJTHkF92zvAzUgkXwUVzTk
 01KvPG+PawpmdciqKMOYWaxGBZv8miKOw9gD80OOy4egNBT/YdUabrDwOlHbtTkbs9wyXJ4LY4x
 OJsEuoYj9M4YkaxtOJO6pscVZzEWSLgxSDLF3yP+6qGHeiD/L+n5wsHvwo2MAQXAJ9rxzTAkWe+
 nJfi0JWj55SbEicTle8LGJ6SfZcwmO2MUVbQBCCoowOMtYK/1JZtF1swmPTjN+t4MY+WTHaC0DE
 KpF2tv5RfsNq7d3NNif364YSBqBj9XPene7tYyVNH8BX8SWOSc5i4rJshfTTJKEh0BN6e5iRgmS
 GyhVQ2wKScBzHf4DFAQ==
X-Proofpoint-ORIG-GUID: nZHP1S1AkJTAHxfwG72mBW3K2dBUFlQf
X-Authority-Analysis: v=2.4 cv=CuOPtH4D c=1 sm=1 tr=0 ts=6aa026dc cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=wCX1QjJdxvQAooojgaYA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX8KLIsIgTpKio
 rMr35xMc1OZ9GLPjR3hCJgd9t2bZJoQ8jT3AkPMcMNDkx6mJ5mvopoZW0sgzmS40V0ueFvWtHtD
 Cd/aLujJ7OQMm3F8BnLU8qoFeFSnzE0gTV085QZMbDGyYhD31sAc
X-Proofpoint-GUID: nZHP1S1AkJTAHxfwG72mBW3K2dBUFlQf
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=10 spamscore=0 bulkscore=10
 clxscore=1015 impostorscore=10 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_161647_552661_2A26026D 
X-CRM114-Status: GOOD (  16.40  )
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

A folio in the swap cache occupies folio_nr_pages() contiguous swap
entries starting at folio->swap, so a page's swap entry is just
folio->swap plus the page's index in the folio. page_swap_entry() hides
this behind a compound_head() call, and callers that already have the
folio sometimes open-code the arithmetic instead.

Add folio_swap_entry(), which takes a folio and a page index, and
folio_page_swap_entry() for callers that have the page.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/swap.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/include/linux/swap.h b/include/linux/swap.h
index fc290e29e4a9..1d979e76e78a 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -272,6 +272,39 @@ struct swap_info_struct {
 	const struct swap_ops *ops;
 };
 
+/**
+ * folio_swap_entry - Return the swap entry for a page within a folio.
+ * @folio: The folio.
+ * @idx: The index of the page within the folio.
+ *
+ * A folio in the swap cache occupies folio_nr_pages() contiguous swap
+ * entries starting at folio->swap. The caller must ensure the folio is
+ * in the swap cache and that @idx is within the folio.
+ */
+static inline
+swp_entry_t folio_swap_entry(const struct folio *folio, unsigned long idx)
+{
+	swp_entry_t entry = folio->swap;
+
+	VM_WARN_ON_ONCE_FOLIO(idx >= folio_nr_pages(folio), folio);
+	entry.val += idx;
+	return entry;
+}
+
+/**
+ * folio_page_swap_entry - Return the swap entry of a page in a folio.
+ * @folio: The folio containing @page.
+ * @page: A page within @folio.
+ *
+ * The caller must ensure the folio is in the swap cache and that @page
+ * is part of @folio.
+ */
+static inline swp_entry_t folio_page_swap_entry(const struct folio *folio,
+		const struct page *page)
+{
+	return folio_swap_entry(folio, folio_page_idx(folio, page));
+}
+
 static inline swp_entry_t page_swap_entry(struct page *page)
 {
 	struct folio *folio = page_folio(page);

-- 
2.39.5


