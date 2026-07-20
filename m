Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85971C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6oZONNfb5uP+JaptYLp2osr1QmMr2AutfOA1S9NH7M=; b=0tmaSKLWIizBo3/p3uMqINgFG4
	NcYmHDzwqvv+YH+eVS8g8V34a7PhFy86QAH/X8zpTk4c8HQBBXatm2JaQeTeIUHFzAdUqxR03j/ZY
	ptjawgxMJa6fSYjK7ZMmFFb0yHXJtA04uxIcMYo+NBANgAvslCnH/lahOxTm7vFrJRXkwfLMhNSZl
	q8B2OwNthILxAhHdUOkEiLJB8MkpJILiiYHobTbSTILk+EtFu5swlnoj70j4RQBkic8rVMOhfgRG4
	WqFZdYfqoa/+FgVgpB0ehYz+F4rrVOFefur7At8oLL8vGvvT0mB8NqNM033yZ2MwCREJBAcNgNyLy
	AIvkdp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnaT-00000006ke0-0OWs;
	Mon, 20 Jul 2026 12:59:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnaO-00000006kci-2IV2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:59:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F0EC2B;
	Mon, 20 Jul 2026 05:59:01 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B928E3F99C;
	Mon, 20 Jul 2026 05:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784552345; bh=tj7DETiWrYqcYhPQBV0lQIQF5ojnhC7kaKJUMMnBNUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dKmABXHEllSGT7FeFg6oxaG2ujJktWVxIXZ3hFzKw45EJWrXdCv86Cdi8Lk3ybb+P
	 2eyzZw9sSqz4kKd+F7OoRuZNUZsH093wu+fiiSmVRvRLMFKAt3uEPGr18dcBdv9V/F
	 kKFNdv+XlRp4DjEuV/4GCCvpzaekEZeXf66xmNSY=
Message-ID: <e4f9b266-8d9e-48fe-99c0-58b61e02c9bd@arm.com>
Date: Mon, 20 Jul 2026 13:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] iommu/fsl: use platform_device_set_fwnode()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, iommu@lists.linux.dev, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-3-2dee93f42c54@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-3-2dee93f42c54@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_055908_663299_AF4EA4D0 
X-CRM114-Status: GOOD (  15.17  )
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

On 20/07/2026 10:24 am, Bartosz Golaszewski wrote:
> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.

This is very much non-portable code specific to OF-only platforms, but 
if the intention is to remove platform_device_set_of_node() again 
already, then FWIW,

Acked-by: Robin Murphy <robin.murphy@arm.com>

(Although I'm slightly puzzled by the cover letter - AFAICS in -next, 
platform_device_set_of_node() is itself very much a user of 
platform_device_set_fwnode(), however in terms of symbol exports, 
perhaps the former could now just be a static inline wrapper?)

> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>   drivers/iommu/fsl_pamu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
> index c83bbc3faad56d6ee1c89b0a7f74028af02c81e9..268a1f752fbceab4fd24013aeea5df1b6982fbb1 100644
> --- a/drivers/iommu/fsl_pamu.c
> +++ b/drivers/iommu/fsl_pamu.c
> @@ -975,7 +975,7 @@ static __init int fsl_pamu_init(void)
>   		goto error_device_alloc;
>   	}
>   
> -	platform_device_set_of_node(pdev, np);
> +	platform_device_set_fwnode(pdev, of_fwnode_handle(np));
>   
>   	ret = pamu_domain_init();
>   	if (ret)
> 


