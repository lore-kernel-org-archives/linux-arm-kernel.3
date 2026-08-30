Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD85C61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dmcr4tzCXL4F7wgRjqJeFcGn1Q75Cerw60dFrdsb/pM=; b=E8698qaCNW1Ba9
	P+vl82zlJbvsoy8LnfQ6H94DZaQhpGLNOitf4XWJs9sa2TIIgSrsQCX7+vzODw9ra8R9jTPbBWn9B
	AjTsGGKxT9BJ8Rg+sQ2GkoOskP2QbWvMQ1kMaJX1xqT0ridkV4U0RT7GMMXA704zh9ltnoFJlnitH
	zYCs4iOXwZmXoLV5dP2e2HilZYQys60dZdxoZxuiNVSJnpAvqP4dY4/fZ0LqHabNhWm6rxn5WV9Zi
	jgLFiiPi8ofOpeerNY168/ZYXDXtEtjbv2olrJHFS5ergU/XdDJgbQrfGlVxHZWVKNpAhe11CZ3IF
	nxS4qNufdV4axkjDQvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crH-00000007eWP-3IQ7;
	Sun, 30 Aug 2026 10:33:51 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cr2-00000007eRP-0TSv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:33:38 +0000
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9poKm3276198
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=Dmcr4tzCXL4F7wgRjqJeFcGn1Q
	75Cerw60dFrdsb/pM=; b=UrN5Y7AlAfBbY4Fy/u2SJtnyl48+/thxogZMawq5vx
	GWDobDYzCPueT5SwmQqcFvh62bwzdLbPA0voxbttGPICDfjCp64zUixpqjHKv5M1
	60fDqXYLjHpqE4RUq/8b4UwHFwB8u+06Nm46g/H4mqnh8+duSlzN4blTnsZG1puW
	1cS5jLJWugFVEOIgAC/bcsaqQw5tqU373L1NN2rn4hsTy5BoFe0bQgt20RPpSYtn
	x/qBuhiaxKDwIdoDnZp+iwOV7pWzdAEXUfgXn5q7wxef/9rpinE0x+SOAwds3jM+
	gbL/t3e0nkJZwlwf2aJsn3xRZfPIV/wgtzdPB9V6UkzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbrfbvyp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:34 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso51276361cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 03:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086014; x=1788690814; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Dmcr4tzCXL4F7wgRjqJeFcGn1Q75Cerw60dFrdsb/pM=;
        b=RdfRC69lacmhykqCgA6vYhm6kVInW5BiuzrcpKUdjDtwdGR7mXnUrAcUk2W/w6CSrA
         4mggBu3dlvHPRt6RyL6KkHZANLrD/U0cmbPcGUwsahMmS6mQ7SXuz8x4T8d772zkhJ0D
         5Qby1HD9fRc1rIEsGjZWuFEU0fkJ0Np5U8PnEIf0p5H5Nup1T94oLPOO3QYSGDg4vvZK
         K5BKWUEE9OqXJKJwFDhGR76z0gkAey12dlf52hyfGs4G7Z+53dXovqa225/nveq+LYKz
         vlJBGuq2yF/fZIC29ewFNu/zIosaZfItbmhnKAb7YdYmjpSSWYY6lmErmuVDJziGI1lm
         nU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086014; x=1788690814;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dmcr4tzCXL4F7wgRjqJeFcGn1Q75Cerw60dFrdsb/pM=;
        b=Bw9Lf+GwsddJ+LR+m/URLtOo8Zg7KCaxCh4K9tsc4NCf8fS3vScfcOdEUe9i/OuKK1
         /ScYlAAuF7FKbyNre5fPM+Y6Pp23FuJr6Xu3TWIzqENoHwqqMtVgIyVF1u46pSwGEHwX
         pDW4r1Khm471hlIp30YU4O7UpbYIxBXzoY8qaGblbtlvfTdlv7R5A8lYG1IJ0GxQcD5k
         5j9KSe6UUzjTBoJLHKnnNA881QZHhaXaFhrTI8M/hWbq4Tzz0Sm1T0PtFkdJ4UhgdrL5
         zXXojB2PGfqOsC9IjmEyXsm41xOOuJW/veJRBlvX4XHkpX2bxFVlyFcOVpDLjSD8MIJj
         1l1w==
X-Forwarded-Encrypted: i=1; AHgh+RrlpqVgQSL6p7HmYVWkibsXIbRMAmU3/iYIfGyUIbUCYjEaeeXgKFCFTUxeppGMJj3WxxrCrLDSQK5M8B9xQVGm@lists.infradead.org
X-Gm-Message-State: AFuF++lSu58DGuZkQQRYfbaqPcZ9yTvuDzBJcivOFxNlmgioo4m7ZQ+J
	xt0GkltU3lgjREfauDrOC694silg2cxt09lrAVVldNXXH6fqG9Wb8YusVgIc6zCfZaCG/TT3P/0
	mU+SKXX/V1P0bLSp90vdDfuFx6Zi8BF6cj1jN1htVY3fTPzqDaFn7F44Hn5TisqQtbTDMXt5z
X-Gm-Gg: AR+sD12s9z29QJFqXqtJhLJ7zr+9W0eMNMVp7XdEvosIg0HafdSBVoGFgcBvJbnAUA4
	HYuxdPldUC7pMpwA83EqS1pwBOM1CgZu4Oq7JW/spuYquITGHtl336PTx3YCGgV0XPtJLJ2vIX9
	liy8NSX+KoYETZ5Ll+rIqsmKdrdgRZGhKTAfJ4VK25oLVXGYf1/bGzyx2e3ynZG/bGoOG9+t5pz
	S/4zmNdJ0bmq3nZwo/7601HrJ14TdB2lWtSnmzzbdicXUEd9QIwUIzwYug9IwHIXyh1jKsO7RDm
	LiuZ6jlcf8xIrxWUfcacfc7a1rCc9qOtgr/FeASvCbaiXDZc5olaSrxw7cqaO8QTklBtObZf6YV
	aAtOqMUGXriEjOOHWAHcQv8u62jYlSBmTiq/GvmhELg==
