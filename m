Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD80FCC9A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 23:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/ZWVyYX32YKvOG2ZJ940B6UEx622VWePb40GDDuyqk=; b=eYCkIGWYKt1lGbM/0J/Dy2OStI
	2brL3cSQhr4E5+VDGN56MgjUYSAd9voKD3Kxr0HXJJeexCGAUbb145Lm9PfUwEzttzasJzwkso/Wa
	D/AhDI+hrG3/A9rKr1A6ghx3PqOnOi8RFbVEVgUfGPxUivI+qV0FyK/h5Xq+8rYGG8FhZ9yj+6hSY
	87MkfntgZRjGV/crdpEYeCc2X9jYATEaI0A/ZO9r4mYqzbYSB9I1z8MF9zTp172y+wdcMVEQISUoO
	5gNb+iGwJRKVqW1YVqLWisKVz1tnX2OYyo/WE2218kpRW96/R+J8CFCOaa1k03pdEY+CB+FIVwYYZ
	JNTU+JQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkNq-00000008K0E-2R65;
	Mon, 09 Mar 2026 23:51:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkNo-00000008K00-2Eqz;
	Mon, 09 Mar 2026 23:51:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98DE460054;
	Mon,  9 Mar 2026 23:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15ACC4CEF7;
	Mon,  9 Mar 2026 23:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773100291;
	bh=AnnEM0AEOjnmbxyb5EEXI/jarl/KqCoDW6tKbthKBzI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OWqoBoPbJ/5DcO1AV6iEqZmg6nt85hulv2RU0E+PcvElbhF323SzKwlItX3PiQ4LL
	 vPGKR1akbwYB+pqE3Hz9f8cnHLGNkIGwbsMEN5KtbhdxEnOl+SWtMm23ab6Bn4om2J
	 m2/8afU5ehT8Um47o0q6lzRZw1ypUPWpRXjHuFb9TnZm4VaZwwF0jyLAFud+E5TkeQ
	 9zxDTRlRIyIDR8Bjdh9RfvqQd5KlmYOvlKmwmgGPVmUraqDf/gELZyZaZUTVrQefre
	 jlV0++9qBD9A/NM6O44+SCIE9cIiYsPewUW01e3jb6m+VfDLAg2TyWFeMn19b4GSU/
	 TXwHFj/PFrlKw==
Date: Mon, 9 Mar 2026 16:51:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Mohd Ayaan Anwar
 <mohd.anwar@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Vinod Koul
 <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260309165129.78d656c1@kernel.org>
In-Reply-To: <20260309154432.b3dbantow3e3tkry@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
	<aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
	<20260227165556.5cf9e844@kernel.org>
	<20260228083111.5df8550c@kernel.org>
	<aaRBjWhP4-7Kru9D@shell.armlinux.org.uk>
	<20260302155736.1fd2980e@kernel.org>
	<20260309154432.b3dbantow3e3tkry@skbuf>
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

On Mon, 9 Mar 2026 17:44:32 +0200 Vladimir Oltean wrote:
> On Mon, Mar 02, 2026 at 03:57:36PM -0800, Jakub Kicinski wrote:
> > Alright, I think the best we can do here is to merge patch 2 
> > in a "stable tag" way. The rest will have to go via net-next.
> > 
> > I applied patch 2, Russell please rebase the rest on net-next 
> > and repost. Patch 2 should disappear. I don't want to merge it
> > now as is without an explicit nod from Vinod. He did ask for 
> > a tag and we won't provide one.
> > 
> > Vinod / Vladimir, to merge the "stable tag" of patch 2:
> > 
> > tag_name=phy-qcom-sgmii-eth-add-set_mode-and-validate-methods
> > git fetch https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> > git tag $tag_name 0e8147f4da00
> > git merge $tag_name
> > git tag -d $tag_name
> > 
> > I think this should work.  
> 
> Thanks for the anonymous tag. I think you mean sha1sum
> 4ff5801f45b494ad8251a16ec06c9f303ed3b9a0, not 0e8147f4da00.

Ah, I guess I misunderstood what Linus once told me.
I thought the signed tag remain in the history once
merged even if no longer named.

Anyway, I pushed the tag to kuba/linux.git
phy-qcom-sgmii-eth-add-set_mode-and-validate-methods
if you prefer the real / signed thing. I don't like
having these random tags in netdev trees.

