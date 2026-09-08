Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44ABC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SmaP2tfLo8P8qtLQeaRMf/6n6ZlUEcUp+fVq7MKCr4=; b=Wfy2jYoMaohfiV4VotOIWYkWFE
	XcSnGLV3x1N+9sp5U3lFP73OP7jAo+7Rz3wI8gFtPYJLIBFL81HOK+qk/44+bWBY1WNzmYi9faKIg
	G95jiFCqDiCz/iM5WUjwyekHmOpQETc9BvpNyxwWJXM88iE19I4co/Syyml8qT79tfNg6EwLUv+gy
	KejROT8aBb4pNgCXYJ1E/RVl/wcFz/QH3o8EnN0VzDHkjGLl3hwFLsYh2uOAWKaNGTyyzCYCv977a
	djkTNU2H3jsU7Fc+MGoX/bPhqyZy6vsnHPUfGDm1Bpv3G9ELSfkuQjQxRofSzJ5BLeZ7G40EIWqyN
	YaRGQFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41ge-0000000A5e1-3Q4h;
	Tue, 08 Sep 2026 19:40:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41gd-0000000A5dU-088z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:40:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C5AD1601DE;
	Tue,  8 Sep 2026 19:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C68671F00A3A;
	Tue,  8 Sep 2026 19:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788896452;
	bh=3SmaP2tfLo8P8qtLQeaRMf/6n6ZlUEcUp+fVq7MKCr4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=GHJuzKoviIlcBoSUX8/bjnpkTnczaGSKZszt3GgXggayzktfr5jLR+6enahj4Qj0E
	 OmkXcUFPCucE58VGivtjTT5/8Tt/AaOaZQKCqcdP+1fhOwWIJldZBop7m4K31RjZEv
	 DHDF/SxfqXSriM0jif5tAUVI2qjnTlO7HY8oABbJapcFmLxtossJ9Hgl/7qMiexSC3
	 gEjK8bqDeb8PQ86l6yTSh7wBLcBFaYIBVLhyYfxuHouMLBr4LKYn0C0+99+uhMK3CC
	 UAdYCfZ3PFCHOSH2Vke/Ggp0YEWwuCGLcIPkhcYbSyQhh47/zCkClrA6hB9OfMpP/e
	 mamdEEcu26zHA==
From: Thomas Gleixner <tglx@kernel.org>
To: Pranjal Shrivastava <praan@google.com>, iommu@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin
 Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa
 Saleh <smostafa@google.com>, Nicolin Chen <nicolinc@nvidia.com>, Daniel
 Mentz <danielmentz@google.com>, Ashish Mhetre <amhetre@nvidia.com>,
 linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, rafael@kernel.org, Danilo Krummrich
 <dakr@kernel.org>, driver-core@lists.linux.dev, Pranjal Shrivastava
 <praan@google.com>, Jason Gunthorpe <jgg@nvidia.com>, Marc Zyngier
 <maz@kernel.org>
Subject: Re: [PATCH v10 07/15] platform-msi: Introduce
 platform_device_msi_rewrite()
In-Reply-To: <20260908171712.356645-8-praan@google.com>
References: <20260908171712.356645-1-praan@google.com>
 <20260908171712.356645-8-praan@google.com>
Date: Tue, 08 Sep 2026 21:40:49 +0200
Message-ID: <87se3j1qgu.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, Sep 08 2026 at 17:17, Pranjal Shrivastava wrote:

...
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>

Jason. You really should know better by now :(

> +/**
> + * platform_device_msi_rewrite - Rewrite the MSI config for a platform device
> + * @dev:		The device for which to rewrite interrupt
> + * @irq:		The interrupt number to be rewritten.
> + * @write_msi_msg:	Callback to write the interrupt message for @dev
> + *
> + * Rewrites the cached MSI message for a platform device.
> + *
> + * Note: Platform MSI does not automatically cache composed messages. The caller's
> + * @write_msi_msg callback is expected to cache the message (e.g. into desc->msg)
> + * during initial configuration so it can be rewritten on resume.
> + */
> +void platform_device_msi_rewrite(struct device *dev, unsigned int irq,
> +				 irq_write_msi_msg_t write_msi_msg)

Why is this a platform device specific function and why does this need to
hand in the write_msi_msg() callback, which is already known through the
interrupt descriptor and the top level interrupt chip?

I spent an awful lot of time and effort to get rid of these platform MSI
layering violations and now you start adding the same mess again.

Not going to happen.

> +{
> +	struct msi_desc *desc;
> +	struct msi_msg msg;
> +
> +	if (!irq || !write_msi_msg)
> +		return;

Oh well.

> +	desc = irq_get_msi_desc(irq);
> +	if (!desc) {
> +		dev_err(dev, "Failed to get MSI descriptor for irq %u\n", irq);
> +		return;
> +	}

Doing this without having the underlying interrupt descriptor locked is
a recipe for an undebuggable disaster waiting to happen. It might be
"safe" in the context you are calling it but it's absolutely not safe in
general.

> +	__get_cached_msi_msg(desc, &msg);
> +	if (!msg.address_hi && !msg.address_lo) {
> +		dev_warn(dev, "No cached MSI message found for irq %u\n", irq);

That's just wrong. A message with a zero address is valid, e.g. when an
interrupt is shut down. So if there is random crap after resume in the
message store and the interrupt is valid, but not requested, then the
cached message still has to be written even if it is zero.

So this want's to be a function in the MSI core code. Also this is not a
per interrupt problem it is obviously a per device domain problem.
Simply because the device provides the message store for all MSI interrupts
which originate from that same device and therefore _all_ MSI interrupts
are affected by that, no?

So this all can be solved at the device domain level without sprinkling
per interrupt invocations including conditionals all over the place.

Something like the completely untested below should just work.

Thanks,

        tglx
---
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -669,6 +669,8 @@ void msi_domain_free_irqs_all(struct dev
 
 struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
 
+void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid);
+
 /* Per device platform MSI */
 int platform_device_msi_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
 					    irq_write_msi_msg_t write_msi_msg);
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -1775,3 +1775,34 @@ bool msi_device_has_isolated_msi(struct
 	return arch_is_isolated_msi();
 }
 EXPORT_SYMBOL_GPL(msi_device_has_isolated_msi);
+
+void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid)
+{
+	if (!dev->msi.data)
+		return;
+
+	guard(msi_descs_lock)(dev);
+	struct irq_domain *domain = msi_get_device_domain(dev, domid);
+
+	if (!domain || !irq_domain_is_msi_device(domain))
+		return;
+
+	struct xarray *xa = &dev->msi.data->__domains[domid].store;
+	struct msi_domain_info *info = domain->host_data;
+	struct msi_desc *msi_desc;
+	unsigned long idx;
+
+	xa_for_each_range(xa, idx, msi_desc, 0, info->hwsize) {
+		/* Only handle MSI entries which have an interrupt associated */
+		if (!msi_desc_match(msi_desc, MSI_DESC_ASSOCIATED))
+			continue;
+
+		scoped_irqdesc_get_and_lock(msi_desc->irq, 0) {
+			struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
+			struct msi_msg msg = msi_desc->msg;
+
+			if (data->chip)
+				irq_chip_write_msi_msg(data, &msg);
+		}
+	}
+}





