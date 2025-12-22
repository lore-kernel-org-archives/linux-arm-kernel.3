Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0799D711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpLJzdSHfbhVJyXyxwWml/Q2dMXJXDsf4LoaUgvXmf0=; b=eqRY7i3WR+kGRVaV67U9EZhyVn
	MuX4KDGHwP6Sb0wOdzyEuwzWvG/Q25X52VSqIDWx5UKhsxw6G1p23mDgIadaYrWvkRGN/Z4A1U0BA
	xag0cAzmq7KpPz/i0wdcqV6yVMIg00gbSRhWZuJGjqTiDK7N+GZzfdH2ki8KwY0OInWzwvbEg2GIM
	AelYJnd0iz++g48Kxcml2fJ1XrCx4BFNpHUtB6BMUwtHNCSdO1vu8FzsktySnwV1+k6xdTPEBkXNr
	dvNoDHKvX9EfltALkkQ6dCZrTYjOlT68YOJ1Kn4du0iLLA4ozWZ7ZG/D2LI/sP+oYta97tPeZ2xMJ
	+a1hzZXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZCa-0000000DGrf-3CHf;
	Mon, 22 Dec 2025 06:15:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZCZ-0000000DGrD-0kWq;
	Mon, 22 Dec 2025 06:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A0436001D;
	Mon, 22 Dec 2025 06:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BAFAC4CEF1;
	Mon, 22 Dec 2025 06:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766384123;
	bh=GXEtZp4QRQx0hcOsDqW5Mo0KVr1eWC8Jjb7PsD5/6AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ua+tOSC3ui9atQi4EUgmggjiDNruCiGJkW5003dHm3u9C6zi/6Roi2qB7xStYF5q8
	 1LL4VQDcurSMdJwPlF9oli/tvKNTbe0bO3KAtNEIDnT5z7eZ2rRB7l4CuHWrUnomLx
	 SIp++9sGYj8AWWYm0Clftu55di+RJ5/SmMAl6/AN68UENro2APxOFaKp42pQjGbeyQ
	 1UUY1LkKCsBoS+zUjh8gZFMHH9BIz+Lxpk3Y4DqZJNa39b9Yw+UGoyuBgaM1g+J6bE
	 SefjlR34LQ/kzlaoqJR6UMJQxa/0XDjQ9a6w7ZzD01OMfvy7KDxMeXx9xvVvjC6dxu
	 W8xHzJyBxOuRA==
Date: Mon, 22 Dec 2025 11:45:09 +0530
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
Message-ID: <fle74skju2rorxmfdvosmeyrx3g75rysuszov5ofvde2exj4ir@3kfjyfyhczmn>
References: <20251201063634.4115762-2-cassel@kernel.org>
 <f1059d5d-3fa5-423a-8093-0e99b65d5f4c@oss.qualcomm.com>
 <aTev28wihes6iJqs@dhcp-10-89-81-223>
 <dad4957c-ca13-4742-b46d-03f0478911d5@oss.qualcomm.com>
 <aTe1bA7lcVzFD5L7@dhcp-10-89-81-223>
 <pjn2gs43rqbe3odh6zvh4qaftxxl6qvdzpm6pgpadxeeid42ko@4a2qradscaqd>
 <aTu4JgDcfb_58qBK@fedora>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTu4JgDcfb_58qBK@fedora>
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

On Fri, Dec 12, 2025 at 03:37:26PM +0900, Niklas Cassel wrote:
> Hello Mani,
> 
> On Fri, Dec 12, 2025 at 12:52:35PM +0900, Manivannan Sadhasivam wrote:
> > > This patch missed the v6.19 merge window (and so did the pwrctrl rework
> > > series), so as long as Mani queues up both for v6.20 (with the pwrctrl
> > > rework series getting applied first), I think we are good.
> > > 
> > 
> > The plan is to merge pwrctrl series to v6.20 (unless we get strong objections),
> > but once that happens, Qcom doesn't need this patch.
> > 
> > So it'd be good if you can just limit this patch to just Rockchip. Then once the
> > Rockchip also moves to pwrctrl, we can revert this patch (also the whole IRQ
> > based link up since the Root Port is not hotplug capable).
> 
> The main reason why I did not like a revert, was because it would remove
> the nice feature where the bus is enumerated automatically on link up.
> 
> I assumed that the plan was to add Link Up IRQ support in pwrctrl in the
> future.
> 

As I dig more and more into pwrctrl, it becomes clear to me that emulating
hotplug on non-hotplug capable hw is a bad idea. Though it gives a nice user
experience in majority of the cases, it also gives issue in some cases like
switch. So pwrctrl will just power on all devices/slots before initial bus scan
and will not do any link up based enumeration later. And neither the controller
driver.

> If that is not the case, and the plan is instead to eventually remove the
> existing Link Up IRQ support, then perhaps you could simply apply patches
> from:
> https://lore.kernel.org/linux-pci/20251111105100.869997-8-cassel@kernel.org/
> 
> Either the whole series or just patch 1 and 2, maintainer's choice :)
> 

I tried applying the whole series, but it fails at patch 2. Could you please
rebase against, pci/controller/dwc and repost?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

