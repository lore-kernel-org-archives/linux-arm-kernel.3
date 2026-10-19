Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F279CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjpKNxbRFa0QN2xvZXyNEaUJwKZqQxqRu5XGn6mWryk=; b=pwNneeteLz8XJE+hOlfdR0Qo3S
	lxT/9J4NKrkfVhdqvL3d+VHGOu++HzPi89DCRDCDlWa0jZpPTQ9XpfCUm9MkUdimFdpAd3tjkYcHh
	BohsZGQ2ypgctdz96Z0xTDa92zojoX98XXzhZU6DJOPsUMbu8baUuuPnRYn2NGO4lEUjzC4+PypM4
	2+FdQo6xlO0fcib47Vf+6DLh99C8a4Ismv3c7xJdGvM63eMTQugYgpD5AB1h4CGzktXMkOk7i2NV8
	jaCXu45sZcPpRdMk+MsHaCtrJ1u8vYCkA0V5ZEg5jNBTN1bQmgj/O3wLw5fMVQZhkKahed+RzjS9D
	EJ8eoleA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiZb-00000006rIB-3TNS;
	Mon, 19 Oct 2026 08:18:23 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiZW-00000006rHa-2LRs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:18:22 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2e8623790f8so67185ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792397898; x=1793002698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wjpKNxbRFa0QN2xvZXyNEaUJwKZqQxqRu5XGn6mWryk=;
        b=mLsvrb9ZElpSNFOco6uTPajGlNtF00fVSt2h6JvacuvlDDA2PCcEUn7lFq15MHqCR+
         kvW9FgBjYf7h/U+xYvF42O3gSli8bqYa6CuMS7TuKwuUY+bNA0jewL0b4gF5fuM7qQc0
         ZnMo9jPX26f/r/3ktitYzrwKOBPGfavcOi8RkfwcodOg7eU3min/xR2ba38gaS1CCg1i
         ZyaqIvktiRB/Qa7+OqLSsR1lcUlia+XCIXub7YJb4pA0feDx2vHKPjDMzRSj78lkDafQ
         8HLfGxFwMhltDVrMwTDqkvjFRWY5Ir+F2LJsEWJsWSGi4FUg7JklaQuRI0cktWBDZH+6
         rU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397898; x=1793002698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wjpKNxbRFa0QN2xvZXyNEaUJwKZqQxqRu5XGn6mWryk=;
        b=dU52fyjJCT6y6qqC7NRYIFvacmnS1f1YH9cvTje22hrAkHVL3f1+vCULCwc3VvP7Z+
         v2t5wGtT57uFIqqYEnrI5vFK2ftOf71ZzPyD353k1QsSmCQphga/H1QHbMxnvqkCRAcd
         t/eZgNXmjdhTiXhV8pdECG0673vPaJ9/cGuKHSY6Yr8JR2uj+V4D85ZnNcp3RK1fkMNf
         cfNzSAfGDzU0jAQ/hD0/ibw0rT/L9S0sTSLIDIc6lRZA01ISDiDfKTrUD4Tdz9w05mag
         0An2aikdXaMV07mOE8WXfnpcolDgoEMaLNBCKDWblb10TecfzA8FxOSVSMWMTjzjYq0w
         XS3w==
X-Forwarded-Encrypted: i=1; AKwUvBwt/KFJmSr7wWFUfPHNn8uClzgW5qufpGlCHYBollaXmerzg/QSOrmaoSFHKxzRdDsqXTL4R1suqgAgw7jN/3ly@lists.infradead.org
X-Gm-Message-State: AFq9FYKIVUn8+gy2K+zz8sKoq1gStms3kg9WBPv6tYwA7fP+FwPCn1LP
	MaFbERERo8MoM0rU8FUI+slDq6xEqtA2aHXGDYShPdvw+93601IDsXhvbnO+bGCzAQ==
X-Gm-Gg: AYBFou0Vdp+Mr2wqD6H3hK0Sy3AUalEaHA4d8V7/Ut5I3CRHQWrbjp/XsIi5oZK7AR+
	Uhy8FmzcmcyjJbG6baj10g5RpTwqV6FkiWnQmCjVyaiveIPr3X9DJF0YC/tdPziqeb9kG7/bSEw
	clPx8VV5bkauOxZAl0qTGlhv2NMeD0ISCw3KamiQg58UsHOUm5o9hZgJFzDml1ggWH0YKwU3Q11
	wBpZn0Hl9h8AKfmenvWIMPdw2p3Za+mt39DhtKYIY/i6Q6uP+P//yKYTr7fS/jggMInLmwMyllz
	Tvu33yAOlMAc1+X5EEARIhqAf7LpB+kVOB3b3ATN8epqStasdjjA8qw0nfFeKaPc8cavCIaOi6b
	WhLwCzC9ihkW6Zs1A9+DiC38kUrJUy0QOAVIFNRj/AVHzLrRukTCoT+VOrH0fxXSTBkJzUXVjdG
	NIJ9w9T5NBJBirBjc0/ks3ipR+MViYb6Rpv5qy9/E3DX/e+XDSs3Oh76eUFK8BqLuY48/vtahu0
	emvIJeaJZ3OPVqfL5NoHE++hgxYGJeena5LiQ==
