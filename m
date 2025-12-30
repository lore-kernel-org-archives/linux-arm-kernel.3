Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E3FE94108
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 10:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3IpAQX7J1DHwMcxPPuGF+C5l0JpOlYb/Re3XMI3ecO4=; b=LK5BIa2tFzmqhNC2+WbMZsC2Ip
	XtcVQw2UGRB+mCbnpisfSVjYf8GbAjehpCdWS5Ey5G8w7UYTsQAH5UVhQWCYczhDbZ04T9tORteQr
	IpPnvgeLKhPxEd10JFb8WwlYKkyqfrbT7b6PAWlmt4gW0O3RYDSaP5seNL6posVT5DohtKJF2WvTR
	ntJXuaagHfVG7u+KSFVCzJICPcQLELPyDu/vQ/5SI+r0IoRlUOhy45qO3Pbbl4w0B8zj6grKdIo8E
	MmnvBXI3+YTeL2tAgFUbs14pzOiJjWcCGOZVoyrrCsYgom7T8DU7gsLjW6wuuXQrfdYOv5LIe1H7x
	E2dHhI3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWkA-00000004hkx-0RZq;
	Tue, 30 Dec 2025 10:14:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaWk7-00000004hkY-29ma;
	Tue, 30 Dec 2025 10:14:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5846243789;
	Tue, 30 Dec 2025 10:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BC8C4CEFB;
	Tue, 30 Dec 2025 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767089656;
	bh=Caci6saiVAb+HvtzJHAbyeQq5WFsqlhsTwR5cy1cZ88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgqtloqwQpYOstMbM/OQEP/BH6DDA/vpcGRA5le0/zyfMKUxErS2rx1yGo9m/PxRC
	 MUjrSLl5AqGmYMS4FxjzggbrNw7zSxcTDIK4HZvnKErHrIZ1GNaLGt93Z7tzR2V8VD
	 53WLcwF4EFuqTmyUtuUhd3dXAnUzQ2lOfw+eLIdHuXj6UGLc2bMESE6DL0q0Jb5a0c
	 KhCYEz+hiIqpvp+0/hqYH/RaN5cb85sC7LadNBBSyCSh7F+02VtIZGU5umhFb+GrCn
	 TJD7i+76tJxndoz9XY5D1OMc/aLe6EVLqTd9AZsMa2NxXHgoR7rld44AQCvxTRbhWy
	 nDG67YabVwpnw==
Date: Tue, 30 Dec 2025 11:14:10 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Damien Le Moal <dlemoal@kernel.org>, stable@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH v2 1/6] Revert "PCI: dw-rockchip: Don't wait for link
 since we can detect Link Up"
Message-ID: <aVOl8mfKiYX51gRL@ryzen>
References: <20251222064207.3246632-9-cassel@kernel.org>
 <20251226223159.GA4143516@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226223159.GA4143516@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_021419_569124_B7ABB069 
X-CRM114-Status: GOOD (  14.36  )
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

Hello Bjorn,

On Fri, Dec 26, 2025 at 04:31:59PM -0600, Bjorn Helgaas wrote:
> > The long term plan is to migrate this driver to the pwrctrl framework,
> > once it adds proper support for powering up and enumerating PCIe switches.
> 
> "Proper" is hiding some important details here.  pwrctrl already
> supports powering up and enumerating switches.  I think this refers to
> [1], where Mani says the plan is for pwrctrl to power up everything
> before the initial bus scan so we can figure out how many buses are
> needed.
> 
> [1] https://lore.kernel.org/linux-pci/fle74skju2rorxmfdvosmeyrx3g75rysuszov5ofvde2exj4ir@3kfjyfyhczmn/

Correct.

This series has already been merged to the pci/controller/dwc branch
(although for some reason this branch is not merged to pci/next yet),
and I can see that Mani have rephrased the commit messages to be more
specific and to avoid the word proper.

Please tell me if there is some futher action needed from my part.


Kind regards,
Niklas

