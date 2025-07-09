Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE208C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/HwjL2Tz8LLxdow6uaGWhdlj6JyWohlP37RdXv4wuY=; b=qGcQK7SpaQIhrHCcPJys87UfNg
	ihnj5c591Mlblt0/6FqppLa1cNcSTdE797fNisvIiiu2rzsOPOs/QnPrKsjxpWjYwuk1PIxXkpggF
	TmMAi17NQX4EzcW1CbaRT6bR2DPGzCRD43oG6Pk31eiGIsJ5H3XoemnppIWso8whrkSxd+sQ6RU7f
	L9IJDgLNss0vhGLHm3kusJhbYHy+hmIV3TuKKOjzBF32Ywb0g1bgFj3wuMDPg5AiY5sUUkb9oPvhJ
	r3RFIZE8JAG/yYzfcviCArx7xoyuQ51Re1SURLMgDfDzbHP7Lo/WqjyJHqCA7UasB54QrEggjwzjS
	+b5ifDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa4n-00000009blV-2pRG;
	Wed, 09 Jul 2025 19:03:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUL4-00000008hKB-01Do;
	Wed, 09 Jul 2025 12:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A39CD44EE2;
	Wed,  9 Jul 2025 12:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30BE7C4CEEF;
	Wed,  9 Jul 2025 12:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065753;
	bh=qfvfN9HqncnRD9mLmFdxPNtB3Y1t4uk1+PKJGdZGCjs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=h0vmTSF6R6KDUgBJ4nXYA/5Dekeg7WMqU0Cp3RD9bEWQy8RZSTkeqXHuMM6owHm8v
	 GCPmi1hIwXA5M0OKWhBVBgKTKZjmtS9/K7w9HLAh/dcFl8EU/Z5PQTydpJYi5DpVpQ
	 IOcjYmLuK3seTkkxqP5h8i6PuYvtlCTFYsxOL5ArY/0v9Ra9eWW2UiuuefSoLgNpCq
	 dkL9TdOrMdc8k+1xKiiYMSTH3Vak2+lape7+eEeSNAjIAG87q9Bm6aO8Fo2N9eZja1
	 0EQTAvOK95DAF8MZbzTpisGR0bfMJdzBid/giv/pmS1LN9xKhNK+FG1OHnHuVxhL9A
	 k5g2xHWPmcFXQ==
Message-ID: <65fc4a7a9a5dab16cf3c599f93404d04@kernel.org>
Date: Wed, 09 Jul 2025 12:55:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 07/10] clk: sunxi-ng: ccu_gate: convert from
 round_rate() to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-7-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-7-3a8da898367e@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, "Bjorn
 Andersson" <andersson@kernel.org>, "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Chen-Yu
 Tsai" <wens@csie.org>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Maxime
 Ripard" <mripard@redhat.com>, "Michael Turquette" <mturquette@baylibre.com>, "Ray
 Jui" <rjui@broadcom.com>, "Samuel Holland" <samuel@sholland.org>, "Scott
 Branden" <sbranden@broadcom.com>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_055554_064518_AD9C0FC4 
X-CRM114-Status: UNSURE (   6.14  )
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

On Thu, 3 Jul 2025 19:22:31 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

