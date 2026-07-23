Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430B5C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aABlAU6AgKvr71w/yfvj1unG9U7ehx/fcV3KPThj+5Y=; b=FA2P/C659FvXZ3Zyz7cPtZctQf
	XGCPWDzjzdW/ctcgvCBkeOtwzfxQ/QDb2tvQnnrSbSIBLszx5KmQAusj2AmQtjk4DSvVgTJgAj/hS
	wtZnxKw1lsTmbSe7lJ6q3ZC3RLitxtrxgfjNhUxcTdD5MYqhHjVr7zR9wo3HCxb2IV1KsgfU2GClc
	4KAu1YYjN+IJdGYG6glOzCcXo5XxJRlrxFy6rF++8F00Kekg/aJ9+jmsO551oq+F3fMKEQuLfcPRg
	Uj1OgWYCxi55Nj3w8wiHj3yv6i0Z2B+GNooZsHJRdrz+IUgvPFxfTXr2iZPNTI9nk/fCUt4KdK/b2
	4Mf460LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsy2-0000000EIGu-2o8T;
	Thu, 23 Jul 2026 12:56:02 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsxq-0000000EI3d-02So
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:56:00 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9BnLV2593650;
	Thu, 23 Jul 2026 12:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=aABlAU
	6AgKvr71w/yfvj1unG9U7ehx/fcV3KPThj+5Y=; b=gtRLWC0VZmtjXq9FazeOnW
	+pt2E6GuiPUyC8XK79FKA6UzeLMQ3Zcx0v6RcGtBq2t+M7yx/omgkNQuXGB1+ZZP
	1VvjeLtGEmVFhjn7lm+LhpfG95+H0HZIIj6wU7DnMbIWAri70ioauykVzIAaw1ar
	QbG8H1pjF+TPMHnAfvo2lzarZtaQ71RAxA0h4FxHqtzo+QgCQyPss+V/L76Odn5F
	6RxZfrSESEGUoWF8R9Ow/1GfOp3kypyewGf6ESMh0fZegKYrh0wNfaVHeXFP6JzO
	lOv8HBKl7sgq4dXbxiw+xuGu9yWyYGV93MegyM7dIZJmBTFarKE/uB1DonkXRf+Q
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fg7917jf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 12:55:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66NCnh4Y031797;
	Thu, 23 Jul 2026 12:55:34 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4fgm6wc973-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 12:55:34 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66NCtQDm38339050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2026 12:55:26 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B39FD2004E;
	Thu, 23 Jul 2026 12:55:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C52C20043;
	Thu, 23 Jul 2026 12:55:26 +0000 (GMT)
Received: from [9.224.77.173] (unknown [9.224.77.173])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jul 2026 12:55:26 +0000 (GMT)
Message-ID: <8703798a-ac03-4fb9-aa0d-4d9549e310d4@linux.ibm.com>
Date: Thu, 23 Jul 2026 14:55:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/27] KVM: s390: Introduce arm64 KVM
To: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
        kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
        Andreas Grapentin <gra@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        David Hildenbrand <david@kernel.org>,
        Friedrich Welter
 <fritz@linux.ibm.com>,
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
        Vasily Gorbik
 <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
        Zenghui Yu <yuzenghui@huawei.com>
References: <20260706085229.979525-1-seiden@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <20260706085229.979525-1-seiden@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 64tLpuikP21pA_DvTyWJqLJUNsEfapWn
X-Authority-Analysis: v=2.4 cv=V6RNF+ni c=1 sm=1 tr=0 ts=6a620f47 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=CPxsEd0Gt-L8NNlc6woA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyNSBTYWx0ZWRfX0qSI/yMXVsuz
 xMq/LSxZDtTMddhl7DN1psJ+AcAh+WqPAbbZwtK8MJlerH7F490CrUyP/3W5gzNef67qarCy+UT
 7hJ7bVLd5A/fU7XHhk6v2aKi1h+t43w=
X-Proofpoint-GUID: 64tLpuikP21pA_DvTyWJqLJUNsEfapWn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyNSBTYWx0ZWRfX6dn6+/3PTIrx
 TtZocT5pUUlNA17Ttj6BWgf5nD54egU2uBzawZrao1RPEnPrHkOQ6DriKy8WpGcsjS5t66gEB9p
 z7OKjbpA74OJfrQ8Q/+OSOGrukBnA/tRxfqCOo2p8+9oDQ3ylmgj3lVq9B00/88ksrUc+5JuqMT
 74v9gUQQSBmvgxQ4xZT4bHHcJji+fWmk1A4/j5x+0pOSjIH/ebs9EJHciKFeURlToymALQaQnNc
 otZrVmPDIJXhu/llnmqRTyuuVR11on7YK13hLif1miFNh6Ae8K4jRCWiYPvem+Gc0jgSHO0PWE2
 TxZpRWajFvjlJAYWC9cbfi5SqZ9wl0MuZz9IztJ8iuPMVpXMBdyMA0gsm4Xl0Lg5ov3Dj/39UQQ
 rtQVoA3ojSW8hEN+VmGPQfj0nO3ugg5/HSQcmKaD9PZSFIOi7rUTy8HZTRmHkzkHG//178R+sRn
 0a4v4+pJzVVxdPkciwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055550_337947_7A773518 
X-CRM114-Status: GOOD (  10.01  )
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

Am 06.07.26 um 10:52 schrieb Steffen Eiden:

> KVM/s390 reorganization (patches 12-17):
>    Prepare s390 for a second KVM module. Move existing s390 KVM code into
>    dedicated s390 and gmap subdirectories to make room for a second KVM
>    implementation. Refactor gmap to better integrate with the second KVM
>    implementation.
In the interest of making this patch set smaller, I would be willing to take
these mechanical things in kvms390->next. Needs some review and polish but
should be straighforward enough.

