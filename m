Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4597C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 18:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=; b=DzYRgtfJneyTnOb9I3NfuUv1+1
	0nXN4ZLlG5RclnJOuPUqe6YOQkJRJpq+mSvBObhP4xEnDPL8j/Bm174Tqz9HyJ1za5caax+h7U/yf
	Ch4eXgkZwVNX5n51E/OvmCYPeBoOzax5vZYKGgsRzG2P9L72xBfxGWj4ZysfJC2eBiDaSQS6Rucv4
	XNzKeLfNasvyAWTAkSJHk73hi4ZwI6sUR7vfl9i0RHbiebhqAFVo0Fe0FCsVE2hWDO3pH0IK8CLIs
	qOT3RkuHINV+DwZynJZ4zKhZ9uJdoGEs7Ntyhn+3DKKo29eSfYOfh/2Eo44OxFOz7/B64Wjj2BJaD
	Q/Mg3U5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N9y-0000000Cchy-1DXG;
	Wed, 09 Sep 2026 18:36:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4N9u-0000000CchF-1GSz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 18:36:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689H7e8o3716926
	for <linux-arm-kernel@lists.infradead.org>; Wed, 9 Sep 2026 18:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=; b=f9fHyVhIBtdv6EUr
	DlNghKVHtEJRyrLKeXFDlVLXSO1UAA+Yn7hGbI1f0UYI1DNCkSV2lKeExYYLGD6g
	CSPcVJVcKhiTXh+Xxk/ETQTYTWiD579T5wEStNDRoul/rvzTnmVWP+boZ79lxeYB
	FXY6hC14K1DEc4aUkeAYYXllFrx0NuolQS0A1f6pVA4SDRMZaY7G+8AWxlJU+/m5
	q6QTEC2o3J+6eOxTUhYEmqbFUC7PKOZIsJUYrpGkhwey7ynH8YGPR2uJl30S6bXj
	1vlfmR5qjsJ07tSDg2GrWJP2dkDKKKIPmCtHs7DDLTuwk43KCYv1lOSTaNjljB4R
	hLNSRA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk7921wrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 18:36:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39512608fb1so12946660a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 11:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788978993; x=1789583793; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=;
        b=RT64gjgs8fGKdbNLywcGPXNjleYktlN9/4agdOcUjCZ4zUlVZDPkGLYmpANnKui7Y0
         DX8FHf+G0TpRYLmC2tYNjbQaS6iKHGpvR4n33gKBnQ7vRE8KKIOzr+huvuZ1eOX2Rjhv
         B6doh3PIRLv1F7l46C4bCmK04274XW6SDNkpQDXgg+IpRNxIsIzfkS4/kZ58nNON0NVK
         5xsKajZOloIeNwu3/FCQIGCJnX1Ike6ze5+tq3FJCv4HMBUqI4HpTAGOIiw5SKyXUJuR
         z/UlAuSo3ZtuYIfMIU9EJvXXiWk208U+gXiVIsajnJPGJ4oNFxnyxIRJ9uelEKfHROQx
         lc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978993; x=1789583793;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mIQgohTE2rOvQzNapNCth9eVCnLrSjsevoHbhxyKhm8=;
        b=LTL6VstL3c4vgGnHwP0bd6cK6cXpEcTRfZYalMmDx/Ryk7qgNE0hI2vvT63Qls1Hwx
         c6MMs/Qha/ti9mNFYgVr6GB7S20Z6x8nO0iqZTFcpudnBBJKpBFlVWC7CqnA/8WMRSSa
         DhEncZVWyeCIDs+bQGdBKE+HlBlFe7novaifgSZP3IdvW5q2Wuj6deEmXFTRxw3wgMIR
         ioMFcywGHFq6q6O9YP46bOh1lObHf7tqiQTVw7nJHFJMLRc3WklBE+VQ59NN00ByeGpA
         Rk2CoP3fAX4i0eMoqfqkmbTm+TIByuhZ95fVrfQ4CO8a5YEXk9VHQGn5FMjKBBKe7r2E
         h7Pg==
X-Forwarded-Encrypted: i=1; AKwUvBwmmexQzS4x1gEFlIMuI2dUAxGeLDgiiQEN5rLfgU0FLJyZgM2R8CpY+0uZx89g5hQljgd8fNVivPu0ilGgAXCp@lists.infradead.org
X-Gm-Message-State: AFuF++lWPQOwxG5rckK/5HG6CCBfBqvRVDDCEKzmIwri4Aab4fIg8EB2
	FP1DzCcrJ/+p+cCVJD/d29FwC0f1pdmUSeesglzZ6/LPbnQf4kNy+2qxEwHTTAUiBlGtOMKhAvR
	vSIIhJ+uqCdRN8W5Tb3DWPEAJwh9AUwg3QyEIUJQTbb2n/46ax3zDsPvJnHfPm6vNaqLydXX9I6
	NoRlmqqda42w==
