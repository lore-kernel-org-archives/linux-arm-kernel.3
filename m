Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00FBC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 20:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuVzpvILdAaeWiohTckBjCJz4gutxwWzYynDXNfUv24=; b=tEM94S3eT4/yS2ZCXagfl4ZwWu
	3GA+PDoGDrJE6QnyxfLW/lvE5ZLQPeJnaQNIWRWyV77qWTAloH9LjnyTun1Jwfw1TZJtVB588dS6k
	RhicM1AHb7MnZLm+HSa99S3sGuDvQe9HeVgjloE478v1HSoXP3KxUgft4sBKzjXLBNXfnFjYQlyXB
	akDBt74W+riFCJTzBajmOhNhh6bzMeQ+hQd+FQaLbwjFUOhokXXhD3Gg6UBcQO0HDg+ogmfOxSKOf
	VUEkuM6TJTTipSttF9/N86afSIar9+8xliAVjLe8bWF/VfE2kRCg6+oOvEn0wvSoDLgh5bL+9deAt
	crXnKf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYA1B-0000000Czyt-1cku;
	Wed, 15 Jan 2025 20:29:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY9zr-0000000Czop-1f9m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 20:28:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6DB55C5751;
	Wed, 15 Jan 2025 20:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25B95C4CED1;
	Wed, 15 Jan 2025 20:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736972894;
	bh=BuVzpvILdAaeWiohTckBjCJz4gutxwWzYynDXNfUv24=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JIGS752zcGJ33aeet7RDXbScYhUxTFkrTLhKhsvOhRGsur5dyVmi5xlDOizhiVr71
	 zlf+WkPqsdngRS9+uk/DtPOxgvBGD0lwDQ4+BoMpk1YxhkXBLtrxSMofia/ohLhsD/
	 EoTYb0c+qMXfKvx7zzLVFargVWj31MluHApnGqGxirNbWzsevx2RYVNNchlI2pu5ht
	 7PJqSBp8d5LfD2V1QWnBhGCvgqzI5eCrrKwN8CTBvQAuSbiL2LNuZUl+ZwM4LuEY+7
	 lepZOqMAgdgQneCsMsxHFQYZiSmLXpBejJ8YqD6sPcH3/ZVByafMkCU8ibwe/GPyps
	 o6Cj0GFvCSJsg==
Message-ID: <22ee938049e518a40161f9953a6ca7aa.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
References: <20250115081914.12841-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: nomadik: Correct str_enabled_disabled() SXTALO case
From: Stephen Boyd <sboyd@kernel.org>
Cc: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 12:28:11 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_122815_479401_4B0222A1 
X-CRM114-Status: UNSURE (   6.16  )
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

Quoting Krzysztof Kozlowski (2025-01-15 00:19:14)
> Commit 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers") should
> use reversed check for SXTALO.
>=20
> Reported-by: Stanislav Jakubek <stano.jakubek@gmail.com>
> Closes: https://lore.kernel.org/all/Z4diEj__bbQl4ULS@standask-GA-A55M-S2H=
P/
> Fixes: 1cd1c8f400e9 ("clk: Use str_enable_disable-like helpers")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

