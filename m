Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8313AFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 22:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/VeEbe6DU9EDaeOEd9QBSfYV+zT0jvWbCTP3aJe1yKE=; b=P9P4yqJBJjkycOVk1UJj/XtxzZ
	/whKVm/hALAmJwBc8yV0WY1SaAZoK7xKXiMvRDOM59nUsMPqzZVZfSAQF6O2v7zorVgya+ZxhI+Dr
	05YzD3zXTO5rVKi8uiemibIkCh0gx37pjmH5XYY/d7nH6J1nO6coPbDkgeIPppHO7AWq3HRAWJHe2
	m/kmKaPgoU4OJ/aJSSHf+4DljTjGyJ/OIUikQaFgk4VWxf8rd3dpGEpY0lWb0uQUbWBCRhb+aJMIX
	7xGFdaWxLV0G2njMauU5SBHJ/ryU+2hpHNgaoNZXZSWD74xEiiIhkgv7HAvDlWUwDR3FnUIBM2NFt
	LvoWo6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGOaT-0000000DmqO-0frX;
	Fri, 24 Apr 2026 22:01:25 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGOaP-0000000Dmps-3WDF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 22:01:23 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8qpG93229123;
	Fri, 24 Apr 2026 22:00:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=/VeEbe
	6DU9EDaeOEd9QBSfYV+zT0jvWbCTP3aJe1yKE=; b=QGjxfpnAwLVQzpjoI81dEk
	DKZnAqvPigy/SDQE4wIWEvMP77oumyMjThcCx4TWL+q0htAz6j37C0tyIAyhcXnO
	DN+n+9pUp1iZ0dKYmJTWHVDqt8HBRAdLttdQD2nSWnpuLO0wt1Pd0T1TqZrHNkSM
	wA/O7IsY6TZL03csz6gD/aDJsB1oAmOaF+hnPwzKZfdpTLeGkVI/r10f63s7q1Tg
	vIiAGaAnvhBcQlsN/pmfQWaHnRQ+TM6qVXCthSQ+PebRfkVpgjq77NK9mYh9kV9m
	GxRGoC4/irxpWMSB9dqFb1p8gRN3+/wbwFPkYErfpeMko5CFGE0JVF4qjDdFL9eQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu2g2cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 22:00:55 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63OLZX1k009187;
	Fri, 24 Apr 2026 22:00:54 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dpjkympd8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 22:00:54 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63OM0rLD22086206
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Apr 2026 22:00:53 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C2F7D5805E;
	Fri, 24 Apr 2026 22:00:53 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 449935805A;
	Fri, 24 Apr 2026 22:00:52 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.11.225])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Apr 2026 22:00:52 +0000 (GMT)
Message-ID: <1f78fc75b2e95239973612a4b6c4cc782960b7ac.camel@linux.ibm.com>
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
From: Mimi Zohar <zohar@linux.ibm.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, roberto.sassu@huawei.com,
        Jonathan
 McDowell <noodles@earth.li>,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, jmorris@namei.org, serge@hallyn.com,
        dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, jarkko@kernel.org,
        jgg@ziepe.ca, sudeep.holla@kernel.org, maz@kernel.org,
        oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
        yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
        noodles@meta.com, sebastianene@google.com
In-Reply-To: <CAHC9VhTW3=RJ8L91RWXYYA9tFjfSXGN-DMEEwdiD6big9H57Ew@mail.gmail.com>
References: <aeoAlVEwzRUPrlVe@e129823.arm.com>
	 <aeoRxWPyOHGJd+Jh@e129823.arm.com> <aeoWO2Cwo04YYu2l@earth.li>
	 <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
	 <aeokwrC86WI7uT+K@e129823.arm.com> <aeomlp3I0eVE5mce@earth.li>
	 <aeotq8nPVu4wvEx5@e129823.arm.com>
	 <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
	 <aephL3MzYoqFGaT5@e129823.arm.com>
	 <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
	 <aesGU8a3mbVzvteH@e129823.arm.com>
	 <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
	 <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
	 <CAHC9VhTW3=RJ8L91RWXYYA9tFjfSXGN-DMEEwdiD6big9H57Ew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2026 18:00:51 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 08a3zqsRr1TMWB_kxIX37e8jVtHQCyhk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDIxMyBTYWx0ZWRfX94ZzxexigsRt
 /MqC0HwLCZhFPPoOFs/sFJu4fWLQK/bbqsX3X/elzM84m1rddLoiL6y+U7WX0CUHPQS68ZhrxGp
 Kub2DtZUwpCbwQ57JOTi0dSbhNph6cEtjH0hJJpJ5BMFCJ8M0pSx40MSKg6pp3FJiZwcDLVFFpa
 BwoxQLC5zjGVH3LxvrlD4Gs3VUEIBPZIdZ8uVfPC0NsccURIkqrtDxT4clHqXerKPaNayEg11BM
 7omDfxs4eOL4EZpdQbeTmOVYYYVKdaW+ScUeHm/ZsXzu9/7lSA7YqnI2hjYTwn7tNhgzTpB2Ppy
 GAbArSydIzXiL3Tah/JszCflYxhriBbwKYUIuHGUB8fvYaSRaqof8apbqVEZI8NtWCB2sITfh9i
 Q8TPqBOM1lKUlZV6vP+rl4N9iXfPCI/wvTRlNkR0uP+Oie50yCvBLrbByIB5tNacZWNAsV3+w0r
 /jPgi/lfGP3Ou4uw23Q==
