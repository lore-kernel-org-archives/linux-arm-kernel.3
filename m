Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60E2C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 00:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oM+1xVy2MVqCP/92ea+MEGO8ESmszjwDRyMA4/v2fvg=; b=YS9oPrZJod3A6rMgBFDBzrsK1C
	4qy1ESBfhooO/czkgBFvBpwMINr0PV9RzUh6zfBx7DiBOknE/PM+nuJilRTPtasTbHjUifNZE8J4v
	75mzMLFW1+m9JQ687ws7OUttWAC/FUetio7FDAHcuwhopBgHgrreNnsR0LzGWNoTZq5HKK28m75cd
	P3FM+NMcmA3JGUspks3cJhmMWBby/HcillKLMGF2q1wsS9RFULLsZK8PY2gvWfgarppPRPksTZ1HP
	F508c7zYopVQQiLMonME/3/ifspciyzKwRiWmjVpuCWAXOS7yN4vP8xQzeLhnmAKufOylJmsugZO1
	14JLmbKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqM3r-0000000Cic7-03B4;
	Fri, 07 Mar 2025 00:59:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqLzg-0000000ChUM-1iwi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 00:55:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 52612A45063;
	Fri,  7 Mar 2025 00:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F97C4CEE0;
	Fri,  7 Mar 2025 00:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741308914;
	bh=xek2BHPVZ26qJOlIwvynXxMSgyWkeMn3liBIClkp3lI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QrpItbReJvXV4f5NgW5mLT6raAXR9ILcWXRqNJek5KIcTTvGN4K/B/vomAxa0s7LW
	 u4aZDEn0nSrDXhaoRTqiVXvn3VaThme6YX8s6fmORw6eDBPiM8AqInegTSJnIygUbN
	 kmkzeTMC5o/97KmCJg36JTQAlrvaMcAxFirIDLb5xVmPAOJVe3jVwL0fCb3/QRj3A+
	 wH5k2Okk0ScuJX1DrWC0/L8AYVJCKq8PdMiLFuNuJ8B4IhoS4LvwUN5iu2xUu8z5hV
	 86lbzUFCHlPP2SMdOd/H4zSLjWAQwKdWKWfq348B2QMnnbe/oMlMH5KgNaN3ZRDPCA
	 yO7SLVnzsbOzA==
Date: Thu, 6 Mar 2025 16:55:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Meghana Malladi
 <m-malladi@ti.com>, Diogo Ivo <diogo.ivo@siemens.com>, Lee Trager
 <lee@trager.us>, Andrew Lunn <andrew+netdev@lunn.ch>, Roger Quadros
 <rogerq@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Simon Horman
 <horms@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <netdev@vger.kernel.org>, <srk@ti.com>
Subject: Re: [PATCH net-next v2] net: ti: icssg-prueth: Add ICSSG FW Stats
Message-ID: <20250306165513.541ff46e@kernel.org>
In-Reply-To: <20250305111608.520042-1-danishanwar@ti.com>
References: <20250305111608.520042-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_165516_544483_6D845A63 
X-CRM114-Status: GOOD (  13.11  )
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

On Wed, 5 Mar 2025 16:46:08 +0530 MD Danish Anwar wrote:
> + - ``FW_RTU_PKT_DROP``: Diagnostic error counter which increments when RTU drops a locally injected packet due to port being disabled or rule violation.
> + - ``FW_Q0_OVERFLOW``: TX overflow counter for queue0
> + - ``FW_Q1_OVERFLOW``: TX overflow counter for queue1
> + - ``FW_Q2_OVERFLOW``: TX overflow counter for queue2
> + - ``FW_Q3_OVERFLOW``: TX overflow counter for queue3
> + - ``FW_Q4_OVERFLOW``: TX overflow counter for queue4
> + - ``FW_Q5_OVERFLOW``: TX overflow counter for queue5
> + - ``FW_Q6_OVERFLOW``: TX overflow counter for queue6
> + - ``FW_Q7_OVERFLOW``: TX overflow counter for queue7
...

Thanks for the docs, it looks good. Now, do all of these get included
in the standard stats returned by icssg_ndo_get_stats64 ?
That's the primary source of information for the user regarding packet
loss.

>  	if (prueth->pa_stats) {
>  		for (i = 0; i < ARRAY_SIZE(icssg_all_pa_stats); i++) {
> -			reg = ICSSG_FW_STATS_BASE +
> -			      icssg_all_pa_stats[i].offset *
> -			      PRUETH_NUM_MACS + slice * sizeof(u32);
> +			reg = icssg_all_pa_stats[i].offset +
> +			      slice * sizeof(u32);
>  			regmap_read(prueth->pa_stats, reg, &val);
>  			emac->pa_stats[i] += val;

This gets called by icssg_ndo_get_stats64() which is under RCU 
protection and nothing else. I don't see any locking here, and
I hope the regmap doesn't sleep. cat /proc/net/dev to test.
You probably need to send some fixes to net.
-- 
pw-bot: cr

