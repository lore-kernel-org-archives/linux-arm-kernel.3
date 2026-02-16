Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29ABE63F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 09:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4AIIiBe36X2z3LOIRK+Vwb+RbLMX+Bv8FiLhmH2gBE=; b=CPiG4opd+Ee5YcYA1pPETq4sij
	txoTXzaRM8vVox/0udv/7f3zEcKP/jju1X9ajtTbJHIp1V8czHuEFiiam9XFaVz2PqItEB4tzEsy5
	gZqEVumBuErEIWHdGk8G1BJ+iYQOI6FdLC5wEkb65tTJaTegAj6ZzqIlwXGNrqISSEdb8AKNj84Um
	oQbN0yxizzXIKvBDziFwE/pTbsiAsNFewG2dNsS6ddQpMbThDrUCl4JxxIIzIczy/XCt6ZbwTm4qx
	u6DIpLeYZAZZ956OLb4+MzZ9qVE860kjx9xxgFROtiLZLO3Tn9m4ZSul9UhDKsJTauNwuBtvX9D5c
	j/+LS6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruhy-00000006EIR-0mzf;
	Mon, 16 Feb 2026 09:15:58 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruhu-00000006EHq-3sAI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 09:15:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A803710F92A;
	Mon, 16 Feb 2026 10:15:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1771233345;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g4AIIiBe36X2z3LOIRK+Vwb+RbLMX+Bv8FiLhmH2gBE=;
	b=RtTkEGuj30T2QAkNRjGj9G7748vaxxo69xLc4S1ERGfxnReWhdk3K/DBX0dgR/+5IFfD3a
	iqW5q4osY0GiMk4/4oEtRxqZxRiBz2E1Ew0BhD1DOl8rACqCPwFuX/IGWlX1Cz2/7eVZ0K
	psliEc0uS3aS5ROgcy6F/3IFUKutW+2aZKhBLVPKKavsrPApDIg3XHVQIoSAfGOHBCOgGR
	hTeSM1qT5AaaH+fYQJMKuLWNplROtfFtNa1vBTPrTpZeWUpM3HHB65xwYtk49KS3pcKlZ7
	QmVrGy954drflHE+A3j5cNlZy5phFEJPlKgdGZEMaMMgQLKFuo00keSYRa3Yuw==
Date: Mon, 16 Feb 2026 10:15:38 +0100
From: =?UTF-8?B?xYF1a2Fzeg==?= Majewski <lukma@nabladev.com>
To: Peng Fan <peng.fan@oss.nxp.com>, Abel Vesa <abelvesa@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/4] clk: vf610: Add clocks to support MTIP L2 switch
Message-ID: <20260216101538.0aeae484@wsk>
In-Reply-To: <aYAEM8pcuumly+hc@shlinux89>
References: <20260129095442.1646748-1-lukma@nabladev.com>
	<aYAEM8pcuumly+hc@shlinux89>
Organization: Nabla
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_011555_182637_4612DAD3 
X-CRM114-Status: GOOD (  11.38  )
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

Dear all,

> On Thu, Jan 29, 2026 at 10:54:38AM +0100, Lukasz Majewski wrote:
> >This patch series:
> >- cleans up clocks' setup on vf610 by moving VF610_CLK_END define
> >  to driver code
> >- introduces support for several clocks required by MTIP switch IP
> >block
> >
> >Lukasz Majewski (4):
> >  clk: vf610: Move VF610_CLK_END define to clk-vf610 driver
> >  dt-bindings: clock: vf610: Drop VF610_CLK_END define
> >  dt-bindings: clock: vf610: Add definitions for MTIP L2 switch
> >  clk: vf610: Add support for the Ethernet switch clocks  
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Gentle ping regarding this patch set...

-- 
Best regards,

Lukasz Majewski

--
Nabla Software Engineering GmbH
HRB 40522 Augsburg
Phone: +49 821 45592596
E-Mail: office@nabladev.com
Managing Director : Stefano Babic

