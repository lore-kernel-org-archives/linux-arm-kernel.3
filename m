Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E312F46137
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 14:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGKVI5fPTj8Rwld5MKxndXT/VxQ48Aiz0fqxQeBR5wc=; b=nQhg+0cg/aTkn8GTEde1VRrp4D
	8bxmXqP5gY3wnChnB/yK/QpJlb8UYDie5YZr2+Hg7pUME6uo5EPRhoM9XSFXruBTgBP1fBaxmLwRI
	3V1QAJ23PiXEL0AFIm0hyYVZHtrzNQroA/nP29ts8vX3rbDZ125UMxnxLdiOPcYz6Bm7HLoCP3am6
	33dMZVLNnLi3eHFG+AzmYv/26XmP7x9eYJSud5v2S6y7bfzgdA1ZFR7xk4lUGW5f2h6fxCwACBwYP
	9J9menI4Y+JYcrGqYj998rc8I47rkOJu7tlxgIRlac9Dz7oUds08TmPl93ALAlQEhHiFqIq1e37mr
	aq9Z2Xtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ggy-0000000GxZW-2ua6;
	Mon, 23 Mar 2026 14:55:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ggq-0000000GxYI-37SL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 14:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AC67944294;
	Mon, 23 Mar 2026 14:55:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28E0FC2BCB4;
	Mon, 23 Mar 2026 14:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774277735;
	bh=eC5dKOhfv3tM26c76oHQixo2c9kv+yNRkIuS6+HVk/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LbR+fwx1yNIADU1G1Se5/S7/G1ct2S45zwf1QAiriPxcu43ysWl9YTLtZFfeYKVJ3
	 5lN8In1jKFDzMrv7fk2tHGvv4tfcVJpRedkky3g+5BgMogSpR+oKl8PtCFndofZD03
	 xzYDez1Hm+9CmD9UFXS7QKrJPtGzwmYwaaKKJiuTMgFINNn7ILAUQSUkr1zoEZpwzq
	 cixoGojKXM4rIVVDUbVyz1omUG7Z8F1E5us+UTnWTyO6BCylv4sw45+OACF+flD93p
	 WJ5fzzFZEST77VN49tg/Ji6w4Jpoa+IzkI9cicdijyAB3Hjb4QvVnyuQGugCufNVNr
	 8xsk3+rvi5Ehg==
Date: Mon, 23 Mar 2026 14:55:26 +0000
From: Simon Horman <horms@kernel.org>
To: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Cc: netdev@vger.kernel.org, alexandre.torgue@foss.st.com,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com, richardcochran@gmail.com,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org,
	john.fastabend@gmail.com, rmk+kernel@armlinux.org.uk,
	rohan.g.thomas@altera.com, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	andrew+netdev@lunn.ch, sdf@fomichev.me, me@ziyao.cc,
	siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com, wens@kernel.org,
	vladimir.oltean@nxp.com, lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com, maxime.chevallier@bootlin.com,
	chenchuangyu@xiaomi.com, yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com, chenhuacai@kernel.org,
	florian.fainelli@broadcom.com, quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v8 1/6] Add 25GMAC core type to dwmac_core_type
 enum
Message-ID: <20260323145526.GA94382@horms.kernel.org>
References: <20260320211921.1202058-1-jitendra.vegiraju@broadcom.com>
 <20260320211921.1202058-2-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320211921.1202058-2-jitendra.vegiraju@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_075536_822799_EF0C7B1C 
X-CRM114-Status: GOOD (  15.66  )
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

On Fri, Mar 20, 2026 at 02:19:16PM -0700, Jitendra Vegiraju wrote:
> From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> 
> The DW25GMAC is a newer ethernet MAC IP block from Synopsys that introduced
> new DMA architecure called Hyper-DMA. Define a new dwmac_core_type
> enum in include/linux/stmmac.h file.
> 
> Signed-off-by: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
> ---
>  include/linux/stmmac.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 72febd246bdb..464f4f2e366a 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -197,6 +197,7 @@ enum dwmac_core_type {
>  	DWMAC_CORE_GMAC,
>  	DWMAC_CORE_GMAC4,
>  	DWMAC_CORE_XGMAC,
> +	DWMAC_CORE_25GMAC,
>  };

Hi Jitendra,

W=1 builds warn that this new enum value is not handled in
the switch statement in stmmac_print_actphyif()

This seems to be addressed in patch 2/6.
And I would suggest squashing this patch into that one.

-- 
pw-bot: changes-requested

