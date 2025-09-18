Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E741ECAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 08:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSISvEYJCPwsG5ggKGHhcw2MTJYZN4kF0UXpONe9GxA=; b=S/AYQNUxNfyM1v7vDh/YCmAdnw
	Y/tYPPIY2RMT4qraRQYQWAs2CM9UzEcXrDhDAzUOYLexErrJ/t50SELXgFlXsFHa1ry2uB76dEc2j
	FCO7HRxPIIWDdEVuhv2Cmg7xBDujt6UnH4FgA36mf1nBJKJOrUF/s/8Pnd04wTzm2FISwVFzMc8/8
	3IGlmzLO/bKzf3cF78c6LoMMKk0LRkpAR4FN7/X2mZCgvwk2xpwxrzismPUKD6/YgCYpi4XTaGTIq
	DipXM+WDtJChDQB9vyOM82p+DcLhJTMGBKTws4Lh0+y59PH/QM1RUkgNvqQkOpTBI69Fq3g9CCCaX
	jfu0MGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9ZY-0000000Gd54-2uN8;
	Thu, 18 Sep 2025 08:00:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz9ZX-0000000Gd4d-38bW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 08:00:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D1436020F;
	Thu, 18 Sep 2025 08:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6726DC4CEE7;
	Thu, 18 Sep 2025 08:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1758182454;
	bh=UnpotEpeySTaAPvBTlkT9xkPJHNwbR/FKxEvGWp576w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uwwXpzntZf8uB1J7sJ0fpwoZix7C/qnx3C/XU2TmmmkX9S4UEXogZFY9B9rliQ986
	 xE25OkbK1EEaaolpFVhK4A9YZ3zctIFfix1Vxabvbew0JC+NBPAAffH0KEVNhbgyqC
	 7zzNFEOjzYR1t6Bo6TWMDe6YeIoQAlzHyCra4bH0=
Date: Thu, 18 Sep 2025 10:00:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, sudeep.holla@arm.com,
	rafael@kernel.org, dakr@kernel.org, beata.michalska@arm.com,
	sumitg@nvidia.com, ptsm@linux.microsoft.com,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arch_topology: move parse_acpi_topology() to common
 code
Message-ID: <2025091837-overload-fraction-b2bb@gregkh>
References: <20250918014828.78383-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918014828.78383-1-cuiyunhui@bytedance.com>
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

On Thu, Sep 18, 2025 at 09:48:28AM +0800, Yunhui Cui wrote:
> Currently, RISC-V lacks arch-specific registers for CPU topology
> properties and must get them from ACPI. Thus, parse_acpi_topology()
> is moved from arm64/ to drivers/ for RISC-V reuse.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/arm64/kernel/topology.c  | 87 +---------------------------------
>  drivers/base/arch_topology.c  | 89 ++++++++++++++++++++++++++++++++++-
>  include/linux/arch_topology.h |  1 +
>  3 files changed, 90 insertions(+), 87 deletions(-)
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

