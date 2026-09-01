Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EA6C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 07:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f70YFxG4GjiGHCz68aNtXwJu84EKm6ZQbGp795Xnei4=; b=SJYNSaD2MYwKXFarVk4skc9XZt
	/OXh8lX5PVwq5loDBjQOIciHIgsNqMYN6yjEHk8bvsT7AT4Jnd28mCbxkeq8sXE/TsZJa5rpJKHJG
	yjYEMayI6nJVaDeE4Y/IEKILwI+MotqGQAEJ6jLKk3JzUodKfvFkesfsAkUy8EVUztEOtKY0w91f+
	ekcXzEPwCtSIf61HG5G13hrRo+aNOTPpyq32f3U5z+QCySd3FFVxjISHMBNl5FKYJYw/Dz3z0egqW
	9WUQ74qrzXWDcquR7fcP5DyqOR9X7I/bmH0N9+hs7vgp4LX3hB3Adtgo81E1ZJaNFADtU/4avbSfe
	kXLrv/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Is4-0000000B7Cw-1qLx;
	Tue, 01 Sep 2026 07:25:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Is3-0000000B7Cp-3QmR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 07:25:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B333C4083F;
	Tue,  1 Sep 2026 07:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7268A1F000E9;
	Tue,  1 Sep 2026 07:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788247526;
	bh=f70YFxG4GjiGHCz68aNtXwJu84EKm6ZQbGp795Xnei4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HgXgMlzwXRpSxTj9gGLIzfOzyFzqGVc0vugvXQST154BMTRRgX4fujRkNPMGQVZmX
	 5qEBoZad4CF4C1xjAFa9PvxqsmXPNPTCgpDyaxIC1YpqugTvwN4XjQBhOPm6vTEqB2
	 ZESAIlELQ3Cc1hrjYGA0uOf2solHq0b64DfMW/ouHxkB+j9AvpRY4fqxtCRQlfJxLt
	 VxEx16F71tVPhajKTy7fur8gZ7FECLzPS19ZTwSzC0Rb7uawBdkVOjNYWBV139PDxh
	 35giSripBpKiqjjJbgtE8gQEK0OCPOESzRaV/NuZXUJzuKB+Zu2KWzOATNOf9LzQxU
	 BDdZehOGXbisA==
Date: Tue, 1 Sep 2026 08:25:23 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Maxi Saparov <maxi.saparov@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Seth Forshee <sforshee@nvidia.com>,
	Serapheim Dimitropoulos <sdimitropoulos@coreweave.com>,
	Maxi Saparov <masaparov@coreweave.com>
Subject: Re: [PATCH] firmware: arm_ffa: Unmap RxTx buffers on device shutdown
Message-ID: <20260901-wild-parrot-from-uranus-e0c9ee@sudeepholla>
References: <20260826222337.73480-1-maxi.saparov@gmail.com>
 <ao9sWrszkXwj5-PK@CW-D0XG2Q16P7-L>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao9sWrszkXwj5-PK@CW-D0XG2Q16P7-L>
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

On Wed, Aug 26, 2026 at 06:47:11PM -0400, Maxi Saparov wrote:
> Apologies, I failed to spot Carol's earlier patch for the same
> problem before sending this:
> 
>   https://lore.kernel.org/all/20260818224404.3694580-1-csoto@nvidia.com/
> 
> Please disregard my patch in favor of that one. It covers more than
> mine does.
> 
> Some corroborating data from our side, in case it helps that patch
> along. We hit this on NVIDIA GB200 systems in production diagnostics:
> after a kexec from a kernel with FF-A active, the next kernel's
> FFA_RXTX_MAP is denied and the driver fails to probe until a full
> system reset. I can also confirm Carol's observation that unmapping
> the buffers alone is not enough. The notification bitmap is retained
> by the SPMC in the same way, so the cleanup has to cover both.
> 
> Happy to provide Tested-by on the next revision of Carol's patch.
> 

I had replied to Carol with reference to [1]. I prefer that approach, see if
that helps.

-- 
Regards,
Sudeep


[1] https://lore.kernel.org/all/20260729-nostalgic-accurate-raccoon-ab7d7e@sudeepholla/

