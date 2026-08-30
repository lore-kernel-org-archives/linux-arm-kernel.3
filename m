Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AC5C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iltXE0WYwKKMJapYaKnipYxUvczqFD9fAUv3vS9XHEs=; b=1ljDOFf/ckS5USIWeSdY0AUxLC
	s6rkDBUoxPjde/aq8HlNX49wHdocyf65ow/mrPFupHqmPK5AiKIYn3cFNYTw1CtkKXFuNlNtwygee
	aCEPLl+uI9jjyoH0xg6xqC6zSh0JnRM5qZhmRJdBO3RItKxsh2v6+oWsaYHnq/p7gP9e+4cF8OoXm
	JKKwI1YVxpltiofgoOH8ILME2BQUhhhAyR1uDTXxD6PEJuh6GKBeSe7XAaBOMN85+mwr6NdUsl0Ew
	s7FCwYjxAEiDMDqRK4aY81FnQv+dL+QXx2m9UV+ST0eKARwoZbaXeqrhUdYH7WRJwgjM46chSmSjE
	CTxlfeaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crH-00000007eWj-3wrq;
	Sun, 30 Aug 2026 10:33:51 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cr9-00000007eTn-15Qv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:33:44 +0000
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UAUDwU4067940
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=iltX
	E0WYwKKMJapYaKnipYxUvczqFD9fAUv3vS9XHEs=; b=CGyQ1V6vUw+MCMQcXjjo
	5rUZAS8akibjKgiY8wGGK9WLmQ0GU7BqMd6S9+BqN0/qHudVygkiakqm4Ov2LWJC
	5RBnuR9X4qi7+vS4QpVPwUTbUU+iBrac8S0BqC59hPYZicmIwGSrHs8MrAi5cyrm
	6bfhzI8wlFaGiUdJuVRH6cHRo1ogOeWj1GZYV7bSQgYXlKGk/0tdG7r59QAKSmNo
	Sm8PhhQpFEpEfg/7fkAyBsGDGmLJtn3snE7YARtdSqC5Fn/zz5NNhwGNMTqtdUIM
	q47YT7PxWyyhWsZP8fUDU8U6c5DF5aZD9aYhdIQBBTy3nAknLGuYzs8Ez7q8dXH5
	Nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gbree58xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:42 -0400 (EDT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso257101985a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 03:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086021; x=1788690821; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iltXE0WYwKKMJapYaKnipYxUvczqFD9fAUv3vS9XHEs=;
        b=AQk8b1JDk13O3vllSvyR3q2qV/xnCcHc89C96wrPY5N7yqtK3y7JcumQkVMyv84VhY
         g9+cW3v0dm1VnhTd1tYP7ZELJ0o+iENK86VV7qzYvFO9XaKAjxHJm/3fnkGikF9ueZ9z
         s0SnrWXrrskn2ifFo5m/ox60J4Nl328Bqi32yMivgsUwA5ZEQ8Wb9uR83HttOVjB3ece
         2f44gOrQYzoT7t37PW+IR2O4YerNIVVzk5ot2jNB4mjcGUl2aeJgoxoFS31w+DQ75vkt
         rIEywNRk2yvtA6aYyGfgvMBwqc6xUVN50R2RemCjzpMljNa6WNB+XgmZy1eM++fS8MSi
         ZcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086021; x=1788690821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iltXE0WYwKKMJapYaKnipYxUvczqFD9fAUv3vS9XHEs=;
        b=g2QC8+dH0SPBUEhJe9LE4IgxBVNGMPQu55d3MGaktViOH7kxoM0t2i3NjYAGgIdIJl
         96ntpAZqR1AIduOLgKX9/xSjpfWL8RflBeHbMqG31mq4/hz2QoRyVNYTATT36IYeGGNS
         zMmGREv66+kxQldP32r24hyKxsfX1pA34Mv/XADeTtTpC5N5EekSv/sIoUP8AMdpfPt2
         EvLRT16IfkIfFjkDT3XfzGj+fpAolRcx5jxD3fkX1yRkwmqGcsAt6YF3LpLIAZrboMZn
         YTiHTlllvXDQwd+WcRdGsm65oxW7UVXcc1sCohLg5FWRdTfUs4/SeT+s02YNE+B/YlMf
         lDbQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvyH1JptXxGLTrU8qaJXbff0khkvYDngYYc1VAqUuuR4flID9YQSGVpzbP5GP2cV69eHmbzpM8JOK5KqMDOSI1@lists.infradead.org
X-Gm-Message-State: AFuF++l34SFVHo6x8yy8ILtleKUtxANCW0vp9vhTzCOLFiC4cH6MmpK6
	Mp8cNDGbWWblJxJDSLcw33RC6iaPkj+xl4eeeztqUC/UCFvUj/34fv+nhqluaIopE0OMgIfjfW3
	duEGY6ofdp1P0Bw8VigIIJB3URhuSnTGvWUZYqNwWp7AmEZT0z6Lytxz4iAk/JX1SBVElPt8+
X-Gm-Gg: AR+sD12rmfx86NcRWtY+FQU5BjnCffmJQeLFv10ntLkf+b+vuQ47RDgKsEFJSFYic5L
	mRqaM3akO/WL3e65WTeTpnBHuqJ9GeJFT9CXFfop6cR34G7Po6Ae0WhvoR1A0Gjgv39ZDK3hJ/4
	/F7ns3QcgXP7iml/v7LthbqxLikfqd6Uc57cK9ycWQcAucOCTNAd4zI2DVlu01i1a9rDE2QJOq1
	re40cVvKFrgQNtBKKWUb9pAwuizAHTsv6q92EE6dnnO3JbIeLTO4Vw+Ieh33QBnnCYjrcourl6A
	iGmg7fOwsc0pnPGGAJ1y9cocAwZsairhR6FLHMGrWEpDtLClZyMro4o6F2p9wcJ/v8UVPwU6s//
	l01KZkYqiJxCCJ9gixiZo9srmSSOB2/pdvAvs8+0uzg==
X-Received: by 2002:a05:622a:3cd:b0:52f:a0b3:bcb9 with SMTP id d75a77b69052e-52fb941f705mr207120631cf.10.1788086021650;
        Sun, 30 Aug 2026 03:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:3cd:b0:52f:a0b3:bcb9 with SMTP id d75a77b69052e-52fb941f705mr207115921cf.10.1788086016476;
        Sun, 30 Aug 2026 03:33:36 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:35 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:25 -0400
Subject: [PATCH 3/8] mm/rmap: use folio_page_swap_entry() in
 ttu_anon_swapbacked_folio()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-3-7786b52acbc8@columbia.edu>
References: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
In-Reply-To: <20260830-folio_swap_entry-v1-0-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=796;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=hjPNw4K1yXPTP98viqWADLFrOSoXMJ7N2Y21LKrNJ5w=;
 b=SqXdQ6+SfH8WrC7+aQn5jmiLp05F+QV1V+8t1xTPP9zyb0Mm5AKQJxBCFYXPXhX+yzVhjrhEQ
 fe4zwW7ILfhCLYAj2in2hlUqvr8G6n6pplJ43VNfpGfmiyLZR5wFFBQ
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfXy+DnDAnA7J66
 R0mUnI9mUD0D9mfr9LezIDlzsw+gkXkPlF8oXkkd55hzHFHmXEYsw9oCx5o3HTQ1P9DjfEszi+7
 fS4fmfTLjbt2RlLjS+OSXaIKW+ORxBgbutEyDd8CpXd/gjhKIKMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX7dAh5SA2kqen
 SIQj9bTjuVkRLxIJ02rPYiFmHxka/oL2fRi+GdliJeAqWDRmaRtxtrYiuTgIyA0TkmbOr7r783w
 EK6luUaoTP0gWhqx5ZhprcIy2N4aRkqGnjWkDbZX5ZjY4gSWQ0SUxPUhcdOXj/3/JgT9Veyq74F
 rphZ352wQFPwLq5aw5jEqWDfOGmtjCQg4flPA9IlVbGS81Ma6e6u4ea9+ZQjEwTVNrwK6n2r3Bg
 OMdHPFEebaNvFQlt2GzQA6AN5U1AP7nO0/y69PtL68MedDm66DHg1Wctf6vl7U6rLdO2zB3gY5S
 UYd2LUQRb33i3KJ0jNttpL4R9hricPf7urgFYhx9BG7899yFpXfIf1InPNk+2SqJHR7OW89H6bW
 P4s62INP+3jvtLnMpW+O9qqurpaALe9ENKY0uuM3Ww92BoEoJu4etghD77b9JtXsvaH6GvGkam9
 lXsLMF3YzdUyXqLLuZw==
X-Proofpoint-ORIG-GUID: J75dSpEiGMYDEM-wkprQBJepXASgyzWA
X-Proofpoint-GUID: J75dSpEiGMYDEM-wkprQBJepXASgyzWA
X-Authority-Analysis: v=2.4 cv=JtHBas4C c=1 sm=1 tr=0 ts=6a940706 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=gAJobatAmFEwf0K8sXEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=10 bulkscore=10 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=10 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_033343_347695_F69F966C 
X-CRM114-Status: GOOD (  13.94  )
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

We already have the folio here, so use folio_page_swap_entry() instead
of going through page_swap_entry(). This saves a call to
compound_head().

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/rmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index fed0362e0bd0..ef34126c6ce8 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2143,7 +2143,7 @@ static bool ttu_anon_swapbacked_folio(struct vm_area_struct *vma,
 {
 	const bool anon_exclusive = folio_test_anon(folio) &&
 				    PageAnonExclusive(page);
-	swp_entry_t entry = page_swap_entry(page);
+	swp_entry_t entry = folio_page_swap_entry(folio, page);
 	struct mm_struct *mm = vma->vm_mm;
 
 	if (folio_dup_swap(folio, page) < 0)

-- 
2.39.5


