Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D82C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YN13y89SvZDYx+lfk8YonQNzJNh6c2QayZFX78Tz/gg=; b=KE+Fh28hRJEQkHKQJetKf7MMse
	jk6Pm6RBRnsq6+gWDKa8bOnQX7eQMR+BYlDVSC5tQrlbAPXEM5oWseXwK/jQNEqF3DMxypsMDCyoG
	xL9OW+wX+ssGxKvNhBqK5nlDxcuNIKQ5af7MEHF6N5NhRjYHP/VjB8nnXRY3tJ5fNN4V/y9bJvrL4
	HAL6cRlQEqj76PpNRs0vkyvmx+erEKvPwTZwf4owjnx4jkMDApmWIBk6k1VcCDTYOIlC+ixk5YMw/
	hBD8SKV+4ZGOPTW1SJm9GqVrr9TS3TbgoZqyq+zfbwgYNGL17C+y3i1ixjIv1pEr6vF5d7Sj8Vxuy
	LQ1Q/G5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCyyQ-00000000Ri1-12dZ;
	Thu, 08 May 2025 10:59:30 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCywT-00000000Ran-0gLe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 10:57:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1uCywP-0008Ie-Qj; Thu, 08 May 2025 12:57:25 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1uCywP-001i8U-1h;
	Thu, 08 May 2025 12:57:25 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1uCywP-00AP7Q-1M;
	Thu, 08 May 2025 12:57:25 +0200
Date: Thu, 8 May 2025 12:57:25 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: "Colin King (gmail)" <colin.i.king@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	kernel@pengutronix.de
Subject: Re: soc: xilinx: vcu: issue with 2nd null check on pointer divider
Message-ID: <aByOFaMmNqWLNbYM@pengutronix.de>
References: <60721f5a-15d2-46a1-aa0c-d6d599244cb2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <60721f5a-15d2-46a1-aa0c-d6d599244cb2@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_035729_196461_091C00E6 
X-CRM114-Status: GOOD (  17.07  )
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

Hi Colin,

On Thu, 08 May 2025 11:21:05 +0100, Colin King (gmail) wrote:
> There seems to be an issue with the following function with the second check
> on if (!divider). Firstly this is redundant code since divider has
> already been null checked, so I suspect it should be instead if (!mux) but
> I'm unsure if this is correct since the call to clk_hw_unregister_divider is
> not made.  Also if mux is null, isn't the call to clk_hw_unregister_mux()
> problematic as a null pointer is being passed to it.
> 
> static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
> {
>         struct clk_hw *gate = hw;
>         struct clk_hw *divider;
>         struct clk_hw *mux;
> 
>         if (!gate)
>                 return;
> 
>         divider = clk_hw_get_parent(gate);
>         clk_hw_unregister_gate(gate);
>         if (!divider)
>                 return;
> 
>         mux = clk_hw_get_parent(divider);
>         clk_hw_unregister_mux(mux);
>         if (!divider)
>                 return;
> 
>         clk_hw_unregister_divider(divider);
> }

I sent a patch [0] to rewrite the function and make it more readable a
while ago. Unfortunately, there wasn't any reaction to the patch, and
then I forgot about it.

Michael

[0] https://lore.kernel.org/linux-arm-kernel/20210318144230.3438009-1-m.tretter@pengutronix.de/

