Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3F2C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Q+OzXMtuEhFbEdc+1OXTF//NaxnNPeK8xHT7i3hwmk=; b=usPhHMA1LraQt8NdAcZl3LHHZJ
	WgRpcmK+Dt7yc7omEWUrEB7aFhwbHXC4p5ROnMzAARCwoyUeJ6oJfUu9CmGHaWtN3m82uQr2vq/p7
	jEYA732towY1hoKufVLfL5TKib526CaBys1qbVuW/f01+Hg00ly/P1I8QivVAWO/RHXWntgXPAbxo
	2XZhxOTxbju0wh5+4/l6lfwRBhcVS7Uf9TCdz9MYvEQteExZA9F8iwTrk4Id5YJm2Zq/vRomqVHj0
	RYx4o9bkO4zfid7vG/yFB37VswOyzSygAKNVAklzrVuytszUgsbBuEmNGgEWpgcejzT7UhzjZBdPR
	O50WbyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLgt-0000000F0Nk-0xBq;
	Fri, 24 Jan 2025 15:33:51 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbLfa-0000000F07z-3vDB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 15:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4Q+OzXMtuEhFbEdc+1OXTF//NaxnNPeK8xHT7i3hwmk=; b=k/G8m+1cmNdGEvILgURBh0pPCN
	vFhJ2tldgeKSYtM6ZF8G7xqClcwjonnJb2+134hbSTmdsjtJUmC4H0HUwCzXEX7EvNR0uLLr1cvsp
	GxkeSo3e+3amy5DaJxDfPcdeS9yQ6UCBbncrwi3ZXvfaZjjNLpacxAQAQEbJnsfQOxlKw8C1W5/eu
	Eu7G3DLI+8ddn8tUzb1gyZM6QMRUxAe2sIye8CzNNH5CQcWx869okbh92JQR6Bqe1qusf5Ejihn5g
	Mu10kkZllElc/UsBPkP0jVAwrxsjkwjyUEdkF/kIc1/kBg57zHD+b//AWPVfoFvL0OjkDMK+IJsGp
	weyhqOwQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39540)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tbLfX-0002Sw-2h;
	Fri, 24 Jan 2025 15:32:27 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tbLfW-00074x-1Q;
	Fri, 24 Jan 2025 15:32:26 +0000
Date: Fri, 24 Jan 2025 15:32:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Yuntao Liu <liuyuntao12@huawei.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	ruanjinjie@huawei.com, kees@kernel.org, masahiroy@kernel.org
Subject: Re: [PATCH -next] arm32/boot/compressed: Force hidden visibility for
 all symbol references
Message-ID: <Z5OyivU-74fr4Vuz@shell.armlinux.org.uk>
References: <20250124082030.764417-1-liuyuntao12@huawei.com>
 <CAMj1kXH5agoCW0gONDZAodHQKANgrix=pE4e5YuHKgR=GwTRwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXH5agoCW0gONDZAodHQKANgrix=pE4e5YuHKgR=GwTRwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_073230_970029_2D93F8AF 
X-CRM114-Status: GOOD (  11.64  )
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

On Fri, Jan 24, 2025 at 03:00:10PM +0100, Ard Biesheuvel wrote:
> On Fri, 24 Jan 2025 at 09:31, Yuntao Liu <liuyuntao12@huawei.com> wrote:
> >
> > Eliminate all GOT entries in the decompressor binary, by forcing hidden
> > visibility for all symbol references, which informs the compiler that
> > such references will be resolved at link time without the need for
> > allocating GOT entries.
> >
> > Include linux/hidden.h in Makefile, like x86, for the
> > hidden visibility attribute.
> >
> > Signed-off-by: Yuntao Liu <liuyuntao12@huawei.com>
> 
> Doesn't this break appended DTB?

Yes. It also breaks ZBOOT_ROM=y as well.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

