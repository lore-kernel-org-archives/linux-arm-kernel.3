Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C66C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 23:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzMXL280br0vhbgA72KzbwPRmGz6jiYxkQdz6bCZM2k=; b=0eMklJ4tkwI0d3fc4sYjlNDk7y
	7ejj7dVeAlWyb0sB+/8cEXMkSYNGqe1qu5SBWJhZPEtRYc0N0haUtXCxaah+SIj7BAldz8AFrLA0A
	G7rNnhkdGsfFL54LfgJ9P33dr0+tibDuEOTu8mQTQqynGWeBqctt+kLurtyZhvlNsfMgsrj2sRqJR
	FRJae3CC0pBvfqhHq9JB2NHomvdug1ceYc3aDnk4JvJ/hOBcwlm5tG4cVUOf00WUVhgGs8hjbwQx7
	GBqNyrVR8Wju/g7K6O0nIzQSDfmT3UuwfvbElENdY9oGjjHaRefwvaKnlDlLMfEDuMQTSW8lAJPGW
	eYqNSnoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR59-00000005jgZ-1aGN;
	Wed, 26 Feb 2025 23:44:51 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnR3a-00000005j55-30xK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 23:43:15 +0000
Received: from skinsburskii. (unknown [20.236.11.29])
	by linux.microsoft.com (Postfix) with ESMTPSA id A393E210EACA;
	Wed, 26 Feb 2025 15:43:11 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A393E210EACA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1740613392;
	bh=jzMXL280br0vhbgA72KzbwPRmGz6jiYxkQdz6bCZM2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ar/9C9wjmLoKfaSfU4jE6OWNYEhLvO08kHxOvO1dxpVy28cVQhh0RP96Db9T5SWwU
	 j3V/uYXFAQY97/T/kAINpXql5Jj4zG/wIuxKyi2pjR1LPPnaXEGObKUM8vLqnHf2Mc
	 0EGXqC4phb3oOqEXIQmWqSTjHb1SfUFSUFK8Er3o=
Date: Wed, 26 Feb 2025 15:43:09 -0800
From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-acpi@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	daniel.lezcano@linaro.org, joro@8bytes.org, robin.murphy@arm.com,
	arnd@arndb.de, jinankjain@linux.microsoft.com,
	muminulrussell@gmail.com, mrathor@linux.microsoft.com,
	ssengar@linux.microsoft.com, apais@linux.microsoft.com,
	Tianyu.Lan@microsoft.com, stanislav.kinsburskiy@gmail.com,
	gregkh@linuxfoundation.org, vkuznets@redhat.com,
	prapal@linux.microsoft.com, muislam@microsoft.com,
	anrayabh@linux.microsoft.com, rafael@kernel.org, lenb@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v5 08/10] x86: hyperv: Add mshv_handler irq handler and
 setup function
Message-ID: <Z7-nDUe41XHyZ8RJ@skinsburskii.>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-9-git-send-email-nunodasneves@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1740611284-27506-9-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_154314_814379_526979C2 
X-CRM114-Status: GOOD (  17.13  )
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

On Wed, Feb 26, 2025 at 03:08:02PM -0800, Nuno Das Neves wrote:
> This will handle SYNIC interrupts such as intercepts, doorbells, and
> scheduling messages intended for the mshv driver.
> 
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Reviewed-by: Wei Liu <wei.liu@kernel.org>
> Reviewed-by: Tianyu Lan <tiala@microsoft.com>
> ---
>  arch/x86/kernel/cpu/mshyperv.c | 9 +++++++++
>  drivers/hv/hv_common.c         | 5 +++++
>  include/asm-generic/mshyperv.h | 1 +
>  3 files changed, 15 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
> index 0116d0e96ef9..616e9a5d77b4 100644
> --- a/arch/x86/kernel/cpu/mshyperv.c
> +++ b/arch/x86/kernel/cpu/mshyperv.c
> @@ -107,6 +107,7 @@ void hv_set_msr(unsigned int reg, u64 value)
>  }
>  EXPORT_SYMBOL_GPL(hv_set_msr);
>  
> +static void (*mshv_handler)(void);
>  static void (*vmbus_handler)(void);
>  static void (*hv_stimer0_handler)(void);
>  static void (*hv_kexec_handler)(void);
> @@ -117,6 +118,9 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_hyperv_callback)
>  	struct pt_regs *old_regs = set_irq_regs(regs);
>  
>  	inc_irq_stat(irq_hv_callback_count);
> +	if (mshv_handler)
> +		mshv_handler();

Can mshv_handler be defined as a weak symbol doing nothing instead
of defining it a null pointer?
This should allow to simplify this code and get rid of
hv_setup_mshv_handler, which looks redundant.

Reviewed-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>

> +
>  	if (vmbus_handler)
>  		vmbus_handler();
>  
> @@ -126,6 +130,11 @@ DEFINE_IDTENTRY_SYSVEC(sysvec_hyperv_callback)
>  	set_irq_regs(old_regs);
>  }
>  
> +void hv_setup_mshv_handler(void (*handler)(void))
> +{
> +	mshv_handler = handler;
> +}
> +
>  void hv_setup_vmbus_handler(void (*handler)(void))
>  {
>  	vmbus_handler = handler;
> diff --git a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
> index 2763cb6d3678..f5a07fd9a03b 100644
> --- a/drivers/hv/hv_common.c
> +++ b/drivers/hv/hv_common.c
> @@ -677,6 +677,11 @@ void __weak hv_remove_vmbus_handler(void)
>  }
>  EXPORT_SYMBOL_GPL(hv_remove_vmbus_handler);
>  
> +void __weak hv_setup_mshv_handler(void (*handler)(void))
> +{
> +}
> +EXPORT_SYMBOL_GPL(hv_setup_mshv_handler);
> +
>  void __weak hv_setup_kexec_handler(void (*handler)(void))
>  {
>  }
> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
> index 1f46d19a16aa..a05f12e63ccd 100644
> --- a/include/asm-generic/mshyperv.h
> +++ b/include/asm-generic/mshyperv.h
> @@ -208,6 +208,7 @@ void hv_setup_kexec_handler(void (*handler)(void));
>  void hv_remove_kexec_handler(void);
>  void hv_setup_crash_handler(void (*handler)(struct pt_regs *regs));
>  void hv_remove_crash_handler(void);
> +void hv_setup_mshv_handler(void (*handler)(void));
>  
>  extern int vmbus_interrupt;
>  extern int vmbus_irq;
> -- 
> 2.34.1
> 

