Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 383C9D4662F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fn2sWs9rsdbV0vxeRVrjmzY9BmEC+XTCv1XXSHerLL8=; b=NPfhDYmwPRX6m2CQQkiOGfq20m
	iU4B73g6gDHV37Fdf28MoGzNNk/Uj/UVDeAhyF/U1Uihx522DMxaqhgRB5w8Ya8XZ8kYp3uS7Ot8g
	Y66bT/Ws7bwNtDdEmQe2/ubnZy1KghhZEoFxL2ub0JHVgwA/04Q5xO9zFjwrAlgI4xc2+NaGaZs1W
	IJcOXeH00p2jnSAfXGNv5Pq0ftDFd9Awt2PVaQT9YNjSchayhHFc62YQbuVPl2838ZgyxsjLVNAva
	8e3t3YK4EcgRKCjkOpHZJSgBkfr1vmByvj3N6Aer0aUCIwwZb6tu0139X2wd1pg+H52DyJMleYRQZ
	3ZnOfyKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVOC-0000000DFZd-3icR;
	Thu, 15 Jan 2026 22:00:24 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgVOA-0000000DFYq-1Duu;
	Thu, 15 Jan 2026 22:00:23 +0000
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60FHEjlW023973;
	Thu, 15 Jan 2026 22:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fn2sWs
	9rsdbV0vxeRVrjmzY9BmEC+XTCv1XXSHerLL8=; b=UhWJ1/AD1XNfi2W0E653MX
	rWZ+eYl1wyhuYHNXvRBwfqnQcJBJKmgA74Jf0/kUgkcmeHe/8SH7NJyLR8QZTf5d
	aOOI1LZEJrl6W61v8hK+vC/CK7c0e2LMKgEU9Ofk0672o5Dpv9Vakg9XGuol6vgO
	eARfjFasmy52XTIeOhomSw6z8EYo6++NggXM8w1EXcectmP+2Rlr5b1Xk+Fj8/nU
	pO7pK8Jl2szqf/da1q4WNVGbwL6Jk0mNl/sCr3e1np+rimYa7OBQGJxvLx6X93cg
	iK7o+oUuDtt+GjO1TLdfqg1ufeFKqdeYkot8h9G+F+JjU4cU87CpInckkGyjhN3Q
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6egeye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 22:00:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60FKkCfH014255;
	Thu, 15 Jan 2026 22:00:15 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm1fyjsh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 22:00:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60FM0DTZ60162344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 22:00:13 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37DDF20040;
	Thu, 15 Jan 2026 22:00:13 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D33902004B;
	Thu, 15 Jan 2026 22:00:12 +0000 (GMT)
Received: from [9.111.195.181] (unknown [9.111.195.181])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 22:00:12 +0000 (GMT)
Message-ID: <03ba58e6-0eaf-4970-8d27-ffe29bc9a7bf@linux.ibm.com>
Date: Thu, 15 Jan 2026 23:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/35] lib/crypto: s390/aes: Migrate optimized code
 into library
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, x86@kernel.org,
        Harald Freudenberger <freude@linux.ibm.com>,
        linux-crypto@vger.kernel.org
References: <20260112192035.10427-1-ebiggers@kernel.org>
 <20260112192035.10427-16-ebiggers@kernel.org>
From: Holger Dengler <dengler@linux.ibm.com>
Content-Language: de-DE
In-Reply-To: <20260112192035.10427-16-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6p5z8nBCPsT3_rpKVRy3lnJhFN25wKw4
X-Authority-Analysis: v=2.4 cv=LLxrgZW9 c=1 sm=1 tr=0 ts=69696370 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=w4HzK-rsqA_2YikTyBoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE3MSBTYWx0ZWRfXz5BoL5J7pcUU
 EZ3HWHibhHjFOAoKQCeCAZQZFMw/rVxT3IT4w9ASJsDdLE0sXatur5m8WX/gRMd2Mvjk9EaFY5D
 C/Y4bvVEpB3VqE2+10CoQfUpEs64m3duyFEDGkeNQ4xeUUr2AEUG0ynVzNXFgKzknUbAS2y45W1
 dA34Ek0N1Un5SPKN09kDdU7nbue+a4UqMMJjlQn3bIyoNUk9mRpfFnYqdetqw7Nw1y7ntYTzKNI
 BcddjFCun4THIVcuAjbj91UfZX3GenM7j++LCuimK57ylm2xCH1S4KQzxPnj6RsL9R2HbSYujVK
 uvRKRDYg4HGrPP/KnsIX8bLXU6I40Het/QKY/mhLxoOshgIjE4/phJIiOKwt/3Rw7wNztuDmfZT
 1Lr8WlCzPTGKSsXxJT+I/p/uJbjtxbpFvRqsk4x7QlvgLbabrSlm0K6nh/BMNn3NUmYgv/OZiLz
 uZY40rcvNmYBRee4FVw==
X-Proofpoint-ORIG-GUID: 6p5z8nBCPsT3_rpKVRy3lnJhFN25wKw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601150171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_140022_474136_B809A9AC 
X-CRM114-Status: GOOD (  12.10  )
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

On 12/01/2026 20:20, Eric Biggers wrote:
> Implement aes_preparekey_arch(), aes_encrypt_arch(), and
> aes_decrypt_arch() using the CPACF AES instructions.
> 
> Then, remove the superseded "aes-s390" crypto_cipher.
> 
> The result is that both the AES library and crypto_cipher APIs use the
> CPACF AES instructions, whereas previously only crypto_cipher did (and
> it wasn't enabled by default, which this commit fixes as well).
> 
> Note that this preserves the optimization where the AES key is stored in
> raw form rather than expanded form.  CPACF just takes the raw key.
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>

Thanks!

Tested-by: Holger Dengler <dengler@linux.ibm.com>
Reviewed-by: Holger Dengler <dengler@linux.ibm.com>

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com


