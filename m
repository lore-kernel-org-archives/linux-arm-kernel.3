Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78975E6C5E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 01:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7tKWX1j0TJc1AZqeUpwVF9dIXqKxSoumxFecXZ6Pkk=; b=r2CY/gneyIwLBYJTT2Bohrzhu0
	SjU2rjAEacZJeeVDAplzBJ3NXTByFu8ud0lYdwMNWIWkYxfOuGdM5lRu3OrQYYJaejhKptuF2yzFd
	DxCps1SIXLJYhqV5MutX5bwOSyccd/x8cb9wC12fGqt5BKJNV1sBaIzhM4rDeImWJ/ajOw+Ki7NRk
	MBqFy9LEGLJ9u2aKYS7lKWLRPOkJxolfbp43Tnf4G9QMPspER2JFPuYjaEYFPat24aFTYRO3dSXx+
	xuKQPoI1GrxEkaAshnJWXaEn3rpK0FoCHXWlpjuqAqELsVUE73XOxwx3XeuvGqLVtHoMPKK7IKEWN
	CQUoFCuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHbD-00000007uzl-0XyE;
	Tue, 03 Dec 2024 01:21:11 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHaA-00000007ut2-2Kxx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 01:20:10 +0000
Date: Mon, 2 Dec 2024 17:19:54 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733188800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G7tKWX1j0TJc1AZqeUpwVF9dIXqKxSoumxFecXZ6Pkk=;
	b=SEPcGcz1mSLl64Ld90WUSVmBIm4CdmjhLZaoqZ2AkGy6JQVaGDxUN9hZerEjBSl0dvpU4d
	kz0tYnceZbgEMGGOeJ7C55bjisVbgrxJKbcYHbAMkMJ2PY3RcYxCH5+DfEIJzD2ietZ9aX
	I/l43pcPt82s44XSi10PPdtVB8kMZ6k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Vitaly Chikunov <vt@altlinux.org>
Cc: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	james.morse@arm.com, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, mark.rutland@arm.com
Subject: Re: v6.13-rc1: Internal error: Oops - Undefined instruction:
 0000000002000000 [#1] SMP
Message-ID: <Z05cuuMMurzp1jx5@linux.dev>
References: <20241202045830.e4yy3nkvxtzaybxk@altlinux.org>
 <20241202153618.GA6834@willie-the-truck>
 <86ttbmt71k.wl-maz@kernel.org>
 <20241202155940.p267a3tz5ypj4sog@altlinux.org>
 <86ser6t6fs.wl-maz@kernel.org>
 <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202223119.k3uod4ksnlf7gqh2@altlinux.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_172008_053488_97FCEF1C 
X-CRM114-Status: GOOD (  14.39  )
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

On Tue, Dec 03, 2024 at 01:31:19AM +0300, Vitaly Chikunov wrote:
> Marc,
> 
> On Mon, Dec 02, 2024 at 04:07:03PM +0000, Marc Zyngier wrote:
> > On Mon, 02 Dec 2024 15:59:40 +0000,
> > Vitaly Chikunov <vt@altlinux.org> wrote:
> > > 
> > > Marc,
> > > 
> > > On Mon, Dec 02, 2024 at 03:53:59PM +0000, Marc Zyngier wrote:
> > > >
> > > > What the log doesn't say is what the host is. Is it 6.13-rc1 as well?
> > > 
> > > No, host is 6.6.60.
> > 
> > Right. I wouldn't be surprised if:
> > 
> > - this v6.6 kernel doesn't hide the MPAM feature as it should (and
> >   that's proably something we should backport)
> 
> How to confirm this? Currently I cannot find any (case-insensitive)
> "MPAM" files in /sys, nor mpam string in /proc/cpuinfo, nor MPAM strings
> in `strace -v` (as it decodes some KVM ioctls) of qemu process.

If you can attach to the QEMU gdbstub of the VM, info registers will
dump ~everything.

If the value of ID_AA64PFR0_EL1.MPAM (bits 43:40) is nonzero then the
host KVM is erroneously advertising MPAM to the guest.

-- 
Thanks,
Oliver

