Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9706CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sFCvsXZLdxLKdHXwpS2nWXBpKLwepoPfVilE5Kh5WMA=; b=kAbSR7OXd01KqtHgDLcaPP1SjG
	tgzq4aJE/Ayje+4GCAPlE/JhPjREK2Xp9LP7XggLcJilMSnDcTYrHZ+NidqhnAGyxy2nwBnifqfes
	RWStKYXDZVeYlbzDr6EjJ8rUHIPlaxHUZU+XWzFS1yWw8MOLQHxNbZ261LlRjNzIDhalPKmM0EqNh
	E7VpOasz1ow8D7w65wJ9mSba8W69pjNuPNSNXRLMBbwwTm5s5TjkHaaw7l1hu8MaYti0cBChZyQYz
	sgNPU2U2Pe0igbFqg3xdFIAuDgvWSkJ5r/1jmWvAz3SA56mCDI6Lk1WhiBSCnVxgo6dboPkBI9xnh
	KFuZ+jlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpsS-00000005Sfq-1chl;
	Wed, 30 Sep 2026 08:41:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBpsR-00000005SfA-0sGB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:41:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A7F6601DE;
	Wed, 30 Sep 2026 08:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309C81F000FF;
	Wed, 30 Sep 2026 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790757682;
	bh=sFCvsXZLdxLKdHXwpS2nWXBpKLwepoPfVilE5Kh5WMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mhzhUa9uS6ktb80BJuDJGmtAxdhIqUzAP/HXGJ7IC4X+tI8VvcgkCZyJtgdQx2F1r
	 Wrle757SiP9fvECGBPdskTJcuCihZHNIm/GJhqcohJbrZB2acm3rOqVKdBesQcDel3
	 H5g3r9F32WcMdawUsIdP66lqstfbNKTT1MAPHwlZLn+LtqwQv8RCPfFpRGUam9zGqn
	 F9lPkFmZw32empK7ClckYchozBtr3NMoeTGgUfu1WrZJ1OOOwgPU58lZziwN85tUul
	 Sd7cFoXEFut1UZHCZ/WBLqsiKcQO1NHumtPIYYmPHhxLFt7tDRXPS0/g5bUvJUiaKX
	 6ozrSPKWxej9A==
Date: Wed, 30 Sep 2026 09:41:16 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <arzHLZdKJ0qJFNHg@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
 <arvjKjrh1NU4CKPE@gremlin>
 <636db593-b6b6-4338-b9b0-e87c54111d14@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <636db593-b6b6-4338-b9b0-e87c54111d14@sirena.org.uk>
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

On Tue, Sep 29, 2026 at 10:56:10PM +0100, Mark Brown wrote:
> On Tue, Sep 29, 2026 at 05:22:44PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:
>
> > > No functional change.
>
> > I don't think this is accurate, as you're changing the register into which a
> > value is loaded (x0 instead of x1).
>
> > That seems to be correct to me, but worth calling out that you're fixing that up
> > in the commit message and dropping this line.
>
> That's actually an unintentional bugfix, the original code just uses
> whatever random value was in x0 as an exit code.  Probably that was
> non-zero so it all works out but still.

Yeah absolutely, it seems that we just got lucky before with it which is
slightly ludicrous :)

--
Cheers, Lorenzo

