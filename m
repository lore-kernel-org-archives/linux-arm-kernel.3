Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26456CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DQbNJy77aiHlOEUx0BhEwnElSK5v5gnbGHzxyE7TxfI=; b=YDcD/kh2CFExng
	J9H87/rC8XzimNIs/lfeFGf4907hcP51uUPNtJQRr1POCAUY0NwfuwKjZEybDyyaKYioQN+0lIpFD
	GHmI34a3rG3VuiHURyl2d2c98pP7ETetAnL7e/L+zuyyPxYM6D3BsEh0XBwenr5iwQfbAhghYpORH
	nmSxHBSyOo/br4zkCZTsj+c+7mGn8LwVe2sWJKp5FCcPqnUqoKNZhg2Tq72u3sycjmBta+7P/NB54
	rxVaPMk4qrXJVLK/sD5b71Jde6oTgh000/3OE2zr9ZZWhCmHmgjSV20jMVym7M7e9KyTJQhsiivGb
	c4R/o+e9+WHac2NgWJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhwl-00000005DtA-2oNX;
	Mon, 22 Jun 2026 16:56:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbhwj-00000005Dsx-3m1o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 16:56:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FF45601F3;
	Mon, 22 Jun 2026 16:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30DE1F000E9;
	Mon, 22 Jun 2026 16:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782147388;
	bh=DQbNJy77aiHlOEUx0BhEwnElSK5v5gnbGHzxyE7TxfI=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=caqU7l76HM7PHpCBqNI3xy0/3Hc1WnA1uqCGPHuPfx3oZp1u45KA48y2kOVfhoY0L
	 Ql/HFEHbJZpSbspcCyvjcwFPacHNDpK4IbG+3kyCLxs2XExlt6Xj550GAiz+Zc+U8l
	 9FUxzMzAqBk2yWkI/jScrNBar11vrAW1cdXiwm48ZDNcRSsiUmoXwguDW42I9Ifpjr
	 alzYIEa0TB7s2V8/2VnWfkxUgIfscYLR0q3BS+Ro88Viw70omC/KIUSprLIiOppBxU
	 bTeDIIGi1mOH22lPSAjOKno59iPEFiCvNvo3vu7Tn9ELbvejZtrz74apeXqjgeUIV/
	 MHA4K6+OhnBmA==
Date: Mon, 22 Jun 2026 11:56:27 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ratheesh Kannoth <rkannoth@marvell.com>
Cc: "bjorn@helgaas.com" <bjorn@helgaas.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>,
	"will@kernel.org" <will@kernel.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"vidyas@nvidia.com" <vidyas@nvidia.com>
Subject: Re: Re: Re: [PATCH v2] PCI: host-common: Request bus reassignment
 when not probe-only
Message-ID: <20260622165627.GA668215@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR18MB584758C9286C78B6EE947FE7D3182@MN0PR18MB5847.namprd18.prod.outlook.com>
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

On Fri, Jun 12, 2026 at 04:03:25AM +0000, Ratheesh Kannoth wrote:
> ...

> Kindly advise if there are any outstanding action items required
> from my side. I see that the patch is not available in net-next yet
> or backported to stable versions. I want to ensure I haven't missed
> a step, so please excuse my impatience if it is simply a matter of
> the usual release cycle.

This is queued on pci/controller/host-common and is in pci/next for
v7.2.  I will ask Linus to pull that branch sometime this week.  This
is separate from net-next, so it won't appear there.  Backports to
stable will happen after Linus pulls the branch.

Bjorn

