Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2544C5516F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 15:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JT8xi+LYfJ/lkhRCzd7X6UxWwkgghhtU4W+AfhVJTFk=; b=n9xZvOZOHcu8rFzP0pFpJcjWCb
	DsZ9rUtW7A/H3XLf3eySft8TpxGsrRUxpC6ZRbIjY1OZMZT8q4oBT40mQ97I/IFPr7YgtNK7gx7Wd
	JpaMhwio7vPGFzHwppxC7yn2DfyurnD3avN7dXUaof03GAecKnJcVq5lQZ948e8i9p2um3MgMeU6M
	hI9HPGLkENqhAwufNEZP0StD20ratSTPMmwJBPvP0RVyL3fKntpfubXhQu/Glz2f8ZmeTfw84giV9
	MtQrHTmDAfEQi6gEzS2ae8qU29zqW2PKrd10brRWlRVyjvkWk5iJbIsYSJC/X7wa+paSqb+d35gGp
	ZaYDRd7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpp9R-0000000Cu6r-0c6z;
	Fri, 31 Jul 2026 15:27:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpp9Q-0000000Cu6j-0bwJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 15:27:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 899A540A38;
	Fri, 31 Jul 2026 15:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE4BA1F000E9;
	Fri, 31 Jul 2026 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785511675;
	bh=JT8xi+LYfJ/lkhRCzd7X6UxWwkgghhtU4W+AfhVJTFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R/G2PsrwbLj5UBqI6fxnplbccH2TfJ3is2/eG1W2dpWNhFJNrcccWcQabCsK66mV9
	 RN5yQ/LdtVmoE883tZpRN1KmoqjLEgwoQ4yJRMnlxyJM1XwSECwPcjqdMYc7QHduXx
	 9FyFTxmLWomYtFbP/JtxpCvKYJ7EoeOiBb5ocYZOfWb09k9/6LGUese17ekddwMeJK
	 cqnYzYdIHKPrloDtidEOgIeLHDKF8McnAUiu4rugXFJErzOXq7f6kPfpUtjPUHensW
	 GJdsYRC8ogNosBpHJd3//l25n1/wdVcefDC7TueCXNtrmYZNC9BfNUzHK0SUN1+42n
	 9NQaaNuhsLlKw==
Date: Fri, 31 Jul 2026 16:27:50 +0100
From: Will Deacon <will@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Geethasowjanya Akula <gakula@marvell.com>,
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	Tanmay Jagdale <tanmay@marvell.com>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/3] perf: marvell: Add MPAM partid
 filtering to CN10K TAD PMU
Message-ID: <amy-9oBsRnQd_Qtr@google.com>
References: <20260618153610.13649-1-gakula@marvell.com>
 <20260618153610.13649-2-gakula@marvell.com>
 <6b15d3fc-4b4e-4c6c-a96d-5817d7114d02@arm.com>
 <CH0PR18MB43394668EAEBD367DB4D4990CDEB2@CH0PR18MB4339.namprd18.prod.outlook.com>
 <44cd4364-37ac-4a54-a7b2-256fbad10446@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44cd4364-37ac-4a54-a7b2-256fbad10446@arm.com>
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

On Fri, Jun 26, 2026 at 09:57:44AM +0100, Ben Horgan wrote:
> >> Where is the user expected to get the PARTID from? The MPAM driver
> >> considers the PARTID as an internal only value.
> >> …
> >> Perhaps some helpers along the lines of:
> >> int resctrl_mount_generation(void)
> >> …
> > Thank you for the detailed feedback — the concern you raise is valid, particularly when 
> > viewed from the perspective of resctrl-managed deployments.
> > 
> > However, to clarify the intent of this patch: the exposure of partid in the TAD PMU is deliberately
> > a low-level, hardware-facing interface, and is not intended to integrate with or mirror the
> > abstractions provided by resctrl. It is mainly meant for platform bring-up and low-level
> > performance/debug users, who already have explicit knowledge of the MPAM configuration,
> > typically provisioned by firmware or other privileged software layers (e.g. EL3/EL2).
> > In such environments, PARTIDs are known out-of-band, so the expectation is that the
> > user supplying partid is already aware of the MPAM IDs programmed on the system.
> 
> When this was proposed before, [1], there was feedback asking to
> document how to get the PARTID.

Yes, please can you update the documentation to cover this? I'm not
necessarily asking for a programmatic way to do it, but even something
like a reference to a document or a firmware table would be useful for
people trying to use the driver to profile their workload. Otherwise,
it's just an opaque id :/

There are also some comments from Sashiko to consider:

https://sashiko.dev/#/patchset/20260618153610.13649-1-gakula@marvell.com?part=1

Thanks,

Will

