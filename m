Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2622BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 00:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=azOTZuSt6WoePHrdQ8r4keF+HbxVxf486hyjpOM5rwI=; b=e7F+2ZjklllEOANMfkiR+emM34
	EXil+BVkzG2kqOXGraHsmqo5IsbfJHvsU30H8G0z0K3HGJn8yaZ7OPh9YjSqxYkee9sOmPoa8n2UG
	pQAiBVgBbl2OZYaV0oTLqdLVyGA8bHcNRItc+v3Gy+zM1y7uh+JW76tyV9IcBMditnFdDgjOJuzaK
	cWtHu2xEvqTn1wMRkhNW4JAp5j0oQmK9TfSbiGBV8gM9d/OwzxYIaTAoorSQRYbFWHZ46zEBSoza/
	vsOCqF6eMisvgKU+yA5C/7mpPHTUdsT1ROqQim7maA3+52o8BAn9v2ap1trQpX9OBATJzvlrq72Oe
	36Q/EOXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ee5-00000003XVO-37IG;
	Sat, 05 Sep 2026 00:52:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ee5-00000003XVG-0fts
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 00:52:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6731443CA3;
	Sat,  5 Sep 2026 00:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF2021F00A3D;
	Sat,  5 Sep 2026 00:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788569556;
	bh=azOTZuSt6WoePHrdQ8r4keF+HbxVxf486hyjpOM5rwI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MlLN7RtYiwyCQOX3kQo70IEjQzY6WC8/pAouGkR/sZbHCbcdvTnRmdc0vnXD6x4sK
	 Qtr6WMmVQMa2X2tN8mANiG+YsQGFoVpIUBHFKTEItZvhofVaCjHiaobtNFB+ymhemE
	 w5g1B+MLVAzLUGrkl5CJ5linMMfz2rqEAmSjo/Uh7L+UYgDzKtuYJuPicIcEWuc4Nd
	 nV7I5KHqDYQzhyjnPkrroquNGMsQ/P5BCXZ8av/2UFJjQdaZzJHEyBxbv8gO+3Ybgr
	 YQeSQWghzAYrQUN2iKxlVWMPWdNQbIUZExeA2qzP6NvqjXHvlIDde5Z322iUWhZexr
	 PPiQ12bap/y2Q==
Date: Fri, 4 Sep 2026 17:52:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, andrew@lunn.ch, olteanv@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, richardcochran@gmail.com,
 wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 net-next 8/8] net: dsa: netc: add PTP one-step
 timestamping support
Message-ID: <20260904175235.66dd766b@kernel.org>
In-Reply-To: <20260831082335.1184605-9-wei.fang@oss.nxp.com>
References: <20260831082335.1184605-1-wei.fang@oss.nxp.com>
	<20260831082335.1184605-9-wei.fang@oss.nxp.com>
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

On Mon, 31 Aug 2026 16:23:35 +0800 wei.fang@oss.nxp.com wrote:
> The NETC switch supports one-step TX timestamping for PTP Sync frames.
> When transmitting a Sync frame, the driver reads the current PTP time
> and writes it into the frame's originTimestamp field, and inserts a
> To_Port subtype 1 tag carrying the low 30 bits of that same PTP time.
> As the frame leaves the wire, the MAC captures the SFD transmit time
> and derives the residence time from the timestamp in the tag. It then
> reads the correction field at the offset given by
> PM_SINGLE_STEP[OFFSET], adds the residence time to it, and writes the
> result back.

Please spend more time on this code, especially this patch.
This really looks like clumsy slop, some DSA expert will
have to review it before it gets merged.

