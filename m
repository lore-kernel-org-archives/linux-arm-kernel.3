Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0781061B20
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 20:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTFUZ/ic9kaHiqKV3UCM5xuPHcQXzf6fC90qzetuM64=; b=sU8V9IT4QtJARqiMb6dMMK9Mv7
	JzlXmoyDpMCHHKarQMJQSYsQGKlA/Uh6yx09YwPr7DSkMHDElLc7c1o2dLZxeX1COA1wgga8WxnqZ
	SHccF0YkIcMvNP6Mg+9NMKlR8NhE4JxPSGdftu3Wv1O/98p/HkkbcaykY2/WP+n5x96pIDYtPJmWx
	iIPc7pqah52NF82vVrMA0mZmwWRXhTVdW6t4W+Tm4I4xTI6dqlLlccldoP8I9qplXjVDUZyr5rRmG
	vW2vHxNexawTksk/5Vb7SFRBH6B2lmjeyFErkLVv9xEl6v6UgHshJIgvdReRLYl9sJ9qjgtvcrQG9
	V3mXtrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JWt-0000000Bs1r-2KR7;
	Mon, 30 Mar 2026 20:48:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JWs-0000000Bs1l-3ZLx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 20:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A558D60130;
	Mon, 30 Mar 2026 20:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F9E1C4CEF7;
	Mon, 30 Mar 2026 20:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774903689;
	bh=UF5+1CS9/OmLVT8niGXdL6QbIFkz4gb4E991NRItcO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyM4LrE2TfT20A2cV8Izb4j8izwVZ9aiu57KjlHnV9QtlWyBgwdMuHalgyQPfFxEu
	 t2Es2u1w+xvSs7x3iHCTAqjmkZtFzgoILv2b80KsoH4sTFymROw/R+y2hX/cpv8fXB
	 GVlKupbnabPkAyvbsuLFNtRuaJIbcDthYoqh6EHIAS1t2nTfXdm9KExHMThNzv/9/g
	 TLrdRNQJusums8BQKLBgbRuItXa/WzUOgk5emAJsMvUeKJo2RY8vw7402iSo37LoXo
	 7mKM31ayBvVfQu3qpzFx/gxvygILpRRcS0FGvL28eYpiLJYQlv+Z/dRBUHbOT7FnDx
	 KgTb9mBaUnq+Q==
Date: Mon, 30 Mar 2026 15:48:05 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, 
	bjorn.andersson@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com, mani@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <acrdFfk8al80dynq@baldur>
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

On Wed, Dec 31, 2025 at 09:51:26PM +0530, Manivannan Sadhasivam wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> PSCI specification defines the SYSTEM_SUSPEND feature which enables the
> firmware to implement the suspend to RAM (S2RAM) functionality by
> transitioning the system to a deeper low power state. When the system
> enters such state, the power to the peripheral devices might be removed.

What is the actual extent of "peripheral devices" in this definition?

> So
> the respective device drivers must prepare for the possible removal of the
> power by performing actions such as shutting down or resetting the device
> in their system suspend callbacks.
> 

Our typical interpretation of this state is that IP-blocks might be
non-functional during this time, but typically some state is retained.

Will the acceptance of this patch result in that we in the Qualcomm case
should start accepting/writing patches that implement save/restore of
state that is generally retained throughout the drivers - in the name of
"power might be removed"?

> The Linux PM framework allows the platform drivers to convey this info to
> device drivers by calling the pm_set_suspend_via_firmware() and
> pm_set_resume_via_firmware() APIs.
> 
> Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
> mentioned APIs in the psci_system_suspend_begin() and
> psci_system_suspend_enter() callbacks.
> 

With the right interpretation of what this means for us, I think this
patch looks good - but as we've discussed, I'm a bit worried about how
to deal with the alternative interpretations.

Specifically, if we fully adopt "power might be removed", we should to
take actions which will prevent a typical Qualcomm system from waking up
from sleep again.

Regards,
Bjorn

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
> 
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

