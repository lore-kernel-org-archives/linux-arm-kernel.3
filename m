Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE23FF8850
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 22:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PUYKvxWyxCnfYDINczo2CrN5MRwpmVokR6BqgvWo4U=; b=poHjL8rIDKaNpWPhzr3FI8sMP+
	/Xny/k9TG60SDXsVJBMhivBRE2CxvtiKRCxWXYv6PTo/H76U0HCjsPv4lL2WCQ5v8Qp05KhhHmTFs
	dsMuAuQsgdDv2myuR3QXl70c5SV1f9WSD60DCrtc5xPwBSypOFwCzXOL/OFZG+8nvFuvV+BS3t+/G
	UZ1Js758lSDf00gfWKlQwSsnYbfAfMlKYTmtmFEUH8c2ddGqfvoJfpySkLD3bFkp7QFJDKQVX7gRk
	QjPvsj4unxrT+NprjFwnk1zx67d9VfstUgbZLAZINzU+YeiiRt8WLXHQBgQyV18nojfr6/9uzYD8a
	KOuMA15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPLO-0000000DrCU-1S27;
	Fri, 24 Apr 2026 22:49:54 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGPLL-0000000DrBz-3XHS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 22:49:52 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OCVYqr3229166;
	Fri, 24 Apr 2026 22:49:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6PUYKv
	xWyxCnfYDINczo2CrN5MRwpmVokR6BqgvWo4U=; b=aM/yAGMY/mr/wYGlA1BBmX
	99VKzLzUY/1gDb4tKmjig41b1TxovwHORu8ruubOh7NRipSU9oW47rSCPkcvZnNc
	ZdhTY74lWmXda9o//M8BoUzlMryjSik4nCa/xaS6/nYspVufdybKIk7uyCTx9ero
	qlZtQ0thjovAbosjOH9Gn6LUPHfvQo7fVXJxxZKRQVnrpp0Ly2tEjsAT1eNdWk7T
	ugfCiZqXehgK4ec2xVXecJ/+FgG3mE+IfPt8PBisHy6IBIusEyNaKZd4AymkCTk4
	Bd4LAF38DhYBxyqaV/2swDoDa1AVXvlzGau9hBHoxXjNSeK7b+ERKA6IZjZ7MujA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4dpeu2g67u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 22:49:30 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 63OMZQ3J007657;
	Fri, 24 Apr 2026 22:49:29 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4dpjkycsjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 22:49:29 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 63OMnSw514221924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Apr 2026 22:49:29 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9ED05804B;
	Fri, 24 Apr 2026 22:49:28 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E3C958055;
	Fri, 24 Apr 2026 22:49:26 +0000 (GMT)
Received: from li-43857255-d5e6-4659-90f1-fc5cee4750ad.ibm.com (unknown [9.61.11.225])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Apr 2026 22:49:26 +0000 (GMT)
Message-ID: <1e51c2fd090e5ceb07b1d09e50650c70fd3ccdb1.camel@linux.ibm.com>
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
In-Reply-To: <CAHC9VhS4JmPmCJrYTdbjxb3TO-uK6cB3Zij-ef=wswGce2BGzg@mail.gmail.com>
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
	 <1f78fc75b2e95239973612a4b6c4cc782960b7ac.camel@linux.ibm.com>
	 <CAHC9VhS4JmPmCJrYTdbjxb3TO-uK6cB3Zij-ef=wswGce2BGzg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Apr 2026 18:49:26 -0400
MIME-Version: 1.0
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: BYlQdtA16k2P2wxouf2QQi1JdFQQ9yXD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDIyMyBTYWx0ZWRfX7eYu4KC3WB1B
 0hB1lGPQNXcKBmLBuOSTV3ZuRr2TsMu7mCbGAcNFMqDoxx8oxVqHidKExzu6cHl6nd6bp5GENpz
 I0Lw25kfh0R7utjrGY+hqBSmHYNQ5cDdqq2nBAdn6J00YiX7s/7+G7P4OSRpgnH9DZgDz82dIm1
 wNn0CUuNjJa2FRloE/Fda3n8Dl3uw64tbGL1srmySw4dqDy6qdB+iS5aAdjzuIF6L06B0BVfgW1
 i+AdhlzmWIDbuoQAISRzc9o7HFUH0mjaLU8g9742exGmB+kcWONSwLPoU5NDYr2ZAk+OIvlp3/b
 d6L84fnwd4pJlr/cSaFncvmDLH1zdswZpanjdCGyKWh7Q1a9TSUClDYBiPnbuWv9P8f8t01gayT
 RGicxhByMp3hDWpRA3Hdd2E/tIaOvAQMajthdtjU+8aBJU9iud00sawpRzNaOyN5jWkKW0IZ6X7
 RwbYe2agyOfDI07c1ZA==
X-Authority-Analysis: v=2.4 cv=C8LZDwP+ c=1 sm=1 tr=0 ts=69ebf37b cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=8uTKPb2Waj3ysghmV9oA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: s-z82vbUyaezwgG1JHnrH41iYtTrJYkv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_154951_920686_FA759205 
X-CRM114-Status: GOOD (  10.50  )
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

On Fri, 2026-04-24 at 18:10 -0400, Paul Moore wrote:
> (I'm assuming you meant initcall and not syscall above, but if you're
> talking about something else, please let me know.)
>=20
> Saying that you aren't comfortable moving IMA initialization to
> late-sync is inconsistent with allowing IMA initialization to be
> deferred to late-sync.  Either it is okay to initialize IMA in
> late-sync or it isn't.  You must pick one.

Yes, we're discussing late_initcall and late_initcall_sync.

I prefer to look at it as being pragmatic. I'd rather err on the side of ca=
ution
and not move the syscall to late_initcall_sync, than move it.  However, oth=
ers
have moved the syscall to address the TPM-bypass issue for their environmen=
t.

Mimi

