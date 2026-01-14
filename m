Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF494D38FF9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fqrv+uluXUdCwqRqMV1mDM3218han9vFyABHpAgrIZQ=; b=UH3Y7YGHPg3NuRunmiF8Prl/YD
	fxY6MwtRctJ4qk/VpYiYnmKoPmjJ3t09P065rmVm26Pgd86L1m0dFt3UWvS4aNg4ibWgNlmUWujX8
	05VT7BtZ0TPVSQFJyGHyYx+SbcSkTTtWl9m0UYwm6ShkC7XD/vq52hMGMMFgAZHfj+KRJGvCQta6m
	6IOKNWpPR2ujkRfvleu4r6UHY345XT9sfuYRGgqBSg2HN12qvuRSZoqkqsrpXiM6vwKQW6mWHqrOY
	wJ6z+yiHLLIukfqImOXRZK7vsn+71cLiJqLGcR6u5hio8v17n/+Ghz33NxICAxZqRocQmA4YnchRL
	1q9QbtJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4fd-0000000A8T9-3S4M;
	Wed, 14 Jan 2026 17:28:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4fb-0000000A8S8-04in;
	Wed, 14 Jan 2026 17:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C95F43F56;
	Wed, 14 Jan 2026 17:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFB82C4CEF7;
	Wed, 14 Jan 2026 17:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768411713;
	bh=wD/5RVHhGR99Mqb9HHrjiTflC51aStRb6BACeDI9CVE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Zqg9qRe7uE1FygMozTkXAaWZGBj3D7YBYFSZBt2LQQMbz/euQHCq7j+XgVkO0tu7u
	 JOlzmj+7L/Y7CHZalggRJh8YXrB20UtopsY6u1mnVrgdsaluAeKicAY8SXllN7Dfu2
	 3QISaTvRBf0YFR9tYou4x/FG6TNAco1E7o0XPfiym71SxLBUsjzb8n2ebIu6haa0v3
	 UhiyTtn9QkYieySz+Ylamyd+PFXJU7XTgkBHMcjR7ZrmnyINnmagPfv/ZwPPluruMF
	 zHteLNNVXbIywvPHoC/jJGBElYbpoqmm4hCQHPKgJgy4q+BwvwumT5oWNdnpoaoATg
	 nz59CcWh7LSDQ==
Date: Wed, 14 Jan 2026 11:28:32 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Johnny-CC Chang =?utf-8?B?KOW8teaZi+WYiSk=?= <Johnny-CC.Chang@mediatek.com>
Cc: "lukas@wunner.de" <lukas@wunner.de>,
	Project_Global_Digits_Upstream_Group <Project_Global_Digits_Upstream_Group@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH] PCI: Mark Nvidia GB10 to avoid bus reset
Message-ID: <20260114172832.GA822909@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d91c98a99a0a1b368691a93141f4f14e5ece44c.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_092835_081559_56993883 
X-CRM114-Status: GOOD (  17.60  )
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

[+cc Jason, Alex for Nvidia input]

On Wed, Jan 14, 2026 at 06:39:24AM +0000, Johnny-CC Chang (張晋嘉) wrote:
> On Tue, 2025-11-18 at 17:39 +0800, Johnny-CC Chang wrote:
> > On Thu, 2025-11-13 at 10:39 +0100, Lukas Wunner wrote:
> > > On Thu, Nov 13, 2025 at 04:44:06PM +0800, Johnny Chang wrote:
> > > > Nvidia GB10 PCIe hosts will encounter problem occasionally
> > > > after SBR(secondary bus reset) is applied.
> > > 
> > > Could you elaborate what kinds of problems occur, how often they
> > > occur, etc?
> > 
> > There is about 1/1000 chance that after SBR is applied, any further
> > access via this root port will be blocked and make system crash. 

What sort of crash happens?  It's useful if we can include a bread
crumb that will help people identify the crash and find a fix.

What I would expect is some kind of PCIe error like a config read
timeout or unsupport request error.  But usually those just result in
~0 data back to the CPU, which usually doesn't directly cause a crash.

> I would like to update below description to replace original comment in
> v1 patch, is this information sufficient? 
> --------
> /*
>  * After SBR(secondary bus reset) is applied on an Nvidia GB10
>  * PCIe root port, there is 1/1000 chance that further requests
>  * via this root port will be blocked and cause system unstable.

I'm confused about what the topology is.  I first assumed GB10 was a
PCIe Endpoint, since Secondary Bus Reset only applies to devices below
a bridge, so SBR would be applied to a device by a config write to
that bridge.

But you mention a GB10 Root Port here, which obviously is not an
Endpoint, so there's no bridge upstream from the GB10 that could
initiate SBR to the GB10.

If this is actually a GB10 issue, it sounds like a hardware erratum
that lots of users would see and Nvidia would likely be aware of. 

Bjorn

