Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D735D39016
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 20:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VR1pGYu1k6kGYDP61Yy+ZO9r3dhq0yO0jV49pm2zIRM=; b=4Bbr4bK/httFHkmHBb721vbWYw
	sH5JdA3slBdaNRpwt6/xURRO0/nPRtqmEmFpAFE0rTiNZtjc0pLEt4Js9Gthc8UV7CbIC3s/zJKLI
	4QAIi+S4F7wc1BwuLm8Gqwcnp+hB1rguUtJil4vzYrm5Y5iXQtmrGr+lDYypAK6CNqv+XW4h56E0q
	8FzLZnSqe9MMAANQi3eDSToYwF88UyxCtflwoSuFck6POBaG5+M/H6JpU4m9gab27cxdSjK9M3srg
	hYy4sgD/isFRBaM1aEL+7f3NyxWedPjRV2zsQduaLXjwMx13wSBErTSj7Q2O+LSHJkXoYSK2RzomG
	oOR3wASg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Xq-0000000AdVG-2NYS;
	Wed, 14 Jan 2026 20:32:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Xn-0000000AdU4-39Eu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 20:32:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EDV15I3550683
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 20:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VR1pGYu1k6kGYDP61Yy+ZO9r
	3dhq0yO0jV49pm2zIRM=; b=a7xpqtydG761ASyzEx4bM7E+s9ss0qHEXHAmuHC2
	CgdekNrTTq31/OrjA7P4gy3rTeWLuReUSe1LIGCaZw5jI3dlYc7KoHP2IfCOeO9F
	GundZBnWePfjr/2JP/8gE1kZbuU1vd6NVGDrYm+v3uD2BXp4iKJWD+A/3Wh2o3GN
	8BTAhuhks4Y8QVPoSqhTSIwmNXIYCH8D9xxrdc93RzNR1H1jyl9QxdgUxTtJbAQH
	C2UgM21ZwHiwTnDIckHt8sdQN9C1aJvfdtp0whomyI1PkQRz/2ZsDUuRCefmhkGp
	LP2cYM1xKDdSNxcdGnFsyt2C8kH41EdWVkS4otmXRBqnNg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpc3jsece-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 20:32:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-122008d48e5so280522c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 12:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768422762; x=1769027562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VR1pGYu1k6kGYDP61Yy+ZO9r3dhq0yO0jV49pm2zIRM=;
        b=HIfEnZDfTxd9x35gZm5cLBdqTK+Ow0YVsSa6hmQGqrICKPZXMCj07dMkjaA/kCf2vw
         aig2Kr05U7DxhL6qqsE7tkvb6FReWTR1pCVrezpmnykmchAlrhJRmtWXohQrVj2iH9dv
         sivwRvOsg2sb89sRO5KxmeNGTas1TzRrBFPO9mbW2yXPwU5+34p9gxg2WxOZrWQa43un
         vXK1BFLpfFGhBnWrDMHSShiI1fTnP7ADaWqpyMUspueekj5JwX4MesofkqsBVsq298qS
         B8O6ihiCvlQR2CtuhBBgJUyjVjQ5qrZ95crEpIUcZACT5mzGDuemwDFExphNjhW6tPJc
         W4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422762; x=1769027562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR1pGYu1k6kGYDP61Yy+ZO9r3dhq0yO0jV49pm2zIRM=;
        b=s0ho/EE5NmW5UwBum7OPK0gxVuBTljB3d6/Xfn5hDPxYRdmi2FnpTAgTBwk2Gz8IFk
         Hawl0SdWc3bkLSFMgqDQONBgzsRkzIp6uzuRNx9izD558BouKhuLuq1KrtmNRUWK/caT
         BBRYmJaDl8sfH4MJWCRn5mecSAjMGHXcksSdvyuBYeBPzQRNsdERh9CIAbVSIm9j0SSb
         jR1KlFrbKaTeG9j55IAU3G5cfH8aQJSHlks0WZJkP39YOOazFkgcIPOMCfnfhasqiUc9
         5CPP2eQsvjq1UXMR9OvVyyxiSNvX6+wbaQc4HwwCPH5Ar+guzX0O92twzW4LXezXOwI7
         Tk/A==
X-Forwarded-Encrypted: i=1; AJvYcCVzrL8J3gtaPAIIRZk5lK8wtyWthsWkRm4L45AEhNNTC/vyVQQuyecD5/bh27rZMdvTlj/fGhX7Ub13h6kxDMQW@lists.infradead.org
X-Gm-Message-State: AOJu0YxSU0HF/l2D2Ttc9F01Yo4OkOO2i5OarGyOM5k3WJzGN0BGGGKI
	PG84wsLUUjmKSMHisrMtRzxWMTfphsrPMpjP3stNk0XR1Srnvfz3YR4b78hyLXTG/QYcv7a0IqG
	F5BeZoQqeixNELaS6A3/xrICU02J7sumQfg9epO4i5yHNncrPTfocvEqwF12rwcu+fgrK208WUg
	FNWg==
X-Gm-Gg: AY/fxX7J1rIQ/PHvaYt3cJLz2kUN7zXcuwTxYpCguAx5hE9ueaTZCPF9uKwCO6p0o99
	EDkm+bzEjTVFJxVRvSG3OfZk0yOod/eMEm2aokLRLR2ql5v6TEq31f4QxMS2kZuIBTQJVjY39id
	ukcjJ3ZvYQaUmrqxvlVOFE6gTPNCAtrXY6qS/tnYwLrz16Gm7R0nCQpLbOmtIhe8nmOBzQARrXe
	jXswMNGOoTNTXTzUSQmQGsV+qGGPjM8rm0BuqKOxDxs3Rrw8q/8ceFAg0zstseORwAJlKG004W4
	s6N+pL+3v/7vylflSIx9LE6ETwf5X6KVwWnPiDKLQxxSTzDzmFyBq3BjN3h2CIzlC/8/mRmO4mu
	IbDyBA7YfX9CMZOXARFM=
