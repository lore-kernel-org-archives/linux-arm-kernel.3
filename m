Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3207C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1bmjEjuXg4V0a1odWzBZHBwutxRktqwzbVaoXj++OA=; b=no4HBXzN9NJsCgbanqAcB5Gaxz
	rqbcnc96WuXlTJbDpY579wp6xB49WGfMLhR+xXW3IgiLRIyvcxVW5R5tMBc9N8DOXIy/7I3yH5/vU
	pV/DDFUCW/iCaQNAfSoovEGUEHkWwA0x8a65toTRk2/mbzDvjHPQVRUtANyNQwlNWLRYCbTE6gujb
	p27C0KAUKDAj5hBIyKqd7HzM8pxMMv9qIJjlbVdWa95kpiDUi/tJOACzdJ3LZgoAYz9JIaTUnsKMJ
	1WwunOPOEwQehUmmBXQp+OjLHYBD0uY0JtPes4makmG99AfEBSBoJxVMkCgAO5tLco+SMNFzDbTX+
	UiVpH0uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WBp-00000006RVm-45gq;
	Mon, 07 Sep 2026 10:03:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3WBo-00000006RVf-2GBl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:03:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 36176435AA;
	Mon,  7 Sep 2026 10:03:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9A81F00A3A;
	Mon,  7 Sep 2026 10:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788775380;
	bh=E1bmjEjuXg4V0a1odWzBZHBwutxRktqwzbVaoXj++OA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=YcuvWqTO2JrcuELqckcilHReQmr0b1T8MZfB4PLzR/RfGi7I4qweZpyA0iXRqphmj
	 xKbhHXDictGihsCJPBZN4yRY9Gc1a/XiFCrHy161HtWFycm7PCan5f32JGr6NZlYTt
	 rSzRddzl13UHkM3t1FO6k2FJSv7quHruyTpMIWVSxnn9+8qQr5p4QhtHVPQ38zPRqQ
	 N652ifNwfF6CYNt4Awg1bQfEZVBe4ou+bJhpdVIzxzSpdC5WA77Q3qrGNAsjkhS6op
	 F8PqfAcRN21XZOu7a7Yc/bLzm4x349y8ZFAgGSdtLlFJYK5pLDuFKUVuNukjqAuXWP
	 klHh2VH3Zhr7Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Aiden Isik <aidenisik+git@member.fsf.org>, 
 Aiden Isik <aidenisik@member.fsf.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org>
References: <20260818-for-next-lucky7-clock-v2-0-cda0cc80f158@member.fsf.org>
Subject: Re: [PATCH v2 0/3] clk: samsung: Introduce Exynos5515 clock driver
 support
Message-Id: <178877537489.237750.11976683817275167813.b4-ty@b4>
Date: Mon, 07 Sep 2026 12:02:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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


On Tue, 18 Aug 2026 22:58:34 +0100, Aiden Isik wrote:
> This patchset introduces clock driver support for the Exynos5515 SoC.
> 
> Currently, the following CMU blocks are defined:
> - CMU_TOP (handles clocks for all child CMU blocks)
> - CMU_PERI (handles clocks for USI, watchdog timer, etc)
> - CMU_FSYS (handles clocks for MMC, USB, etc)
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: Add Exynos5515 SoC
      https://git.kernel.org/krzk/linux/c/3c120e1c651da5c13b803f4742cc5d929b78a772
[2/3] clk: samsung: clk-pll: Add support for pll_309
      https://git.kernel.org/krzk/linux/c/6fb3239a9a58399ea787887ad555b6f6cfadbddb
[3/3] clk: samsung: Introduce Exynos5515 clock driver
      https://git.kernel.org/krzk/linux/c/0ae5dad7d9e6e4b8c8f3611f04fa929e634630e5

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


