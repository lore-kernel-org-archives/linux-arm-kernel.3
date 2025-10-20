Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF662CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lu2+e1JrNwjm4w5JqiQAtevBk6ezsFtqM0xfwb3L/VY=; b=oafD4tcu9xohFKmk0Qbord3XHz
	d76HdZEIr1qcL85iboNTsQhzFADkUSJDEtp9Lix27DG1ppx1omnxwDnCwM7JOHPplJsKcQgwSKxur
	EZBXJneMl0vwHRXT3neffxa1v6NSPnODbzSjIGHL4hfb4w8nDCneR8XXidfIa9mERL/ZNQJSx3KjS
	hkFkf5s2U4+CBopvdO3Ubmfa5xWciQURcM4mNB/vhXkH85OjprIu9CwfCv6bsMD06n9Arhsl8N64X
	V6sUZVOmM+BgEQhxmGVNSGyqBmuDf7f9sKSdyemg5QPqgfA+T6s82O2xCAfiTDBZkRMfFDgOtX3t5
	wYuPec/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqnu-0000000DxLW-3faY;
	Mon, 20 Oct 2025 14:24:06 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqnr-0000000DxKd-2s3G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:24:05 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KDK4p7017502;
	Mon, 20 Oct 2025 14:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lu2+e1
	JrNwjm4w5JqiQAtevBk6ezsFtqM0xfwb3L/VY=; b=tjXa3BmHBBoIE+wmqP/MZx
	LYWCrKiMVFehBQDTjQWMNuS3wYuqNokzizPSGYw3TRj1muzGTLlPxbaA9RHhOSwg
	B0yodU5AsLAx2xmGYnZKjDtpZW5f773l5PhGIn/kDfk5rtovnHMMQChwBtlJuRR0
	Omm+lj+Jx4D5LUEq1S3O7iu2V0i83kSiKjvolmx251Yyo2TQJTxw4f5IMcDhlpDV
	L2ShZF41lqkLdAMBHsAERIqf+cJlyg3fTg0I0y1dwycvxXL6K8+al2NaqRKSNo11
	QoireIY8OgmDKg7bnVRVhe9YFNRoaoke4tFfQHQDUnx0PUu3elMlGGRsGLZE6JvA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v30vgupw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 14:23:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBQ5vg024686;
	Mon, 20 Oct 2025 14:23:58 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49vpqjp0p8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 14:23:58 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59KENsHx27263372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Oct 2025 14:23:54 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF9B120043;
	Mon, 20 Oct 2025 14:23:54 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9458520040;
	Mon, 20 Oct 2025 14:23:54 +0000 (GMT)
Received: from [9.111.135.235] (unknown [9.111.135.235])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Oct 2025 14:23:54 +0000 (GMT)
Message-ID: <48b8205d-96e4-4ed9-b8df-8cbdb305e661@linux.ibm.com>
Date: Mon, 20 Oct 2025 16:23:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] lib/crypto: s390/sha3: Migrate optimized code into
 library
From: Holger Dengler <dengler@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Harald Freudenberger <freude@linux.ibm.com>,
        Ingo Franzki <ifranzki@linux.ibm.com>
References: <20251020005038.661542-1-ebiggers@kernel.org>
 <20251020005038.661542-16-ebiggers@kernel.org>
 <51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3gcsP6YNnx9uH9bxnaVlScEk32ZbDY4m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX5GP2ZyrzfV8k
 CD7A+7IogP0brIFtbCSSO7FMMACu7q+fHrAYvWy2QAqSNKdHoZ2gKOcl/r2tY+bcHJth2KGtr3N
 gqNIiVc9NS/fC6lyepXqRWWJ3J8QIUZkQErM0s3ibeJaRp+Y4Ki2slQnRqmThtM7UQSxg4HZZfY
 YV2m/8CULVI1BMFO19KL7wvJbrdQZwdFsmqmjgePCcplzdyAxZx+ocwkeMuic2lLlwgTB63fzyq
 c47U1eHYzGpdrQnz/Vd8vSxfl4wj3OTk61bMnT0PDM8HXzyYn3ogM2JNOCrD/Om3C+oQIR+lydO
 HVVAt1Kqk4Uvb3t3efFLL5ITojLEqz8XOZk7bK6ZsmPlne1MWi0slUSeuJGytRdVw8W0x+Nr4LD
 I3JJJvEJ2e53bRMXKPuCkDxkM6UMHg==
X-Authority-Analysis: v=2.4 cv=MIJtWcZl c=1 sm=1 tr=0 ts=68f645ff cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=a1n8l1vKblwj1NcKW7YA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 3gcsP6YNnx9uH9bxnaVlScEk32ZbDY4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_072404_030937_EF948F53 
X-CRM114-Status: GOOD (  19.36  )
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

On 20/10/2025 16:00, Holger Dengler wrote:
> On 20/10/2025 02:50, Eric Biggers wrote:
>> Instead of exposing the s390-optimized SHA-3 code via s390-specific
>> crypto_shash algorithms, instead just implement the sha3_absorb_blocks()
>> and sha3_keccakf() library functions.  This is much simpler, it makes
>> the SHA-3 library functions be s390-optimized, and it fixes the
>> longstanding issue where the s390-optimized SHA-3 code was disabled by
>> default.  SHA-3 still remains available through crypto_shash, but
>> individual architectures no longer need to handle it.
>>
>> Note that the existing code used both CPACF_KIMD_SHA3_224 and
>> CPACF_KIMD_SHA3_256 after checking for just CPACF_KIMD_SHA3_256, and
>> similarly for 384 and 512.  I've preserved that behavior.
>>
>> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> The current code also cover a performance feature, which allows (on supported hardware, e.g. z17) to skip the ICV initialization. The support has been introduced with 88c02b3f79a6 ("s390/sha3: Support sha3 performance enhancements"). Unfortunately, this patch removes this support. Was this intended?
> 
> The get this feature back, we need to hook also into the init() function, set the according bit for the first message block and skip the initialization of the ICV.

And it would - performance wise - make some sense on s390 to replace also the sha3_xxx() functions. The init()/update()/final() sequence is not necessary on s390, as it can all be processed by one single KLMD instruction call.

> 
> Please also add me and Harald Freudenberger to the cc: list for this patch.
> 

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


