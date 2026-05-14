Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF26CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vupuZrldNnISyodqZgietZ5rJGgmjJeY1/v9Vsj3aVQ=; b=EEpsNDzJIoBiGKiAghaZAzUJzA
	fTMk+bAWzNVUcd4LuTRDC4EpLnzpw3M+5XhXZuBG3sTAJwxA8N0D1/O++R7jEbCmwaYSOmdKdesj6
	HELG7ysNcFQgiv6ad838JTH8lO+5/Ltou0l8lbogNah2ul1RTuVVee5yP664YQTdSkk+KAElL7Z5O
	xuQn/qS2SXZsYf6x3Ptq88wuC3g0nZR209Ceakq0zRXF6M40dA7zJFR4LnuSls78029c03t8nPPK3
	s37GmK4aJPfgZqdP5uLplKgWBEu/YVX51si2+BZ6o+ruckL6mB9+DmR/R86ZQ7FzS92/z0cyg5Jjk
	1Klw3DbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVRn-00000005V6p-1vAl;
	Thu, 14 May 2026 12:45:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVRk-00000005V5D-3nMl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA36760132;
	Thu, 14 May 2026 12:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA80C2BCB8;
	Thu, 14 May 2026 12:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778762747;
	bh=uzxXH31tSj4V03e2tHyrBCneawBM4/arZJhlthRiRYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kq8O/dxE1+71TBvjywPOqVDLIbXE4IJFQdg8x5tDelx2tpCYRMyYlo8lumZYHjVjo
	 KjL98x8TbAqLzoIgLbIxH6ZZEZp8jsjxuGHjBY/TZ6n15Hzr1b+nrwii87ACxwb5KU
	 Vx4hjQUndhL6IjLRM9AJ0+z7cLTD1fLTuONURu5w=
Date: Thu, 14 May 2026 14:45:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v5 0/3] Switch Arm CCA to use an auxiliary device instead
 of a platform device
Message-ID: <2026051428-untaxed-slacking-d029@gregkh>
References: <20260514094030.42495-1-aneesh.kumar@kernel.org>
 <2026051453-batting-delighted-0a57@gregkh>
 <yq5ase7u5kmz.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ase7u5kmz.fsf@kernel.org>
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

On Thu, May 14, 2026 at 04:21:48PM +0530, Aneesh Kumar K.V wrote:
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Thu, May 14, 2026 at 03:10:27PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> As discussed here:
> >> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
> >> 
> >> The general feedback was that a platform device should not be used when
> >> there is no underlying platform resource to represent. The existing CCA
> >> support uses a platform device solely to anchor the TSM interface in the
> >> device hierarchy, which is not an appropriate use of a platform device.
> >> Use an auxiliary device instead to track CCA support.
> >
> > Why an aux device?  If this has no platform resources, please use the
> > faux bus support instead, that is what it is there for.  aux devices are
> > used when you are sharing a real resource among different "child"
> > drivers, and need some way to coordinate that sharing.  If you have no
> > resources, there's nothing to share, so no need for the complexity that
> > aux gives you, just use faux instead.
> >
> 
> We did discuss between faux an auxiliary devices early here
> https://lore.kernel.org/all/20251010135922.GC3833649@ziepe.ca
> 
> To summarize auxiliary device was choosen so that we can do module
> autoloading.

That's not a valid reason to use the aux driver, sorry.  If you have
hardware that triggers an auto-module-load, then this is really a
hardware driver.  If it is a "virtual" driver like this, then you need
to explicitly load it on your own.  Don't abuse apis for reasons that
they are not designed for.

thanks,

greg k-h

