Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556DBD4A5EE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 03:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fW9DCoyeRwgZraySQWN8vHpYbvVPEVqIauwbJyIM5A0=; b=a5zuas62IJO3N9czFTrYdCsPhb
	4LpFiLxNdHp3a5HlZvvdanRj1MvNwIxGMIksQXaFJPVcyEsLBiQDzisWi+uYLe28rW9AeH4Y80Qw8
	ivI9Kj/+V/2FpDDJ/yKeNLySey9dl+FD91o8ICGhWLBQ1F9AgyIoE3bKmnJqeJe7EYQAXe+41bOiz
	MhAAUzGmo3dAOcUY6YQxr6eVspHlLIJFBHqQ8iA7Lro889BPcOgQ8tcv+2b9lKcDevhJSBF6mvvEt
	iAPnGbicWZyOjk6EZnJjqrcNKGcZWnEvOjMZgtZCk32JuHCHkPWP30EHAe09uH6IXOgsHMAw4ABTc
	Fr82ZtLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaHk-0000000DVvL-1CTf;
	Fri, 16 Jan 2026 03:14:04 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgaHh-0000000DVuv-3VPU;
	Fri, 16 Jan 2026 03:14:03 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FNIHeB029136;
	Fri, 16 Jan 2026 03:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fW9DCo
	yeRwgZraySQWN8vHpYbvVPEVqIauwbJyIM5A0=; b=NYygGJ9J3OYSrN2x4e9z6X
	NYJJ7RxBn3MNL1AVw7mshGtX9hPULZCWlATJxyuqbZdUQNguUfdOxrarn4j5Ydg1
	AGxQ+d5Zgz6XZzKjE2TXf58qyp1fSESB+YjMrh9aoxPdurBGbMmC22goMcZuNX/z
	f9zzUdAKK6dBmJVMrUhMz+afmJX2H72x6505h4wAImixn8Ym3Uw54J2ocq8sNd24
	Tnbr6UBUIEDOOI/BkljqDwrEkqyz7B/CNXwLzBbk12VTJjv2QrIFNMGmWZWDEcyy
	x/HlZF3eMB4ZeJMeBQ6mXmns4eec10jUcxphWK90EAjjjDG36OrRJ2dqbKDWG3tQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9st8k9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 03:13:51 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60G3DoSk002919;
	Fri, 16 Jan 2026 03:13:51 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bq9st8k9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 03:13:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60FNYKXh014274;
	Fri, 16 Jan 2026 03:13:50 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm1fykxcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 03:13:50 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60G3DnoW25101006
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jan 2026 03:13:49 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2BE25805C;
	Fri, 16 Jan 2026 03:13:48 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A470458051;
	Fri, 16 Jan 2026 03:13:43 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.90.171.232])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jan 2026 03:13:43 +0000 (GMT)
Message-ID: <ba35672820c2fbad2611a0a89b3cb60125776f9b.camel@linux.ibm.com>
Subject: Re: [PATCH v18 00/12] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Pasha Tatashin	
 <pasha.tatashin@soleen.com>, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan	 <maddy@linux.ibm.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Rohan McLure	 <rmclure@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
        x86@kernel.org, Nicholas Miehlbradt
 <nicholas@linux.ibm.com>,
        Sweet Tea Dorminy <sweettea-kernel@dorminy.me>,
        Andrew Donnellan	 <andrew+kernel@donnellan.id.au>,
        Srish Srinivasan
 <ssrish@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Date: Fri, 16 Jan 2026 14:13:42 +1100
In-Reply-To: <20260115161857.ad9952cf1ebd1b37839aa652@linux-foundation.org>
References: <20251219-pgtable_check_v18rebase-v18-0-755bc151a50b@linux.ibm.com>
		<CA+CK2bBjoQmheEstv1MacGev_srdx=m5v=hwxdyfAKogbpG3FA@mail.gmail.com>
		<bf0def77b07a34c00928cedb46030ea17be4fceb.camel@linux.ibm.com>
		<b6c39059-faed-41a8-80b2-addaa229c143@kernel.org>
		<cc97397d3c75d796ee71081cc842c867a62ce39a.camel@linux.ibm.com>
	 <20260115161857.ad9952cf1ebd1b37839aa652@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=6969acef cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=Y5EJBO6SgJiHs8anXDIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 55htG9PDokbxJx8uQ6srL93nebqrpK1p
X-Proofpoint-GUID: YOi29F4SNz54m1WROzu-sRkP6zlVhnnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAyMiBTYWx0ZWRfX+AFfHh/cyIIs
 bJQv6kvsfmeTtynUjb6q5acSz5NV99GlwAWc2Cdw+aIY773Sk1Jx0AU8AGPqrkiFsh5DIgsWZab
 l4KzZtSHmo4HZ6zzXOr8C5VRJI8wJtmrLRHxvQhtRdWyhdOlJTWYsr11jTchKxv8aEGc7AQSEH4
 PewoYzY2OxNY+PBDkh/xfq7ECz3wsnqg4Ot0ixK+uM67WU1GFayhSS1Xv2R94C2p1Aleg6ympam
 PBuyjS4HCHvSNa/blb2ORlmIncCBmSTSBjvXh3yuRJ8/x9kPI30vigZ97XQ+5gUduWdvjeZOz64
 5yUKs1skk9SpC5UfQMTteYAjlJmk9mR3kPFfFR76igDW6b1BTU7Z4deWPfgEJ2SzlNbgWL6xkdN
 1KEbXNv7crX3PHM3ZLXRK+2ftCyNFptvnp/hpTMzaDxvNeGOnIODTok8V2WUhnRn2GL6xdQHsCl
 /G87cYrP3vwn/veSdtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601160022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_191402_024530_7D3BB614 
X-CRM114-Status: GOOD (  20.81  )
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

On Thu, 2026-01-15 at 16:18 -0800, Andrew Morton wrote:
> On Thu, 15 Jan 2026 17:13:26 +1100 Andrew Donnellan <ajd@linux.ibm.com> w=
rote:
>=20
> > On Wed, 2026-01-14 at 10:34 +0100, Christophe Leroy (CS GROUP) wrote:
> > > What is the merge plan ? I see all powerpc commits are acked by Maddy=
,=20
> > > will the series be merged by Andrew into the mm tree ?
> >=20
> > This is what I was expecting - this revision is rebased on mm-new as it
> > stood
> > around when I sent it.
>=20
> Ouch, sorry, I did not understand this.=C2=A0 So we've lost 4 weeks testi=
ng :(
>=20
> The core MM and ARM changes are trival, in the if-it-compiles-it-works
> category.=C2=A0 Is the mm tree really the best place for this?=C2=A0 It'l=
l get
> more testing in the powerpc tree?
>=20
> But if you're OK with it, I'm OK with it.
>=20
> > By the way it doesn't apply on top of powerpc/merge branch:
>=20
> I guess we'll be hearing from Mark when this hits linux-next.=20
> Hopefully the resolution isn't horrible.
>=20
> As I'm adding this to mm.git's mm-new branch, Mark won't actually be
> seeing it.=C2=A0 I'll aim to move this into mm-unstable (and hence
> linux-next) after just a single day.

Thanks, sorry for the confusion! *Hopefully* 18th time's the charm...


--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

