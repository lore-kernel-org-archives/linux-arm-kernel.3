Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B28CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 22:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=583dJEBabhOLtZnyQafdNj+T2+TN+CFjj2gjRihiiGU=; b=DHi8EnkzWIT7Ma0jKqLSUKnRoX
	8Wk5IWUoFwaSXS2UJtk3gsKT4gv+BdPPVfMAc/OAYL5S+MrEKcfarKG3Jk+3pLp2qQNK6u07V8pdB
	WrkFxdAwBa4snsr2CvUew8EOq9NJXRsrOJRJCTqdKyDcugS5IcXQ9yYeAx5lIBHieG8T6f3zEEAz1
	UgqM//JS5k+2Zyxusk4w7W019MLJrbXB6tfKny3afPaB33pZR4hw2ROGxilU7vqWqlmvC8Gbs8dWi
	fxkh1c++kPPy/IEP7TpBxSklt8qCUa78LcWMfU/BGXPnbxXrzqROyOE4NxIGkMj3nASu29/yj2qFz
	ZIGDrr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJftB-0000000BBnf-3YQ7;
	Thu, 13 Nov 2025 22:34:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJftA-0000000BBnW-2Tyk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 22:34:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FFE760149;
	Thu, 13 Nov 2025 22:33:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9AFC4CEF7;
	Thu, 13 Nov 2025 22:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763073239;
	bh=ZomP9AbfNlKZXi56JMsQPWtvmmMeRaVV4VF65hib0gA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G+SorA+T3oiYjAaWcO8c9g2c8W82OReP7LPLrfICb7Q9fEn/bbZEuoh/2cayVXbj1
	 6HsZOxZjfPp1eY9zGi78KJrTpOlFzr+lA/PZUho75r/isGPWLiaTYwQHQ3uehrOc1M
	 Mfeb70ytgLuMZ9EgVEHW/ECEs4JnP80O0Nv5q2Byd3OhFqCmnb5tUlBV/l90Xkd5B6
	 EhmK9qpjthxP2Iq0MkH2HCoOPdjQahUuAeMdM/KfQfLUSUktIwGjluFi4wN55MFRke
	 5c+IQK0PXlLBRaby9MEpFZlBJUp+yA1gomij6ZTpAXb4yhh7PVuzyrD+rMG19wM7YL
	 sms6HbHcZBejQ==
Date: Thu, 13 Nov 2025 14:33:57 -0800
From: Oliver Upton <oupton@kernel.org>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: oliver.upton@linux.dev, maz@kernel.org, duenwen@google.com,
	rananta@google.com, jthoughton@google.com, vsethi@nvidia.com,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com,
	corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
Message-ID: <aRZc1SqU01Cyxc5Y@kernel.org>
References: <20251013185903.1372553-1-jiaqiyan@google.com>
 <176305834766.2137300.8747261213603076982.b4-ty@kernel.org>
 <CACw3F51cxSgd-=D46A6X6GptEZS8-JZ_MnB_yK_ZR1wktunYRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACw3F51cxSgd-=D46A6X6GptEZS8-JZ_MnB_yK_ZR1wktunYRA@mail.gmail.com>
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

On Thu, Nov 13, 2025 at 02:14:08PM -0800, Jiaqi Yan wrote:
> On Thu, Nov 13, 2025 at 1:06 PM Oliver Upton <oupton@kernel.org> wrote:
> >
> > On Mon, 13 Oct 2025 18:59:00 +0000, Jiaqi Yan wrote:
> > > Problem
> > > =======
> > >
> > > When host APEI is unable to claim a synchronous external abort (SEA)
> > > during guest abort, today KVM directly injects an asynchronous SError
> > > into the VCPU then resumes it. The injected SError usually results in
> > > unpleasant guest kernel panic.
> > >
> > > [...]
> >
> > I've gone ahead and done some cleanups, especially around documentation.
> >
> > Applied to next, thanks!
> 
> Many thanks, Oliver!
> 
> I assume I still need to send out v5 with typo fixed, comments
> addressed, and your cleanups applied? If so, what specific tag/release
> you want me to rebase v5 onto?

No need -- I took care of the issues I spotted when applying, LMK if
anything looks amiss on kvmarm/next.

Thanks,
Oliver

