Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B6CCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 02:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQxzSDyf9Fj6A4ZENc/ca8mockOKJ3GHbUZjTEAcPwI=; b=EalsCchuN65iJkGx1BPuMzUyml
	GTSEGU5bdkbVDJZ5x1NH0XzW/h6ikMfwM/y22Y+lgP1WgUkkHsSWB9FCiNH6oQ4RSkPYmTxBc/AtK
	QQDpTaKQ6q7EVXECsdTxlIlD9zJP/2zI03d2umiIPE0SZzblTLaYSGubk7lXc/iUM0wLz6RLheWFh
	eCZPmmzsH/MhvZaboXElI6oLj8hlthNNLSqFLsa3Q4ocsaP6S5RiPI00W92d20TTzsZQldZXBF62P
	1lY9u/FI7bLOhCAaDcV5eX8AuLEZt7q/3SVST9bIBSMGaw8uQQ9jlt0S0u1tjeL5N5fqAQQISzwJm
	JS45f8PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoRZ-00000002WM4-3c0g;
	Thu, 07 May 2026 02:26:29 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKoRY-00000002WLV-22TF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 02:26:28 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646Ik7vu1531488;
	Thu, 7 May 2026 02:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=rQxzSD
	yf9Fj6A4ZENc/ca8mockOKJ3GHbUZjTEAcPwI=; b=gqtbc8f76VQMLM9MVEKnSx
	WBsPN5ldYdwr0g2+kLf/VnsVRBPWafnJfzQJX4mHG3A8FgvHM3Jls4qjXE+dCmmo
	DLfKhjOiylnGG3P3+GCsogdbq9MwF1MDbkNEuX93Ah+x518L3MzlpGIHkJKzQ3P1
	Kuzq36sF8gprkrO3V0Y3b07XgL49P91hFb13fmBpoWXh/PefMYVLtP2blKSBWx+u
	eRTyJNfosWoy7dAAXrLbkytyb5lO2WyQS9bUgy075Hv+bJcNcfu8y91bvW5g94Hg
	esmbCdTpsAtWO7mGL3o+RfOmR7O3PM/bfFdE0OahwxlNmC8tmwonwokM3idbC3uw
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9x4ursj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 02:25:58 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 6472OfTX013583;
	Thu, 7 May 2026 02:25:57 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dwukqha2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 02:25:57 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6472PuqM53871096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 May 2026 02:25:56 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCE365805C;
	Thu,  7 May 2026 02:25:56 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8287E5805A;
	Thu,  7 May 2026 02:25:54 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.185.101])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 May 2026 02:25:54 +0000 (GMT)
Message-ID: <461ec995935e2b42a8414f6f87063ff2557bbfb4.camel@linux.ibm.com>
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
From: Mimi Zohar <zohar@linux.ibm.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan McDowell
 <noodles@earth.li>,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, jmorris@namei.org, serge@hallyn.com,
        roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
        eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca,
        sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
        joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
        catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
        sebastianene@google.com
In-Reply-To: <19dfb0e2730.2843.85c95baa4474aabc7814e68940a78392@paul-moore.com>
References: <cover.1777036497.git.noodles@meta.com>
	 <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
	 <afMlgstqahnZg68h@e129823.arm.com>
	 <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
	 <CAHC9VhRsnmPp2KmQAns5uq5qXX5EF2xQQzyfTgrPi4O9AXyPpg@mail.gmail.com>
	 <ba4bf28314b679474a6a8da6298e548e54b3754c.camel@linux.ibm.com>
	 <CAHC9VhRE2kRr1fdDf6xgQgpSrtvqtP8Vy9LVGJhDZFUbzLKGmQ@mail.gmail.com>
	 <ff28c6dcb60c357c752724927addaa8c4fd3bf2c.camel@linux.ibm.com>
	 <CAHC9VhQY2TMkTvQq9P8oZteQWQSr7qq2utOuH+pdVx+8jWLBCw@mail.gmail.com>
	 <a9412fe10e70ce95dd70556ace19368bec5c188c.camel@linux.ibm.com>
	 <CAHC9VhRUgNA=Sj=jhD=zOt8R80Q+FQj+H0nYSy-FAujTL3EKPA@mail.gmail.com>
	 <5debff82dc758d9c91223e4f1f5b9e39a3fcd4f5.camel@linux.ibm.com>
	 <19dfb0e2730.2843.85c95baa4474aabc7814e68940a78392@paul-moore.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 May 2026 22:25:54 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAxOSBTYWx0ZWRfXznX1S+sn/9ll
 +ZDtGoPGjMHt1C52ETaGJiR87dSppgUqbTeQ5kM8saz3fOvWSKFElBgefGfZN0uth+5dO9QObYr
 wWJcR+RvLTnH2bvFzY7fyHruQhhkgijL1w9gI7fdYWzlwf90hd4vo7ta835xG/B7r+gAOUrbLzk
 Im0kk5Vh0+gYv6BuCkouHaTV4DJnzzmWeGlcOlGAg4lThkM0IYZu1a6fcs/sq1zcIvVEQz2wgeX
 yMXwi+OT1rJklihGuP8Dz3IOUv7287TYbQ32hted2YyHkX4hHoWacBjQ4Ca5zs/7IoJ73EBGQx6
 HoJwfgR1JGH814cKRrDqlwngwhNag3+UkePRvjwYBqiIeVpyy1lhiqnU18j1toLN+b6TmFsqkCW
 FaOwmSJdU7/xsP2oufP2abA3YWld2PD/laBOW8mDgPOGtasjCYhH2ZqOHl1NSylQCQKORF9fFRZ
 i0va2bRZhRNtJAcWHSA==
