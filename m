Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C500C83F12
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MX49A95ZiqBkXz1effRXpIukPK7lw+rtdHdvAK9po9M=; b=mN74CEcpU5uboCIzMR4PqSJ4hn
	6JGeafIOrOwW2fT+XWWUy1rKz4SsWDYX6fIj33fEoAsOqCzhU+e5ndQQ0Q2pLiIjG3mfDmBnG/QFS
	lJGPxVBC9pZ73dy45MBtSLXj3oiBE1v9Gxw2rGT5OYb94pcyJb7UeUTsR1CQGhCLXcw106xJVbDbf
	5W0FzNwk528ZLt11m6vdeeoSCq5D4X7kwgY8Zzm5VnNQ7yyT5xBT3UVKskmW6NA1Y/YfkjsW2vX23
	oOlGOqG4sNZT97kvko10v4snGNzjjho+fxTeIGdOpHtMCBx7EHrUKZV1w1k4VMdv7cNylew/yhrdI
	egfzDC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa4o-00000009blh-101m;
	Wed, 09 Jul 2025 19:03:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUMB-00000008hOF-3omj;
	Wed, 09 Jul 2025 12:57:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6019F5C6635;
	Wed,  9 Jul 2025 12:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B542C4CEEF;
	Wed,  9 Jul 2025 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065823;
	bh=2/FdBoueMUahpft/Utcj50C7B9vm91jFr9cMwoTzFto=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=GgeIWIRyEhmPGo+uq97DiBEXkAL9cTo1o6wcJR0pHiNKyD1LxfF3wOj87znI8LzEX
	 g1PsjCNChh0Fjrx6EDUvOlnIQotWl0pojaXTki7JidrRVTvVpDmi6aEx7krfWD5B1v
	 p8TOXofq1H+zvzIbGEb7TrG42bXl0kHAJ46or1Wg1OQkZiEh/aT31Jrs1BwEpvbqry
	 HA5HCEOzTjm0lk7q5ATIOMfKDQRRQ5aZSLPpDs1nYUcwPWUxpc8k+VG9g6q8dYM/El
	 Lj1En8q8TkoCzvKbYmNJGSKeD+lohstXPYA+6IdjciQTPuUWQR0ozXq6DsV+2n8DXs
	 ruDUWPDfTcHEQ==
Message-ID: <543e6dbe26b751c6d9b69ca2137a2d50@kernel.org>
Date: Wed, 09 Jul 2025 12:57:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 08/10] clk: sunxi-ng: ccu_nk: convert from round_rate()
 to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-8-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-8-3a8da898367e@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, "Bjorn
 Andersson" <andersson@kernel.org>, "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Chen-Yu
 Tsai" <wens@csie.org>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Maxime
 Ripard" <mripard@redhat.com>, "Michael Turquette" <mturquette@baylibre.com>, "Ray
 Jui" <rjui@broadcom.com>, "Samuel Holland" <samuel@sholland.org>, "Scott
 Branden" <sbranden@broadcom.com>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_055703_991967_9DFCD077 
X-CRM114-Status: UNSURE (   6.34  )
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

On Thu, 3 Jul 2025 19:22:32 -0400, Brian Masney wrote:
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

