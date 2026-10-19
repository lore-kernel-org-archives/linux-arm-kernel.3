Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F83CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJdZXHdbMv74njH384nYFNZ44vSOhnp4TPEILn84FiQ=; b=mqfo4Ekqe31t2BJNZS81ydM8im
	aD3jbiX8XldliztjYExmO058RysQUKbiTXKeTxLwWB5ba/6gW+CSdCgsma/bYJ+DvpQudtxeyEV1L
	BLW9EMUBwAFcbZMHoGjQaYis10VYcwebv3r23JjAqSdGSW9Xzv8VHRFG9hebAEaqtUEUm5ZZk7PSi
	0jvcdeAmUx+7MnorT8eZMRUCoS96kSAmknx6QREV2vxKXG0rrMgPicVjM+hboB90+8H/oyXXD5kap
	v1DhbQUBgwBooXQj+gEJCl+ZmfaSWFAZ+lMfOUcXwovHnyw5lzfmtm4UbLYUsi9yr4hoTW9H0rnHr
	m915eKig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiag-00000006rNK-0asW;
	Mon, 19 Oct 2026 08:19:30 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIiae-00000006rMs-0TPv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:19:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so45745ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 01:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792397967; x=1793002767; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJdZXHdbMv74njH384nYFNZ44vSOhnp4TPEILn84FiQ=;
        b=iqkF7hWhwtMwDRtseLlvPi4aYwhpa8EErFQWZvREPl6T3lLOLfNfQa2dTOdTrkGcVB
         0p7/dZsWP07NQQh6GdFmppvLZmeWn+EBi6qaYJULpJ0QMbj52w28gmSzAQfRKdxckaar
         AzmvFX+OKz9Lvult1LCKg/wnM6+AclN+2KFJGhOAcBgSsmP0zLXRBCaD23rlqT3zkUDs
         NxzftFfIAXloOK3koOdCZwBFIo08BqbYnI1vGizX4NpchBQiVMclDoixVTdnxu3KAXAR
         szG6uB75N6uMDDXavbl+IncfPBQBUH8mPZR5LiAX5+Ci1uzMhPXdqnjhHe/32eSGgn1U
         Nrkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397967; x=1793002767;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJdZXHdbMv74njH384nYFNZ44vSOhnp4TPEILn84FiQ=;
        b=Rdb0tclo29Q5RDKE3cgT0nWMQW5FwG7d0vae3Km7XWVjhxQg9GacYRZtCQWjYBeI++
         35WEY7jxsW5iJ4eLbkCHZ00mpWPc2Kgp0GfbemVHhYVQvxVuBlRuEvYWzAotktdvhR3c
         MIBWDSZT3GJ8gHgwMZT66VrGuylUNPPkGfjMQrTFjbNDYWB+aRVTv0jOvPiMPkG1V3OT
         LiWabxYlpnt3EQKPx3TOGjfvcqp6jMnS5cCfUESDWeN3AEjCld0+eEtT0p6fYPF7vlMV
         DCvxhAv0IUVVE8bhdgFrGK5pOg7H7GEFQGfzlo6gHjOEyemooN75nTx4XlfMCTlOmb4s
         fS/A==
X-Forwarded-Encrypted: i=1; AKwUvBzQoNrUqq0VlUGAxJKgc4LG+FshB6q1Ic3swaHWcC7i70yVoFcgpIXipo5E66+w8RHE48Tu6rZdc+Fg0I0lh7Ds@lists.infradead.org
X-Gm-Message-State: AFq9FYL5yHHPlbrN38Swv7gf38aB0YddYItPDrsokrXjQukUpQzvyuzZ
	+OjtVwnRUSD7fTe8rmNbGjqaVqb6RCA69cY/6064eBAmsq2JbZ4l7OLuhwqmGJK3+g==
