Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB24C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 12:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GF3I0FN9NaDCRvNKAGKjBQscJbimvB5IvicxLWR9+EA=; b=X0AK1sF0wOhTKN8pRA2j9TTuN2
	SRDpNCECGkNwCNHVtGflCtndGaaSeDZc3xriqb15F9Mpl9Pfz7v5F8kG9q3tP9CqCprRPWHTQi+MZ
	btizp2aJ4u8ELJu2bvXIVbFRRSq8RNeujtpa4n6raNS3MnLY8ajmI1OKHZMhkC6YFO8jn++XpzHYw
	kkgGjle4UL33iiW8NBNOl68FvJ/Txt+eo3qaDpFqmZqRTvbakS0RVH2V1c4FV+PzE5YYWnhCwMSV6
	MCft3Wl7c3oajIBxICdZ+75IGHgRfW2r1yCUOa7Y/yZ0lbI44CNipFTcHdEO0iQJmc8c68ee5HxbV
	/gSu18MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnPY-00000006jKp-2sQc;
	Mon, 20 Jul 2026 12:47:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlnPW-00000006jKd-3cI7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 12:47:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 055F560A7F;
	Mon, 20 Jul 2026 12:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632BB1F000E9;
	Mon, 20 Jul 2026 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784551673;
	bh=GF3I0FN9NaDCRvNKAGKjBQscJbimvB5IvicxLWR9+EA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=T+oYlfKaz12OFo9mI5spxNIhMZ91plK9R8yMAVwFB+AjuVwTVIwcrYA9589+St3XK
	 xyC0Z27KiAI+B/chFeeVDVUkesYMbJesoRaNdjhQNkrT4dSPR9tWv2u9yBb6RlyvB/
	 6kIPGyib3LZDb8xeZwoB07OtAFKOAIQgfBds8vF5NwxBo7Zlo37EaJvoWtBCbX0YCb
	 bSnfxyOZ6KLXSnE403Punoqsfce0dEKZHzSj6+PLEcFCRMZzT19/uPLVkgZc9x4pvW
	 70aqRhvRe0mW+Tyw9Tpif3Vt+Cl/hgyXO+p2yhunOhPD7rcH3dkqgxEEDF2vbjriFX
	 Jev1F7aGLIADg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 hongxing.zhu@oss.nxp.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Richard Zhu <hongxing.zhu@nxp.com>
In-Reply-To: <20260715073024.1377228-1-hongxing.zhu@oss.nxp.com>
References: <20260715073024.1377228-1-hongxing.zhu@oss.nxp.com>
Subject: Re: [RESEND PATCH v2] PCI: imx6: Add runtime PM support for i.MX95
Message-Id: <178455166894.22240.7222803146225421685.b4-ty@b4>
Date: Mon, 20 Jul 2026 14:47:48 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
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


On Wed, 15 Jul 2026 15:30:24 +0800, hongxing.zhu@oss.nxp.com wrote:
> Enable runtime PM support for i.MX95 PCIe Root Complex to allow dynamic
> power management when the PCIe link is idle.
> 
> The i.MX95 PCIe controller supports entering D3hot state when PCIe
> devices are not actively in use. This implementation uses
> pm_runtime_no_callbacks() to leverage the PCI core's generic runtime PM
> handling. The PCI core automatically manages D-state transitions based
> on the runtime PM state of connected endpoint devices.
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Add runtime PM support for i.MX95
      commit: c2b9620359b759d2c73be47689b3a344cb4e091b

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



