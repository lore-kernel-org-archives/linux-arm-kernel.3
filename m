Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EF6E9B251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFHc1xCz+Fi535nwKGC6HpBRQOFBcLAy3w9pPNgxwNQ=; b=YJV9et5YvUnZEdxIlc6op+pFzm
	4qqn3ivUEJYYIrsBo1WtEIQnTrhEI8urWxespd/Nt08Fcf+5US3gGlY8R56z8bJyQiHwrHqaXUjkH
	Y/MEYDXQttGzPaHPIhfqc3m6M/s8QSJ0Ho4SO4EWQPf2KiskPtBLniBpmZ/Q7w4pSVyrmojab2XvW
	8R5K/OPuZXY6O6y9tcwbA7azpzu9bnOB2B6aBBOltdcARa+jvzHidFlm5fyQZQbmwXGUsu7ZfAIMq
	CMnDFNT0GQA9stU/ZJcts8g4GO8Tqlj4hwyINlhvI8jHCvZlOs65oqLBNKt25v2HPMsGml9ZZmiQU
	qerRqP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqkK-00000001zds-4BwH;
	Tue, 24 Feb 2026 11:38:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqkI-00000001zdS-0dBc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:38:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 48317406B1;
	Tue, 24 Feb 2026 11:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86878C116D0;
	Tue, 24 Feb 2026 11:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771933109;
	bh=QS7CNJiQG7B9ALbJjQUVylSiRh7zGL57LuSxHqmBi4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Uzzkmfv9bpJw09ktqybI8ICbNfnuTktHHxwRhi04Y1J6PsGW8WbVaybZVCjX8ew6V
	 DY4cNvK6ZLnzyFuYtMktlLe+GuDpUgHOqc3M4EFt1ibnbV7CgW2b9p26co/D5ACXJf
	 xw8TQqmSY0T1n14XTCKiK25sBkG2P2j38JJMX13rUJJrbOoll5GgtH7CToUNQ4/qFj
	 k/ZF9UggSm2nZjFEtAU6GR3x0yobir3FAJvXwcEyZtD/Gb8KivZHv6b9AWT0gL7FR9
	 fQ/TBtTXhaUDBtry4Y3U07gDQLxpOaEWdYFPkZJBH726qnOqZ0aDGWhkc/w0gBXWpv
	 jEr75bdsf+SPg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com, 
 sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
In-Reply-To: <20251029130731.51305-2-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c@epcas5p1.samsung.com>
 <20251029130731.51305-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: clock: Add ARTPEC-9 clock
 controller
Message-Id: <177193310325.54679.15908657347853584387.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:38:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_033830_233582_4A8EFA5B 
X-CRM114-Status: UNSURE (   6.41  )
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


On Wed, 29 Oct 2025 18:37:28 +0530, Ravi Patel wrote:
> Add dt-schema for Axis ARTPEC-9 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS0
> - CMU_FSYS1
> - CMU_IMEM
> - CMU_PERI
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: Add ARTPEC-9 clock controller
      https://git.kernel.org/krzk/linux/c/6974ae5aa23b7f37182da6b66d7f58313a55a88e

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


