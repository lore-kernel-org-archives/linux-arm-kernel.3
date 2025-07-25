Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD42C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 09:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kA8pNI5mdS34mX+uz/JMaRvf5wLdYmUaI0yfJSgSrrM=; b=h2Sm+vx0T/5ZdjnEZ/x466sJ10
	TcBIi5ENob/A2k7TwknNjvyBayHc6o/qvoTfRX8RECrJCldu/k2Pz5CfWHFHkkW4cb1sAahmbCVtL
	YDlD5gAqBtEHkCOxWrHu5ffaQTN27AhTIVFxNgRAidHmBfdPnAE9wVq2nCLtRIr9SbuIr2R1JeyQO
	HaprQWSMB/abi7rBmS58Tw+1/k4IVyr+/GZ4Kjswd+QEuw8j0iIsQZDkhfD84RtjkZWYSV+TQKis7
	kfeR7CrXAcmJ5nkruFouNxrpyW4li6QSJUAbX6n2nlVbUOeRLWDwLjhvsbNi8Y+rE+wLIH+m0qTZm
	zvscmMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEIF-00000009PaM-06tQ;
	Fri, 25 Jul 2025 09:00:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufEFm-00000009P32-0PuG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 08:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60A86601DC;
	Fri, 25 Jul 2025 08:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFF9AC4CEE7;
	Fri, 25 Jul 2025 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753433889;
	bh=QtxpewwK7kkW/Bjl18jPOJCT95GV3NoscW3glHHVwjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gF2Elkoq1uITtu2enh9+w6hxDy4ixmMCri32Tk+lYTGc55W+GA27U4uo/vrR58cEC
	 FTJGMvPiisjMIsM4NgIQn3h1mVx/YxhHsLdT/hYtj+mfSdhGujPxsBqUCi9KE0lMI/
	 I0a8fMmmfi0/EQu/DWdI9edrPnNJHECQDhgEAaJU=
Date: Fri, 25 Jul 2025 10:58:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
	Christopher Covington <cov@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y] KVM: arm64: silence -Wuninitialized-const-pointer
 warning
Message-ID: <2025072553-chevy-starter-565e@gregkh>
References: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
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

On Thu, Jul 24, 2025 at 06:15:28PM -0700, Justin Stitt wrote:
> A new warning in Clang 22 [1] complains that @clidr passed to
> get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
> doesn't really care since it casts away the const-ness anyways.

Is clang-22 somehow now a supported kernel for the 6.1.y tree?  Last I
looked, Linus's tree doesn't even build properly for it, so why worry
about this one just yet?

> Silence the warning by initializing the struct.

Why not fix the compiler not to do this instead?  We hate doing foolish
work-arounds for broken compilers.

thanks,

greg k-h