X-Received: by 2002:a05:7022:1e09:b0:119:e55a:9be4 with SMTP id a92af1059eb24-1233696e203mr3863549c88.0.1768422761967;
        Wed, 14 Jan 2026 12:32:41 -0800 (PST)
X-Received: by 2002:a05:7022:1e09:b0:119:e55a:9be4 with SMTP id a92af1059eb24-1233696e203mr3863526c88.0.1768422761394;
        Wed, 14 Jan 2026 12:32:41 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12316f2db84sm12807661c88.14.2026.01.14.12.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:32:40 -0800 (PST)
Date: Wed, 14 Jan 2026 14:32:38 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
        conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
        davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
        gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
        jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
        nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
        pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 4/6] virt: bao: Add Bao I/O dispatcher driver
Message-ID: <4rrof4lk2zxut63u7qwxlmygpslvq5owfraatbjq3sbybtac4u@2prxnxijartx>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-5-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107162829.416885-5-joaopeixoto@osyx.tech>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2OCBTYWx0ZWRfX9ritz+7Gi23w
 WhvDGvrMRo3gP/nLm2SyPHV5KsjEIFG5AGNQlYZY3D7cscLsW5VMNe0mOKyFKC25N4Pa3WXuAm2
 cEULGHPZAqSLqGe2oxmjtPGLg4DhO8+k3WnHKxI4OAE7WeUts81unGXjF5xr8htG4vs85XVfHun
 1veOtYxmLEtyaB+poBsdpM+XwWIGw1yvRUxRX9y8sE/NsbcDb+6iUXehEJYJ76vMuG+q4i9Y/78
 MIqPUmsC2mjnnVMyW91Oybmb1/rp0mhbT02j5Lzc+bxQ8Dqd298nFXzKvslDO51fOE06H7PYZX1
 jJBvbCnJewHZUSfqQXiNBCZ/O/DzBdZo/BZ+eXv4GvvaHreIgcGb7mKzqkJ1qtcVMuTt6FJlzpE
 NyIEjoSuzLfmoeTC4FHUsTR7qe3Co6eNsoDut/zYBd039jicaNPfLeTAkonvAI3Q/KZP/ikkbGP
 obsJs0SLKXFyEAT26Bw==
X-Authority-Analysis: v=2.4 cv=RLO+3oi+ c=1 sm=1 tr=0 ts=6967fd6a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N2YwmVq2Bvn80NP7DBUA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: 0pz96TjEjv41Zxrns8fppB_wWNMWxakc
X-Proofpoint-ORIG-GUID: 0pz96TjEjv41Zxrns8fppB_wWNMWxakc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_123243_819251_F4B727B2 
X-CRM114-Status: GOOD (  19.03  )
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

On Wed, Jan 07, 2026 at 04:28:27PM +0000, joaopeixoto@osyx.tech wrote:
...
> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
> index 35658f37e1bd..f04e6cd33fa9 100644
> --- a/arch/riscv/include/asm/bao.h
> +++ b/arch/riscv/include/asm/bao.h
> @@ -14,6 +14,7 @@
>  #define __ASM_RISCV_BAO_H
>  
>  #include <asm/sbi.h>
> +#include <linux/bao.h>
>  
>  #define BAO_SBI_EXT_ID 0x08000ba0
>  
> @@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>  	return ret.error;
>  }
>  
> +static inline unsigned long
> +bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
> +{
> +	register uintptr_t a0 asm("a0") = (uintptr_t)(ctx->dm_id);
> +	register uintptr_t a1 asm("a1") = (uintptr_t)(ctx->addr);
> +	register uintptr_t a2 asm("a2") = (uintptr_t)(ctx->op);
> +	register uintptr_t a3 asm("a3") = (uintptr_t)(ctx->value);
> +	register uintptr_t a4 asm("a4") = (uintptr_t)(ctx->request_id);
> +	register uintptr_t a5 asm("a5") = (uintptr_t)(0);
> +	register uintptr_t a6 asm("a6") = (uintptr_t)(BAO_REMIO_HYPERCALL_ID);
> +	register uintptr_t a7 asm("a7") = (uintptr_t)(0x08000ba0);
                                                      ^ BAO_SBI_EXT_ID

Using the experimental extension ID space would be fine for an RFC, but
this can't be merged until an SBI implementation ID for Bao is added to
the RISC-V SBI spec. Then the Bao EID would be '0xA000000 | <Bao-IMP-ID>'

I think we'll also need to discuss whether or not firmware/hypervisor-
specific extensions are exempt from all rules in chapter 3 of the SBI
spec other than a7 being the EID. If not, then this function should
just call __sbi_ecall() and the Bao hypercalls will not be allowed to
modify any registers except a0 and a1.

> +
> +	asm volatile("ecall"
> +		     : "+r"(a0), "+r"(a1), "+r"(a2), "+r"(a3), "+r"(a4),
> +		       "+r"(a5), "+r"(a6), "+r"(a7)
> +		     : "r"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5),
> +		       "r"(a6), "r"(a7)
> +		     : "memory");
> +
> +	ctx->addr = a2;
> +	ctx->op = a3;
> +	ctx->value = a4;
> +	ctx->access_width = a5;
> +	ctx->request_id = a6;
> +	ctx->npend_req = a7;
> +
> +	return a0;
> +}

Thanks,
drew

