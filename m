Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C33C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 10:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R68iMyJd6AJlpHo53ZebvYn2d9eNAhtoRa8wwiiATKs=; b=kWGL9HZ51XKJpsAT6LgryJrMaD
	vdHBwx8e+BjShbtT1qmgsiP4qJv08fJyp0EaR/IyWGppf1oeFYHSEbD203svKW7U2zad2bbWL/TAC
	kb9oP9/58tU0pDP1plIRerN8pbTbgXNuPRRmj8vZngJTBVdMOC31HJoV2yvRIFZVR1T0gOU0Vp5Ea
	Q30ICV8OMoUp1Zip3MC7HUauoHZbCsECwU90ZIVtjmN29JqwEYabqaiRjNW/aAMuHiWErce2hSQBE
	sipP+rpLv3rlTie+lW/PfDFLCvkhzE5wBYJUPSttn3bDL0ZgHB+/xyCK/RFgkjSLi5/AjKOEbsf/H
	xfsJ+Rpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cr5-00000007eS0-1xHS;
	Sun, 30 Aug 2026 10:33:39 +0000
Received: from mx0b-00364e01.pphosted.com ([148.163.139.74])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0cr0-00000007eR7-1prT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 10:33:37 +0000
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UA0Qc03292616
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=R68i
	MyJd6AJlpHo53ZebvYn2d9eNAhtoRa8wwiiATKs=; b=od3n6sZLRUPnU+YnQR7e
	OuLdyhPo8cy2+fXS17e1+5Blxw2+fKiZFkCarwG3rxk8l4Myi+THxnUBr2c3hrT8
	6Nnuur/owIf/VBQv1PXqxEo+w2B4ivKxiAxN7/zertyChKR03we0Q9O+/FED70xp
	zw/iy+WrbaW3EjgWNqq0VpVjtbOQi3vMoamXq3kk+kW/B5LVz2Qj6QL1aWTigz/I
	A/MfPVPMghtFnsdTJbOiDVsnhDOTwFwNjEO6eW0xo7XzKivFEvMSCxJwjiCDurLx
	k9wQjO+FrsFhkTCNEC99EIZLapNuGfqhNvFPvm0SF6ffSLb0Un+UsfEjh7G0mKCp
	LA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gbrfbvyp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 06:33:33 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so22029941cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 03:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788086013; x=1788690813; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R68iMyJd6AJlpHo53ZebvYn2d9eNAhtoRa8wwiiATKs=;
        b=KsdHqr2BSg5MU4mMQ7NksGBMn4I4dW/mlKr3aVFk8hGY+tuxtF56uHqy3nhrtz+/Lf
         Q3bu9FJrtPTUEJekZiW/KY7Gq5S2BJ19rfFHpV+Rv/fvyKfQ/SLT2cPXkaP2DQQy1jXR
         jvCG6tqh0DgzVC/4Wzn5+5G54SkTrPWAqrTw4PKU+OzEszlVx0nP7rz0xB6qkOSvOQYP
         LkEz6XbZ4iwjYhWKCAyf8S/xPamkNnfXTtYs6+sDrL8szMJQ9TfhxL64ylpM7AVBt+GA
         FeCvcrZ4Zl/ooywbog3J43nkaXh4fdLitD00mt+DpTyXfxSKNyu/PQGkurfUZrAWMpTw
         IOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788086013; x=1788690813;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R68iMyJd6AJlpHo53ZebvYn2d9eNAhtoRa8wwiiATKs=;
        b=mhfjtj5Tzi2tfNuNITXF9XhSowa//GOoYFx9G7NVhgVzANioV+cKFT3PfxDGXUz54b
         Iokm4djfu4iu7/n4x01K6kCuSbHvsVVqLDSofs92TPT48ol+4PKCs/xxxyie7C/rJTS8
         FZkmkG6R/39MvLYG2bIJJwVQUbywIxtvFv+KwizjczJs+738G4Q9Ff94mS7vHvNritX+
         pPW/zpuygPzdi2afAcqdi+f3oI+7RHPVy+ioA4N7WdT6BMo8SqE+xlbjyGXS9VUK9Lte
         Z0t5QniPmQKQeRob3bQDLaU5/FiqSvl+PDB0hOKDb8U5T/FotmHVAXQuXtLNJvOiTT4k
         yjBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5JcFavj7b/TkKXqqKk41f0nHWHmXfafjlF/lv2xLG7JqgIA/HcLPZGVkCHguQjVi2HREzvZgUOwsf85tqdzHM@lists.infradead.org
X-Gm-Message-State: AFuF++lutrdfH92gpBjrodfCfidccrmkcPBN5RK+90rankmAcnIT6r8N
	FOw+sWS7upmhaGk1VBlngmueKzzpG0WwZaaduTAhrNVqmyRpI1l/ZnPVzp2Ogd0Y+F6D+YjPB4g
	zFDneIWJSyUP/1Cl9goKapaySguM28u8Nq5FYiaQGlDz2gYivvQL/Vyh+CtDpSyDgPIkTlyeE
