Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588AEE6749B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 11:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u8BeSNtEVzlT6axXxyrW1SjM8RGFF7kCN49fE8uObuM=; b=HVMZ/6loTh6Ls3KXEJtAOyxq6C
	74Upi3h0r0YIrWjsQIw2NTMJn0gLTvDKE1zqLovwht9GxdqS3EIc9zpM0KW7oTxTHYdAovuyn7iYf
	HKGuE15rmwkl2T90q6wMzpcNmMsdZiJ0lkiBbFDwO78sig7vRG6e5brSLVch6O+Quuz/i0myTRNS/
	uEoFA6A/0+Zqo+g2A5IWzGnw4x0YwtKI/K8QLwMFGk/g0fkiQE2cjnXeGlGQAlnlEtTrSm5ltUAy9
	03TryDAqxf8SKysckjRMnNpo1RoYcktVz7ODyna7raQnLsg2pgxmlknMz+/tBzbNo3+HjqghqCO/n
	y6+QVIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeR2-0000000Di4m-24zy;
	Mon, 22 Dec 2025 11:50:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeQx-0000000Di3I-1w8B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 11:50:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17A354396E;
	Mon, 22 Dec 2025 11:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7178DC116C6;
	Mon, 22 Dec 2025 11:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766404239;
	bh=qtFhad+oksdajZTyUIhQ/cThE6gZHtNWEc9qENT9c2E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qSyz+iFeGQEA+35kpg996olqXKNHMAZ+5ja+4eg3YnH0hkrrbawEJgu7DR41OERnx
	 TjDB6udahrCOjg2YGo/0RXCsWDxLj4QSfgbD1kPjrj9EbK/K9w/IPHUMpMOIXA3SIp
	 rckEAFf+K+L6J9nt3PirhSYqE9EWnNvUpWeIw0JVa0Sng24Tj36HcOO05PPNhE7naf
	 ulnRBFXtlWmUxiiMAvLLmOu/dvaTyc6NUzJ1ZxbeJ2UQVcb6FX+GUb3ioKeYajVAl/
	 u9nto3aGPWJnLzyLus8bJU2URh3sCpXO1yXvRYfPTVhLaZQloN7Jje57TAfQZYknNi
	 MTUObcXAjfrLw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
Subject: Re: (subset) [PATCH v7 0/4] Implement hardware automatic clock
 gating (HWACG) for gs101
Message-Id: <176640423317.47079.9046133168071940495.b4-ty@kernel.org>
Date: Mon, 22 Dec 2025 12:50:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_035041_844726_63A0667D 
X-CRM114-Status: GOOD (  12.33  )
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


On Mon, 22 Dec 2025 10:22:11 +0000, Peter Griffin wrote:
> This series addresses an issue with Samsung Exynos based upstream clock driver
> whereby the upstream clock driver sets all the clock gates into "manual mode"
> (which uses a bit that is documented as reserved in the gate registers).
> 
> Another issue with the current "manual clock gating" approach upstream is
> there are many bus/interconnect clocks whose relationships to the IPs
> are not well documented or defined in the specs. When adding a new CMU until
> now we have tried to label these clocks appropriately with CLK_IS_CRITICAL and
> CLK_IGNORE_UNUSED but doing so is both error prone and time consuming. If
> your lucky disabling a critical bus clock causes an immediate hang. Other
> clocks however aren't so obvious and show up through random instability
> some period of time later.
> 
> [...]

Applied, thanks!

[2/4] arm64: dts: exynos: gs101: add samsung,sysreg property to CMU nodes
      https://git.kernel.org/krzk/linux/c/01272f05aae5f6aca4337eb52e6b9290ce12e9f7

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


