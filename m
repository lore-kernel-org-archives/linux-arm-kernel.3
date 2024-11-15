Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72B9D6DDD5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 06:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gKUJ2cNG0t/qB73uD+0bQQcA1KeJf1H91Ybk4Lvf6A=; b=y38MygDGq/Q1tp9+hRGx2y1GQl
	HFaO1DzRql1sF1CTWxeRTHXzUG5YtpPcwo0ruJH/M9NQBzeVQC55oP7f9P5zbS7jBBmC3Mlh3+6eM
	Goom9j9JyVoVh2eda/2fxP/Hs6r8NsKEyNjq2W07yL1IiC7mdM3ImW2M3Sy3LBEwlRxWeiECM5BKn
	jkgbFmlG5egi8QaaG2ZQVzuQoCoBVBEvw4J++GP3FU7FMUgZVxGfWVjw9Cdt/NQRh5Nv8LS9IK9be
	mHBqMcZ3mq+9i87cOElhmuwwXYOrd+VSHu8rKYS5nE8MPFqO/NKRwNhLp0bzbVS05lDASOxL31qLG
	r8flUMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBphg-00000001mHL-2Rgk;
	Fri, 15 Nov 2024 06:21:12 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBpgl-00000001m8B-0TGw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 06:20:16 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso15773695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 22:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731651614; x=1732256414; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9gKUJ2cNG0t/qB73uD+0bQQcA1KeJf1H91Ybk4Lvf6A=;
        b=YrLmIESsq8pXloSqRsKYGGGwQ+heXKL3G8nc71J6EqqEDgQwAAsCyE3vXhtWYX3eYB
         /trC1XrxmK6i3OCfC0UPEOCSMOlAMMBmtljR8V3wa9jKFOJf/25/CjKIg9CpVAmhR79Y
         9PCJAhh9VEE6v4jcr3zF6qKFW+xIoVidNYKXRhJNuGr3v/VM/6ZTKQZDa+ill7B3AzQM
         IwLpB98neak9VHQSZ2/eqZkzU4vnwJHd+0Z6SzIPTW7t+G/aJWVOillWBqoao0WImuR3
         C9AKUxBbzOSpVW3oIhqSHCsdwnkQe6Mj5AA0pFG/bJ47wqe0ePaD+jJpeyhVGhZA6r3w
         j5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731651614; x=1732256414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gKUJ2cNG0t/qB73uD+0bQQcA1KeJf1H91Ybk4Lvf6A=;
        b=w2S0CPYLFhUof2SEPjW2R+IkSxW3W3e67i/MUMPpCjOibh7305FjAFKw6Bh8f2hMwv
         76aqzLLa/Q+45wXo4NdAIslvbipjTPtmtukrs/DiH022e6hdEybI0Pl7dgqPo0f2owpt
         krlIz1EPpLjSrQwfnK9u02W8t/8XIsIs+gd2idUgWQra9ZqfgNpAx+5cnIiGpnDv2Z4G
         /AcJug0ELfx1Wc2D59SSA/EqwcKX1BaOZBi7RFIvrfMkm3/JERP1r7yioZ86AJ1/jmfk
         wOI2XDWDSS3SCsbtpd8eYxw7kUexWDn0YN49Mwwmej4nWJhxEmXXRd9WBRAqGhkcISFO
         ERuw==
X-Forwarded-Encrypted: i=1; AJvYcCV0UGwQ3tKUJTjqucZtFlMys/lu1ZUtRKjfD1UuVA5w/RIy8ZyAZYoQi0lzbRiM53+kxokdKUOOhl8C1hoQjT5F@lists.infradead.org
X-Gm-Message-State: AOJu0YwMlpd21iQ268scHDbBZxGWjUt1R02Oap/YL7m37nOV5cciEdsp
	D+Zm7cDcs3omAvpXGVPCj4SFMF5aP8+HztaJbUfx3nODRWHDcXiWWhWim6YDKuPMdFwUd2Ph7JA
	=
X-Google-Smtp-Source: AGHT+IEbADa24OOCr64EMECKMnFPpNDtB+pfm88K+JWVfITt31bJPhoSBXJFkrjbhoFDajn7rZEVFw==
X-Received: by 2002:a17:902:f651:b0:20d:345a:9641 with SMTP id d9443c01a7336-211d0d8444cmr20995845ad.27.1731651614011;
        Thu, 14 Nov 2024 22:20:14 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f47b62sm5786625ad.175.2024.11.14.22.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:20:13 -0800 (PST)
