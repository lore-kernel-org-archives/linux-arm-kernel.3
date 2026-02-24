Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8727E9B24E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8w7TIlXl/gdOx8Eq0MA8gVS6LzVSr1K0I388Y1ovDE=; b=fnZGsr4bfPTTU7eVDFURs5/IRq
	RjUkeRIudrd7LmqLuGvnGJJV938YOt4qrrDwRLdIXTybgQH7+p19fT2H9ggIfFX3TeaWgW8OHxWV9
	0wl08XMESaeNO5+tdBOnBtfUlZ1BL40bb5vIJ87hpMcbIXlFWaZ9xGM8z6dbIG1hU3kycntH4O+39
	ZBUdVs4E7xu84PxxwmzR3O+v0gGZbMs2296Hu+BU+CU68PsPdFofOWQ6i29OWOKGIIBsYw/WVPnVp
	U5RVyJ/r2841i+9+zUtCFNAOdtxiBAlb9YNUJNdN6fpwljfMgeaQAW7ytpj6cCjc75ByIb8uQTFyn
	CckK/eEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq7T-00000001tb9-3GWV;
	Tue, 24 Feb 2026 10:58:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuq7Q-00000001tal-41LR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:58:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EDF71339;
	Tue, 24 Feb 2026 02:58:11 -0800 (PST)
