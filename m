Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6530C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=; b=bKsbdiQWFLmBFFcGZMRqH+V2r5
	SpuSgzRjsSPB0scgvlAQUaa5CWwnjIJu7iG5dviGheZZeV3ReMy81AsWWlsw2T78h86uxLqnkCgAZ
	u+Ah11m4vk8HUiOYzQJskmCw4wrveQSm9dQf3k3LeQn7LPIqYQ8aStmRHk6kPtgwhtYeBp6uHA28c
	Wo4wL3+PX8t2uxGrMkn2sDr/br0aTiUDa/QWAksVLQGBtTxngVo0OwFBGAXwcs58clxej0o+G3oWH
	noOHTolm4ZUtFe1q2Iyl7LFUp6dFw5X0Z6zD7DNSnH+EdXCxsWNvRHwcBKFU8q9bXVT5pSmCuoRAW
	PwnQvOWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QeV-0000000Cztz-3Fcf;
	Wed, 09 Sep 2026 22:20:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4QeT-0000000CztD-3H1F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:20:23 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689M9ll22595921
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 22:20:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=; b=nz85hBmbk8CF/1HF
	vTbyg+KZf8S/LNo2l7OjmmbgE6jb/RLqXJZdXx/7KYe21yZXFTVCre8/zf9vuEjT
	Gwnk4rQ356tz9ul05I9yxskqShI8GX4s2iQeZXOABk6ey4K1iSCCJ9V5i0lPpxv4
	V9tPOriHxMK7eLuOgElzHggEBXrpL4HyySQPlJPFhhW+gi5N6+1W2ULGEKGB3eTC
	vW+C5kul7NAkiIj6B4eKLhIkaSolGj23ti7/B2aRh095fvIMj+wOG/YdUMb3kUwY
	KcoH9tg26lUD3KFlRiFzbuVd3gufBeg0AK9RL9ToYc3SG69/O/VhL4agBbyLx0mr
	cXB2lg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyfgvx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 22:20:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so10157445a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 15:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788992419; x=1789597219; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=;
        b=IgwWt+3TvAIpon2CB8prFqa2kmNXP1OZXFOTHf9c+L2Szmgt0zbrFUy61kbghUWGKl
         D14GCfes8Ajfx5dBv3lwPs5roA/IaIR5oNetwp3BcVo4GlJTCE51gajJt0MQ+Y9wRtAR
         l/nxHjrj3KbZqqKst4PZylI8KTv73CTJp4NtXQEwGF0tBq/2Be7tmgPzkCr5zQT1/fz2
         yksC+Z2j2zO3jmzFaVbI4AELxWtBHnNHNOpI/skPG8VPMB3La8hqSS9ECw5smYAhbwah
         LnAylLOTG+ohbUyPlQObN3SozOLl1HyVwbtBkUl2bpJBZPnvx4kK6tY44ZDy6/EKCHAv
         stXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788992419; x=1789597219;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BeK/1z0Ffq++309QbXgeNFfaNMYbnkujkRsfU6JzN9s=;
        b=YRLv4jhLL/3evIS0uSd9h9IZQl3eX0ampZDUTqI0WQlL3JbQw1BBthxJ48KL3b71Kb
         jL+GHPLbq5z4KK0NO2+vSGO2Ax2amt9fmMYHrbdAMttBbMDnl7BAkdGUQKGKq/CxZcMd
         a+xWzHltot/ijW5T78/2G1d0odW5iFYyg4LqeK2hEZ8y128gMVquinN++0OW/IT0wLc+
         QL7Px9j2rnOlDeRqmM0VemOynoVn9IYnBngyi66r8VGIj1NgfMAeCuhv25y/mCgEfy8E
         EHX3jePCdwalgszlclUd4t4cyZYhPg7r4o5hLV9wVMLwH/PI55FY8+/kQhbeH/2bauQD
         auzw==
X-Forwarded-Encrypted: i=1; AKwUvBzyl6fsA3gEHxi9YxEsnD+C/TdgkRbJ4tHIPZMCSI9Rw/6sFUPCGP0u/dJ1AcRK9sAYSCK5NRsiDRoU+/L9qI2H@lists.infradead.org
X-Gm-Message-State: AFuF++mCMWlDjRCRdW65wEVQ1LMP3hYwYWa5Q17ZoSGP5gHJ+oaQlGIU
	gJTh8Wft1uxztF7MPhrRO16Vw8nifUvONcczIYCQ7Kb3sVERlDwJXU63Vv25BQmcDaVqKSxNjNL
	g7vwEKwq9HM9B1E9qSb0edTm3FVkw2clpkSSsXbBdhdHRRw4OD9SbYZnoyK1OkpED46II5sUSp3
	8Wyw==
