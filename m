Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F442C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLb36tVfJEOKQMQt3uvFaLwJzBn1n6sVBLny6umONd0=; b=DC5SDl+ukDlaLiRGoUtONszUF4
	R5tZlLPcg3n1BNAzBJ7ZRz0oheLz4+3vIadXFn0F/wesorOYWWfbERtgVP+eTcoGK6JaTnv4VekDX
	3CqIKMr1HgPh0SWcDoFTRHVkWueELxfJV4XkbxWgJiy7L765tAR21I10W3CtF3+HMANt76MEogvTP
	3flZZb+HmXwUCfIAXbS3PP1eg0uV1iIBBsibiNGLWCubfSJ03hLq5V1NVWlcTdsinBoMJfS5/FXwG
	sKlmby5qu8Jjwk58mR6m1hzxOwvMhypvDIf8WWA+IwrBcll0MOnH4w304BXGODnxDeGUCbhXr1wvu
	gqlBR1+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAsd-00000008MQJ-3qrz;
	Mon, 13 Jul 2026 07:15:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAsc-00000008MQ3-2Q5b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:15:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BCADD6004E;
	Mon, 13 Jul 2026 07:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FC821F000E9;
	Mon, 13 Jul 2026 07:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783926905;
	bh=eLb36tVfJEOKQMQt3uvFaLwJzBn1n6sVBLny6umONd0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Zoof87+itqVZwOMFUw+cS/Xefo1n3/ceC5P4IE47TXgULDYw5nLqzuvf2E9FYS+iP
	 pXLyyWbrJN5CvmtLB6z01L9XC9UxYU1n5roWqCK1q8zPPZMgSLLPTIxzev1+QEzCmY
	 WmnK2e5cDEOPrDAnP74TEPeww1bYljsh9Amp42Tumb4tSzseFuXXW1arTrqqVjoDqi
	 frMAGJ8gU4KQdtqhd/oB7KPt+u1pXvt/PcgSa/zd4cB2Y5w5usAYyaOyp3nTW5wNbP
	 D3z60chlJfH1xaj3QHzEnnXUUW2lfV2w9+t/XAi816L+E007Xyt2eSpMoiqiRL0R9n
	 uI3XSKyzQ7qSw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
References: <20260613-exynos990-peris-fix-v3-v3-0-2b230db78ae4@gmail.com>
Subject: Re: [PATCH v3 0/3] clk: samsung: exynos990: Fix PERIS gate clock
 parents and add TMU_SUB
Message-Id: <178392689997.24587.17631243111899566920.b4-ty@b4>
Date: Mon, 13 Jul 2026 09:14:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Sat, 13 Jun 2026 07:36:15 -0500, Denzeel Oliva wrote:
> Fix several PERIS CMU clock parent mismatches and add the missing
> TMU_SUB_PCLK gate clock.  The dt-bindings patch adds the new clock
> ID.  The second patch adds the TMU_SUB_PCLK gate.  The third patch
> corrects eight gate clock parents and reorders the GIC mux parents.

Applied, thanks!

[1/3] dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      https://git.kernel.org/krzk/linux/c/d5083527908a994496519f5b9098b33460f365d6
[2/3] clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
      https://git.kernel.org/krzk/linux/c/b7d6221aa44fc523c3418ecd94c582eea6e6d53a
[3/3] clk: samsung: exynos990: Fix PERIS gate clock parents
      https://git.kernel.org/krzk/linux/c/a016e89781478e4b756fbf104945d037d0cdc809

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


