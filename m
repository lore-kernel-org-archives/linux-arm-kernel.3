Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C42C98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 00:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oxf/bzY2P61BCqevg2wInSVfof+9uK9KzXUbb4iYa7E=; b=X4oCFZiiUJnyj8J3CZHXsfzcct
	phwqHHnaV2++u7YQ3UchNUfgqfzngw3ZKvzvaEm47rq5byHcY2kx5NFnAgundIqJH8z8Cfzg6Rh4h
	z+7it3Qm4nU3q0Es9gofujS9tNhazWod2KidcK7dQbddw4n3hYnenwel6w/3QY5OtLHJwO3bTLNfi
	QGBEbFiuOZ3EtIdB9exjpvYoRUurNAzyoOuU8G0EXxSjYFByMkkeLLzxu/7/nM5gi0Y4Yt1j18/DY
	dRkIP0Phs0KpWXvoSE1cusujt5Z1q9ve0zAhpMpRtiH3xbLXb9KB/Py1996wrKCVryRdW1zuA+Lt7
	Ppeij96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tpC-0000000CSGQ-1cj6;
	Fri, 25 Sep 2026 00:30:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tpA-0000000CSEj-0t8T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 00:30:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OMPHQp3934739
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 00:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Oxf/bzY2P61BCqevg2wInSVfof+9uK9KzXUbb4iYa7E=; b=P76wGl9IagAiq66z
	2eVWkt5gKScEyoH6IEc5LKDqXNs71bWKfmNptmv38ekmGmu7RmwpyI5NtrieqwQS
	cqaqS8tJ096rBMDXM622NM358/UcNvcfGs4uZCG9YHP+3Ap0plsm232eBGFhqhkX
	IXSzJCFIpCpBejv+M+BTi42oPh7SdVS7ox23EZQX+Wxgjp/KN3NZe1D9Ppp9IQcP
	srKp6ngYvY2dbl5kHBU5ShT3bqa8Tnn4XoCaMNINkdLrIPP6WEQQWh+mDbYjzSLJ
	UBL8Dbnh9uDBCmUIKZ/ji0gn+uoMLIMG3zEq9UsSQTf5HMI286EScBcjOzAqDpSy
	BpcC+g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjk6vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 00:29:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-333543ac378so368819eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 17:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790296198; x=1790900998; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Oxf/bzY2P61BCqevg2wInSVfof+9uK9KzXUbb4iYa7E=;
        b=ZSqtSsRkqt6jcRZ3FhSThoeur4seNIi+DHA4peT5mdqgaIqSaCWDBnTcbC6PGhvefa
         5yNs+0FLUsis929QUR6xR7G0oqCkEIeHx85DtDDMAOZIq/f7LN//DEl6mKonPPH7PkQL
         NnEEk8Pis3/PbmKudK2bw3IHKHZeuTgVYDD7+fVb5EnqXe3D/z1FM4+nwrPA/ulSFTY1
         ybAeK21FmO/lbLHA3I9414h66n5Xeg50m3ayVJRn7N5Nm7dj3xjVQvBXyPSrV4kFWxMz
         MeINstIQdP4SQzskqePhvre74zR86Q+qEw9gOXp4T+SzIfnkOp71Gjk49JVfkc4mKtAU
         Aq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790296198; x=1790900998;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oxf/bzY2P61BCqevg2wInSVfof+9uK9KzXUbb4iYa7E=;
        b=e6O/ymfhd5X++p6Hmc8FLmjf/8SLWYd4AVAJRbbZ/VFOWwBP9q1KxO12DCROxlmo3y
         qESCo8Nv8TfX+Ud6j6BFwNzngibv3MnzxkSyyerrkcNa6tHGvr13mXEIT/ybbsIfqq/t
         PsNO//JPO2QMxjLReZ7IpwGBUtUHIHAJb2fUXsqY2bq8L1P+gkZCQtxhzxiYm8kVdbPH
         MwWWsBruFA5ttyQyg80viMY0UQHswqASYBNlZTzV0mrlmQvwasYDv4uQQ6WCMnHokWuc
         5vQVIf7siviCu4ZFBKw7bm9NoxXKuXUbcHrdTLTsBtZ6prNGvjN60GrfdylkteDNyRzZ
         VAtw==
