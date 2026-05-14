Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFD0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 16:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgBSMzG4lky7+7nbfNpjWA8DoZTKo0T1BmCluLLn0Nk=; b=QhzWC4D/pkmHOsM+tmiw/ULHrw
	SvHhcNoC89xxBlmWbOtIPghrdQgEVpTPQJTX5OZwDVIYFqHhCFngcyNCCrq0rZMXJehKBXz3ZGo+V
	+TJrxUg6vEc53/ms16M8XTCBWObdF3nLZWM+M7dECQBMLbdFHvb+6hUPvlO+wWjTKtm1T+2P2EJUk
	VXF/3hUAUShgjGPT+N9U6/KidrxvjuAjRWAvv6HG5kwXdA2iLtdDBwjWcAcmfxMHjem4UQmrO5fIk
	wjp3y2C32eE0zF+AjIEhJP+xd9VzIhzldsx91s+01rUBlkRVqI396lHdOlck5Vc1mDBI8GEdVwC3K
	L8hjbjdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZMc-0000000688s-2ulK;
	Thu, 14 May 2026 16:56:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNZMZ-00000006885-2ip2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 16:56:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36EAF444FE;
	Thu, 14 May 2026 16:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53813C2BCC7;
	Thu, 14 May 2026 16:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778777803;
	bh=fSw4doSddlVNTevBJY2Hme6/meXiI88IXww216rP9AA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mKEXOEAVd0XsGZMtYiUuGw+z7G6v61Vbn5COBkyEvJf8FrwxvstQH9kW7NTKrxZOa
	 79waAB0kAXD+I5ylohsNSZDPivs0oNbh7vvAw2X85fVq7SyUiNTVOtcse8ruchnrYH
	 A6UANcHPJ9iUrGZI4JgOSY7isaK1at9WtyaTr5iCKzw7wEeRBDVrBgmt76ixqpZiYt
	 G5LYlvNsjwm18vlHy9BlWsrCcXsMy5i+mbWiErhgwETZ68AKY7BAZBB6or0CJLeqp/
	 v6fuM+BC4I5um8vQV4aM9riOyWxpQOedu9RldQiel+8Dw9e1q6Sacxm+2h9OGXDkh2
	 5w74XcuB6BzKw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: peter.griffin@linaro.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 mturquette@baylibre.com, sboyd@kernel.org, 
 Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: andre.draszik@linaro.org, tudor.ambarus@linaro.org, 
 alim.akhtar@samsung.com, semen.protsenko@linaro.org, wllee@google.com, 
 hsuanting@google.com, marscheng@google.com, jserv@ccns.ncku.edu.tw, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 visitorckw@google.com, Yu-Chun Lin <eleanor.lin@realtek.com>
In-Reply-To: <20260505171457.1960837-1-visitorckw@gmail.com>
References: <20260505171457.1960837-1-visitorckw@gmail.com>
Subject: Re: [PATCH] clk: samsung: gs101: Fix missing USI7_USI DIV clock in
 peric0_clk_regs
Message-Id: <177877779906.167822.16215877297807645211.b4-ty@b4>
Date: Thu, 14 May 2026 18:56:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_095643_710735_96C1F9B2 
X-CRM114-Status: UNSURE (   6.03  )
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


On Tue, 05 May 2026 17:14:57 +0000, Kuan-Wei Chiu wrote:
> In the peric0_clk_regs array, the divider register offset for USI6 was
> accidentally listed twice, while the divider for USI7 was omitted.
> 
> Missing this DIV register causes the USI7 clock divider setting to be
> lost and reset to its hardware default value during a suspend/resume
> cycle.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: gs101: Fix missing USI7_USI DIV clock in peric0_clk_regs
      https://git.kernel.org/krzk/linux/c/78ee734b36284d82454e87a92094fdb926985b47

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


