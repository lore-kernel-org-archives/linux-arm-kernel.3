Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D5CCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9V3ZxzZvxmKgc8hMN0KNAw5jx1AF9PyZSuoGpdw3cc=; b=oHHD4ANBUnXTjUzDeB/p46aU5v
	mm2eF/3ZE1Ij9ZCbG9QB5Y56S4SMMlggWhbXh/4kvkgq4N8sZ4nqX/tfkA+66GNR+WsZJmIUt5Qt7
	DjCbs0BZpUB5uVQy9DG7QISM7fudq1uDQ5enIV5mw3T3LH8FGob9jC9oUrQEG/FbUO1w8btOznFJQ
	HcIvzYqE7FMv94Y9f2BHsNdtI+c0stxdFJ0J+Pk5/kqg0iM46nUSiVt6t5fdEv4G6GEd6hh3+DjCz
	Rp1im+bpFrP9shIQHMxeHmlXTJb1RPd0Iy2quE93aMKTE4YAWB6Ke8aRibM3822loNM5sdleS7orD
	YPZYx7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZs9m-0000000HYxI-2Ajj;
	Wed, 17 Jun 2026 15:26:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZs9k-0000000HYx0-3w5V;
	Wed, 17 Jun 2026 15:26:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5293443E1A;
	Wed, 17 Jun 2026 15:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30611F000E9;
	Wed, 17 Jun 2026 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781709980;
	bh=I9V3ZxzZvxmKgc8hMN0KNAw5jx1AF9PyZSuoGpdw3cc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GGc3w/taoFG0RXND5OIr62RcuvZJ96WfVxFE1dJAvXJEQZssuQAmifrc/UsW01jLo
	 u+lEqurxi/Gs/rns8svl88//8lReobfOutFJgGWb5ncKDSNyHY4nZW17EarTHgI2kf
	 tH+HokNplG+ToJw0BrvqvD2B/CUK2ARKVtYliWU5TRC/AuAaZIC/nxc423UyXxgynb
	 GFVvvquwV+XNbXFHM8Tp/Wg2yJsl0GkGL0AtOYBie2dWl/rMletg4M63tom2xVqs64
	 ssn1uABWOEqdnCj7IchQjQ2Dm2qmHiFPLGVLgNk5w6kSqMXOwVsVk7PCOMG1Wj91oD
	 LCfIEaZ4jsX0g==
Date: Wed, 17 Jun 2026 16:26:15 +0100
From: Lee Jones <lee@kernel.org>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1] mfd: mt6397-irq: Fix PM notifier use-after-free
Message-ID: <20260617152615.GO10056@google.com>
References: <20260608021048.2577577-1-dbgh9129@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608021048.2577577-1-dbgh9129@gmail.com>
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

/* Sashiko Automation: Issues Found (3 Findings) */

Worth considering.

On Sun, 07 Jun 2026, Yuho Choi wrote:

> mt6397_irq_init() registers chip->pm_nb with the global PM notifier
> chain. The notifier callback uses container_of() to recover struct
> mt6397_chip and then dereferences chip fields.
> 
> The chip structure is allocated with devm_kzalloc() in mt6397_probe().
> If probe fails after mt6397_irq_init() succeeds, for example when
> devm_mfd_add_devices() fails, devres can release the chip while the PM
> notifier remains registered. The same lifetime mismatch exists when the
> driver is unbound.
> 
> Check the register_pm_notifier() return value and add a devm cleanup
> action to unregister the notifier before the devm-managed chip is freed.
> If adding the cleanup action fails, devm_add_action_or_reset()
> unregisters the notifier immediately; then remove the IRQ domain in the
> remaining error path.
> 
> Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  drivers/mfd/mt6397-irq.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
> index 5d2e5459f744..8947f7e732fa 100644
> --- a/drivers/mfd/mt6397-irq.c
> +++ b/drivers/mfd/mt6397-irq.c
> @@ -169,6 +169,13 @@ static int mt6397_irq_pm_notifier(struct notifier_block *notifier,
>  	return NOTIFY_DONE;
>  }

[Severity: High]
This is a pre-existing issue, but does this PM notifier safely access the
hardware registers and software state?

In mt6397_irq_pm_notifier(), the hardware registers and chip->irq_masks_cur
are read and written without holding chip->irqlock. Since PM notifiers like
PM_SUSPEND_PREPARE run while tasks are still active, if another driver
requests or frees an IRQ concurrently, mt6397_irq_sync_unlock() will acquire
irqlock and write dynamically updated irq_masks_cur to the hardware registers.

Can this data race allow the PM notifier to silently overwrite the dynamically
updated hardware masks with stale data, or corrupt the suspend wake_mask?



>  
> +static void mt6397_irq_pm_notifier_unregister(void *data)
> +{
> +	struct mt6397_chip *chip = data;
> +
> +	unregister_pm_notifier(&chip->pm_nb);
> +}
> +
>  int mt6397_irq_init(struct mt6397_chip *chip)
>  {
>  	int ret;
> @@ -233,6 +240,17 @@ int mt6397_irq_init(struct mt6397_chip *chip)
>  		return ret;
>  	}
>  
> -	register_pm_notifier(&chip->pm_nb);
> -	return 0;
> +	ret = register_pm_notifier(&chip->pm_nb);
> +	if (ret) {
> +		dev_err(chip->dev, "failed to register PM notifier: %d\n", ret);
> +		irq_domain_remove(chip->irq_domain);

[Severity: High]
Is it safe to explicitly remove the IRQ domain here while the devm-managed
parent threaded IRQ remains active?

The parent IRQ was requested earlier via devm_request_threaded_irq(). Because
devres cleanup does not run until the probe function completely fails and
returns, the parent IRQ remains active and enabled during this window.

If an interrupt triggers during this error path, the active IRQ handler
mt6397_irq_thread() will execute and call mt6397_irq_handle_reg(). This in
turn calls irq_find_mapping(), which will dereference the freed irq_domain,
resulting in a use-after-free.



[Severity: High]
This is a pre-existing issue, but does the IRQ domain properly unregister
during driver unbind?

The irq_domain is created using irq_domain_create_linear() earlier in
mt6397_irq_init(), which is not managed by devm. The MT6397 driver lacks a
.remove callback and relies entirely on devres for cleanup.

When the device is unbound, devres frees the chip structure. However, the
irq_domain is never removed and remains in the global IRQ domain list, leaking
memory. Furthermore, its host_data points to the now-freed chip.

If the device is rebound, mt6397_irq_domain_map() will dereference the freed
chip pointer, causing a use-after-free.


> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(chip->dev,
> +				       mt6397_irq_pm_notifier_unregister, chip);
> +	if (ret)
> +		irq_domain_remove(chip->irq_domain);
> +
> +	return ret;
>  }
> -- 
> 2.43.0
> 

-- 
Lee Jones

