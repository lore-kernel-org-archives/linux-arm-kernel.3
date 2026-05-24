Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5D1ECD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfCAtu9YjFvfjUfjXckwcd/pzB82MK5Peh4a9ngumRo=; b=UiyCUifsyb1dk29/XPepDBDabG
	wyumxUzdE+AzOi2OGZHnOeSpCK1nIJqv7GIvzKMh9XVnNoN0A2ZcDJrhDN8UfjsW8aSbd5TmzAT9B
	lcsM1LbpMXQOo7ZTX3Lv8h/ob+AGOCi/zJVscupFPNDMPTiS1oP6AVuGzKKG0FgP3w3NMJaeZ8jYG
	kSOuObbstXnt5PQoHmrOfovlYpkvjv0+azOUvqRGR3jLe2TNfu2XsS2dqCkeCiQQixnMVzQT8fKo/
	pmAXVIOqUZIs47UG7excJqxBLzwzLCwEGSFZ/OgtUZC5sazqgfIsXQcPw0tYQYBZ0AB8Apfvv0vgl
	H3JB4STA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBuv-0000000FIAb-2fhK;
	Sun, 24 May 2026 16:43:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRBus-0000000FIAB-3DrA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 16:43:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64NHIFSh1346800
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 16:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vfCAtu9YjFvfjUfjXckwcd/p
	zB82MK5Peh4a9ngumRo=; b=aC8AiQg/3zgWPCN4RPm2nA0QmIFWwQZENaHmsc5t
	Tsbu/QjF4LYwD0LQq81RVb2K+V5cERB1XqdtV73ZIwpOz5rnVqn1NBOPUBc2Eavz
	kc5mQ+yqyB1Yqk8Qhz2tFp/edMNe6LwxoSG+Dx6/7j7t3PDNinYxcmuQlaf0PcV7
	PGUU+IdL4KLjXfRQ20iFmkTnyQ/Bnq4KSdwbrQeIW2QfpTTB7HFyyi7kalI9wBeE
	fyjlmR/Un2Ch9ZWHclIzUg8hIgAMaSxRJgYFSlL0XpeQPcFsldZYGpgEaxLZP+VT
	m2ArzsBCd0UOBf/KA8HBbas3M86bSRLob9sxH3rrg0U+Vw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9kejr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 16:43:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6313cb80e7eso11318331137.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 09:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779640984; x=1780245784; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfCAtu9YjFvfjUfjXckwcd/pzB82MK5Peh4a9ngumRo=;
        b=MHtWKgkGlBG60xJ2HkAL78hZvsaDL4VvG1VT0LUdn/cdqkY+yjxgz9jhyEAV0G6s+o
         p6o16iemqKlmTt6Zm0PO1X5xFqZgQs0tDTl2pXzvQojqFijV3rMZWdnHe+6Y4sci8gUW
         Efa+lVUXNP/6REGSH1Z2Z2HXamhuoKt+fFDX3KCCyt2CVV4GkmVvAU/mDfzWSKQkSS+s
         B1Eb9XayZ0Xu+7bZ/Nywt/krZFkcCF0uqs0J4UunW2GyMBzTQiZKEmAEO3VvrDkq+01q
         SbKNOkx3KYraHh7KfweWFdJTuAHdwUaXCBU9rhrdQ9aItMI4t4GCKJ0/5ZF7LXOt+dbN
         ircA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779640984; x=1780245784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfCAtu9YjFvfjUfjXckwcd/pzB82MK5Peh4a9ngumRo=;
        b=BokHF8R9Z1DLwjL5EjR/+ubHoFuo0onFqpprm2m1JwWopkCuYoi3myZ4oar357oyW1
         /ywGdZHT9wzzROm41Ep41CilGZIw5RY12FK6zmYjzw9C7vG+JrKwD/xas/0ISAfvz1wp
         IXd6Gc1KwW3pfeTKMCQ0raiWjQrbB/a2iYkhQ7bfE+sw0pB5lC5qJA20hfzoPFRYmCZ7
         Npvp6K0f4PlfjSZar0+QYA/gmtR0OrxlyslkYBIQE3WDPZiYqoUc3Te092zeBkwFOkqL
         vIyXuIUOXzT/daZdFeILFS/XwisjMj+j80QhFqEPZRg9IAkGWrR1Jv30Q9Rvf074XyqE
         5YVA==
X-Forwarded-Encrypted: i=1; AFNElJ/W05vib3/FHAlhq3w65z8e8QFCy5A7h8gSl3OQs5gpqDcjqsy6OR6r6hl3d61WSW6tGddfmRWH8Nt0KZYitlcU@lists.infradead.org
X-Gm-Message-State: AOJu0YwwmsAUDVQjbLCxzsauR5BmIu3rQgC1pWGb3thuHkfyeTeVUZoo
	h86PjeXhIGK+IifJC8lz6UJzHnCp+2KSEdSb0qWV1CHgSS8lU6P9dQSUrxEsQn+Ofsw9FMN7jWc
	h5oL5Y7aW+m9FGopg9noF2vm8zpFmR4POGFnTd7zN+99dwylD8rw7b0IoE0LtTzzfVK9IhzPsx8
	wZ5A==
