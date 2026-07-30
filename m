Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF60C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 06:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSKpK5beRJSFXxCftlJ/6i2fmlt/3JwNSqzLkzUOYIs=; b=D7OikiV1Fc/phRFAgekI7EU9zG
	n8DsP1KYvOaZ+yfKRrvA/nrf3oHjeBwwwGQZWA4kfiUDC7QiJxDPAOf3UQK3LKdGOz/Lrl1rA6Hm/
	NGTZYsOvokSEd/vRHU1akph74Fxl9wCmVwMH+WHJVU/ap/8lz8PczKaxGdPbJYDY3O9QVppVXE0kT
	UtaCcGVgZRe48NavdP+f5kqeKrToOaKyr/9dL3nIXONGefbt7827Wd76NajJVba+3qvggPQIalmz7
	uoJ2j2FO0fwGU+ZBACQMfaWvdgRBiv+FUQbn1oZrppcXkf6QxKokKylkc9hfBL+o6DrJ3Z5zlfrCG
	9nsV8R6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJuP-00000009ZsC-113B;
	Thu, 30 Jul 2026 06:06:21 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpJuN-00000009Zrq-1gTK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 06:06:20 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U3laV01933585;
	Thu, 30 Jul 2026 06:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fSKpK5
	beRJSFXxCftlJ/6i2fmlt/3JwNSqzLkzUOYIs=; b=s8Uk9W8uV5FJtCx0SbDAh3
	YNFN3+TeiruYlev0C/0DU/tf0DzMuHjMq2kOxnLx25pno10CX8HUptcMWsBfSXAo
	9tGkKt4kAU1tLWoylL4JMu3jq4U56hndhVIvTTmgvsnoYKMCHBynzf5rPGZGstd7
	PMq4lQ3Ljb6dO6MfSPWdRWifD3OLBdi+Ya9gvTKa12VvpunyiOM34qx4EGZn7hMX
	yT0yaRhJT0MepDDBWdLJP+yeVUQBmZxRHYcg5upYbwWoJXTxo71Wd4CmMcEmQjXe
	nyR3Mx5aqdqxMJHDnndbe6jAjKRaLrDO4slY+ECe/WNM+g5ssIaAcse3Q7Dkqibg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4fmv0xxa3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 06:06:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 66U5uHWh012301;
	Thu, 30 Jul 2026 06:06:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4fn7fqj6wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 06:06:07 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 66U663Rc35127580
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jul 2026 06:06:03 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72E832004D;
	Thu, 30 Jul 2026 06:06:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10DBC20043;
	Thu, 30 Jul 2026 06:06:03 +0000 (GMT)
Received: from [9.224.76.67] (unknown [9.224.76.67])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jul 2026 06:06:02 +0000 (GMT)
Message-ID: <18ca706f-ef45-4207-a55d-025f90133978@linux.ibm.com>
Date: Thu, 30 Jul 2026 08:06:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)~
To: Yang Shi <yang@os.amperecomputing.com>,
        Ryan Roberts <ryan.roberts@arm.com>, cl@gentwo.org, dennis@kernel.org,
        tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com,
        will@kernel.org, david@kernel.org, akpm@linux-foundation.org,
        hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
Content-Language: en-US
From: Mete Durlu <meted@linux.ibm.com>
In-Reply-To: <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: r-zTKHDUsTXOcFmf_-9wS5lhnkg_qTkD
X-Proofpoint-ORIG-GUID: SOP_yvGrI1a3-1kuGNqQ95swD9gDixMk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAzOCBTYWx0ZWRfX3sdFvOaD+SK5
 BwqMslyT06eKdSQz0oVVw1k7nVE1QnWBDNlUtJeG8OzEZn1Qwoo9TgP2LDtITB8K11bp8UHn33n
 Yi+SYqS182tCyPn3xWE9dgJhNNaRla0=
X-Authority-Analysis: v=2.4 cv=dYuwG3Xe c=1 sm=1 tr=0 ts=6a6ae9d0 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=cpGfkXA4JyvoFA7YCHUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAzOCBTYWx0ZWRfX5gMfbafa3aqX
 NNjDEl9HOtJXNn4YfJJOTBdNIIC8zGhagzyCNDyk/MKfMb5upZKxisfIr4F7NvBQg1xaBcPQyNv
 46vDVGcFHsZvz6oM5aox1Wu2jAQXWZi+7ZoV/5dAmfE8cDa93FDH0Re4fTtIXlnHqkmNTojKxIp
 MSMINRnnbCBPy0EJhnBzP4XQTVgxjMsqIuUhdnJ3diktuFy/wt7Wwp40O9F68IUluEiQXO5/7S9
 eDQ9I+v86YpB6F5FwzVztmvgQV8nENbYPPyZKklzu2b+ZE9cVLNVyQ2aTkkurLiDMtUElHm0yqB
 55gNYq4GxIJcsYjXQ7QUnEBwxHurFePOj6BlQTekavxxKGzzBdtYKaTJ+4C6Eza0rl68n5cy+fC
 ZLiVYWsF9IKSiD+qYRqfxKebYddG+4YKGZ9v8/KonRkZJYHycXOJAcJShzHh5i86D3exEA42k9e
 0rkzXrDM4oGWfaDZuaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 phishscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_230619_459830_232DD08E 
X-CRM114-Status: GOOD (  10.55  )
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

On 22/07/2026 01:20, Yang Shi wrote:
> 
> S390 implemented restart sequence. Heiko didn't share too much benchmark 
> data, just confirmed there is no regression and I had a lengthy 
> discussion with him (https://lore.kernel.org/ 
> lkml/20260520092243.264847-1-hca@linux.ibm.com/).

Hi,

regarding performance numbers from s390 and Heiko's implementation.
It is safe to say we see noticeable improvements on micro benchmarks
but nothing really pops out on regular workloads.

on 24 Cores - 48 CPUs

1. Kernel Build
---------------------------------------------------------------------
time make -j $(nproc)
~0-2% improvement - within noise ratio

2. stress-ng vm ops
---------------------------------------------------------------------
stress-ng --vm $(nproc) --vm-bytes 128M --vm-ops 100000000
~16% improvement on bogo/ops

3. stress-ng vm ops + fork
---------------------------------------------------------------------
stress-ng -M --mmapfork $(nproc) --mmapfork-bytes 128M --mmapfork-ops 10000
~6% improvement on bogo/ops

4. fork test
---------------------------------------------------------------------
stress-ng -M --fork $(nproc) --fork-ops 10000000
~13% improvement on bogo/ops

Basecommit: a2b94afeb516 ("s390/zcrypt: Replace get_zeroed_page() with 
kzalloc()")

Thanks,
-Mete Durlu

