Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8CBCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 05:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iem50jJYwR/hmi6++magwhX1fEYgWmzgZ0K87gHbmao=; b=BhISWyEFr/M70xOm9hSYbbvj2O
	jMno2S6TL8OMnpYNoiVnmZxXD9w0joTDbLlbxpTyYDrei5XVfl2fO0avkSOXxklyIVkXuRCJfyvIQ
	idiTwbgR+vHvN1UEKMmtSXIE2TZ+/j//HhvqyQ5ztr58DmRhfHu+Z76XcXqUzSmJiHuCWgjz+8W/Z
	8JVxH5a91Zh2vpZxl3YMiefle2k6CZRwL2immRfSDWe9Bq6yo5UfiR0tSUtkvcYpW5++a1F1m32Nk
	UzaMZ65Rr6K3VQjVjmpTbguHHzJamngGo+z1R4KnF3/tgXdAiLxvizaGqKJVduRBqvodckYbOE+ZV
	xLiev5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqUb-00000004pp8-4990;
	Sat, 20 Sep 2025 05:50:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzqUa-00000004pov-0NgQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 05:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AFFB6013A;
	Sat, 20 Sep 2025 05:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DD4C4CEEB;
	Sat, 20 Sep 2025 05:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347438;
	bh=Iem50jJYwR/hmi6++magwhX1fEYgWmzgZ0K87gHbmao=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U9EUZMsqdrtF+r4nqA8DGSHjcJCH+wh37RuQIdT1/D/KSRXUB9B4HrV01MST6tiJa
	 nPmz3xx7S5k0usLpyZVINcf3Fxh+wMUVdtAXtczcn8ru+jbzou/ynEtcw17zu13+5i
	 8WOwh7T6xPNuUwV+FZnYVTZI/wWdY/6WZyO6qRtW19zFH5mtB9HP9NCy1iXjAN0Dl/
	 SXTchGXhs12p6Kt5h8dhFV+fSJwdaUJWyEL1+o8go89UF96m++nB//k+E65dNw8+xi
	 PsSjE7lQgazRrPwgn0j0FYiqH9NWXBklwFRZdkm2JhqtU9O6yg6gZTZMJGGY4xfe8w
	 mcSdAhXgJRxAQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250728070446.949095-1-ping.bai@nxp.com>
References: <20250728070446.949095-1-ping.bai@nxp.com>
Subject: Re: [PATCH] clk: scmi: Add duty cycle ops only when duty cycle is supported
From: Stephen Boyd <sboyd@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, imx@lists.linux.dev
To: Jacky Bai <ping.bai@nxp.com>, cristian.marussi@arm.com, mturquette@baylibre.com, sudeep.holla@arm.com
Date: Fri, 19 Sep 2025 22:50:37 -0700
Message-ID: <175834743791.4354.15798053146130121164@lazor>
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

Quoting Jacky Bai (2025-07-28 00:04:46)
> For some of the SCMI based platforms, the oem extended config may be
> supported, but not for duty cycle purpose. Skip the duty cycle ops if
> err return when trying to get duty cycle info.
>=20
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---

Applied to clk-next

