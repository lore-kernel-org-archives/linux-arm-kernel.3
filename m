Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3B1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0R5NpfYl0sX1/KlWOkyDppvjkRkNuj1L05R+h+l+1aY=; b=1AbvWacpOaC/b7fZcyrZM5DgGj
	DvPGElUlRlXnVOwlbW/W1jGhzcxZrsMQ3aRH6yxm/bVRRmI8U5hn1b5vAicuf1ALPrQaUgvpfx/7C
	m+666OvPxRJ8rM6TeIPOrxDvKHXdEhpeFALS47JOnZy7/JLgVGqnbMY4YSsJNTGjhCDZmveiIOxEj
	Ba/ITKh4yrFQA9u0DrJlZtW2muf45Wzd90mT6eX29WbLETFPwEzMjZE2pddPoiezRyNjYK0Wbdoph
	wHLMDyCA/pQ4Pkek4vbrgC9FlbuJGAMM5+lOBf/dAVwQCYIBj5Fqf/ONUbcpWDl1zFGWojhF0jzlM
	CXxydRdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOl5B-00000006A6u-2xYE;
	Fri, 20 Dec 2024 22:02:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOl42-00000006A13-13Mi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 22:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FD265C2C39;
	Fri, 20 Dec 2024 22:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692D1C4CECD;
	Fri, 20 Dec 2024 22:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734732101;
	bh=AkFDAdGYAZwPeNowaJnnrFIGrNYl4SvJvDqNGrtVyz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ccldjYSCWo3h4pBQ/H2a51CJtIf7U6/juaE7A2hALoReQSwu5EewRZmcj8/HW+h+1
	 QouWXU1V1ojauyov52If7lyWaUeLy43qTd/8IubpqdihyLgI6yrGjNQsYdu6/YCMU7
	 7qE4KdHk2Lbjw9OMTCAlA9q2ShVYBtUJBHviN8eIXr6JjIXP/Ij/G3IQazvgzf/RV5
	 km7LKxoAwVflzPFfDl4h8gkdZlrMkA/52bQOKYQcAyGEAjaiJ/wHGs+0TBuvfD97ft
	 sD8tQCiRYGfDGDhTIaqyEUL0w7p5mZQGow/mSZz3RPPGBnKPjyJuAHc/+y+O2G24RJ
	 F5LHN29NQ0iLw==
Date: Fri, 20 Dec 2024 14:01:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Mathieu Othacehe <othacehe@gnu.org>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dwmac-imx: add imx93 clock input support in RMII
 mode
Message-ID: <20241220140139.5c0cee2f@kernel.org>
In-Reply-To: <20241217084942.4071-1-othacehe@gnu.org>
References: <20241217084942.4071-1-othacehe@gnu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_140142_338957_BADC4CB5 
X-CRM114-Status: UNSURE (   5.67  )
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

On Tue, 17 Dec 2024 09:49:42 +0100 Mathieu Othacehe wrote:
> +			ret = regmap_update_bits(dwmac->intf_regmap,
> +						 dwmac->intf_reg_off +
> +						 MX93_GPR_CLK_SEL_OFFSET,
> +						 MX93_GPR_ENET_QOS_CLK_SEL_MASK,
> +						 0);

nit: regmap_clear_bits() ?
-- 
pw-bot: cr

