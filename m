Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1F9CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6UtM+mrEbWvdiZq7RwbmiMw4xat7iAVafn8ttC98/M=; b=kF706V17KUW2usiDwV62UlTI4g
	gW1HnazIPkl6+pYaFZmseFBMVrf4GR+CG0USI8+4SJJSOt5T/cp7hOYvLjXL1U/rNOZ/UOSv6/up/
	ObuEbwhxLjuaRbug2AsZQpYZTJURhhHr4Jalg0JtkFnpXAOTBv70OTsQd0HF7FFzucVUGBmNA0C4B
	B43zA4Fh2vngG8QqDGdGtZpXldFZjZ+iCnrPbZNgw/AaPWrhA81+EtGr+8OciNxThjOdsswUp/2ic
	7BE/Pfe55wTSqz6LdOuDeCTZTNisW50xxxChZwCGF2nSH5AvfEquW2xq6L8/McNa0r4ETo47iXqjX
	OowAvDjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytfD-0000000CVaw-1oul;
	Wed, 17 Sep 2025 15:01:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uytfC-0000000CVZV-0wws
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 15:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A2CEE601ED;
	Wed, 17 Sep 2025 15:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F437C4CEE7;
	Wed, 17 Sep 2025 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758121301;
	bh=FnHcUlKUC42/SYE9xNAGo27o6RvndkxUBiBXrKyn4ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZD9iNAKAciuuXbJcA9dTxRlg9L+yS0ZBIjTtv3pO1JLNZDANejYVfBJl8Gmww85dy
	 zEfHpd/hCIIKzwOjetUnfjIr1oBlV4fuHX37qC9bP3/iSU+OBuNi6ovn+sC5xGpb9s
	 VluPfZGQl+q8JlHVeL9pk4yWoAFOufOlVBAKuc2oGJRotMhIpbJVQB4LNKU3rZLANC
	 czCejl5Comb+k+TvjEN5GPKWSB4To8WlMOTtSzBR40KRDXxH9soU5S8Yz2vOaE/Q9S
	 t8VKybdE2tHqpdy4P40/sFiLoN9MFDu6aX+ui6XBr1nKsd1FWdYRShUG2DuwJocOlJ
	 Hkt1VJExZpVSA==
Date: Wed, 17 Sep 2025 16:01:34 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <aMrNTny9jgZJd_Ef@willie-the-truck>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
 <20250915163858.GK882933@ziepe.ca>
 <aMl_5j8G3IGulAC6@google.com>
 <20250917123601.GA1326709@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917123601.GA1326709@ziepe.ca>
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

On Wed, Sep 17, 2025 at 09:36:01AM -0300, Jason Gunthorpe wrote:
> On Tue, Sep 16, 2025 at 03:19:02PM +0000, Mostafa Saleh wrote:
> 
> > I think the fix for the problem Will mentioned is to just use CMOs
> > before accessing the host structures, so that should be simple.
> > If it turns to be more complicated, I am happy to drop the support
> > for non-coherent devices from this series and we can add it later.
> 
> I feel like it is easier/better to fix the driver to use cachable
> memory than to add CMOs to the pkvm side..

Hmm, but for non-coherent SMMU hardware (which sadly exists in
production), I don't think there's a way for firmware to tell the driver
that it needs to issue CMOs for the page-tables and the CDs but not the
other in-memory data structures (e.g. STEs). I suppose we could do it in
some pKVM-specific way, but then that's not really helping anybody else.

Will

