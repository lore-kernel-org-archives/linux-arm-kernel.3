Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5723C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 21:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z80fGZcv6BPIL4REfzCrI6RcJShWmT49WjhJXMKxxOU=; b=R1yhOPYMHlhWCPrnA31c2fyGvN
	oIzIhRL7XN9Fqj4/dHzAPkgqT9Pih7/GKP04Pq9FEQ3Gsj/CcvbKHtKnYygl6iDPlqOQ1cot290CX
	Fz9BPX+x/ITyP4xXzZTr6nKJc67QjygbpOia0ZqastxYq0SvLoUMZnnNyy73tkFSd+caUCXfvH9VH
	Nx2ZrIfVYxRvmD5a1IeMLjAaEuO0oUMWSEbQ/hfGEfPZ2PPAR6trqetieJo2dbC20r1LEkaRaKNHO
	oJRrrnPufCH+wxG4Qz+1l2F8U7ugWkekpSG17e2Zro/qo9yEREZnAnUhLRWyoBW2uEbuWkChqJyzE
	nK3kMKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8leM-00000003TVt-3IFH;
	Mon, 21 Sep 2026 21:34:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8leJ-00000003TVK-1bnU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 21:34:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKeuSx1565145
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z80fGZcv6BPIL4REfzCrI6RcJShWmT49WjhJXMKxxOU=; b=bIzBAr5/YZDrBmax
	l1lrKwqt/AXF2k3S8USImZugoEgOGjaM7BeHLt/wgHvoz7eSgHPGcmF/GnQ7hKWw
	AVXxXIpaoMMm7xQex8VmfUTelZ8DLkpTOYg07K1uuNJziWJ5/B850e9jvzpkX9M2
	pwTdNHrRtkT9vJ2oGhKQdHlAxZe9b1cEb1kjnGj1JfQ5Yum1e018V7QG3SzMurdZ
	qYBpZL7EjftEzedXWYubyG0HHB/uHSMgmSZraBPpTFk28q2fzcvYi1lEM+EtWJJu
	jyBC0lCVWmE6/ZqI2+sGqlJRoDpTc9G/FJJoJO3kliDc8dcpTXxBoBtNX0fRuwuM
	x0giwg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu17gu4by-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 21:34:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3dad7ab3so4647636a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790026446; x=1790631246; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z80fGZcv6BPIL4REfzCrI6RcJShWmT49WjhJXMKxxOU=;
        b=U+e9NgFR0pl+nL8LLoCWt/gkXg3awKhdpnd4f3fc0N4zn8I9wWPdUIHSCq4K4DjNuh
         cugD8bco8lcc0jte+zTvLv0RzCjokuwrJuuI3hvevMYg66KnF3vDJLhHcX44/ON4e2ut
         fA5vybu+CK2gNl/es/4vLkx+oUVjB559Wls2J0VUsOSpsGfT+lun2J4Ilril8fS6UD/1
         ncDcY0I79v+3uoyYuFxyQTOGDE8ZE0+Zs3oVLmA6/76fiJTPVaw6Ywp3VcQlAWeUQKqq
         lCOl1hGKfEwMm0oE/cAYg6bePm71xeo1f4grLi4StJy6r1uTY3pzyUqV6sUn/zh8BeoH
         q5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026446; x=1790631246;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z80fGZcv6BPIL4REfzCrI6RcJShWmT49WjhJXMKxxOU=;
        b=KF08RUid3PRV25w04Su0VcudtMEVAeytyAzKmmPV03sz1Uqxaytn0l9GCPXbhjwEC6
         fBvZ5ZQheDVWOA7ku4jmGdR079/F4Cyx5ANXh0RtYbiX8Y8yQMWEaOOLG7QSNwZBwA2h
         dTJUk9ibz0Hv8NpEn+SDsVTHOhGiIdgYLn6WjBVAFGeNFynurJt0bpnwbXobhd3SaeQe
         9y+p4tdRDsCq9tl3jEtPwpvP5tzhbiJGW3NPNWrTIvobUNHS/H6rhzO+bXxMyKNwETq5
         aogybK68DEGTY7PLZ9LbYRdrmCksY7hKUFWMKswzvDvvmOVfVnzqBFzr+aG6H0NM1qcq
         P1uw==
