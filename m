Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A33CCD185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5opmQQrcs+iQAYIWBtfey0J/RoSdwtl4mYe2y0r2Ztg=; b=EZT39qL2F5RNAJ3LivQkHNGLL6
	/QMuJNYUb/naNj1vS/hRlAXVJdSju+16DIt3PRer+nzkzSAFAqhstUnMwg6bkn2xDVMlfmQ378tpK
	a55+THu9FOxHrI7B8SUoQSdXjElzCON1GppD4rPzVQYvlq4tR4QuybNeQ1UKKxfbXgXaYrpUVeb3P
	7Jqr3Ibk7CJdmqP9Inui3Qkf1MrhRgkF0LLVdl8xo5E4d/udGdR3R/dw79EOdFhYDsN56dL8OU1QC
	bi3/+YUvgF7UB6f++jFREqVQ3pBfzP+ZEHC+wRKIRm1vfPxGIAzFM1ajS80HIih4TlvYqQZsjHvmH
	+bxKVDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93zb-00000002CrZ-27YE;
	Wed, 15 Oct 2025 16:04:47 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v93zZ-00000002Cr9-2CNF;
	Wed, 15 Oct 2025 16:04:46 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FDhs4b001980;
	Wed, 15 Oct 2025 16:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5opmQQ
	rcs+iQAYIWBtfey0J/RoSdwtl4mYe2y0r2Ztg=; b=DTMYRDGbbruCsK1hiGXePi
	NbuXJV52I8gbDdNY9W5EKuZLmSAQBDEHUcH2r6peMBVF2Oh/kCdqsMc6mxNJQeGk
	Aw/B6GpRKQu9tbPPJPJ5RcRbuXlQxkNIz3azQRk3KPsJdXHGfHlzxPt5XjgVOFvx
	BQ0/nhlzIIbQQbXnf7MtSdlfo00TmjjfcvDlThYf6U71fY5o3fDsIjTJh+vcOdIU
	dYavP4hNgCW5L+atWQrgXhGeac0cJhNwANNxfuvecdQnBk3x2YFd+dKpK2iMiVYX
	HZrFxNrwGZjChtL00YRH1UN34CxwbVQLSiBfOUaLpbw6E+d0LxTAOcF+Z6tH/v8Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp80e96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 16:02:30 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59FFxv93008767;
	Wed, 15 Oct 2025 16:02:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp80e90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 16:02:29 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59FDu6dv003626;
	Wed, 15 Oct 2025 16:02:27 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r1xy1a38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 16:02:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59FG2Pc631261170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 16:02:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D48E200E6;
	Wed, 15 Oct 2025 16:02:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34465200DB;
	Wed, 15 Oct 2025 16:02:11 +0000 (GMT)
Received: from [9.124.218.242] (unknown [9.124.218.242])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Oct 2025 16:02:10 +0000 (GMT)
Message-ID: <9901f2e8-653e-42f4-9344-03b2f70846bb@linux.ibm.com>
Date: Wed, 15 Oct 2025 21:32:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/21] paravirt: Remove asm/paravirt_api_clock.h
To: Juergen Gross <jgross@suse.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
        Alexey Makhalov <alexey.makhalov@broadcom.com>,
        Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
        Russell King
 <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, virtualization@lists.linux.dev,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org
References: <20251006074606.1266-1-jgross@suse.com>
 <20251006074606.1266-6-jgross@suse.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20251006074606.1266-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9ZUK4UeNEA3M63-5xIUdjnNRJmI9KQSO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA4NCBTYWx0ZWRfX90a/KFqHOFA4
 3LTXuANmdsGxWyQx7Ukevm3RyFSkQJ9pXc2oVr8K5uv/q7SJflj3vhk6rgQPg5a2e4JMHRcokhT
 E+w6CfzUtDgCzNqO7x7Qz0iPi2Udyp1mB5qOlV79KYdYo8wEkzexJTGI0NvxBMb9zp2anqktjy6
 x7dXmTESXxwuIWmKuQwlY9VJQdv5AweqVNhod++KR+c5UndqULhfyI4H+V7In+JTOm9GWN4E92e
 bZgooNZopePk7kVmv+pt2VQaWzIRRgwHx3+Ivefade+IPstSVao1M49g8pQuFBZku8ozOWBjVco
 XGxbdE4m67DWVP6wWkyIRV4aUp8gC4N6DdEGT4oMISQu4RWJ20yslN8ham/g8aBzCSTrxBcUSHp
 17smtvjqfZzcfkxRb2PzijiKsYbetw==
X-Proofpoint-GUID: dV8tQT4HDH7j4wsc4MFx6qXJyZuneU1L
X-Authority-Analysis: v=2.4 cv=af5sXBot c=1 sm=1 tr=0 ts=68efc596 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iox4zFpeAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=RR7mTWzPQ-4l2d7n_HwA:9
 a=QEXdDO2ut3YA:10 a=WzC6qhA0u3u7Ye7llzcV:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_090445_561172_01D36B00 
X-CRM114-Status: GOOD (  14.56  )
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



On 10/6/25 1:15 PM, Juergen Gross wrote:
> All architectures supporting CONFIG_PARAVIRT share the same contents
> of asm/paravirt_api_clock.h:
> 
>    #include <asm/paravirt.h>
> 
> So remove all incarnations of asm/paravirt_api_clock.h and remove the
> only place where it is included, as there asm/paravirt.h is included
> anyway.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>   arch/arm/include/asm/paravirt_api_clock.h       | 1 -
>   arch/arm64/include/asm/paravirt_api_clock.h     | 1 -
>   arch/loongarch/include/asm/paravirt_api_clock.h | 1 -
>   arch/powerpc/include/asm/paravirt_api_clock.h   | 2 --
>   arch/riscv/include/asm/paravirt_api_clock.h     | 1 -
>   arch/x86/include/asm/paravirt_api_clock.h       | 1 -
>   kernel/sched/sched.h                            | 1 -
>   7 files changed, 8 deletions(-)
>   delete mode 100644 arch/arm/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/arm64/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/loongarch/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/powerpc/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
>   delete mode 100644 arch/x86/include/asm/paravirt_api_clock.h
> 

For powerpc, scheduler bits

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

