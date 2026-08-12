Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E13C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 18:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPPMRy/pB2o94vhgbGQCXoQoKQnRs3IQQPirCbk90Hs=; b=civEYeM0xr48FdHUt5ZDFg8VaA
	8H+yZeV5hbwXrvsj4hdwTwS3EZyIJz0IMJB9aF+8Bq8kEANrXTyZm2MlVVo0iKt1EHQixeWXUCzbW
	tZWhZGqIiHm4ROhGHpvA5hHTtVJ8gmvWJSqln4u7M1KSHYaFfMPE9IUISQu9kYrfNvFx09U3rv+05
	/r/vvnGR4TqrkhYTok05kPDqwj3Puar4PdCh7a4UckT6u90V6B48CIRL5eQTI7CVS8GOxBwLKv8Xc
	0/uorUMzF/8KO+xsf61Ep83w1zXfZ7KO6bk3nlocPFx2Awd6az3nS2uMniFNWgy0gUcwWr/Q6+jCL
	rck9BlFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEAI-0000000GqGc-3aWb;
	Wed, 12 Aug 2026 18:59:02 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEAG-0000000GqG3-10YJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 18:59:01 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CH1TG72217823;
	Wed, 12 Aug 2026 18:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=hPPMRy/pB2o94vhgbGQCXoQoKQnRs3
	IQQPirCbk90Hs=; b=MehwP5SlarxSO2nIgfhxIRgxCxkkospqQ8e+x8lMkSV8ED
	zDyuE7jkcnVgu22GDwfm46f3nv+PP81F0vw0YvD1N5R5GrlcuupK3ke5bvSl4EjU
	o3mu/7zqXCLeRgvZg3UgrlQtm6/An61SE9eijo5mcGkWIZMYCoffzcnuMHNY+T+z
	tYcPQcJOg2CWCjM+RUx3Z5Q+IUtJOTrlOor4GdHWTOmly0MAcpkeu75eLcfiUwWx
	4RsN2C6iaZvCuzJ/tJJUgQoGwTm28Nh+WqNPj2eHaD/eLbr8l09XDwgURJZfUcgo
	NlbpdgvJdxuAsSbySciAzi2Qe7YEu4q9Z8+dolUA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fwvk045uh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 18:58:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 67CIuHV3009175;
	Wed, 12 Aug 2026 18:58:47 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fxf5w7n5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 18:58:47 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 67CIwhw051642794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Aug 2026 18:58:43 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E57820043;
	Wed, 12 Aug 2026 18:58:43 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 431D020040;
	Wed, 12 Aug 2026 18:58:42 +0000 (GMT)
Received: from osiris (unknown [9.111.47.31])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 12 Aug 2026 18:58:42 +0000 (GMT)
Date: Wed, 12 Aug 2026 20:58:40 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
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
Subject: Re: [PATCH v6 00/33] KVM: s390: Introduce arm64 KVM
Message-ID: <20260812185840.593734-A-seiden@linux.ibm.com>
References: <20260812153631.3376090-1-seiden@linux.ibm.com>
 <cdb8b0bd-a15a-440b-9d7c-b532aeee6eb9@linux.ibm.com>
 <anyhChQlOs37se4B@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anyhChQlOs37se4B@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0OSBTYWx0ZWRfX7MoJ9Hv6E3GW
 /R4OHd93lFRt+5GF7wRMy49aJ/aGveR5pLMFUFxa5qD69Z5G1Nv+i/ucQPxuNkLSnDgqEMDX9Yn
 xDCTKYVdXnqKJelQXOX8iKnSohSgt9Hr4SzUweYnnuQ4hNozjR3HWjUMZDCzeyrm9VBAJeWFail
 SInHiG8wdlZJ0Tn9/lN9NG49QrShaGR+2Rl7o+Uw2NkvexTm2fOWTCW55VFmplHKsm6wMXmH3tD
 U9/J3IA0FcSlbxaYN3TO2wtJ4pIPQvaVrAZulx/hVC9RqGu3VRfZgVitdCZjGFE0lN8uyn2QZZ3
 qBsSMHKgCYUjLPw/Vj/JvArVOI3uJDxpjxUrIvnSZv/4kjdmZOe/jg9Mq4TTq9cvu8JoWpTttq8
 hkjGTryP5sw1cwner/mnuciytpdflA66cu2HXolbhnw0RLf+WWTcOkDTF/lF+explUcikXpfZi9
 7CLBfbSFlGYINj3nb0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0OSBTYWx0ZWRfX6Lxzgh2yMPel
 uDXg906lKYk8eeo2lCl1YXeFdCXlr/MpcsjXRkxKB8yX6ajniMPDyRQE0PmWJSOLPHrnG/iETrq
 IXvPiWiwxDvrQckLrZYHqPok82/ZJuA=
X-Authority-Analysis: v=2.4 cv=RqD16imK c=1 sm=1 tr=0 ts=6a7cc269 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=SCr8v9bMOGvgieW_VgsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: bfh4ZLVX5o_CeTAzpesViq7ppkLy3-3k
X-Proofpoint-ORIG-GUID: evfxV4d3bvWDP6R3TgawuGZbaDCSD4y4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_115900_291680_620C4D32 
X-CRM114-Status: GOOD (  18.87  )
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

On Wed, Aug 12, 2026 at 09:36:26AM -0700, Sean Christopherson wrote:
> On Wed, Aug 12, 2026, Christian Borntraeger wrote:
> > Am 12.08.26 um 17:35 schrieb Steffen Eiden:
> > 
> > > C) KVM/s390 reorganization (patches 12-22):
> > >     Prepare s390 for a second KVM module. Move existing s390 KVM code into
> > >     dedicated s390 and gmap subdirectories to make room for a second KVM
> > >     implementation. Refactor gmap to better integrate with the second KVM
> > >     implementation. GMAP hides a few features only required when managing s390
> > >     guests: Storage keys, CMMA, and prefix handling. Those are guarded behind an
> > >     #if KVM_S390_MANAGES_S390_GUEST. Only features which implementation would
> > >     break kvm-arm64 code are guarded. I leave the non-breaking stuff (like
> > >     shadow-gmaps or ucontrol) for the LTO.
> > 
> > I will likely take 12-21 for the next merge window so that we can minimize this
> > patch set.  sashiko and claude are happy. Mostly mechanical moves. I will review
> > those first and might do small fixups myself if necessary.
> 
> Speaking of trimming down the patch set...
> 
> Steffen, can you post patch 1, "vfio: Use file-based reference counting for KVM",
> separately?  I'd love to get that merged sooner than later.

Sent a Spin-off with some improvements:

https://lore.kernel.org/all/20260812-vfio-v1-1-5cfe0b1fa4e7@linux.ibm.com/

	Steffen