X-Forwarded-Encrypted: i=1; AKwUvBySnBOu9H0ySTkXa0KUsQI6deZYYTw3w0fZfYuidZnVb9+9fc69jeC3mmYkMhwDlpjfTZg+8et+UjPUBh+xxKFo@lists.infradead.org
X-Gm-Message-State: AFuF++lHwBuEMeGyDeh+Jh/wsALWn9dOYEsg7aquaogmvgv8o5qO2dJm
	UZlenTJN+LIeamsD0sknRRF2RsBKweMssGqL/ePZT9LYpms5S5ct5n9dlVWYuRpRL/x0T2xFyCp
	8ojjO+lVUpGceKN2VLR0TlOdDqDFSTd/dUPqqLrUVVuxeu3tiQ8E+rE2lUfsCY9EWPiRhYQD6sg
	FLxQ==
X-Gm-Gg: AYBFou0w7gvx/xmK2G353/8H2Cf0u9Y4gNiXZIkUDIuJVK3IDp33ycGtKYKtHdfx0kW
	pcWED4MuW94Uz2hsGzQM34HcOIrtoiUcv9hFtUA/TRN9vfGvLiGg1Zr3izN+ajMZgWfZS+hKtlY
	RAkEtqjSTS397SNDDyZym11LMQlIxbCLNSMvswMZWOmaZbm95+hU48ZW4Fgckqjv6HsWJVIEbHu
	XeO2HbHxQdKPrWXrd9zpPGclZ5dimWaZ7rK4JEGzl3kfhKHVSL++lsJTOT1ZlAWvNAjultQxKYk
	ygAXBjKtPosdQCtH+lQjuYNq7cyl6nmwKat3leKEoAdaeZYj36J+L5XdBvBcU4jpX1JPbHkuvPw
	h0O0+Aly/kb4reoDnARpyEd90jQ==
X-Received: by 2002:a17:90b:5187:b0:39e:6c6a:2095 with SMTP id 98e67ed59e1d1-39e6c6a22ecmr10542566a91.54.1790026445918;
        Mon, 21 Sep 2026 14:34:05 -0700 (PDT)
X-Received: by 2002:a17:90b:5187:b0:39e:6c6a:2095 with SMTP id 98e67ed59e1d1-39e6c6a22ecmr10542536a91.54.1790026445395;
        Mon, 21 Sep 2026 14:34:05 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02625615dsm5648638a91.2.2026.09.21.14.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:34:04 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:33:52 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 1/7] firmware: arm_rmm: Add SMC definitions for
 calling the RMM
Message-ID: <20260921143352.0000014a@oss.qualcomm.com>
In-Reply-To: <d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-2-suzuki.poulose@arm.com>
	<178978126540.2352296.16845657485139032765.b4-review@b4>
	<d7ccaf22-5bde-4344-8bf0-a5a17dcac0f3@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zi74MTB23-mcc3Yi8d0g87UbgTcf5UM7