X-Gm-Gg: Acq92OFgOIdJCJ76P11Yj6XwNJBgzBi/CjNGNqoX6/gzmXQirrHT2C3c57u85i2Me+x
	6g3IWyS9bJ4KF6V3rE8Fw8AnsfUKDms5GGrpe8i0BiK3csVlE6GC2CGGSQYr/BmpOw3hL7r37Sn
	s4+yJmsC/TbQ11TnQlgrlTmYM3rF6bSHbi8JPzq2rmF/v9kd2KnthRWr5YMu3tVSt1cqVnjGs6E
	xItjVRHJQbvjOloZLP1vZ4bJw3KwHXX2PKVhU/W25URqPok9bOxLXXuDtKIPRvc7oL7kVHuBL1P
	v3doA5Nw8ZSrYxL/hh0UCg/uc28ThMQ5A0Dl0BiZne3W2yRo+syE5tyzbAfnDIBuHA+e00hzSgj
	AEr1YQ5ygVifuotOHqXcenWYg2KwsYizEU7RK14B1Hi6hbA7y8hZLMi44nFnlVvwLx5N3POJjQ8
	NEKkPahnrBU1sA2nIvmLAGBoVkZ2qbU4Fiask=
X-Received: by 2002:a05:6102:2b90:b0:610:db51:6f3d with SMTP id ada2fe7eead31-67c73e722cemr6301319137.12.1779640984365;
        Sun, 24 May 2026 09:43:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2b90:b0:610:db51:6f3d with SMTP id ada2fe7eead31-67c73e722cemr6301289137.12.1779640983847;
        Sun, 24 May 2026 09:43:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32ceb596sm2021962e87.46.2026.05.24.09.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 09:43:02 -0700 (PDT)
Date: Sun, 24 May 2026 19:42:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: demiobenour@gmail.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] crypto: Delete Qualcomm crypto engine driver
Message-ID: <7rgfuvv3hai7g4wt4accbkejtzdt5dnb6mkj6x7ox5sz35q4n2@h7j6rr7extuj>
References: <20260523-delete-qce-v1-0-86105cd7f406@gmail.com>
 <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-delete-qce-v1-1-86105cd7f406@gmail.com>
X-Proofpoint-ORIG-GUID: RMF6VJEK4nqz3DF8qbPEp8oMks9aY1pU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE2OCBTYWx0ZWRfX0Mme7a3R8+qA
 eZBtxTGJ3seLgijDOEXCZrp8a9jkALRebP3LYKFF60ENvJ3fm0niTpyh9vKbE0pAXwL1b7a59i6
 ZIOfw5TT2FrBtEeRXduu5Ej0sHf9SLIdsYMlvly/9ABXRcf4ZpfZ6d6lTIvU75kKX16mVmK9Mat
 eql8AQhtMTzTqSQlrIwpGDTBSt0IuDXmK7SkQ6z/4NBgV1YRuZVx4aCno0pfJ+YpmwJnNB1ybWf
 ZOZpuHt/ZewSaVrcp8bKArkiCbRZHSMOyiFhJxe1sUd8KjZBD7B1aFkPf5YvKvOOLjWqnCKW3h7
 gA12fuT2w0v1kScUZ1E+1Zg7twY9kbAQUjOfjV5SwSn3Kol9bYKgY/vhNTBzOuqOZFZDeF8PQpJ
 RO/BE8WL08TYIqnZJ9mwUWzfezlQ7qihQELBpfouBe8irqnahUeO7l7oFE97xr7hYEVvdWyjDlp
 QEJn2EjVlpqkaDJJ0Kw==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a132a99 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=f6XAlUmOwKfAZ5K3pb4A:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: RMF6VJEK4nqz3DF8qbPEp8oMks9aY1pU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_094306_820284_D231E3D4 
X-CRM114-Status: GOOD (  13.22  )
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

On Sat, May 23, 2026 at 03:03:56PM -0400, Demi Marie Obenour via B4 Relay wrote:
> From: Demi Marie Obenour <demiobenour@gmail.com>
> 
> It's slower than the generic C code and causes problems.

Which problems?

Also in the security world faster and safer are two orthogonal axis with
very limited correlation.


> 
> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
> ---
>  MAINTAINERS                         |   8 -
>  arch/arm/configs/multi_v7_defconfig |   1 -
>  arch/arm64/configs/defconfig        |   1 -
>  drivers/crypto/Kconfig              | 111 -----
>  drivers/crypto/Makefile             |   1 -
>  drivers/crypto/qce/Makefile         |   9 -
>  drivers/crypto/qce/aead.c           | 841 ------------------------------------
>  drivers/crypto/qce/aead.h           |  56 ---
>  drivers/crypto/qce/cipher.h         |  56 ---
>  drivers/crypto/qce/common.c         | 595 -------------------------
>  drivers/crypto/qce/common.h         | 104 -----
>  drivers/crypto/qce/core.c           | 271 ------------
>  drivers/crypto/qce/core.h           |  64 ---
>  drivers/crypto/qce/dma.c            | 135 ------
>  drivers/crypto/qce/dma.h            |  47 --
>  drivers/crypto/qce/regs-v5.h        | 326 --------------
>  drivers/crypto/qce/sha.c            | 545 -----------------------
>  drivers/crypto/qce/sha.h            |  72 ---
>  drivers/crypto/qce/skcipher.c       | 529 -----------------------
>  19 files changed, 3772 deletions(-)
> 

-- 
With best wishes
Dmitry

