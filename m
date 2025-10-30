Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69974CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eQjJmYkYH6SFeE+16nCc7H9e+jNOCRg1nbgStXINRw=; b=malLaCYUA184CJhSu8B56LfFYV
	jG3NH39CF4/lBZmCPMD0w7KB7M3hdZ7aa10xN/Nk9mJf7c7B9mUwB5N2Z0T2NiHvOLYoFNKYWWa1F
	Hw6+bF28U9o6rhQVHQbdG4EvA6YhaqrnMOvkrjwXNm/3wmDwI+ssPfDpsfjSXNKFmDzpqdrJJJQCE
	V9WrFSIsjEx7hMgDdRdGJnoFuMlMIOilVyxy/qLwvyoCDVSWjOlItGqyGKieiYnQILEXzaA6utI9s
	p1PNhD1eECnToVo+IKTfS5uuXwarMlcvD0KFwHoOy6dYhzCLdJT75DbkMHtKN1LvN6NhE0qIAi15h
	JnxMst4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENkt-00000003fl0-1yED;
	Thu, 30 Oct 2025 08:11:35 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENkq-00000003fkK-1Zir
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:11:33 +0000
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59TLn0RC025885;
	Thu, 30 Oct 2025 08:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=/eQjJmYkYH6SFeE+16nCc7H9e+jNOC
	Rg1nbgStXINRw=; b=cuJG1pZsfaDqquxCGrOzfAhNCTQ2ugViPxgZAEFflsoUC5
	dRVTCZoXoiNUjAM/QbiZIVkkXwJgCun0g33n8FboORMftxUjhON5UKvbkm9fn+g7
	4u3Z4rTgmQ75v+Pa9dLJ9AXhXofu7HyTLkZHoDXOKbKc3ghfOfzVcIfu2I4iBR4i
	hQLTwCE/xVOq5ufKUT84DQFKGICO4vF5uZ+LmljvCX/n6LIX4ukdbMWtIO/bT/+S
	antjD7qTt3JUxAeWP8tHw+l5ANqrvw5XwYsUO9UjLUNIeYTzVA10B9PjurDwNyOe
	bhZzp60OECuRQgEhgtCxz5qP6mt+dVQj8MDjWO7g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34acq8tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 08:11:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59U5qPIP027495;
	Thu, 30 Oct 2025 08:11:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a33w2qgcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Oct 2025 08:11:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59U8BGfP60686592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Oct 2025 08:11:16 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9644A2004B;
	Thu, 30 Oct 2025 08:11:16 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4775F20049;
	Thu, 30 Oct 2025 08:11:16 +0000 (GMT)
Received: from osiris (unknown [9.155.211.25])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 30 Oct 2025 08:11:16 +0000 (GMT)
Date: Thu, 30 Oct 2025 09:11:14 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Harald Freudenberger <freude@linux.ibm.com>, linux-crypto@vger.kernel.org,
        David Howells <dhowells@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Holger Dengler <dengler@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/15] SHA-3 library
Message-ID: <20251030081114.16837A86-hca@linux.ibm.com>
References: <20251026055032.1413733-1-ebiggers@kernel.org>
 <ba3ff3d5183ab78b3d02d8db30223def@linux.ibm.com>
 <20251029163216.GA1603@sol>
 <20251029203345.GA3750798@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029203345.GA3750798@google.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=XbuEDY55 c=1 sm=1 tr=0 ts=69031da9 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QzQn2ZgXezoNSR50NVEA:9 a=CjuIK1q_8ugA:10 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: YSIgbfw2sRFgOkhpdpHl13KDpANc36eI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfXx99/Np7suF0D
 LdNjxw8CMpQUQfWr5ceWx67gWngQfx6OwZL8VGJyQUoL7dj2TK82msPvqeMbboIBXSRD/hfHP5y
 CoByoCwcC0w3YSttYeDzqxehe1u3h3gypxQ/bh+vdb8OvyC7f72xwj+kNy0PQhdb6RB5Z61j6WL
 PzQwDYALi+yVz1E6maJcezSCOu+Jkm9Gby5uGlnF3vXFD58/R34oNDXwEW6+pSeCLJkvMAVKDqZ
 KiGrmSmTJel7FpX5dAewlh+98nvWv4EDR0ukEPAWQpo5G4zEKBMajDv+T6t//8lvJS7xWoqrIBb
 9/pg7l5aSGVgAOeLHkApb161ER2khS8yF9xp9nS1tcWdrPlVZ/6peqLtoJV6rpFFLVxvBfUGODB
 2uMVMMvEQ76KhoyBqJbaS82w/BUk5g==
X-Proofpoint-GUID: YSIgbfw2sRFgOkhpdpHl13KDpANc36eI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_011132_590754_00DD8C1B 
X-CRM114-Status: GOOD (  19.52  )
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

On Wed, Oct 29, 2025 at 08:33:45PM +0000, Eric Biggers wrote:
> (By the way, I recommend defining named constants somewhere in
> arch/s390/ for the different facilities.  I borrowed the
> "test_facility(86)" from the existing code, which does not say what 86
> means.  After doing some research, it looks like it means MSA12.)

Not so surpringly this has been discussed several times in the
past. It would have been easy if each of those bits would represent
exactly one facility, but then there is e.g. bit 46 which means:

the distinct-operands, fast-BCR-serialization, high-word, and
population-count facilities, the interlocked-access facility 1, and
the load/store-on- condition facility 1 are installed in the
z/Architecture architectural mode

Some proposed to add defines like "FACILITY_MULTI_46", which is of
course pointless, since there is added benefit for just using plain
46. Alternatively it would be possible to have a define for each of
them. But if you need two or three of them for your code, then there
would be several tests needed - all for the same bit, and each one
generating a static branch - which also doesn't make too much sense.

So in the end we ended up with the conclusion to stick with the plain
numbers.

That said, users are still free to add aliases like e.g. cpu_has_vx(),
see arch/s390/include/asm/cpufeature.h. It is just not an all or
nothing approach.

