Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21D9CCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 15:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQ1TtLHokmslhzFjee4cGuD5m+V7qM5aPPie4zC6OAs=; b=mopURnpH6PrZxW0oE30oV19vIh
	BjK9Jz1EHz0cjFCAZbMm6sD4wGWOJyVIPwRpRK/UGM9kcwlk9KUhk/qoDXWo2UBU9Kj8vQ01LU2nr
	65OjxkHEUzXFnTHWfwbXwNLen+uWEz+Wmqd/3letqk+SwQORklnxFZBDxMsU3ZAaqC64yIO/iG3k9
	gcSOgqFBt2RVwf85FWrcW3QpzXa8tAP2CYt35CzP/wPkfbV56mexPRCbP5cbfMo6VhJMUqoIWitee
	hwuyJ73+VbnlePQmuvc28qzwHRBstrUvwTTqOPE+viCa+WRiFYwYNKOnthNvDoEWwtxBPjFBszYWU
	DqdJ9X4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mnV-00000008L3U-3TpM;
	Fri, 17 Oct 2025 15:55:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mnU-00000008L3M-2LiN
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 15:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZQ1TtLHokmslhzFjee4cGuD5m+V7qM5aPPie4zC6OAs=; b=IJLAPD3cJL/IXkH5vKRAFq/ovW
	ad7k6FLm45cvdQ+8vAfxY5jj5ZzSj8JOVoZOihBgPGw9P39TAlIcNWSpfblUP1RXqhj5bo+M+jmw4
	K9pfJgQoXmuUe/AQkWdZLrEZ/yybC1gjsljlpj1zJ+mHrvrM755Q5aXpCz8vUzl959bOEfIBokaNR
	27PrRN2SSfX7CCu4KqnUvmrSsqn6Bl6c4SoWMxw6Cf+5KsXUwRoCWspseBgOjzdzcy21AENcSe8Xs
	8Dbn7IoKb2ph6RXKnjXZa9jGCz/Sv0f0g1DEBd8pIvgRwOgowfmtVJahsSjXweuxeqdd9n65vB79f
	6n3fb5Sw==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mnQ-00000007i6f-2oZg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 15:55:15 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59HEGCDs001269;
	Fri, 17 Oct 2025 15:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ZQ1TtLHokmslhzFjee4cGuD5m+V7qM
	5aPPie4zC6OAs=; b=Law6VkvY0ICKNKchLEppxjum8vOcIanSKnBL7OT7PTmQg0
	/6qxbBVReHS20QCrAw8Mw10mAM94rLvvh5tD8wbUb+e/utZivGuGVMyuc5GqkixP
	9WWXmRLKv6pzkRAEKw2FfWsg1p5GZVTfuvuxnFm6T98IRMQAUQ+8yc/rD5Z5b3uH
	X8d0zz6VYhOyCbAzuvtAz8NrnXH38xtQ7MCVtxDrzdSoscnaYPFy05mStbIeDDtp
	SKaXWeccmeQ4KD9PLzrxCjVQVpjNf13uY8Trn2RjdAn/nkDZsccyOmP07vNlXyJ4
	AsYtlADdQJJL2sQy3nsR9lxvDfusEAX4XJPoEovw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp8em13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 15:54:20 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59HFmLFW024554;
	Fri, 17 Oct 2025 15:54:19 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp8em10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 15:54:19 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59HFlK7X015010;
	Fri, 17 Oct 2025 15:54:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 49r3sjwvr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Oct 2025 15:54:18 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59HFsGL659048250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Oct 2025 15:54:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 503512004B;
	Fri, 17 Oct 2025 15:54:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 980F420049;
	Fri, 17 Oct 2025 15:54:15 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 17 Oct 2025 15:54:15 +0000 (GMT)
Date: Fri, 17 Oct 2025 17:54:14 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Hildenbrand <david@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        x86@kernel.org
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
Message-ID: <55f8b155-5468-43fc-b6fc-f509f4becd5b-agordeev@linux.ibm.com>
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015082727.2395128-7-kevin.brodsky@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2uFWZ81CE4CiNc9aZu2A8JlAcBwqq-tc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA4NCBTYWx0ZWRfX2Zriy77SuQpm
 /GHNuVH/UFB6mOfHOC2AuP5g7c+urTyXE81dQ6L6B0AwkiPLgihig9dwBQiKw0AYwvyn2/UBXXe
 VcGvFB11D3W4lhURudq3zaSM9GHtCo5XdEsYeLbFUmnzVB67HZP20B2Uxwsqr/DnC0GUNt8pn+Q
 lYbw9Nsugz7aigNaGXWz8mjQ5H0X7sXZm5KLMDqasP/WlwVPUM+i7GhB70V9ACBzBfu/gATiLsp
 HWtKR/YcgMc3XVsjOXDXb6rwcyJoPiLdVPL4d9Uovyfy1Y+6KXUtJGTOvjrlEvC+BEx9y22ul4M
 iyiO9mTSInwQOYOlHV2G1yBHcLyrhGstPiwazxXG+Q1pEZlUKx7CHtMC4Sa0JzAFx3fiGUVZ0Ll
 LSljgWznsRluu1F2sKhweaOdRoS3mQ==
X-Proofpoint-GUID: B3M2xirfIqNJrZzR03DBgN9gZToY0y4x
X-Authority-Analysis: v=2.4 cv=af5sXBot c=1 sm=1 tr=0 ts=68f266ac cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=1KDjgaeL6VvqQMJ9c2UA:9
 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_165513_637577_92792131 
X-CRM114-Status: GOOD (  15.52  )
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

On Wed, Oct 15, 2025 at 09:27:20AM +0100, Kevin Brodsky wrote:

Hi Kevin,

...
> * lazy_mmu_mode_pause() ... lazy_mmu_mode_resume()
>     This is for situations where the mode is temporarily disabled
>     by first calling pause() and then resume() (e.g. to prevent any
>     batching from occurring in a critical section).
...
> +static inline void lazy_mmu_mode_pause(void)
> +{
> +	arch_leave_lazy_mmu_mode();

I think it should have been arch_pause_lazy_mmu_mode(), wich defaults
to  arch_leave_lazy_mmu_mode(), as we discussed in v2:

https://lore.kernel.org/linux-mm/d407a381-099b-4ec6-a20e-aeff4f3d750f@arm.com/#t

> +}
> +
> +static inline void lazy_mmu_mode_resume(void)
> +{
> +	arch_enter_lazy_mmu_mode();
> +}

Thanks!

