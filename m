Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792D5C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iey2Jpr63n3nHU1c41Y1T/ZmQkdLcdOG8an8pTbFV9w=; b=eYOX4o6NdKdEiHidkmQUuxG0Hy
	ZLUZH56goMqPClgcVa1Tv/jWEqPNUCTG7xA5U5CErE7aUE4Fy7wKDN87t3c4L5hMkBTsm3Qm5yOLd
	EJCLsK47I7iDtWXxNCI/XVaLoNGKEB+1/5Fu9Uah4hoQQ1CDWdfVGcDLsJsTH/0yoTyskFSiOpHW1
	68B6UQEfENNURF5i09fPGlKz6pCy9i2ITqcFqlJPt70hFvQwO0dXUrT3ROAgDpPrZrMBvxo8q66b5
	lr2imiBrqQoaknw9sjLNQo52IxPwxX7hEMBbjb0JfsVAlsSqIwoqM3FkjSgHc3x7iomzcWzGqhbs/
	it2K5LHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqu9K-0000000HSRL-28B3;
	Mon, 03 Aug 2026 15:00:18 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqu9I-0000000HSQV-2JKX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:00:17 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EHXPd2261764;
	Mon, 3 Aug 2026 14:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Iey2Jpr63n3nHU1c41Y1T/ZmQkdLcd
	OG8an8pTbFV9w=; b=rNTUOUdGkVcgJ9ZGLPjNaRh4Fcm1xFF3Zrp38EO8xGLw0x
	cVqjYwCZeUuT4mq51RP3LhDUJCzbE8CpHAT6Y1e2mJNbtHamu/EbGebxpWwB5uQj
	M/fyBhMyPBoIu69oUg6C/6bH1cpZ8TnqVLExeuk54yPFN44TOGSktMtaYmQajzWc
	F3SHT7lXGrjeqqOVb9Qg1BZapIdSPwfhqixvvthd9aE5/V0+uvmyiWS18BGrI38C
	CJn1nBK8mvN5RFvHtABwmev0ERFSh5GUcf8I9+LDK4VKGM1lXu10Zr3VWyJF2EeQ
	Qb4CJK1ypduJR5r16liBPQlHSWOnmCTRR45Xf5bw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fs8a3sd8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 14:54:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 673EfF1P013759;
	Mon, 3 Aug 2026 14:54:55 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fsvmh5tde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 14:54:55 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 673EslnZ50528542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Aug 2026 14:54:47 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A923E20043;
	Mon,  3 Aug 2026 14:54:47 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F56D20040;
	Mon,  3 Aug 2026 14:54:47 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  3 Aug 2026 14:54:47 +0000 (GMT)
Date: Mon, 3 Aug 2026 16:54:46 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Christian Borntraeger <borntraeger@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
Subject: Re: [PATCH v5 13/31] KVM: s390: Prepare moving KVM/s390 to
 arch/s390/kvm/s390
Message-ID: <20260803145446.1315898-A-seiden@linux.ibm.com>
References: <20260731130902.654679-1-seiden@linux.ibm.com>
 <20260731130902.654679-14-seiden@linux.ibm.com>
 <143e8639-9936-4925-ad23-4e9a0aac9629@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <143e8639-9936-4925-ad23-4e9a0aac9629@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E6P9Y6dl c=1 sm=1 tr=0 ts=6a70abc1 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=ux0paVPKIjdiTJjWHnYA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: 1riyHeA8F2vH3x-uSufoBhBMaVaLNayu
X-Proofpoint-GUID: y9gvH08q159En7YyyxekW5oXn5JvA3wM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEzMyBTYWx0ZWRfX2v5kR5VBV9dB
 cfRVvV+kGqQcyJZWE0fND7f0HRrcUKcnfXrvTCWQ7Sw8KCvM7/lhKXaJErruvzirXa3Uza7vn1N
 nB6BRoa3Cht9llSjT95SAMoV3AAMSGM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEzMyBTYWx0ZWRfXz6B7wIGC5uaP
 eWONvTHWLbv4xT10XwDFAB16ZDxkfjbmbjdYIxVlOVr2UoNh+3LkTcDAEWWfviO7JahhoBQPiO2
 k4N//DTmeSVIA/1bwDrWX5gwDZIs8mf1R6gEVyT4Vw4hB8aZXreFzyVyXERHg9FdCrKMxg4kwip
 tZnan1C4DX6ST2rYMbHtP6mT1ZGCzYbZPXUGAzcuqc+4vqCmPnq6VirNai9QD4s8V2vFESbcwNs
 ZZjWchnfAR0IZcG0LiHd8rA8vHulweVhjjpQiPf5neMrJ+IaMNEbzcYnxPFggQCJ/hnZoJd6scz
 P06BTWNP628NIKWDwTj3ebbGpH2aAoPmvYe/Veknh+L+4TGhB3K8al02gH8sGGV0YJMuymHem7P
 KlAMObPVNT3oRGFSXtCwg1fQj5jKLHQMGT8L30KA4kK5AI+4Aj3wKBaTEBXKDSvPZtYnJBbcjRA
 sw8+oJ6+edTYa9i5SgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_080016_619540_87D7CF07 
X-CRM114-Status: GOOD (  16.52  )
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

On Mon, Aug 03, 2026 at 10:14:04AM +0200, Christian Borntraeger wrote:
> Am 31.07.26 um 15:08 schrieb Steffen Eiden:
> > Lay the groundwork for moving the native KVM/s390 to s390/kvm/s390 to
> > allow for a second KVM module. Move all the kvm_host definitions to
> > _s390 postfixed headers. Prepare local header include guards for a new
> > location. Move gamp related tracing into a separate file. While at it,
> > rename the main KVM/s390 files from s390-kvm.{c,h} to just s390.{c,h} to
> > match the naming scheme of other architectures. Cleanup the KVM/s390
> > makefile.
> > 
> > No functional change.
> 
> Would it be possible to split every single semantic change into one a separate patch?
> 
> 1. kvm-s390.[ch] -> s390.[ch]
> 2. kvm_host definitions
> 
> maybe also
> 3. gmap-trace change
> 
> That would make the patch easier to consume.

Makes sense, I'll split into three.

	Steffen


