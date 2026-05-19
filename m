Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB10CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 11:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrfCIXJBWhTkI24x8GrkdNDgazLl82raIY/1L+zWYiI=; b=WT1szEpwDz9azKXkJ1Sm+JWI6a
	5FCGlEmm0UetlyVmo4d2DjgOeGeL/ydv2ExWBkhcjLa0ftWaRD1DFck//aSB7AgExyDLmKkNgoYLo
	QVhsIJ7cTHaziqQFgo0ePSWFEYYNJHWPAQvwmyr/xjTOrXtLdTsL4rL16OkF3Q61NdAcWDA9ptzTp
	ZSqvB2/Gnw+9A7R4yVQPSjYg2pkUaJ7anC12qwbXWTekRp5MEGBJRxCl1i70qHgaaslbB+F8uGamf
	hlQXBA2OGUl+0/OS1jYDmNE6M0aTNrSlMLZb8NsBxdYVovbqEBOZUUafBzkS79nGufb9YczO43uY2
	XjKEngbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIMa-00000001GzF-23zb;
	Tue, 19 May 2026 11:11:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPIMZ-00000001Gz4-1LIh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 11:11:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9343360126;
	Tue, 19 May 2026 11:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB23C2BCB3;
	Tue, 19 May 2026 11:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189110;
	bh=yho1oY7rUwGUBK6N3ReIa8imE1mEl4Xep1Oe5MlRzKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIA+Mx511B2Utvn8fqrlK5XwSL8vqCOwjgfy/t0ERyQP2GgjcHBvxaBcaz/+rZ18J
	 0CrpDV+n1qekubCKlZWpnJmE82yshPea4TnybMcHaE+QYIMwkljLEFlxIVTqMbq5dx
	 p+bEZdKaRfP4JF3HO5II7EeaBytLydOBoJQe+Zs35ZNoMdXWzyeknmt3ZRISzIfQr2
	 HPDKmcPWvg8kQiiPLq+VWUmTdcdgiXAsO6V2VXBl84LLkcAqZwz6qN9ws8wvRkwzMl
	 aeqM9OuflbaGHxAGN6ds3muEW0LgDxQKUUbyaYUZxPKXW/BMGOIMin/d5MRp7xsP3r
	 BRSjZhUoU2/xA==
Date: Tue, 19 May 2026 12:11:42 +0100
From: Will Deacon <will@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kvm <kvm@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Eric Auger <eric.auger@redhat.com>, Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	kvmarm@lists.linux.dev,
	linux-kselftest <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility
 expectations
Message-ID: <agxFbniU_6eQ98t2@willie-the-truck>
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
 <6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com>
 <57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
 <baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com>
 <86h5obya2r.wl-maz@kernel.org>
 <48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
 <ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com>
 <d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
 <CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
 <3f9d731c3d26b0367600f1069e6425099bc34eac.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3f9d731c3d26b0367600f1069e6425099bc34eac.camel@infradead.org>
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

On Tue, May 19, 2026 at 11:41:26AM +0100, David Woodhouse wrote:
> On Wed, 2026-05-13 at 18:24 +0200, Paolo Bonzini wrote:
> > 
> > > See commit https://git.kernel.org/torvalds/c/49a1a2c70a7f which adds a
> > > new guest-visible feature in revision 3, but allowed userspace to
> > > restore the old behaviour by setting it to revision 2. All my patch
> > >  above does, is make it possible to set it to revision 1 as
> > > well. Because https://git.kernel.org/torvalds/c/d53c2c29ae0d previously
> > > changed the behaviour and bumped the default to 2 *without* allowing
> > > userspace to restore the prior behaviour, and we've been carrying a
> > > *revert* of that patch.
> > > 
> > > Why would we *not* accept such a patch?
> > 
> > Agreed. Even ignoring your revert, there's no reason why any upgrade
> > past 49a1a2c70a7f has to be from after d53c2c29ae0d.
> 
> So where do we go from here?
> 
> I assume you'll be taking this Documentation patch via the KVM tree?
> 
> But what about the actual fix at 
> https://lore.kernel.org/all/20260511113558.3325004-2-dwmw2@infradead.org/
> 
> This is a simple and unintrusive bug fix to make KVM/arm64 follow the
> "common sense" requirement that the doc patch codifies, apparently
> being rejected with the rather bizarre claim that KVM has no *need* to
> maintain guest-visible compatibility across host kernel changes.
> 
> So... what next? Is one of the other KVM/arm64 maintainers going to
> speak up? Paolo would you consider taking the fixes through your tree
> directly? 
> 
> Does Arm not actually *care* whether AArch64 is considered a stable and
> mature platform for KVM hosting?

Hey, come on. Marc cares more about this stuff than anybody else on the
planet. He's been single-handedly maintaining the tree for the past
couple of releases while Oliver was out and he's on the end of a _lot_
of patches. I'm only cc'd on a fraction of the KVM/arm64 changes and
it's bedlam.

Will

