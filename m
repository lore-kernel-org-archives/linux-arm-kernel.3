Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E1ECC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 04:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWdbP2YpPS6VQfeV27iDbD/qvWCuu42ZlVxsIM4yMqU=; b=S3sIMLMb+MUymHqAHa7Stlkpuz
	dO7KSjXWdp3fZ4q5S9iNeQzi0aJ3a5bEpfTJ6NUGEZdpCvTj30VWNRY++wvPxEDezI2vSBuuitpSP
	M6F2YokErIzlq069sHKeFSElDx/AL5f/nfUQPfWODMJx5PAEEmUF6+gm4ey9vq/sqdoUb9wVGC7yx
	cF+JTi3GMkUnZeMgdnnE+R8hPHtDhbO/+prTjSTYrcB/v5mA5JIFgptceXcmCIoR06Hxt75HPpL/7
	tslifUMM7KwOWErmmkjWaoQH1orJYf4td/Dw0k9bT+SJnyTbhXMPb0MhWHVv0XVTM2GBs2aoIS/mB
	RXRxeXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqCc-0000000ETJq-32gv;
	Wed, 14 Oct 2026 04:02:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGqCa-0000000ETJ7-0dXp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 04:02:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E2PhZR1125107
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VWdbP2YpPS6VQfeV27iDbD/q
	vWCuu42ZlVxsIM4yMqU=; b=p52aLg4oqtWTVq+OGhn1mbuFCCdAblvqzUacGfB0
	U6X48RQ5MqlULeAjZr6+vISYvjeYJszESwFiSAp9TAIlVwKQvVJzUIML7zfIZ7yp
	8f7J7WLfwEgM9ojdBzkMMC6ZpO0mKO3M5v5lNRCEFFA0EXmeNwOG1M3O/1TeBtGD
	du4HXJ3eAwg/aIY+xMLOznrb8aluZFhodl+laqpIGjNsfydnfsKMcg00yI9HUICL
	QXHmP/apS4j/N26cP7DpOnPDY+dUcYtd6LGIhrrKr/ThtFdRiMJsewoZa0YMHr3T
	wRvWhxyZIOgEHBISEXEodQcOo3krDbHteXU0A/KH9M3PyQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9sg823f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:02:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so10060962eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 21:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791950571; x=1792555371; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VWdbP2YpPS6VQfeV27iDbD/qvWCuu42ZlVxsIM4yMqU=;
        b=Yp5QpLzheyLEuORlAbhb/X934MJyPahFWDIPe2/LVIkFqv81U0Z0VGiYs1r9uINTkN
         mcg1cb2IJYmqJzUDY04vpGbLH0UVZyvMiUBJhGVMLNeS4Oze2qJQ41V7xMfQKQ9qSWmB
         K0YKaHE0dH2xNjE5oOuYVo9YWyRgVneVoPzNoUTEOCZqpKDoKIAGpqXxzqwYCU5b04W8
         U+g1huXdd3rBl2GRQa5MoDmQX0T/1XcxG81abP5UwVTC4bicWZ8bj1hj52tmUH4wWoab
         z1540YwvIGYHej310M+usS+8VL9qRqensnBQl8MhaQlJyfY2R6gsmt8luGah1Wqij6/P
         CoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791950571; x=1792555371;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWdbP2YpPS6VQfeV27iDbD/qvWCuu42ZlVxsIM4yMqU=;
        b=CkP+hjB4uvkFs8kP6v7HUrHtYnKpK2tDLI0OTg13CDMX/9tdOm1PN1bJVnKFLrrurt
         qwEYT3f43D/MgZrt4WFpvqTMjvlu9VRzpmdEOLjw4X6oZN1mQWYwpgbL+9btPwsPbfDO
         GcfnplwZG1BHu705GXiB9HFCVhdugM7VRbgrOqQdlpQv0dxlfPWijwoynfsELaNob2re
         MV2Jo58GN6wWKWfp1v3pQV/354LGDcpjiPVB9aYFS6Cjge7RdOyORpGSMu+Z1GjORapI
         vrNZcFSlOBCnQreVVGXK5K/O+Q+qJ683E2svZvZBP/96ZlmfUAD2JOJYqPuHcAbAXmO7
         H7ew==
X-Forwarded-Encrypted: i=1; AKwUvBwDpkR2qtidW39fT0NyZrihlqsjOdMI8iEslP8/BXLNVUYfWvXaKcQeZBc9w+zkFIxb+HPwCsRe0SmpF2zxSTbo@lists.infradead.org
X-Gm-Message-State: AFq9FYKmvyJwQ527krT0/v+sb27e41AWjZrXmf18Ppq9mBSVjiXRFlv2
	O3PupHWLoulhVkVdpbsu1P+dhBdxCYBm/B/Bg33jL3iknFGgvkP0AA6VnRwWcugJJ+2UwzkwKrZ
	Ef8TSiK1kwfvX4WUmg8HLhlyrqpPRW38rU2iDiUjocDbAHsRrcJk8UJ5fZkUqfdZHxBZ6aDsNAx
	Rh9w==
