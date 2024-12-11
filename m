Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F42E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 00:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Q8RLGRZwG3c++ek3HDNyZ1jXhiyW1baJM0ChZ43hrQ=; b=4BHc3y4e88dpTKANqH1LcG2P+R
	DVOhoibXF6MfKX08ZAKLRfLDJEzb/H5TwqWFcz8HqzGT3/+E0xFEzmkRGvJ5bNAvZKL7R+be7m8rP
	jp9Pe7JiYJ0FkrW1IH0oNNiBLHbwFcG/S3d4ruHPTg7e4Ui84z0TIMZAV9+angvPLOqd55U0Vn3rj
	o8DNmKen/Gyvfuhj4SxRPWbrYIR+RH9kgJlWIvB84WL/Cl90P1R6wyRMGr56Gu8iDrRJ1BsarPtsd
	ajBLqbxjGV8Sc5AYmGLtduO/SvJgDvuuNAuBKa9XHksqhTNU+H3uMiTOtYvRjwmIiG+vxKOogDUa9
	QlGR0kVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLWrT-0000000GaA5-3NHZ;
	Thu, 12 Dec 2024 00:15:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVgA-0000000GQ9A-10V8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 22:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 379975C5632;
	Wed, 11 Dec 2024 22:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 544C4C4CED2;
	Wed, 11 Dec 2024 22:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733957977;
	bh=ba8OhYJWZ7/RdSdR8zo6eTaxvZtkyE7pWbYivefWwDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WaW+15dgE5AhR7mM92AiA6N5aJE7lkhwrwK16HZxjs4UoJDius5M1h9sMsfQmFYRJ
	 k4G+vsfFOATgIp4A9IWmEDFXj2uAEANp3yfKGYKxdInMn8EgftnquPb91kaVHKroiW
	 ro09RxLYMw8dcZu/Ii/Ny2j9diSMfFbubvjCkbampS7gmb5oXyIHzZ3HezADhQxLsJ
	 kLtQmKUCKChmXo1gLDb5N9G6fk88uyjFB1OdDva8/FHvdXnzTcnimD5ILgDGNoI//6
	 Mvq/J5aBVmgX0czKCB9R0vqUxmSaexbQItgIfnNj3BUQUqlWpcYI61Sjqn3U+6acYH
	 upCxWWuLsTdGg==
Date: Wed, 11 Dec 2024 22:59:32 +0000
From: Will Deacon <will@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: julien.thierry.kdev@gmail.com, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, apatel@ventanamicro.com,
	andre.przywara@arm.com, suzuki.poulose@arm.com,
	s.abdollahi22@imperial.ac.uk
Subject: Re: [PATCH RESEND kvmtool 0/4] arm: Payload memory layout change
Message-ID: <20241211225931.GC17836@willie-the-truck>
References: <20241128151246.10858-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128151246.10858-1-alexandru.elisei@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_145938_322737_3162D756 
X-CRM114-Status: GOOD (  20.46  )
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

On Thu, Nov 28, 2024 at 03:12:42PM +0000, Alexandru Elisei wrote:
> (resending because I accidently only sent the cover letter, sorry for that)
> 
> The first 3 patches are fixes to kvm__arch_load_kernel_image(). I've CC'ed
> the riscv maintainer because it looks to me like riscv is similarly
> affected.
> 
> Patch #4 ("arm64: Increase the payload memory region size to 512MB") might
> be controversial. Follows a bug report I received from Abdollahi Sina in
> private. Details in the commit message, but the gist of the patch is that
> the memory region where kernel + initrd + DTB are copied to are changed
> from 256MB to 512MB.  As a result, the DTB and initrd are moved from below
> ram_start + 256MB to ram_start + 512MB to accomodate a larger initrd.  If
> users rely on finding the DTB and initrd at the current addresses, then I'm
> not sure the patch is justified - after all, if someone really wants to use
> such a large initrd instead of a disk image with virtio, then replacing
> SZ_256M with SZ_512M locally doesn't look like a big ask.
> 
> On the other hand, if there are no users that rely on the current payload
> layout, increasing the memory region size to 512MB to allow for more
> unusual use cases, while still maintaining compatibility with older
> kernels, doesn't seem unreasonable to me.
> 
> Please comment, I don't feel strongly either way - I'll happy drop the last
> patch if there are objections.

Well, I won't reject an imperial.ac.uk patch on a hunch, so let's go for
the whole lot and see if anybody complains!

I'll fix the indentation issue spotted by Drew when applying (thanks!).

Will

