Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B887C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vu0ZYH1uAtmtDgNry1u6Sxbl9UtwPaj7VLsq2ucptM=; b=l7RZvcQaglGzYrF4BdI34RF9MO
	oLJk18Q/m66ytQbyD5g0mfFVNA0fxPvZcPNrlbabJE8/MKLoTz93bPLugRrNWoYorUzciO/BELLcO
	parOQGbePYclhZAIbVKzxlU4PWXa8EyzcL0+pa62RSnxorEB6Aa12CKYG0WeEazrXf2tH6r6sLCG1
	miN5vb5tKjqDBcLtr+IOIgJPL+bSe9kdXz7jaO+AxjkELfZXmmoKwI1e89KRbpxn064rzHBvN9/Am
	I5xgzZc8EDbKGc4tKBvjstE4L7ENWFgqYnaulcDgrZC4fadSjaoB0oQ7wvXgpqVk3igxY+goazVDd
	VATHOC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4qW-00000008dbt-18Gm;
	Thu, 24 Jul 2025 22:55:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4EL-00000008ZdQ-3WYY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 68C1F45756;
	Thu, 24 Jul 2025 22:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8BCC4CEED;
	Thu, 24 Jul 2025 22:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395361;
	bh=0vu0ZYH1uAtmtDgNry1u6Sxbl9UtwPaj7VLsq2ucptM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=POCH5LD6VIX+jWBiUh+0sDSNstIDYCCroNQspZplXFXELEsxZCevq3kZ2rLnHOekl
	 ZkSi6TmCRB8SNtDAllCTQ7TbZggLAZ2BuGarv8Jgis5/swj8wnOue31sPD1QnRBgbx
	 4ZdT174ZbUYTCZRAaOHXyL/oZ91k5Ic8JsmAmByPSNJBkIAiBw0ygKTiJfFG6OLkRE
	 e+mmKdpk2QqWbOnpuSMPTfwOSEr2X29axqd0p78WEIr7UudNL8AYjkF5TjlZakrPzF
	 IvblYAc+lb3FR3ZjrvOT3h1jVwWT5Noh3Jc6/qcwQ3hTlo6ztZ2X26zjj1ACyYWpGM
	 cTYcxFPJvtr7A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-5-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-5-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 05/13] clk: imx: fixup-div: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:16:00 -0700
Message-ID: <175339536047.3513.4426298851401733688@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_151601_897493_4231A7D9 
X-CRM114-Status: UNSURE (   8.36  )
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

Quoting Brian Masney (2025-07-10 14:10:37)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> The change to call fixup_div->ops->determine_rate() instead of
> fixup_div->ops->round_rate() was done by hand.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

