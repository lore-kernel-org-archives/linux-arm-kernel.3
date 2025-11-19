Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE20CF31AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvxWKZEp9IR2CgtGA3sY+ToU/Peuu1kn/43AsE8U4rw=; b=YB/+5k+My6geyzagmu2tSH+zmv
	JEQgRmW9UQkUoV2cfBZQ/B1jgEvgAYxrdyJfe5hhr4riq85XWRhIpC+5sSbQEpt1SYnzOEYwax/li
	v6j9XpFlahHa7Q6Ip6yVyA/5ToCMxKgEZCpC101lyhL0NLxtyUi4jyr7J8DZ21C1bdKB/Xhe1xvWa
	hoSkGuaYj5rSJcBnu7SD61UzTW62MJr01X321llnWrXTZQBtWimINW5j+0pZTaQQm/pkBcQ5F7FYr
	blWyNnfyxdUitE25pmsEPsLn2sXERSNcMffkrhHT0UnHPxydCPkqXb8hlBZqEwRuYtJ7mSzVt+mpb
	f6sWkv6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgYJ-000000033KE-2IPF;
	Wed, 19 Nov 2025 11:40:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgYI-000000033Jh-1kFm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C32F60166;
	Wed, 19 Nov 2025 11:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3CEC19423;
	Wed, 19 Nov 2025 11:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763552445;
	bh=o2KQ6vpiRdYBwwouguh8StR9fcwrluECWZKRouQdfnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=odgQBWAp7oBg0R5yUNM/NT9qiFkS/ksWtWGSDC+syhqBS5wZKvfjUwjmyJSHgwZrc
	 +UyJbSW3U7JldA7LmqQ7fQfBA4kB2XjPbiFskw/WalaImK9DJ4cP5j1/vqBeYtAnc2
	 MekZsx4BVpugRjjRWCr7U5nB9XFPhKFgHj4HoOmvPI/E8ZemXXV5xqTx3MGidDE8ML
	 2PypJ6Omt25tV2Jpxhb/OHDdJwnEXRK+j67vLUt2cD1AoGtc2Sa3MH3RbLupvNCAs1
	 LymkpPnPSur7Hw5qdsNypLqfdSa/zh2akyjFPs+tPCYL7uEsHam7xRPmcU3Kl5KRJU
	 G0VHPj7T0An5A==
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
In-Reply-To: <20251029130731.51305-3-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130841epcas5p404125f4d8ee865275a73b3bf9ae6cf52@epcas5p4.samsung.com>
 <20251029130731.51305-3-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 2/4] clk: samsung: Add clock PLL support
 for ARTPEC-9 SoC
Message-Id: <176355243758.116968.4431179201603632884.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 12:40:37 +0100
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


On Wed, 29 Oct 2025 18:37:29 +0530, Ravi Patel wrote:
> Add below clock PLL support for Axis ARTPEC-9 SoC platform:
> - pll_a9fracm: Integer PLL with mid frequency FVCO (800 to 6400 MHz)
>              This is used in ARTPEC-9 SoC for shared PLL
> 
> - pll_a9fraco: Integer/Fractional PLL with mid frequency FVCO
>              (600 to 2400 MHz)
>              This is used in ARTPEC-9 SoC for Audio PLL
> 
> [...]

Applied, thanks!

[2/4] clk: samsung: Add clock PLL support for ARTPEC-9 SoC
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


