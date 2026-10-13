Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CA5CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 04:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIWfgspxx4yLynby3ZQs1PnMreRTHqVlMg0z9Olk6BY=; b=2B+VR7e2WjwsIseuw+4KVG8O8e
	WUy53sTzMG+RDXiKFq8pst1HZxUZBxEYFpiryIlBduNvZYyNTTLD3i3UeOc1efe+StImgkdQMZQbs
	AIsn51qDwtN7hl5/qbIsyz7voai6dYCiZ6PXquv+vCZUFA1PZSEgMOeJYw14CDUyClm8Qqj5W0ZYU
	SV/A+8g45YBmJcQ1DkvJT6wV9mKiNX8aribEsZ3Kemn0ACzgI70Uk6Zd9D5ebZHlfnuDyck9UOfb7
	uuvgvWWo/fie6RVrP3Qa/sWrzSatKfUc6LhZYmV066MMb6ZXnmY9M5Tvzuh/BL4MDiMTcPfqNXJad
	Pwv3pPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGU2r-0000000BxhK-1S67;
	Tue, 13 Oct 2026 04:23:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGU2n-0000000Bxg7-2wrF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 04:23:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D3xV303476315
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 04:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tIWfgspxx4yLynby3ZQs1PnM
	reRTHqVlMg0z9Olk6BY=; b=YHpQvQCPqfZF1nBZx8vPKI+1i3dzN09Aillf0/C2
	aXW/AkCeJBshshO3wyeKJZx/WnpZNxOP88LUoGfPopp0/1IDO/NaKADVq6HC3msQ
	m0b/T3DpxLTE83HIloKjnaUgj16ORMSyT/P6omuoqnbv/14nUGtCbtCsrB4VIISE
	yLmerKoUcLvsnSEDlmoehOB6+xIdQecm7VkRQYSWP3nUyVVUVZOPDpr/5DyVem5C
	4HycyzpFEvjOWLwlzl4HHifH7WUl/SRQrXHIkUgsCdBwwp06csA0eqpyi31xD6WL
	Bj1FVDMIqdCgZnju841EMUSxRsO9yUUdouAKumM4Umesqg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j82ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 04:23:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso5199783eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 21:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791865391; x=1792470191; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIWfgspxx4yLynby3ZQs1PnMreRTHqVlMg0z9Olk6BY=;
        b=Pqw2wG7N8w1vNg3SHWrm3ZCvLoHYSNT73cvT8Id9O3v9kwn2H5MyKgOskzO7QcglZF
         ZGP+LZgC9KmtQjxhcHh63lGrqqqMfJdEOwSxYIiqdRoGzPhTvkeuamlXRY/sGfCP3D/V
         A7/BcwmRL4jsiJ6BFz+U/voncJaYFddqCCx7n8ErydpIBfkYb8aTMpCJiQl5ektMt1ss
         fIyaYs8LjyVxm+GQQS2SKlvqQfhaOR6IAJ0a+bu53rJiVRBsP5G9YTtQDj2NvJ9nzHNL
         w8th5gBURcqUCEs3T8MW7WdU7zYZPObSVb028v3apjpHaocoFupdgxpSBdoySkJIgKBB
         lEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865391; x=1792470191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIWfgspxx4yLynby3ZQs1PnMreRTHqVlMg0z9Olk6BY=;
        b=RqxZC7GmkuKnmqznmvi33OiI9M3WCPFksSsm87Niy/vBwupr5f2MNadMqn/uedix+o
         R8ROts6MjSPv2GORWJbwwEc4uNlzn4qudpJ9kk33mxR3utkGSHDlFZGb3Vp2M9wFVbcM
         f58ji8iUaymPtFLQT1CmPrpX9hJPYcJ1zHNQ8SWMlBP9G7m1vT+bala91Inqqz1WY0gw
         2OdcRDwuBRa5E3DVWI/H0qdaiZB8I3WLxeKlDuXRMqM/JfZncH6A05NF2qweK53OyHZI
         r3jgrOrqZjJlAC7FkroYJ2ytweU4VXketjTPPi2kqf2Ru50N+9XAsdOgQpsUFjA/7Toi
         WPBA==
