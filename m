Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E329C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PT5zAyfYZGqrjZ4d9dNVpiOgJ/2BhfKmMzH9KYHUPCs=; b=gE/YkM3gT3r3LQSMOKVY5oSL25
	M9LB5GIbv/PHsCDsGS05GjHmTYxC+ou5GgfMMPpbYGn69D33L/mLsVJkkXUBvdUv7K8mY0h64Q+KN
	VtNKm+OPTL9ofPEwDI0lGu/9fqUtq4brNGZrqgR5mlbgL/jANMcdKHfcqB3pKpAb2gybHARSIQ6On
	sVnZuyQjIKDRoQwArZsI84bjnkRErqkf0UNQfDl7F+0AKwAlFkIcBN8m3iXPv41XYdijlBUd9Ldlo
	GXf/uoc/7FbJ3C/CKyeztZgJ03jYPRpJSov2PUX+0oqnS9lrnVNa9dlh19PXjxOaEML4NFWYZotv0
	CxtidSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi70m-00000004VSz-35Qf;
	Fri, 10 Jul 2026 08:55:08 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi70k-00000004VSI-3Zmb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 08:55:08 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7masZ605539;
	Fri, 10 Jul 2026 08:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=PT5zAyfYZGqrjZ4d9dNVpiOgJ/2Bhf
	KmMzH9KYHUPCs=; b=evyLDquaWgbDutRXRl7/XsG6iNMUnmOMIZN5YrvXlwKrYN
	CDJCH8PwqntSSmkeWWiSY5NA6rSpT2vFaVzwIfLyecRZQdMuEpUgZY0+UqkJg0mZ
	6NUmTjfNgWR1LaxOM+AguEmQ7bXFFJcN4J52fLGs11NS3XmHnsoP2fmeZRX4/PBZ
	QCmFpL+5s0s2Zg8DGg86RPRbNSC7KZUVNpgbnOZp1UpG0ATQTPVkojg7Gjv5wFnB
	CUFtVGuHSEKUAS9j+Vd+dlhZfIS3VLPzaPhjsMvXUmrCetkPorj/bhnfpK91ef4X
	W2zp/g1/6RHhQOCCii4+cVEN0ZGiRfFbQLsTaL7w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6qknw70r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 08:54:52 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66A8ngsj025443;
	Fri, 10 Jul 2026 08:54:51 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4f7f6ygvjr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 08:54:51 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66A8sink12321080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jul 2026 08:54:45 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB6FD20040;
	Fri, 10 Jul 2026 08:54:44 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08E822004D;
	Fri, 10 Jul 2026 08:54:44 +0000 (GMT)
Received: from osiris (unknown [9.87.147.219])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 10 Jul 2026 08:54:43 +0000 (GMT)
Date: Fri, 10 Jul 2026 10:54:42 +0200
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
        Friedrich Welter <fritz@linux.ibm.com>,
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
Subject: Re: [PATCH v4 05/27] KVM: Remove KVM_MMIO as config option
Message-ID: <20260710085442.984749-E-seiden@linux.ibm.com>
References: <20260706085229.979525-1-seiden@linux.ibm.com>
 <20260706085229.979525-6-seiden@linux.ibm.com>
 <87a4s37scc.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a4s37scc.wl-maz@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Q/XiJY2a c=1 sm=1 tr=0 ts=6a50b35c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=9pq-tb42-J4kxd0kViUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: wM388sXXjnjG4_TIOd2ildNFbThmqmSd
X-Proofpoint-ORIG-GUID: wM388sXXjnjG4_TIOd2ildNFbThmqmSd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NSBTYWx0ZWRfXxGXLvy3r34pv
 2y3rXeOF17UYrpTG1ZMCkfV+BaHFzFD97Qu+UJoguBttolXd/3SdBkI3dtFYW1gi9hsAr/6b+Ou
 6ppDN13fVX0ETlOUQQlHey/Isj23Jk0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NSBTYWx0ZWRfX3CFc8mLUo+4u
 CIYnQElsV3jjWye2hGYjlrMeeLPTvVgLyjSb7KwYSsEc4mE5GvP28T0ObIxEPQ90bOpDcnNvJox
 IvT2tGBZQiqPu90wCVjhGTpTE0oxdZML6bcTbd1Png+6TvbUuVJRJXc6fBghjx3xRlDIY+N6ajE
 0pS6iPYow7kzyjq7FaCZ87RO6zAMaq5duZgDd20bBNyGmLZKSj89yzsKWjwYXSnnDtBeprqQlAe
 wFDQDDWEYaw1U/aPxtjVjQMK91Kq0Esiy9UqBBFJh8GvhFArW++x6nsyEHpkulsaGtpYfhv/9JE
 WYY5baWDCUYDpnOtjZDD+InFgnkteq2kVj9DMnWP3KDJf6mp4wB0GwK2OXg/lSgjfcxpqw5DRLp
 EedaSKfiOVE/jEzH9Z5oU9y5YtCDRRF15Em/72dmPHFEnZpt8tAThxGrBU+tIr9lXMqc/Rd52B3
 J0XD42UBOQrx8e4SWlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_015507_007506_D2B22EF9 
X-CRM114-Status: GOOD (  16.54  )
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

On Mon, Jul 06, 2026 at 09:53:23PM +0100, Marc Zyngier wrote:
> On Mon, 06 Jul 2026 09:52:05 +0100,
> Steffen Eiden <seiden@linux.ibm.com> wrote:
> > 
> > Defining KVM_MMIO is not flexible enough for multi-KVM systems with
> > different Kconfig options regarding KVM_MMIO. Therefore, remove KVM_MMIO
> > from the config space and use the macro HAVE_KVM_MMIO instead.
> >
> 
> Given that there is only one KVM architecture that doesn't use
> KVM_MMIO, it feels like the polarity of this symbol is the wrong way
> around.
> 
> Something like KVM_NO_MMIO, only exposed by S390 for its native
> support, should significantly reduce the churn.

Makes sense. I'll add KVM_NO_MMIO and conitionally compile based on the
config and not havng this symbol

	Steffen

