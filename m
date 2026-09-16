Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0464FC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SjWIP8bNgzdC4buQnhVS9zvJ7ieVsM0oE8uqr/MRoYM=; b=o/aTO4vskR3cJapZ0rsLUyGGpP
	jf03ibojGl/637zZpZz+bBf5mkmrnKjCiSclWHhZ1H9d4FNVkmDtdJvUrlR9bGMOrimX7bF/UU/Eb
	rA6/EdgqcyAECGD1owZjdaDJqX/bBQz1LW0yAquDZz24xFFoZWzNsBVKabJWIA729woOFxc5hbXoX
	RzkRHUliIIKtV6fXcFgiRHPQQneRXm+Q1/hz/KdI4sUFK1dPhYHw5HFkzuS730uxSrwHJHdbk/e62
	u/xzBy4vqAVmtGmxXG+oWMwoCscdsveeQlSKyTiwXjIATWeEFVl5bPPHwgaS7k1bouFmeH4Vrp3gK
	m7eruO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6koX-00000008hK2-2jrr;
	Wed, 16 Sep 2026 08:16:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6koW-00000008hJU-23AV;
	Wed, 16 Sep 2026 08:16:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 918586053A;
	Wed, 16 Sep 2026 08:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8951F00893;
	Wed, 16 Sep 2026 08:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789546579;
	bh=SjWIP8bNgzdC4buQnhVS9zvJ7ieVsM0oE8uqr/MRoYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JXwBUxpp6BrunGC9Exr6GM/vSGpDSwW0e19VQG/HebrdWDreqD+TRflwbah2sHQOp
	 FpxMLshY1UEor/GvOfupqRFWD/7O/D2IT53Ts1TI0qFtHguYs/mwcF9Zi3Q3eq5daW
	 zDrOlbTsyURpbnesjY/9q7QnelxvpU617ZiErDVoEip8cXsy+kXVqb4NL0quiCe+fz
	 VUWYamsRGz77Z/6BQ1e99VwL01uV5WAnNUvkI2cMNjx/mSZFEeZRdfrPgO6QyFkNxL
	 4wb3ea39LRymM0UgOJlA2TIVhPRqcPmZq2u67H7j2RDNLc9dbn0+llVJHeqS7b4Itb
	 l8KwbL9+yj3oA==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1x6koS-00000005wGU-1cEn;
	Wed, 16 Sep 2026 10:16:16 +0200
Date: Wed, 16 Sep 2026 10:16:16 +0200
From: Johan Hovold <johan@kernel.org>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/6] usb: xhci-mtk: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <aqpQULC3P0wspKwL@hovoldconsulting.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
 <20260915090223.1346-3-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915090223.1346-3-joshua.crofts1@gmail.com>
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

On Tue, Sep 15, 2026 at 09:02:19AM +0000, Joshua Crofts wrote:
> The disable_pm label in xhci_mtk_probe() and xhci_mtk_remove() both call
> pm_runtime_disable() on error or device teardown, but don't call
> pm_runtime_dont_use_autosuspend(), causing resource leaks.

No, there is no resource leak here either and this does not need to be
backported.

The autosuspend setting is not restored, but that would only possibly
have an impact in the theoretical corner case that someone forcibly
rebinds a different driver that does not enable it.
 
> Add the missing pm_runtime_dont_use_autosuspend().
> 
> Found using Coccinelle.
> 
> Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
> Fixes: 04284eb74e0c ("usb: xhci-mtk: add support runtime PM")
> Cc: <stable@vger.kernel.org>

So, without having looked at the rest: none of these should be
backported.

Johan

