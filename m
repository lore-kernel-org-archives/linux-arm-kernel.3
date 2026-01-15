Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA702D46617
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iBNBsyavN8r7wjI1AwpVpvnHilN3gHX54gWqAIo5Dpw=; b=eRd00PzFCpR86B
	tQw3wUmhtJZEt2MvPj8B29zN4a57JXjmvPnvTNJocXkMki8xerVybWaTVF3lHPpSPOKQeLWf5Smei
	Jj655W/0FnTj8hwFBVvJK9IQCMUvsZqiDnkTexRNdJgdQ5UwNhD/kIlMq0RyPs9bXiXtpx1RxRNnA
	FxbFzffVrfxNWMa/YG9QxefOUlMz3OZkTdhRKZdx1cxbE4RUkDHvuFGsLj1+uYsjAbEqCE0szAgZA
	YmA2o99TJ2InKfcxtENDQeStWyrMd4PqivpmIzEbZEp3VVEireW6DKSKlJ22Lm9ATi0UrTxFmQ5Cr
	ayqLfc4QDAVoNDy92Aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgULn-0000000DBRg-2oBx;
	Thu, 15 Jan 2026 20:53:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgULm-0000000DBRX-0sr3;
	Thu, 15 Jan 2026 20:53:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D6A560130;
	Thu, 15 Jan 2026 20:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D89D4C116D0;
	Thu, 15 Jan 2026 20:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768510429;
	bh=kUIIoYoPjMjhLb2Ikm1Imwe9wIvpSRMNJmMBdsX0NfY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cypro30Ix2LyXok4K5JmT0bXfJdd660c0A8Q0TCWcPRwJ5x6+j8Nzw2MC/95i7rgp
	 0Mt2iOjN6bcNUaOlkI5mTnGAL8NLFDXqEyWwxoMhMgn9lKOKPh6ulzdpALJoADIrbS
	 nvGzMApAfZ0Leo5ZTmwROkFDAvON0A3IVZ9e4E2abJsOwuqmwRdQdWx/k6/nBGeXnH
	 aCgXIKyeM8FTD82xWgiu+hcONJNWPcSaYUzZxtoe/EOVbTc13SE69zzuGtF+aTk5y+
	 lSXduIOieNL9xib+Nmclwnnsc0L/LqNwUI1oW0fTunZ8Ew5QvgCPP26PYCiObGwTSm
	 E6oi31K5cm+vQ==
Date: Thu, 15 Jan 2026 14:53:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Terje Bergstrom <tbergstrom@nvidia.com>
Cc: Johnny-CC Chang =?utf-8?B?KOW8teaZi+WYiSk=?= <Johnny-CC.Chang@mediatek.com>,
	"lukas@wunner.de" <lukas@wunner.de>,
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
Message-ID: <20260115205347.GA881345@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db8fb91b-e132-4d8e-ab7a-d7954fc6629d@nvidia.com>
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

On Thu, Jan 15, 2026 at 12:11:09PM -0800, Terje Bergstrom wrote:
> On 1/14/26 09:28, Bjorn Helgaas wrote:
> 
> > What sort of crash happens?  It's useful if we can include a bread
> > crumb that will help people identify the crash and find a fix.
>
> We observed retraining to lower PCIe lane count and config read
> timeout.  So yes crash is not the best way to describe it.
> 
> > I'm confused about what the topology is.  I first assumed GB10 was
> > a PCIe Endpoint, since Secondary Bus Reset only applies to devices
> > below a bridge, so SBR would be applied to a device by a config
> > write to that bridge.
>
> gb10 is an SoC designed by NVIDIA and Mediatek in collaboration.
> It's not an endpoint, but has its own PCIe controller for connecting
> PCIe peripherals like NVMe drives, NIC, etc.

OK, so you do SBR to some endpoint below a GB10 Root Port, and after
the SBR, the link to the endpoint retrains with a lower lane count and
config reads to the endpoint time out?

I see you're from NVIDIA, so if you're confirming that this is a
hardware erratum (not an issue with the GB10 PCI controller driver),
we should definitely apply this, and I'll wordsmith the commit log and
comment something like this:

  When asserting Secondary Bus Reset to downstream devices via a GB10
  Root Port, the link doesn't retrain correctly.  The link may retrain
  with a lower lane count, and config accesses to downstream devices
  may fail.

Bjorn

