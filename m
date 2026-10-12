Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DB9CA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxHVu7GobJPZCWFXgNE6sdDlKYaMqd7ltRWpUKF/Se4=; b=uYW1JZj41Eh0JhHCE3oOQR/iVm
	VhVZt9ZGCmmnTrf3OVUxE9n1nL9Am9UcxPfJK94Sebf9wmWP2wamqpGU4Nb3/yQ/gTykELBDhkWVc
	o8+sUAffbV9wnmhjPRCkASYL51ryb/mbfN9110DftdciZFzCMJpSej8mY3YPhulaJAI9qH2WA2rdI
	iRP+kHX3e9uP0AA/HLitycL8PLYZk/H7/+dMq2Hqh8Q+ClVwevTdrrH5hWDeLkMW1nx5FAoQFxyCK
	3ehagOijGJ4VavGTmzInmhQBNHzxkNDvuUGwKvSphSOHWQv9Tjr9DR/ITJs1uEz/I0xdJHAnbQ2xe
	WxkGnvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB9n-00000009uUb-2a34;
	Mon, 12 Oct 2026 08:13:15 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGB9l-00000009uUB-1HiI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:13:14 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5EmS23321957;
	Mon, 12 Oct 2026 08:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZxHVu7
	GobJPZCWFXgNE6sdDlKYaMqd7ltRWpUKF/Se4=; b=cl5UqivrYvF4GUvBe0cMrs
	92o7XxCOEY1GZa9Q1LnU4RlQvXiHkkxdNoRHuk3PYKEIryxD5XIl7n77BHNrQjE/
	CT1t48l4st5fklimCyxWnc1f5c2FQ7UVb7Mq4L0YS3vT67x8Dnuqpr7YIWppBIX1
	VXIuvHKBeDr6KIyzK0+9ayVMPZO/egPYSiXjC4RgPFjE1GW5Y3llPztWuhTvXobf
	JK53kdyXxQi+9FUFvFJQ/6a0Igwrd4yEg+EI+owYQ1Bw6HvZU1fh2LRkejFvmg7t
	i3bcIQBosp7sc6mWrIsWfAjk1zLyk8Ve1fgarEgii2Pu3qpY24wwycY3ldBpkDpw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4h7dwhqk9y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 08:12:57 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 69C54w833726492;
	Mon, 12 Oct 2026 08:12:56 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4h81wfv4j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Oct 2026 08:12:56 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 69C8CsEQ12779888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Oct 2026 08:12:54 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8147220043;
	Mon, 12 Oct 2026 08:12:54 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3621020040;
	Mon, 12 Oct 2026 08:12:54 +0000 (GMT)
Received: from osiris (unknown [9.224.76.185])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 12 Oct 2026 08:12:54 +0000 (GMT)
Date: Mon, 12 Oct 2026 10:12:54 +0200
From: Steffen Eiden <seiden@linux.ibm.com>
To: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-efi@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        Linu Cherian <linu.cherian@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
        Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [RFC 03/12] KVM: arm64: Hide TLBID from guest sysregs
Message-ID: <20261012081254.483793-A-seiden@linux.ibm.com>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
 <20261001110655.461473-4-kristina.martsenko@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001110655.461473-4-kristina.martsenko@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfXwppdWWnupKZm
 R5YMszWuISLyqitb5l6P4CFHM1PSLZbI2vFgULl0Ezon7SDFxNi6TtsKy/2QF+EgiKDaanozKpV
 riftcLPbkcFymJV/YWaHqI6e6+8vxbM60twnDLkkevRDaR+xi9rhVwUxizMtS4XvYNNpDoKdTeB
 ZVF3lydm8vAwBBLOyL09b6gDa9sgidnka7ZchMinvuyuKKduJQd/InGs1zbj1fRjHKlfYA77b5J
 ezd2Eo5WUQO3n7uSSw10zHmhmG4PMqHW1vJo+UiqWDjAzRVjn9t+Dx/d9uOVdaOFTQkpeRZLUr9
 iFhaOLwmGpPNu711xbvelXxryzFOBe43mMrRJHJ8EAXirMGUWWpZ6Hmjw3qJ1sGBdxaC33yZDlV
 gtbT/LyTGpA7sZdEG8cD0Zsd2WmBUk70d2RbRMylEmUGcgQagN2pYpxi8wtfIQQmUtEjO1V/SSD
 Llpdp2aEjhwLkgpu9Wg==
X-Proofpoint-GUID: 8WRxpz4LaIopRuMISbZzH7WHNCyEDW2E
X-Proofpoint-ORIG-GUID: 8WRxpz4LaIopRuMISbZzH7WHNCyEDW2E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMCBTYWx0ZWRfXxbNOPlqJaejr
 VwcYq80OnPhGOgQVe5J3o4GitrvU6jbbx4zmHB3S1PzoX3pEh6kHjUEe2Dr6yCsnfEC3JA/w8LD
 wIRGEC2vLHyRR58cGJZJ5aTVymA06Zc=
X-Authority-Analysis: v=2.4 cv=btHZl0ai c=1 sm=1 tr=0 ts=6acc9689 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=9Dg5do3rMOcXWvYwyOwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_011313_463628_3462E37E 
X-CRM114-Status: GOOD (  17.78  )
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

On Thu, Oct 01, 2026 at 12:06:46PM +0100, Kristina Martšenko wrote:
> Don't expose FEAT_TLBID to guests. It wouldn't be useful in the general
> case since a guest doesn't know which domains exist and its vCPUs can be
> moved between any physical CPUs.
> 
> Try to hide TLBID sysregs and sysreg fields from the guest:
> 
>   * Report the feature as not supported in the ID register
>     ID_AA64MMFR4_EL1.TLBID.
> 
>   * Configure the TLBIDIDR_EL1 sysreg to UNDEF via the FGU mechanism.
>     Sanitize a nested hypervisor's HFGRTR2.nTLBIDIDR.
> 
>   * Sanitize a nested hypervisor's HCRX.{VTLBIDEn,VTLBIDOSEn,FNB}.
> 
>   * VTLBID{OS}<n>_EL2 registers are VNCR-backed and not exposed to
>     guests (apart from being able to read/write into the VNCR page) so
>     no need to handle them in sys_reg_descs or elsewhere.
> 
>   * The guest is free to set SCTLR2_EL{1,2}.TLBOSNIS, which shouldn't
>     matter to KVM.
>

What confuse me where a bit that you wrote 'try to hide'.
For me this indicates that the hiding process may not be successful.
For me the code looks like it will always succeddin hiding the feature
from the guest, no? Did I miss anything?

Same for the next patch.

	Steffen


