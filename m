Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943DAC87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Jul 2025 15:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zS1LMg1MuiPAHWkNDLYVGAjhbim5fU6nBarh+hnpDl0=; b=1YsdYAMmgXhGUJYCTJoJcYW2mQ
	4t5JcfSkPIqCmK/NiaPNPTceI9Q2fsSXq0S3/N6TFVnb6zh72CTFvswfbfESIo7Yjmm2uPtrTkpFh
	rbvwfUSx8lo/EquDLpfCF/PrgvGrsumFrqa8XTbsUMxf1LNyyXsR9Nrbwcq5gKWT3l/eCyiG4rhfl
	fT8cPOwCuNkXG/4SWfqWmKy1alGUthHIjf1esBGZSZ4Knhtt73I3+KKTOQZo7vuvjBgVfC4IlLii5
	wM5jyEnZ8XKilHxdKlQOVm7uDvlbWcV4mdp3f7BJmSGWUHUNNLEC2EbAd45y3ayph61oW1F8YtudG
	DFFu+XkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug3Zv-0000000CsOS-0k6h;
	Sun, 27 Jul 2025 15:46:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ug3XO-0000000CsCL-2UtG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Jul 2025 15:43:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01750600AE;
	Sun, 27 Jul 2025 15:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB12C4CEEB;
	Sun, 27 Jul 2025 15:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753631025;
	bh=zoz469+SQa2Dc1zsiysjdo7V3MLdODW25CN/F08aRPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NNSDAQOKCwm/+WN0tGh0gq4l2b+lBKfp1MpmkK7LUJJ9K5gLUXVLUfex6A4F3bg0A
	 BfaFyUWY75W7CMPyR8rSS0Ye5N2fOuDVJjFhmWiUQJVpCCgUsl7AMm8b5mjidc1qUK
	 +qPF02BQFdjJ4wRK79Uk/xpkGzUKUovuu5k6JXc8bJW4Ydx+cbT/EScImRPcKoc2Qi
	 V4HuZFeCTxJlMKjbrBXy2VRifrTGU4HfTe+aH+d5lrtc+eZ3znb28IFJugYNG5Our2
	 Fa8gGY4QhltOQTYgSmudIC/r+JYKP/wW6KiiiAEfljSZkwQU3mYwJrYwvXLoUdUkpJ
	 /bwdAykUXa1Hw==
Date: Sun, 27 Jul 2025 16:43:36 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: Sean Anderson <sean.anderson@linux.dev>, Salih Erim
 <salih.erim@amd.com>, "O'Griofa, Conall" <conall.ogriofa@amd.com>, Anand
 Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, linux-iio@vger.kernel.org,
 David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, linux-arm-kernel@lists.infradead.org, Andy Shevchenko
 <andy@kernel.org>, Manish Narani <manish.narani@xilinx.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: xilinx-ams: Unmask interrupts after updating
 alarms
Message-ID: <20250727164336.385dda93@jic23-huawei>
In-Reply-To: <3a77d5db-eeb4-43df-9de0-e6bafea4d9ea@amd.com>
References: <20250715002847.2035228-1-sean.anderson@linux.dev>
	<20250724163219.0098ced6@jic23-huawei>
	<3a77d5db-eeb4-43df-9de0-e6bafea4d9ea@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 25 Jul 2025 06:47:16 +0200
Michal Simek <michal.simek@amd.com> wrote:

> On 7/24/25 17:32, Jonathan Cameron wrote:
> > On Mon, 14 Jul 2025 20:28:47 -0400
> > Sean Anderson <sean.anderson@linux.dev> wrote:
> >   
> >> To convert level-triggered alarms into edge-triggered IIO events, alarms
> >> are masked when they are triggered. To ensure we catch subsequent
> >> alarms, we then periodically poll to see if the alarm is still active.
> >> If it isn't, we unmask it. Active but masked alarms are stored in
> >> current_masked_alarm.
> >>
> >> If an active alarm is disabled, it will remain set in
> >> current_masked_alarm until ams_unmask_worker clears it. If the alarm is
> >> re-enabled before ams_unmask_worker runs, then it will never be cleared
> >> from current_masked_alarm. This will prevent the alarm event from being
> >> pushed even if the alarm is still active.
> >>
> >> Fix this by recalculating current_masked_alarm immediately when enabling
> >> or disabling alarms.
> >>
> >> Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
> >> Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
> >> ---  
> > Anand?
> > 
> > This seems fine to me, but I'm not that familiar with the hardware or driver.  
> 
> Anand left some time ago. Salih or Conall should be able to provide some input.
> 
> Thanks,
> Michal
> 

Hi Michal,

Thanks for letting me know.  Would be good to have a MAINTAINERS update patch
to remove Anand + ideally add someone else.  If not to mark it orphaned
(will still be covered by the top level IIO entry).


