Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0788DD29FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzHVxvE5ODBHsgsz8pyhe6cG5oMDjzw2x+Um2O9cGO8=; b=hegYyQjLZQ4SOgzpZI6Lab2sDA
	4y+x92YSZpXV+6QwV7/K2f0sOYSKcigK4fa4POYqRskNFaVy/tc7pTNBy6AflJXKvsNcGHZGd0/Y1
	MbOdJhJ5aFWJHqww9xQGhPszebHT8opdrpDTu3U9ys8ZhBexy2a3hSilXph9cLHUde7CsgileWbxa
	V0cRNt8+W4CIS/AGrgVqEIKMU2Kg4j9f2XSz9Bh1rW0RyH7vfQyYB1uKNazY7BAQovWTj5v2JRyqo
	NXWOp4oM4wdKJ7T60Hht584J5bTV9w9qbDM+D5Tdk6EVHlWSpv8GbKxeMoRJV0mu0jO80siN34SLk
	N5AqHXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzjm-000000097XC-0Oqd;
	Wed, 14 Jan 2026 12:12:34 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzji-000000097VC-2exu;
	Wed, 14 Jan 2026 12:12:32 +0000
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60E6dduV001269;
	Wed, 14 Jan 2026 12:12:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pzHVxv
	E5ODBHsgsz8pyhe6cG5oMDjzw2x+Um2O9cGO8=; b=lMJWfhbEbMAC0y/nZY42B/
	5YaagzgIChz+c+hXT+p0sPjrIsQKN01YUhffjjGLx0tcgLpD555fPceEiis/cMPo
	Ud+G/Q9qOY9L/BVKtJsa6PM7nPLQ2li2e5HZ1Fq0/wc1cTTUI/2bgTGdegdjgLMg
	zr8PcN7jyW7myFFQBc+mnSiZIqK3UBp2rwlFjaGbBtFtH75Enu8vC2GfCCWGS/lt
	IDWXQCvJxHqU4aNYABYn2I68yeuDhL+ER6cPDB/3djfxAenBiZERQZim3y2zwN62
	Q+vsqMpVm+LV40sb9OoEMQXKU2l8r41K+Yb0TalBh3Lydh2cRDmoTWd1RStYZX+Q
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkc6h91dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 12:12:23 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60E8Y3X7031269;
	Wed, 14 Jan 2026 12:12:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t1sjyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 12:12:22 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60ECCLDO44564742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 12:12:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3811E20043;
	Wed, 14 Jan 2026 12:12:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E59C620040;
	Wed, 14 Jan 2026 12:12:20 +0000 (GMT)
Received: from [9.111.193.9] (unknown [9.111.193.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 12:12:20 +0000 (GMT)
Message-ID: <f31a9a3f-ec9a-44e1-85ae-c0e0391ff0fc@linux.ibm.com>
Date: Wed, 14 Jan 2026 13:12:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/36] lib/crypto: s390/aes: Migrate optimized code into
 library
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Harald Freudenberger <freude@linux.ibm.com>,
        linux-crypto@vger.kernel.org
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <20260105051311.1607207-16-ebiggers@kernel.org>
 <167cbd49-e0ba-4b1d-a724-e64ab6ee863c@linux.ibm.com>
 <20260107203458.GA2200@quark>
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: de-DE
In-Reply-To: <20260107203458.GA2200@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0JISleG8ICtApQmeXiUHRBk2QsRrV-GL
X-Proofpoint-ORIG-GUID: 0JISleG8ICtApQmeXiUHRBk2QsRrV-GL
X-Authority-Analysis: v=2.4 cv=TaibdBQh c=1 sm=1 tr=0 ts=69678827 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=ZiP0gMQ4KlzIHEEEXi0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA5OCBTYWx0ZWRfX5A+i08xANtZk
 Fe+bZobRq26jJWk184c/YDGBQCyOVVLaLTd7R8/xRa2F7V2TV8Bg+SsBN/h5dn5SfGzmh/wYuz5
 w30g6R0CLgIL1jn/JcBYwYqbkxyZpkEfj16M+S4Affu9dsapUUHK0CVqv+IhI4UyQQIrYFEEB0Z
 3B9m8UtdjEXn9TKdLvp2EtGA7bwr8Alb3lyx1W8g1FvkDLqWZH8pNiHlGy3bUSdyIYaBBzJ6Ksu
 0hIrAA0Vz1lE+E3NgThKtT8Ny5YVbfRradjECMhYhDl9l3y2VMv+nwgy2ECrru+8J9islTgzfan
 nQJxf6ZdIBhgXVxQNe9ke1h11g9yU3MtkbRg2UKG439sbAXH7R/Fn6hMC6skQh5adHr6hOm9T9R
 /VzDc94a0vrwPKWt5A5rwL1Wgu+r0uvCX12NNuyZVH782uArTzidCMQGvU81ZBbcWtx+kFbgpbO
 RBT7auXbzpAuG57LgUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601140098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_041230_794924_00DB6C34 
X-CRM114-Status: GOOD (  29.01  )
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

On 07/01/2026 21:34, Eric Biggers wrote:
> On Wed, Jan 07, 2026 at 08:41:02AM +0100, Holger Dengler wrote:
>> Hi Eric,
>>
>> first of all: happy New Year! ANd thanks for the series.
>>
>> On 05/01/2026 06:12, Eric Biggers wrote:
>>> Implement aes_preparekey_arch(), aes_encrypt_arch(), and 
>>> aes_decrypt_arch() using the CPACF AES instructions.
>>
>> I'm not sure, it it makes sense to implement this on s390 at all. The CPACF
>> instructions cover full modes of operations and are  to process more
>> than one cipher-block-size (*). For single-block operations, the performance
>> might be worth than using the generic functions. I will look into it and do
>> some performance tests. If there is a possibility to plug-in to the level
>> where the modes of operation are implemented, it would make much more sense
>> for s390.
>>
>> (*) Yes, it's a bit uncommon, but the CPACF instructions on s390 can process
>> multiple block with a single instruction call! They are so called long running
>> instructions.
> 
> I'm happy to drop the CPACF single-block AES code if it's not
> worthwhile.  I included it only because arch/s390/crypto/ already has
> such code.  Since I'm making it so that the crypto_cipher API simply
> wraps the library API, if this code is not brought into the library it
> will effectively be dropped.  You had pushed back the last time I
> proposed dropping one of the s390 optimizations, even a fairly minor one
> (https://lore.kernel.org/linux-crypto/51fc91b6-3a6e-44f7-ae93-aef0bcb48964@linux.ibm.com/).
> 
> But I have no way to test or benchmark the s390 code myself.  If the
> CPACF single-block AES en/decryption code isn't worthwhile, there's no
> reason to keep it, so I'll remove it.

My assumtion, that the aes single-block-operation operation is slower in CPACF
than in software, seems to be wrong. I did some measurements on different
machines and it turns out, that it is up to ~2x faster doing it in CPACF.

So, sorry for the noise. Please leave your s390 implementation as it is.

PS: I have a simple kunit test for aes (KAT and benchmark for each direction
and key-size). I'll send it in a separate reply. Feel free to pick it.

> As for AES modes, later patchsets are going to introduce
> architecture-optimized AES modes into the library, and the traditional
> crypto API for those modes will similarly be reimplemented on top of it.
> This patchset just focuses on the existing library API for key expansion
> and single block en/decryption as a first step.  (As with the
> traditional API, single block en/decryption is needed as a fallback to
> handle any modes that don't have a standalone implementation.)

Ok. So we'll wait for upcoming patchsets.

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