Date: Fri, 15 Nov 2024 11:50:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	"open list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR GENERIC OF HOSTS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] PCI: check bridge->bus in pci_host_common_remove
Message-ID: <20241115062005.6ifvr6ens2qnrrrf@thinkpad>
References: <20241028084644.3778081-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241028084644.3778081-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_222015_186237_95043D57 
X-CRM114-Status: GOOD (  29.60  )
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

On Mon, Oct 28, 2024 at 04:46:43PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> When PCI node was created using an overlay and the overlay is
> reverted/destroyed, the "linux,pci-domain" property no longer exists,
> so of_get_pci_domain_nr will return failure. Then
> of_pci_bus_release_domain_nr will actually use the dynamic IDA, even
> if the IDA was allocated in static IDA. So the flow is as below:
> A: of_changeset_revert
>     pci_host_common_remove
>      pci_bus_release_domain_nr
>        of_pci_bus_release_domain_nr
>          of_get_pci_domain_nr      # fails because overlay is gone
>          ida_free(&pci_domain_nr_dynamic_ida)
> 
> With driver calls pci_host_common_remove explicity, the flow becomes:
> B pci_host_common_remove
>    pci_bus_release_domain_nr
>     of_pci_bus_release_domain_nr
>      of_get_pci_domain_nr      # succeeds in this order
>       ida_free(&pci_domain_nr_static_ida)
> A of_changeset_revert
>    pci_host_common_remove
> 
> With updated flow, the pci_host_common_remove will be called twice,
> so need to check 'bridge->bus' to avoid accessing invalid pointer.
> 
> Fixes: c14f7ccc9f5d ("PCI: Assign PCI domain IDs by ida_alloc()")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

I went through the previous discussion [1] and I couldn't see an agreement on
the point raised by Bjorn on 'removing the host bridge before the overlay'.

I do think this is a valid point and if you do not think so, please state the
reason.

- Mani

[1] https://lore.kernel.org/lkml/20230913115737.GA426735@bhelgaas/

> ---
> 
> V1:
>  Not sure to keep the fixes here. I could drop the Fixes tag if it is
>  improper.
>  This is to revisit the patch [1] which was rejected last year. This
>  new flow is using the suggest flow following Bjorn's suggestion.
>  But of_changeset_revert will still invoke plaform_remove and then
>  pci_host_common_remove. So worked out this patch together with a patch
>  to jailhouse driver as below:
>  static void destroy_vpci_of_overlay(void)
>  {
> +       struct device_node *vpci_node = NULL;
> +
>         if (overlay_applied) {
> +#if LINUX_VERSION_CODE >= KERNEL_VERSION(6,6,0)
> +               vpci_node = of_find_node_by_path("/pci@0");
> +               if (vpci_node) {
> +                       struct platform_device *pdev = of_find_device_by_node(vpci_node);
> +                       if (!pdev)
> +                               printk("Not found device for /pci@0\n");
> +                       else {
> +                               pci_host_common_remove(pdev);
> +                               platform_device_put(pdev);
> +                       }
> +               }
> +               of_node_put(vpci_node);
> +#endif
> +
>                 of_changeset_revert(&overlay_changeset);
> 
>  [1] https://lore.kernel.org/lkml/20230908224858.GA306960@bhelgaas/T/#md12e6097d91a012ede78c997fc5abf460029a569
> 
>  drivers/pci/controller/pci-host-common.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
> index cf5f59a745b3..5a9c29fc57cd 100644
> --- a/drivers/pci/controller/pci-host-common.c
> +++ b/drivers/pci/controller/pci-host-common.c
> @@ -86,8 +86,10 @@ void pci_host_common_remove(struct platform_device *pdev)
>  	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
>  
>  	pci_lock_rescan_remove();
> -	pci_stop_root_bus(bridge->bus);
> -	pci_remove_root_bus(bridge->bus);
> +	if (bridge->bus) {
> +		pci_stop_root_bus(bridge->bus);
> +		pci_remove_root_bus(bridge->bus);
> +	}
>  	pci_unlock_rescan_remove();
>  }
>  EXPORT_SYMBOL_GPL(pci_host_common_remove);
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

