Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887A8C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4xnz2KBAZ1cRnmXtpCfuHKm+HxPnyYY9r57217yglo=; b=guD2NjSKwmhBl9wgk6TVD/KDLS
	QxzW3965JXGtwEsYN97D7R2dJZu68U+nYm3Kj4dX+1oQ/EUxSreunvqQQpVUNFffbtmqLfDWBpuWc
	jZnu0sxzuGDu5ga456TFL4wbkGrash9+5e4D+k7n85AkfUQLoaOAsGUohzLpllbPr1/QWcAf+vUht
	OzPGqgsG/WlMvH2+aw3QPBdivlAFbkV131afFjjl+VFtj3kgnDhUb54HJbxAfY2T3g1O9mUygTxeL
	CMFCX5rXp5EsaixuVhdVlwQf78O51HkR1b63qfKWU+qGQe3hrSbPbK9iYTCcLp24Ql52eS5KwNndM
	P6d3x9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEopC-0000000CMjR-2V8H;
	Tue, 13 May 2025 12:33:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEon7-0000000CMXY-01EZ;
	Tue, 13 May 2025 12:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 197DCA4D477;
	Tue, 13 May 2025 12:31:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 320A0C4CEE4;
	Tue, 13 May 2025 12:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747139483;
	bh=DeY+hySG4/vlZF1lPxJl4qMkf2CDQ8EAbK3bVeOGHAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVlriGcxrn6kEgjdgOKyrKHwccz1+cZOFXkU2nKKKywUk1pIXfEI+8YAh7XYN8+6n
	 cHFlQ84+FvT8uZ9L/b5bMWKYaGszXZOqB06nHo6I3iOmjTHEq0KK1ZN5IIxNjMQaJK
	 P13Zgszs/BO2TBJoaEI6mgL9rhVSSWD6uIybhNty0g4OrSlUxHULUuF+zUPI5bKLUK
	 AYQzG1ojTNtKzWNEj2p//dlGBQZ6C/q1aPJNmu15pE2mCVKfV9XWctceIymB5nqkZE
	 xHLRjDxxlym0TadfaNEQgQRSMz5Ev3ipIT1huPuK/MQfaRHpQIzOLX4u6GnPzdXE61
	 MorJGUO+o8mkA==
Date: Tue, 13 May 2025 14:31:17 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alan Douglas <adouglas@cadence.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/6] PCI: endpoint: IRQ callback fixes and cleanups
Message-ID: <aCM7lWQiwJBwamEp@ryzen>
References: <20250513073055.169486-8-cassel@kernel.org>
 <20250513102522.GB2003346@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513102522.GB2003346@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_053125_113451_EA76F4B7 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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

On Tue, May 13, 2025 at 07:25:22PM +0900, Krzysztof Wilczyński wrote:
> Hello,

Hello

> 
> >   PCI: dwc: ep: Fix broken set_msix() callback
> >   PCI: cadence-ep: Fix broken set_msix() callback
> >   PCI: endpoint: cleanup get_msi() callback
> >   PCI: endpoint: cleanup set_msi() callback
> >   PCI: endpoint: cleanup get_msix() callback
> >   PCI: endpoint: cleanup set_msix() callback
> 
> Note that PCI prefers to capitalise first letter of the subject.

Do I need to resend or can some of the maintainers fix this up while applying?

