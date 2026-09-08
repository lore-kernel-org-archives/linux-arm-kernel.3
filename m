Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AEAC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=; b=y/+68lrqHaDuX1FTcuLEd0n/9b
	KYSeI4p/LF8/m+n3eeH/pcJszB+xbG5ruSgE+6SbFUfByBZVldjkP39kytum7hJ5CfVUd82NOXteA
	JBJn4q23a61IFlcvXbtiAv0Tfibzs/LcQEX6BS3rfVW0b7aZZDFP8qiWd8ZjvbLiXOF0Spb/9nLmq
	riV9PgDWmXw1WBO4V7la0lqqGGFNcQx6XXUdDhl0LictUYBDZ+4N8nYq2WRNHp1NxrLOzSePojGBC
	Bf0nxooEitqiB+M2Do7ZxZBue4MP/UoshnFV7Ymf7USxmvfR5jPAvvDqnN8DSrhq20LXckhAKTe3t
	czfSqPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZJ-00000009Qvt-2URU;
	Tue, 08 Sep 2026 15:17:05 +0000
Received: from mx0a-00364e01.pphosted.com ([148.163.135.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3xZ5-00000009Qnx-40Xt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 15:16:53 +0000
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FGlYs383227
	for <linux-arm-kernel@lists.infradead.org>; Tue, 8 Sep 2026 11:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=d/ju
	GQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=; b=PB+XrZxPTwrkXbTyYVYd
	lumHQ20EoJN0qSaX0iS4gdwRdgCm0ih1QdVMcHCfxMyxoeBesUAwedtVTF0Jn1Rf
	jwD8hGuisXzAiFVARxfvQKG+jr5u2hvkKdechYgQE4CBe6hCBfDkYf9Kq/g4WGEh
	sDjVp39yDqviUY9iyHs7d3HzHYME+KHUbElN87zOQwdhnAIgZmMCl0BLYovoJxrB
	AeZzl68wQ34cCgR+BxZdmJ3uIpXtogr9+A0ljJmO5mMqi0L4Qk4UxZnkD+0e4BsY
	3DS9Kc9SEDVtaj8C0R6dUKbMLGvVED40s4NWh91cEozh2jxEAyIZMffO1UBdh/x7
	yw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gjmv7g027-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 11:16:51 -0400 (EDT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66fa3714f3eso8257518d50.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 08:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788880610; x=1789485410; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=;
        b=j2ijXVPRqbjY4V4Jpx/nbxOQhvyFnco/Fx3ErwaYRAKD58NQnThgD0tbq84BZ26oSO
         ObzvY3A5RaLQ1AjC+gXgGLJW/grr8s9jii+LS9zggBw9OaFo/KQLtSyTkfKiASFR3Vix
         qnSM/IkIWwXnNAJgjsj4I+SIWSjR/bjvYY7l2P3IFyX//jaCE4f9bbT24Nl16YeZvW4x
         K0eCQ0Zi+JNDN4cn4cXVzsfTX6ENco+l8ORoBtzHKG2oHhNNxoUxxC5Kxj27/z97IYSA
         ZLvDfB+G6NjMJ3pNV0XNhR3MTmeSiZpEwefhAWRdNiZR5R79lCqe8/Ip/NNH/HlHO+vA
         q4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880610; x=1789485410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=;
        b=isShBhEp5HOOGNRfRI+JtS+6Rk3Ur760GQMTakWBJJPT+joBIwntJ28Q9gfD3Qu/M/
         P1ZpROn2kc6oRivd1UUdzDiNGibgCOwyGpdVnnoxtlxR+01zlDbEa30fLa3oYtDuub9i
         oUcdsjETISkGdupjbLpTs17iuKTxhzFKT4GWSb//rlml5xuU22hjgZQ5B2K3wCqShIiU
         idCL2n4VuJBn5o+cFDIeVD26jyF25PpOz7Yw4kULTTvXglvMIxys2cOCulPb9T7HFywC
         Q/BxUPFDlImQRK8zZ18b0aQy3JHDB4cwrG01seSiwpBExqId6hlXVV/Gr/mPLeGGwwdm
         fAFQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0lBpvRQtO9gjE28A5852h2HHngv87qD8n9LBD0nTVSsbcJY3ObdnQvQFB9Dgxx0TtlwUkEka6q7ZaUfGxreD8@lists.infradead.org
X-Gm-Message-State: AFuF++mV9Xozq8nEaS7kqNs8I/s+ogS+bI/JBkWwSkWAvP7EBclK1UMC
	2uZyUm0JnaIvaqWBaTSXEDOrMQdxbdNurVWM7dmp7wAipOVJ4VT5mSeLHX27y91g5fyVbbQn732
	DmSpQIESCRNrdqz9u2jkcKLUIe3PN/U50pbAJuO20GPROWFQJIQM1lYesvTaew9LK084iASzi
X-Gm-Gg: AYBFou0Wy0zEvsXA6gDp8p2QE9/ZhBGlBKsMB7Il545+7yOTJSwZa7lPfJEbA5PKLsp
	CwCbwALpCDaXryJ8GJAe6BAZ4UInKcDgH00oH/BNW4H7nnwpOqi3HN4MbI8H6QfT8kQ7NP49SPe
	vrNGSbJOv/t9tJd0z2z0u3TKtXYyk3UrOa0ucJFVBqZqMgVL8XLpOUiOAC1dW71I5qLYqreYm6S
	HQ5K2LC12idWvwF6MnrcyXrWDNre8qR4+diaY3lOJw+A+7tO3Pavp2Zkdupz4XCPp/ChQyQvQTb
	tJSeJCmfKXboDR1KngF3atPRgbYVIzufFqyxGxJu2+rSAEZEg+O6mV8Wpi/uhj/62279+GS0K7d
	ssKEGO1wB0kSyGJKh3tcy1XoKNOS7MHOIRijs4rWp7mgPW2wtRknn1Q==
X-Received: by 2002:a05:690e:4513:20b0:66f:c8e4:f013 with SMTP id 956f58d0204a3-66fc8e4f18dmr4249100d50.50.1788880610247;
        Tue, 08 Sep 2026 08:16:50 -0700 (PDT)
X-Received: by 2002:a05:690e:4513:20b0:66f:c8e4:f013 with SMTP id 956f58d0204a3-66fc8e4f18dmr4249033d50.50.1788880609732;
        Tue, 08 Sep 2026 08:16:49 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-177-174.net.columbia.edu. [128.59.177.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040673ce0sm122105496d6.25.2026.09.08.08.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:16:49 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 08 Sep 2026 11:16:36 -0400
Subject: [PATCH v2 6/8] arm64: mte: make mte_save_tags() and
 mte_restore_tags() static
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-folio_swap_entry-v2-6-ee6d01dfa5e1@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788880600; l=1787;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=JMnLiPjPeuQ8XHbUf4RdPN6u8wF8V4jepqQl+nANMew=;
 b=gGrVpzINCdcX9e9UtB7ydxsckIe/46z/TwXW94oeS12x2L3iuyn2uigTEvuOZbHdpQe5OV2Um
 +P1oxTLmtU0CwWIE5zTT16WQtchDHj8G1SYst8releCqJFl2APeIPvs
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX1MY7iH79LQlP
 zCV1E3xzG0S0xRxYjxK2E2EJ1PFln3YYuIsl0LlklOXDj1m5uHOhUvUIxFAaipymSy3j8yD+jgf
 N0UaJFyOwlOiF1E1hdlSBSrBjqlN1H77CmwE3RwdmdrxNDki6MM53nazkhbF+5PIKcCcp2HgQcD
 5euJFbbHNqWjTcAmIbpiEzDCzUeD//lGnojduqFU+GbyW/NNycVgIHlnuIUgIPniTgwOSm39WFA
 jWNDjWaJL99qoowBlCrIbXA9QPU0TpsTcSRaw4HXOuAUAxaQRZFprC4HpsilCA0sKLQR99CnNC2
 0EfoP12qPjOqCj3VZM2YKeTlHRtsFwrDeuewn3lm23ZDAhefLOD7nQ2iYOmHwJvpqIK2y2UsEvP
 0bpCt7h7E//5uaSwydnkn9Yy8MLhq3NfC+fVOEgwC0pmU3LtECxP4lkKBjBbokB2wijTwDQ1HmI
 UVYDONuDQETIkQNqQZA==
X-Proofpoint-ORIG-GUID: zA-ZmC-niXyTRY0gfR3Lnw52IucgASGj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NSBTYWx0ZWRfX8I8Px5RWwT5r
 gwMTbXoNiK3vzb0iGtKW9blZkoJlytfzjeyzh6lzfdxuqZETkDGZ2qygVFdvk85gIQoSHcQ99YG
 i+4rFyNXnwZXgqvaQhq2tt1r0mPUmlytZ/EUGXyTsH7uOeTWBz6u
X-Authority-Analysis: v=2.4 cv=fpnsol4f c=1 sm=1 tr=0 ts=6aa026e3 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=HBUb3goEnnz3w2smY6d+Hw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=f-bboeSTcrnmky8UUdsA:9 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: zA-ZmC-niXyTRY0gfR3Lnw52IucgASGj
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=10 impostorscore=10 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=10 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_081652_002609_5B808376 
X-CRM114-Status: GOOD (  15.20  )
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

mte_save_tags() and mte_restore_tags() are only used by
arch_prepare_to_swap() and arch_swap_restore() in mteswap.c. Make them
static and remove their declarations from mte.h.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 arch/arm64/include/asm/mte.h | 2 --
 arch/arm64/mm/mteswap.c      | 4 ++--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/mte.h b/arch/arm64/include/asm/mte.h
index 7f7b97e09996..83f3b05fc784 100644
--- a/arch/arm64/include/asm/mte.h
+++ b/arch/arm64/include/asm/mte.h
@@ -23,9 +23,7 @@ unsigned long mte_copy_tags_from_user(void *to, const void __user *from,
 				      unsigned long n);
 unsigned long mte_copy_tags_to_user(void __user *to, void *from,
 				    unsigned long n);
-int mte_save_tags(struct page *page);
 void mte_save_page_tags(const void *page_addr, void *tag_storage);
-void mte_restore_tags(swp_entry_t entry, struct page *page);
 void mte_restore_page_tags(void *page_addr, const void *tag_storage);
 void mte_invalidate_tags(int type, pgoff_t offset);
 void mte_invalidate_tags_area(int type);
diff --git a/arch/arm64/mm/mteswap.c b/arch/arm64/mm/mteswap.c
index 63e8d72f202a..3c54afc8b758 100644
--- a/arch/arm64/mm/mteswap.c
+++ b/arch/arm64/mm/mteswap.c
@@ -20,7 +20,7 @@ void mte_free_tag_storage(char *storage)
 	kfree(storage);
 }
 
-int mte_save_tags(struct page *page)
+static int mte_save_tags(struct page *page)
 {
 	void *tag_storage, *ret;
 
@@ -47,7 +47,7 @@ int mte_save_tags(struct page *page)
 	return 0;
 }
 
-void mte_restore_tags(swp_entry_t entry, struct page *page)
+static void mte_restore_tags(swp_entry_t entry, struct page *page)
 {
 	void *tags = xa_load(&mte_pages, entry.val);
 

-- 
2.39.5


