Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827BDC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TX5xEsN7qCQIDoopBpS4rzgxnoxv1TE/SIlS+HozpQQ=; b=HFDlIT7WqdDIMZ4YX4s/8SHJZJ
	gholSJxDKUIkJiiZ+ExGEUQZ9xbsKCF0Dsy3lggOCwYu165ettx31lGE3+HSfhzQGC/p3rLmJuBkL
	AoWyA9GqfmeG7URnRNeEbPfWywR3e1Zsum4zBiblGoDIoKcWi629+nssu1vFILT7MJv2e6+Z1lkBR
	funEd4JtKaiTj7qjt8COP52NgAgBmg6GwjT9yDCexaidH44Vg/dTQjYoBi5B0FBpDRHJTl46UA6H3
	PiYj/jKgKNtRfU8bu7QRNswc0aNnlF4X1vo7ZdS0Hf8w372N6p6Iu1532NB5Vkwy0TkXMvTBUeBJ+
	KgXNGzog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jse-0000000FCYX-3yym;
	Thu, 10 Sep 2026 18:52:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jsb-0000000FCW1-2Y5M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:52:16 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AIRnAh2322437
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 18:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TX5xEsN7qCQIDoopBpS4rzgxnoxv1TE/SIlS+HozpQQ=; b=gH/QsaNew8fS9YD3
	aaeGAtD0VvU7vFgRWpaDiASb1uzIfqLDaNBkBzDVlG4/VrWhKIGtcqrmTBJHQDyr
	mDgwG6CZ6S+X8bzauacPhlh/ngomTg6pptt7OhCYtuAiTv5A3JqEsKENZ+A15FwO
	sjn2mQi8eBkaHn2dMkVk04pCt0qblHhAu1RahJRpUZaYj3V/TvI8fAEoCm1fc8ae
	aklzVnAtWJDpipHIcRjbJcY3hcNjbrBECdGJWmSxLkw/QCN+McRIsczCk6ap2QVm
	N9BZWnqyyVj7ZjRKpTmEKcB/z1f4jr9ms9B5nDwMuKUE9gqPR6FOH9kMf0cytwwN
	z5RP1Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvu5bv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 18:52:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso1538257a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789066331; x=1789671131; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TX5xEsN7qCQIDoopBpS4rzgxnoxv1TE/SIlS+HozpQQ=;
        b=Qxl/atbOAm0Ov3eLDsq9m9Z8rOanMJYVWxhqZt0aPyQxFFK45Uq/U1oI/rdkyrLzpt
         TLsw5dk+Vb390js8LKSr33J12cXJfjAdFstjcs1BxP2jkgg+NWCK938prxggsRBRFjsK
         BU/5O7VquVSo4cvgCxIsuzsBIRCwfi+jPNzE7R/OhaOw1byP3oCcbiqThP1wYSi7ew3b
         ZdXPZL62jDIDmLLeebXibetaKFyWQrabOONA3Y8qG0OoHuL7LM6kVOwRTWb1OlYPzny1
         N9EKz8NApkr17SwI5lZ2JCYmwpbnMpcSGaSHIEjz57ICSdkB3sPg3vLRkvAzEel/PdbU
         FwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066331; x=1789671131;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TX5xEsN7qCQIDoopBpS4rzgxnoxv1TE/SIlS+HozpQQ=;
        b=mOCA94HHU2vJzokpBGhU9dCK+ghoAnBPLPaDOG+VHzaiRjEYAlFj42gvnCOw8xWndr
         B0QZW+IwlKDpvUA6lEuLm2z5pPGFkoc6wSEsinVacwz+aSb6SkHmasbMm3iaF/xobaMF
         h91mBVHdG6pEtU8H3RyLd6EHWCJU96G0w8kcl+m3p7GEKa+m3HcF/5E+vLHBMB91H3wU
         rQ2XYnuoIfEVMAILLfU/vxMR9fmZf/HSgZ61jtmhJr2eTjYiZx0FtXXSwVOLXdhO9uqF
         3j2Mq1vfx7tmlishNQjDOyCNd8Ryz0z354+wnJQW41L7yOvifgTrkwJpnNvGH50w97qd
         J1yw==
X-Forwarded-Encrypted: i=1; AKwUvBybaTCCbW2ll1fJznqehKlui712gbv/WJVAlOpsMNr9J/EqGoEaNLZyc9o7TDUjQA66cxL0j73GEVf+NeD/1a6/@lists.infradead.org
X-Gm-Message-State: AFuF++nEe80+zFM8IYLRhTEnRd6MTbpi3ZDP83vPhc6nAUlIyDmJ2NFP
	zk/dhlVhs6cvQXNXkamSDjoK87nEz4SUbrhXyjasG99DT2gWLEOQW0pSAh6XJb17Ds3z7KPsG7h
	m+150xckq8aijmZt9XS/p4lglLIR7nsaYEGTBHa6r5jPsSDOrQLawVuxZe5PjsUJduFUnVNmh1e
	NCgg==
