Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA9CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxeTrlmBGDcG3gSpVZGnFsRWwF5/0SQwtqpCcXOXmnE=; b=TNUjp1UFRvOFSenzxpDqiKq3ha
	LOzjAjEzs3DWFcTTSJ4TcV1Z/H3aB3JSMVBWsJqwnPewiGFtPA5zUcW0NcONO10CwgDEMuOv/5o1y
	ItOXzB43d6GX0urDDnkMmv1jAewaH3Sc4KvgKJH4VIx4ZNm5UijalX+T7e4D97GPYQkrTXt9BXYRW
	bDRT2ZarndturIOnGGmJ3U25UejgXKNfTL/FlFE4goImbqh2h4Vpu9ycOB0cyhQIo0VDtG1S75Dbe
	WWTQ2LebX5aEXaxEzg76j45+LTUThWVGnzZnyc5hk8hIJkMKwkUd7lHeMi46TorOaxs+RWVbsQaJK
	2F3fLauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGETQ-0000000Bd1m-2xY2;
	Tue, 04 Nov 2025 10:41:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGETL-0000000Bd0i-0va0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 10:41:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A48fiad1488891
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 10:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NxeTrlmBGDcG3gSpVZGnFsRW
	wF5/0SQwtqpCcXOXmnE=; b=GTTStkplAIar+1KrYgT13I9D9xUOchzeymgJggRR
	z3nQ+s1rcd7WuApRidTe+zx+GKpgsZGHd8qEq4glVuDJrURzKKj7fNX6MV+cg8zf
	BJCyuKB9AOqa9ycgV92ZLXU0lZDFnIJZ25PKLmsqzEft+mtW7drqT93WWw47kfhd
	VaKX/XsbR/WeFCS7f+UVv4eoSyc4Y7PEsoEBrzQJxjFDB59JnDvJcXUnqZVenoki
	v7zVe8VYSEhIF2gM5xJXlDPUYcaCv8K1G6GmxHj1aMhQAu1uwa30tBiEfQ1LNKBy
	PIlUwwYWZdRbpWBFdiKwHFMj59c7X34ws9aUOopSQ/1hUg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7c7jgqp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:41:05 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4eba120950fso134637461cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 02:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762252865; x=1762857665; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NxeTrlmBGDcG3gSpVZGnFsRWwF5/0SQwtqpCcXOXmnE=;
        b=PI2GoYniLakV7Hs56uJUR2jeqtIB59t3rmAm1VP15MIWpuOD/D0VRauSzrmHLZS6QK
         dNOTMrxMplAXZZ96CU6BzVShdLy9ReEEcETLUGzXdXt85YR7/3e5auN56Nr0B+64JolA
         jEgpl28iOj9fphpLTBGnbJs0MqzUNWnoMN/28jCGZqydBg8l6UB77BXJAkK27pIS4bWq
         l1fFAy9KarUVsdzhTrH5TfJdKD4Gw60bueLA+QN25QPG7nhQOQ/fmQD9Nloy7Uzm9qUr
         EWjGdl/130La7vKI2t1HioC6iJV8bLycoZzcS/AjvuRRYS+gwbuOPWLH/AG6I5zePUnR
         0V5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762252865; x=1762857665;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxeTrlmBGDcG3gSpVZGnFsRWwF5/0SQwtqpCcXOXmnE=;
        b=bZtP0iTSgjQaAqeXxQDa+H1ZZaSoARju0XK9txFrqh5odgT3sQw2LSwOXVWy2P2+Nj
         VoK/yPte6Pg+FoiXaXs4gpE7IP+jnNc/FzaXQ7R/b4r7jGs7qJzKvliG96wTvow6buST
         32nlmJRVOMLxKOHj3Gys4Li4DlTsyle2uV8cH+ZzuBSX2WC/mk28SGsnRCDwFqadwC5a
         Opz6Xt2CWUW46o/aMGTacqmuugL2BkhpwTl73IAnAgqMLBkLwVg3UN1tNvi1xip6BkDs
         d16UGxtxz6inGFZGe7slS1WxYLB1pBYk4qKtUqWAoq+UThSWKpwocuEBRk4ugHVBSBaB
         nJAw==
X-Forwarded-Encrypted: i=1; AJvYcCWVPsdMnVma3jG1HEwS5tSMPhuuxF4SZFj7JRTuGAufRf4b1jOhPzbhHrIf6O5Bfkc4PGX/Wicmc9JbO3t+JPMB@lists.infradead.org
X-Gm-Message-State: AOJu0YzhCQ2fIxueUFRw2TimnfT/64rwu2DjJMeYFumGX3JmrTkQhG0C
	KFlf6vII9+n+hoGmNAEKarrebX3Kital0NemZEh0VjjQGdPmMSsTkZcqAr6UQWTtxIuPRwyrQ+n
	Wv0SVBro26WW8QJMQdwkcAxhM7uYJdQtRrtvFSnaoyKQhwqDzz8lZKWKWNy7mWkD3Cne0PndKN3
	V3AQ==