X-Gm-Gg: AYBFou25YUGRooyiD2PN1afUvVWt+ozW7NtSTDrB0jYh0cWrb3ONk0kTdU43+xbvVAD
	/0TvDsw/lumsUrDwBVXVzDJT0kwLSxvaB/J1NSUScB1QP9ZIbrV/TUS/HNIiCXp1URwPx/7ii2d
	gSAaOALgPLo0ive6PVk9T2GLO0T0d6qydAa8vNvmThxcf6s0ijWfUMtSuT7e7j4rM/U9qeXsdxt
	6+3u9hDEFRB2WI5fM0zhmKG7JE6cGxQZnc1j1vUt8uXlx6xuGkqek+vlab539v0zPlblTIDTYnn
	6vaiJXSNKrHyLYsLrrhCpPb1OiCpq4nI3JDaWSyVFCV/rkIVeJXgjowYHAH9wrHe+l2fypbCQX/
	og+vanrmGRDs+vf+m64xhdM9eMDrgAIxKwBhAIQrZ8rAGd6TpAGVkTQxGB3LBmuLPrdmJHyG6RT
	iGTfngI6DgP2h3LweJuBvYi8Jg
X-Received: by 2002:a05:7300:f0ce:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3537de1ce96mr19572199eec.1.1791950570417;
        Tue, 13 Oct 2026 21:02:50 -0700 (PDT)
X-Received: by 2002:a05:7300:f0ce:b0:34b:b410:9352 with SMTP id 5a478bee46e88-3537de1ce96mr19572147eec.1.1791950569770;
        Tue, 13 Oct 2026 21:02:49 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cacb61asm50995980eec.21.2026.10.13.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:02:48 -0700 (PDT)
Date: Wed, 14 Oct 2026 09:32:36 +0530
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Conor Dooley <conor@kernel.org>, Anup Patel <anup@brainfault.org>,
        =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
        Yunhui Cui <cuiyunhui@bytedance.com>,
        Atish Patra <atish.patra@linux.dev>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        James Clark <james.clark@linaro.org>, Will Deacon <will@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
        Yuanzhu <yuanzhu@bytedance.com>,
        Yicong Yang <yang.yicong@picoheart.com>,
        Susheng Yang <yang.susheng@zte.com.cn>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 RESEND 3/9] riscv: sse: mask events during shutdown
 and kexec
Message-ID: <as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
 <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Proofpoint-GUID: WWKyNjc3gzc_s7u9yuoTeH1jEwJDrJ5t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfX/+8kdpBd6/L+
 BU8U7IcXN1wddxpz0Olm7zKV+061AY8psF9NQMw6q/tiXbESPNW0nUL2PcMP9cTX5J4Ua0PYcTL
 zZ0yrrfpbR2Oc/rZyxXaFBcd3TQ28nM=
X-Proofpoint-ORIG-GUID: WWKyNjc3gzc_s7u9yuoTeH1jEwJDrJ5t
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6acefeeb cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=968KyxNXAAAA:8 a=a_nq2awA8k5mFBtTUooA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAxNSBTYWx0ZWRfX8jHcr7r05Phf
 RP5rTecQmNO7bPjQ3diJRDmUIcYcsuZpWNBcEgZMopSOFc9T0Sqgi6Ab9mfXI0A/luS2S/vzs8Y
 I3PornY+bPf7vhKdq6lFpAmC+YODYBjcGZm0PnuCiXc/zF0/uuo2qemfuorvx7f/uAzVThiUeCY
 GQwqBcfMriQFUNQgTZbAa+ra3FZdlbQbVwuLg+SgE0cMd8CMk6DMCO3we3Wh2QkluE+AO6XbRdD
 +fxWLepUKOR6nMTcyCFmX+SJl8Ca5xaJhErmNfmujRBRZxrtUOK9Zx4YgwyDsodKYNXknvvv9+s
 /Wy5tXYvv35BZcIwZ7y9a5eaT4I372S92enOrVxv/d6IDjkoj+uF6C4mKzErPHQBjqHTJAMJ4sN
 wkMh3CSiCsi7LO3SszJ4Bn/ZfCsFN/ZFM2EUhCthoqeuWTZ5G/coiCKJ47UrW9l9o3WEr7PbbqJ
 72qyInUkdLkG4pQA/Gw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_210252_222346_15B15CE6 
X-CRM114-Status: GOOD (  33.96  )
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