X-Gm-Gg: AYBFou14puF4xWiYRQybrJTuNqMVQASi16V14SMhNRvw9KIBVzP3W/icToTgbbrRuVo
	bpaQnPHhbRDHsqiPCbbuqxWE2YGjvFC5TtJoSZWfyiev16hGOuaQ2rMil3siKYhtDKnA8yrFwxN
	5Xxl5b51v7xX299NtFE9aHy4gfuu2h/7cdOssF7YIjS6Kgyb4Mq65bsnp4PSLaOIAqwwu6ICQSC
	HaVo9WVaS65TY6SXTftcdJJXcBPIDuy5z3nvgFVJ3rJFvMDMSsSInSnwExG8Jx1MjBj1kmH+Efj
	hMTwdLzKV9yvKQWhHM1Hqe7c0EUVfoTcLJQxk9cazYYI8YjXaSavIAwy8Xr2dY/3g0ixH+6TyzH
	3rV6iMwBOZNx8jDgiK3cDT8y0WKw=
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr53821154a91.18.1788978992933;
        Wed, 09 Sep 2026 11:36:32 -0700 (PDT)
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr53821108a91.18.1788978992503;
        Wed, 09 Sep 2026 11:36:32 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm50371041c88.12.2026.09.09.11.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:36:31 -0700 (PDT)
Date: Wed, 9 Sep 2026 11:36:25 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Oleg Keri <okerixx@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Beata Michalska
 <beata.michalska@arm.com>,
        Sumit Gupta <sumitg@nvidia.com>,
        Prasanna Kumar
 T S M <ptsm@linux.microsoft.com>,
        Russell King <linux@armlinux.org.uk>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich
 <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu()
 overflow above 4.19 GHz
Message-ID: <20260909113625.000063be@oss.qualcomm.com>
In-Reply-To: <08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
References: <cover.1788712186.git.okerixx@gmail.com>
	<08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bd1bluPB c=1 sm=1 tr=0 ts=6aa1a731 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=vZYCpiARan6kKAuTxo4A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfXwYjf4/oMuupi
 WIieMuSAqMZKuhC2i3mSm/yCOEpfoV0Jbw+Vw3sZsMTi88bzq4moNY9TKjw4KT1EVDo71KVtkUV
 6HXoE+hfgtMvFhkz19kbAt6w5bjK8Fps+z5D4oEzVDQc26fsIu+4BlMfy498OW7z9yYVl7hIiWm
 c8K6pFtzt2r5FWrjVWbQEMg3jyay7nUT5w9IRg/5jwBn2+H5QXSSCNzPq8H293FWsJg7q8p2jxS
 /gpe5KEwyYiMy87vBODdYQtj6Q/2loA/dlCdAoiGPhoXX+nb0tJMwPWiFBizxR5+JpnAI9KcpOa
 xnSco/LY7OgkzsLIQD4+Z4pKCIlKlgk7nJlM8JpJNFUDykYXknqyFnFehY+xcArGWNIjs3/rtVd
 xZ0I30aSWRdwPDGFIpuu9l5IRuRyqTAyVHKmzCB08EP25Baibf1g0UFVH4SmCfNLV/ch4st48J+
 jqjLRBXVHRh3XUU9pqw==
X-Proofpoint-ORIG-GUID: DZ6uKJlVu4jnRyl7ATTBF29PLEPohZOU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX3khndRs8QYk3
 vNy42i0N2gJmNliIuIf0zSREI71NPmGeNOEN/lyQLYbkrwRPsbmJU8J8f+AQhWLoswznTz6Amo3
 Zek7TsZy1uzGpa+FmCNsh7nZy/MFoB8=
X-Proofpoint-GUID: DZ6uKJlVu4jnRyl7ATTBF29PLEPohZOU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_113634_343571_B3B72328 
X-CRM114-Status: GOOD (  25.67  )
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

On Sun,  6 Sep 2026 18:37:14 +0200
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
> Signed-off-by: Oleg Keri <okerixx@gmail.com>
> ---
>  arch/arm64/kernel/topology.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index d28438f8b83f..804758eeb63a 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -245,8 +245,9 @@ int arch_freq_get_on_cpu(int cpu)
>  	 * (see amu_scale_freq_tick for details)
>  	 */
>  	scale = arch_scale_freq_capacity(cpu);
> -	freq = scale * arch_scale_freq_ref(cpu);
> -	freq >>= SCHED_CAPACITY_SHIFT;
> +	scale *= arch_scale_freq_ref(cpu);
> +	scale >>= SCHED_CAPACITY_SHIFT;

Maybe just do it all one line?

	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;

I was going to suggest that you roll in the arch_scale_freq_capacity() as well
but then we'd need a cast to ensure maths was done in 64 bits and that was uglier.

I think this should end up the same as what you have.

Thanks,

Jonathan


> +	freq = scale;
>  	return freq;
>  }
>  


