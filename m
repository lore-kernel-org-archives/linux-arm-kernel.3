Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A01DE9B252
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 11:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBQcgK3eC7v82CAXBiKQULeZR/0m0GYlvhbOs6Ag2dg=; b=xZzQCN8Lvt31EfXzBv4Fu2Byig
	KbazGHqMVU6Kd7fCxIQP2j/wGQPv8yrQ0YkiEPo1mLIK6DvTiHAFeWuV91YiOLD+sdaOyUdrZHpYa
	jrFo2YN2xfMmE3vV5z8a9MLaCxJo2pGPaC8ALKwy2fgm+18f8I1i+UqmsHKXsUDpAKXRhy53dwnzo
	GkIYQRIoUnQ4v4eVJQzfEeL6Ut12TY33p8RieUXKGtyx1tx0qIN2KUo9q/cvd+fkxG0UvBbffLPJK
	UNubIiR1gvn4WlNsbc2luFFjzgtM/00jPDLvmdfsQAoFlfQqxEmjxiebFGIngStDE4/sUP7+If/8w
	G96R6x3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqn8-00000001ztR-3Es7;
	Tue, 24 Feb 2026 11:41:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuqn7-00000001ztL-1Qq7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 11:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C6A86132D;
	Tue, 24 Feb 2026 11:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B342C116D0;
	Tue, 24 Feb 2026 11:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771933284;
	bh=1g/1lWEC4KmpoUAN4DrZYJBxYp3+OnwE2eiZQSewiaw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qqPq5G0KG56/vM/1brvKDwfj2nQbmVAU8a3h+u3AnKK48B7rRhd+5GEo9qSAw9vIk
	 Wru97eBz0B+bmI5Wgx0ieGifOWZQ/p31QI8+4A0ouVInuPFdzfAHpxZFoktWEfgZ+l
	 WCqAqEDMeBa08i9XBEa8dBVX/uGhFXJ4MxidvCuMKUrhzxOogZHVK+xzQzxK3i5zvo
	 mCPytp19G9hMTwpxsIZ50UOx2n9Nyeg/dJP6jqGppqnQ00y7pg27o5GlZIBvinRbMt
	 Op5EAnkVM6js0ei8FcJk+4jxmsRSDiqzkLS7twq9p9oJfujX0RXDujyblnmJqieDs4
	 P1x9GKuuVntJg==
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
In-Reply-To: <20251029130731.51305-4-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130859epcas5p41a6ca2132b576687c89c6e0f07914750@epcas5p4.samsung.com>
 <20251029130731.51305-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 3/4] clk: samsung: artpec-9: Add initial
 clock support for ARTPEC-9 SoC
Message-Id: <177193327821.57323.11275739203663152206.b4-ty@kernel.org>
Date: Tue, 24 Feb 2026 12:41:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 29 Oct 2025 18:37:30 +0530, Ravi Patel wrote:
> Add initial clock support for Axis ARTPEC-9 SoC which is required
> for enabling basic clock management.
> 
> Add clock support for below CMU (Clock Management Unit) blocks
> in ARTPEC-9 SoC:
>  - CMU_CMU
>  - CMU_BUS
>  - CMU_CORE
>  - CMU_CPUCL
>  - CMU_FSYS0
>  - CMU_FSYS1
>  - CMU_IMEM
>  - CMU_PERI
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC
      https://git.kernel.org/krzk/linux/c/85cc5be65b82481d9eb14afb6a6d52d5bde36cb0

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


