Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B97ECA5FDD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BBvnzeVp5FHZbtbBZ742DHLscz+VvjPcvOwODIGv8pw=; b=acsGvpVZHKewCYnLlVEtGL5c7u
	svPlgRdlOT2JmrWq6dFtuKHvJpc5VUa51ZAlUBXRMrwx1UWbopXUAYFXfWjhitiYpWKiMUJQwh5UO
	689cE6UCvxApuWZLvI9ZLkc/0DSIpBVRRznX0B+WRfQT1OzhNz1UBuEUzsSwoMDUQ2Hg5Z23/xbt2
	4UnMFHMY+E5smr34RxC6l2X/a3y9YzRCzx/67AVEpuQwOHzYtsi9UqKEPucylz6AicuOWguBB37WY
	QRwRkpcbF997Z59ubvcEImrYZAiuvuCj5BIZmVYi3RdicNJj2F8vPhP+lOT8tMLeAWRPDxb9ATUqa
	C0ocm/5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfGs-0000000BwD2-0vnq;
	Fri, 02 Oct 2026 15:34:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCfGq-0000000BwCT-3ytV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 15:34:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 25D4B60A8C;
	Fri,  2 Oct 2026 15:34:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B48C1F000FF;
	Fri,  2 Oct 2026 15:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790955239;
	bh=BBvnzeVp5FHZbtbBZ742DHLscz+VvjPcvOwODIGv8pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XWjFqyFh/EG972dwRFuGfXIxWJ8hldbJMvx9UV/6AREZaqE4lrtN1YXaUywZDdaHD
	 Q2ZSH1eValsjSi+u84xNA3G4wHT8ZIfkCn49rQGHxQr4e3hpQOeqgPeu4agZj0xzJg
	 LnJfRYjxBg/69Q8uhAeq13pk6Y1s8Al917oAsW3aN/WtN4MOKF3rlipnT/iHgIoe2p
	 q+fuaNEtlo66Zx3gwEpj8AzbX0Lp+taf+9dhW7icW5HjQc9k7MXS9JgDI7oto7usjE
	 RE+BzBk0gMlrnYIPp5M783xe34Yvwl73O/IWpIzpaQDIJdWPWaNWtufA+4PgCf8tYd
	 FQvTq59FnAg5w==
Date: Fri, 2 Oct 2026 16:33:52 +0100
From: Will Deacon <will@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>,
	Usama Arif <usama.arif@linux.dev>, kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] iommu/arm-smmu-v3: Add a cmdq_max_n_shift module
 parameter
Message-ID: <ar_O4DNgwOA7Kz4i@willie-the-truck>
References: <20260909095228.2174031-1-kas@kernel.org>
 <20260909095228.2174031-2-kas@kernel.org>
 <179018301689.3334538.1783583175230817305.b4-review@b4>
 <arZFDAofKaurSjCd@thinkstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arZFDAofKaurSjCd@thinkstation>
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

On Fri, Sep 25, 2026 at 11:01:31AM +0100, Kiryl Shutsemau wrote:
> On Wed, Sep 23, 2026 at 02:03:36PM -0300, Jason Gunthorpe wrote:
> > > [ ... 34 lines skipped ... ]
> > > @@ -40,6 +40,11 @@ module_param(disable_msipolling, bool, 0444);
> > >  MODULE_PARM_DESC(disable_msipolling,
> > >  	"Disable MSI-based polling for CMD_SYNC completion.");
> > >  
> > > +static unsigned int cmdq_max_n_shift;
> > > +module_param(cmdq_max_n_shift, uint, 0444);
> > > +MODULE_PARM_DESC(cmdq_max_n_shift,
> > > +	"Cap on the command queue depth, as log2 of the number of entries. Zero means the hardware maximum; the queue never shrinks below one page.");
> > 
> > The patch looks ok
> > 
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > But I'd rather use lg2 as name, especially user visible, instead of
> > n_shift. "shift" is a word for bitwise stuff, this is a 2**N log2
> > encoded value.
> 
> This name has changed twice already. v5 took the value in entries.
> Nicolin asked for a log2 value and named it after max_n_shift, which is
> what the driver calls this quantity everywhere else.
> 
> I would rather not rename it a third time without input from the
> maintainer.
> 
> Will, this is the user-visible name. Do you have a preference here?
> Unless you want it changed I will leave v6 as it is.

I don't have really strong opinions on naming, but since Jason has given
a reasonably complete outline of the change and I have a small preference
for the lg2-style naming (rather than exposing the name of an internal
driver variable), it would be great if you can spin a v7 with that
included so that I can pick it up.

Thanks,

Will

