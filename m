Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B05E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 01:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AKomfwx1QIkQimqyAzXe0MhnAvDsPnGxrBge/aNHRDA=; b=TntCzkax4GqE5XUrE1exeQHk0E
	fgYzgEiLyhZWBtoHvNZXq/QpcIjf3n1KgRrq73YvS60nC5sdL/KG5QVuftCjsYAxxhtGaNPqwc7So
	XH/nF6HEfMzw3MVO+65acE3+gQPSTWDObm79Y8RAHL748ho0YwC4jugzhHLjzSSWVBY04oO4TWzii
	EkP//2d8DsnBnSRqhfH05XS65YdIyPBQq6i94vPyhKNeHLU7sZWgyjYkTliyXowIlp3/Hc8RwNJAs
	MGOKrgL/J6TcUI1BTzn8BKYpYwq7EjPwUQZdK1UwBKbUjThuYXJpeFcVboYWHIygOfN6jcaVzjUHR
	0I3AHerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5DH-00000000U0c-00wu;
	Thu, 19 Dec 2024 01:20:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO5CA-00000000Tmp-3dWk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 01:19:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5207AA418B9;
	Thu, 19 Dec 2024 01:17:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301B1C4CECD;
	Thu, 19 Dec 2024 01:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734571157;
	bh=WgKrOQgc5+ve3ZEs3d+wbWdTrA44m5zY+NgdD/BDjKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HekLFyLp4SrCKPmY5L8j2MeK+4ZuTsqK6fI8koG/ZKdSytND9ZyY44zwKlTOLUFWo
	 UR0tJV37jgCFCdRoA5r+tAdWmEzAfJa8frBLSMr8iRuthRU67Cp9lutbr+/2b0YCqr
	 LjI+e1eoMk323iyi5s4hy1ngIIaAaVFgpSFEnZc2Umml2fkLcaG+McO/xZUoodBFUl
	 6fXxv2+YxOXMFoZcBbOS8lPV14Vic/iGrYptQ1Bn4iudzfK7UuTt7a+JZFoOwtAwT+
	 H8mHUs8F3/JMIeSe73Y6Q2XuNZgZHQA2sSpK4ypoN0WyT3cw7FPG8SBYFRN1JKyJAT
	 W9Zxccha2uS1A==
Date: Wed, 18 Dec 2024 17:19:16 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com
Subject: Re: [PATCH net-next v1] net: stmmac: TSO: Simplify the code flow of
 DMA descriptor allocations
Message-ID: <20241218171916.24a7e24f@kernel.org>
In-Reply-To: <20241213030006.337695-1-0x1207@gmail.com>
References: <20241213030006.337695-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_171918_975897_3D011C37 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

On Fri, 13 Dec 2024 11:00:06 +0800 Furong Xu wrote:
> -		if (priv->dma_cap.addr64 <= 32)
> -			desc->des0 = cpu_to_le32(curr_addr);
> -		else
> -			stmmac_set_desc_addr(priv, desc, curr_addr);
> -
> +		stmmac_set_desc_addr(priv, desc, curr_addr);

I can't figure out if this is correct or not in a reasonable amount of
time. dwmac4 and dwxgmac2 looks pretty obviously okay. But there are
also ndesc and enh, which don't seem to map to platform in an obvious
way to an outside reviewer.

Please provide more context/guidance in the commit message, otherwise
this looks like a high risk refactoring for a driver this poorly
designed.
-- 
pw-bot: cr

