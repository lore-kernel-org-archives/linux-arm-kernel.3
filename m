Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F8BCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 11:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+BM3TCa9qCzg8rf0CxOrNKtcXVplw/GYWNhUanCydw=; b=ErS4O48TUtHOab5W34tcAsqi+f
	3dwZvpr8xXeXeAMHckwGYDOXaYmbFxvg/Cu45iGCmGPFDHIXTbBMN+iDihIlZw7H0SzkijTCebAMM
	tfaPNYn+dVnCo6SAHV87qKRtZXaZfuMzNyEWPrvFGxSICVVCTsZLtQk4KDRxGJ8Zu2E5VcEXcDBoY
	gihCdloZAxEtl+lumcV5J1Czfr/f00TdKAAhirHK6hf14LnSuVPNmb8Fi5ohzQBheQdseuXCNODpJ
	r1kKPrLzNj2MTX7W4CqQcoVQXmM3Pben50RAiwt/AfiLuc1KK1C2f6RFOL1gef0oxCckKLd3p/bbk
	1mS6avfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxDn-00000003hdW-0YbB;
	Thu, 07 May 2026 11:48:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxDk-00000003hcs-1KXS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 11:48:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B666F401C6;
	Thu,  7 May 2026 11:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81408C2BCB8;
	Thu,  7 May 2026 11:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778154527;
	bh=skOLNCIOu8uLMNUP2/UbRZTYsUmk4aY5Jmdqccs0fUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGG5YSDOLsnijaOhfJiAG7RtYI0t+/QnZ1xLmZMAnTj9AqGPHkZNHiYjooSzzui8t
	 vU/2NjNcuPLsxl1IsS8WNqOWii8Ro19vV06oaH9AZ59+g0uJ0tobOynFLv4tk0IGCt
	 xn1Vcb68lw/0wfz9AbJVWNigkzY0ecdJ7ep7d9si+LnjiYQhEDARDQXo6ad5OnLmNp
	 OAVIHKs6JZTGftmMwPJf1CnRXRdXsJPthxN081GmtKaxF9Ko+7YCPDlDNJ3maf4nFg
	 HpJvWxmRMdU1ZNrXvk84n8DtB7qf+NqkwQ5THhZG88rqM2MWLc7Bp8ZFZrGgVI9ZgQ
	 EH4XM+iIMbdbQ==
Date: Thu, 7 May 2026 17:18:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: arnd@arndb.de, Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	arnd@arndb.de, mark.rutland@arm.com, bjorn.andersson@oss.qualcomm.com, 
	konrad.dybcio@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, soc@lists.linux.dev
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <kkrjrwkibs6uthp6dpo2fv4c6rehrc2dkntyp2iafvx53tgub5@eg7hqkgu2ztu>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <acJO+fhjeguDZaRa@lpieralisi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acJO+fhjeguDZaRa@lpieralisi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_044848_424121_5A347C4C 
X-CRM114-Status: GOOD (  30.33  )
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

On Tue, Mar 24, 2026 at 09:44:41AM +0100, Lorenzo Pieralisi wrote:
> [+Arnd, arm-soc - to pick this up please]
> 

Arnd, could you please pick this up?

- Mani

> On Wed, Dec 31, 2025 at 09:51:26PM +0530, Manivannan Sadhasivam wrote:
> > From: Konrad Dybcio <konradybcio@kernel.org>
> > 
> > PSCI specification defines the SYSTEM_SUSPEND feature which enables the
> > firmware to implement the suspend to RAM (S2RAM) functionality by
> > transitioning the system to a deeper low power state. When the system
> > enters such state, the power to the peripheral devices might be removed. So
> > the respective device drivers must prepare for the possible removal of the
> > power by performing actions such as shutting down or resetting the device
> > in their system suspend callbacks.
> > 
> > The Linux PM framework allows the platform drivers to convey this info to
> > device drivers by calling the pm_set_suspend_via_firmware() and
> > pm_set_resume_via_firmware() APIs.
> > 
> > Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
> > mentioned APIs in the psci_system_suspend_begin() and
> > psci_system_suspend_enter() callbacks.
> > 
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > [mani: reworded the description to be more elaborative]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> > 
> > This patch was part of an old series that didn't make it to mainline due to
> > objections in the binding and exposing CPU_SUSPEND as S2RAM patches:
> > https://lore.kernel.org/all/20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com/
> > 
> > But this patch on its own is useful for platforms implementing the S2RAM
> > feature in PSCI firmware. So I picked it up, tested on Qcom X1E T14s and
> > resending it.
> > 
> >  drivers/firmware/psci/psci.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> 
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> 
> > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > index 38ca190d4a22..e73bae6cb23a 100644
> > --- a/drivers/firmware/psci/psci.c
> > +++ b/drivers/firmware/psci/psci.c
> > @@ -539,12 +539,22 @@ static int psci_system_suspend(unsigned long unused)
> >  
> >  static int psci_system_suspend_enter(suspend_state_t state)
> >  {
> > +	pm_set_resume_via_firmware();
> > +
> >  	return cpu_suspend(0, psci_system_suspend);
> >  }
> >  
> > +static int psci_system_suspend_begin(suspend_state_t state)
> > +{
> > +	pm_set_suspend_via_firmware();
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct platform_suspend_ops psci_suspend_ops = {
> >  	.valid          = suspend_valid_only_mem,
> >  	.enter          = psci_system_suspend_enter,
> > +	.begin          = psci_system_suspend_begin,
> >  };
> >  
> >  static void __init psci_init_system_reset2(void)
> > -- 
> > 2.48.1
> > 

-- 
மணிவண்ணன் சதாசிவம்

