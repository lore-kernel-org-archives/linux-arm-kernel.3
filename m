Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A58C2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 12:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4J1izN7NsLC3ZsSV4WP4PqPHf/Dzk/N5yKDAw/y4Go=; b=ks1nEPu9EEVBQb6yk4190G5GIG
	q/n/r9RqcSyiuMWZE15YXynWkL92pdgH0W/SBGs/Jb+IZ5/4VV6fr1nf1NA+21NHO2pYmXd7fRj0e
	rtkwnvB874DhyjF+XR5civOCZ3WsTVxcrB5chKivvOTQXOgdHhXIZYxIhd5iq6ksFZO9PZG68HsXw
	e0fP82yv/F8quXIfElQdbYK5x7eixilPVXIvHwX28J5vxB4nIgHECdISHsx9+gIl38ikyb81DzRFK
	lYgPdD4+Wk/7qClK3QRDeVcNtW8eMGdvkZAfNWf6x+NxP+bmCUWSbd3m/7nOWxFz23pKJ75Mp20mZ
	sK9SJAWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshZ3-0000000BDsZ-2HEk;
	Thu, 13 Mar 2025 12:21:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tshId-0000000BB29-42zu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 12:04:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5676DA47165;
	Thu, 13 Mar 2025 11:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63084C4CEDD;
	Thu, 13 Mar 2025 12:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741867470;
	bh=8xSatFqW6rNQRg2ui1Hv5/Ccru9q7nKvNSRlZwWl5L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=laX+XLblooglk5nBQ2OLuWGhtqj6qrkClKYXRqLBhPW0lc/doJ6OVCdrBiPC/mTg3
	 ypllpZEyEwH1ZbJzgDmhfoLX3y2MLs0YZrWb+QyiKz5xxK1jEYFyTd9UKk1REzAwA8
	 R/d1CxybPiNxrCUnCouHJpBqv5ItV/PRF6qtbE+mOgG6K0BSG6kPtEvtqd4+TQOIOi
	 qFC9lieHIU8DcOyk/fWQduHA0ZcfKs3vux9ZjxFIecAZ+oC7p/RQoDadjYIfTJVoWc
	 AilbK0CyDNeNEKUsz4aHgixCNVndewaZqO/0AKyFWEkNbO3ETwosS1fdTQFuEZN3XQ
	 pj8pCpmOSW1Ew==
Date: Thu, 13 Mar 2025 12:04:25 +0000
From: Will Deacon <will@kernel.org>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, snehalreddy@google.com,
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH v2 3/4] KVM: arm64: Map the hypervisor FF-A buffers on
 ffa init
Message-ID: <20250313120424.GA7356@willie-the-truck>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-4-sebastianene@google.com>
 <20250303234259.GA30749@willie-the-truck>
 <Z8ZPBZF7J-qKdb_i@google.com>
 <20250304015633.GA30882@willie-the-truck>
 <Z8c6enoolJe7Zeqk@google.com>
 <20250305003808.GA31667@willie-the-truck>
 <Z8iZkQHknZfY7mpn@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8iZkQHknZfY7mpn@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_050432_129462_39A6B423 
X-CRM114-Status: GOOD (  44.91  )
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

On Wed, Mar 05, 2025 at 06:36:01PM +0000, Sebastian Ene wrote:
> On Wed, Mar 05, 2025 at 12:38:08AM +0000, Will Deacon wrote:
> > On Tue, Mar 04, 2025 at 05:38:02PM +0000, Sebastian Ene wrote:
> > > On Tue, Mar 04, 2025 at 01:56:35AM +0000, Will Deacon wrote:
> > > >   | [...] negotiation of the version must happen before an invocation of
> > > >   | any other FF-A ABI
> > > > 
> > > 
> > > We do that, as the hypervisor negotiates its own version in
> > > hyp_ffa_init.
> > 
> > hyp_ffa_init() only issues FFA_VERSION afaict, which is the one call
> > that you're allowed to make during negotiation. So the existing code is
> > fine.
> > 
> > > I think the host shouldn't be allowed to overwrite the
> > > hyp_ffa_version obtained from _init, this feels wrong as you
> > > can have a driver that forcefully downgrades the hypervisor to an old
> > > version.
> > 
> > I think that's also fine. The FFA code in the hypervisor exists solely
> > to proxy requests from the host; it's not used for anything else and so,
> > from the host's persective, FFA should behave identically to the case in
> > which the proxy is not present (e.g. if we were just using VHE). That
> > means that we're doing the right thing by deferring to the host for
> > version negotation.
> > 
> > Are you saying there's a bug in the current code if the host negotiates
> > the downgrade?
> 
> It is an issue *only* for doing guest-ffa (which isn't posted here yet).
> If we allow the host to dictate the version & there is an issue with TZ
> FF-A dispatcher in that version => the guests will be affected by this
> as well.

When we get to guests doing FF-A, I still think the host should be
responsible for the version negotiation and guests should just be given
whatever has been negotiated. We could extend the hypervisor to marshall
between different versions, but I'd rather do that only if we actually
need it.

> > > We need to do three things, Sudeep & Will please correct me if I am
> > > wrong, but this is how I see it:
> > > 
> > > - the hypervisor should act as a separate entity (it has a different ID and
> > > in the current implementation we don't do a distinction between host/hyp) and
> > > it should be able to lock its own version from init.
> > 
> > I strongly disagree with that. The hypervisor isn't using FFA for
> > anything other than proxying the host and so we don't need to negotiate
> > a separate version.
> > 
> > What would we gain by doing this? Is there a bug with what we're doing
> > at the moment?
> 
> I think we need to make a distinction between the host and the
> hypervisor when we are adding support for guest-ffa. We currently have
> the same id (== 0) for both of them.

Right, and we currently don't support guest-ffa, so no problem :)

> > > - keep a separate version negotiated for the host
> > > - trap FFA_ID_GET from the host and return ID=1 because
> > >   currently we forward the call to the TZ and it returns the same ID
> > >   as the (hypervisor == 0).
> > 
> > Why is this beneficial? It just looks like complexity at EL2 for no gain
> > to me, but maybe I'm missing something.
> >
> 
> Because the host can impersonate the hypervisor using ff-a direct calls atm.
> and we are in a position to restrict the host from playing nasty games
> with TZ.

Can you give a specific example of why impersonating a direct call is a
problem? I agree that it sounds bad, but the hypervisor is still in the
middle and so it can check what the call is requesting.

Will