X-Authority-Analysis: v=2.4 cv=C8LZDwP+ c=1 sm=1 tr=0 ts=69ebe818 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=7CQSdrXTAAAA:8 a=fTyYJJLUYUqdCkCT9FIA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 8fo94eVDZXUY528rLTWuWQJRihjjwB28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_150121_909275_D40C246A 
X-CRM114-Status: GOOD (  46.39  )
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

On Fri, 2026-04-24 at 17:08 -0400, Paul Moore wrote:
> On Fri, Apr 24, 2026 at 4:58=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> =
wrote:
> > On Fri, 2026-04-24 at 16:15 -0400, Paul Moore wrote:
> > > On Fri, Apr 24, 2026 at 1:57=E2=80=AFAM Yeoreum Yun <yeoreum.yun@arm.=
com> wrote:
> > > > > On Thu, Apr 23, 2026 at 2:13=E2=80=AFPM Yeoreum Yun <yeoreum.yun@=
arm.com> wrote:
> > > > > >=20
> > > > > > Sounds good. Once the patch is posted, I=E2=80=99ll review it a=
s well.
> > > > > > Sorry again for the noise, and thanks for your patience ;)
> > > > >=20
> > > > > My apologies for not getting a chance to look at this patchset so=
oner.
> > > > >=20
> > > > > This seems like an obvious, perhaps even stupid, question, but I =
have
> > > > > to ask: if IMA can be properly initialized via late_initcall_sync=
(),
> > > > > why not simply do the initialization in late_initcall_sync() and =
drop
> > > > > the late_initcall() initialization?
> > > > >=20
> > > > > Does any IMA functionality suffer if initialization waits until
> > > > > late_initcall_sync()?  If so, it seems non-critical if waiting un=
til
> > > > > _sync() is acceptable, as it appears in these patches/comments.
> > > >=20
> > > > This is the way first patch did, and here is some discussion for th=
is
> > > > (Might you have seen, but in case of you missed):
> > > >   - https://lore.kernel.org/all/a6a0e15286c983d720de227c6827adbe976=
c5b9b.camel@linux.ibm.com/
> > >=20
> > > Thanks for the pointer.
> > >=20
> > > Unfortunately, my concern remains the same: it's either "safe" to
> > > initialize IMA at late_initcall_sync() or it isn't.  Attempting to
> > > initialize IMA twice seems both odd and wrong.
> >=20
> > Agreed.  However, IMA should be initialized as soon as the TPM becomes
> > available, not delayed.
> >=20
> > In patch 2/4 patch description, Jonathan describes the reasoning:
> >=20
> > Unfortunately some TPM drivers (such as Arm FF-A, or SPI attached TPM
> > devices) are not reliably available during the initcall_late stage,
> > resulting in a log error:
> >=20
> >   ima: No TPM chip found, activating TPM-bypass!
> >=20
> > and no measurements into the TPM by IMA. We can avoid this by doing IMA
> > init in the initcall_late_sync stage, after the drivers have completed
> > their init + registration.
> >=20
> > Rather than do this everywhere, and needlessly delay the initialisation
> > of IMA when there is no need to do so, we continue to try to initialise
> > at the earlier stage, only deferring to the later point if the TPM is
> > not available yet.
>=20
> Once again, that heavily implies that it is safe to initialize IMA in lat=
e-sync.
>=20
> Put another way, what breaks if IMA's initialization is delayed to
> late-sync?  If the answer is nothing, just move the initialization to
> late-sync.  However, if something *is* broken and we are just doing
> this because of TPM delays at boot, this patchset just creates
> additional problems and we need a different solution.  I can't
> envision a scenario where it makes sense to attempt initialization
> twice.
>=20
> > > I understand the need to ensure that the TPM is available, but if it
> > > isn't safe to wait to initialize IMA at late_initcall_sync() then it
> > > would seem like this is a bad option and we need another mechanism to
> > > synchronize IMA with TPM devices.  If it is safe to initalize IMA in
> > > late_initcall_sync(), just do that and be done with it.
> >=20
> > Within the same initcall level there is no way of ordering the initiali=
zation.
> > Yeorum attempted to address the ordering issue in commit 0e0546eabcd6
> > ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_init=
call"),
> > which is being reverted in this patch set.
> >=20
> > Ordering within an initcall level needs to be fixed, but for now retryi=
ng at
> > late_initcall_sync works for some, hopefully most, cases.
>=20
> That's not a good answer.  Ignoring the TPM issue for a moment, can
> you confirm that moving IMA's initialization to late-sync is safe?  If
> not, why is this approach being considered?

I'm not seeing any measurements between late_initcall and late_initcall_syn=
c.=20
Based on this very limited testing, I don't feel comfortable to actually mo=
ve
the syscall, but can see adding support to allow IMA initialization to be
deferred.

Mimi

