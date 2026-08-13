Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26761C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQHX6qwH3K6Cws7imC/VISNvbPtmS5LtCAb0pnEIW4c=; b=DhSi20ui8s2wvKAqFG3x/GeWp5
	bIybk0Ucv2TrJiBi7b2cGdyNs2AfhkmsozhrEHdMIB5iyzRFocbfYUapwpmdXYBOWPDQPogjHVCc+
	rnwAws41jfgzxznL3LSgtDx+QIkBtgRirdIfi4LRV/8rdsJsQAs12N1Uj574HNd/OCyDm/DgxUymf
	Ytq/vYqM3R8PLG4Xpg5XdHGwGvwx2laT5t+phmOicP2yKmr4F4H5Ye+S2E6dBnLq+VMEJ0RLC75oI
	/YpgDcsV3vM0s/zQYXBmmOeEnzIN0lE0KlT8hVf6G7wp3RGFdYojU1WBjr2X5fSLSmaYPMH8ywJOC
	68uUno3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVfR-00000000lfk-3u2M;
	Thu, 13 Aug 2026 13:40:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuVfQ-00000000lfH-3wop;
	Thu, 13 Aug 2026 13:40:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DF98941B58;
	Thu, 13 Aug 2026 13:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C57941F000E9;
	Thu, 13 Aug 2026 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786628419;
	bh=FQHX6qwH3K6Cws7imC/VISNvbPtmS5LtCAb0pnEIW4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z7gJ4sPL/QLGTRofjuqgeInA8apUG+qo4OurrP85GJpr84S9Pw17xHY0jtHVXcpMJ
	 gEb9YOkZ87XkUuS01iGqtXyKLEk9ASVMiBnMDgnHHSqa7ODLMd2AvCjcmZ6UkM1Tco
	 5nmhg61sL0cD4novs9PZrdiJ43TlB+WIWz4YD+j5B2vqnCBmJj9ZexvaYnnftfQo4+
	 ARajYMF0RnJLoBdoQEA2y+Bot6NHtH/NApHbMhfguxf2iWzDGIdP1H72i640f3LYub
	 txUuDBDfvo2sU74ieusuKZ3RKuoQgIRhlE/R9ApOtNZgU3zK1DY7yURwY6RRnYdo8i
	 dv9cuvIjOZsdQ==
Date: Thu, 13 Aug 2026 15:40:11 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-phy@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek USB3 PHY DRIVER" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH] phy: mediatek: tphy: simplify main allocation
Message-ID: <gauflzkiq4nsxciwzy4r3piodhnoriv5gh5mhsauk7bxgwclcp@3uiuv7i7qbh7>
References: <20260304041400.7236-1-rosenp@gmail.com>
 <djjg6jwpuu6l5wcc7zbxfi7j4n5hircmhivxohdtgufzrp6rlb@l6eyfdyfrxix>
 <CAKxU2N_VYNgYKhS11Frzio4fbg_ZnDsvCfEypvxSiw3-JV0_QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_VYNgYKhS11Frzio4fbg_ZnDsvCfEypvxSiw3-JV0_QQ@mail.gmail.com>
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

On Wed, Aug 12, 2026 at 11:15:43AM -0700, Rosen Penev wrote:
> On Wed, Aug 12, 2026 at 6:32 AM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Tue, Mar 03, 2026 at 08:14:00PM -0800, Rosen Penev wrote:
> > > Use a flexible array member to replace kzalloc + kcalloc with a single
> > > kzalloc.
> > >
> > > Shuffled some code around as __counted_by requires the counting variable
> > > to be assigned first.
> > >
> > > Removed NULL check from of_get_match_data as it's never NULL per the
> > > device table.
> > >
> >
> > Please do not combine multiple fixes in a single patch. Also, the NULL check can
> > be kept for the case of sanity as it wouldn't hurt.
> hmm? There are no fixes here. Just a FAM conversion.

Doesn't matter. A patch should do only one thing.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

