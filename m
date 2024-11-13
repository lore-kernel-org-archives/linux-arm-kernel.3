Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83068D637C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 21:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19WqiZx5bXY2R+jht+rSBfkiigCwXnU+vnSwdvgIJwQ=; b=Q+YAWqKeRIPchctdUVr98aj14Y
	5t+1AiMt10lsM5cdPfbCWXQnXcMtqej2hn88fUZFvFsSYGzh6ws9MgPp2RM+zUTTwkR1YUdl+Ev9a
	YmnB0h2slMqsSG+5GS51sO2BxTT7lSL1BPIMOoYLL1zZdtNqaVUfMhjeFtV10cG3q1/hySKcKrMpl
	Pt64HwxJYN0FntzfaKqMZwUile1FTgiALnMNFcblXKgKhZlUVm2k/pZmVzf5rFIGr5TOjK94ZnwA8
	8udF94tf18Ybfvd+lHFnVBqcWj0G/+sYh4t5b+z1FleTeXuppSITVEq3jj8mHjz9sWk+UN6WbEdNd
	01RNAkGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKg5-000000082an-3tKC;
	Wed, 13 Nov 2024 21:13:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBKeA-0000000829T-3MQV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 21:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731532288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19WqiZx5bXY2R+jht+rSBfkiigCwXnU+vnSwdvgIJwQ=;
	b=gGSja/AJZXKf/1oL/OvuPAR6/m3HlV/R57OWQfuuHI3BfQhCSTOwH1BPVqjPi0vZdq0Rwl
	6Ku7IwSbCykMSGTE39KqQdpxMz9S1GrGiMmgzdw5e5E+cHnrIH2zNzEwciPup1gKkXnKo8
	SrSd2oo1B7f5eK5Oc8eLY8QDxQiUYfk=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-yRUZbDusNqCEkpOru02Oxg-1; Wed, 13 Nov 2024 16:11:26 -0500
X-MC-Unique: yRUZbDusNqCEkpOru02Oxg-1
X-Mimecast-MFC-AGG-ID: yRUZbDusNqCEkpOru02Oxg
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-83abbe0a16dso47156939f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 13:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731532286; x=1732137086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19WqiZx5bXY2R+jht+rSBfkiigCwXnU+vnSwdvgIJwQ=;
        b=iDqR+EKuojRT3FADDQYDBdzifxDLMMi3lD9Qd5ZEmNOliDHwDMS+HA2K3cdb0/FLRP
         lgrTxNfy3waqSA1IKBms/aAx0qsiiNjYz8r//cGZVIjObekaqQgjibpTRBTSDMsRDYjR
         B1PzuY96f2tlOK7MKIMmDgvW8rnsbz6Xieymrt4OJ5uaOmEfXc0mHT3Ly4bRCtHVzrSD
         4f6gYPVyw0jkxvPUkey+0DOBNM7YiGahbf8be+pvB/rW02kqL34zKAJBjVsBVY3Ei3X8
         CTNSnsitEynrJwVdp8NRMw7E6EDAc4ktQmQiJYY2aQvJP16nJXZkE9pHewhmSQe8mELr
         3UWA==
X-Forwarded-Encrypted: i=1; AJvYcCX7Vh+Phw/QCMbvKY1aE6T3BHT9kzqLUFgg1OMyiuE+eITQYdnxdjt7RSs70lF1Ayk+t9XCmlSNTUlctQH1/6zf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7wntlFNxnNdj1Z4Uv/8sCJBYgb5UhLMqDd1cIPOUD+YsUISKL
	+w+gucxyMWcAlTrr5OfFF4T7dUEN40iN39RXSCLLjmvGahib8YwDizWwKRdKrn47ybvsCZfy95A
	qrldTymPik3saCpdgv/7Vs968cMMWjoRWXs0bI1BpVM6T+DxNoW12epmuTCn0FR3in4XUQ4aJ
X-Received: by 2002:a05:6e02:194d:b0:3a6:c23b:5aa9 with SMTP id e9e14a558f8ab-3a6f1a58b22mr59857855ab.4.1731532286169;
        Wed, 13 Nov 2024 13:11:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcnNYHsvq3x3d625NCahmbJAqiMdAoQaQkPCDLvS9tewBxW1j7AU7rltZUYu0Dp25868Fj8g==
X-Received: by 2002:a05:6e02:194d:b0:3a6:c23b:5aa9 with SMTP id e9e14a558f8ab-3a6f1a58b22mr59857625ab.4.1731532285757;
        Wed, 13 Nov 2024 13:11:25 -0800 (PST)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a6f983826csm31967665ab.27.2024.11.13.13.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 13:11:25 -0800 (PST)