X-Gm-Gg: AYBFou2Sagtn2d/zxdMHfp3jHXzMajheLwpNP8jgznWXDmag18+RKz5JZN0ZdHbephr
	bjpEjXQqSx8RGN8Yvt41/CXWp79HEVxEoabh7W7WKvVOX7o6djKIbhQ3eur4hmnspbTevQS0Fs3
	ccd0FnabOq8cHtMeDWFOLLaJLAxN/wfG5CmEI4euaud6MkPCxPtU8pg/wxc7HajXsRJWuffhpHU
	GMhMESwR0C6Wzg+6sHv/fglC3NRNS+ohjwPALMm0ESHIdxgxcBelD89ZmbNAtzroMtZi7gY0pT2
	nRo4eG/TVR0Cwuo/aCVWZXvt//HjBvNDyCDSeOWIHexIliXkt2hK7DjU/lMaZI8mOAz0TLfkecS
	P6TUTJ4rCL1G/EF4tGLpTl+xCQ+99cZWv4TO1SKdsbrwYb3V+8lXmRlzwxh2Vv2AduZCipjUhiY
	eNRNSsdinJU7xN+kFGwpVd8SKH29+EBAFq/fyS//lwPxw1Jqo1qHY4he0XwErCv+G/MG5HstCug
	Us6Vtt9XpePStOp7uuUIk1hTj7zJV0IzAOA
X-Received: by 2002:a17:902:d2d0:b0:2e6:12af:5b04 with SMTP id d9443c01a7336-2e9ae497cc4mr6838265ad.0.1792397966463;
        Mon, 19 Oct 2026 01:19:26 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad48dc2f1bsm865449a91.4.2026.10.19.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:19:26 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:19:18 +0000
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
Subject: Re: [PATCH v11 08/16] genirq/msi: Provide
 msi_device_domain_restore_msi_msgs()
Message-ID: <atXShi9ReURhBmdB@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-9-praan@google.com>
 <8733u8eygy.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8733u8eygy.ffs@fw13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_011928_156488_2FAB7B03 
X-CRM114-Status: GOOD (  21.24  )
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

On Wed, Oct 14, 2026 at 11:58:21PM +0200, Thomas Gleixner wrote:
> On Tue, Sep 29 2026 at 03:45, Pranjal Shrivastava wrote:
> > +void msi_device_domain_restore_msi_msgs(struct device *dev, unsigned int domid)
> > +{
> > +	if (!dev->msi.data)
> > +		return;
> > +
> > +	guard(msi_descs_lock)(dev);
> > +	struct irq_domain *domain = msi_get_device_domain(dev, domid);
> > +
> > +	if (!domain || !irq_domain_is_msi_device(domain))
> > +		return;
> > +
> > +	struct xarray *xa = &dev->msi.data->__domains[domid].store;
> > +	struct msi_domain_info *info = domain->host_data;
> > +	struct msi_desc *msi_desc;
> > +	unsigned long idx;
> > +
> > +	xa_for_each_range(xa, idx, msi_desc, 0, info->hwsize - 1) {
> > +		/* Only handle MSI entries which have an interrupt associated */
> > +		if (!msi_desc_match(msi_desc, MSI_DESC_ASSOCIATED))
> > +			continue;
> > +
> > +		scoped_irqdesc_get_and_buslock(msi_desc->irq, 0) {
> > +			struct irq_data *data = irq_desc_get_irq_data(scoped_irqdesc);
> > +			struct msi_msg msg = msi_desc->msg;
> > +
> > +			if (data->chip)
> > +				irq_chip_write_msi_msg(data, &msg);
> > +		}
> > +	}
> 
> In this case sashiko is wrong:
> 
> > [Severity: Critical]
> > Will this result in a NULL pointer dereference in hierarchical IRQ domains?
> > 
> > Since irq_desc_get_irq_data() retrieves the top-level irq_data, data->chip
> > points to the top-level irq_chip. In hierarchical IRQ domains, the top-level
> > irq_chip typically does not implement the irq_write_msi_msg callback.
> > 
> > When this top-level irq_data is passed to irq_chip_write_msi_msg(), it will
> > dereference a NULL function pointer:
> 
> All MSI top level (device) domains implement the irq_write_msi_msg()
> callback. That's the whole point of the top level MSI domain as that's
> the one which has access to the device and the associated message store.
> 

Ack, I can try folding this into a comment to avoid sashiko reporting
this multiple time in the v12.

Thanks,
Praan