X-Forwarded-Encrypted: i=1; AKwUvBxo+r7tavWim9p47kf6BbRYFOIDkhQAbO3yPUD1RkI02SP/gPhh1JQoL0HbWnfg69WmYUCKMvs9FjsQUihNJBlw@lists.infradead.org
X-Gm-Message-State: AFuF++kjYUtflFij5ADKneQG8VAnwmH9DU7lrsB5AR5coYzvrQzz6zZY
	YGq+4iP88EpTJv/H55nfaoIn/KueqpguzEU4ZxnmYPjBxqb4VMTa4WXomn/dYFArK9lAtsSstNY
	K0diFN3Z6OF8dLzGGu1VZ0slbE+1Ygn8V6D5cCjdFY8Z0w3bctq7SeqzU6D3E/5g//FfkR7r7lz
	afoQ==
X-Gm-Gg: AYBFou2F6+Y9dPKNA1uHYd8KnTwAdyzCqP3DdaNrVQGVrL6T1BYlGSK77aqo/gv5sAh
	ogG4DXoJoa8W32QGWhkr73agaSjxZeXYo2Qre6x/2/EBaEYvC27nNZAQ7sj34NZE6ezzSHN0GZQ
	27CGYhcRFkKhIYcmWw2acuJUr/NemEhP8th1AnwXyeTFSq5V6I5CYP4KfK+cX5MgrDERr6q+38b
	AQyl/aoP/M4riRb3Wua7RVztA+EF2dW5n1uGOYjPkUCBcc6Nphpq4SyEp12GLPSXg+PnO6ndjLY
	Hiy6foX5a5cwynDqqCRW7jMxxL3JU+siKsJXBPrAuvSnPdkpS6tNPcMPCf0kQHQtsh4NrvQhye/
	Zr8RQrwW8v2bzBTjAT9caXTq5VTOgeto8vmuN/6ys/2Rrli6uSPXwwrY=
X-Received: by 2002:a05:7300:c019:10b0:33b:c24c:47cd with SMTP id 5a478bee46e88-340035bf9d9mr3661183eec.16.1790296198047;
        Thu, 24 Sep 2026 17:29:58 -0700 (PDT)
X-Received: by 2002:a05:7300:c019:10b0:33b:c24c:47cd with SMTP id 5a478bee46e88-340035bf9d9mr3661145eec.16.1790296197403;
        Thu, 24 Sep 2026 17:29:57 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a5ecsm1889901eec.3.2026.09.24.17.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 17:29:57 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:52 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Ard
 Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, David
 Sterba <dsterba@suse.com>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Randy
 Dunlap <rdunlap@infradead.org>, Simon Glass <sjg@chromium.org>,
        Shuah Khan
 <skhan@linuxfoundation.org>,
        Nick Terrell <terrelln@fb.com>, Will Deacon
 <will@kernel.org>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Conor Dooley
 <conor.dooley@microchip.com>,
        linux-integrity@vger.kernel.org, Palmer
 Dabbelt <palmer@rivosinc.com>,
        patches@lists.linux.dev, Ross Philipson
 <ross.philipson@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Song
 Shuai <songshuaishuai@tinylab.org>,
        Suzuki K Poulose
 <suzuki.poulose@arm.com>
Subject: Re: [PATCH 12/16] arm64: drtm: Add macro definitions for DEN0113
Message-ID: <20260924172952.0000527e@oss.qualcomm.com>
In-Reply-To: <12-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
References: <0-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
	<12-v1-27d06b313981+8b-arm64_drtm_jgg@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 25B4ke778yTf9gMPGgJ-igAOpU6Om-H2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX//a8IQDElAAQ
 xgCuM0WKlHsXvspZb1KV71T/Rmm22jBG16B5x4lVz8vjsUnO5wzGb1lc8oqJ+Ar/c9NCny9s5D3
 iS18ECAwf3aj5rgJ4qinsmVqPOBkuL5l5ihNAwS5DX53gFQidyN/odb4rm4J+QOSt9FrPOG7+Ll
 +5hsFrNnYLzdLVNiGbIr39vbqsg83/dU9Pxj4NMK0PbnEygVEfiZnaE2gnmVGbVohz7DSyH6sXe
 4Oegi3b/+c0474I43htf7vTDKxo9t4EiIS9wMpR8/oxzBhsixH+a4/W5MzuUzCoqbDmWXqJag+l
 S1V/OJE8W6ur9ELR6i43kddfU6zUJry4+5UEryJhOWlELbLNb4bPnCECk2W5oI6JxVJc8X6rcQ4
 WHqsx79iyhU4zUtSlL0I92sqLEcoC6UYf85OPYKZjd9KCNHvvbTQiXoZNIrak0a+u1hzYxrOdDy
 iv6wVOPHbUB9AOW5eyg==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab5c087 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8 a=QhzypnB_sqCglQZzAf8A:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 25B4ke778yTf9gMPGgJ-igAOpU6Om-H2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAwMSBTYWx0ZWRfX1JGU7EQI+p4Z
 WuPBA0WLAcyaOHRPlSmmMMpqbvfItdUX6PDIbwQbrQ5UIqA+MraNWZelDxfB3Npo1aVojfXAfkh
 yizAhOETeAqk2/y8cgX2i4nwjlsUVpc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_173000_387400_C40298F3 
