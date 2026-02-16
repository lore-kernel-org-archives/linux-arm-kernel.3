Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08581E7BD92
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 11:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRwNEhUmvTLbFRShg2KQ8tlwXUhC3cx4ADbdrblYBQo=; b=eFxnGineA/S+MnlunIkIRmnUcW
	NOxyXUpOjq48b0GM81xjf+GC+qyaBm1K/j0c7mrLD+H/nj1pEd57/XkcntO1q/9q+5y23jWKpZhzl
	Bmj9xKusuzDKywE3OECMXm3SMqKerj9kUy/rkbfbHGJwwUGYccvjXiL2UVonSJOEn2BylPHfWi9gS
	nYYpSGKPfF3mDnyV2J01r2q0yFYel1E6q/tKKN61bv9YDfMo/erJuvoXnEtAIcttHndyXdr1mBV4p
	Yr/V4ArXE04iRWkyD5q/s8dmqvoH4FfKGHr3sLHrR+wYHKavpE6RND0CEESU/1gp+I5KL1iNXSEgM
	tgkRUXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwNS-00000006P0c-0OfX;
	Mon, 16 Feb 2026 11:02:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrwNQ-00000006P04-0U0v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 11:02:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G2ixa81827390
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VRwNEhUmvTL
	bFRShg2KQ8tlwXUhC3cx4ADbdrblYBQo=; b=cFv7RsB+AuZZdO35RCpDbFmzMEP
	L3JLZpeYBs2ujM59nwC+X/3ZrfbokDvNwxOacg5532LZ5wCD5ZnE5Qb27JwWC1R5
	WyRtswyn298D7pfUP955RL7SekpCQYd7HmvO/baSlv8QPUDs7WsTOnd7wbisOpDb
	mDUwYmrtCgKGRZi5myaLA3BZcuFL2c+hlbClKFAd4g0TheukZ/E+CNDeIS614iDM
	7JuzDq7C8O21rD8tKHREpDl028Y6vwXbm9cUiqWnG+dheD9NFKbhfc1510kLWr5k
	trEQzawUqjD5wIA3UxBcuADI1f5ICCCViEUM1wdSSxAe+a/Nb+u6HFxcm8A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cajb8v5kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 11:02:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb390a0c4eso2696720085a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 03:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771239770; x=1771844570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRwNEhUmvTLbFRShg2KQ8tlwXUhC3cx4ADbdrblYBQo=;
        b=aQAWChE/ym8tp59BPLOcchmvVcUqdfeg2l0/svw6kiKWY6wGSrk6dXutlhJQRYe2fo
         UBNivD7xcv5YuH1oVeqtYeyQkzqGPA/I5nTmWyP86GPWvZQ92R5+QPX/Av5XBrhu5Ynk
         PVJ2PU5A2H8GbHKO0M8veEFVvr7XCPTK6TzfYtibuE4eOYzSbpGwX/9RdomdX6dKgxAv
         BStguGnie8Cu0vPVOoKgYxf10Ef7guSzVmO99w3ECiNQtmYHdBOq4NABEQQS9iEUXFoi
         vl+pVwLx7y11EKDMe9ua6/F8+6teEaBSYauzDHUhktvmjD3ZcARCYij6KvrCEiYUwFy9
         LUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771239770; x=1771844570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRwNEhUmvTLbFRShg2KQ8tlwXUhC3cx4ADbdrblYBQo=;
        b=VwC7aXURkzKNDZlIECBqxWf3eoy0aAJgyh6eWNIrOkjovrfUXkqIdcMvOr1FOnFttG
         uLKeQbUZnsBaWfSFzl2A854RPN3eHwF6bYfYjteY6Ka3wM4KL1t9c3AWtcQkALuD2BXE
         GNoP7T9ivHqVlDMoXoxLfDggwWh9UJ2YN9ScPNuBleGg+6nT1+7ZI9nDiAcu5OMteaqm
         R8tYHAYxO88qJK2FFOCRSd1+EbM422aH4TgqggIfv3U8qEDZK5OD/e/fVHOUURlTZsQz
         G7/pKm81xJN/2DW8xxdC/8IGItX1vGypsGta0XUrPHP54NCsvmHbqXVjPMJGNp3vIqtn
         m8nw==
X-Forwarded-Encrypted: i=1; AJvYcCUzlVgxnH/NVSwVVGXuqT+8/RhWkf1vfEPg+0Tcy6JZe3D70/D+SHubF+UaSQtEPmcER8nkApqi0ko0+vlA0OtT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9iHFMMqNXluJHXyLJAy7rhcL5qlqLZEsBppVVV0m99eHpjzFh
	qd+o0uJjMZVegXjKrcTMEdkq4DKxCRJeXL3SgK5CR3omlYbuut6+8Q4xT1yJH16AN9V/x6BOY/c
	hZfMEW7duprXfC66g5QzUr/pgIr4m4eGCtuGW8GH41UxuZO/jcl/r4xRcBrXNTk6Zl5R2UT5ZNQ
	y8JM16GaZ33A==
X-Gm-Gg: AZuq6aLfOqrU6JWzSAShJJhAFRX6hvzWtzzTmLNcQbv4VZbWq347rnOdPL2SRfWOo2U
	kAuaNvEht6T5XJ+Ut5WJkQGy4BEHqPXp8mxWnFEFWfVx50AQ1a3Z6Y6vW7tY4QQRCxn6UPBzK5b
	40Qpb4sowT49V4OxHK9GKiobkmF+SN+7wDE5LooQ35ZIGUUkAqDvj9j1zlH9ouuk8LheCGj6mpI
	Nzqzs/7sMmmR3Qe4nTE3UsCYCjTHeHzkF/7+9y12CY64MfIZQBBZwOW0mttAQLNFlZgJp6ZtSpr
	21qHc0EiAFAw2XyazdxWgCEEXabyGbwsOmGNPr/aYcD2TYATWAuURZWrAjnYZx8kPgLreyPdD3Y
	3AwpHQmM3U/kHESZ7RYXCaXjFXUN2ucjBSnkdXg==
