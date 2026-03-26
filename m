Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D3710A88D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmvK6l6GR25t9qXtIc4Zl0uKnAxLfL7ooqqIuDZI0MQ=; b=EiPXNRC1NRCwifXBnb0bRq4HsD
	hydrnLj3p5H319lFNyQ8pzKGkE4BF0lPXF2gqeZPXbW9+xSkAM8qJHM+SkQ3wGSjkHd2qOSXaG8ES
	7lrT8NSFv0rJqzsM+ypaDghQY42Hw5mJo7DE2ZqwAZ8M/3PseLYAmsTFHIAxHXp2Eppf9WZ/4bKLz
	jr57mEKxdxvhFnXZzuQpy9rWYmFkQVN7PbOf8sJ1sW1oAQCtHJPu+Zq4pxaygCoHCrUw25TMZffbv
	+r1o4S8pDooFZVEOhYrJjDwyBZOpA9gYebQldaFKkblfF/8h9rwesEfgSpuZfbhorbFxxJ//3hlAE
	biy627vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o1h-00000005u6I-3pce;
	Thu, 26 Mar 2026 16:57:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5o1f-00000005u5L-3JIv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 16:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KmvK6l6GR25t9qXtIc4Zl0uKnAxLfL7ooqqIuDZI0MQ=; b=G2WMZZx/afVPnbXfQ2N8lyZ9YF
	BhZthNAwe9edPi2vZsUdwTXOZ1kFiGN58RPZ1wnKq3n2+5MrmN4hP/Qm9XaVn8vUa8MraTzIqyq4y
	13f2TuJcCa3lN66QPs2lcFh5NOXFEQXkUn7RyCUAlTfaYHptxA2xDaJTMKf+yD0o7L7n8QrHM5qlv
	Bl67OWxt/qV9NAYAhlMXIabkxsH7bI+W55o8fX1u5p8I27zIOTvJ+PVlHMvfWlWMtwjrSmOccUmmn
	jBUFawXjTRFMR7ilCW4Xuq6I6fXLtc/qFI8qwJswWXbrh/bTByqCv65lp8PGbpwY5D7ty86bPS+7E
	bYoA+TUg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55976)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5o1T-0000000053X-25Pg;
	Thu, 26 Mar 2026 16:57:31 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5o1Q-000000007CI-1WTp;
	Thu, 26 Mar 2026 16:57:28 +0000
Date: Thu, 26 Mar 2026 16:57:28 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	andrew+netdev@lunn.ch, horms@kernel.org, sdf@fomichev.me,
	me@ziyao.cc, siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com, wens@kernel.org,
	vladimir.oltean@nxp.com, lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com, maxime.chevallier@bootlin.com,
	chenchuangyu@xiaomi.com, yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com, chenhuacai@kernel.org,
	florian.fainelli@broadcom.com, quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v8 5/6] Fix error handling in probe function.
Message-ID: <acVleH7_kh7kAAZR@shell.armlinux.org.uk>
References: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
 <20260320211921.1202058-6-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320211921.1202058-6-jitendra.vegiraju@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_095743_825840_782E2460 
X-CRM114-Status: GOOD (  10.29  )
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

On Fri, Mar 20, 2026 at 02:19:20PM -0700, Jitendra Vegiraju wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> Software node created in probe function is not being cleaned up if
> the probe function returns an error.
> The stmmac core provides mechanism to handle this error condition
> with plat->init, plat->exit helper functions.
> Move glue driver's initialization code to plat->init function.
> If the probe function returns an error, plat->exit function is
> called. Handle any glue driver level cleanup in the plat->exit
> handler.
> Use devm_add_action_or_reset() to register a callback to free
> irq vectors automatically, simplifying error handling in probe().
> 
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>

Oh, you did fix it. Please merge this into patch 4, there is no need
to have this fix seperate.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