X-Gm-Gg: ASbGncsmqIpcBp77mLVUw6/gnMvKPK75YOmMI0hujoIGtErtj0hwDapmNsmashJt7T6
	uQpFaYVVapbGT7NZeqJXybU2UipZQxDNj47NQL4m2KAEEtkHe7Rv4xxIZW1aG726d8V2CUeRK0I
	rPXQ+v9JmRPrljxkV8ZsukWpLgUEqkFFeCzNBwQr4IktWIUF1mg4IZ7lehaTOQU/5lV4Q7m/4HR
	6yUYoyc9CGkhCWgcCpSP759BlhYqUgIItJD5OmMbmeEac/qQBdoTzmU3CsV1TfNXR0PPAL3rNcm
	lChxXrSVpYx60HUaJ0KeMl51Fltfq4DSpC34+Jq4USVISpDPXrsomn+JNxs/0lAWnGr8eyQpDcq
	f9uT2ZpPuDYQeZg==
X-Received: by 2002:a05:622a:5c16:b0:4e8:b764:366f with SMTP id d75a77b69052e-4ed31002a0fmr162818811cf.62.1762252865034;
        Tue, 04 Nov 2025 02:41:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELQ0fZGkTyXHjx104daNaqdc/vSTBykqMsRR10C2OMCEZm2HQNkog9k2/0p9cvSTq2cRY0Jw==
X-Received: by 2002:a05:622a:5c16:b0:4e8:b764:366f with SMTP id d75a77b69052e-4ed31002a0fmr162818551cf.62.1762252864465;
        Tue, 04 Nov 2025 02:41:04 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429dc1f9cdbsm3817388f8f.34.2025.11.04.02.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:41:04 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: kprobes: check the return value of set_memory_rox()
In-Reply-To: <20251103194505.4077265-1-yang@os.amperecomputing.com> (Yang
	Shi's message of "Mon, 3 Nov 2025 11:45:05 -0800")
References: <20251103194505.4077265-1-yang@os.amperecomputing.com>
Date: Tue, 04 Nov 2025 10:41:03 +0000
Message-ID: <878qgmaxmo.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA4NyBTYWx0ZWRfXxWDMiez7K25D
 gm1YxDLMYLeCOJAckMoqFP4JZE1gmkZg7L3iKmcBsfY6WbXXTSSYOwKFcEFTbMWCGRD9xYQrBjn
 xx8k0L2iCbPp7HVguLaUPyubwyedFogoPZgHykvIRpchI/ILV83C71LJESmDrOn0k4uzpwpp87Q
 5CgA2a2reiRs+FbnsmFHjPxBmu19Kr9IJXkKsRYaRy8+Jdz9U5G6hQB3Bi/wrTzpniZNOMiqp6D
 as8S6gvCn+lNs0wMVzVtrIChMSMOsA066cZcIRz5fPTrpM1ELgy+48hYXOnaxEXNzf5sXydm7Fm
 OxkEpEIJZM78BxJOdhUT99336r3nqlujVCMiGpOVgurSqFJjwVV7GVx59NQTktSjD1vi5oDOkU1
 xPlBmnWUbvm2h9Z74P3VsasiA/Er3Q==
X-Proofpoint-ORIG-GUID: sgu8NPkeVG2AFrapVxDsOpcmo1znrPkb
X-Proofpoint-GUID: sgu8NPkeVG2AFrapVxDsOpcmo1znrPkb
X-Authority-Analysis: v=2.4 cv=DvNbOW/+ c=1 sm=1 tr=0 ts=6909d842 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=vzhER2c_AAAA:8
 a=n3fbpKS34vtD236G7o0A:9 a=a_PwQJl-kcHnX1M80qC6:22 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_024107_262910_9A40CFB4 
X-CRM114-Status: GOOD (  26.95  )
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

Noticed a typo in the commit log while catching up with the rodata BBM
optimizations.

Yang Shi <yang@os.amperecomputing.com> writes:

> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), __change_memory_common has more chance to fail due to
> memory allocation fialure when splitting page table. So check the return

Typo:               failure                    

> value of set_memory_rox(), then bail out if it fails otherwise we may have
> RW memory mapping for kprobes insn page.
>
> Fixes: 195a1b7d8388 ("arm64: kprobes: call set_memory_rox() for kprobe page")
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
> I actually epxected 195a1b7d8388 ("arm64: kprobes: call set_memory_rox()
> for kprobe page") can be merged in 6.17-rcX, so I just restored it to
> before commit 10d5e97c1bf8 ("arm64: use PAGE_KERNEL_ROX directly in
> alloc_insn_page"), however it turned out to be merged in 6.18-rc1 and it
> is after commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"). So I made the fix tag point to it.
> And I don't think we need to backport this patch to pre-6.18.
>
>  arch/arm64/kernel/probes/kprobes.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 8ab6104a4883..43a0361a8bf0 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -49,7 +49,10 @@ void *alloc_insn_page(void)
>  	addr = execmem_alloc(EXECMEM_KPROBES, PAGE_SIZE);
>  	if (!addr)
>  		return NULL;
> -	set_memory_rox((unsigned long)addr, 1);
> +	if (set_memory_rox((unsigned long)addr, 1)) {
> +		execmem_free(addr);
> +		return NULL;
> +	}
>  	return addr;
>  }