X-Gm-Gg: AYBFou3PTju26CxLSQFFHP6k+ZB2d/TMUBBc3hCSQoAfZeQ1Nz6B75ca2MhJQJJK+Pw
	JxO3pH0LvbZ0UIpVCCE3DtGlnJnJsIHS9nqbwcSMB21U3iw6u8r/9tRSPt6FycIA1iMcHxvlKcV
	L4fphwHFbONaIg7qXQKbLpsp6DlaxGLQgRMo693RgXwsWGa2aEIOtOIR/LCeTmKzAEU6wlUaKkx
	XcSEnJa2uDKl6YpQzaMzPT44LfxVpK9ugdLbLotPL8br8tLqC6usUG1+vS1K4StVcDmJtA6GwgN
	6jEIki8nDaN7wxdMZjWUK6diDMHjqjA4fGoy7fxcvubFyGsT7gwQhzMsq9TEIs0wDUq3NfMtnSn
	DIzqcfCyoe3KCFl+m7vCeDLPqmms=
X-Received: by 2002:a17:90b:54c6:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39d779167ddmr7340983a91.1.1789066330756;
        Thu, 10 Sep 2026 11:52:10 -0700 (PDT)
X-Received: by 2002:a17:90b:54c6:b0:38e:9784:dd47 with SMTP id 98e67ed59e1d1-39d779167ddmr7340943a91.1.1789066330283;
        Thu, 10 Sep 2026 11:52:10 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm893525c88.12.2026.09.10.11.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 11:52:08 -0700 (PDT)
Date: Thu, 10 Sep 2026 11:52:04 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Srirangan Madhavan <smadhavan@nvidia.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@kernel.org,
        conor@kernel.org, jic23@kernel.org, catalin.marinas@arm.com,
        will@kernel.org, treding@nvidia.com, jonathanh@nvidia.com,
        bence.csokas@arm.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] cache: add SMCCC-backed cache invalidate
 provider
Message-ID: <20260910115204.00005a79@oss.qualcomm.com>
In-Reply-To: <20260910082142.1522865-3-smadhavan@nvidia.com>
References: <20260910082142.1522865-1-smadhavan@nvidia.com>
	<20260910082142.1522865-3-smadhavan@nvidia.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa2fc5b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=Ikd4Dj_1AAAA:8 a=VwQbUJbxAAAA:8 a=6Y3uqnu38QBErNT00lMA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIzMiBTYWx0ZWRfXxms7OIqZsCvP
 iwyR9yHXg1FJtn+ILqmiXAiciv57i9YRbWl9y+GpuHNgj6jjia6/R3/++dmCBRb9AuAmKX7hQ+w
 YlD1EE8hUMupChedHO/x/8nLUFNo/Yqjl8zdZiUyigcO9RcJKxiL61h7HntjYkAbcIxaIlu42Bg
 xWZU6NHL/U6hvcA8yeq2oT0h/fCc2QvuJnsEAYwH5nwiI8/tkYmTO7dU4RhtMZBgDQk/A3hoAOt
 7uB/xiK7Mo30ba1lUSlxpv/wgFVlvYUa7y7Lc/fceQsbB0BVevFyk/Cs2peDBqitFrj8SKXevGS
 m5ZMBBxOwXLiWq/3T4lfWK1mCWEsUv+qpQc4PxU4MEnUMLsb7KRHb8huj5AzvZHbI7UbWPnuJ8P
 zU/gjmT04Scbznl9XS27dWNK2Y0yt3Aw24znUjkvPutxnJxD8xJdinGJXze0MgX2WRQh7mYnXMg
 V+ecdOVASPd4etZOpkw==
X-Proofpoint-ORIG-GUID: PiBjQc-GRQXedUV_H00wWNREQnZvV90U
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIzMiBTYWx0ZWRfX5PR71jmuYH2I
 V6pn8Z5+9DgdaQDeBw+9ZIaXMqmCxugtsbI+eMnHYgh7QxQxXr5zj9lVt0iYzawm/+2xFquM2rr
 B9N7H0b9BG0TOuOJ4zL7il5Ax9V2n7I=
X-Proofpoint-GUID: PiBjQc-GRQXedUV_H00wWNREQnZvV90U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_06,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115213_787794_910A3B78 
X-CRM114-Status: GOOD (  18.96  )
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

On Thu, 10 Sep 2026 08:21:42 +0000
Srirangan Madhavan <smadhavan@nvidia.com> wrote:

> Add a cache maintenance provider for the Arm SMCCC cache clean+invalidate
> interface.
> 
> The provider discovers SMCCC support and attributes at init time,
> serializes firmware calls, handles transient BUSY and RATE_LIMITED
> responses with bounded retries, and registers with the generic cache
> coherency framework used by memregion callers.
> 
> Signed-off-by: Srirangan Madhavan <smadhavan@nvidia.com>
> Reviewed-by: Jonathan Cameron <jic23@kernel.org>

One tiny thing inline.

Thanks,

Jonathan


> diff --git a/drivers/cache/arm_smccc_cache.c b/drivers/cache/arm_smccc_cache.c
> new file mode 100644
> index 000000000000..1cfa8f8809d0
> --- /dev/null
> +++ b/drivers/cache/arm_smccc_cache.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 NVIDIA Corporation
> + *
> + * Arm SMCCC cache maintenance provider using cache clean+invalidate calls.
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/cache_coherency.h>
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/errno.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>

Small thing, but can we avoid including the catch all that is kernel.h.
Generally aim for more specific headers for what is actually used.

> +#include <linux/mutex.h>
> +#include <linux/nmi.h>
> +


