Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26860CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+PGxgH4B1ba9aPC0MCTfuQEhemc8eYzkzRGLtN3e2Q=; b=jpMerUfGQcamZUZ4jI6C7Fl0kC
	MZ1q0WcXU7c1rmsH/idKEdfinWxaT8zfr0a7PWWOcCsEKw6WdW4KdAADFrLpFA8Oxy2U85qewQg/3
	5Le+oEBGjTzAfLiXjDTOZy6cVcBzHYbtTtyP3NapmnUEfrnKiSLDejNOFovUdJLNyY9pc0XXRuIoY
	5BTJZElS6M5Sh7vTudBTIoF3BrUeLfB/nes5gZuRtzUWnQ/MRGn7pBIdjhtR5xeCc5X3X968rcLof
	mQb9uvGOcZTucuktIhfAIX61Y2L6mJC17QaECrxJW9tRZrkUc82dnaB7n1dpOKNBcjz+zbAY7fXKQ
	mGDbrCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7xU-0000000GKB0-1T5c;
	Tue, 21 Oct 2025 08:43:08 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7xS-0000000GK9V-0rYy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:43:07 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L2cFG6018793;
	Tue, 21 Oct 2025 08:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=m+PGxg
	H4B1ba9aPC0MCTfuQEhemc8eYzkzRGLtN3e2Q=; b=Rcdo1r2bzj1jwvmC9T0vq/
	xqq8N1gQ7ORmhthAy1Rr+IqNttolJq4p0BUdSzM664+wuvdvYPcJPpVoojOXTcAA
	yPBbjtzC6+/f18cD2LuaaeP4za5O0cwKRTNeHbzQFWYDVugtZVdVMONOU0W72/xg
	1w2uV2oCRDJR9gyiwekoLV2vhhyBUgAGW7z7NqCuEe3Y4/7QZnpVELNwM+gBRBTn
	nEs2rjd7pKlN3t18saRfLXiDWRIsiLo3QTnAviffu6wrmMgo1/GnwAK9MRZgUjU3
	aeA5aTso91UiwdpFH3b7rMtf9d+tn1x5e2tH72Qu2WflZjEMkvj4uAoW68M1LI2A
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49v326nysc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 08:43:04 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59L88EoD024677;
	Tue, 21 Oct 2025 08:43:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49vpqjss2d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 08:43:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59L8h0GD12583286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Oct 2025 08:43:01 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA39320043;
	Tue, 21 Oct 2025 08:43:00 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A326520040;
	Tue, 21 Oct 2025 08:43:00 +0000 (GMT)
Received: from [9.111.135.235] (unknown [9.111.135.235])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Oct 2025 08:43:00 +0000 (GMT)
Message-ID: <5895ed68-dd6e-4f3d-9e6f-c27459556ff7@linux.ibm.com>
Date: Tue, 21 Oct 2025 10:43:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] lib/crypto: s390/sha3: Migrate optimized code into
 library
From: Holger Dengler <dengler@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>,
        Harald Freudenberger <freude@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-crypto@vger.kernel.org
References: <20251020005038.661542-1-ebiggers@kernel.org>
 <20251020005038.661542-16-ebiggers@kernel.org>
 <51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com>
 <20251020175736.GC1644@sol>
 <29e766ca-54e4-453d-9dfc-ea47e2a1f860@linux.ibm.com>
Content-Language: de-DE
In-Reply-To: <29e766ca-54e4-453d-9dfc-ea47e2a1f860@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EJELElZC c=1 sm=1 tr=0 ts=68f74798 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=w4HzK-rsqA_2YikTyBoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMiBTYWx0ZWRfX8j24ejwHFVb9
 F2wIjL2oSQTN4WzBz8x+S+mSBTjDI5wQ8epCJHQMTbtcwJZFGvvXSK71SuQMre3/JuQt9V3vIQ4
 HqcOXA0J1jmQ3eaRnnhi3jdOU2OsdvbvHX2RevYDlrk687vDT2o9yelcXco4ek/pZ/EurTgNkeB
 82iL//vWaEM7Kxe7nIEPDHvIHDt4dLVOWihhZhAgrayMgl8JxHqYhwv2+ZqzSmsICQ3DSCmnUhb
 9gXxeZPZB6cqCGwHtmNVa7E6iFO9Bq2gcOLtKW8HWyYgEgl7nxU4Fado3fNSgNNDjIafOp6yUWE
 eLHpLRy+PgJFoj9VwRUkYYxpVaa2FsY862fDl3UijlUCiiRyx6+IFl0XYZGTTzlfC53E745j52x
 ppzGxl/1LeVGdU9qd07hy9mEGkP7ZA==
X-Proofpoint-GUID: R9cfW4_GrmPKJX5GD5hk9lL8OIjZ1tLv
X-Proofpoint-ORIG-GUID: R9cfW4_GrmPKJX5GD5hk9lL8OIjZ1tLv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_014306_593588_8D37E387 
X-CRM114-Status: GOOD (  12.98  )
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

Hi Eric,

On 21/10/2025 09:24, Holger Dengler wrote:
> On 20/10/2025 19:57, Eric Biggers wrote:
[...]>> - Risk of bugs.  QEMU doesn't support the s390 SHA-3 instructions, so no
>>   one except the s390 folks can test the code.  I can try to write code
>>   for you, but I can't test it.  And the s390 SHA-3 code has had bugs;
>>   see commits 992b7066800f, 68279380266a5, 73c2437109c3.
>>
>>   The first priority should be correctness.
> 
> Let me figure out, if me and my colleagues can do the testing for you.
> Unfortunately, I'll be unavailable for the next two weeks. But I'll come back
> with a solution for the testing.

I talked to Harald: we can do the testing for you on our development machines.
Please send new series to us or provide them in your git repo.

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


