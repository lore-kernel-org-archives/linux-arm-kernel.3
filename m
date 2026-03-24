Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0181BF532F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=41bCe4LyC1F0ntnvc/fSlqGuOS07sRV7eygpARXscyQ=; b=PKNSA8tYVF315ag7UGIDSTCyFN
	1IsMomvs2l43752ApXllfHhboeE7K5aoTu7Sm9LCKxU3//hD8bUOgEYIRh9Hhhr5xoqG7vR8kO7+G
	YGUk5wqUbAav9zJkPl4n6eb+07ARPcii3XVWNsZtjHwzDhucjLNzkaGOOQXb/rh4en8QXa1u5knH1
	N781V2JS/B6SASJp1KmNaFBtBd3M4HFGZ3zqyHV30kTjCyR/xU/wK3NFxwdDXU/6tgv5roH98fMR4
	i0LYZAuNdCQ3L8ztf/5nRdV63DN3RIBHE9ShPoi7GUBRFPnZparQanQ0ZPwBKC2QCGMp3SBWCT/sw
	WUBMbDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xNY-0000000113y-3qnw;
	Tue, 24 Mar 2026 08:44:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xNY-0000000113p-0Nje
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 08:44:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 287B660120;
	Tue, 24 Mar 2026 08:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAFBC19424;
	Tue, 24 Mar 2026 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774341886;
	bh=cGtYVl2fr+pZ5FWp8Z9AvNZ6p0dL5XfRSVVR4HUPRow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GUBIdu398BiRjrZ4jdlaWApaETC0kyBH2SUeSOJzeTumDNfmfuLdQwIrAJSeqkPME
	 dcH039wHpQDz54H/MKvp+DGYDYQGAb1QrzZuEYloXXLPzO+f8hiU01bWaLNoaO24Af
	 u0o2n/NBCviC49TkEpcltOF7CuvXlZ9qEwnMyJwN7460s/HHUjsbAX6wc1mKc7SGp5
	 B2V3/HDGmsTXPvpaSKuncOc/k+9wrBJWddv0sJpbq+wZRNqRfaOsKqMVytDycQNxhI
	 ClYpU/+d2Xk1r2MY/KRJv5vs9+phlmeAoAjpfoLmjsus/vB71DA6Oyak+7M/OusJ2v
	 NGguAufLBE48A==
Date: Tue, 24 Mar 2026 09:44:41 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	arnd@arndb.de
Cc: mark.rutland@arm.com, bjorn.andersson@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, mani@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, soc@lists.linux.dev
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <acJO+fhjeguDZaRa@lpieralisi>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
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

[+Arnd, arm-soc - to pick this up please]

On Wed, Dec 31, 2025 at 09:51:26PM +0530, Manivannan Sadhasivam wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> PSCI specification defines the SYSTEM_SUSPEND feature which enables the
> firmware to implement the suspend to RAM (S2RAM) functionality by
> transitioning the system to a deeper low power state. When the system
> enters such state, the power to the peripheral devices might be removed. So
> the respective device drivers must prepare for the possible removal of the
> power by performing actions such as shutting down or resetting the device
> in their system suspend callbacks.
> 
> The Linux PM framework allows the platform drivers to convey this info to
> device drivers by calling the pm_set_suspend_via_firmware() and
> pm_set_resume_via_firmware() APIs.
> 
> Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
> mentioned APIs in the psci_system_suspend_begin() and
> psci_system_suspend_enter() callbacks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> [mani: reworded the description to be more elaborative]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> 
> This patch was part of an old series that didn't make it to mainline due to
> objections in the binding and exposing CPU_SUSPEND as S2RAM patches:
> https://lore.kernel.org/all/20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com/
> 
> But this patch on its own is useful for platforms implementing the S2RAM
> feature in PSCI firmware. So I picked it up, tested on Qcom X1E T14s and
> resending it.
> 
>  drivers/firmware/psci/psci.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22..e73bae6cb23a 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -539,12 +539,22 @@ static int psci_system_suspend(unsigned long unused)
>  
>  static int psci_system_suspend_enter(suspend_state_t state)
>  {
> +	pm_set_resume_via_firmware();
> +
>  	return cpu_suspend(0, psci_system_suspend);
>  }
>  
> +static int psci_system_suspend_begin(suspend_state_t state)
> +{
> +	pm_set_suspend_via_firmware();
> +
> +	return 0;
> +}
> +
>  static const struct platform_suspend_ops psci_suspend_ops = {
>  	.valid          = suspend_valid_only_mem,
>  	.enter          = psci_system_suspend_enter,
> +	.begin          = psci_system_suspend_begin,
>  };
>  
>  static void __init psci_init_system_reset2(void)
> -- 
> 2.48.1
> 