X-Received: by 2002:a17:903:1967:b0:2d5:db38:8010 with SMTP id d9443c01a7336-2e9b332b4d8mr6634505ad.15.1792397897247;
        Mon, 19 Oct 2026 01:18:17 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017244sm3517077b3a.47.2026.10.19.01.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:18:16 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:18:08 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	sashiko-bot@kernel.org
Subject: Re: [PATCH v11 07/16] genirq/msi: Cache MSI message in
 irq_chip_write_msi_msg()
Message-ID: <atXSQFvKWo_xAw9l@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-8-praan@google.com>
 <875wz4eyqe.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875wz4eyqe.ffs@fw13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_011818_602295_915CA7AC 
X-CRM114-Status: GOOD (  30.67  )
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

On Wed, Oct 14, 2026 at 11:52:41PM +0200, Thomas Gleixner wrote:
> On Tue, Sep 29 2026 at 03:45, Pranjal Shrivastava wrote:
> > Currently, PCI MSI caches the composed MSI message into the MSI
> > descriptor inside __pci_write_msi_msg(), whereas platform MSI and other
> > device MSI domains do not cache the message in the core, forcing
> > individual drivers to manually copy the message into desc->msg if they
> > need to restore it across power transitions.
> >
> > Cache desc->msg in irq_chip_write_msi_msg() before invoking the chip
> > callback so all hierarchical MSI domains automatically record the
> > latest message. Document why the redundant assignment in
> > __pci_write_msi_msg() must remain for direct callers outside the
> > irq_chip hierarchy.
> >
> > Suggested-by: Thomas Gleixner <tglx@kernel.org>
> > Signed-off-by: Pranjal Shrivastava <praan@google.com>
> > ---
> >  drivers/pci/msi/msi.c | 6 ++++++
> >  kernel/irq/msi.c      | 9 +++++++++
> >  2 files changed, 15 insertions(+)
> >
> > diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> > index 80a9db417dc8..f7bedc31d486 100644
> > --- a/drivers/pci/msi/msi.c
> > +++ b/drivers/pci/msi/msi.c
> > @@ -257,6 +257,12 @@ void __pci_write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
> >  		pci_write_msg_msi(dev, entry, msg);
> >  	}
> >  
> > +	/*
> > +	 * Although irq_chip_write_msi_msg() already caches the message,
> > +	 * keep the assignment here for callers that invoke
> > +	 * __pci_write_msi_msg() or pci_write_msi_msg() directly outside
> > +	 * the irq_chip hierarchy.
> > +	 */
> >  	entry->msg = *msg;
> >  
> >  	if (entry->write_msi_msg)
> > diff --git a/kernel/irq/msi.c b/kernel/irq/msi.c
> > index fb5f372215bf..df460a574d80 100644
> > --- a/kernel/irq/msi.c
> > +++ b/kernel/irq/msi.c
> > @@ -634,6 +634,15 @@ static unsigned int msi_domain_get_hwsize(struct device *dev, unsigned int domid
> >  static inline void irq_chip_write_msi_msg(struct irq_data *data,
> >  					  struct msi_msg *msg)
> >  {
> > +	struct msi_desc *desc = irq_data_get_msi_desc(data);
> > +
> > +	/*
> > +	 * PCI Multi-MSI shares a single descriptor across all vectors and
> > +	 * the device stores only the base message. Cache the message of the
> > +	 * first interrupt only, so that sub-vectors cannot overwrite it.
> > +	 */
> > +	if (desc->irq == data->irq)
> > +		desc->msg = *msg;
> >  	data->chip->irq_write_msi_msg(data, msg);
> >  }
> 
> Sashiko reported correctly:
> 
> > [Severity: Critical]
> > Does this code cause a NULL pointer dereference for domains without an
> > msi_desc object?
> 
> So this needs to be:
> 
> 	if (desc && desc->irq == data->irq)
> 		desc->msg = *msg;
> 
> Did not think about that, but that also means that this patch was not
> tested on any recent (less than 10 years old) Intel x86 platform or a
> x86 VM exposing HPET...
> 

Ack, I'll fix that, and yes, I've tested this on arm64 platforms only.
I'll pick up a recent Intel x86 platform as well, to test this.

> Thanks,
> 
>         tglx
> 
> 

Thanks,
Praan

