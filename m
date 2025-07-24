Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85A0C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 22:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5wwNSYnHQz8rEHHzayMJYGIkaZ7ofYJ9ZKDth5/Vjc=; b=PERRU/VpIlgqVu2sUTYux6t7Hq
	UCZSWy4xE26vf28Vhyk8Hi50tL5mT6ApIX5GbcEhS5zyL8B+pRG+2a7/PvxXuRWyQDMPpdwUt+dD6
	3KJDcWjHlZ7oIFlpRYZ0ULJMJrm+TLJkmbtErY44V93mtQybMOdoicZYGBZj1/v7x4YfExYnIaucX
	c6yS2exlftKdnu9GclFpFPs+/+Vq1t1K7hB+NhS7RY+dnZ+falAonr/+OiUdJkKu4ndZ3PGSXCOqc
	FO2AgVnNGwx3sSWnMviib9TGX7VzLkLaF6pPa/EpL9wNoC2r6vKc7pO8D/IWCtpP1+GA9MolNpoHX
	PPZBzDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Zg-00000008cSr-0LXx;
	Thu, 24 Jul 2025 22:38:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Ds-00000008ZWw-0Xxm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:15:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83A2F40C33;
	Thu, 24 Jul 2025 22:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A2BC4CEED;
	Thu, 24 Jul 2025 22:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753395331;
	bh=b5wwNSYnHQz8rEHHzayMJYGIkaZ7ofYJ9ZKDth5/Vjc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=vQZAl9trsVv+h51rkUNIy6NbD5mwpTfNRSHgTNjNJ9Jii7ET9Np2KJCuRvqyL9z2i
	 xGcbT0bkh+SWkKxIh19TbFGCwyxpXO4TuGMVMGvYtAngvoEcFog8wX0ONZsbPgv8ke
	 RBCOwWIMBB7IChNhh/2dm7AIdEgc6Eo026WHApa3E8paAKinzFxdktXSXgIs1etdkQ
	 tMs91P3bULBMEJXQ9sQuW+Ijl/073lMf3EeUJ7zeOxRYYvq8XWtX4S60eMk9BUu6Mj
	 BR7Oea+ynJjrVManJ6+joZ8TWLyd8JzURUIgiDJgb5cuvYumj4MIpxhEsff6Z27hv5
	 Xg83Xs1Das1xA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250710-clk-imx-round-rate-v1-12-5726f98e6d8d@redhat.com>
References: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com> <20250710-clk-imx-round-rate-v1-12-5726f98e6d8d@redhat.com>
Subject: Re: [PATCH 12/13] clk: imx: pllv4: convert from round_rate() to determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney@redhat.com>, Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Date: Thu, 24 Jul 2025 15:15:30 -0700
Message-ID: <175339533054.3513.1721914103224553281@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_151532_184031_0E4FDA17 
X-CRM114-Status: UNSURE (   7.23  )
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

Quoting Brian Masney (2025-07-10 14:10:44)
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Applied to clk-next