On Mon, Sep 21, 2026 at 07:15:00PM +0800, Zhanpeng Zhang wrote:
> SSE delivery is independent of normal S-mode interrupts. Firmware may also
> retain an event registration until Linux explicitly unregisters it. A hart
> must therefore stop accepting SSE events before Linux stops servicing the
> registered handler.
> 
> Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
> and crash shutdown paths. This prevents firmware from entering Linux-owned
> handler state after the corresponding CPU or kernel context is no longer
> valid.
> 
> A crash kernel cannot identify or take ownership of registrations
> inherited from the crashed kernel. Reject a later normal kexec while such
> SSE state may still exist, rather than transferring unknown firmware state
> to another kernel.
> 
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
>  arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
>  arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
>  arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
>  3 files changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
> index 738df176ff6f..24e7affae70b 100644
> --- a/arch/riscv/kernel/machine_kexec.c
> +++ b/arch/riscv/kernel/machine_kexec.c
> @@ -14,10 +14,13 @@
>  #include <asm/set_memory.h>	/* For set_memory_x() */
>  #include <linux/compiler.h>	/* For unreachable() */
>  #include <linux/cpu.h>		/* For cpu_down() */
> +#include <linux/crash_dump.h>
>  #include <linux/reboot.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
>  
> +#include <asm/sse.h>
> +
>  /*
>   * machine_kexec_prepare - Initialize kexec
>   *
> @@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
>  	unsigned int control_code_buffer_sz = 0;
>  	int i = 0;
>  
> +	/* A crash kernel cannot tear down registrations inherited from firmware. */
> +	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
> +	    riscv_sse_available()) {

I just realized. This rejects a normal kexec from any kdump kernel whenever firmware
merely advertises SSE, regardless of CONFIG_RISCV_SBI_SSE or whether anything is registered.
Can you check if its breaking kexec() with SSE just being advertised?

Also, there are some shasiko's comments worth addressing.

> +		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
> +		return -EOPNOTSUPP;
> +	}
> +
>  	/* Find the Flattened Device Tree and save its physical address */
>  	for (i = 0; i < image->nr_segments; i++) {
>  		if (image->segment[i].memsz <= sizeof(fdt))
> @@ -127,6 +137,7 @@ void
>  machine_crash_shutdown(struct pt_regs *regs)
>  {
>  	local_irq_disable();
> +	riscv_sse_mask_current_hart();
>  
>  	/* shutdown non-crashing cpus */
>  	crash_smp_send_stop();
> diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
> index 14eb08a6db85..fdab37e7ae52 100644
> --- a/arch/riscv/kernel/reset.c
> +++ b/arch/riscv/kernel/reset.c
> @@ -6,6 +6,20 @@
>  #include <linux/efi.h>
>  #include <linux/reboot.h>
>  #include <linux/pm.h>
> +#include <linux/smp.h>
> +
> +#include <asm/sse.h>
> +
> +#ifndef CONFIG_SMP
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
This function call does SSE probe on every call. Wouldn't it be cheaper to do once?

Regards
Himanshu

> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +#endif
>  
>  static void __noreturn default_power_off(void)
>  {
> @@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
>  
>  void machine_restart(char *cmd)
>  {
> +	riscv_sse_mask_current_hart();
> +
>  	/*
>  	 * UpdateCapsule() depends on the system being reset via ResetSystem().
>  	 */
> @@ -30,12 +46,14 @@ void machine_restart(char *cmd)
>  
>  void machine_halt(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
>  
>  void machine_power_off(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	do_kernel_power_off();
>  	default_power_off();
>  }
> diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> index fa66f9c97d74..7f0d4e7332f1 100644
> --- a/arch/riscv/kernel/smp.c
> +++ b/arch/riscv/kernel/smp.c
> @@ -23,10 +23,13 @@
>  #include <linux/irq.h>
>  #include <linux/irq_work.h>
>  #include <linux/nmi.h>
> +#include <linux/panic.h>
>  
>  #include <asm/tlbflush.h>
>  #include <asm/cacheflush.h>
>  #include <asm/cpu_ops.h>
> +#include <asm/sbi.h>
> +#include <asm/sse.h>
>  
>  enum ipi_message_type {
>  	IPI_RESCHEDULE,
> @@ -79,8 +82,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
>  	return -ENOENT;
>  }
>  
> +void __noreturn panic_smp_self_stop(void)
> +{
> +	riscv_sse_mask_current_hart();
> +	local_irq_disable();
> +
> +	for (;;)
> +		cpu_relax();
> +}
> +
>  static void ipi_stop(void)
>  {
> +	riscv_sse_mask_current_hart();
>  	set_cpu_online(smp_processor_id(), false);
>  	while (1)
>  		wait_for_interrupt();
> @@ -91,6 +104,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
>  
>  static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
>  {
> +	riscv_sse_mask_current_hart();
>  	crash_save_cpu(regs, cpu);
>  
>  	atomic_dec(&waiting_for_crash_ipi);
> @@ -254,6 +268,8 @@ void smp_send_stop(void)
>  {
>  	unsigned long timeout;
>  
> +	riscv_sse_mask_current_hart();
> +
>  	if (num_online_cpus() > 1) {
>  		cpumask_t mask;
>  
> @@ -301,6 +317,7 @@ void crash_smp_send_stop(void)
>  		return;
>  
>  	cpus_stopped = 1;
> +	riscv_sse_mask_current_hart();
>  
>  	/*
>  	 * If this cpu is the only one alive at this point in time, online or
> -- 
> 2.50.1 (Apple Git-155)
> 