X-Authority-Analysis: v=2.4 cv=IewSymqa c=1 sm=1 tr=0 ts=6ab1a2ce cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=7CQSdrXTAAAA:8 a=PlCZfVOHbWhc7nwO5CYA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfXyPxLE9aYASdg
 DJqJeaiqdpBnyZFXiiXbag2KwMuSE/UfGa8ABsE4wNWWpZJeNRyD7yzgYElJ2siyClPEeTNv/jA
 hjRX5vZ6kk2PEO0pOWPcYv3NMRCZW3hRPETCko0nMQI/IlWNJh3ZtVCR6ZZBsW61+gr3II69ljM
 4z0wegwxzfEmIjpcPfB1sMCvxq2ziSXWIlSFQC8oyPPfLFoVrpYc+u09wwmd0//OSTuBEl7yfny
 AHBwdRd9jm3qIOu+vxuXSjxcgpNv5NnBr/AWhqYDXWthcb7wQkW3W6gjPREInIoW9D1DrzlAzbV
 0xNgAP7lxFW9O3gv+2sb6WwAGnq9HqznLnS00PfoPEXokMVlWtQEzSDEbi0LYC3B+qMGMEKY87/
 F/8x0XF/MRUogxpecUku9UekVpr86Pe5k/uWb+pz819/n5trogdkJ+T4+BG5xf2I73hWu7WAOEs
 hKWYLfikTQR8iVzxH9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMxNSBTYWx0ZWRfX8unkxTvE+j2G
 hQZRutbhAFM2S6BrcwIBnl1LnuO3r9oq6B+WGmJNhRA+g6N7OVLSNT1IMUa4X7TAGJBPeFMto8G
 ipTWt87nfODxGWBVzx0zBj2GLEdCkWY=
X-Proofpoint-ORIG-GUID: Zi74MTB23-mcc3Yi8d0g87UbgTcf5UM7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_143407_442528_1A148793 
X-CRM114-Status: GOOD (  44.92  )
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

On Mon, 21 Sep 2026 10:27:46 +0100
Suzuki K Poulose <suzuki.poulose@arm.com> wrote:

> On 19/09/2026 02:27, Jonathan Cameron wrote:
> >> The RMM (Realm Management Monitor) provides functionality that can be
> >> accessed by SMC calls from the host.
> >>
> >> The SMC definitions are based on DEN0137[1] version 2.0-bet3
> >>
> >> [1] https://developer.arm.com/documentation/den0137/2-0bet3/
> >>
> >> Signed-off-by: Steven Price <steven.price@arm.com>
> >> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>  
> > 
> > With Gavin's nitpicks and the GENMASK_ULL() from sashiko, just a few
> > comments inline.  Mostly on subtle inconsistencies that really don't
> > matter that much.
> >   
> >>   include/linux/arm-smccc-rmi.h | 497 ++++++++++++++++++++++++++++++++++
> >>   1 file changed, 497 insertions(+)
> >>   create mode 100644 include/linux/arm-smccc-rmi.h
> >>
> >> diff --git a/include/linux/arm-smccc-rmi.h b/include/linux/arm-smccc-rmi.h
> >> new file mode 100644
> >> index 000000000000..214d6228dfc2
> >> --- /dev/null
> >> +++ b/include/linux/arm-smccc-rmi.h
> >> @@ -0,0 +1,497 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Copyright (C) 2023-2026 ARM Ltd.
> >> + *
> >> + * The values and structures in this file are from the Realm Management Monitor
> >> + * specification (DEN0137) version 2.0-bet3:
> >> + * https://developer.arm.com/documentation/den0137/2-0bet3/
> >> + */
> >> +
> >> +#ifndef __LINUX_ARM_SMCCC_RMI_H_
> >> +#define __LINUX_ARM_SMCCC_RMI_H_
> >> +
> >> +#include <linux/arm-smccc.h>
> >> +#include <linux/bitfield.h>
> >> +#include <linux/bits.h>
> >> +#include <linux/build_bug.h>
> >> +#include <linux/sizes.h>
> >> +
> >> +#include <asm/page.h>
> >> +
> >> +#define SMC_RMI_CALL(func)				\
> >> +	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
> >> +			   ARM_SMCCC_SMC_64,		\
> >> +			   ARM_SMCCC_OWNER_STANDARD,	\
> >> +			   (func))  
> > 
> > Obviously it is v18 so probably a future thing but nothing about this
> > is RMI specific.  Could be used for ARM_SMCCC_TRNG_RND64 for instance.
> > I'm not entirely sure what we'd call such a macro
> > 
> > ARM_SMCCC_CALL_VAL64_STD() maybe?  
> 
> ARM_SMCCC_STD_CALL64_VAL() ?
> 
> But, I would leave it as a wider cleanup in the tree as a separate
> series.

