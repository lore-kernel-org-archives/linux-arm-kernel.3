Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7F1C9830C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 02:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74AVlVtuHA5i97H3qZM2mmYtcOm3G5d9tH8VDO5jhzQ=; b=JZIzU+LmSapmpxDqSmlbkUiTzf
	H49pEb5ldi+BNNWw3MuWG/3EtHfUv2a+7aywTAY8l4aU0Vd8IcLEDnqA/iKR9y8HFq3x2VbUbpTTn
	f7sWn9TxaDj+0PUIGHjLv2bN/lXjUZqQmzdvM45frCdVMS5FuEuqK3zRzUfQ/D+EkVrxuKi62W0eX
	l65m/AELBuHxJLo5qZ8WD8N+gfprExAlbuevDclYqN7KQ81Vf4b4BVoBT/47BaP+RX2i8VJuPCRfJ
	dj8FiblWQFBg7PtkkY4jNb80sflm8E+zhkoAdfrqtv3zx9xDzh2xCX6ccUhcUhnLqfX9BnFaMTIqe
	+Gm/9RMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgw8o-0000000F8VJ-0F4N;
	Sat, 17 Jan 2026 02:34:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgw8m-0000000F8VC-1tJw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 02:34:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 922A660127;
	Sat, 17 Jan 2026 02:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E53A8C116C6;
	Sat, 17 Jan 2026 02:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768617253;
	bh=ZHT4FwSvrHdlntgWg5o2UVfQ6X6/Gh/zS5tYKlScw1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tC7y9fZ5aRK2X9vNDw+oI3NCnw4kxydoc5EG2VkM88gAy00E8qAjKNe/zlGryz880
	 syEhxs3UPHJF3n7gN4Bc5KOmzerb4LphNpime1WjRZLl/8nqHFXfkz06nYfVBB6246
	 RI5ZOaWXIDbpXiI4kq8xWJHLVmWSexG5OFDLhV+IFOBe5DGLsP+JzlvSvjlz1XL6ow
	 5jInDfwoi1PNURRVEmqPBpviqK4cIXf9KYytV//DQmk5ljMDYSCBgPjs/LILaKxSQW
	 QwN8jSwb213CQK2z8HeAejcS0u9aDm75JCXuAXvQiM+YpCWzpHMTcM9jBLOXFvrTBD
	 j9HbnE5WNbe7A==
Date: Sat, 17 Jan 2026 10:34:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi/imx: Support dump syslog
Message-ID: <aWr1Hgw26ZKW3k2S@dragon>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <aUCy5+vAPzDGeux3@shlinux89>
 <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>
 <aV0uVXXbxKQ5qzLD@bogus>
 <aV24N72FoGeGwgqm@shlinux89>
 <aWTiC78PXRoadeJy@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWTiC78PXRoadeJy@bogus>
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

On Mon, Jan 12, 2026 at 11:59:07AM +0000, Sudeep Holla wrote:
> On Wed, Jan 07, 2026 at 09:34:47AM +0800, Peng Fan wrote:
> > On Tue, Jan 06, 2026 at 03:46:29PM +0000, Sudeep Holla wrote:
> > >On Mon, Jan 05, 2026 at 08:49:24PM +0800, Peng Fan wrote:
> > >> Hi Sudeep,
> > >> 
> > >> Hope you're doing well. Apologies for following up again, but this v3 patchset
> > >> has been pending for quite some time. I wanted to check if everything looks
> > >> good on your end.
> > >> 
> > >
> > >Yes overall it looks good to me.
> > 
> > Thanks a lot.
> > 
> > >
> > ...
> > >> Alternatively, I can ask Shawn to pick patch 2 if you only intend to take patch 1.
> > >
> > >I think that would break build or need to wait for another cycle.
> > >I can ack if it can be routed via i.MX tree or need ACK to pick it up myself.
> > 
> > Shawn,
> > 
> > Do you plan to pick the two patches with Sudeep's Ack in patch 1? Or
> > you prefer to route the patches via SCMI tree with your Ack?
> 
> I noticed this morning we are already at -rc5, which is later than my usual PR
> timing (I generally aim to send to the SoC team between -rc4 and -rc5). I have
> already sent the SCMI PR.
> 
> For these changes, would it be acceptable to route them via the i.MX tree if
> they are still intended for v7.0/v6.20? If not, I am happy to defer and pick
> them up for the merge window after next.

I picked them up for v7.0/v6.20, thanks!

Shawn

