Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BECD4A5EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 02:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5XnZyBpiVU2BOlXpcurb1ARqpeXDPRQUjGZUJrhSfo=; b=L7HYPeQbaCs3AlX7hg4GBIuIls
	h2gQ/pQ9eWB6NHWpOXHkRNjCqqFSkeRr1Se9FaYhfyHjTiCBxFzp6eWJMRMyxrBQGu1OYurt+Orig
	H0f+PL/Y/VmqggZn6P01H1D+pEZ66pInPmI7QKZAFIlWMLFfWI4CnoAOZYRhp2YPNKSTuzPi1avUG
	H3P0VJjH+r8e4NFMxJOp/jIV7VSp7HTmg1OPRJwSLmJh18L5SYyP06AOWUw2oeR+TvtcOEiv5yaKZ
	dlGQVhwco0a2Oj7QvVBdeOl/HyC42zTZ9IvaJWGNxDRD28SZmmk74EJfGlYQFbtXCnnoK//MIPE8p
	w3n8U0wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vga38-0000000DVIf-28RS;
	Fri, 16 Jan 2026 02:58:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vga35-0000000DVHJ-3wX2;
	Fri, 16 Jan 2026 02:58:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C331C43300;
	Fri, 16 Jan 2026 02:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4182C116D0;
	Fri, 16 Jan 2026 02:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768532334;
	bh=J/VRZLz5Y13tzcUGlFZbC7tPCdmM0aLjt2QZN4qLbrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FdOT9TPHU+LhbSrLGTtlmmXFRb1e6bgdCDXom0+7F83Nhzdx6GFQHbHoylT0WRGhY
	 3vMt2nNaJi45xR+kJ2+XJtImNvh78p9oakYeN86wlMKpA7MvPvL4uo+5mrEJhJ6Lul
	 /OUfOOLRHeEZZgXKS1wojHxAezR6vin9l7vDm6r693cNm9+oUpKs2qUO5/8pjyJkyK
	 rTHvDrxtGqo9p/M3HlKefCnRkiqpfb8QFjA08pSNQ+aDQKMTmKqjdYN731LjtAe09N
	 f8rpw+Bqo1v9arayO+ZjUyuMTbvS3iKqICfyMJXr6Jz6m4NZmOrUnfR8ffVqWuQ6oY
	 zkDxxmGBLUocQ==
From: Jakub Kicinski <kuba@kernel.org>
To: rmk+kernel@armlinux.org.uk
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	vkoul@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	andrew@lunn.ch,
	edumazet@google.com,
	netdev@vger.kernel.org,
	linux-phy@lists.infradead.org,
	davem@davemloft.net,
	linux-arm-msm@vger.kernel.org,
	neil.armstrong@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,12/14] net: stmmac: add support for reading inband SGMII status
Date: Thu, 15 Jan 2026 18:58:52 -0800
Message-ID: <20260116025852.354716-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <E1vg4wc-00000003SGl-1dZi@rmk-PC.armlinux.org.uk>
References: <E1vg4wc-00000003SGl-1dZi@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_185856_008015_83C25DC3 
X-CRM114-Status: GOOD (  13.93  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: stmmac: add support for reading inband SGMII status

This commit adds support for reading link status, speed, and duplex for
SGMII links from the RGSMII status register.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 73fc56ce5e55..12fc5038d913 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

[ ... ]

> @@ -97,7 +107,7 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>  					   struct phylink_link_state *state)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> -	u32 status, lpa;
> +	u32 status, lpa, rgsmii;
>
>  	status = readl(spcs->base + GMAC_AN_STATUS);
>
> @@ -111,7 +121,35 @@ static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
>
>  		phylink_mii_c22_pcs_decode_state(state, neg_mode, status, lpa);
>  	} else {
> -		state->link = false;
> +		rgsmii = field_get(spcs->rgsmii_status_mask,
> +				   readl(spcs->rgsmii));
> +		state->link = !!(status & GMAC_RGSMIII_LNKSTS);
                            ^^^^^^

Should this be checking rgsmii instead of status here? The status
variable contains the GMAC_AN_STATUS register which is equivalent to
MII_BMSR according to the comment at line 7. In BMSR, the link status
bit is BMSR_LSTATUS (bit 2), not bit 3.

GMAC_RGSMIII_LNKSTS is defined as BIT(3), which is the correct bit
position for the RGSMII status register (matching GMAC_RGSMIIIS_LNKSTS
in dwmac1000.h), but it appears to be applied to the wrong register
variable.

The code later uses rgsmii correctly for speed and duplex extraction.
Was the intent to use rgsmii for the link status check as well?

> +
> +		if (state->link && neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED) {

[ ... ]