X-Gm-Gg: AR+sD114gYLoSXPWz6OKyt1TTvQp9kOnyqWQLHd3oeU9I26f1HuN/SUKqVpMpc8VID3
	8iQfT4KJWfUXDKy4E1lZU//vOPytzUbE9Wv0NGsJPeqaUY1ibSNsOhpbKh4jMzChsVXt+KqgBdA
	kRsE8RwA4g3T4aK8LqHivqc2yiLz1R3l1pLdd18FbUwLE+x8laQlh8+jepC0Uzhvw1+1QsU3eD7
	GwtHsrUdsuSYek6ag8gopkO3kDKaZeV2I+JRSJfZ8WLNwYkfgT0LYbuhFx7LgQ1a8xhEbxXSUpS
	7OJCYoHAi/AAp4752gjcgwJKXFkCHFTiAJ2FA4eXThMJivnPAr2MYq1NLN05JAldVlV+GG+9mOf
	0mfluE0626bJzJe1qRjHPdanAQyBSclPQsbLSAp5Agw==
X-Received: by 2002:a05:622a:258d:b0:52f:b495:e9a5 with SMTP id d75a77b69052e-52fb96fee36mr249069361cf.37.1788086012725;
        Sun, 30 Aug 2026 03:33:32 -0700 (PDT)
X-Received: by 2002:a05:622a:258d:b0:52f:b495:e9a5 with SMTP id d75a77b69052e-52fb96fee36mr249069061cf.37.1788086012274;
        Sun, 30 Aug 2026 03:33:32 -0700 (PDT)
Received: from [127.0.1.1] (bzq-79-179-7-133.red.bezeqint.net. [79.179.7.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccf5a580esm69304005e9.3.2026.08.30.03.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 03:33:31 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sun, 30 Aug 2026 06:32:24 -0400
Subject: [PATCH 2/8] mm/huge_memory: use folio_swap_entry() when splitting
 a swapcache folio
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-folio_swap_entry-v1-2-7786b52acbc8@columbia.edu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788085997; l=817;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yJpb5yXsQPyDh9y91Xv6B3Jj3WvQOE9ZIIlAoBgKruQ=;
 b=+ysgi6e+YYzjba7Kbk8hy7m2fCoWccIAS+tbJjxQB2LPO2V7RurTdl/SokK8TRW1vJuuYPC8N
 qxEfHy6xQmWDblwBJG6de6eaGjYBHD+8C3L2bA+kHiwPqHj1nUSnpgI
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX8yDUSbumM8s8
 ZV2eGcuQ7BOZ7Qi2+IZlwnbEOlFkNM/uGswP8bRJdRFncSg42Q/66uh0nbVhCwG/lVPg2HH5NO2
 H8W/H5EJuShhWX+sS/FICGxubMCUC3nJ+v3yljrY4+Vg8nkFCaNP
X-Proofpoint-ORIG-GUID: OQ7gVW-uDtf87mVJkcRmdTBcsgCSOut7
X-Proofpoint-GUID: OQ7gVW-uDtf87mVJkcRmdTBcsgCSOut7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMwMDA4OCBTYWx0ZWRfX6aOhrSpVbbCW
 sUEhJimPvK/h6sTJ3LEnJ7APfA6NXRXS21D1wz1/0lHDFIg/W9sVrk4PfvVRkFqR0y7Mn3SM9hI
 wNLCfIR7KqbhTNxyH11PFRFxY0GX2/4FgrHrzkcot63erQIW9y3lwcKx6hUSbgPupwol4kgzTLd
 6KivP0qlGbHa9ZaA72qIp78P25zycUSALVI5TDnkFQ9Aoryahp/FAiRj08S/ydmOij6tyl/EwHg
 AAHksGN0w6MgVnjedSZSkgFzUsEcsbejwzpV7KbnPsNTlx1Y3RQSV1Xm+z/SXpOc6haopbrSF/p
 6H2hlLeZPLKV0/s6oVLa6JFWHM4FhBDWkAws3JOgSX7SFILnWOCyLuTn/YNz82q5iySTuig31s3
 X0y5kP6xackVTQij9/kvdXUPO5QNOFizIKB6fSuhMullr2TO9vB/2jX4f6fDb+/1bDfEqdpCFk4
 CiqbdmCcqJQx0qUhqgQ==
X-Authority-Analysis: v=2.4 cv=beNbluPB c=1 sm=1 tr=0 ts=6a9406fd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=LRATYcvZeiQrLRB5MfbBvg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=AaP-W-LBM3jM8pgIlokA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11890
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 bulkscore=10 spamscore=0 lowpriorityscore=10 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608300088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_033334_604122_E2CB8A31 
X-CRM114-Status: GOOD (  14.09  )
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

__split_folio_to_order() open-codes the swap entry computation for the
split-out folios. Use folio_swap_entry() instead.

No functional change.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 mm/huge_memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 54494c3fa983..03287f995d92 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3760,7 +3760,7 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
 		VM_WARN_ON_ONCE_PAGE(new_folio->private, new_head);
 
 		if (folio_test_swapcache(folio))
-			new_folio->swap.val = folio->swap.val + i;
+			new_folio->swap = folio_swap_entry(folio, i);
 
 		/* Page flags must be visible before we make the page non-compound. */
 		smp_wmb();

-- 
2.39.5


