Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44665C624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 09:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xV5uxuK+OqQtUrop5OEhE1Ov9RkWifhVrlckzwzZjFY=; b=Pplobk02PbawUfRW9Ui9dntBMv
	DAVfBRrv4qeY8r2jq0+DpDRhvxbKjGyCicUGkiUW6zeYuVsVWHokAAgNuWF6qyTmEpUpV/g+kq9np
	oPcXsARUJpdf3cqEMVcjzlkYFvkxISznFGprEWuNEFtt8R5FCcyAcSSWE9RYccx5qXCosT2//yt9C
	ZAOhPZ5iPEXzQJ0+SsauB78lYKyxXeIN2ysScIlrloVho+ZgO8H5lKuKn2KlhrGFGuHTgWzy55eku
	kJfYZ0PuTqKJMolzh31HO3c6D0owvlSlKYriUjanYy8KCkMLQKfYZDPAoNmGBGH7DrRLoJFx0Zca2
	aOeiv2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Kl1-0000000BQHc-0LdK;
	Tue, 01 Sep 2026 09:26:19 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Kky-0000000BQHI-2umX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 09:26:17 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6817VY9x571761;
	Tue, 1 Sep 2026 09:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=xV5uxuK+OqQtUrop5OEhE1Ov9RkWif
	hVrlckzwzZjFY=; b=iPYF385IC+vCcd9WWwAA7KylYqvthnwLEYL3mqZQqR08Ac
	Mg8/xaiCR8CuI4nqQhWLjeUatMnmKW48GF3LD9zn+TeEFcAY9aRAkuStH5LBHQ1j
	Xm9TJ7J3+ytdTWOlasVRUxlINDUMrpc5b6geLeIr4ezaDOQOhme+nxKusfSW2r0f
	ahA/91PeXK2U5TSoHIY8PM/wLjNcbamRXdiXv+I80VtTCSoiCXaJ7fA8Y+EjU6E/
	fhfzHAGRjkJVVP435nNBkq/b8LyhcUtqnYxoO53RsCb39vFHS83Y8PjKs5z3QKKk
	uJ1ft9YqYJioIjHzon5e3M6n5rAJbYfIJfaR+oyw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbq54pv5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 09:26:02 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6819BIOD005036;
	Tue, 1 Sep 2026 09:26:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gcark2w19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Sep 2026 09:26:00 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6819Ps3537618120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Sep 2026 09:25:54 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 336602004B;
	Tue,  1 Sep 2026 09:25:54 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C864C20043;
	Tue,  1 Sep 2026 09:25:53 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  1 Sep 2026 09:25:53 +0000 (GMT)
Date: Tue, 1 Sep 2026 11:25:52 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
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
        Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v2 03/20] arm64: sysreg: Define OSLSR_EL1_OSLK_MASK
Message-ID: <20260901092552.231001-A-seiden@linux.ibm.com>
References: <20260831145536.913567-1-seiden@linux.ibm.com>
 <20260831145536.913567-4-seiden@linux.ibm.com>
 <87v78pmmtz.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v78pmmtz.wl-maz@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA4MCBTYWx0ZWRfX8xslj0CEzrny
 I870zjdnuI65T0MuYtoOptYdzTMbteRcW+SxhEtSXVJyq+JKjL1e8xqpqJzbl8ta3JemDEbbxGZ
 FonFGGrB3t4IVuPmLFKqQV4be7v2CY5fZtn0qX2rZ7LKq8htSy04qEGwiuB2J/kYez7l5t15QBP
 IH5JpIPQ+NGVk1jfUjTu90FlP7BR0SuTFX89zbz8N/nXk5GPLFlEhqq/GOYe8gnkYZrau91y/iz
 f7rXrheByTG170YogC6v7SNbWytI5YtnP9voY7HkzFD1IJKokdeipktn+6twX4mWywhIxXLiINk
 SQGqdVg1zs0aDqDQSez0wdGGrPlQENN8SmewK58qLgt5RS8B1b0n8imqn+osaY5aPOMfILClJyz
 gMBS2LwIQff1/5+0Ca/rtvdFXcHnIPHHuIb8HZ60WlUM2ue/9iG85H6vVft3lRk38nHQ94GtB2k
 L/FEKcdsNpp4K5/Yl0g==
X-Proofpoint-ORIG-GUID: I-mtpcS85hHB8dxIUUm3PzblhLWkM2jC
X-Authority-Analysis: v=2.4 cv=CNgamxrD c=1 sm=1 tr=0 ts=6a969a2a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=tb7DenZA0QQaIP_q4lIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: LHOJJuwKv02WXCucgi7cBBp1KnMnc0PR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA4MCBTYWx0ZWRfXwtM0K71xZrh6
 2N3iuWstOoFIsy8FtxbkR+jF9480VaNirXdbLdtu4uNUhCO6AoadoKorhMXRTKja93QvI5rkFjQ
 qqSHwIkbMwWMwgqTkFqxoK5Av2Ms+T4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_022616_737280_AD603812 
X-CRM114-Status: GOOD (  23.98  )
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

On Tue, Sep 01, 2026 at 08:51:04AM +0100, Marc Zyngier wrote:
> On Mon, 31 Aug 2026 15:55:18 +0100,
> Steffen Eiden <seiden@linux.ibm.com> wrote:
> > 
> > Define the missing mask for the OLSK field of OSLSR_EL1 which is
> > required to safely write a value to that field.
> > 
> > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> > ---
> >  arch/arm64/include/asm/sysreg.h | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> > index 1c5c4df260be..5a439853b721 100644
> > --- a/arch/arm64/include/asm/sysreg.h
> > +++ b/arch/arm64/include/asm/sysreg.h
> > @@ -200,6 +200,7 @@
> >  #define OSLSR_EL1_OSLM_NI		0
> >  #define OSLSR_EL1_OSLM_IMPLEMENTED	BIT(3)
> >  #define OSLSR_EL1_OSLK			BIT(1)
> > +#define OSLSR_EL1_OSLK_MASK		BIT(1)
> 
> Just move the required sysregs to the sysreg file, with the full bit
> description. This will sort this once and for all.

You mean to the tools/syreg file to generate the descriptions?

I wanted to do that but OSLSR has a split field (OSLM in bit 3 and 0)
which the generation tooling cannot handle. (right?)

Now that I am rethinking this:

I could move the stuff to the tools/sysregs and in addtion define the
OSLM field here manually but this time using the generated constansts.
probably sth. like: 

#define OSLSR_EL1_OSLM_MASK		(OSLSR_EL1_OSLM0_MASK | OSLSR_EL1_OSLM3_MASK)
#define OSLSR_EL1_OSLM_NI		OSLSR_EL1_OSLM0_NI
#define OSLSR_EL1_OSLM_IMPLEMENTED	OSLSR_EL1_OSLM3_IMPLEMENTED

Shall I do this?

	Steffen

