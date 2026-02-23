Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C2BE98E0F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 09:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1vvgdbabvq4XUBn6fv3p47LMst074M9ZInSRkAhcpA=; b=Qh0chgpjx4KDoaAFPFwFt0wCho
	QRVcnKi88G4XiZpfKf2i4xBjm4zuZB65ui87JBTCJPixfxzBhb50ORPgKXRiqZ8lt6Vrctso0CwWA
	j1kIjJI9o7+3rKaxdyyMUz8gpqdv5DumTyUQmTj9pjFHnyJ8rHlh8CZ1dDFQKUprc8++7tIJfblyU
	FAB1pk/u2YfZayO+7Krk1I/+9xe06tbEHF4OihuXnaCIr6nuKUmBwo4ysnAx4FRbh8Zekgx6kXMiK
	2gmv7nczZ29VxLwHe3uae3K6ysyFJJ/L4ocp6qwQ2XTMX1iN1fh2D4R+Ie74CPumVyS8w1ipHnCQi
	xOJrpjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS6O-0000000HWad-0nLv;
	Mon, 23 Feb 2026 09:19:40 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuS6L-0000000HWZs-2kvB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 09:19:38 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLlYc62582842;
	Mon, 23 Feb 2026 09:19:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=D1vvgdbabvq4XUBn6fv3p47LMst074
	M9ZInSRkAhcpA=; b=k5WprDZ1OuWFkzw34uw/VqQN4SDbnUpXhgPcUv5GQ/8JWv
	LYMA+BWoTROdpG9+CUJPx1K06atld6Rd9241y7ca0eyMRc6V9PRxIXrG4kjFyK0M
	6GCegn6N3jWZztUqiGAxbrz5MVhE02JqPQT8yHXDSwVge1Ph3UYpnvOGcne7pJnk
	C/T5SWgQIdr0k+2u3ajk/k0uV217kUjC08s0SqTI9gMz8fyiw4fhXvFiEVz1KEhR
	mJKHx5JK+7A1FQNKaRjtzGV9Tj8hsP4keY56owiRj1rFA6BNKNqP7yAo7I/PN93m
	Za1+Cm8j4K3Xb2MpvLwERAef26u9HoMl4H8D5qDQ==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf24g68ts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 09:19:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61N4R5Pf015750;
	Mon, 23 Feb 2026 09:19:18 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfq1sc99r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 09:19:18 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61N9JGKm45809994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Feb 2026 09:19:16 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F162E20040;
	Mon, 23 Feb 2026 09:19:15 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A18A20043;
	Mon, 23 Feb 2026 09:19:15 +0000 (GMT)
Received: from osiris (unknown [9.111.54.98])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 23 Feb 2026 09:19:15 +0000 (GMT)
Date: Mon, 23 Feb 2026 10:19:13 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Dev Jain <dev.jain@arm.com>, Will Deacon <will@kernel.org>,
        Jisheng Zhang <jszhang@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, maz@kernel.org
Subject: Re: [PATCH] arm64: remove HAVE_CMPXCHG_LOCAL
Message-ID: <20260223091913.8139A0b-hca@linux.ibm.com>
References: <20260215033944.16374-1-jszhang@kernel.org>
 <aZL46z1UZkQlF3Dd@willie-the-truck>
 <89606308-3c03-4dcf-a89d-479258b710e4@arm.com>
 <6d30176d-9673-287e-4658-a5e9e6e5d649@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d30176d-9673-287e-4658-a5e9e6e5d649@gentwo.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=TNRIilla c=1 sm=1 tr=0 ts=699c1b96 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=FhHsSIHnO-3NYp-ZkXEA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: FfOG356PllBGcL4cFZoTPHDdr2AldGay
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX0UoJva7jCva3
 z9d41zV4OBne2pTiVEEhjv5cb5YHPlpt7K+P7rSz15b1qEQbW6Jpo1ge+Lm0BQnyW9fRhYP6CKH
 HZ4QpIfQeGXfj0tMd8dV418IKUdcq3Po6Pupx9dfAuHhwBNGdeClkWUlMyDWoOiTiDR6rcY7wuc
 vXv9v9qaDOiTso5w+px82r4J+peiUdh0seZCfNv5dpd7V6Uj7Ga1Q1b8LWI1Lz2ruVLoDE596f0
 syF+WAvv8JDYUhxBiRTPwpUb+jqhJ9sszEReTuGuaR1EgSDm2G/DYqc1r4JZjinn//lh0rs9+4v
 bMiNTEFjFxLhP0AP40LRn/Y5G/hoR8wiOfFhxXQqOArg/fiGa2e+aY0aq2qlg5ApL594CKGpokb
 1+5lJ7fV0ZJ0QTk5Xp+HoK2sJC08hinckBU0MK6gvELhay5aXl5h+EE9v8Lc/2kXUYR/lTHa6LH
 wqV6Ki6fO0bOxge9ebA==
X-Proofpoint-ORIG-GUID: FfOG356PllBGcL4cFZoTPHDdr2AldGay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602230081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_011937_816048_BF215107 
X-CRM114-Status: GOOD (  17.27  )
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

On Tue, Feb 17, 2026 at 09:19:22AM -0800, Christoph Lameter (Ampere) wrote:
> On Mon, 16 Feb 2026, Dev Jain wrote:
> 
> > By coincidence, Yang Shi has been discussing the this_cpu_* overhead
> > at [2].
> 
> 
> Yang Shi is on vacation but we have a patchset that removes
> preempt_enable/disable from this_cpu operations on ARM64.
> 
> The performance of cmpxchg varies by platform in use and with the kernel
> config. The measurements that I did 2 years ago indicated that the cmpxchg
> use with Ampere processors did not cause a regression.
> 
> Note that distro kernels often do not enable PREEMPT_FULL and therefore
> preempt_disable/enable overhead is not incurred in production systems.
> 
> PREEMPT_VOLUNTARY does not use preemption for this_cpu ops.

Note that with commit 7dadeaa6e851 ("sched: Further restrict the preemption
modes") at least PREEMPT_LAZY is enforced, which comes together with
PREEMPT_BUILD and full preempt_disable()/preempt_enable() overhead for
this_cpu_* ops for every "up-to-date" architecture (except x86).

PREEMPT_NONE and PREEMPT_VOLUNTARY are gone for those architectures.

