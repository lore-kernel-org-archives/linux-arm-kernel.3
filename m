Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95789C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LGl24NI2u6yR5P3TtnRL3JOi0ZtYPZ8+8rqXw3w0aoI=; b=FzKjvoWJdlLz0SxNU4EogBw0yw
	lmdAwSR3hl676ounyDHsIcHY99OtEbo/OJfh3nmGSryp2ACJ7dPJyxqXf3zPwBbMInumA3x9l9/qk
	5HKV/sbcCd5aVgtQGFWj8vDw1SwPp3iJ//ZY5x4XAN6vETtYnLtxA+QXChO4o3iLDbdJb7lzFIlS+
	hA16QroDUMVGFh67Zyn+xJ5XVChLqdU7SpQ1xvFXeJX+ttwkmwArbPEHUtDmL29BfJ3DY1CUSlSx2
	BElimkQEKz4+sMG9ajfgsYyObX+EBu6cmtJR/lEb6NhpWxxeOhDcsTjNo8kOCy5iDfBnNYutXPCex
	wjtIjxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghX9-0000000CNCD-2Ml3;
	Mon, 06 Jul 2026 11:30:43 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghX7-0000000CNBo-38ft
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:30:42 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666BIID8318945;
	Mon, 6 Jul 2026 11:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=LGl24N
	I2u6yR5P3TtnRL3JOi0ZtYPZ8+8rqXw3w0aoI=; b=nvjunM3esjiPjYfvcu6f75
	WWZUXjbDChIc/EmGFGO6ntzWjCuK9hfCtkcJPczsnPmtP92KNFthnxiDuXWo2xKY
	2fhPeA4b5nnSsN/uzt59223bbZBQVHJPLYAe4oeERPRzTE+dfQBEzn80EBcPfbIU
	PO65ZD+Z8PYsqCxIWfzXXUu/Pwm4U+GXb9vtbUFymKfF3wjwLpn0pai+lYUn1lNM
	OjIO6ATEYkOkVvgNTcFo8QPWXVsng069vC/ILIcL8sVXaQphe4ZfS8526F3fg/1i
	95JiPACd4iI+w450HL/wIcpUwVxqW7LGtgw2m32e3amna3iXRLrmFNgJsf0g7t5g
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4f6suqh1m3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 11:30:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 666BK2OM018492;
	Mon, 6 Jul 2026 11:30:27 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4f7e0h581x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 11:30:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 666BUL5s47382896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jul 2026 11:30:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AADF920043;
	Mon,  6 Jul 2026 11:30:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C4892004B;
	Mon,  6 Jul 2026 11:30:21 +0000 (GMT)
Received: from [9.224.77.173] (unknown [9.224.77.173])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jul 2026 11:30:20 +0000 (GMT)
Message-ID: <721266da-db8f-4385-87c1-ca26c430892c@linux.ibm.com>
Date: Mon, 6 Jul 2026 13:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/27] s390: Introduce Start Arm Execution instruction
To: Janosch Frank <frankja@linux.ibm.com>,
        Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
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
        Ilya Leoshkevich <iii@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>,
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
 <20260706085229.979525-20-seiden@linux.ibm.com>
 <8239c9ba-154c-4e2d-b2fc-700ba12eb585@linux.ibm.com>
Content-Language: en-US
From: Christian Borntraeger <borntraeger@linux.ibm.com>
In-Reply-To: <8239c9ba-154c-4e2d-b2fc-700ba12eb585@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExNCBTYWx0ZWRfXyXs5OGzOANhv
 ZIJl81eEuRU4Cpez+mW/Cv4V3PCkqB38qFKziSlSUv/NThQ82C72diIb9Sg7BPrUytroTklEQsh
 TXffBA8Sqc3nex38XAZ12ERM3F6nJHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExNCBTYWx0ZWRfX8V1IkIBid673
 qSMlAej2yF6fkd6r8CLZG47k77Z39HY4Wbz3MHH24E9KroifQ+EGG9Rl10MhEzQ+DkOjyGmpUn/
 N0NVi6v/TeoISNhYhibPdltRcdAwNMZWgoYDz0X088HeeYbx/DVp86me0g9ALzEo/PNeK/C/TG5
 BlolhKbNKhUGP4HdLyzzie+RkWHVQHzFoCYMw3n0oNC7ogTYe0dAm0zc159bAEUzS0vd32+7qvG
 EUOnm8UZPuWYfBU5h1uKyl2QlIDIUIgA8IRJjkcOh0FOaOeaHb+3giJbUpEFLAf6bpXsPT27naY
 uZIg7RGcfaVDDn6l0AYJpqHT5yFl9S5K6SMAA6JiEEcFcELatJ8TuGt5HBtPvDm09SUkDe0Dd29
 Z94ldvwtp8kDGD/786wPpipS/It78xwWX7M3bkoeUr+tDQfa9xPVA+/bcCTXkJeI/WPT5i38jVz
 EJRDSvywjkaz63XzHLw==
X-Proofpoint-GUID: QO9Jmrtl9YbmYkeOKN-Rxs6ZbudI9ERe
X-Authority-Analysis: v=2.4 cv=Oot/DS/t c=1 sm=1 tr=0 ts=6a4b91d5 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=uAbxVGIbfxUO_5tXvNgY:22 a=02lCwkMJHSWm-2F3BxgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: QO9Jmrtl9YbmYkeOKN-Rxs6ZbudI9ERe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 phishscore=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_043041_794017_1B43BF04 
X-CRM114-Status: GOOD (  17.52  )
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



Am 06.07.26 um 13:17 schrieb Janosch Frank:

>> +SYM_FUNC_START(__sae64a)
>> +    stmg    %r6,%r14,__SF_GPRS(%r15)    # store kernel registers
>> +    STBEAR    __SF_SAE_BEAR(%r15)        # save breaking event address register
>> +    .insn    rre,0xb9a50000,%r2,0        # Start Arm Execution
>> +# Let the next instruction be NOP to avoid triggering a machine check
>> +# and handling it in a guest as result of the instruction execution.
> 
> @Christian:
> I have the feeling things got lost in translation when this comment was written.
> How would we trigger a MCHECK by having an instruction after SIE/SAE?
> AFAIU this allows us to have a label which we can check in the mcheck handler to decide who triggered the mcheck.

the original rationale was that some machine checks are nullifying some are terminating. So the PSW might point
to SAE or the instruction afterwards for a guest machine check.
In SIE, we use that nop to account any machine check on that nop as a guest machine check.

> 
> Without the label the comment and NOP are useless as far as I can see.
> So we need to decide if this still applies and then either remove it or add sae handling to mcck_int_handler and maybe other mcheck functions.

We plan to get more information on the machine checks for sae so we might no longer need that.
But this series does not yet contain the machine check handling. Maybe its better to remove comment and
nop and introduce that later when we add machine check handling and if still needed.

