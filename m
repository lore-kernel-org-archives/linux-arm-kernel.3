Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECF6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 23:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3quRYlij/JVlyRY3Vp9qj5jsmUNpMGfSpcvzf9xiRs=; b=gUG9ihnTJ6G/7TteZn4k78hhTQ
	tdFNBjPZt+tG45kXN/A73mAkYXe4ZEnGVwPQnJLJxLlxMII43Y1aewZmBASkEsns4pYe1nqcCFht7
	d4yKPX7U9YwyMEKWPwOzKfZf7RhZvUa+dtzamg2YnpNDv6TlkpSs8+CycBGc92AySWF+UsCqz8E0J
	ZzEy440kDDRaPoNnrCSlh1qXx4T0Mcsd7JwyeFnj+9XwWERFjYMs1qV1A9QDdLvT0AyCQ+ReiaJ/B
	j4tbTrOw1EmzK4mcxYefo7kW512Xw+u7dr69+JMjIsMMSvY6AA8zazR5AN/xZCrftQY1v2NmRMcHQ
	9q7HmQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqTL-0000000A7uE-0nHn;
	Tue, 14 Jan 2025 23:37:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqPe-0000000A7Jy-0SEt
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 23:33:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=D3quRYlij/JVlyRY3Vp9qj5jsmUNpMGfSpcvzf9xiRs=; b=gf+bdReQYgGIXvPdQwauIXxERP
	jK7y8NeTwZb7W6b1LWk9JOwFacKLCNet1VGJ0MZqI5tqe1tt1qpuypduHZNo1nfz9FwA3U/EW1q0/
	x9N3Ojdn2hej+nsLt+WG3lUW3biv88w2YGJea3tOcug8d2OJLqnwW2ScjoMtu1RZK1AdIG89oh7hJ
	cO2uwfgRjAAgCjR9fqtanwJ07E76TvoKp+a1NEFrNZwcuvjFavKL3X7KyDGsefqg5Iu3ko8fFXDW9
	kEIXzgdRiyDlh7xaB0NTxtUL5IMGLGhG6TBtvguwFuevwHl8DBznG2V8p1DfL/0WmHmmvbTUgJ5ZS
	lFivyEaw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqPZ-0000000Ah2c-1eva
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 23:33:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 867AAA419D0;
	Tue, 14 Jan 2025 23:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F86C4CEDD;
	Tue, 14 Jan 2025 23:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736897605;
	bh=X5Ab8rl/ZfcDU+B6erAbyO44V+L5S9IEQcTx/ySbb7Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XIX+PyfhSFtenIE7nWye1MzLtmVbzVNdXg471YrFy60Hm0OUi73bqq5vfORfr2I+j
	 uUxm6GLPc4/zpChx0/5vqhjH5ZqCfVCr6dIQ8effQ43V0wEg4YSb1/0o6mLobInSzF
	 Ul/Qi8Y/lr4Q9DCAicCwZaQPgE9EXcByk6CUw5Wb2WlY3nUQoxNUaCWaSMILeJknXE
	 LgPeRHdq4zBhSqQ1TAL004oClxzOiOPczjEHhjA4jjggK2yDnele2dQ3Sx0ik0eiGF
	 ysQ3QwUTfsS+nTmpjn6I6hqnHfiiv8bcr3pYr15pLSYqTgdBkGvgTcCoqdk4hUCQDw
	 9WqcsEam7uBgg==
Date: Tue, 14 Jan 2025 15:33:23 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, Andrew
 Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <20250114153323.527d4f63@kernel.org>
In-Reply-To: <20250113055434.3377508-4-a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
	<20250113055434.3377508-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_233329_990795_33F23E4F 
X-CRM114-Status: UNSURE (   5.49  )
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

On Mon, 13 Jan 2025 13:54:34 +0800 Joey Lu wrote:
> +	regmap_write(bsp_priv->regmap,
> +		     macid == 0 ? NVT_REG_SYS_GMAC0MISCR : NVT_REG_SYS_GMAC1MISCR, reg);

This is a pretty long line and you do it twice, so save the address 
to a temp variable, pls

> +MODULE_LICENSE("GPL v2");

checkpatch insists:

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity") 
-- 
pw-bot: cr

