Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3570CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 04:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCoaHie55kyGg4JrFoWMLMH4ZYbUadetcp1lLdpAeDk=; b=qMw/oFFvVxiwDAsZnN+A3my6Nt
	wE9eqRrXkDfCXO7fUzOBinLxvd1Y6srlVQYiRX4vKVWEUICG8W31gexKyWU0LUq6mitUJWrhZLI2R
	4CfZK8fcOY87Edmv0IRXl4ZRANtDMZUwCnE79poD7uABhVHSSlnKCvbvxpqJkiiT8B5ObNlqcsFo5
	sBtVwsERF+0UKxYEMckkJJp6kdfxLpWTOW9SMm/m9YWyggFuUJd68/7IxIokdxwnzc3Dyz3PwINSg
	nTwBBLrNOC72uWpgGF72xOtxgZIO1Zhzyu33kvoIDSHDB83pY23x6678dLWaPb/8IZ7m6mvejYFlz
	K4AEqQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBPJh-00000002JbF-00Ab;
	Tue, 29 Sep 2026 04:19:45 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBPJf-00000002Jam-18Hv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 04:19:44 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T46Lbe3076728;
	Tue, 29 Sep 2026 04:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=UCoaHie55kyGg4JrFoWMLMH4ZYbUad
	etcp1lLdpAeDk=; b=UpwSPBry6N6XgHidsHmWmnArIZQxz9lggpREBynZMHIehz
	jlMokhOyEHri2vBp4URgOcJzUcrcLGHtEj2lrOYY9hefzK5L4WBF3n13PABDmpeD
	bsHhCxtXwLxpoUOcT4sVu1aZKMbujB8AHPl3MPhvWFVo3zdl4+PYAsi8SkBrxXSt
	JhqiKATu46tLlxfOvwFr9671R/VsZiWlslnBV7eE2IS9ojRJAHt2CwhMyN73vXT4
	3q7F9RzrXHP89W6+QYyEQrvfsG/w8z1+D33SvT5Fr6NpMTVAmbnxEvQ7znEVfYlI
	z5PbZGHLELBRMzPtK7petQDY3Tp0FgcWR4aYQxOw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gx5j556dy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 04:19:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68T4HcIr1175984;
	Tue, 29 Sep 2026 04:19:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gxu2y7wy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 04:19:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68T4JKob50921874
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Sep 2026 04:19:20 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BFBB92004B;
	Tue, 29 Sep 2026 04:19:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99A4920043;
	Tue, 29 Sep 2026 04:19:20 +0000 (GMT)
Received: from localhost (unknown [9.111.43.27])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Sep 2026 04:19:20 +0000 (GMT)
Date: Tue, 29 Sep 2026 06:19:20 +0200
From: Andreas Grapentin <gra@linux.ibm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter <fritz@linux.ibm.com>, Fuad Tabba <tabba@google.com>,
        Gautam Gala <ggala@linux.ibm.com>,
        Hariharan Mari <hari55@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Hendrik Brueckner <brueckner@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v8 16/29] arm64: Share arm64 headers with s390
Message-ID: <ars6Jh5DiendDT7G@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
 <20260918133107.1042730-17-seiden@linux.ibm.com>
 <arqQ2Eat4VUBbl49@arm.com>
 <20260928162345.428362-C-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928162345.428362-C-seiden@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAxNiBTYWx0ZWRfX6Nn1f/umagMM
 1+irdbg0phEtd+BZvjSTdH7HQbGsCmhy3UprVF8arUBdsMZJ+2vmEsRH9BTFg7n6sjFwz4hBm+p
 wznk7RoGSpUUQWYHi5qisxSndJSLkEk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAxNiBTYWx0ZWRfX7mGjGWpPZTDW
 BwTe+UpwAhEwgur5zlUZ6JpYhHkujlYQYmos7k2vGrn7GmfK9jN071tje6//kHoGXN4+6WTjs7Q
 E19V39a1AXE0+VbnjKAUk/aCKdGJWXFtmDSyorcFq6Pa1mBR+DuLgGrtxWWKnG8TFp7WCeHjF/E
 4rgP5e31jDqfVLAjnnQF20yCImf6OJt4HBJ2k1Fbuv4Uv8RgORXNf7ognCXrNNZOK61mLZFrqfk
 /sxB5f6h22kO/Ge661UxZceyYENF0EOudvMUjZME0uoYEse48lopa/N+llegytw1xj4sVH5Ldlv
 XJjOzMG11Vy9FY98GMK5NSPpv4GsYzSLZfUoWHGQ/HxBPE0AXBsYfnmmQyV6NNsZ1PYbitqOy0M
 0c7npeCv3MQuT4aihFyATVs2nY0Tu9R1Kt+4dA59dwq8opp7GmQej+vWGHmpwyvtl1hqHlHeRP1
 ZyjBHf5iNjhnQxD57Pw==
X-Proofpoint-GUID: NCy8N2_ZnqFwaT3dU9M5d5pFwo3tFVN4
X-Authority-Analysis: v=2.4 cv=RKcmjIi+ c=1 sm=1 tr=0 ts=6abb3c51 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=i6sFrxAX1s6maLuQdwkA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: MHF4wWmMN9gEzyso21XKl4nvdZcx3ejq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_211943_323808_6A2AA930 
X-CRM114-Status: GOOD (  22.35  )
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

On Sep 28 26, Steffen Eiden wrote:
> On Mon, Sep 28, 2026 at 05:07:52PM +0100, Catalin Marinas wrote:
> > On Fri, Sep 18, 2026 at 03:30:53PM +0200, Steffen Eiden wrote:
> > > +# Enable all code shared to s390
> > > +KBUILD_CFLAGS	+= -DARM64_S390_COMMON
> > > +KBUILD_AFLAGS	+= -DARM64_S390_COMMON
> > > +KBUILD_CPPFLAGS	+= -DARM64_S390_COMMON
> > 
> > Do we actually need these defines? They seem only to be used as markers
> > for the awk scripts to extract the definitions. Why do we need the C
> > preprocessor involved at all? Could we not just have comment markers:
> > 
> > /* ARM64_S390_COMMON_BEGIN */
> > ...
> > /* ARM64_S390_COMMON_END */
> >
> No technically we do not need those. They could be useful if we find out
> that AWK is the wrong tool and move to a C Preprocessor + diff based
> approach. 
> 
> if the ifdev is not closed the compiler will complain, but an 'arm did
> not destroy us' verifiaction tool ( I will send one soonish) could do
> the same.

iirc the last time we discussed this we didn't think that load-bearing
comments were the right tool here. We also briefly floated the idea of
using a #pragma region based approach, but in the end we went with the
#ifdef preprocessor directives instead, as the least invasive
non-comment marker that was available.

Best,
Andreas

