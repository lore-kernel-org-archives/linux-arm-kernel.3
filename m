Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB698C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fx76AsyvtvoyRayROVw+SOYuFOjuoLnHKIZ+8qybc/o=; b=XdVKGznFqjCY/Y1/Bsan+Ma6OC
	gim+6/854Fk1EUnqB/zVqYTeOnwx9s9vhb2jiVksQwSXhEcDgteczVkr45POdut+kr80FSpkRvsWL
	V1pM6fC59h32sMfZ/EDangQaaZouMfui5ysYe4hw9u+JivOZyQWCNwXOQSvO+qu+26gJIE8M5j240
	mQrZU1cx5ZrPubKnj1Q/d+rsnerSdKB1wt6V8bhCBGL9cs8p1PSMo7hgAPeP8jxfdXXy0T8+o83TC
	ej2psK9CM0wCuMyD6w/UJL7eNt/xV/uEulb1hhn94bBjgh/H6q9G9Q3EPHwAKEZ7CXC7dxV8HkVT9
	vQ8h55OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBUi-0000000DlZY-30e0;
	Wed, 13 Aug 2025 13:26:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAoH-0000000Df4M-3wtf;
	Wed, 13 Aug 2025 12:42:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50582443D3;
	Wed, 13 Aug 2025 12:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6E1C4CEEB;
	Wed, 13 Aug 2025 12:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755088949;
	bh=xP7ntQZYFxDDcd4ELFoAFkis6twZtrBEioZreOWlOO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=On55YdP8xBGxXiG0h3+ieSi//EnMc12FwKlfKErdvgj0u4/AHCRQRi7Ys5Xm1nFY9
	 WAkeW8AocEWyRHfBfZrT0Ne06SLXog6qKFIRJvnkLVV7texQaiHiCmFpcFKu6rTk33
	 gDRisf6bPZh0doJRF8i5OvGle7wiKH8jI5BuabBHWAG9UoVV2nGSAGdoc82UN3dzhq
	 HuZmQ9mYLuaqb1D76STC3d0cIR/mdnDCBx2BfBw1W9ifpIGOEhRAxYUzogWwSZfPAA
	 8tWrwakkTxIT/vDDmJ2CaDKNkkBXA9SBIWzg5rTWdFtAbwqiRnWzlEZEubCM8guZa3
	 SwuDLF4jRjMpA==
Date: Wed, 13 Aug 2025 14:42:22 +0200
From: Niklas Cassel <cassel@kernel.org>
To: bhelgaas@google.com
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, mani@kernel.org, yue.wang@amlogic.com,
	pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Hans Zhang <18255117159@163.com>
Subject: Re: [PATCH v5 0/2] Configure root port MPS during host probing
Message-ID: <aJyILhOnXDJB4GgD@ryzen>
References: <20250620155507.1022099-1-18255117159@163.com>
 <aHdXwr-UZz6jZX3f@ryzen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aHdXwr-UZz6jZX3f@ryzen>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_054229_998111_C1F821F9 
X-CRM114-Status: GOOD (  10.26  )
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

On Wed, Jul 16, 2025 at 09:41:54AM +0200, Niklas Cassel wrote:
> On Fri, Jun 20, 2025 at 11:55:05PM +0800, Hans Zhang wrote:
> (snip)
> > ---
> > 
> > Hans Zhang (2):
> >   PCI: Configure root port MPS during host probing
> >   PCI: dwc: Remove redundant MPS configuration
> > 
> >  drivers/pci/controller/dwc/pci-meson.c | 17 -----------------
> >  drivers/pci/probe.c                    | 10 ++++++++++
> >  2 files changed, 10 insertions(+), 17 deletions(-)
> > 
> > 
> > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > -- 
> > 2.25.1
> > 
> 
> Any chance of this series getting picked up?

Gentle ping.


Kind regards,
Niklas