Date: Wed, 13 Nov 2024 14:11:22 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, tglx@linutronix.de, Robin Murphy
 <robin.murphy@arm.com>, maz@kernel.org, bhelgaas@google.com,
 leonro@nvidia.com, shameerali.kolothum.thodi@huawei.com,
 dlemoal@kernel.org, kevin.tian@intel.com, smostafa@google.com,
 andriy.shevchenko@linux.intel.com, reinette.chatre@intel.com,
 eric.auger@redhat.com, ddutile@redhat.com, yebin10@huawei.com,
 brauner@kernel.org, apatel@ventanamicro.com,
 shivamurthy.shastri@linutronix.de, anna-maria@linutronix.de,
 nipun.gupta@amd.com, marek.vasut+renesas@mailbox.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, kvm@vger.kernel.org
Subject: Re: [PATCH RFCv1 0/7] vfio: Allow userspace to specify the address
 for each MSI vector
Message-ID: <20241113141122.2518c55a.alex.williamson@redhat.com>
In-Reply-To: <20241113013430.GC35230@nvidia.com>
References: <cover.1731130093.git.nicolinc@nvidia.com>
	<a63e7c3b-ce96-47a5-b462-d5de3a2edb56@arm.com>
	<ZzPOsrbkmztWZ4U/@Asurada-Nvidia>
	<20241113013430.GC35230@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iiqKDrIsRDpN_l0HUHw0DOrdcDX8qqvlk24jznZMF6w_1731532286
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_131130_960191_9CA0288C 
X-CRM114-Status: GOOD (  32.78  )
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

On Tue, 12 Nov 2024 21:34:30 -0400
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Nov 12, 2024 at 01:54:58PM -0800, Nicolin Chen wrote:
> > On Mon, Nov 11, 2024 at 01:09:20PM +0000, Robin Murphy wrote:  
> > > On 2024-11-09 5:48 am, Nicolin Chen wrote:  
> > > > To solve this problem the VMM should capture the MSI IOVA allocated by the
> > > > guest kernel and relay it to the GIC driver in the host kernel, to program
> > > > the correct MSI IOVA. And this requires a new ioctl via VFIO.  
> > > 
> > > Once VFIO has that information from userspace, though, do we really need
> > > the whole complicated dance to push it right down into the irqchip layer
> > > just so it can be passed back up again? AFAICS
> > > vfio_msi_set_vector_signal() via VFIO_DEVICE_SET_IRQS already explicitly
> > > rewrites MSI-X vectors, so it seems like it should be pretty
> > > straightforward to override the message address in general at that
> > > level, without the lower layers having to be aware at all, no?  
> > 
> > Didn't see that clearly!! It works with a simple following override:
> > --------------------------------------------------------------------
> > @@ -497,6 +497,10 @@ static int vfio_msi_set_vector_signal(struct vfio_pci_core_device *vdev,
> >                 struct msi_msg msg;
> > 
> >                 get_cached_msi_msg(irq, &msg);
> > +               if (vdev->msi_iovas) {
> > +                       msg.address_lo = lower_32_bits(vdev->msi_iovas[vector]);
> > +                       msg.address_hi = upper_32_bits(vdev->msi_iovas[vector]);
> > +               }
> >                 pci_write_msi_msg(irq, &msg);
> >         }
> >  
> > --------------------------------------------------------------------
> > 
> > With that, I think we only need one VFIO change for this part :)  
> 
> Wow, is that really OK from a layering perspective? The comment is
> pretty clear on the intention that this is to resync the irq layer
> view of the device with the physical HW.
> 
> Editing the msi_msg while doing that resync smells bad.
> 
> Also, this is only doing MSI-X, we should include normal MSI as
> well. (it probably should have a resync too?)

This was added for a specific IBM HBA that clears the vector table
during a built-in self test, so it's possible the MSI table being in
config space never had the same issue, or we just haven't encountered
it.  I don't expect anything else actually requires this.

> I'd want Thomas/Marc/Alex to agree.. (please read the cover letter for
> context)

It seems suspect to me too.  In a sense it is still just synchronizing
the MSI address, but to a different address space.

Is it possible to do this with the existing write_msi_msg callback on
the msi descriptor?  For instance we could simply translate the msg
address and call pci_write_msi_msg() (while avoiding an infinite
recursion).  Or maybe there should be an xlate_msi_msg callback we can
register.  Or I suppose there might be a way to insert an irqchip that
does the translation on write.  Thanks,

Alex