X-Proofpoint-ORIG-GUID: IVuvrxwTYJaZAGiHieI9ElLz5NfcZcOI
X-Proofpoint-GUID: dFBLB4dzcWwnvHt3QZOfaoUD7XzIN8YQ
X-Authority-Analysis: v=2.4 cv=W7UIkxWk c=1 sm=1 tr=0 ts=69fbf837 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VnNF1IyMAAAA:8
 a=Hs2b41jZhdh1vBShbzsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_192628_540030_0FD807CB 
X-CRM114-Status: GOOD (  30.31  )
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

On Tue, 2026-05-05 at 22:11 -0400, Paul Moore wrote:
> On May 5, 2026 9:57:23 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
> > On Tue, 2026-05-05 at 18:55 -0400, Paul Moore wrote:
> > > On Tue, May 5, 2026 at 5:05=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.co=
m> wrote:
> > > > On Mon, 2026-05-04 at 16:51 -0400, Paul Moore wrote:
> > > > > On Mon, May 4, 2026 at 8:03=E2=80=AFAM Mimi Zohar <zohar@linux.ib=
m.com> wrote:
> > > > > > On Sun, 2026-05-03 at 12:46 -0400, Paul Moore wrote:
> > > > > > > Regardless, assuming you always want IMA to leverage a TPMs w=
hen they
> > > > > > > exist, your reply suggests that using an initcall based IMA i=
nit
> > > > > > > scheme, even a late-sync initcall, may not be sufficient beca=
use
> > > > > > > deferred TPM initialization could happen later, yes?
> > > > > >=20
> > > > > > Well yeah.  The TPM could be configured as a module, but that s=
cenario is=20
> > > > > > not of
> > > > > > interest.  That's way too late.  The case being addressed in th=
is patch set is
> > > > > > when the TPM driver tries to initialize at device_initcall, ret=
urns
> > > > > > EPROBE_DEFER, and is retried at deferred_probe_initcall (late_i=
nitcall).  Since
> > > > > > ordering within an initcall is not supported, this patch attemp=
ts to initialize
> > > > > > IMA at late_initcall and similarly retries, in this case, at=
=20
> > > > > > late_initcall_sync.
> > > > >=20
> > > > > Okay, so from a TPM initialization perspective you are satisfied =
with
> > > > > a late-sync IMA initialization, yes?
> > > >=20
> > > > No. On some architectures moving IMA initialization from the late_i=
nitcall to
> > > > late_initcall_sync does not miss any measurement records. However, =
as=20
> > > > previously
> > > > mentioned, Linux running in a PowerVM LPAR the move would drop ~30 =
measurement
> > > > records[1].  So no, only if the TPM is not initialized by late_init=
call, should
> > > > IMA retry at late_initcall_sync.
> > >=20
> > > What do you do in the PowerVM LPAR when the TPM is not avaiable at
> > > late initcall and you have to defer IMA initialization until
> > > late-sync?
> >=20
> > Your question is hypothetical ...
>=20
> <heavy eye roll>
>=20
> > ... as the TPM isn't deferred, so IMA doesn't go into
> > TPM-bypass mode.  Testing on a PowerVM LPAR demonstrated that it skips =
~30
> > measurement list records.  So moving the initcall to late_initcall_sync=
 would
> > cause a regression.
>=20
> Let me rephrase to make the question clear - how do you plan to handle a=
=20
> system where you lose measurements by waiting until late-sync, but the TP=
M=20
> is not available at the late initcall.

There have been suggestions to queue the IMA measurements, but that goes ag=
ainst
the "measure before use" principle. The solution is not to defer IMA
initialization for all systems, but to differentiate the boot_aggregate rec=
ord
(boot_aggregate vs. boot_aggregate_late) based on when the TPM becomes avai=
lable
relative to IMA's initcall.  IMA's job is simply to collect and provide the
measurement list.  Based on the attestation service policy, the attestation
service will decide whether a measurement list containing boot_aggregate_la=
te is
acceptable.

Mimi

