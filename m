Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7F8FE5215
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rc7qdqKLMXxIfh21Cj8Dl8AVMepmlB0Fv8KgJ5hmvnU=; b=aAn+V6FeZezIpAC2IGbaO5Izhp
	RYO7OlmAuMJhzOkDtg+iu9+1vw19Vty3j3oj2idgJUuQve2m527QsSDiNnB5pE+f00r1MhBH8BrW+
	YZVRE3PEcE/JTP5+Ty2OhAq9amGJoqCNXWWlpv7MibunrcN3qgq4zSNAVO4g3zNCV8t9puGyQajBr
	uKIyKeDwzvprToErru7QfsoAkvlgSX94TijvClIgnu9rGbrRbcGlf/YUju4Nh78jgzpzmlW2Y96Pu
	h+1rkHiYrjGNNKaR5YS2skEZGitXsDTmAVPlnbnsTKH7nLgDYRtqeAqa38LSW/QXRidV4xB7HPeWt
	DYEqxKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFXc-0000000DAoJ-1njZ;
	Fri, 24 Apr 2026 12:21:52 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFXZ-0000000DAnq-2PvZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 12:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Rc7qdqKLMXxIfh21Cj8Dl8AVMepmlB0Fv8KgJ5hmvnU=; b=h1b50Q8PW0ReBCtuZX5A4AsCra
	CM5IRJK+L8oh2qAmLsB8oD3qKc8vo4cAriH8yXOByV9cB1QCVwLsdEjDGeeIbMzdG59PVn1XSkwDM
	XD8GISvSMv/pvxFED9j3dPtxvcfViwc8IqQo+QyCRzheMHSJh9YznE/dMz858x1effMhxOs17EMvb
	GPogOtMCIH+n3mMICIfHC8BHkOODUEJ/pMTTWhDRFicu1w2pfbSERJoyRwDfJOAezncfxN+YksmRT
	81ckclJi8YjUAHVE2Mrj1rAxCSccgtgkJt/FHR6CoCOfNR9xE2SJhCglK6J95TYxfqqFMZaF5LtT7
	BvUEBxDw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48656)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1wGFXR-000000003FY-2I2c;
	Fri, 24 Apr 2026 13:21:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1wGFXO-000000002WO-3Wvf;
	Fri, 24 Apr 2026 13:21:38 +0100
Date: Fri, 24 Apr 2026 13:21:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maninder Singh <maninder1.s@samsung.com>
Cc: linus.walleij@linaro.org, ardb@kernel.org, ndesaulniers@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm: traps: remove fp underflow checking
Message-ID: <aetgUvRidhdUeY2G@shell.armlinux.org.uk>
References: <CGME20260424043122epcas5p17e2f88653e398c5a53c0ffa4c1e01bc1@epcas5p1.samsung.com>
 <20260424043029.4101133-1-maninder1.s@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424043029.4101133-1-maninder1.s@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_052149_896457_08FD3329 
X-CRM114-Status: GOOD (  12.21  )
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

On Fri, Apr 24, 2026 at 10:00:29AM +0530, Maninder Singh wrote:
> with IRQSTACKS fp can point outside of thread's stack.
> And when there is crash reported from IRQ side, it always report
> "frame pointer underflow", which is not real underflow.
> 
> Unhandled fault: page domain fault (0x81b) at 0x00000000
> ..
> PC is at handle_irq_desc+0x68/0xa4
> LR is at generic_handle_domain_irq+0x18/0x1c
> ..
> 
> Call trace: frame pointer underflow
>  handle_irq_desc from generic_handle_domain_irq+0x18/0x1c
>  generic_handle_domain_irq from gic_handle_irq+0x78/0x8c
>  gic_handle_irq from generic_handle_arch_irq+0x3c/0x4c
> ..
> 
> It is just warning print and there is no decision based on this
> to stop backtrack or etc. So it can be removed.

Please find a way to check whether the frame pointer is within the
IRQ stack rather than removing this.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

