Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC992C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4aBOtPsfRM3OiglhHgFceP8oaWfGnoSKrcjXOznF1Q=; b=GM+/t8/6SxVqaIhIFBo91qH+C1
	TlpkjR0mvxvcnSPqauKnBp22zTpyOp0C4yBIYCw+eOpv7OmxxO3Et+q8PuC1+JrhvIfmf7E6eRoIS
	SsrWdyQhV/+lan6JMRQTbi+zZ4BhTIUf1ngPt8M4IM3vAts0We36L3scrX4i/t0kckJhnJlP3+w+w
	j8fG9ykBJQ+qT57uxYMeEhA3wk4e8WmR5uA2sRpwURgOl232xa9Jm+uqCLtcxYMlOsRLFkgDWv096
	CeluXCijQb3+W2+v2T34RMOO7F9FYXDldp/Mhc+3uVRzNc15Cp7kOtlVUqdkfalY6a3iXkNGrfPJQ
	KAZMxBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ODT-00000008ZoU-0sbj;
	Wed, 23 Sep 2026 14:44:59 +0000
Received: from mail-ed2-x2b.google.com ([2a00:1450:4864:33::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ODR-00000008Znq-0dz7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:44:58 +0000
Received: by mail-ed2-x2b.google.com with SMTP id 4fb4d7f45d1cf-6aab226e7c8so1857605a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 07:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790174695; cv=none;
        d=google.com; s=arc-20260327;
        b=kIBu9ItR3qP24e9cM5H/eAXC5hDyETsl3NjmRzuGFiXy4XpWHg0kZAH1r+VHdN8jpZ
         DLtBYfjJKEbToXqdYwnZDs1/3oXr+fmSp3nWeiwzhkz8A5xJvPKN8WdNKFjX8+0PTEw/
         83FoHh5xaXiXoWsdqYYdZOupLMdicKX5cvlvQ6YB1oHcmKgt0G2+CffbveEZqSJ3M1Pz
         cCDcDan5DV1LVqiv+4VG8GKXDqKfipQDsjLSf2sIbNcRZLN3ITCdQQJcthSEW0BLmfzN
         zt7SrQ7w1Ja5TfThyFAEsVydontAFA5E1nsLzPfrmG5cM9WT0lv+zovKG/eNA2YfZ0BN
         Kb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M4aBOtPsfRM3OiglhHgFceP8oaWfGnoSKrcjXOznF1Q=;
        fh=RqcSXB016mdg54CputaEQ8/nkDliJXHOGq3X0OPah/M=;
        b=NSgJ8zsEzQ70T6swXX4g/VLjU6+wUB/gUt0rZUCmToQSo91B6KQX4NGopM3Mx9ARqo
         GLgHxk+h+3QUD7s64UVo5ya9Os1vOj6gvhnVh685aEXOuh1/NAu3dHwiS4KVJWHQEQr9
         gaKjfnr8x4tWLcrUOxzI5W17M6wGjmrfN9LEgMG4kteG7MnDXYGsLEDiVjyrpKJrqRM2
         Te8aOhTFTGM85ZHUvR8ke3UGY+b2hyFQ61GmSsFyk1PTaouCchRSSnC7DC1jIwyOo2zh
         RRqqwv0Yb0WgS50nxbPqHbf3mK0q6UqrfrtN/Wd9hcBFgtL4thLuJjCVEncM2SSTbQI8
         gJUA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790174695; x=1790779495; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4aBOtPsfRM3OiglhHgFceP8oaWfGnoSKrcjXOznF1Q=;
        b=tGykC5NjdBu3q6qmg2P4fZicZ914KMKOmrTL2sOmClkOqzoML8jjQFahC5ahGd6Mxw
         zJXUAW6aM3sBO/+LTNAK5m+giGbXpa1qMlHP7/1apaIBNF4Jdsv0Z7BYqD0jZUpQ7/B6
         +fPzggXGkItYEBeozHpU6TVkNG7FLnQuyHjk6RZ0XS9gjINs1V14HFNzc/vUzmrvgHuX
         zdvkv3X9sRJ2q9b/AI6lwe2/CYPQPKFcuQ5agwTRi0nkfCm3NVRbPQN5qAzAMNW8IPyv
         jw//opiX3cMxZ+KcjAMmMNhTzZqr98AHW+Ntn/Wvk7nNFnk/ktElrTqEsovDMolJPT4l
         IclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174695; x=1790779495;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M4aBOtPsfRM3OiglhHgFceP8oaWfGnoSKrcjXOznF1Q=;
        b=xjfCTLveiWpZnC3N66mK3yhw0/FgYpCU5XsdTyW1yB2f3azfzUKugcvR88J8Aj2pU9
         pt5gBvuPNs6RHE1A2sF8/3+zulJV/QH51/kFxLlUBcrmdbSs8LnsyyilxLw9XRctpOah
         9jcDg9vzXIJfH/k5bZZelExvRJQVmTZtOqbfJYtEfUL/E+VPAnIg3pSSe22qSqh6ROd6
         1wJvADOBtSvO6lwwwXsFetGo4BOyYaY+CGBjr1nQTuHNtuXS8K1iVpflgW54qPb8h/+j
         tk2BJRj5KhvG4rP3yd3yywu6jcqf6bFkbDK8judszH7SB6r6EEQJwGm3ezm1yslEOQrv
         Y+UQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbs9VMQ4OoEw3zIkXP7WBwXI+ovGL/a2fO16hcR7vTlhnN0E65mjgJAA+77NfLpGD/q2zs1ew941l2G3sRet+U@lists.infradead.org
X-Gm-Message-State: AFuF++lIV3ghEsCb8WwoRHNUpLWTzClGS/uQUTf4eSIQOHXFcWFhW11v
	kIQxr6drmnt41n+8E5gbyA5CwEF9sSyMR9NzUv1ZTLztZns5x4AP43C+86MAuIczJAsV/HEnNrN
	XFT7+TDFu8WJOAtVIEl+z8nFGuEZMmcUOVEYIrdNR7g==
X-Gm-Gg: AYBFou0H0LsIXHhWAD9DNyub6sD7pWuR2LgO6kHTVF4veq2vIFbGUMTEfuU+CqGCDrw
	+mxBov7YVLURG+7B2LqN1xT4u6JKrUIG4aUu9OWYOEZaSHRN85Rd7gyRitko2YT8pIADyTHwQXD
	8lu/PkLXtGbDHijUFE4mfReToQyJaDGGgCjeTkSOJcXx2QObbUVlw9jz8MjFLUGQRySAFJGsfxu
	CwSbkRTKJ3dJ5m58obbUt0RMX7fb6+CWicIVaMPgRLMAa7EM7yJKdCKShmrJpHHGIP/mf5pUM38
	UYtufOKDRYACxp1CcmuOzhZJegGj4xnoR2lY+440fYH00WIfQzZKgkFUQ+GRarGP475zgz5zmut
	gXHXMx8k1Sfk=
X-Received: by 2002:a05:6402:378a:b0:6aa:9851:6d5c with SMTP id
 4fb4d7f45d1cf-6aab3b2954fmr2562437a12.19.1790174694197; Wed, 23 Sep 2026
 07:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-6-dac8c5eb4aa9@valla.it>
 <arKlvZGqu2nt6Ci0@p14s> <arLXthhYbKkwZ9zY@bywater>
In-Reply-To: <arLXthhYbKkwZ9zY@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 23 Sep 2026 08:44:41 -0600
X-Gm-Features: AclHuK98k2uTxSqJLFP90Hvvkb8R20Qb9iAi3e_cMJ5VQjy6TOoZ99TlQSDABtg
Message-ID: <CANLsYkwNOukGX68=NVvwNP7iudP3EcKN6C2L2o9nVCTRxFVxFg@mail.gmail.com>
Subject: Re: [PATCH RFC 06/12] remoteproc: virtio: add bounce buffering for
 data buffers
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_074457_404570_324A2A36 
X-CRM114-Status: GOOD (  54.33  )
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

On Tue, 22 Sept 2026 at 13:39, Francesco Valla <francesco@valla.it> wrote:
>
> On Tue, Sep 22, 2026 at 09:58:53AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:51PM +0200, Francesco Valla wrote:
> > > Depending on the driver originating them, data buffers used for virtio
> > > communication can either:
> > >
> > >   - already be allocated from the coherent memory area that is
> > >     accessible by the remote processor; this is the case of rpmsg
> > >     and the rproc flavor of virtio-console;
> > >   - be allocated from generic kmem, and thus not accessible directly by
> > >     the remote processor.
> > >
> > > Exploiting the map operations, which are used by the virtio framework
> > > when VIRTIO_F_ACCESS_PLATFORM is part of a vdev's feature flags, add
> > > bounce buffering for the second case: when the map() callback is called
> > > for a buffer, one or more pages of coherent memory are allocated and
> > > data is copied to them, then they are exposed to the remote processor;
> > > the data is  then bounced back on unmap().
> > >
> > > The first case is not impacted, since buffers already suitable for
> > > remote transmission are passed through.
> > >
> > > With the bounce buffering in place, any kind of virtio device can be
> > > supported through the remoteproc-virtio transport, at least from a
> > > data exchange standpoint.
> >
> > Is this _necessary_ for the imx93 platform you are implementing feature for?
> >
>
> If I don't want to fundamentally change how the remoteproc integration
> works (i.e.: using buffers only from a pre-shared area), yes. While in
> my test environment the Cortex-M33 serving as remoteproc is able to
> access the whole RAM space, that is not always the case.

The first sentence tells me it is mandatory while the second says it
is not.  I understand the use case but don't want to bloat the
subsystem with code that is trying to address a problem you currently
don't have.


> This is even more important for mixed-criticality-ready processors (say:
> i.MX95), where access to different memory areas si defined even before
> the various application cores are started.
>
> For the sake of completeness, there *might be* a completely different
> approach that would work: modify every virtio driver to make sure they
> allocate buffers from the pre-shared memory area (that is, the coherent
> memory pool). That approach would even avoid the bounce buffering and
> allow for zero-copy transmission. I even started working on that,
> defining virtio helpers to do the allocations instead of using raw
> kmallocs, but then I dropped the idea because of the magnitude of the
> changes required.
>
> > >
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  drivers/remoteproc/remoteproc_virtio.c | 182 +++++++++++++++++++++++++++++++--
> > >  include/linux/remoteproc.h             |  14 +++
> > >  2 files changed, 190 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> > > index cfd66d9d1c9e..d21b3b8044df 100644
> > > --- a/drivers/remoteproc/remoteproc_virtio.c
> > > +++ b/drivers/remoteproc/remoteproc_virtio.c
> > > @@ -241,7 +241,14 @@ static void rproc_virtio_reset(struct virtio_device *vdev)
> > >     dev_dbg(&vdev->dev, "reset !\n");
> > >  }
> > >
> > > -/* provide the vdev features as retrieved from the firmware */
> > > +/* Provide the vdev features as retrieved from the firmware, plus the following
> > > + * additional ones:
> > > + *   - VIRTIO_F_VERSION_1 that is required by some non-rpmsg virtio devices
> > > + *   - VIRTIO_F_ACCESS_PLATFORM to force usage of the map operations
> > > + */
> > > +#define RPROC_VIRTIO_STATIC_FEATURES \
> > > +   ((1ULL << VIRTIO_F_VERSION_1) | (1ULL << VIRTIO_F_ACCESS_PLATFORM))
> > > +
> > >  static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > >  {
> > >     struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> > > @@ -249,7 +256,7 @@ static u64 rproc_virtio_get_features(struct virtio_device *vdev)
> > >
> > >     rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> > >
> > > -   return rsc->dfeatures | (1ULL << VIRTIO_F_VERSION_1);
> > > +   return rsc->dfeatures | RPROC_VIRTIO_STATIC_FEATURES;
> > >  }
> > >
> > >  static void rproc_transport_features(struct virtio_device *vdev)
> > > @@ -275,16 +282,16 @@ static int rproc_virtio_finalize_features(struct virtio_device *vdev)
> > >     /* Give virtio_rproc a chance to accept features. */
> > >     rproc_transport_features(vdev);
> > >
> > > -   /* Make sure we don't have any features > 32 bits except VIRTIO_F_VERSION_1 */
> > > +   /* Make sure we don't have any features > 32 bits */
> > >     if (WARN_ON_ONCE((u32)vdev->features !=
> > > -                    (vdev->features & ~(1ULL << VIRTIO_F_VERSION_1))))
> > > +                    (vdev->features & ~RPROC_VIRTIO_STATIC_FEATURES)))
> > >             return -1;
> > >
> > >     /*
> > >      * Remember the finalized features of our vdev, and provide it
> > >      * to the remote processor once it is powered on.
> > >      */
> > > -   rsc->gfeatures = vdev->features & ~(1ULL << VIRTIO_F_VERSION_1);
> > > +   rsc->gfeatures = vdev->features & ~RPROC_VIRTIO_STATIC_FEATURES;
> > >
> > >     return 0;
> > >  }
> > > @@ -337,6 +344,151 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
> > >     .set            = rproc_virtio_set,
> > >  };
> > >
> > > +static inline unsigned int rproc_virtio_bounce_slot(struct device *dma_dev,
> > > +                                               dma_addr_t dma_handle)
> > > +{
> > > +   const dma_addr_t dma_base = dma_dev_coherent_base(dma_dev);
> > > +
> > > +   return (dma_handle - dma_base) >> PAGE_SHIFT;
> > > +}
> > > +
> > > +static dma_addr_t rproc_virtio_map_page(union virtio_map map, struct page *page,
> > > +                                   unsigned long offset, size_t size,
> > > +                                   enum dma_data_direction dir,
> > > +                                   unsigned long attrs)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +   struct rproc_vdev *rvdev = dev_get_drvdata(dev);
> > > +   dma_addr_t dma_base = dma_dev_coherent_base(dev);
> > > +   size_t dma_size = dma_dev_coherent_size(dev);
> > > +   phys_addr_t paddr = page_to_phys(page) + offset;
> > > +   void *vaddr = page_to_virt(page) + offset;
> > > +   struct rproc_map_record *record;
> > > +   dma_addr_t map_handle;
> > > +   void *bounce;
> > > +
> > > +   // No need to allocate a bounce buffer if the memory to map is already
> > > +   // part of the device's coherent pool.
> > > +   if (paddr >= dma_base && paddr < (dma_base + dma_size)) {
> > > +           // The allocation details will be recorded also in this case,
> > > +           // indicating that no bounce buffer was allocated.
> > > +           map_handle = (dma_addr_t)paddr;
> > > +           bounce = NULL;
> > > +   } else {
> > > +           // Allocate bounce buffer from device coherent memory
> > > +           bounce = dma_alloc_coherent(dev, size, &map_handle, GFP_KERNEL | __GFP_ZERO);
> > > +           if (!bounce)
> > > +                   return DMA_MAPPING_ERROR;
> > > +
> > > +           // Copy data to bounce buffer
> > > +           memcpy(bounce, vaddr, size);
> > > +   }
> > > +
> > > +   // Save bounce details
> > > +   record = &rvdev->map_records[rproc_virtio_bounce_slot(dev, map_handle)];
> > > +
> > > +   record->original = vaddr;
> > > +   record->size = size;
> > > +   record->bounce = bounce;
> > > +
> > > +   return map_handle;
> > > +}
> > > +
> > > +static void rproc_virtio_unmap_page(union virtio_map map, dma_addr_t map_handle,
> > > +                               size_t size, enum dma_data_direction dir,
> > > +                               unsigned long attrs)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +   struct rproc_vdev *rvdev = dev_get_drvdata(dev);
> > > +   unsigned int slot = rproc_virtio_bounce_slot(dev, map_handle);
> > > +   struct rproc_map_record *record = &rvdev->map_records[slot];
> > > +
> > > +   WARN_ON(size != record->size);
> > > +
> > > +   // If a bounce buffer was used, copy data back to original one
> > > +   if (record->bounce) {
> > > +           memcpy(record->original, record->bounce, record->size);
> > > +
> > > +           dma_free_coherent(dev, record->size, record->bounce, map_handle);
> > > +   }
> > > +
> > > +   record->original = NULL;
> > > +   record->size = 0;
> > > +   record->bounce = NULL;
> > > +}
> > > +
> > > +static void rproc_virtio_sync_single_for_cpu(union virtio_map map,
> > > +                                        dma_addr_t map_handle,
> > > +                                        size_t size,
> > > +                                        enum dma_data_direction dir)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   dma_sync_single_range_for_cpu(dev, (map_handle & PAGE_MASK),
> > > +                                 offset_in_page(map_handle), size, dir);
> > > +}
> > > +
> > > +static void rproc_virtio_sync_single_for_device(union virtio_map map,
> > > +                                           dma_addr_t map_handle,
> > > +                                           size_t size,
> > > +                                           enum dma_data_direction dir)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   dma_sync_single_range_for_device(dev, (map_handle & PAGE_MASK),
> > > +                                    offset_in_page(map_handle), size, dir);
> > > +}
> > > +
> > > +static void *rproc_virtio_alloc(union virtio_map map, size_t size,
> > > +                           dma_addr_t *map_handle, gfp_t gfp)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   return dma_alloc_coherent(dev, size, map_handle, gfp);
> > > +}
> > > +
> > > +static void rproc_virtio_free(union virtio_map map, size_t size, void *vaddr,
> > > +                         dma_addr_t map_handle, unsigned long attrs)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   dma_free_coherent(dev, size, vaddr, map_handle);
> > > +}
> > > +
> > > +static bool rproc_virtio_need_sync(union virtio_map map, dma_addr_t map_handle)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   return dma_need_sync(dev, map_handle);
> > > +}
> > > +
> > > +static int rproc_virtio_mapping_error(union virtio_map map, dma_addr_t map_handle)
> > > +{
> > > +   if (unlikely(map_handle == DMA_MAPPING_ERROR))
> > > +           return -ENOMEM;
> > > +
> > > +   return 0;
> > > +}
> > > +
> > > +static inline size_t rproc_virtio_max_mapping_size(union virtio_map map)
> > > +{
> > > +   struct device *dev = map.dma_dev;
> > > +
> > > +   return dma_dev_coherent_size(dev);
> > > +}
> > > +
> > > +static const struct virtio_map_ops rproc_virtio_map_ops = {
> > > +   .map_page = rproc_virtio_map_page,
> > > +   .unmap_page = rproc_virtio_unmap_page,
> > > +   .sync_single_for_cpu = rproc_virtio_sync_single_for_cpu,
> > > +   .sync_single_for_device = rproc_virtio_sync_single_for_device,
> > > +   .alloc = rproc_virtio_alloc,
> > > +   .free = rproc_virtio_free,
> > > +   .need_sync = rproc_virtio_need_sync,
> > > +   .mapping_error = rproc_virtio_mapping_error,
> > > +   .max_mapping_size = rproc_virtio_max_mapping_size,
> > > +};
> > > +
> > >  /*
> > >   * This function is called whenever vdev is released, and is responsible
> > >   * to decrement the remote processor's refcount which was taken when vdev was
> > > @@ -355,6 +507,8 @@ static void rproc_virtio_dev_release(struct device *dev)
> > >     of_reserved_mem_device_release(&rvdev->pdev->dev);
> > >     dma_release_coherent_memory(&rvdev->pdev->dev);
> > >
> > > +   kvfree(rvdev->map_records);
> > > +
> > >     put_device(&rvdev->pdev->dev);
> > >  }
> > >
> > > @@ -429,13 +583,29 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
> > >             of_reserved_mem_device_init_by_idx(dev, np, 0);
> > >     }
> > >
> > > +   /* Allocate one tracking record for each page of the device reserved
> > > +    * memory. Contiguous memory is not required for this array, which can
> > > +    * also be quite big (depending on the size of the coherent memory), so
> > > +    * let's use vmalloc for this allocation.
> > > +    */
> > > +   rvdev->map_records = kvcalloc(dma_dev_coherent_size(dev) >> PAGE_SHIFT,
> > > +                                 sizeof(*rvdev->map_records),
> > > +                                 GFP_KERNEL);
> > > +   if (!rvdev->map_records) {
> > > +           dev_err(dev, "failed to allocate memory for map records\n");
> > > +           return -ENOMEM;
> > > +   }
> > > +
> > >     /* Allocate virtio device */
> > >     vdev = kzalloc_obj(*vdev);
> > > -   if (!vdev)
> > > +   if (!vdev) {
> > > +           kvfree(rvdev->map_records);
> > >             return -ENOMEM;
> > > +   }
> > >
> > >     vdev->id.device = id;
> > >     vdev->config = &rproc_virtio_config_ops;
> > > +   vdev->map = &rproc_virtio_map_ops;
> > >     vdev->dev.parent = dev;
> > >     vdev->dev.release = rproc_virtio_dev_release;
> > >
> > > diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> > > index c3ba51fe9e54..2ff48b505ac0 100644
> > > --- a/include/linux/remoteproc.h
> > > +++ b/include/linux/remoteproc.h
> > > @@ -339,10 +339,23 @@ struct rproc_vring {
> > >     struct virtqueue *vq;
> > >  };
> > >
> > > +/**
> > > + * struct rproc_map_record - remoteproc map record
> > > + * @original:      original virtual address
> > > + * @num: allocation size
> > > + * @bounce: bounce buffer virtual address (NULL if not used)
> > > + */
> > > +struct rproc_map_record {
> > > +   void *original;
> > > +   size_t size;
> > > +   void *bounce;
> > > +};
> > > +
> > >  /**
> > >   * struct rproc_vdev - remoteproc state for a supported virtio device
> > >   * @subdev: handle for registering the vdev as a rproc subdevice
> > >   * @pdev: remoteproc virtio platform device
> > > + * @map_records: array of map records
> > >   * @id: virtio device id (as in virtio_ids.h)
> > >   * @node: list node
> > >   * @rproc: the rproc handle
> > > @@ -358,6 +371,7 @@ struct rproc_vdev {
> > >     unsigned int id;
> > >     struct list_head node;
> > >     struct rproc *rproc;
> > > +   struct rproc_map_record *map_records;
> > >     u32 rsc_offset;
> > >     u32 index;
> > >     unsigned int num_vrings;
> > >
> > > --
> > > 2.55.0
> > >
>
> Regards,
> Francesco
>

