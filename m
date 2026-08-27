Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB94C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 10:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FWY53Qf1zP+pmrsD9SjCpbIZ8u4sT486ZmML1Qw8IO8=; b=jMA1ZWg2qGGfhzI3eUfxsuVi/T
	bUenbDcHzzBukrbcc4kGaR0El5VAf32bP/577DLhzED87jNa7rXZU7/cweOu5rfDTvBb+0/LYPGVx
	E/wqmud0e0LYgfFxPtyyY0WVyAR5qTSLnB3zuj3T5F0y6XjryWlen+v4NoV4YXlN45RHAh0Mdbki2
	eheTTEJ/x6Y7jgOd80/vIj72XpK0iBE4Mp7vr2/20SuPcnzrNfUhDsoMUHpHPnZ+1RS0aZXNMu6el
	Ed9xHRq2UqN+kkpeqP7NwfG54z/BQFeNqBpR+naof6tfQ3qBh4aZCUkJWOh+89K1e0AyMmWxYnJUc
	xfdHe0OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXGN-00000003ou7-3af7;
	Thu, 27 Aug 2026 10:23:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzXGM-00000003oty-3IPh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 10:23:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A163600D2;
	Thu, 27 Aug 2026 10:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F2E1F000E9;
	Thu, 27 Aug 2026 10:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787826193;
	bh=FWY53Qf1zP+pmrsD9SjCpbIZ8u4sT486ZmML1Qw8IO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhfwHdHuevu1f8nJG9q/cmu4j8w4IiklJkAXYq2k3PhC3cQ4h8CwlnClkjdmMk5Da
	 ogqv0P6x2h3cMjjMiQY2a1yqE0URXq6r1tSDQn2aGFUKIXz/Jml9CyU5lpEUI139WE
	 12ORae2fd5t5CXVTV0anCRIFuGJuYqEuqv4XLFX3EENvTp8/WmkvUE4jF5tDS7vNf9
	 w0o37XOjvF/dOnEZbhTPl37GFz0w+gTEwzVpizMyhv7hoT7T67jFSBKNVV9OJ7VV5q
	 fD/d+IOHPBWV6FrgWwUpFEzvq25lUbQOrG1nyLhZ5rJ9ZagBounLcY7yIvQYBFgYPl
	 D16VBtotIHTIw==
Date: Thu, 27 Aug 2026 11:23:08 +0100
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: Don't read GMID_EL1 when MTE is disabled
Message-ID: <apAQDInQK_hW90ZF@willie-the-truck>
References: <20260824184155.2644646-1-fuad.tabba@linux.dev>
 <aoypji6EJ8zToWvh@arm.com>
 <CA+EHjTwueqEAVq-7_ioRN+1h3LNPAqHX3rTqbXODViJJM-D_pQ@mail.gmail.com>
 <ao2jNDv8tOjnimEH@willie-the-truck>
 <CA+EHjTx93ERXZV1visdfBOGtH7wHff6TAoeJe+pNtikPrRp8Qw@mail.gmail.com>
 <ao7Isu9sxUEeECOZ@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao7Isu9sxUEeECOZ@arm.com>
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

On Wed, Aug 26, 2026 at 12:06:26PM +0100, Catalin Marinas wrote:
> On Tue, Aug 25, 2026 at 03:46:15PM +0100, Fuad Tabba wrote:
> > On Tue, 25 Aug 2026 at 15:14, Will Deacon <will@kernel.org> wrote:
> > ...
> > > > > If you are worried about additional trapping of the MRS, we should go
> > > > > for Will's improvement to always read the cached values in
> > > > > __read_sysreg_by_encoding().
> > > >
> > > > Not worried :) __cpuinfo_store_cpu() has already read ID_AA64PFR1_EL1
> > > > a few lines up.
> > >
> > > But if you go with __read_sysreg_by_encoding() then you'd still be
> > > reading it (and trapping) twice, no?
> > 
> > It would, and I'm fine with that on a CPU bring-up path.
> 
> For backports, yes. Going forward, I like Will's idea of reading the
> cached value in __read_sysreg_by_encoding().

I'll try to incorporate that on the end of my parallel hotplug series,
which I intend to post next week. I just need to untangle the mpam stuff,
as it populates the cpuinfo structure far too late.

Will

