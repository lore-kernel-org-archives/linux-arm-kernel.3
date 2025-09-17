Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E4EBCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 22:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=3Oy+tmQ4yRxvWrPaS60lkLVNG+mJ8pW0sRMc+mIO5dU=; b=VPr5QiR3JbRlDP
	Qoobyyx+jMDVDjTjR33tx7tjOHqLJibnHEEvfk0lA0b1XvVBU+cnDn2n0C3kAWc54Z0GVT03gfper
	6W6aaR4pnP0Xd3eJ5yHYFXFverRNnOrzKhE44lvBjorw3CDd8xBZKX19XCQgt8m/L8zLrHeCq/Z4Y
	nW40odNaw2sCGPHJeZB1GgKPTYFfkx9oRqP41jmSG5YB9Xo+bJLc/2B7f8+es4FSG3vysawtxfOfb
	31z9TQ8fitMa4kSV/LQjLe32aXVdLrOy8gXrbQs8xSmQoMEp0reYP3XnXgrqUIzYvDbC9G8tD5YQe
	LtwEyZtewLXg1Jn5jtGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0ZG-0000000FEmt-0GW6;
	Wed, 17 Sep 2025 22:24:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0ZD-0000000FEmT-1lCZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 22:24:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B53A405CD;
	Wed, 17 Sep 2025 22:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD618C4CEE7;
	Wed, 17 Sep 2025 22:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758147838;
	bh=UnGcqVgS4GD/7L0fDg931OMlNpuv6k722YO8GEx8cqA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FscnWqJ9AamopYzEys8/f8cfqCwSnkZMxdUlYjDRJrUENMYwk9TZD/ySS+hqZK6qb
	 zXtzx0R0Vbs176BSgMdIm3es4SHf8lKbT9d95iBS23JJFixlpAM9nYTx0DNrS+vNla
	 rpraXAObjE0eOTtLZmTfa24eaOqBaSgU3rBTCY3ogNWpoDEOO3XTqs0LtQRZALXwcE
	 bG7v0Wfz/2XkFbuKVqtuO2sWW6rJjGVTdO/wrwOumeDzouAjjEkddtQaAwZ4GWG/qQ
	 XyHMEjTT13N7fXH3xfeLMoGWxDo7cKsR+VEjeNa+hOePBnXg/+3kf/PoReZD3LCB0u
	 5DXf6T+YnmBnw==
Date: Wed, 17 Sep 2025 17:23:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, jingoohan1@gmail.com, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] PCI: imx6: Add a method to handle CLKREQ#
 override active low
Message-ID: <20250917222356.GA1879221@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917093751.1520050-3-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_152359_483030_03495C2A 
X-CRM114-Status: GOOD (  13.46  )
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

On Wed, Sep 17, 2025 at 05:37:51PM +0800, Richard Zhu wrote:
> The CLKREQ# is an open drain, active low signal that is driven low by
> the card to request reference clock.
> 
> But the CLKREQ# maybe reserved on some old device, compliant with CEM
> r3.0 or before. Thus, this signal wouldn't be driven low by these old
> devices.

Can you include a citation to a relevant section in the CEM spec?
Maybe the point is that CLKREQ# is an optional signal added in PCIe
CEM r4.0, sec 2?

If that's accurate, we can add it when applying, no need to repost for
that.

> Since the reference clock controlled by CLKREQ# may be required by i.MX
> PCIe host too. To make sure this clock is ready even when the CLKREQ#
> isn't driven low by the card(e.x old cards described above), force
> CLKREQ# override active low for i.MX PCIe host during initialization.
> 
> The CLKREQ# override can be cleared safely when supports-clkreq is
> present and PCIe link is up later. Because the CLKREQ# would be driven
> low by the card in this case.

