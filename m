Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41BAAC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=E/v+423Ay88FAJqzpJZ1o7xpfcXM7VPMAGm6qtSn4F4=; b=1SJFZGMiSkyTbP
	Rq9a5fJGo8a6ktVysfrBdOX6O4w1Sfx76m3ShMnSBXdv+ZOAVJ8kroBjFk5js5s1AevCocYPjSuUE
	6AgAmUYdPRqpZ2aEOcWR/h54Zr6pMUlRxU0Y16LjP2PG4nqu2djMwyjzha2lFCMVoJKOBrqyZdqBg
	wReGVxJJG3yb71VAbshVAVxTmphXbvGa8TJ5956qrCLlZ82wdUq32Z1aR3wWxQql++46eqN8xvRQV
	Y0G/pirMgMaaOGSX1daM5C3VlT4kV+q8vBss78WRirTU1t4nIXfqqj4LRRuiqnUjc09Z3cm/aqKR+
	90cOIno62uKTQpTwQCJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYojo-000000031VZ-0nXW;
	Mon, 07 Jul 2025 16:30:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoKx-00000002xz7-2cf5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:05:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A150FA53D3A;
	Mon,  7 Jul 2025 16:04:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D29BC4CEE3;
	Mon,  7 Jul 2025 16:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751904298;
	bh=PZguKu1gWtvJhhVgX3umyBR/niONdHTl+p+DO/QP/Sw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OxwnLMu8FrXZcRkLG0kH45/ZQD56qNSbv9rildxJXMX0TpWG6e6VXaBatZcRSEWMq
	 twtzFouCMYadDU3K3e+6Up6OIxPQxjWlW843LkTFPek5fAbs3nhO/TIbdkT75pH0fW
	 BE5Gu5ZG+5hkEKOSuH690HTUXEmHTp6+cj6yjjBHcjNfLxJmQ4pDnvCBqop4tNFn7G
	 ZATDDDEDCVqWpZNeVUoYFi1wDO6CG6/aV+g8FpRg/BnPizfz7Len7pzlN4EJOaaJFS
	 L+nXq0rYBAWXykXtfNYXHLil55+buG5n0UX9w7IuCsGJc/W/xhR0gDJYtDF3fpRWAn
	 wS2MzeC5KzP5A==
Date: Mon, 7 Jul 2025 11:04:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	mhklinux@outlook.com, tglx@linutronix.de, bhelgaas@google.com,
	romank@linux.microsoft.com, kys@microsoft.com,
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
	catalin.marinas@arm.com, will@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	jinankjain@linux.microsoft.com, skinsburskii@linux.microsoft.com,
	mrathor@linux.microsoft.com, x86@kernel.org
Subject: Re: [PATCH v2 1/6] PCI: hv: Don't load the driver for baremetal root
 partition
Message-ID: <20250707160456.GA2086564@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1751582677-30930-2-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090459_725645_942C1BB3 
X-CRM114-Status: GOOD (  17.65  )
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

On Thu, Jul 03, 2025 at 03:44:32PM -0700, Nuno Das Neves wrote:
> From: Mukesh Rathor <mrathor@linux.microsoft.com>
> 
> The root partition only uses VMBus when running nested.
> 
> When running on baremetal the Hyper-V PCI driver is not needed,
> so do not initialize it.
> 
> Signed-off-by: Mukesh Rathor <mrathor@linux.microsoft.com>
> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
> Reviewed-by: Roman Kisel <romank@linux.microsoft.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

I assume this series will be merged elsewhere.

> ---
>  drivers/pci/controller/pci-hyperv.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
> index b4f29ee75848..4d25754dfe2f 100644
> --- a/drivers/pci/controller/pci-hyperv.c
> +++ b/drivers/pci/controller/pci-hyperv.c
> @@ -4150,6 +4150,9 @@ static int __init init_hv_pci_drv(void)
>  	if (!hv_is_hyperv_initialized())
>  		return -ENODEV;
>  
> +	if (hv_root_partition() && !hv_nested)
> +		return -ENODEV;
> +
>  	ret = hv_pci_irqchip_init();
>  	if (ret)
>  		return ret;
> -- 
> 2.34.1
> 

