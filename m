Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C3EC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSUP/FldKSKIh3rMEH+d3FwAjG9D+pH/7vnolvntLZ0=; b=uXW0w0LYzh0F4rPwWYSiqqVhFi
	ri3CNBHra0dv9lRpB6kxAfvpHDwVTAQDCcVK/cA47CUIaIuT0ghXQkhmp+BaMpnfQ5vsbITo9YdgZ
	8P4M4uihoElsp9hFamMmxuGtJgxRdroMWyIU1SX93jetAP3q+UVJVw8oA9zbLagHMS0a3rG5bE61v
	ThbomWd//sWGhsovFEAx52KWKjF3GJzk8aiPS1gwln4AwlLQsD807mycsvTP8NDfO9841TVLM+/8K
	ao/jI4p31Hxnekbsoei0dznJLzRDyQe1Z8BiWl5Racxc2zBBBVyAfO9pjOp8/hDnirD0jV1oVTa/T
	LfPbomKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GZI-0000000Babx-2Vyc;
	Wed, 09 Sep 2026 11:34:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GZH-0000000Babe-0ZR0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:34:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8010560207;
	Wed,  9 Sep 2026 11:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D401F00A3F;
	Wed,  9 Sep 2026 11:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788953658;
	bh=oSUP/FldKSKIh3rMEH+d3FwAjG9D+pH/7vnolvntLZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yde7Jb30UcygvXK1+GjsPtdnydHn1R+M/nx8DmYk/Yf32NI2SN6NuUACHfnYM5AmP
	 N+MpZQaEiEU1VY8D0fYerMGmJBbrnNH5FeTDmz5idDk18YK/FpLWJe60skjL4KHLvr
	 PeEpzfV6ykd0BDY3jXAbCr+HK9My1i/y6y8Wrw4KrvpeLobGeL0VGZ+RIggo7CyqOP
	 1tTeQAZhegkLr9eFSXFKTSQiZV5QN+Er8GnUYkT+EnCQW0iQj6ytK9lzCj/BnwJlVR
	 VylFoArNg/gAtvX6nhU4gSeUU43t0+01Kg2meWR8ZYhQkuGXr+BwlZDJBh2xPqi6sX
	 knSUvbNG+XKNw==
Date: Wed, 9 Sep 2026 12:34:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 03/14] KVM: arm64: Manage GCS access and registers
 for guests
Message-ID: <aqFEGDkyZbXp1B0V@gremlin>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-3-f31750bdfadb@kernel.org>
 <apmfx08vccSd2MXw@gremlin>
 <d2659ac3-2f00-4fc4-8f9e-0585691a4ba2@sirena.org.uk>
 <apqA_SuoA6-TyHsS@gremlin>
 <apszJZ17KUvd6BJ7@sirena.co.uk>
 <ap7GPxGs3nhT70sS@gremlin>
 <1effee02-41f0-4680-9a6f-9b9f12459ec1@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1effee02-41f0-4680-9a6f-9b9f12459ec1@sirena.org.uk>
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

On Mon, Sep 07, 2026 at 03:55:43PM +0100, Mark Brown wrote:
> On Mon, Sep 07, 2026 at 03:14:34PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Fri, Sep 04, 2026 at 10:07:49PM +0100, Mark Brown wrote:
> > > On Fri, Sep 04, 2026 at 09:54:51AM +0100, Lorenzo Stoakes (ARM) wrote:
>
> > > I think the best thing overall would be to leave the runtime paths as
> > > they are and refuse to run with an architecturally invalid setup, that
> > > would avoid bloating the fast path.
>
> > Ack, it'd be nice to not have to worry about that.
>
> > Presumably we definitely want an oops on a GCS violation in general?
>
> Yes, the guest is going to want GCS exceptions delivering if they've
> enabled them and something triggers them.  It might also be relying on
> the GCS for stack traces even if nothing triggers any GCS related fault.

OK so the answer seems definitely to be disallowing the invalid config at
runtime then I think! :)

--
Cheers, Lorenzo