X-Gm-Gg: AYBFou3sICYUYPvBIVDaMpEOckICPBe/I7vrXAxzwwgc3uzIgaTu+ckr2ZtEKeSbhSo
	MFSHgguXcVeXN/bHO4HhsJzgY/TG1uvw7M+l6kVRzOBTPOyLGDcJaEMrk1Uv0PTb8pKVS2RENuq
	UN0x/FtBMLICoAh6tMVBdzBo52p+iNXt+NS+3s3c7T2FnXhFXSrlv2kQ15awzmSzC4Oop0Z2ND+
	Ir0t/Bg1QrwkotMjxEkbOMleqYyIXJY8UJUwkmDmVzFL2l9ivlWrsxawKcfvBV8D/KmWDHWl5iF
	qyU1ykHqZeR2BwRSlvmpqSOZ8MjzuTjEVgn5dCG3Unb+kvcxsGJvDbNuqr6JN1iIlJd+8krvtO3
	mch0hFMG1MvZuKBuBxhwVMi68M5U=
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr4531212a91.5.1788992419314;
        Wed, 09 Sep 2026 15:20:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39d70980956mr4531105a91.5.1788992418800;
        Wed, 09 Sep 2026 15:20:18 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm51299924eec.24.2026.09.09.15.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:20:18 -0700 (PDT)
Date: Wed, 9 Sep 2026 15:20:14 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Sumit Gupta
 <sumitg@nvidia.com>,
        Beata Michalska <beata.michalska@arm.com>,
        Prasanna
 Kumar T S M <ptsm@linux.microsoft.com>,
        Russell King
 <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260909152014.000055d8@oss.qualcomm.com>
In-Reply-To: <20260909192351.33910-2-okerixx@gmail.com>
References: <20260909192351.33910-1-okerixx@gmail.com>
	<20260909192351.33910-2-okerixx@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDI1MSBTYWx0ZWRfX74WcbSBtgMq4
 iVm1B1AvWHhvQnrUJ7k6m5We9n6DWkois5gj1HZAhHoQtAjrc7i+Yqc0xfoT0NTv31UYkAn+sTT
 CswO4mjg7k5ywahfDIJ9c9zn2JGzuT8=
X-Proofpoint-ORIG-GUID: 38lL9HubXEYL91JPCT9UAwXlPAg2gENR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDI1MSBTYWx0ZWRfXwrxh6qjP5h1Z
 XcBp/+cw5m1QM/7ew3Q1mK+iZCsI90kgZOOQgJlqlWmT9bg6C9e5ernm58Le+XcWr5wWyTWZf3v
 cVdvnSvWPXpU8oB5PMoKG2YyHOQaWNLwkzLxAVXL9WwINpJIXiLq2iRgGE1cs/0YN/hjLCVYCSW
 rcOEk6jRawQSgSHX96uLwWeoKYW8GCsxi7/T2ooTKB/7Rf7/jAWh/dp/ZueVTwSPoAvtPlkj2rm
 F+VSodpBxiZBeSB+shUNJ8QLdIIVxPZeuULE5UWh4BXvYWgP5xrSzTaI3Yh8ENjzwVHoOtz/8Qo
 EpLB+vcVQamzhICiza+WbkTIP/LZuSx3hh+MkQ4NxpcoTmiGjWpKrv0h2pe3d29KUH4UgtvIHs8
 3sYikg8bdwr38hc+tp14BF/UducvCrsS79cH346B7UaHkQTq2pSAqll9hPHXun2V+DAFNtK1/s2
 RAK1AgtLtrmB24eIafQ==
X-Authority-Analysis: v=2.4 cv=H5pOUOYi c=1 sm=1 tr=0 ts=6aa1dba4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GPoSAeC3DJVMy4bTL1oA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 38lL9HubXEYL91JPCT9UAwXlPAg2gENR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609090251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_152021_981514_62E84DD4 
X-CRM114-Status: GOOD (  24.64  )
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

On Wed,  9 Sep 2026 21:23:50 +0200
Oleg Keri <okerixx@gmail.com> wrote:

> arch_freq_get_on_cpu() computes the product of the frequency scale and
> the reference frequency as a u64, but assigns it to an unsigned int
> before shifting it back down:
> 
> 	freq = scale * arch_scale_freq_ref(cpu);
> 	freq >>= SCHED_CAPACITY_SHIFT;
> 
> The product is truncated to 32 bits before the shift, so the result
> wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
> i.e. 4194304 kHz.
> 
> On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
> kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
> the CPU demonstrably runs at the boost frequency: a fixed workload
> completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
> kHz, matching the 1.171 frequency ratio.
> 
> Keep the arithmetic in 64 bits until after the shift.
> 
> Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
> Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
You don't add that for a review comment unless it results in a whole new patch.

+CC Sibi who is a whole lot more familiar with Glymur than I am!

Jonathan

> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..0eca321ff113 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
>  	return freq;
>  }
>  


