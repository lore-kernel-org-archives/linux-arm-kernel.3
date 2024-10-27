Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3672D1356A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKQvE/6pvc5HXfTVYCJj32l9z+pASA7t9U0p47JwbFg=; b=x5LaqY/b2tO/s9fLmVDAa8iDQQ
	CtG7mmtDrlUjtzNddqeQrt2dbIqrfWNzGaCKB6H8nLe/MND24B0YtAuUeLWrDACe522GY9vuOtkKO
	3GPCKmwO3k845KaFMznhGRhkxK2cwrscQVbtP6saelGUBr2AiyjWRiLfQ23k5kAwCzCElVRsA6YjT
	7iUYU9RfUnw4M8LrObv1sRRzVq+TT6HTm7DFcHnNl0n5keZMqPk8Uo0/iTCFA00fU4ICOQcu24UFV
	K5U81fHieXWF6soHJ6YaWIqfr3S0s8FEY5KIdvhYBtkoza/TahHumy6bdxNoQzPm4ZikHP/QNEbmj
	f+S/NfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Aay-00000008v5y-11Dj;
	Sun, 27 Oct 2024 21:14:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5AYp-00000008uoc-2XMG;
	Sun, 27 Oct 2024 21:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D2BB35C58B9;
	Sun, 27 Oct 2024 21:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48295C4CEC3;
	Sun, 27 Oct 2024 21:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730063550;
	bh=uar3ycx7EeVIytO9GydYomj6oWgdHWiXSLPywFoGwjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtTDTfaDp+Zl8zoQbHTadKyITDcn5Ytr2y5R2jG6MBWu02ckpwWMg4YK945vmrjRN
	 Uz4UKcboBHsLUosvB5XIjJrIR2qdYKNCM+WWcaqnW1YNuQvKAY2X/HHserRTaq+PHR
	 QCVXFIPufguNxNR8DLABEfOI4UvrSGBcC/PumrIMlIUfl0DfjlRBReSXoFj69x4m9C
	 EnDmaTxPgJZsw1J7+gt1CR9lCMHzQEKCXorpDLot9VdzY1jf1P8x1R799PXen3+76I
	 SDuMAo6I7+ptd66g8H+AO/vCHqMvuQ/lipqQeNa5NxFeVtDK0SXXwMaM6jBT+ljV9V
	 Ghq1jQGh6Ej9Q==
Date: Sun, 27 Oct 2024 16:12:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sunxi@lists.linux.dev, Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pm@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
	Yangtao Li <frank@allwinnertech.com>, linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Parthiban <parthiban@linumiz.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, linux-usb@vger.kernel.org,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <treding@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 04/13] dt-bindings: usb: Add A100 compatible string
Message-ID: <173006354857.88418.13246529686874362124.robh@kernel.org>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
 <20241024170540.2721307-5-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024170540.2721307-5-masterr3c0rd@epochal.quest>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_141231_711758_285C4BBC 
X-CRM114-Status: UNSURE (   9.14  )
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


On Thu, 24 Oct 2024 14:05:22 -0300, Cody Eksal wrote:
> The Allwinner A100 contains two fully OHCI/EHCI compatible USB host
> controllers. Add their compatible strings to the list of
> generic OHCI/EHCI controllers.
> 
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


