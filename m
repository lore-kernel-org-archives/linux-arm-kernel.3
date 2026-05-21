Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B66CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OalQW79wuJKQugYTsEuY13ekGnznNoc2Hb27TehySZ4=; b=j8rDCEp0fG0m9ckDKS35GhcaHs
	2TNbJQ1TWv3ljngGoajQemnGSqOO1UhDVENz0G+oEgMHljfBs4H5FlAwMVXu0QG/TeN2wemYIRjB7
	eb8bvfQ0GrGFO48+v8eiXlWej8XqKvaiu5uf/2z+YzLglLKxrKbfdk/ApA13CxmOmbYM0+vIPSSix
	3GG8VaA9YR0MfWZxm+ITy08WkozqffGHMjsB1TmbSSrR1TRYbAFd/kwS3y24G8VPM1R1Z/inb7Pj1
	r8MDyYGsO100s8kXmwsbTOi1NSIFeeH02/h2R9qf/e62to50++g1UmrNnQ0vHxugv39TIuO3Voc5C
	7wXJcbzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0qW-00000007VHu-36gy;
	Thu, 21 May 2026 10:41:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0qV-00000007VHP-2iik
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 10:41:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BBD0260210;
	Thu, 21 May 2026 10:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98C31F000E9;
	Thu, 21 May 2026 10:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779360102;
	bh=OalQW79wuJKQugYTsEuY13ekGnznNoc2Hb27TehySZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b9pIlSjlapmfSCxVoNCfcbH/W1Fi6EmAo1gUOmdZhHuOc9o8r573AoghDvlzOtRLM
	 72xoeBHodOpU3T+g+FO8P1n7Bd2ySku7n9Iumc2WmPBFVo7QeWdtE9oO9ax2t+TSMz
	 u99z4I71tAdP8csaG7sjeeIoR86I9X0jDuyOjlIyAkOW2cksQk7VtuCLb6jk+9ReKt
	 H5JhWbMg0I93+loBWoBH5j2Fihua59smLK7e/54gsHz9zl5Rw8mXLlTE22XYUd0Bar
	 Rk4siV5T33Dp/vySWXOtFuIG3EjEgN/xtxtTRNnP6HtmSeqgR8hFuio//8mDpXsAsQ
	 nCkmmjljcY47g==
Date: Thu, 21 May 2026 11:41:36 +0100
From: Lee Jones <lee@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
Message-ID: <20260521104136.GA2921053@google.com>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <177929432727.2891971.15568098895295536822.b4-ty@b4>
 <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
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

On Thu, 21 May 2026, Diogo Ivo wrote:

> Hi Lee,
> 
> On 5/20/26 18:25, Lee Jones wrote:
> > On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
> > > This series migrates PSCI and MAX77620 poweroff handling to the
> > > sys-off framework and fixes shutdown on the Pixel C (Smaug).
> > > 
> > > The first two patches replace legacy pm_power_off usage in the PSCI
> > > and MAX77620 drivers with sys-off handlers. Besides aligning both
> > > drivers with the modern poweroff infrastructure, this removes the
> > > global callback dependency and allows multiple handlers to coexist
> > > with explicit priorities.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> 
> Thanks for applying the patches! Just a question and an observation:
> 
>  - I'm assuming you were ok with merging [2/4] despite the possible
>    deadlock since this risk is already present in mainline in the same
>    form so we're not actually making things worse, is that so?

Did you see the text below?

Both patches 2 and 3 are applied.

>  - The observation is that the comment about overriding PSCI is only
>    true after (and if) a reworked [1/4] is actually merged.
>    If it isn't then patch [3/4] is actually working around another handler
>    in soc/tegra/pmc.c where a handler that only does work for the Nexus
>    7 is actually registered at FIRMWARE level for all platforms that
>    probe that driver (I will send out a patch shortly to only register
>    the handler on the Nexus 7).

I assume the other patches will be applied soon.

If this causes some kind of issue - let me know later on in the cycle
and I'll remove whatever patches you ask me to.

-- 
Lee Jones

