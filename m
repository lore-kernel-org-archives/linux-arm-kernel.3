Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B9CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fwSFelqnv16O3Z5CfuJeHvjUeDPCoeSC6mIkfvyX/co=; b=2+hbezt4bCOD7plKD0GJpa2eRi
	lF38tNCaPolhxG49CAVDJmzqoS56TQORKlEm3a6k3yDL2jyk4ASqHaiZ8x4PzD2/MLOTXqMxGt4SI
	qMILMryFsQH9iXuGtCyq0VRC/F4YNUZ0YUAbcoMzsAZQkN8Sa1u6j+F9BXbFnYdSxxWd3gtYsj5Mw
	h/58/afeROu5qNkw0Ov7pCuI4J0gckSAkshT4iH4RHCSaxLLUeMSEwb8fSuA7c8s1XQCY7Jt/+/de
	ZeA2IZUtRdnJv9iaiUi7QP/+bj2gB8cqw/s7yR0UNNt0nlw2t5Mcg8zidHJ6M1EyXV4WS2tWyt1xF
	6Lg2bilw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZbD-00000006HMC-1avO;
	Tue, 04 Mar 2025 21:14:47 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYHm-000000066am-48jc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 19:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B424A45C40;
	Tue,  4 Mar 2025 19:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEEDC4CEE5;
	Tue,  4 Mar 2025 19:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741117837;
	bh=fwSFelqnv16O3Z5CfuJeHvjUeDPCoeSC6mIkfvyX/co=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=HIkd9Ij2H85qYKpF0MGi3HY94MySHtt+hjxDsSYKSNYnV+0uG1M8K0JtFT34w91f8
	 ZFlFXdeybOfg2N1SYlxOjz11OAUt5MIQllkzSmR/Qu9F6uq72JMkouYukJpLbB/K06
	 KGU1xzb0hHmjiLAYATZTbeIVuZEBPR+hBpS7YpZkx5+u/UHgZtrcV81FAW4/3YjKug
	 vSIs0f70ziIk/CBnoc8OprIJaVCrAC1v31vrOE3Iaef7wWNVfAGzWZSS53EFfeWjjF
	 Q3hUZ8iFAu+Ya9G+w1TrqASpOCbcfpVJket5PMDdGiGoV/6Y3LlTi4Pf4sgyRQykP5
	 D1fudmyYA+Oyw==
Message-ID: <2e9b95d5ac648daf07101cc0da77d20a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250124111711.1051436-1-dario.binacchi@amarulasolutions.com>
References: <20250124111711.1051436-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH] clk: stm32f4: fix an uninitialized variable
From: Stephen Boyd <sboyd@kernel.org>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Dan Carpenter <dan.carpenter@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Tue, 04 Mar 2025 11:50:35 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_115039_093678_B1C06BD5 
X-CRM114-Status: UNSURE (   6.57  )
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

Quoting Dario Binacchi (2025-01-24 03:16:54)
> The variable s, used by pr_debug() to print the mnemonic of the modulation
> depth in use, was not initialized. Fix the output by addressing the corre=
ct
> mnemonic.
>=20
> Fixes: 65b3516dbe50 ("clk: stm32f4: support spread spectrum clock generat=
ion")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>=20
> ---

Applied to clk-next

