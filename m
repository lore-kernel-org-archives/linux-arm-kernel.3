Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E93DCD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dftxqjao0p8SRJgT3ZplRc/PI5myzyLa0OHFKaOuM0o=; b=BeIYCPX9TM+UekjBNhQVfVwqD/
	iBVw79oSgpG4q5Cfg+cdvT1KG358ehU3aeDJbAyf09kRW9htScKXpvV1UbHj7XEG0bOaoO811i2Oj
	wozelNj7vwTOwAPgC4SgigxgFu8rn35/35+vBtCjm4bK8Q1EOlSb4BIejBDwY9vkPd1inGzhvGLfs
	Tn186poKCH8OZ7ljq794eTmunIsbRMpvHROLzaftcG3DTyVeBhoug4XYF5PHR+9jm7Fomr6C1+3Cw
	CER0bOnjojLcDOEWcrfnfTqw7c8wlaJruhq85OzVnw4Y4lIk5ggYoU40rPsWe2nB1ekHwk/lQvuuF
	snetmDLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJW9Z-0000000AzDl-002R;
	Sun, 03 May 2026 12:42:33 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJW9V-0000000AzDK-37I6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 12:42:31 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6438ZrcX1117863;
	Sun, 3 May 2026 12:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Dftxqj
	ao0p8SRJgT3ZplRc/PI5myzyLa0OHFKaOuM0o=; b=OnzJmAMpdnD5vxU2L5z+8Y
	naqag3d04STv3gBKyR+Cngb0cgNzmfEyUgRqnuVUBdSESsU8YG1ZoTykBW6sKF0b
	Xen9HHn6NTFrYZ/RdaZYfYVQ0sLCwy+kcRYphvqudYpVHWZNrpZ+mHgDqUhJOadb
	N+cm0f+e0h92BXzMhqbcnTYnwViqR4fStMMUPCGae4ERGYW9pwI9ZGXa9uy+NlXs
	DTPaOodaxlBWiE+7g4no1lmqZkyUlxPRrw8dymplxffBlFevsX4F/XbOXhIdpsnV
	JN1wwXwKIF+qntua8CBbjoifLSAI5Hh19pBPPYmKOcKLgifkU6uj2ckTCek1o3dQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dw9x4bp1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 May 2026 12:42:06 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 643CdL8E007216;
	Sun, 3 May 2026 12:42:05 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4dwwtg19yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 May 2026 12:42:05 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 643Cg5lq27329238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 3 May 2026 12:42:05 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D4185805A;
	Sun,  3 May 2026 12:42:05 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BBDE458056;
	Sun,  3 May 2026 12:42:03 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.175.251])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  3 May 2026 12:42:03 +0000 (GMT)
Message-ID: <201b9172ac47c6766443c1f2343cab3548f33c29.camel@linux.ibm.com>
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
From: Mimi Zohar <zohar@linux.ibm.com>
To: David Safford <david.safford@gmail.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan McDowell
 <noodles@earth.li>,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, paul@paul-moore.com, jmorris@namei.org,
        serge@hallyn.com, roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
        eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca,
        sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
        joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
        catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
        sebastianene@google.com
In-Reply-To: <202f90682fe47bb5fb9b08f8678ae00981b5290b.camel@linux.ibm.com>
References: <cover.1777036497.git.noodles@meta.com>
		 <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
		 <afMlgstqahnZg68h@e129823.arm.com>
		 <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
		 <CAGWfHUW+AX0Hpuw5Vr5iTSaJKQJ+O_4nWWmU1UR8Z_3XFctHZg@mail.gmail.com>
	 <202f90682fe47bb5fb9b08f8678ae00981b5290b.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sun, 03 May 2026 08:42:03 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAzMDE0MCBTYWx0ZWRfX4ejQNZ4HY+QH
 eWm2cTFJFTDk8BbJEmUK3VGbdxRkNtorI4hZtlTvquWKmoaNKx0m4UA/8s9hGeXpj6fNygtbb0y
 pmMVRI9C0QhSkEJbLSWi6Z9kqAExOUwYNvNKwi39Wy3FvDYE2WSq4f9+dsws1z+i/PEnNOjbA7E
 GXht8B6YEKgfei3pNUmzJuKPcoKg6dASyZuGvc1Nj/ORH986AJykfJjJHYBpSXrit9sKz5vuOLC
 pi0HWYAMPPmODM98P1T0v6NUyrB6f+hSdXg8wKBjCR/fbuXhLmCO3Ephj6qqEttxm+RLKX+42Dd
 JRNoORGRAab5xMLDehh3hFVVHY3JuFE7+ujAEuQJtbw/wjBVlyluK0hTNY+egCNfqkUD4ZOO5V4
 raAKPrX2iTVChPVeyWK8g3C8oWxj7CY5rqp4htmkvrxMH0HRl5k1TH3ktqfP8RSXDn3adQrOcG7
 pDr6frGytUv5u//ZZ1g==