Received: from [10.41.150.144] (e142021.arm.com [10.41.150.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F4F43F62B;
	Tue, 24 Feb 2026 02:58:15 -0800 (PST)
Message-ID: <3e6aa867-6dae-4770-8a6a-7c79e1cc7892@arm.com>
Date: Tue, 24 Feb 2026 11:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: smccc: add timeout, touch wdt
To: Vedashree Vidwans <vvidwans@nvidia.com>, salman.nabi@arm.com,
 sudeep.holla@arm.com, lpieralisi@kernel.org, mark.rutland@arm.com,
 trilokkumar.soni@oss.qualcomm.com
Cc: ardb@kernel.org, chao.gao@intel.com,
 linux-arm-kernel@lists.infradead.org, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, sdonthineni@nvidia.com, vsethi@nvidia.com,
 vwadekar@nvidia.com
References: <20260210224023.2341728-1-vvidwans@nvidia.com>
 <20260210224023.2341728-2-vvidwans@nvidia.com>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260210224023.2341728-2-vvidwans@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_025821_097762_5CA95A4D 
X-CRM114-Status: GOOD (  24.33  )
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

Hi Veda,

On 2/10/26 23:40, Vedashree Vidwans wrote:
> Enhance PRIME/ACTIVATION functions to touch watchdog and implement
> timeout mechanism. This update ensures that any potential hangs are
> detected promptly and that the LFA process is allocated sufficient
> execution time before the watchdog timer expires. These changes improve
> overall system reliability by reducing the risk of undetected process
> stalls and unexpected watchdog resets.

Many thanks for that, I think it's a very good idea to take care of the 
watchdog and to avoid an infinite loop in the AGAIN case.
I have some comments about some details below ....

> Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
> ---
>   drivers/firmware/smccc/lfa_fw.c | 40 +++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index da6b54fe1685..b0ace6fc8dac 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -17,6 +17,9 @@
>   #include <linux/array_size.h>
>   #include <linux/list.h>
>   #include <linux/mutex.h>
> +#include <linux/nmi.h>
> +#include <linux/ktime.h>
> +#include <linux/delay.h>
>   
>   #undef pr_fmt
>   #define pr_fmt(fmt) "Arm LFA: " fmt
> @@ -37,6 +40,14 @@
>   #define LFA_PRIME_CALL_AGAIN		BIT(0)
>   #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
>   
> +/* Prime loop limits, TODO: tune after testing */
> +#define LFA_PRIME_BUDGET_US		30000000	/* 30s cap */
> +#define LFA_PRIME_POLL_DELAY_US		10		/* 10us between polls */
> +
> +/* Activation loop limits, TODO: tune after testing */
> +#define LFA_ACTIVATE_BUDGET_US		20000000	/* 20s cap */
> +#define LFA_ACTIVATE_POLL_DELAY_US	10		/* 10us between polls */
> +
>   /* LFA return values */
>   #define LFA_SUCCESS			0
>   #define LFA_NOT_SUPPORTED		1
> @@ -219,6 +230,7 @@ static int call_lfa_activate(void *data)
>   	struct image_props *attrs = data;
>   	struct arm_smccc_1_2_regs args = { 0 };
>   	struct arm_smccc_1_2_regs res = { 0 };
> +	ktime_t end = ktime_add_us(ktime_get(), LFA_ACTIVATE_BUDGET_US);
>   
>   	args.a0 = LFA_1_0_FN_ACTIVATE;
>   	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
> @@ -232,6 +244,8 @@ static int call_lfa_activate(void *data)
>   	args.a2 = !(attrs->cpu_rendezvous_forced || attrs->cpu_rendezvous);
>   
>   	for (;;) {
> +		/* Touch watchdog, ACTIVATE shouldn't take longer than watchdog_thresh */
> +		touch_nmi_watchdog();
>   		arm_smccc_1_2_invoke(&args, &res);
>   
>   		if ((long)res.a0 < 0) {
> @@ -241,6 +255,15 @@ static int call_lfa_activate(void *data)
>   		}
>   		if (!(res.a1 & LFA_ACTIVATE_CALL_AGAIN))
>   			break; /* ACTIVATE successful */
> +
> +		/* SMC returned with call_again flag set */
> +		if (ktime_before(ktime_get(), end)) {
> +			udelay(LFA_ACTIVATE_POLL_DELAY_US);

I don't think we should wait here at all, and definitely not with 
udelay: https://docs.kernel.org/timers/delay_sleep_functions.html

Instead we should move the "call again" (and timeout) mechanism out of 
this function, into activate_fw_image(), so that we exit the 
stop_machine(). Otherwise we would still block everything. Doing it 
there, where we should be preemptible, would give the kernel a chance to 
do some housekeeping. If there is nothing for the kernel to do, then I 
think it's fine to immediately call lfa_activate() again, after a 
cond_resched(), for instance.

> +			continue;
> +		}
> +
> +		pr_err("ACTIVATE for image %s timed out", attrs->image_name);
> +		return -ETIMEDOUT;
>   	}
>   
>   	return res.a0;
> @@ -290,6 +313,7 @@ static int prime_fw_image(struct image_props *attrs)
>   {
>   	struct arm_smccc_1_2_regs args = { 0 };
>   	struct arm_smccc_1_2_regs res = { 0 };
> +	ktime_t end = ktime_add_us(ktime_get(), LFA_PRIME_BUDGET_US);
>   	int ret;
>   
>   	mutex_lock(&lfa_lock);
> @@ -317,6 +341,8 @@ static int prime_fw_image(struct image_props *attrs)
>   	args.a0 = LFA_1_0_FN_PRIME;
>   	args.a1 = attrs->fw_seq_id; /* fw_seq_id under consideration */
>   	for (;;) {
> +		/* Touch watchdog, PRIME shouldn't take longer than watchdog_thresh */
> +		touch_nmi_watchdog();
>   		arm_smccc_1_2_invoke(&args, &res);
>   
>   		if ((long)res.a0 < 0) {
> @@ -328,6 +354,20 @@ static int prime_fw_image(struct image_props *attrs)
>   		}
>   		if (!(res.a1 & LFA_PRIME_CALL_AGAIN))
>   			break; /* PRIME successful */
> +
> +		/* SMC returned with call_again flag set */
> +		if (ktime_before(ktime_get(), end)) {
> +			udelay(LFA_PRIME_POLL_DELAY_US);

same comment here, please no udelay().
This should also avoid the discussion about the exact values of the 
sleep periods.
I'd just have one generous timeout (a few seconds, basically what your 
BUDGET values do above), to avoid looping forever in case of a firmware 
bug, for instance.

Cheers,
Andre

> +			continue;
> +		}
> +
> +		pr_err("LFA_PRIME for image %s timed out", attrs->image_name);
> +		mutex_unlock(&lfa_lock);
> +
> +		ret = lfa_cancel(attrs);
> +		if (ret != 0)
> +			return ret;
> +		return -ETIMEDOUT;
>   	}
>   
>   	mutex_unlock(&lfa_lock);