X-Received: by 2002:a05:622a:4d44:b0:52d:7b6e:4986 with SMTP id d75a77b69052e-52fb94aca06mr249250401cf.23.1788086009238;
        Sun, 30 Aug 2026 03:33:29 -0700 (PDT)
X-Received: by 2002:a05:622a:4d44:b0:52d:7b6e:4986 with SMTP id d75a77b69052e-52fb94aca06mr249246751cf.23.1788086004114;
        Sun, 30 Aug 2026 03:33:24 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:23 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 0/8] mm: remove page_swap_entry()
Date: Sun, 30 Aug 2026 06:32:22 -0400
Message-Id: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALcGlGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNz3bT8nMz8+OLyxIL41LySokrdVFPjFDMLM0ODlFQDJaC2gqLUtMw
 KsJHRsRB+cWlSVmpyCcgcpdpaAN3xYOJ0AAAA
X-Change-ID: 20260807-folio_swap_entry-e53d68610de0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=1676;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=URqsD108Ktb7Q1ul6tJPwzbY4nIKxLZRUx0agGsKnfc=;
 b=Vbu1vdG/yynRHwQQgggtra/gysbc3tRr4M+3u9Jf693fE4TvPp8VylrcVsbN5b3J6pcxUbsgp
 qB3DhfuPzdhCqmnLZqz/XufM/PRKZAua1WrSRVFIPkcEVAXKk9HZwVG
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX4hVJ2OUB1vCV
 1IM0ZC+5du2h+w0k5kSnQ5gEIAocqpLoryzJMsq1kwK45zwXvG3PmZaI5C0W8JpvS8N/3Pupuof
 jDSv83T3nmxiX9jpfcEzq1BDtnRi8Vf3RWpJle5zRGSm+P/D4P0Y
X-Proofpoint-ORIG-GUID: 3Czfdvpd4Ws8VWow2jSy6P-0YJBP26kc
X-Proofpoint-GUID: 3Czfdvpd4Ws8VWow2jSy6P-0YJBP26kc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfXyjiQMdbWSh8s
 F/p3r63v4lL8vHEXStXIOD5hvUJ+a+9xfz+IcFJm7KjnJduxBmlGNjPu1tcxQOFgYdLQK6naUEJ
 GZm3Y0wYqIp8p4pV+HNqH7N7LoPm5TwSdne/Qk2ZUnI05tPSCfj8iFWsjTu0g9p1eX6QUNr26X6
 RoEqscpj4rNXl6apiZ90zS2PPL8LMc7lzoLJGL/C9Pt4HWm7tUBQi3uJAz4BW2/Ucu6xhpIdRZ6
 NOndFcWF5E8CLPUxTQaLKeLLl/I3EdCkxh+X56Wr+2SI37Ao05Qgd4EUzu6EVD5tRDdCifD9dAS
 O9TVr62+jUAXFqHztJwKkYhMsWwlZy2IxoJc+8gXob7L32XgiVQhpMg0j25UgId6rGhWOhDJerw
 qZwZ7kZ12z+zSFzd7aQYoEhnwVDurHYUpNd+yxhINCD79x2x0nE+sciFJtT37q04+syFmUS2g0r
 rLxNGRpuC0EEILVtUvQ==
X-Authority-Analysis: v=2.4 cv=beNbluPB c=1 sm=1 tr=0 ts=6a9406fe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=FVoBsLlWJ5wMsLtFyMMA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 bulkscore=10 spamscore=0 lowpriorityscore=10 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_033336_273461_D581D0E3 
X-CRM114-Status: GOOD (  11.78  )
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
folio->swap plus the page's index in the folio. The swap entry is
folio state, but the only helper for it is page-based:
page_swap_entry() takes a page and recomputes the folio its callers
already hold. Several callers avoid it by open-coding the arithmetic
on folio->swap instead.

Add folio_swap_entry() and folio_page_swap_entry(), convert all users,
and remove page_swap_entry(), with a few other cleanups along the way.

---
Tal Zussman (8):
      mm/swap: add folio_swap_entry() and folio_page_swap_entry()
      mm/huge_memory: use folio_swap_entry() when splitting a swapcache folio
      mm/rmap: use folio_page_swap_entry() in ttu_anon_swapbacked_folio()
      mm/zswap: convert the store path to take a folio and index
      mm/swapfile: use folio_page_swap_entry()
      arm64: mte: make mte_save_tags() and mte_restore_tags() static
      arm64: mte: pass the swap entry to mte_save_tags()
      mm/swap: remove page_swap_entry()

 arch/arm64/include/asm/mte.h |  2 --
 arch/arm64/mm/mteswap.c      | 32 ++++++++++++++------------------
 include/linux/swap.h         | 30 +++++++++++++++++++++++++++---
 mm/huge_memory.c             |  2 +-
 mm/rmap.c                    |  2 +-
 mm/swapfile.c                |  4 ++--
 mm/zswap.c                   | 25 +++++++++++--------------
 7 files changed, 56 insertions(+), 41 deletions(-)
---
base-commit: da6c37ed8beb273e3308e42d4bca3ce11b4432fa
change-id: 20260807-folio_swap_entry-e53d68610de0

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>


