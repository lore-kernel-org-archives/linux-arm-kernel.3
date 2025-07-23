Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67B6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 10:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNWyyT0bYo4C8h5O+XsLUbxOD8+kbfz+Qx+CDckctZc=; b=Jc/lkRkeyOqFMyaJfstESH9TdC
	GaQEdPi2AMW0B5z1qahUSfn8VFVKIyEQ+eLsQNIytF4ZrPfiCdMKu8U/1i+aC/uruAJIaSzySl1ng
	0MQg1cEUjvJu3WPFLT0NLiFPS6SkCO0EZlai3OIk34KUTfFxgdJasCYFtQTa+EjngPkd/NLSp7i2q
	Dt849sUAHahBMgOLqh0Y/lTrJexi+Y4CejmHZ3lO5BBBHqKDJK9dQzERubhBdJFHoxB+964+XiwvY
	aBpNsog+RNvGjWrN0R13KtsUfP7ICT+2jZFLc1zdhTtRcLwf3X6xSB9aK2VLiY9Bzqqsvznc330qb
	wOQiDNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWes-00000004g5I-2slH;
	Wed, 23 Jul 2025 10:25:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWQ5-00000004dC2-1c4c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 10:09:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C4BC0601F3;
	Wed, 23 Jul 2025 10:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D78C4CEE7;
	Wed, 23 Jul 2025 10:09:48 +0000 (UTC)
Date: Wed, 23 Jul 2025 11:09:46 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	mhiramat@kernel.org, oleg@redhat.com, peterz@infradead.org,
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, thiago.bauermann@linaro.org,
	broonie@kernel.org, yury.khrustalev@arm.com,
	kristina.martsenko@arm.com, liaochang1@huawei.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Steve Capper <steve.capper@arm.com>
Subject: Re: [PATCH v4 6/8] arm64: uprobes: Add GCS support to uretprobes
Message-ID: <aIC06oEF5FV99ukl@arm.com>
References: <20250719043740.4548-1-jeremy.linton@arm.com>
 <20250719043740.4548-7-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719043740.4548-7-jeremy.linton@arm.com>
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

On Fri, Jul 18, 2025 at 11:37:38PM -0500, Jeremy Linton wrote:
> @@ -159,11 +160,41 @@ arch_uretprobe_hijack_return_addr(unsigned long trampoline_vaddr,
>  				  struct pt_regs *regs)
>  {
>  	unsigned long orig_ret_vaddr;
> +	unsigned long gcs_ret_vaddr;
> +	int err = 0;
> +	u64 gcspr;
>  
>  	orig_ret_vaddr = procedure_link_pointer(regs);
> +
> +	if (task_gcs_el0_enabled(current)) {
> +		gcspr = read_sysreg_s(SYS_GCSPR_EL0);
> +		gcs_ret_vaddr = load_user_gcs((unsigned long __user *)gcspr, &err);
> +		if (err) {
> +			force_sig(SIGSEGV);
> +			goto out;
> +		}

Nit: add an empty line here, I find it easier to read.

> +		/*
> +		 * If the LR and GCS entry don't match, then some kind of PAC/control
> +		 * flow happened. Likely because the user is attempting to retprobe

I don't full get the first sentence.

> +		 * on something that isn't a function boundary or inside a leaf
> +		 * function. Explicitly abort this retprobe because it will generate
> +		 * a GCS exception.
> +		 */
> +		if (gcs_ret_vaddr != orig_ret_vaddr)	{
> +			orig_ret_vaddr = -1;
> +			goto out;
> +		}

Nit: another empty line here.

> +		put_user_gcs(trampoline_vaddr, (unsigned long __user *) gcspr, &err);

Nit: (... *)gcspr (no space after cast).

> +		if (err) {
> +			force_sig(SIGSEGV);
> +			goto out;
> +		}
> +	}
> +
>  	/* Replace the return addr with trampoline addr */
>  	procedure_link_pointer_set(regs, trampoline_vaddr);
>  
> +out:
>  	return orig_ret_vaddr;
>  }

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

