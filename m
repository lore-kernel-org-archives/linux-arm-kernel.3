Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B109EC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 16:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oqNUDXP/R1+UVFb6e3oZZSdA2iQ5NnSGFQ2rTBOz/Tg=; b=m9u8EtE3i5JlklSfnYva1srOsK
	wn5RNftCHHn2Fywo7CyX40vzC7oaDCawv4lHJYYHu4WZNJrRrSeE59ozLsy78tLlD1nwX0BSJDVzI
	geswJ8ep7PCoZwf6VfrGjt5oMcT2g/ia3Vi4EZe7J1/8QaruOtJ323DpmoAiPGy1rXHzHCaxHAw/v
	4W7ftWdaY19rewWDeGvCnlqG6/k61DAcn0T6Wc/G6CcLcP1txwI7aEXpDNhDhTOvl+wHgTjivb2RO
	IydNp8Ch7OOXjzSDyFbduuPQSUaGhJRGHp0CeQkKt13NIwM//EPWHPSKNCHOWZEP82YM+YYyHw1jt
	T94dywQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viawo-00000005mnc-10n9;
	Wed, 21 Jan 2026 16:20:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viawn-00000005mnU-1OVb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 16:20:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CA6E60130;
	Wed, 21 Jan 2026 16:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DF4C4CEF1;
	Wed, 21 Jan 2026 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012443;
	bh=1zrLB9YYiuSPiB+hTb+W3k1yLnlV8BF5PevPGnV9vcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QISwPij8Wrto3Bs19w6vqe3S2S5wUbzZBIkAYoW3q5GKX1oPPXFRUPe1kitED+Afh
	 P+qH1izc6yuCkE0EYlusxPbZ7hCHHqf21r/qBEdXvqXF7UAgd857zey6uVJ4Xgt/MW
	 MHMDvGAh7sXRHkbMW23lVMUlAD63w1vI8ZhNW+nG3uarIrZdYR0P6xaGU2GzL7GNZg
	 cXkfdI3oNMKE4jw8heAnjacEfhDglbXo4tELdNeXigasbn2JhCOYWFkj90bCGBAPGe
	 9slvHJrZgYXFftd3CHOiTy1JaF86l5T1y3z2zhubcNAzg1QVOy2RVW+DMnR6EoBJqZ
	 MUA+ohMHg8Qrw==
Date: Wed, 21 Jan 2026 16:20:36 +0000
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	catalin.marinas@arm.com, broonie@kernel.org, oliver.upton@linux.dev,
	miko.lenczewski@arm.com, kevin.brodsky@arm.com, ardb@kernel.org,
	suzuki.poulose@arm.com, lpieralisi@kernel.org,
	yangyicong@hisilicon.com, scott@os.amperecomputing.com,
	joey.gouly@arm.com, yuzenghui@huawei.com, pbonzini@redhat.com,
	shuah@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 RESEND 9/9] arm64: armv8_deprecated: apply FEAT_LSUI
 for swpX emulation.
Message-ID: <aXD81LT6TX32vlTS@willie-the-truck>
References: <86ms3knl6s.wl-maz@kernel.org>
 <aT/bNLQyKcrAZ6Fb@e129823.arm.com>
 <aW5O714hfl7DCl04@willie-the-truck>
 <aW6w6+B21NbUuszA@e129823.arm.com>
 <aW9O6R7v-ybhrm66@J2N7QTR9R3>
 <aW9T5b+Y2b2JOZHk@e129823.arm.com>
 <aW9sBkUVnpAkPkxN@willie-the-truck>
 <aW/Ck3M3Xg02DpQX@e129823.arm.com>
 <aXDbBKhE1SdCW6q4@willie-the-truck>
 <aXDn3iRXEtgaUtnp@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aXDn3iRXEtgaUtnp@e129823.arm.com>
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

On Wed, Jan 21, 2026 at 02:51:10PM +0000, Yeoreum Yun wrote:
> > On Tue, Jan 20, 2026 at 05:59:47PM +0000, Yeoreum Yun wrote:
> > > On second thought, while a CPU that implements LSUI is unlikely to
> > > support AArch32 compatibility,
> > > I don't think LSUI requires the absence of AArch32.
> > > These two are independent features (and in fact our FVP reports/supports both).
> >
> > Did you have to configure the FVP specially for this or that a "default"
> > configuration?
> >
> > > Given that, I'm not sure a WARN is really necessary.
> > > Would it be sufficient to just drop the patch for swpX instead?
> >
> > Given that the whole point of LSUI is to remove the PAN toggling, I think
> > we should make an effort to make sure that we don't retain PAN toggling
> > paths at runtime that could potentially be targetted by attackers. If we
> > drop the SWP emulation patch and then see that we have AArch32 at runtime,
> > we should forcefully disable the SWP emulation but, since we don't actually
> > think we're going to see this in practice, the WARN seemed simpler.
> 
> TBH, I missed the FVP configuration option clusterX.max_32bit_el, which
> can disable AArch32 support by setting it to -1 (default: 3).
> Given this, I think it’s reasonable to emit a WARN when LSUI is enabled and
> drop the SWP emulation path under that condition.

I'm asking about the default value.

If Arm are going to provide models that default to having both LSUI and
AArch32 EL0 supported, then the WARN is just going to annoy people.

Please can you find out whether or not that's the case?

Will