X-Received: by 2002:a05:620a:2a0e:b0:8b2:e922:529a with SMTP id af79cd13be357-8cb4bf871d3mr911282985a.19.1771239770440;
        Mon, 16 Feb 2026 03:02:50 -0800 (PST)
X-Received: by 2002:a05:620a:2a0e:b0:8b2:e922:529a with SMTP id af79cd13be357-8cb4bf871d3mr911281185a.19.1771239770058;
        Mon, 16 Feb 2026 03:02:50 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835d99e194sm326264725e9.8.2026.02.16.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 03:02:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: MAINTAINERS: Include resctrl MPAM driver
Date: Mon, 16 Feb 2026 12:02:42 +0100
Message-ID: <20260216110240.159691-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260216110240.159691-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=915; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Y700ckphtFaElEihoc8do7Y3xOtXhOOve2Pfa709wJ4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpkvlR7QXzXyi+vhWisoBG8GmOmpWZud4ndBMS9
 8yYXu8G5NyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZL5UQAKCRDBN2bmhouD
 16kRD/4ih1y73E8jop2emH8FhEHAuX9BOz5igo+4rDh6iVxF6biLVb31BW8obcdYY60AzJGlAkY
 sjWu/NxXGVaXjrMd2hZMorDBHNHwmvddWGhSXFmDV6Qpj/sU8VcY32dr0/XMbK2amYxEvI27UTj
 tBzvM43UuX2vhBIs6WrmwSOrbkpCg1RO6qJNF0GOxmqedWgdPeNgfLiE64snLNDMUgjAhnhnXVU
 pZAxSOjDlXs4DaL+M7SSj0SqBt8TP8ivk+tEwxpyxnZhsRh0XPsIBFyKXs8D4SWdDwZUWkLiekO
 ZYuaVbGSlAF+c5k8OfPJ9Df73cDl/bTnf5V00hHFT22HdC3TdLo3B+wApehziufRHLBwOVdAiDS
 s7trAUtHeSyZvlrivq30D8wLHNHzqHEJfUR8orMJWucNG7po5jxCCCmmVV9UNPzdmxacJHlumfI
 vygO3Y3WcySQg9bPSSerZRQ0T7Qk+KrLaBFfVg0H9AH2lquif1qep7rouIq+5KY3Wm1HGn8XBgl
 HZiIc4E43ue4fydG/B8N6H5sOISqvd5ZNHf8NiUTYlkprgtDmN/FT8XotHOSPvEeg3BVcxUTyiJ
 iHe0NFc1JNf6BN8WCVfk/U/ev6jwnop4cScRardWw4+5wqygXuyi9dpUBxBSJSnXEgaerQaE7a1 4egzm8T+oD7zijw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5MyBTYWx0ZWRfXwpYgz3jO+fPc
 KgLucPuF+d+IQ4N3XXv8daT5mrPFHV+9yH5JkwAHd+NzK574lAdRjH+aj0xePIA+cjl69sHYThq
 RAEtU3A0+6ca1G3qe9Pl64eIG29UCSMKIAfB94KFjuGq67c0X9F4l4g4LyxMn7dCcFfcyDtsaiC
 wXqZ0r7V8zNpP1qOdWiub4Bs3VnOyzIvf0WYHZphEzEbwH/7mFSUYCHQntQ47VQes2QB0ugyzlq
 PGKOFvy+Ce/ovmdGtju4J03hXlyP/b6qv7Lr04IK5LrVf31iQ/arb/Jtl8NFE9MMgG9gg0XOvGH
 VmLquzr6F9I5UcdWJB5M9JSpcDrDCjz/aWqKsRVrVp3wCymWJR24kz7ok8rDL+NVVR87i3tK67d
 gq3Ui85o1NTaDas9amSCIxX2muNw/E9T4zH4NwCwoyReOCJRBJ8wjCSu+qXYDgrW+OWQTg+Otrk
 8oB6iUxi2safZhugM4g==
X-Proofpoint-ORIG-GUID: WzMwjbszmr53_5li_1HmQdvcF1WDRoyj
X-Authority-Analysis: v=2.4 cv=Pe/yRyhd c=1 sm=1 tr=0 ts=6992f95b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WzMwjbszmr53_5li_1HmQdvcF1WDRoyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_030252_175096_B60FC0D9 
X-CRM114-Status: GOOD (  14.38  )
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

No maintainers handling the code (so subsystem maintainers) are shown with
scripts/get_maintainers.pl on MPAM drivers in drivers/resctrl/.  It
seems that there is no dedicated subsystem for resctrl and existing
drivers went through ARM64 port maintainers, so make that explicit to
avoid patches being lost/ignored.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index faa914a5f34d..199058abc152 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3822,6 +3822,8 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 F:	Documentation/arch/arm64/
 F:	arch/arm64/
+F:	drivers/resctrl/*mpam_*
+F:	include/linux/arm_mpam.h
 F:	drivers/virt/coco/arm-cca-guest/
 F:	drivers/virt/coco/pkvm-guest/
 F:	tools/testing/selftests/arm64/
-- 
2.51.0


