Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E22EC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 20:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9wDA7RGFab5VWus2ZplLgLsCV9u2BDz7kyjXl6F4pI=; b=nau9pEaWsJcM2mw1CDZrvwaJiT
	+3Nax581smw5gFCDWjM7VNuHj/w5fyTe3xnYujiTwNn4vmMBFndWeuX69a9dqgLtI06WoJPDmQeQY
	7NkwVc5WHNP+VTBpJrSm1s/60p/SQXovnFe/IdQKOLPYlQJsInuZWSONRYRKSNe35DcS7ZywJ47JB
	9dLMXORrAW/EcwDs4l/3F54vIJ3vqXLzwBT3HNoD4pmhxV+uHfQ1J+tImO8AHS60fokVdClZwXfyb
	6Gn+ZyVmRwz26jegML+8whbRO0h0Rt7eU+PDQLjl08lHAFjlzTBAO8IZIXpdJAQERv2+puRdCbFVN
	+X8saw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLs2-0000000EDxk-3A8K;
	Thu, 19 Jun 2025 20:28:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLJm-0000000E9aq-3755
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 19:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB0B061132;
	Thu, 19 Jun 2025 19:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765C1C4CEEA;
	Thu, 19 Jun 2025 19:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750362781;
	bh=m9wDA7RGFab5VWus2ZplLgLsCV9u2BDz7kyjXl6F4pI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=KqaXDKz5UcKReOuokCpMcDqNJLsYw1arvki1Li75bGmnOLJ44QLI0E/KT3jaOtE3I
	 9mSr3wG7ltuRvA4TNMaqS2J5E1ilyvYWlvOILFgmx1IIb6iofw+fT6NyaaqskrVXAk
	 RCy0gtmBTqyRJvPq5JsmrQLbHt0C8MwKShdlTnQpurYjzySBqUxb2KoSCt3JH8KhkH
	 w0FJwsZ6LarnFthJ8KFhg5ky9UmZ8jmJ2+2/cejRC8MIslBP58dBEqHD7wMgzqJMQl
	 bh2SW+Q7+W2cMdhIrDgqKMRtrCGuwap8zMWqlNqSe2KoRkwKuajICCj+ZXShYY4a+7
	 YcHnAyzzlItnw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250619083035.1835133-1-colin.i.king@gmail.com>
References: <20250619083035.1835133-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] clk: moxart: Make read-only array div_idx static const
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
To: Colin Ian King <colin.i.king@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date: Thu, 19 Jun 2025 12:53:00 -0700
Message-ID: <175036278075.4372.3898345624525344837@lazor>
User-Agent: alot/0.11
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

Quoting Colin Ian King (2025-06-19 01:30:35)
> Don't populate the read-only array div_idx on the stack at run time,
> instead make it static const.

Why? This is in __init code so it can be thrown away if it stays on the
stack.