X-Proofpoint-ORIG-GUID: VS_ogRrxYNEL1bVE6dmcFUl4ACX0l2TQ
X-Proofpoint-GUID: VXsGapUQwiBgE_Z2EHwAYps9SSnaHTYE
X-Authority-Analysis: v=2.4 cv=W7UIkxWk c=1 sm=1 tr=0 ts=69f7429f cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8
 a=7CQSdrXTAAAA:8 a=VnNF1IyMAAAA:8 a=I3il15lo3WIE8je3RjQA:9 a=QEXdDO2ut3YA:10
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-03_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605030140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_054230_313785_F04D06E7 
X-CRM114-Status: GOOD (  22.90  )
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

On Sun, 2026-05-03 at 07:36 -0400, Mimi Zohar wrote:
> On Fri, 2026-05-01 at 12:52 -0400, David Safford wrote:
> > On Thu, Apr 30, 2026 at 5:43=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com=
> wrote:
> > >=20
> > > On Thu, 2026-04-30 at 10:48 +0100, Yeoreum Yun wrote:
> > > > With above change I confirmed there is no meaurement log
> > > > between boot_aggregate and boot_aggregate_late except "kernel_versi=
on"
> > > > But this is ignorable since this UTS measurement is done in
> > > > "ima_init_core() (old: ima_init())" and it is part of ima initialis=
ation.
> > > >=20
> > > > 1. ima_policy=3Dtcb
> > > >=20
> > > >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> > > >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:0000000=
000000000000000000000000000000000000000000000000000000000 boot_aggregate
> > > >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:0000000=
000000000000000000000000000000000000000000000000000000000 boot_aggregate_la=
te
> > > >   10 7c23cc970eceec906f7a41bc2fbde770d7092209 ima-ng sha256:72ade6a=
e3d35cfe5ede7a77b1c0ed1d1782a899445fdcb219c0e994a084a70d5 /bin/busybox
> > snip
> > > >=20
> > > > 2. ima_policy=3Dcritical_data
> > > >=20
> > > >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> > > >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:0000000=
000000000000000000000000000000000000000000000000000000000 boot_aggregate
> > > >   10 49ab61dd97ea2f759edcb6c6a3387ac67f0aa576 ima-buf sha256:0c907a=
ab3261194f16b0c2a422a82f145bc9b9ecb8fdb633fa43e3e5379f0af2 kernel_version 3=
72e312e302d7263312b // Ignorable since it's generated by ima_init(_core)().
> > > >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:0000000=
000000000000000000000000000000000000000000000000000000000 boot_aggregate_la=
te
> > > >=20
> > > > Therefore, init_ima() could move into late_initcall_sync like v1 di=
d:
> > > >   - https://lore.kernel.org/all/20260417175759.3191279-2-yeoreum.yu=
n@arm.com/
> > >=20
> > > Thanks, Yeoreum.  It's a bit premature to claim it's "safe" to move t=
he
> > > initcall.  Hopefully others will respond.
> > >=20
> > > Mimi
> >=20
> > I have also run with this patch on a number of bare metal and virtual m=
achines,
> > running everything from default Fedora 44 to a version with everything =
turned on
> > (uefi secure boot, UKI with sdboot stub measurements, IMA measurement
> > and appraisal enabled,
> > all systemd measurements on, and systemd using the TPM for root
> > partition decryption.)
> > I too see only the kernel_version event between the normal and late
> > calls, if ima_policy=3Dcritical_data.
>=20
> Thanks, Dave!  Were all the systems you tested x86_64?  The next step wou=
ld be
> to test on different arch's (e.g. Z, Power).

On both Z and PowerVM, there are ~30 measurements between boot_aggregate an=
d
boot_aggregate_late.  For example, on PowerVM:

# grep -n boot_aggregate
/sys/kernel/security/integrity/ima/ascii_runtime_measurements

1:10 f60a05d7354fb34aabc02965216abd3428ea52bb ima-sig
sha256:9887dd089ee19a6517bca10580b02c1bb9aa6cd86c157b6ead8a1c0403f348d5
boot_aggregate=20
31:10 e2592b0d61da6300d3db447b143897a9792231ea ima-sig
sha256:9887dd089ee19a6517bca10580b02c1bb9aa6cd86c157b6ead8a1c0403f348d5
boot_aggregate_late

It would be interesting to the results from a Raspberry Pi 5 as well,
with/without a TPM.

Mimi

