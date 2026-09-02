Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C7DC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myq+/DG3jtnOprRIB3t4zbh7K9JqN7YDUvAzxlH/Waw=; b=PeLLWPOTC5nooo4M5cHRyglu9F
	kp5kH5tH44K2GMngzs1eU1ceiXqMbuGpZg2746/iYrpR4py12cvNMNW+X/KkhwOInyCOF8qSM9z5D
	RzmcVcGhsarj1P495lYXxg3afia0u49aYxbtVmg+0Kq4N7WmRgfubp0Zcbg+0tMf5Zqys9cMUybkk
	pkK/Sc6Sq5NgYewbQOgZ/mAvWha/8VT1UnxRvSyXBQ1pKv7Y5tZG5jmiqFzPkwEy7QFj4/KJEZLYn
	2cSTZY1GCdTe55lYI63ptG1cMkUUAdCxH0B+WxZw6KzlRrquxT2e8+7Olx9MiQSKkO6XubjbtMQDs
	xbJk96GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gFa-0000000E4z6-3f7l;
	Wed, 02 Sep 2026 08:23:18 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gFY-0000000E4wu-1dJs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:23:17 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VvZI2306903;
	Wed, 2 Sep 2026 08:23:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=myq+/DG3jtnOprRIB3t4zbh7K9JqN7
	YDUvAzxlH/Waw=; b=n5KMNp2cQl2aqL25b6hN6sJWMAf8b47u9YbUx1H9gd5nK1
	jEQUSkO/REmV8QKBiQ9bvH0tJr2Gqs58sUMsvelE0IhAMiHX+ZLL5mOX4RcSrZzP
	xWzZ/eLFxQm5cW1VeOzrXOkStwYvnaEv0M0gB4vItwG15wj+HcPN7JXOLh9VGgG7
	AoH8EmRF54feFpFmhg4SnBLOMIaBL6MDhFwb3SytSzWUyZXtV3Dl6biHPybwpNck
	g1DRwGJmORxckiWE1RRU5byHPpVapugpdy/2uxlWrp2vEgxNy4EKeKhieopSOJH/
	3OPuAT7N2mioohjMmF945xFalcbZGbA8Ugp+ceyg==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gbnudvy9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 08:23:03 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6828BLQ5012528;
	Wed, 2 Sep 2026 08:23:02 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4gcbyggdrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Sep 2026 08:23:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6828MwmU46334282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Sep 2026 08:22:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7AE9A2004B;
	Wed,  2 Sep 2026 08:22:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1871720043;
	Wed,  2 Sep 2026 08:22:58 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  2 Sep 2026 08:22:58 +0000 (GMT)
Date: Wed, 2 Sep 2026 10:22:56 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Sean Christopherson <seanjc@google.com>
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
        Marc Zyngier <maz@kernel.org>, Nico Boehr <nrb@linux.ibm.com>,
        Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
        Oliver Upton <oupton@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v7 03/23] KVM: Allow KVM implementations to switch off
 MMIO independent of Kconfig
Message-ID: <20260902082256.438647-A-seiden@linux.ibm.com>
References: <20260831144802.834315-1-seiden@linux.ibm.com>
 <20260831144802.834315-4-seiden@linux.ibm.com>
 <apdwHcdy2iYRTrww@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apdwHcdy2iYRTrww@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: PegjYO2dcjjFja5IBSIoksPFsA3_yCIF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MCBTYWx0ZWRfXxZTpdKIMadP+
 hECdMkWYg8VeNfu0AcnLQXTBiCaI3zlfwxdL45awk2mKQnlMZxXf6EFh7Hspz115kooBrW+gcWo
 OLyn7miU1JZqbCSMrxUTfW6vWd5WJw7XxLwJ9DFUxT6X7tS8aj+fr/VPIozvNYDtFSLI/4mqIs8
 nH9zyZd9ioK0Rck+6/+u7Tsqzu9J2cct+H3U1UFdbKSaZxg2UDfw/Glkl2jSmh6vKysF6LgWpw2
 Lq2pOvvMnO0BpiJcccPT5tiNjkvggdSdGlBCeveoRG9rKL3guNZmvX6vLc7sXsZ4wyi98BmohuF
 D03m3V4Hl6nCl2yRfSAmBhYDASoSrgySjQ9gsH9+KEtgiT2aasUIM4lG9+dEe4URedrlOiR+g5j
 43ltPF+D7gKfIlc9Ahlou/LUrwHp3qR8j2fnRx8mYClkC9PppYhB9FJRs+LCiaJGtXAZLcPRHdi
 ijk/UHb3RV6yP45ktwg==
X-Proofpoint-ORIG-GUID: Z9gBGfJv4YrXzi45b0jSQ8_rbtmzd5ws
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MCBTYWx0ZWRfX1eINHSzT2ujO
 TH6kMMJZ9sI97OOY17eJfPQkbahQxVxIlkGHm4vD+RnzUngsAZ2wsqanN1WuzTeJeLdlLVCMN7W
 1cmBj4yRXW+6VJ7qNEODiTYVaqbQMps=
X-Authority-Analysis: v=2.4 cv=B92JFutM c=1 sm=1 tr=0 ts=6a97dce7 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=LZd3j2bqb7V-iaZHDUcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_012316_546576_1B92C31E 
X-CRM114-Status: GOOD (  19.77  )
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

On Tue, Sep 01, 2026 at 05:38:53PM -0700, Sean Christopherson wrote:
> On Mon, Aug 31, 2026, Steffen Eiden wrote:
> > Only defining KVM_MMIO is not flexible enough for multi-KVM systems
> > where one KVM implements MMIO but others do not. Solve this by
> > additionally testing for the non-existence of KVM_NO_MMIO before
> > including MMIO code to KVM.
> 
> Ewwwww.  IIUC, s390 ends up with two KVM modules, i.e. there really are two different
> KVMs being built.  Rather than have a KVM_MMIO and NO_KVM_MMIO, I vote very
> strongly to drop CONFIG_KVM_MMIO entirely and replace it with __KVM_HAVE_ARCH_MMIO,
> a la __KVM_HAVE_ARCH_VM_FREE and others.  Tracking two separate macros is going
> to be annoying to maintain, and will definitely be confusing for non-s390 people.

You understand correclty we compile kvm twice into different modules.

I already did this approach (with a differnt name) and dropped the
config in (v1,v2,v3, and) v4 of this Series[1] and Marc voted against this :) 

I have no strong opinion on this and do whatever the both of you come up
with :) 

> 
> It'll mean linking in an emtpy coalesced_mmio.o on s390 when building without arm64
> support, but I'm guessing that won't be at all common for s390 builds.

This should be no problem, I assume.

	Steffen

[1] https://lore.kernel.org/all/87a4s37scc.wl-maz@kernel.org/

