Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD22C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 07:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0daWTZ+h3e4CYzqQrGN8s4MZibHUnZL7K/uuxn95uA=; b=gJvboEKSSq++SF/1obtTK1ZeKz
	o7KyJGruS7Y6QDGQqig4Alx1bznvcylUDacHq/n02YvxqKz4cUT/YL1iIbda0G+i5Cs6/9rYldxcN
	vXwZiZFz5fjKaAU8dnGki2WqA69/jK5MXxonQB6o5cmjvLFb2EW3QozUykUT7xU5aYCbN8pApjrQz
	0DcCHNGW6cKBTbpZlxh3wBWQURa4caZFUd9EEOkyTsq1t81fr5QCZ6al6YhjbQKaK+gSzVasRO5rv
	5p/VhAIeCG0tAavVyKFvMQkV2dn/8e2LKWA9qiEbjSE0nrP7V5X2zD9pNqOqI2+RqFJ25U2mZsaRm
	HInv1OTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBkY-00000002g8S-2t2R;
	Wed, 26 Feb 2025 07:22:34 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBet-00000002fEo-2On7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 07:16:44 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q6PclK028516;
	Wed, 26 Feb 2025 07:16:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=s0daWTZ+h3e4CYzqQrGN8s4MZibHUn
	ZL7K/uuxn95uA=; b=fJmBCwMRObf/ZnmW9sa5kvECELdq3pHny4YsS08gG4Q/gi
	cHvYhexKdM49XUtPcMrfs73oN/ZdfMLz6FY2OmcsUNM0SZZDnM5/HvUF6h4zwFBe
	vFi5tLlUP/a5CAAfTf3GozhcWZ68RkW8rgvEm8VIj/UJFvQeTAGP2/m8MdcG+wFS
	daCY2Rk1F27oScWMb820pAU2LMDCMe6sT8sTjJ8XcQO7ZrI+4V3we7Kbolu27cGQ
	eJ2dy8AMJpgFvKxeLbjjXwerdyzBz9CiHa8VOFLzS+gydJZSPoDSW21uUznHjMXa
	388ehXkYWD9DEqwggjCN/SeJCK0D0qwXKl1/AeAA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451wp6864a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:16:15 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q7DWT5027408;
	Wed, 26 Feb 2025 07:16:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451wp68648-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:16:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q4rJnR027390;
	Wed, 26 Feb 2025 07:16:14 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44ytdkh853-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 07:16:14 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51Q7G82A17170924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 07:16:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1A112004B;
	Wed, 26 Feb 2025 07:16:08 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 519E420049;
	Wed, 26 Feb 2025 07:16:06 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.171.19.83])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 26 Feb 2025 07:16:06 +0000 (GMT)
Date: Wed, 26 Feb 2025 08:16:04 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>, Arnd Bergmann <arnd@arndb.de>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Uladzislau Rezki <urezki@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        David Hildenbrand <david@redhat.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Dev Jain <dev.jain@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm: hugetlb: Add huge page size param to
 huge_ptep_get_and_clear()
Message-ID: <Z76/tK6yr32O2C4h@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250217140419.1702389-1-ryan.roberts@arm.com>
 <20250217140419.1702389-2-ryan.roberts@arm.com>
 <Z73Szw4rSHSyfpoy@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <290f858c-07d4-4690-998c-2aefac664d7b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <290f858c-07d4-4690-998c-2aefac664d7b@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XY_V547MWzFXGjFNryOxXjG0TG-cKJAp
X-Proofpoint-ORIG-GUID: vG3krsx3_W2UnseQJeBqT6t6C7a6pKKC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=592 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_231643_730993_683AEAFE 
X-CRM114-Status: GOOD (  18.53  )
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

On Tue, Feb 25, 2025 at 03:43:04PM +0000, Ryan Roberts wrote:
> >> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> >> +			      unsigned long addr, pte_t *ptep, unsigned long sz)
> >> +{
> >> +	return __huge_ptep_get_and_clear(mm, addr, ptep);
> >> +}
> > 
> > Is there a reason why this is not a header inline, as other callers of
> > __huge_ptep_get_and_clear()?
> 
> I was trying to make the change as uninvasive as possible, so didn't want to
> change the linkage in case I accidentally broke something. Happy to make this an
> inline in the header though, if you prefer?

Yes, please.

> Thanks,
> Ryan

Thanks!

