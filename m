Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F22D2E9D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hfjqn7SDOIyQITK6gpOpUjN15fT1QwZHztZC4zX812A=; b=tOG9XES/P919qQmBeA6l67FtiW
	X2mVkMf8UZcrcwQezOjjX/ILDei8DjHgX0hDG3v9cYeH9cL6ee/VkGaRGml5ms9wfgVQbt8OBjA2s
	TbDVsqqeg0WW4Vo9+bTY/sKgSACDP6XhJ8swu6UXz3coqOotNYJUvVPYb4V39V09bghN10dqibO2s
	9tGtdcpqzvYY6Np5CpHTEqsvN+7w7YDUG1StJwf7FSi1/vj57ZuyILTksgnqZRsknm5MPeb3LA4CX
	n7Vc/DhN+wRu6YUxjJJ/VSrrO+JofsEWow9nucftEwTU3mTXp+K8Bmdst0ww6tYHjyY5lnpraPwt3
	LG8jsTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARe5-0000000HGeg-1mqF;
	Mon, 11 Nov 2024 10:27:45 +0000
Received: from mail.ispras.ru ([83.149.199.84])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARcH-0000000HGSD-2XuR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 10:25:56 +0000
Received: from fedor-21d0 (unknown [10.10.165.9])
	by mail.ispras.ru (Postfix) with ESMTPSA id 1670440B2295;
	Mon, 11 Nov 2024 10:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 1670440B2295
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1731320746;
	bh=Hfjqn7SDOIyQITK6gpOpUjN15fT1QwZHztZC4zX812A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIuqH2vAytZns3wNa36rXMzC4BLTmXefN/cD3DYvYqdxnQr0BkkQ8PSw5RUy2qpVM
	 fveb3CnNu3Gtzxko9BHvXbDd+BhzGR2K1ZoHJdKRTeOGfC/SXCeqmxQW/YTWM4CEgG
	 WxzkJ7N8eNqCrcdopvi/jDySjA0HuDoQQE5L90ec=
Date: Mon, 11 Nov 2024 13:25:42 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Vitalii Mordan <mordan@ispras.ru>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org, 
	Alexey Khoroshilov <khoroshilov@ispras.ru>, Vadim Mutilin <mutilin@ispras.ru>
Subject: Re: [PATCH net v2]: stmmac: dwmac-intel-plat: fix call balance of
 tx_clk handling routines
Message-ID: <20241111-def1390bf54ce26f76be250c-pchelkin@ispras.ru>
References: <20241108173334.2973603-1-mordan@ispras.ru>
 <e1b263d8-adc0-455b-adf1-9247fae1b320@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e1b263d8-adc0-455b-adf1-9247fae1b320@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_022554_203104_2CD5AD86 
X-CRM114-Status: UNSURE (   9.78  )
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

Hi,

On Mon, 11. Nov 12:39, Dan Carpenter wrote:
> smatch warnings:
> drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c:163 intel_eth_plat_probe() error: we previously assumed 'dwmac->data' could be null (see line 101)

There is a patch [1] targeted at net-next tree which removes the check. I
think there should be v2 posted soon.

As it's not the first time Smatch is pointing at this issue [2], is there
something to improve? I mean, posting the patches in form of a series or
explaining in commit message that the check is redundant and is a subject
for removal? Adding new redundant checks for the fix-patch would not be
good..

What would be the most appropriate way?

[1]: https://lore.kernel.org/netdev/20240930183926.2112546-1-mordan@ispras.ru/
[2]: https://lore.kernel.org/netdev/20241003111811.GJ1310185@kernel.org/

--
Thanks,
Fedor

