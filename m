Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EEADD6A22F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3FWdQJwu4zdHtPrtn6tNTnB6ew7R6w22+4oq9gH0Ls=; b=m9jjTo+gpAZD7xtfHaTQdFFrlf
	0l+YLfVqt1/3PqaxX5ZBOOIT19LU2y6P30wHSNjVAhLskfLw8DJ3efiPrhv5zb309PiZY0B6NSsWK
	MX9Y9Q7UgXOeRE4V6P6iLIBtg/+YFHNL9KWY2hLgO7kLLnsa0dbg8CVfhTepNMSjjXz+l0u4qYpWK
	AWnmE2126xRXSQ9RiOQNiXc0JUQjIgrlWnWEXl1qoOsBdAywkAOgyJF+o5WHrhykVRX6d6xl7NVK4
	8F3pYSUrLhz0o59vzYlqmEecHyzmqDbw1hyfZLm2zCuNJKcKXXqc855w2aXOcY7+6IN8b4kmiX2dM
	iPIGWA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBh2G-00000000qND-3tXY;
	Thu, 14 Nov 2024 21:05:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgya-00000000pZL-446r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 21:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47F8BA41BA2;
	Thu, 14 Nov 2024 21:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7951C4CECD;
	Thu, 14 Nov 2024 21:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618124;
	bh=k3FWdQJwu4zdHtPrtn6tNTnB6ew7R6w22+4oq9gH0Ls=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qM1t+/kQDM/JLjFDjgwDLHUczANYwvHt2V40F+xyeaL0No874ZudGZrXKwkfjH0r9
	 yD6ue9/dO1NykNpljYtxBvvoCnIcfN8zRltCLSpJqoKqSrho6od3r6HIM3O22eh9ba
	 Pw4/RHkd358EAkjOEkndP4yb3UgW8iEfRc3MI9+YGU4EZy7N7wDCjHTijZEVSzsO80
	 3WXVjwuUeQTi42dg6Vx/zjDCHKwM4OU2NLOfkwfSv2zaLQIGfCQOCQbQWxm+2rcv77
	 lW1i1Egp1pncN5tK+GjW7vkodKBNKggOn0gP9Em3BsAE43Br7uP7uYU6K5T9tYrAsD
	 bfFyd/trhqoyw==
Message-ID: <8d1d2ae09f0ffd8a8f930c60e84d9257.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-5-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-5-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 5/7] clk: en7523: fix estimation of fixed rate for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:02:02 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_130205_073720_8214BD7B 
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

Quoting Lorenzo Bianconi (2024-11-11 16:08:52)
> Introduce en7581_base_clks array in order to define per-SoC fixed-rate
> clock parameters and fix wrong parameters for emi, npu and crypto EN7581
> clocks
>=20
> Fixes: 66bc47326ce2 ("clk: en7523: Add EN7581 support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next

