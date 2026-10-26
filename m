Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE78606A328
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=scgVYo+n;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tv6/cPLh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wnInlAoM7eCnwc4pQzCJ3JjKUOaq29EJiA2dB7FE3lc=; b=scgVYo+nZVNhc6xguPywEPqw8d
	hMd2Ra0ze4o2Wn0nny8FYNdMfP9WCqyLSFz9EiDPWOIU82AayHcP0vS66LifwUUAjCJr860toKyr6
	8qepNDk0JkpUQkYrtmDP37JpTP7c/10oc0MO1nHf7UtAm2jdjsBt2dpWymXfgnLlRGxkVpzHpWeVA
	b1mI9I/8WObzf5+kWGqddpD5XaMXhAqj1wg18wS6kGDdejQ7uECDPYiQx9qFFoFirlQgHkKgECUdY
	+5LEFHPBLHSjcTDbKTA841ZM8oiI3vSr+lht1tCh/tyMpKBy/XHGVsmnEIkxPNGtnkj9vq1EmX1t7
	9qGoZxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSGl-00000003I5I-3T4w;
	Mon, 26 Oct 2026 21:30:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSGj-00000003I5A-3LWm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 21:30:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D7F86601F0;
	Mon, 26 Oct 2026 21:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B081F01829;
	Mon, 26 Oct 2026 21:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793050211;
	bh=wnInlAoM7eCnwc4pQzCJ3JjKUOaq29EJiA2dB7FE3lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Tv6/cPLh4sVaKXCK89oJRyF7wE8NcPivUztYh15k6VmzCpjEp2C5Fzg2+rfb/Hcbb
	 xTJWKm66k1H4p5qcWHcV9aF+DPo0UJNegdI439bi3n3PeXtlKUIV87EkAQLZeqgH1P
	 GWCDtb+BEg0x/d5SU7bB+uAPMyh+wxK2/20v/alpOXo+GNNUoDpr614XE8MzjldNO3
	 Y1Rdm/bJqjDAymCb1ai5mV+DldMj6FiZjQJdaK7lnZ/3xkIFmAiT4ClF7cdzgqPXd5
	 11mx2fsBPP+ZhjtQlBuAQ9i4uj4GTRCmcmnLelhhdsorLoH0P7DAW/zk4bdgvjGXXP
	 I3ENK1ifhMJXQ==
Date: Mon, 26 Oct 2026 14:30:09 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>, Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: vgic-v4: Don't allocate vPEs for a GICv2
 VM
Message-ID: <at_GYZQr1RIUi2Tf@kernel.org>
References: <20261026152639.3926498-1-fuad.tabba@linux.dev>
 <20261026152639.3926498-2-fuad.tabba@linux.dev>
 <at-mF3Qvq67Nh_v5@kernel.org>
 <87qzhc8ce6.wl-maz@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzhc8ce6.wl-maz@kernel.org>
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 07:55:45PM +0000, Marc Zyngier wrote:
> On Mon, 26 Oct 2026 19:12:23 +0000,
> Oliver Upton <oupton@kernel.org> wrote:
> > 
> > On Mon, Oct 26, 2026 at 03:26:38PM +0000, Fuad Tabba wrote:
> > > KVM can run a GICv2 VM on a GICv4.0 host whose CPU interface supports
> > > legacy operation.
> > 
> > I'm pretty sure there's no IP out there that has GICv4.0 and legacy
> > mode...
> 
> My favourite space heater, HiSi D05, says otherwise: 64 A72,
> GICv4.0. Remember that it is the *CPU* that provides compat mode, and
> not the GIC.

Well I forgot that one got glued together. Good thing you're on the hook
for fixes this round then ;)

Thanks,
Olier

