Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A36C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 21:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtGvbgnCKNG71J9xjIw+TIhRwbYo7xbgUBkwySBKGgw=; b=iVGeorwubDmvOPmUMyd+u840w6
	Rt/HFXZrGZlLCxEn2n8ZajqDxYwEG8Fik2caH/CdPbM3iNfUgtcz+rlYTAIXnCXunl0FLRHd36ugj
	tMtzjeWdaZuQ4LKr6HqZi702ay6T/WNMzbS7MmDIJ3ZxW01iTGoO/nAFiO5m9auTBYvlydoqdsdpc
	5nqcFTEWXf+rFbpXKPTAjOahR1e+Jsr9uJK0kcoNv+7c9LppxHLgzdz4xmq70apHcwyu5bGwPXMlh
	jnk1A53H98X7kBUO8Cs4m1ejX88v0t85BfobAL7UrYUoABGcj2gl/AbmnOaCkPWrhhZdXUZ078xMh
	kLxJnjRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXVD-0000000G9MI-0NnM;
	Thu, 16 Jan 2025 21:34:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYXQM-0000000G8ly-3rvS;
	Thu, 16 Jan 2025 21:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC0B85C5FED;
	Thu, 16 Jan 2025 21:28:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 161E1C4CED6;
	Thu, 16 Jan 2025 21:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737062950;
	bh=QtGvbgnCKNG71J9xjIw+TIhRwbYo7xbgUBkwySBKGgw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=dxoKZU8o+ue9MobT0WFUn9f8V85Kos4J1PxS3O0RHuFx+fmz4jPQ5MCcC8l6wCfDz
	 dKdrGC3f72nD2Oqo0oebXfyKWDjG28/LsGeqvldIZvqsHycT+zAzbjd1sUf00T0LUv
	 mtPgIuJwzBZCL3ToyBPKR6jXnoKgZy3yVO9BPzLdFEeWfI6NNh2ki8A4IYsnpwtWcy
	 DEMKADlOJyNpjAlGSaDejlgaibc8vwO3OnQ9OcZVIHTIcOr1ywEZhnZgbb2i1D+4zD
	 Jcb9gHhksq+a4kDkatrpYqgaivQ6WczF9yIZwyYf1/6oUH/TGo4Qi2LHPqAvrBOt/7
	 KN17axRg9JRxQ==
Message-ID: <6b4b68ae02b64840db8c481e8adb3205.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
References: <20250116-bcm2712-clk-updates-v1-0-10bc92ffbf41@raspberrypi.com> <20250116-bcm2712-clk-updates-v1-4-10bc92ffbf41@raspberrypi.com>
Subject: Re: [PATCH 4/5] clk: bcm: rpi: Create helper to retrieve private data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>, Maxime Ripard <mripard@kernel.org>
To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Date: Thu, 16 Jan 2025 13:29:08 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_132911_000238_86E7954E 
X-CRM114-Status: UNSURE (   7.14  )
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

Quoting Dave Stevenson (2025-01-16 08:24:11)
> From: Maxime Ripard <mripard@kernel.org>
>=20
> The RaspberryPi firmware clocks driver uses in several instances a
> container_of to retrieve the struct raspberrypi_clk_data from a pointer
> to struct clk_hw. Let's create a small function to avoid duplicating it
> all over the place.
>=20
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---

Applied to clk-next

