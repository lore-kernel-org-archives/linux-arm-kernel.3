Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC54CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 14:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdSeM7L3fyz67vnTQhFFC4l1PlGndmy+nOL9BJyjRtQ=; b=o/VTA9QBrFk01hgRxxcmzvbY+2
	HUhAtaaU3mAdK7PjHwjgShfRJbzj1eKttIXlYvbXq3lHIhM9R0uJkyWpy8gxogbtq1n9L3Yd2cchc
	x4V+lDnGgfIxY+BOtDKg93XEzDoW/BGmcJ5KE6iztckKsaLKHq98H6XZMaISATN9HSYi1kRv0qWl5
	d2sbxttITeE1XckYQ5IQwdXSLVTzDqdBMnmZTU0+4maM5L4/Fp+cXdGAoPbpnxqXdcV/meLvSU8Zh
	Q7+0zWuxYfmMP/okAeZ99w6T9O6TJrolY5h5mPi7D7YPUN5BvUkJCUJBCILUlU3AgW84HvrbOm9PA
	Bwtdpywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqRn-0000000Dsn1-1fW6;
	Mon, 20 Oct 2025 14:01:15 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAqRk-0000000Dskw-00mj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 14:01:13 +0000
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KB8svT015526;
	Mon, 20 Oct 2025 14:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JdSeM7
	L3fyz67vnTQhFFC4l1PlGndmy+nOL9BJyjRtQ=; b=seOBZBUcodAAuYBOCTxX4s
	ROev3nWFE2tmlivxkn2ojXoh3KpiDiTfNQ8CmN0ykL7wQSrZaVZWMh/k1G5s531+
	cQRn7tdC6IzGRbwjsNSPRIZVmtpSW21rLU60LI03YHK5qGpwGkORKd46pDf6YaZu
	Md3dF/87wMdkXtK6dbTDPUAZqZCXNxHarzCOyoKZFtxTHqjqAkAJIdH0Vj3bzZlX
	rGvSYfcIwtf7KTyVg5RRj3eRtdAsCjCGXcZDYgXHPQQDeOAQtVcKrU+Z/9+xZQ18
	cBri2ItafAfalB0ebak5wqoARCkQhbOihIprsg3ZxTTaXfvCqwqkCV5OqQlOQ97w
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v31c0sgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 14:00:56 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59KAAlrC017058;
	Mon, 20 Oct 2025 14:00:56 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49vnkxp2g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Oct 2025 14:00:56 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59KE0sfo6226180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Oct 2025 14:00:54 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 481212004B;
	Mon, 20 Oct 2025 14:00:54 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B41D20043;
	Mon, 20 Oct 2025 14:00:54 +0000 (GMT)
Received: from [9.111.135.235] (unknown [9.111.135.235])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Oct 2025 14:00:54 +0000 (GMT)
Message-ID: <51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com>
Date: Mon, 20 Oct 2025 16:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] lib/crypto: s390/sha3: Migrate optimized code into
 library
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20251020005038.661542-1-ebiggers@kernel.org>
 <20251020005038.661542-16-ebiggers@kernel.org>
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20251020005038.661542-16-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P_P5WNnDrZc7bkcs6wRRlyJy8aTaDxbq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX5GEZ9Cx6axoj
 D01+yR3yKlDi4IlgTSmKdF1PlEUEL1k0LMU35tvDHaqVhINoiEVQJxRqDFkCy981lONc+Cat2Sn
 i9FGaSyhtxDRJ0v+JGAlxRrZb+i8MGjUkIWtgx4zzJep7w2HSm3j7Q4/4uvoThFV1McFfk6Xzvm
 EZXYtQfgrIRr5jN4aFEJAPrLhBSY2qJKjw2KkiQANNBQeuJlIxerredLIxOESi9AbdGpnGFBbwt
 lRwmZ9ZRxxnIvmPiPrDbRQu7P3wNDCp7kVmfVPzmqKq7J0Sf1UqX5+JReAdFrFSQg43mecbyBIT
 FHm0uZS/J0AM0KAT6rTbsX6RLmwONKW0T9WZlhSm6D0l65uRNJE49GfKfCRr1ctIKPNAQfNshIg
 8meKg2qqV3Y7yRFtpGP1po4LvxRa0w==
X-Proofpoint-GUID: P_P5WNnDrZc7bkcs6wRRlyJy8aTaDxbq
X-Authority-Analysis: v=2.4 cv=SKNPlevH c=1 sm=1 tr=0 ts=68f64099 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=mFTWSeivvc5NSGs0BT4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_070112_161683_03025D30 
X-CRM114-Status: GOOD (  17.85  )
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

On 20/10/2025 02:50, Eric Biggers wrote:
> Instead of exposing the s390-optimized SHA-3 code via s390-specific
> crypto_shash algorithms, instead just implement the sha3_absorb_blocks()
> and sha3_keccakf() library functions.  This is much simpler, it makes
> the SHA-3 library functions be s390-optimized, and it fixes the
> longstanding issue where the s390-optimized SHA-3 code was disabled by
> default.  SHA-3 still remains available through crypto_shash, but
> individual architectures no longer need to handle it.
> 
> Note that the existing code used both CPACF_KIMD_SHA3_224 and
> CPACF_KIMD_SHA3_256 after checking for just CPACF_KIMD_SHA3_256, and
> similarly for 384 and 512.  I've preserved that behavior.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
The current code also cover a performance feature, which allows (on supported hardware, e.g. z17) to skip the ICV initialization. The support has been introduced with 88c02b3f79a6 ("s390/sha3: Support sha3 performance enhancements"). Unfortunately, this patch removes this support. Was this intended?

The get this feature back, we need to hook also into the init() function, set the according bit for the first message block and skip the initialization of the ICV.

Please also add me and Harald Freudenberger to the cc: list for this patch.

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


