Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E7FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hK8LojCNJWTNcdut14Z/buamVSA+KThxBwRB97P9QOk=; b=Jvj/WTNTqzn8pgXJsB/cH3HMPU
	muH1LwznkgY60qvnuLWMmKXVo7og3nE2fq2jTe2v9ievjiZiZBlZcBXxbIW8y3WTIdjduaT98ys1D
	OIyas9dpoy+jYAIGm4MEg//stRktDfjg46IBkRfgtTaZPsg4+m0C8HQK6YUGi79DEFvp+4K87eXRR
	TnhRFjgzARxh+j8bT5Xn3KhxC5KlL03twtQfXlYVVZjam5bAE1xH++R2KQKsNGGn5aBLEji/1qYl9
	EDXjUpedavWt14KKz+SPudPXBY78lLW51bNjOVhYTuc/YXyImDaQSrzNq3ecoNEnQBzsE+L+sqdqD
	GmyqHr+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnW0-00000009fUG-1Ms2;
	Tue, 14 Jan 2025 20:27:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnUi-00000009fJp-3XNX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 20:26:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2F8B25C4675;
	Tue, 14 Jan 2025 20:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83098C4CEDD;
	Tue, 14 Jan 2025 20:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736886395;
	bh=qxvuHUk1mHtLWLs28HD1nKDM5BKLuz+o1A3YZgW8khI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pCqxZ/vZEXunUa0i+v6xY/rnaGQKnxVMkcsmSc0MYN+pg4I17Zj6F5/VtTzHVBGre
	 h0rHKiL2OEDoZHhY6M4tYAclJHt+DpOn2olpkW3GYkD/rmg1HZNT/bxe4nQM5xeaVU
	 Gc8UYI9yX1OmC+wHaQXO7ljdqWZiP/pziL21a1o2l05XB35SlO/4jmk9SsF+AslbzC
	 fpJ0Mx2PdU3fe4ad7g/qibycCSKY+BxiTP0kb2WFGuFKfWTD9v4b9myspQHpdv+7fT
	 xbmHB5bC6bKrMi2UpoEU1rh09MVN+1YtND7R/QstL6ZskFnEQJtXRnepgKiw9nWX1G
	 ijvY8tWLNEzfw==
Message-ID: <05c9960be5d357e9b48e431d110797f2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
References: <20250114190612.846696-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] clk: Use str_enable_disable-like helpers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 14 Jan 2025 12:26:32 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_122636_929640_4C22EBE3 
X-CRM114-Status: UNSURE (   8.37  )
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

Quoting Krzysztof Kozlowski (2025-01-14 11:06:12)
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
>=20
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---

Applied to clk-next

