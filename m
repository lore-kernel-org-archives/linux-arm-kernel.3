Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C663606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 14:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a5PvSWb6;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T5r4xfWP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYPK0zHlt9UxDqRXbbPbYofEwQ4ui24gzT+k2p3Lc/4=; b=a5PvSWb6ztooTneG9LXA4wimDo
	H/AOvLoMrF4pAImX9EE3Wm2v8a97Wgl/dJQ8J+NJ/s5x5881ltm/pX6AGDXg9e7UW9QZZZRI1zWcQ
	RHWPE0lUdAswBhE195vBcmt+zjYYQpJQSZo90bYDZE6DsjkSM9Rt2B6T9I0CugIYwH9pNhhVmwKSc
	1RMZ99dxVyPiAmN1zcokg1CwoZvh5MCezYKsnq/XyNp4kslSXcfYrzoXFTrzkDv1NxiG7jy7pp0S7
	SZ8NMYgKubyv8gjKQdeb3I0Yoy1nXKmFJHzHiRR2JI/xpYa7J5G74rhIDg/ed8QWmSO1+GQAIwh8H
	PFG5Pf0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXd3-0000000C8zx-2L4S;
	Wed, 21 Oct 2026 14:49:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJXd2-0000000C8zU-1lOL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 14:49:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D53C24171D;
	Wed, 21 Oct 2026 14:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016F41F000C1;
	Wed, 21 Oct 2026 14:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594159;
	bh=sYPK0zHlt9UxDqRXbbPbYofEwQ4ui24gzT+k2p3Lc/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T5r4xfWP2PK69r+XNBkMeHyhCwi3cjamhJGZkcdMr/65YDJfxxbv9SEP7RvGcoQ+E
	 M8WE/+TpQgSFSHezN7NNnQxVLlPUxmXWOknkQcowvXzvYY75bTiX0ZfITUEBvmsE8Q
	 eN+SglFjuuQhhRRCXOesKqM7MeK78fZNFN2+oUB6oV/iIfV61GRe/xsMbSFNvCuuYl
	 30K1UhGl8Wiq/81OLEY+z54/uQ9O6zj3cLrhCJ+oE+pt80wSEIoczcRwuHLF1kBU1+
	 EY1+mUQh4m/VrQoHmsHyaBlLGBY8JruxJ4LAxvMuWCUtrbRc61G4Cy+Cxwl2ZjaMBY
	 4YXT8etkSpESQ==
Date: Wed, 21 Oct 2026 15:49:15 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, mark.rutland@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, lpieralisi@kernel.org,
	tglx@kernel.org, radu@rendec.net, vsethi@nvidia.com,
	sdonthineni@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on
 ARM_PSCI_FW
Message-ID: <20261021-rampant-fabulous-ant-cafccb@sudeepholla>
References: <20261020222817.1231643-1-julianbraha@gmail.com>
 <86se1zzcet.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86se1zzcet.wl-maz@kernel.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 21, 2026 at 09:27:22AM +0100, Marc Zyngier wrote:
> On Tue, 20 Oct 2026 23:28:15 +0100,
> Julian Braha <julianbraha@gmail.com> wrote:
> > 
> > ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
> > dependency, ARM_PSCI_FW, is met.
> > 
> > Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
> > select conditional on arm64.
> >
> > ---
> > Julian Braha (2):
> >   firmware: smccc: provide stubs when discovery is disabled
> >   irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64
> > 
> >  drivers/irqchip/Kconfig   | 2 +-
> >  include/linux/arm-smccc.h | 7 +++++++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> This probably needs to go via Sudeep's tree.
> 

Sure will queue it soon and send it as fixes at -rc1 or later.

-- 
Regards,
Sudeep

