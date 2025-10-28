Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CE6CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 23:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aurkqjmwcZw48d4owZ6MXQ9exTKpocR26n9+cdTuPI8=; b=fLn2Atsma61saqE1K6HZDAJ+NE
	y0JIygwrxDU9IhmPTx3CpQRiLpXGJBGyOiE6Y+O7UfUmeCt+b4rm7SbA0cvpKGu8dPcl+mUzNh4mJ
	IEfJOo15ZJmImCVOkEUB9tCilGq04RDoDYjD30FTdshxZzICjYq6jwXMBnJeRuPqyyzqXKHTQdIRM
	B5uauytDKoHyiowbIKYdqXBu6ozwIcaOf1IV74f+KEGztb/58qlhUfVG0VUktWIwWWWlTQjGkB4of
	KLSnFVKcHSwKRgAxouVhRhxL01eDOnZBvQf6Sn16iY5z4BSf2zQOsZDGSKY/gN6dj7XBtx3dYeHhM
	+wJxlTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtLB-0000000GoBb-3AuC;
	Tue, 28 Oct 2025 23:43:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDtLA-0000000GoBT-3BIK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 23:43:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B04AC60423;
	Tue, 28 Oct 2025 23:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87C0C4CEE7;
	Tue, 28 Oct 2025 23:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761694979;
	bh=yf6La/yW+fAW9vXD7xqyZT4cnQekTq6yWJ+U87ek5aU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kDdCQXRqa1q+juk8aW57ol8x2a/4OlhvmYypN4PEefUdMp65mfzmqMwchQ20wagfq
	 5S2HWPiYLc7BMPhFBkuKpoTIGAp4bdpRtncHyUQb+ABiu4zav6/WxgEXrzVAuAVloW
	 Fc0nc4+EjLEr3eyZ1hv3yF1KfPoIQ24vo8LVKkJQwlrD5NVUTB6+NDnfwNYgPstmpE
	 F24HwJqZFjbLZUkXx40fVmaauBUnFhK2HGjSlJAMKhofod9Q4XH6CgJtxs87pofUDt
	 /177iltAlTicNcWjkgdPOjMWy7uaRUDpruZhwk1boJm8ndFh3/Y64gIMYyaSqZcIQb
	 FTeNdikC6e4ow==
Date: Tue, 28 Oct 2025 16:42:57 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
Message-ID: <20251028164257.067bdbcd@kernel.org>
In-Reply-To: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
References: <aPt1l6ocBCg4YlyS@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 24 Oct 2025 13:48:23 +0100 Russell King (Oracle) wrote:
> This series cleans up hwif.c:
> 
> - move the reading of the version information out of stmmac_hwif_init()
>   into its own function, stmmac_get_version(), storing the result in a
>   new struct.
> 
> - simplify stmmac_get_version().
> 
> - read the version register once, passing it to stmmac_get_id() and
>   stmmac_get_dev_id().
> 
> - move stmmac_get_id() and stmmac_get_dev_id() into
>   stmmac_get_version()
> 
> - define version register fields and use FIELD_GET() to decode
> 
> - start tackling the big loop in stmmac_hwif_init() - provide a
>   function, stmmac_hwif_find(), which looks up the hwif entry, thus
>   making a much smaller loop, which improves readability of this code.
> 
> - change the use of '^' to '!=' when comparing the dev_id, which is
>   what is really meant here.
> 
> - reorganise the test after calling stmmac_hwif_init() so that we
>   handle the error case in the indented code, and the success case
>   with no indent, which is the classical arrangement.

This one needs a respin (patch 6 vs your IRQ masking changes?).

