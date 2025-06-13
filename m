Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12594C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 09:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xhKfa11r0fIdk/OBYg/GIIiQIwx7yhJk3cwxumE5AEs=; b=JTeESreOTKOCUrn745fH7Rrik5
	JzQMlCkO76uorFwYtsmvFc5r/riKxF4pBssAqUfjettI4QCJwLFBSYRSuCGuYzuP9EYiH1q2R4umj
	oek+31kt6MqK/bYVrJDDDdR4smEUCmTdy4JzcPW8XS+x7So/N5/K7lYWCxsvOcXJ+IGkakv8+lSI9
	peVVJ6VPah8F9ZxrOHCYnzkKAGCbvlnels0Vo+TLrRwddEhqkwdix7Mnhpj8DYH6zk0C4OdmnXn/R
	L+by48KNCU8PUD71wuLYaknG27iWQkKhadBRwI/MRcQ7OK3UFMfv3VhspVC4Tj6Xw+kG3gDhyGM5y
	pDN5JIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ18l-0000000Fzmz-39Iw;
	Fri, 13 Jun 2025 09:56:03 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ12b-0000000FyVQ-3PgI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 09:49:43 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D8cdTb003977;
	Fri, 13 Jun 2025 09:49:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xhKfa1
	1r0fIdk/OBYg/GIIiQIwx7yhJk3cwxumE5AEs=; b=Bnd1HKdbGWqc6aOpY24sNp
	JLh6J8IUC0sPEvXltJ+na4jYXJMryhoMpfzHBDIBCsz/8cJ/YlV7b8A1MO1cKXiz
	LvOYK5DLFfO+vWoq3WHZRTI0MJzvpCW17hL9AQ+fMZOYHTk6cX6VzmB6gZfmWk2r
	SRofYuwsPr8THK/Y46OzgYdQrj/kBZP803dFfLQQVynWPkddF9VjHKBnsrhFE02v
	oFcMjuaMimEFjD0xQ42R8I5TxoI0I46m255mwqiCIlV0Sr4En1o9/HbeigCAV5qe
	7HkSicSafpmomtH+iFTJkZ/UrJ5QrJWMGKB0nO4CmMYwXCsSGW7I57yoAFUP3ELA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474x4mnb9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 09:49:18 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55D6a654015346;
	Fri, 13 Jun 2025 09:49:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rphf74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jun 2025 09:49:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55D9nG5419595760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Jun 2025 09:49:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D6C02004B;
	Fri, 13 Jun 2025 09:49:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D689C20040;
	Fri, 13 Jun 2025 09:49:12 +0000 (GMT)
Received: from [9.39.28.153] (unknown [9.39.28.153])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Jun 2025 09:49:12 +0000 (GMT)
Message-ID: <7d8b517f-3122-446e-aa72-ce0dd99a9a27@linux.ibm.com>
Date: Fri, 13 Jun 2025 15:19:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] sched: preempt: Move dynamic keys into kernel/sched
To: maddy@linux.ibm.com, catalin.marinas@arm.com
Cc: tglx@linutronix.de, bigeasy@linutronix.de, vschneid@redhat.com,
        dietmar.eggemann@arm.com, rostedt@goodmis.org,
        linux-kernel@vger.kernel.org, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
        Christophe Leroy <christophe.leroy@csgroup.eu>, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org
References: <20250610075344.1379597-1-sshegde@linux.ibm.com>
 <20250610075344.1379597-2-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250610075344.1379597-2-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Y4X4sgeN c=1 sm=1 tr=0 ts=684bf41f cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=2AXKpjNQ3m-Tlf7b-TEA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: yELlwoD-D_GA1JruOnpY83OtviUJQN3U
X-Proofpoint-ORIG-GUID: yELlwoD-D_GA1JruOnpY83OtviUJQN3U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDA3MSBTYWx0ZWRfX4skZ3ssTQ22P K8vOFnq8FEGsXW+uHsFa77mo221TIzAGYTZgpmoYH9KHkJszoGx7+cJ3ok3siDmUAQvuN3AROuG HRFCRZfp8yCvA4E0VrPDs6sfCjj62VKOt8VKFo4VquZWpjqVCoYhNofNZ/BAEP1TDYLW8b0s0CL
 BxN0cxakQ2/Nl2ODFpycb8EEPiGuwzZAskLHTE+p64Ci4G3PxnsO1YOC3jOcx7Gcy5h8DciLlWu gCv/46/EMcpo8MfzCfh71koPsu80E0nCwqn7nA++CUbXoDE8/NGYNe+wGIDpN7O5xEFZqOTmlYW 1kRrHLF25L8vmg5m06tq1K4l/12dvx5Zu3OUnfTers6eX9IcnR9n3j4KCV1xYOm5lnxqT+EhbmI
 smtXAvawkHM4c6rkrEgfuRQ9mP0j7ZgbnbM88z9scoMn0RPBTuU4eUOZxO6IoGqXrTAhTJXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=974 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_024941_993856_9AE5899C 
X-CRM114-Status: GOOD (  16.75  )
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

+Cristope Leroy.

On 6/10/25 13:23, Shrikanth Hegde wrote:
> Dynamic preemption can be static key or static call based.
> Static key is used to check kernel preemption depending on
> the current preemption model. i.e enable for lazy, full.
> 
> Code is spread currently across entry/common.c, arm64 and latest being
> powerpc. There is little arch specific to it. For example, arm64,
> powerpc does the same thing. It is better to move it into kernel/sched
> since preemption is more closely associated with scheduler.
> 
> Plus, Any new arch that wants dynamic preemption enabled need to have
> only HAVE_PREEMPT_DYNAMIC_KEY.
> 
> This is more of code movement. No functional change.
> 
> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>   arch/arm64/include/asm/preempt.h   |  1 -
>   arch/arm64/kernel/entry-common.c   |  8 --------
>   arch/powerpc/include/asm/preempt.h | 16 ----------------
>   arch/powerpc/kernel/interrupt.c    |  4 ----
>   include/linux/entry-common.h       |  1 -
>   include/linux/sched.h              |  8 ++++++++
>   kernel/entry/common.c              |  1 -
>   kernel/sched/core.c                |  4 ++++
>   8 files changed, 12 insertions(+), 31 deletions(-)
>   delete mode 100644 arch/powerpc/include/asm/preempt.h

Hi. Catalin, Maddy,

Does respective arch changes seem ok?

