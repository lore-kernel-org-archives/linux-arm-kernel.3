Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AD7C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=; b=0kcZDDDnW2GaXElzR9m6ok2iEP
	XcrqZqDEZX+zWyqecqE2QQ2eexRVuUgAKRpy9gJJ+kLjLYoXwlRCbNm2xpLX4YHjC27PhIpa5Da4Q
	edzqFI5g7idnC93ao4Ho5z5fRmlhPJUBL79IbRydTlhWri/QdO4FbzAYqCBNB8AY6UBnX0WO9GdJ3
	dLdfGHaBg0Huk0FSmbrE36YF9bOR5sEV8COjFU0/HecBYCa/3vuVgZVQL5jyGI+qjVq8R0gqAU3s1
	G6WSQPqjB69vjx0LQ5rtcc2mLL4ZFCgO5oohH59gJdpvAVdmNMaFKMLAzOJ6A/D6/qTLAZNoAer+v
	Q62rD4pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crX-00000007egf-1NHO;
	Sun, 30 Aug 2026 10:34:07 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0crM-00000007eZs-3OL8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:33:58 +0000
Received: from pps.filterd (m0167076.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67U9pKap3332898
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=d/ju
	GQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=; b=cKmK2c99kpyD+CJhbslW
	GMsg+zFJGL562rbCixAhuoRwdYIq03wDGvBbBM9J1p0jYDWKQ1g0PrjMtqhBjkFR
	33TsmiHjgLnr6pTYATMl/D7HZaJmezrPekZBWtvI59TQ2KlALpsBGmWzhfKUvCBS
	dMsyt6+FSNlsYqRCbKwHckJ2LcX1voJO6gtqeBmlP7InxyM02490+dqbsbAcg2zi
	jGVHdtSdlizrUDhXZ4A7FzNK7/3eCq8Trv+7ZSm5awSjCCjLMeAlPr3hhy+wi/+B
	8cbshrKJKSvDm8F9vlABeI9FbQZ9n/beZzBoiegg7MNaG/+ykkk0orXyyVpkfMXX
	5g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbrhq514k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:55 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fb6c7b680so32033151cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 03:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086035; x=1788690835; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=;
        b=dEYsolo33OR8SBTnpPhFaY4e2NoGJvMFuqyev5TxUP+ypdGWUp20U4btdrcxhv+pvW
         66P6mWXaW0mBRBl0gbGRuSiVTC1ema4y2+BjeUVD0BIPM2DDBRot0D5sYZ9KkwDRHHIS
         RCz49xeqYQ68KCWx+y1Ux14HaIqXGJswjrMi3lErl6TyCACi+3DFNRXhMXBIwgxsfTsT
         RgOa5VGvKCrpwSmHBSkPEwiDXQSYapiVhZbf2wCd2FnUgXyzGDvhBvnFGx4rI/musb7+
         ClVn+ByZ37RXoRQYtWhn0oYeQIzqLuaMG8Tk0oBackkg3sAtSfi5Brq1MFMQe8d1DxVp
         OIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086035; x=1788690835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/juGQBpeXjCCGF/Jvctg7hi+/3D3O4YYez7MG8kxSg=;
        b=IxywwYXidcNmt1+Mcrvj1jN+JhHo39ATkKweiqmwAENQYOi9pjBBRZio+5T4kSqRzM
         uTVtMAxIgujgmtTlYUn4VDicWTCfyRG3gJc9K9WHqPCoP8VhodjGWl5MiDJVJ5JD2Dex
         QKnzzMMpKsQF1qD5m6PAu+OgijfPKVH6Ui4Pfb8iFUbxrAkd+tu+gJUyqacjRyBmp/0h
         7+xUs+IjQTqMdnEiYPzcvNqeDr33TrxkzkX2dQxuyyJo6VlH6GG11LCcFDsc9SfMLvcI
         +FZK6hXRnETWQ+1mqgl5bmSI9xUvXSNX24oQ0q7USMZZAT51VXZF1fFVC4aVy+hSvZkh
         59Zg==
X-Forwarded-Encrypted: i=1; AHgh+RqA+KZ1or+eS6VJGdgTAS4c9AvhrLmRVUtn60bdN4SD/TpvyquX2NxT3N1l0hkKlEH5M0yWVtwugjn9Lusl7TYa@lists.infradead.org
X-Gm-Message-State: AFuF++nEDJcicBVxn/LCStcMVggJHD+NKzXkqqOlcTKL4q2iv9ZnGebn
	bmbRoVLRs0RnkBzlbVEd5cogn99bdzwOzABnLHLvkLuyW6q/Vp/yjzL6AnoBhcYTrRpXUPW6jr7
	3NCa3Wu5ZiIM5/xGVA8oVHRroOidzTpe3Aof5k8n+4CTwo/tAMesV7shdhivvnKEO+XG2xoCw
X-Gm-Gg: AR+sD12tw433LH/nVcpok/aq78m4XXgFka4F6JMGtNTWr+QmihQ9lKHDdXqyIwz3gnn
	aChcmEI9jM1AnnxXf0p/9IZdTjVKkpuvnYOm6ub3YSv2QPnAPBlOlSUeayHxDISj0SOgryIEKAN
	1UeNrjixTZUWBTUi3d0zsRgN7CRHI1zxkSsf99U4sDT6glEqZT/QqdLYoRQwi2pJHQi+C7Ja0Bt
	C+bemllyk65qyt/JMZyt1cqqqRu/8EmlnrpBk9BeR62B9JXMTAYJZYfYrdHECbOytsZS8cGU5Q0
	vPwj8BhzxwOv2SxlXooSvjHAdsvTAfPJJ1cM97zymTGtPIC29Fv0sOlLiip/SM3GMW4E9f++Mr0
	ztFBKS1AGizKM5cPay68HeMZC4MA1jKtRnvdZ55WEEg==
X-Received: by 2002:ac8:59c1:0:b0:52f:ab8f:43d9 with SMTP id d75a77b69052e-52fb95e7d48mr208988231cf.22.1788086029993;
        Sun, 30 Aug 2026 03:33:49 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:52f:ab8f:43d9 with SMTP id d75a77b69052e-52fb95e7d48mr208987841cf.22.1788086029567;
        Sun, 30 Aug 2026 03:33:49 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:48 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:28 -0400
Subject: [PATCH 6/8] arm64: mte: make mte_save_tags() and
 mte_restore_tags() static
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-6-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=1787;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=JMnLiPjPeuQ8XHbUf4RdPN6u8wF8V4jepqQl+nANMew=;
 b=684WpVyyjKGNjL08aBqlBsLxRU6keghtlyIRd3w2GLSP2VrXOpyQi8zFCsDv7pRQmdsJ7w7hX
 cAobQWSyjSRD38U65oQjH5X6lhPqAu4kzOdCs2baVilseYiezKm4jlG
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX8LcoPLGVnAwA
 v5G8DxbY3tbYF9L0rlKW/Q3gsYDcOeKyv4wd7txY6nNCiIF81e/kG3jYRuxyTDDSZfR8JV29nZh
 JvXxyaEio1x0syrJAezRTKuOEbLe06jx/dDCky4veqoTh00/Mkx4jgatt9d+lJ5tTgtQLR0MZYS
 32+cPErXsaMF1TACvDvikazg/Il6i8evZpZ/iPJgYPPN9PrWGeFT2SShtH6DzY+Gq9nBg6elwyA
 2Mhz5e+ibgLTVfv2UUxOehDpY6KGs3FO6ZL/vRSTsyNsYqpfwJ2AnJb75XTb73wSvInabDJJE4Z
 uZdCtXExVZmHdM26ebyCDjqnFTCFpJNKz/FuAbV90qMZfzuTaBmmcloa4tnWX+dnHw325R8VpAR
 YUIDLtHfKvX2JH/7DDziY1+u53qujJrpPd07d7EiyAQYNl10/L+tfliHXLfejTxbVBjI3OeWwSa
 C8kgWGdgVQf8dqQN2yA==
X-Proofpoint-GUID: 8Y4d-6riTPth091Uhy0TNy17pbctW-6V
X-Authority-Analysis: v=2.4 cv=PeDPQChd c=1 sm=1 tr=0 ts=6a940713 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=Qm0qsxP7aFY2tkT6R2MF:22
 a=f-bboeSTcrnmky8UUdsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8Y4d-6riTPth091Uhy0TNy17pbctW-6V
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX5knWOwjeXXkL
 JRr/s4vp4QD9Qrf540pX3NeFXTz6DuVOVxrWHTuUe0SY+0fICzTbSfRDiG4rPWwem+iR7WoTMDF
 pW0TYbihUK1B1Lj4VMSbN1x1EURJocex7qw8ioXMbk/QvYKswupy
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 impostorscore=10 clxscore=1011 adultscore=0 lowpriorityscore=10 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_033356_975385_EBA57571 
X-CRM114-Status: GOOD (  14.06  )
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


