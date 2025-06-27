Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36047C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TElt43r6OUacH4qBLWxgV8jw0/nOzbOQ9E850W/lqA=; b=Xok/GspYJzhmdAmkHMB5XBN777
	4uVe60iXjl6l5ylhDgu/j15OUkRQquZybCfTaXL/wFO2sy4LGdIWiKWNTGM1wh1YxeJP+DS93D1Qy
	7g1pgByaWFS7VacPmZEsxICJFkgX/HO/UczfK58D9geIEqoakwOcNPwoknbKgtpGzmvEtWqiYaRTp
	IVusLVe8NjO+KrohXybmP4UwLZcOrndfWYVJlOWjzaf++Kb4fY2aIit8yPeCEDWs3wgFi6/UNO2D0
	RClDeFBIUIWlbsJaWDj3RgcG3jbBmhbRpzUe3SPMV3D6g3ofUPAymgmXYlj3er69mM8GprEoPCgg0
	4D0gsIQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGpF-0000000FsDq-0XZl;
	Fri, 27 Jun 2025 21:41:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGgd-0000000FrN7-1Qde
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:32:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1583944CFB;
	Fri, 27 Jun 2025 21:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D18C4CEE3;
	Fri, 27 Jun 2025 21:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751059962;
	bh=eESCjft7xsEYKmoabjp8my7YY1IIc+dHMAl27BLkGmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXZJr6CfuxBkcfN8mZSn9MAoIkUuXaEy2JhX2uh2CQ5+wDL6J6HIKYdf6QuRbb4Xq
	 i5zffCh21MBYbP/lUKV+Jq8h4CnTNEoKpgTa7LaVp/m6V+GlE4ly/iWiZazEbfOQnX
	 vu7DThsboBweTluoTrIY2DNsHHWx8j3LDJ1kBIGabVv4k/ML+/4BldBnY3LJo7uIpJ
	 xkfLVlb6HHtTpXPZ8q31XLO+neTDlA1TUL27U4fZyMm3VG3Xv6xqe3sG6B6zhpCVru
	 fuNDfwUXv83ckLLxitPDEPll6B5P1OiwUP6PagGLygGxjDJD5OppcRjEZbvA5JqOX7
	 DUw9qwaqbe5OQ==
Date: Fri, 27 Jun 2025 16:32:41 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v6 24/31] of/irq: Add of_msi_xlate() helper function
Message-ID: <20250627213241.GA168190-robh@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
 <20250626-gicv5-host-v6-24-48e046af4642@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-gicv5-host-v6-24-48e046af4642@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_143243_426406_E5216607 
X-CRM114-Status: GOOD (  24.13  )
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

On Thu, Jun 26, 2025 at 12:26:15PM +0200, Lorenzo Pieralisi wrote:
> Add an of_msi_xlate() helper that maps a device ID and returns
> the device node of the MSI controller the device ID is mapped to.
> 
> Required by core functions that need an MSI controller device node
> pointer at the same time as a mapped device ID, of_msi_map_id() is not
> sufficient for that purpose.
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/of/irq.c       | 22 +++++++++++++++++-----
>  include/linux/of_irq.h |  5 +++++
>  2 files changed, 22 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> index f8ad79b9b1c9..74aaea61de13 100644
> --- a/drivers/of/irq.c
> +++ b/drivers/of/irq.c
> @@ -670,8 +670,20 @@ void __init of_irq_init(const struct of_device_id *matches)
>  	}
>  }
>  
> -static u32 __of_msi_map_id(struct device *dev, struct device_node **np,
> -			    u32 id_in)
> +/**
> + * of_msi_xlate - map a MSI ID and find relevant MSI controller node
> + * @dev: device for which the mapping is to be done.
> + * @msi_np: Pointer to store the MSI controller node
> + * @id_in: Device ID.
> + *
> + * Walk up the device hierarchy looking for devices with a "msi-map"
> + * property. If found, apply the mapping to @id_in. @msi_np pointed
> + * value must be NULL on entry, if an MSI controller is found @msi_np is
> + * initialized to the MSI controller node with a reference held.
> + *
> + * Returns: The mapped MSI id.
> + */
> +u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
>  {
>  	struct device *parent_dev;
>  	u32 id_out = id_in;
> @@ -682,7 +694,7 @@ static u32 __of_msi_map_id(struct device *dev, struct device_node **np,
>  	 */
>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent)
>  		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
> -				"msi-map-mask", np, &id_out))
> +				"msi-map-mask", msi_np, &id_out))
>  			break;
>  	return id_out;
>  }
> @@ -700,7 +712,7 @@ static u32 __of_msi_map_id(struct device *dev, struct device_node **np,
>   */
>  u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_in)

Can we replace the 2 callers of of_msi_map_id() with of_msi_xlate()? 
The series is already big enough, so that can be a follow-up or do it 
for 6.17 if the series isn't going to make it.

Rob

