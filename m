Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0C2D19510
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 19:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wt4OrgVEIcV51CcZvKwLJ3NpZgfF1uIkSphQcpsf+Cg=; b=QDKtb2kQ6HVvj97haGuUr3oJos
	pmzIVd/rdAcQRKoKbe3wBMsUh6jz8VBakXxzp9ypeIkWpnOq3UM3FV8P9cEJb+F0fUXyk6AhJn0vy
	0hSF1htmYuQyzr1D0gnO9S1i9H4bD4/5IxxyshK8ZiYwcyHqzkcK6lcjYnPnhrpE2zzu4PEOZZH68
	6JNn8hHcQ8zuuTNS/IBUIF5hjAOv1SvQBLkS7YITPVAgxionOLxXF2UTxb1aQffiYo8sbVhNN4oE2
	EnxS0c4V46a3FEyVPyr9Kj3lWKgjHRM8kkV0vO+HFF/vol4UQEA5vN0zvM0VOq4biP1oUbFXqVlIV
	yAZRKYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSKu-0000000D9HW-1to1;
	Mon, 26 Jan 2026 19:33:20 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkSKs-0000000D9H6-1eVH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 19:33:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8C7A310CB40;
	Mon, 26 Jan 2026 20:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1769455995;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wt4OrgVEIcV51CcZvKwLJ3NpZgfF1uIkSphQcpsf+Cg=;
	b=Y3KtdntCmeXAWNwkilx8KtuOSSR6ibCodG6TqhiDsMDNqKcTcgeKkaMlcQoZxFAgx9NLsk
	dFYIcxCns5jSTjaaFYtky8wd46Hy1TKGicr0PD5peIHmjVI8JOayhJ37s5x0t6vTcnCLVy
	tJAHnv0a8xyJKPCiAlRxcjCv4H8I/ZoSFMbbDcD8OvlLlwn2Sk6kGyXJbU1F8VVeY5qvif
	tcjnkppQEGgHmZWXaEnVsfSq/CorQPwKsz7ryjnX2MS+sBNvplNgtpl/k9c+0JU0IneCdo
	QHG59G0vIoslHAtYiq2gtBpJMH/qUmiAQImbXkOslbhToepYAy0tSOn/WVr/YQ==
Date: Mon, 26 Jan 2026 20:33:07 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] clk: vf610: Add support for the Ethernet switch
 clocks
Message-ID: <20260126203307.6076ba9c@wsk>
In-Reply-To: <7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
References: <20260126115349.1750578-1-lukma@nabladev.com>
	<7671b833-f823-44cd-b5af-0b473a8ae23e@lunn.ch>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_113318_664501_2F50762B 
X-CRM114-Status: GOOD (  23.74  )
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

Hi Andrew,

> On Mon, Jan 26, 2026 at 12:53:49PM +0100, Lukasz Majewski wrote:
> > From: Lukasz Majewski <lukma@denx.de>
> > 
> > The vf610 device has built in the MoreThanIP L2 switch. For proper
> > operation it is required to enable ESW and MAC table lookup clocks.
> > 
> > The MAC table spans from 0x400E_C000 for 0x4000 and it is necessary
> > to provide clocks for each AIPS1-"slot", which size is 0x1000
> > (hence four separate entries).
> > 
> > Those can be enabled via clock gating CCM_CCGR10 register
> > (0x4006_B068).
> > 
> > This patch also adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
> > macros definitions for L2 switch.
> > 
> > The VF610_CLK_END has been removed as its number had to be increased
> > when MTIP L2 switch clocks were added.
> > 
> > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > ---
> > Changes for v2:
> > - Squash clock DT bindings to this single patch
> > - Replace VF610_CLK_END with VF610_CLK_ESW_MAC_TAB3 + 1  
> 
> I'm not sure this is the correct thing to do. Normally these _END
> values are there so you don't need to change any code when new things
> are added to the list. 
> 
> Why not just keep VF610_CLK_END at the end, with the value of 196?
> 
>     Andrew

Conor (on CC) explicitly asked to remove VF610_CLK_END:
"[PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2 switch"

------>8------------
> -#define VF610_CLK_END			191  

If end is modifiable, it is removable. If you need the define for the
driver, please move it there.
------8<------------

I just follow what he asked.

-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

