Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A767E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 09:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rCa/zjejAIoTR/5gHfhbz6ptMz7jsKskdo9ZtaV05a0=; b=VysW99FlxHWcTLBI7xGnV+cuBA
	3HH6rXYL7/b4GVhElBqmjXjAWqrroxAXfOXJo6zV73JpVp1POKenZWQs92PkWlyR8zlOkEo4d6fqm
	T+/pecsPoYAGB6L62SYN1EgqTVy8F3K9D7/bbSLBI1Xg6BHiCyhSm5XbclWFEqsgs52pMk4hPbYCc
	TlITsnJ3dfOtqEcWcq802iMVYJOmVyiqNvt6WAgXEATS9FZqBpQjDSva0gQG+MoIEifWtcNdsICtd
	B3fBX1BKLKEP9CKYnZ+ppg4L1gH4F6VMUSzHcA8G3Uwp7+qxCYLZmb5fCeeZxGji3L7sP8Z+fN5zo
	0jXEoMkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfmA-0000000HYBD-1QwI;
	Thu, 12 Dec 2024 09:46:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLfhP-0000000HXC7-02TM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 09:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EFF8B5C61EB;
	Thu, 12 Dec 2024 09:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A53F0C4CECE;
	Thu, 12 Dec 2024 09:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733996494;
	bh=8T9YqQIGe01+p2hPomlifpNUHNh46GGlOzTjpfIdD7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=olGgcMggf0fE1LeSI76/UaPOD4ftsCZOroqJTEOGj9ippWzQmUy3icmHWXgt+n1hr
	 NrEveF/eWzKta86ruTjo/akhkLAWp6ktgL5enw2HyOdSlQkXOlR+oZlUQr3Cu2AL8G
	 k7819e9L+NedCTEbNku6Arlz0zh4rk/U2SnKV8VwxJBmH0xGtej74hu87oCbwcFxpv
	 ausS4U8ybsPMwi4Ts9fxSO8/y3fkbu6u3OYJLiTsYHgrfpmCfRyPPl3jZKGGPlfnw5
	 rgk5KsfvSXDEvRFKq6f1ceW7RUs41R4Ydi0GL8tlfiosLOMJi3EFfc5GPUt9uUTfxP
	 YFr+SF2N/1thg==
Date: Thu, 12 Dec 2024 09:41:28 +0000
From: Will Deacon <will@kernel.org>
To: julien.thierry.kdev@gmail.com, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Alexandru Elisei <alexandru.elisei@arm.com>
Cc: catalin.marinas@arm.com, kernel-team@android.com, maz@kernel.org,
	oliver.upton@linux.dev, apatel@ventanamicro.com,
	andre.przywara@arm.com, suzuki.poulose@arm.com,
	s.abdollahi22@imperial.ac.uk
Subject: Re: [PATCH RESEND kvmtool 0/4] arm: Payload memory layout change
Message-ID: <20241212094127.GA18819@willie-the-truck>
References: <20241128151246.10858-1-alexandru.elisei@arm.com>
 <173395873873.2737640.3783988676491071650.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <173395873873.2737640.3783988676491071650.b4-ty@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_014135_086773_84B5C3D2 
X-CRM114-Status: GOOD (  18.94  )
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

On Wed, Dec 11, 2024 at 11:44:14PM +0000, Will Deacon wrote:
> On Thu, 28 Nov 2024 15:12:42 +0000, Alexandru Elisei wrote:
> > (resending because I accidently only sent the cover letter, sorry for that)
> > 
> > The first 3 patches are fixes to kvm__arch_load_kernel_image(). I've CC'ed
> > the riscv maintainer because it looks to me like riscv is similarly
> > affected.
> > 
> > Patch #4 ("arm64: Increase the payload memory region size to 512MB") might
> > be controversial. Follows a bug report I received from Abdollahi Sina in
> > private. Details in the commit message, but the gist of the patch is that
> > the memory region where kernel + initrd + DTB are copied to are changed
> > from 256MB to 512MB.  As a result, the DTB and initrd are moved from below
> > ram_start + 256MB to ram_start + 512MB to accomodate a larger initrd.  If
> > users rely on finding the DTB and initrd at the current addresses, then I'm
> > not sure the patch is justified - after all, if someone really wants to use
> > such a large initrd instead of a disk image with virtio, then replacing
> > SZ_256M with SZ_512M locally doesn't look like a big ask.
> > 
> > [...]
> 
> Applied to arm64 (sina), thanks!
> 
> [1/4] arm: Fix off-by-one errors when computing payload memory layout
>       https://git.kernel.org/arm64/c/167aa1e
> [2/4] arm: Check return value for host_to_guest_flat()
>       https://git.kernel.org/arm64/c/ca57fb6
> [3/4] arm64: Use the kernel header image_size when loading into memory
>       https://git.kernel.org/arm64/c/32345de
> [4/4] arm64: Increase the payload memory region size to 512MB
>       https://git.kernel.org/arm64/c/9b26a8e

Sorry, these links are all broken as I generated the thankyou note
against a testing branch. Rest assured that the changes are pushed to
the kvmtool.git:

https://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git/

Will