X-CRM114-Status: GOOD (  38.45  )
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

On Thu, 24 Sep 2026 10:53:15 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> Taken from rev 1.4b of the spec, following the SMCC register layout and
> constant names.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/arm64/include/asm/drtm.h | 196 ++++++++++++++++++++++++++++++++++
>  1 file changed, 196 insertions(+)
>  create mode 100644 arch/arm64/include/asm/drtm.h
> 
> diff --git a/arch/arm64/include/asm/drtm.h b/arch/arm64/include/asm/drtm.h
> new file mode 100644
> index 00000000000000..d6dd04a4ebcea5
> --- /dev/null
> +++ b/arch/arm64/include/asm/drtm.h
> @@ -0,0 +1,196 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/* Copyright (c) 2026, NVIDIA CORPORATION & AFFILIATES
> + *
> + * Definitions from ARM DEN 0113 "DRTM Architecture for Arm"
> + */
> +#ifndef __ASM_DRTM_H
> +#define __ASM_DRTM_H
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/bits.h>
> +
> +/* Offset 0x02 is reserved by DEN0113. */
> +#define ARM_DRTM_SMC_FN_BASE                                      \
> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64, \
> +			   ARM_SMCCC_OWNER_STANDARD, 0x110)

Another wrapper for the same thing. Now which patch set did I last
moan about this in...  RMM 2.0 firmware series.
https://lore.kernel.org/all/d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com/

This one at least does it via base and sum.  But that then separates it from
the spec?   That is sort of the case anyway because the spec has the full
number.  0xC400_0110 so I guess not too bad.

> +#define ARM_DRTM_SMC_VERSION			(ARM_DRTM_SMC_FN_BASE + 0x00)



> +#define ARM_DRTM_FEATURE_SELECTOR	BIT_U64(63)
> +#define ARM_DRTM_FEATURE_TPM		0x01
> +#define ARM_DRTM_FEATURE_MIN_MEMORY	0x02
> +#define ARM_DRTM_FEATURE_DMA_PROTECTION	0x03
> +#define ARM_DRTM_FEATURE_BOOT_PE	0x04
> +#define ARM_DRTM_FEATURE_TCB_HASH	0x05
> +#define ARM_DRTM_FEATURE_IMAGE_AUTH	0x06

Nice to have a mask for the 8 bits of the feature field.
Also nice to keep order the same as the SMC defines which would put this after
version.  That also puts it next to the values returned for each feature.



> +
> +#define ARM_DRTM_TPM_ALG_MASK		GENMASK_U64(15, 0)
> +#define ARM_DRTM_TPM_HASHING		BIT_U64(32)
> +#define ARM_DRTM_PCR_SCHEMA_MASK	GENMASK_U64(36, 33)
> +#define ARM_DRTM_PCR_SCHEMA_DEFAULT	BIT_U64(33)
> +#define ARM_DRTM_PCR_SCHEMA_AUTHORITIES	BIT_U64(34)

Ah.  Always love a field made up of a bunch of bits. Hard to define
cleanly.   Do you actually need the PCR_SCHEMA_MASK?  Might be easier
to just not have it?  I think you only use it for a print. Maybe
build the bits we understand from the two specific bits?

Alternatively you could use the spec style definition and have 
#define ARM_DRTM_PCR_SCHEMA_DEFAULT BIT(0)
#define ARM_DRTM_PCR_SCHEMA_AUTHORITIES BIT(1)
or similar and have to check them via a FIELD_GET(FIELD_GET())



