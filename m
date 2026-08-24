Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10814C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 11:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZkHgvgEO8RpEDJnWnxIGKrcvJnO5W8LsXcKRsHQFeA=; b=WA3FeSDWYsYf8kP9K/ksEqiVT2
	+ZBAo/UrMOxuO7MB70qwzDp1i7bbXbBvBY6eg3StxjdFU5a+vYqDV2z7m7EivqWZa5M0nQE9T7pTP
	dpityH6j8AIvVLSuUnaq7OCxXnaSCt6d89yZr3HS1BgqqyqlPNPtsz0cVvb2YurCtJDV8u6iu7rSD
	5jhl81BSf2Hpq9db5+yeQj1acvXRe5Vvr8xT0QhSQLFn5FTrVIpSUaykMcv9G7VcpDS7AdyLYpRRr
	iwqkso4g0L5vIH3WNW0gyb/u3H8Fy7hXmjmmoY2OX5/v65mwpMABf6BzzJOrQd9Sa6CTrx05b6sF+
	5wdYTelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySY9-0000000GSVm-35xZ;
	Mon, 24 Aug 2026 11:09:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySY6-0000000GSVX-02H1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 11:09:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CC2E600C8;
	Mon, 24 Aug 2026 11:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 508671F000E9;
	Mon, 24 Aug 2026 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787569744;
	bh=fZkHgvgEO8RpEDJnWnxIGKrcvJnO5W8LsXcKRsHQFeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZNe1YYIlDOOgljZkVmleYw+CtH+Rb37EkPkT9fQPTuTaZEKdBqXbe4J8lGMj9LkyB
	 6mgbans8mPyD5VxUO2CH6LnwiXKrTFyK0ujHMHNSQBiMjDLkLcFdTib1ddVEjZULlY
	 IB1JwwUm3NYjTxfVu0CN5Et4A2nZ/TxXNQqZeJ4UlqoPdFYFecOtj048tWW8gYqEM7
	 iHD8PovAke6lOiYYXBx+tjfhHq+FHQdg9ifdb1DL5XhyCHF1xtFR5cRDq9wO3nk0lg
	 9u85wreMm2P8Qu/SGry4hW+nfH8agPBD77ZzhCg4LlG6oetgRTciMH44Q6yrPy9mxR
	 xL+b/UfCWuWWg==
Date: Mon, 24 Aug 2026 12:09:00 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Shen Yongchao <grayhat@foxmail.com>, 
	Karl Mehltretter <kmehltretter@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/2] KVM: arm64: nv: Delay freeing of shadow S2
 structures until VM destruction
Message-ID: <aowmMrvuy1vYYnKd@gremlin>
References: <20260821161829.1032561-1-maz@kernel.org>
 <20260821161829.1032561-3-maz@kernel.org>
 <myjs4ge5zolj4drqql7lewoazu6simr32acdgi3jgy65quolhc@amx3hctoyuth>
 <aowl4sQHuoooFhqS@gremlin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aowl4sQHuoooFhqS@gremlin>
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

On Mon, Aug 24, 2026 at 12:07:25PM +0100, Lorenzo Stoakes (ARM) wrote:
> On Sun, Aug 23, 2026 at 03:11:31PM +0100, Wei-Lin Chang wrote:
> > On Fri, Aug 21, 2026 at 05:18:29PM +0100, Marc Zyngier wrote:
> >
> > [...]
> >
> > > +void kvm_destroy_nested(struct kvm *kvm)
> > > +{
> > > +	for (int i = 0; i < kvm->arch.nested_mmus_size; i+= S2_MMU_PER_VCPU)
> >
> > nit:                                                     ^ missing space
>
> Ack will fix on respin :)

Sorry I have not had my coffee yet this morning :)) this is Marc's series and
not mine... :P Disregard...

--
Cheers, Lorenzo