Ok.  A follow up would be fine I guess.


> >> +
> >> +#define RMI_RETURN_STATUS_MASK		GENMASK(7, 0)
> >> +#define RMI_RETURN_INDEX_MASK		GENMASK(15, 8)
> >> +#define RMI_RETURN_MEMREQ_MASK		GENMASK(9, 8)
> >> +#define RMI_RETURN_CAN_CANCEL_MASK	BIT(10)
> >> +
> >> +#define RMI_RETURN_STATUS(ret)		FIELD_GET(RMI_RETURN_STATUS_MASK, ret)
> >> +#define RMI_RETURN_INDEX(ret)		FIELD_GET(RMI_RETURN_INDEX_MASK, ret)  
> > 
> > What's this one?  I can't find anything in the spec that matches it
> > and as far as I can tell you don't use it in this series.  
> 
> This is coming from RmiResultDataLevel. See RmiResult type.
> This was renamed after we introduce the RmiResultDataIncomplete.
> It is used in the KVM code to find the "level" where a command
> failed/walked.
> 
> I could rename it to RMI_RESULT_DATA_LEVEL() ?
> Similarly RMI_RESULT_STATUS instead of RMI_RETURN_*

Yes, that would make tracking it down easier. Thanks.

> 
> >   
> >> +#define RMI_RETURN_MEMREQ(ret)		FIELD_GET(RMI_RETURN_MEMREQ_MASK, ret)
> >> +#define RMI_RETURN_CAN_CANCEL(ret)	FIELD_GET(RMI_RETURN_CAN_CANCEL_MASK, ret)  
> 
> > These are obscure enough to find in the spec I'd give a comment just
> > to save the sanity of anyone looking for them.  
> 
> As above, they are really RMI_RESULT_DATA_INCOMPLETE_*
> 
> >   
> >> +/*
> >> + * Note many of these fields are smaller than u64 but all fields have u64
> >> + * alignment, so use u64 to ensure correct alignment.  
> > 
> > Obviously this is only going to run on arm64 so it's not critical, but
> > more generally u64s aren't always 64 bit aligned.  So if you 'really'
> > care aligned_u64 is there to ensure it.  Meh, arm64 so fine.  
> 
> Agreed, I am worried about the churn in the consumer code. Also, like
> you said, this is only for ARM64. So, I would pass it.

Ok. A tiny bit ugly but x86_32 adoption of RMM 2.0 is likely to be minimal :)


> >> +
> >> +struct rec_params {
> >> +	union { /* 0x0 */
> >> +		u64 flags;
> >> +		u8 padding0[0x100];
> >> +	};
> >> +	union { /* 0x100 */
> >> +		u64 mpidr;
> >> +		u8 padding1[0x100];
> >> +	};
> >> +	union { /* 0x200 */
> >> +		u64 pc;
> >> +		u8 padding2[0x100];
> >> +	};
> >> +	union { /* 0x300 */
> >> +		u64 gprs[REC_CREATE_NR_GPRS];
> >> +		u8 padding3[0xd00];
> >> +	};
> >> +};
> >> +
> >> +static_assert(sizeof(struct rec_params) == SZ_4K);  
> > Whilst the assert works and is need to prevent oversized the
> > dos never seem to provide any indication of the final trailing
> > padding other than indirectly and I don't like maths on Fridays ;).  
> 
> Agree it is a bit obscure, but ...
> 
> > Maybe union the inner union set with a u8 [SZ_4K]?
> >   
> 
> That doesn't help if the other one runs past SZ_4K ?

You still need the assert so I guess that is already providing
the documentation indirectly so indeed little purpose in the
extra union beyond removing need to have magic padding in the
last element.  Mind you not obvious what that last pad should be
if it wasn't just 'the rest'. So, I think this is fine as is.


Thanks,

Jonathan