> +
> +#define ARM_DRTM_DLME_DATA_PAGES_MASK	GENMASK_U64(31, 0)
> +#define ARM_DRTM_NW_DCE_PAGES_MASK	GENMASK_U64(63, 32)
> +#define ARM_DRTM_PAGE_SIZE		4096
> +
> +#define ARM_DRTM_DMA_PROTECTION_MASK	GENMASK_U64(7, 0)
> +#define ARM_DRTM_DMA_PROTECTION_COMPLETE BIT_U64(0)
> +#define ARM_DRTM_DMA_PROTECTION_REGION	BIT_U64(1)

Ah. They are at it again. Fields within fields.
Maybe could use some white space to make it somewhat obvious
that is going on?  Indent the subfield a bit more?


> +#define ARM_DRTM_MAX_REGIONS_MASK	GENMASK_U64(23, 8)

blank line here probably just to make it obvious going to a
different u64.

> +#define ARM_DRTM_TCB_HASH_COUNT_MASK	GENMASK_U64(7, 0)

Same here.  I vaguely wonder if it is worth adding something
reflecting the relevant feature ID to each of these defines
so we know what the are referring to?

> +#define ARM_DRTM_IMAGE_AUTH_SUPPORTED	BIT_U64(0)
> +

Maybe a comment for next lot to where to find them in the spec
- took me a while.  Table 9 DTRM_Parameters, line for
LAUNCH_FEATURES if anyone is following along.

> +#define ARM_DRTM_LAUNCH_HASH_FIRMWARE	0
> +#define ARM_DRTM_LAUNCH_HASH_TPM	BIT_U32(0)

I'd rather see them as fields and field value pairs but
can see that is going to get a bit verbose.

> +#define ARM_DRTM_LAUNCH_PCR_DEFAULT	0
> +#define ARM_DRTM_LAUNCH_PCR_AUTHORITIES	BIT_U32(1)
> +#define ARM_DRTM_LAUNCH_DMA_COMPLETE	0
> +#define ARM_DRTM_LAUNCH_DMA_REGION	BIT_U32(3)
> +#define ARM_DRTM_LAUNCH_NO_AUTH		0
> +#define ARM_DRTM_LAUNCH_AUTH		BIT_U32(6)
> +#define ARM_DRTM_LAUNCH_KEEP_SECURE_IRQS 0
> +#define ARM_DRTM_LAUNCH_DISABLE_SECURE_IRQS BIT_U32(7)
> +
> +#define ARM_DRTM_SUCCESS		0
> +#define ARM_DRTM_NOT_SUPPORTED		-1
> +#define ARM_DRTM_INVALID_PARAMETERS	-2
> +#define ARM_DRTM_DENIED			-3
> +#define ARM_DRTM_NOT_FOUND		-4
> +#define ARM_DRTM_INTERNAL_ERROR		-5
> +#define ARM_DRTM_MEM_PROTECT_INVALID	-6

Hmm. the spec I pulled from arm.com has COPROCESSOR_ERROR for -7. Maybe
include it?

> +#define ARM_DRTM_OUT_OF_RESOURCES	-8
> +#define ARM_DRTM_INVALID_DATA		-9
> +#define ARM_DRTM_SECONDARY_PE_NOT_OFF	-10
> +#define ARM_DRTM_ALREADY_CLOSED		-11
> +#define ARM_DRTM_TPM_ERROR		-12
> +
> +/* Algorthim IDs are defined by TCG, in the kernel they are TPM_ALG_* */
> +
> +#define ARM_DRTM_PARAMETERS_REVISION	2
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <linux/bitfield.h>
> +#include <linux/build_bug.h>
> +#include <linux/stddef.h>
> +#include <linux/types.h>

> +
> +static inline s64 arm_drtm_features(u64 function_or_feature, u64 *value)
> +{
> +	struct arm_smccc_res res;
> +	s64 status;
> +
> +	arm_smccc_1_1_smc(ARM_DRTM_SMC_FEATURES, function_or_feature,
> +			  0, 0, 0, 0, 0, 0, &res);
> +	status = res.a0;
> +	if (status >= 0 && value)
> +		*value = res.a1;
If status == 0, is res.a1 useful?
You have a helpful comment at the call site in the final patch but none
the less I have read the spec section a couple of times and have no idea.

> +	return status;
> +}

Thanks,

Jonathan



