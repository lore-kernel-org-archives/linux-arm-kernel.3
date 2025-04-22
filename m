Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D950C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 11:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ro8c0oezTvm8771KKaPZnVmA3AEU40jiYFOCFR9Jw/c=; b=uLb0qDMjDntI8FYnSDBYgz9Z99
	0J646K6vWVGpzn01OGaPUz/fmSkYwENfD6PO9+EJLZQ2c/8l1h/0l86ti7k1XUeBGxYRzlArh+rR3
	OOXgmAuNFAW+jRq0VDTEHgSd9JrYPh+YlEvNUXPlZvaXRv+JAA73yNAVrVlP7Ef/qXS9kizc8/of6
	Y6XFV76c8fMehEnmAH1YhEiZph5QEddCNg81qzJ9rHtgGW5wUSMDpOYXJYLgRweKBhjjhoVrrzZVy
	wuDOmXg/I1lTabh3DwQZBxc9NZUr9I123rLb9DBGIb2vZbRTIHAz3Woo3CxUuMpFtMYt/E3Mx9EjU
	g+GAfVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Bal-00000006uH5-0Ax1;
	Tue, 22 Apr 2025 11:15:07 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7B49-00000006oHw-2rTu;
	Tue, 22 Apr 2025 10:41:26 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MA3xUA026063;
	Tue, 22 Apr 2025 10:41:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=ro8c0oezTvm8771KKaPZnVmA3AEU40
	jiYFOCFR9Jw/c=; b=GFIYQD3jNyV4b1ZIRFmL2QjAYDr4nWfOAo3Evk9/1z7zUw
	i15krz6qP9UFEzaHuv5mkDLKYDpfsVhqBAMaQeieDZBeHJLF9KYEQJph1V1MUccT
	eo8GGlJUxUGUSq77LDGRA9Yq7H1EP/Oe0PxjdugE7nTLqVyeDULRQQnB0yGxuIjC
	AWMUpTFBsI5c3Kad9kOO12WT5GavL7G5d/aVFt+zPtYgmvs55rJwKljPoJErZv0i
	1duIwLCevCnhkp6dqtAwYy+y/DmWvI4Ywr9xrwUmYUQamY7OG7S/OhekEf6q0FLv
	uIKHKR0Jmkoecy6pwQNqH4IPvjE/q44ZSK4TctUA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hg5qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:41:22 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7FejH015374;
	Tue, 22 Apr 2025 10:41:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464qnkjbfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 10:41:20 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MAfITR34407024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 10:41:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C44E320043;
	Tue, 22 Apr 2025 10:41:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E75A20040;
	Tue, 22 Apr 2025 10:41:18 +0000 (GMT)
Received: from osiris (unknown [9.87.146.239])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 22 Apr 2025 10:41:18 +0000 (GMT)
Date: Tue, 22 Apr 2025 12:41:16 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        x86@kernel.org, "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 03/13] crypto: s390 - drop redundant dependencies on
 S390
Message-ID: <20250422104116.24507A7b-hca@linux.ibm.com>
References: <20250420192609.295075-1-ebiggers@kernel.org>
 <20250420192609.295075-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420192609.295075-4-ebiggers@kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V7h90fni c=1 sm=1 tr=0 ts=68077252 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=1XWaLZrsAAAA:8 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=i5JU4SdIdlksGHhJ9uQA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: XSQVzYNRWO4K8dSJKrHUF-rfa72ff6Wp
X-Proofpoint-GUID: XSQVzYNRWO4K8dSJKrHUF-rfa72ff6Wp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_05,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 mlxlogscore=535 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_034125_724664_2EC51389 
X-CRM114-Status: GOOD (  13.55  )
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

On Sun, Apr 20, 2025 at 12:25:59PM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> arch/s390/crypto/Kconfig is sourced only when CONFIG_S390=y, so there is
> no need for the symbols defined inside it to depend on S390.
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/s390/crypto/Kconfig | 10 ----------
>  1 file changed, 10 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

