Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF61C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHgJz38bfp6rGW5Vo/Ip3UFCsgToQN+AI1DehaCYgGw=; b=Cjmz4aoMx8VgFDMk1PqaseMxnc
	H8qswzke90tEHUKThQkWgxDJEUuNjyjc4IYCBuv32V/3KETtIWUQaexT3YNDWvt8OlvECfAOW0kcD
	DNrzs4Th4x2fmOwuQ4m26jmEqhYcucSEw2t6EQGjq+dju9j51gM8ZTGgWa4pwVRxSZOiu2njllLfE
	ptgJtR8lXOyNBWaKKJ3GrOGp0bRzQ2GIhmPlDowj43usg5mD+SLWcfFPn1Bc6fYmXqshRfswGGuM8
	eETVKl/NCnyNfu32MpaqueUjodOo3v9/CsJ4ElDPG/vGEbnxOpZDizqSOm+X7AfGK8mlWME17Us5V
	qBjapOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8QC-00000001YUl-0DMY;
	Thu, 20 Feb 2025 15:25:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8Oh-00000001YDl-2Po7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QHgJz38bfp6rGW5Vo/Ip3UFCsgToQN+AI1DehaCYgGw=; b=C+pbWdUpusHCcABHrf4mEFpvSl
	Ct2Eo2ufrgz7aCjTc6iX/r9B/1CG2nwXezYc66eyQB+GOzsc+b3q6Sz9E6XyKRX/cJ3Rge6kYIpFx
	ORFt+wE+Q6gzwREeHYpuWEY+sT9QexH1wioDE6+SJTuMZCoLlPrgc/xu0X8LpRDcMBUM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tl8OY-00G0Dd-RG; Thu, 20 Feb 2025 16:23:22 +0100
Date: Thu, 20 Feb 2025 16:23:22 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Lukasz Majewski <lukma@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm: clk: Add ETH switch clock description for vf610 SoC
Message-ID: <f68ebe15-69ee-428a-8079-8bb05d7aa21b@lunn.ch>
References: <20250219114936.3546530-1-lukma@denx.de>
 <3cebe152-6326-454c-9da6-5cf5a64f71c9@lunn.ch>
 <20250219233802.20ec53e5@wsk>
 <5a9d9eef-f2ca-4168-aca4-4419dcfcacb6@lunn.ch>
 <20250220154826.3455b15e@wsk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220154826.3455b15e@wsk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_072331_611885_4569EC36 
X-CRM114-Status: GOOD (  14.96  )
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

> > Seems like a reasonable compromise. You would only load this driver if
> > you intend to make use of the switch...
> 
> Yes, the main use case would be the switch (after bridge ... command
> called).
> 
> However, until then we shall? have port separation.

Yes. The model Linux uses is that the ports are individual interfaces
to start with. We should keep to that model.

> > MoreThanIP is now part of Synopsys. I wounder if this IP now exists in
> > other SoCs? The press release however suggests Synopsys was
> > interesting in the high speed interfaces, not a two ports Fast
> > Ethernet switch.
> 
> I would need some detailed documentation....

Which is probably not available. You might be able to get some clues
from the Freescale datasheets, if they have kept the address spaces
separated. I don't see it as a strong requirement, given how old this
IP is, and the limited interest in supporting it over the years, My
guess is, nobody else uses it.

	Andrew

