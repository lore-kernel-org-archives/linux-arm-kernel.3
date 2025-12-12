Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE720D43369
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfzGhDiEnGOenmPU7WG7Pv+/Km9fbH7uerfFVXw5j2g=; b=tgXttWsOyP8d5AXRJRNIRM//Pd
	IzHsdsHEB6kKPZNWe+33LloR3LYmdBY78UZO2PTnaW6k9EMXJLEHotwtIW07I/q/YkQFb3wsOZ2e5
	FHLofxbrslLlrdsakqhj97f65mMXDZBxHJFJTwXGF16N0283libYcuMrVRs0dPBU1Fw4zYXzv5DQP
	tGJt+RMH4v3UnM99GwydhQodOU2WiOCotQJKd9IhTU7QkDfZjulPABKueor3XsHKPUkhfdHl/cRKA
	sH23HSVliYIjyzaE7Orn2CQwgBf4kM5OWIA/OGZr6lShHNeHhYcEDdLI1hp33jDfpbjYjPkdVBbtL
	uPITkhEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTuD4-000000002b6-0wjf;
	Fri, 12 Dec 2025 03:52:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTuD2-000000002aq-1rP4;
	Fri, 12 Dec 2025 03:52:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B8D260121;
	Fri, 12 Dec 2025 03:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E70FC4CEF1;
	Fri, 12 Dec 2025 03:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765511567;
	bh=4aNjpdLHQX5WPy6vwTgIkcZd5b8rix/rORP2xiTO8Ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sB+P7XpkJ1Dp/PpeK2FJ2O+T82CuOhDGaBXmo7cR0B8RkuP36VrBm4Uyip/QaW3nl
	 Nz8BbXrZzSOv2bJ2nZF/plsvKTfrPge0t49z0FlNLioys59JM9vRci5O3RXq9zE+O8
	 yz9siG0TBbYh3amgXggAN5QqXyxwe24HBeYCJxy1iALO2RgC8itcWQy7GWzVs/e+AV
	 sbCDJv4CSM8AGQB40OnlutDHJYA5NzA0yjQ6xPL96KNZUE8JHnLHTfIoELzgDlHAkK
	 dmaOwrweQcn2rTWhQQGpb2a8HbGD7iyovS39KVSX3NimvFxoWz4RtGBk4N9JdDEeuK
	 Ssab2LJW4WeFw==
Date: Fri, 12 Dec 2025 12:52:35 +0900
From: Manivannan Sadhasivam <mani@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
	FUKAUMI Naoki <naoki@radxa.com>, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] PCI: dwc: Make Link Up IRQ logic handle already
 powered on PCIe switches
Message-ID: <pjn2gs43rqbe3odh6zvh4qaftxxl6qvdzpm6pgpadxeeid42ko@4a2qradscaqd>
References: <20251201063634.4115762-2-cassel@kernel.org>
 <f1059d5d-3fa5-423a-8093-0e99b65d5f4c@oss.qualcomm.com>
 <aTev28wihes6iJqs@dhcp-10-89-81-223>
 <dad4957c-ca13-4742-b46d-03f0478911d5@oss.qualcomm.com>
 <aTe1bA7lcVzFD5L7@dhcp-10-89-81-223>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTe1bA7lcVzFD5L7@dhcp-10-89-81-223>
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

On Tue, Dec 09, 2025 at 02:36:44PM +0900, Niklas Cassel wrote:
> On Tue, Dec 09, 2025 at 10:57:18AM +0530, Krishna Chaitanya Chundru wrote:
> > On 12/9/2025 10:42 AM, Niklas Cassel wrote:
> > > 
> > > So I don't really understand your concern with this series, at least not if
> > > it goes on top of your series:
> > > https://lore.kernel.org/linux-pci/20251124-pci-pwrctrl-rework-v1-0-78a72627683d@oss.qualcomm.com/
> > Hi Niklas,
> > 
> > If this series goes on top of the our series i.e pwrctrl rework series, I
> > don't have any concerns.
> > My only concern is link up IRQ never fires if this patch goes before series.
> > 
> > - Krishna Chaitanya.
> 
> This patch missed the v6.19 merge window (and so did the pwrctrl rework
> series), so as long as Mani queues up both for v6.20 (with the pwrctrl
> rework series getting applied first), I think we are good.
> 

The plan is to merge pwrctrl series to v6.20 (unless we get strong objections),
but once that happens, Qcom doesn't need this patch.

So it'd be good if you can just limit this patch to just Rockchip. Then once the
Rockchip also moves to pwrctrl, we can revert this patch (also the whole IRQ
based link up since the Root Port is not hotplug capable).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

