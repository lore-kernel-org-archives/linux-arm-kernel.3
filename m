Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB4CC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAOBmpOtdxPPvzIH6qwDi7+1fhSxZmdUYE8fD3ANbBY=; b=dNOQwei+4pHr2cuNR0JYEvUSv2
	PLooxm9wBx0wJlsTiwcTBcD7AxxW1O5vsVDUp/z0Rf095EgCk0b+1AJsfgQs+W5pGya8Dw1tPc1d+
	un2P+c5puOjcO7zwDMgllsVWzbAk+9f0naJ61kLHp1Ug6sr96xgLGT9TMzt3TgOzGzwElB70xv9Dj
	4w1+wVbmE7Ca+FY3LgNQOeNF8a01pm5ILmuFSfIxh9Fzv3X77i7xJisdpZU7+DpJmRj2Rm2XnS3RL
	gHkXH7OqgaSwiHNm1Wi8WYv7Yfshn2q+9vN6TIYLCwd4MZFK4NR7+G2yon75qAfn9WCwOzqpfoz6E
	SF6rmiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3ar-00000008VlH-2IUC;
	Thu, 24 Jul 2025 21:35:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3YR-00000008VUQ-0wTh;
	Thu, 24 Jul 2025 21:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63A4D601D9;
	Thu, 24 Jul 2025 21:32:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084B7C4CEED;
	Thu, 24 Jul 2025 21:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753392762;
	bh=IAOBmpOtdxPPvzIH6qwDi7+1fhSxZmdUYE8fD3ANbBY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XoAd06lj/eeWJ5GgSpM3NPc4Gg5SL9Ui2VIAcWKfe0A5rQYrPaLmc/w3iBbtgJhG8
	 PiYAsjXvUM6mBRCPoQ87yptu0fhZI8AIdC8cU9cTAXsyVKWO61xmJFDZhBc5bClgnq
	 VMAFx4NsXVc5UtG34o2+VqZYmdBB73mMOeD+o16ECbBSrS6+eTJJsigpzQAZ+XNOE/
	 Y6rgXQqyOBpuZkHU/tgfRLaFwCuIyGw3NPHIensUHPMKdtZOnTCBB4wHaTwkGfy7Cl
	 +z4F8N6h+9twETCo5BHwYlBYcIUV8lU6Gu9WV5aucfP6ThpWcxq5b7o+01LB98dw7a
	 sfyhTzvr6MgBg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-0-3a8da898367e@redhat.com> <20250703-clk-cocci-drop-round-rate-v1-1-3a8da898367e@redhat.com>
Subject: Re: [PATCH 01/10] clk: bcm: bcm2835: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
To: Bjorn Andersson <andersson@kernel.org>, Brian Masney <bmasney@redhat.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Chen-Yu Tsai <wens@csie.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maxime Ripard <mripard@redhat.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Samuel Holland <samuel@sholland.org>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 24 Jul 2025 14:32:41 -0700
Message-ID: <175339276117.3513.1051998064079293542@lazor>
User-Agent: alot/0.11
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

Quoting Brian Masney (2025-07-03 16:22:25)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