X-Forwarded-Encrypted: i=1; AKwUvBwWIgCQObt1r/JaJjXKszTUQiGDgDVtT+vmL0h+j5xg+a5ROb1heZH3dWPaUH9xcPwF/kQpSOyWW8LH6XF0vJXJ@lists.infradead.org
X-Gm-Message-State: AFq9FYJE/atgdyA0icFiV6fk57K0PGEw+yN2SzFeQqg40/cLx5XbANbz
	y5BvyKtnp5UfP3cJ5EbXG8mhSvsPcQsA0LZs/uwUEq8ldbnUZZ4THKM0x+FZPf9NQr8ICYsfyRt
	WPVH3xKbsglBLFGNPOmaya+XmMw2VxPJeA2AdXKALrnKq0oS06aDs9lWOutbAYiTLOCDRwE6W5d
	dXYA==
X-Gm-Gg: AYBFou2RNfw746vlxk9WWEceRyjiVsEgm2+IDW3cHnnh6oEyk9tvPvbGt/YDBehBm5h
	BGAYGwErJwMAhuvX+X7wT6lt4pXKhRqsMxQxCrmRCP1gXxfg0iYKxptgqPo2LCGSF37LNnOSVnv
	/a80M2EGR/eruAhE2yDHt7JNfLQ1xknT64E4NXR+QTOn4HNKCNEpPY0WhnqFXOPoa+NpeivxqnN
	c28F+exs/HmoWGsGXRgI7xvqJCpNonYR7g8ugvB+fYDnlpzgWCEs0p6MVYMB2kJDEX4Cy3zYtp2
	e1efIsIXeHOjMAobT4MjKBT6uOlGImgj5+y8s2EKap/kdvXCVHd85AEMoKhdS4DR1QECRpDlVof
	7aRVKQgYKNX9copyD1kBpdYj/TDl+SDLN6ycYAaDZ/Ud9uAU4OfiVmyHCQFzfkzssFln4wpr041
	ymvo/N7ZeEjnnVEFAyvE1DBjI=
X-Received: by 2002:a05:7301:a27:b0:35b:e6a7:f925 with SMTP id 5a478bee46e88-35be6a7fd77mr2695286eec.11.1791865390851;
        Mon, 12 Oct 2026 21:23:10 -0700 (PDT)
X-Received: by 2002:a05:7301:a27:b0:35b:e6a7:f925 with SMTP id 5a478bee46e88-35be6a7fd77mr2695237eec.11.1791865390214;
        Mon, 12 Oct 2026 21:23:10 -0700 (PDT)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35c89429484sm1999530eec.23.2026.10.12.21.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 21:23:09 -0700 (PDT)
Date: Tue, 13 Oct 2026 09:52:57 +0530
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
Message-ID: <as2yIcM4YJlbvMPu@hu-himchau-blr.qualcomm.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
 <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03472b45125793a768f3e5bbc168f167e673d4cc.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Proofpoint-GUID: 9moFYf5FTfJckDprpSW_zntGBGxT2t78
X-Proofpoint-ORIG-GUID: 9moFYf5FTfJckDprpSW_zntGBGxT2t78
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAxNyBTYWx0ZWRfX4854g5+l6Q5F
 HW7CzwqXi8lbe0IwfFFlynULUs6qNMeVuXucIUY1HHI/utIm57RbAK3v7Iv1QE/Kh2KYnB3vqC5
 80yEjDXSRR334P5zfLo8olhhJRttFj4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAxNyBTYWx0ZWRfXypk/c6UTzGsA
 j7PJ7jkenfdHsqjpsM9HaDRM3/fdBysvkM0UDU8uwVcTXbKUzIlp+GAefaNOrA+dOoyUb2Tturw
 HJ8Po192wH54MtiELqzTeq3VrRXliY5Y0wSccu6I/uwKTzp3Y0TDZ0mL3oYTC7VGOIh06XUIEHh
 5bj2o95PnpuU/ZplFR/VSGj+pTw8FtAUGxvcuy90x9PjB+9xGaod0NfEgbcOo09jUOSmVI3avco
 lHRlniIBnvQzu93V0dmVodaMBsJMQSlVpoDe6VcYWB6ujjGCTP8KovBoGtWrKFavTxEBci0RUT/
 5f/B+llpyAl6oqXK2UC24P7KAQzRjz7FEC317wk0zK09VnYNn3ljWy3oUUg4ycle55y5qEaBubT
 HYqWnh05MTYZD6KQ3DkaeJ+f8Z/izDDAiR/6ZPGNbPW7JDeB13/Dp0rNp+hvHWWpb96S+YG1JC2
 S1Hsstkhd1vis3ez+Pw==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6acdb22f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=968KyxNXAAAA:8 a=EUspDBNiAAAA:8 a=a_nq2awA8k5mFBtTUooA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_212317_814026_4F850152 
X-CRM114-Status: GOOD (  32.00  )
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

Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>

> -- 
> 2.50.1 (Apple Git-155)
> 

