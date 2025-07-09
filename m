Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD7DC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bdCNOCz9KX1frjMMWfUidrtZSLgstLpmKSiNSQWnshM=; b=c5M7Uwz6wd+JPOU2uTT3nBS1Pt
	S4pTKB39hRa6siqvZnFto6LDfpN6AuFwCTBs8cPtMzyDbMBi7iA73RovnMC8OX2/EUARsXwS99zAr
	DSCPz8Xkb2jrDAoBBzqvRkqwlAdQNo/NAfk6rOZVmOWYr6WjfqMm1Ff4qdZuPLTPD1vy6aEz/kPt0
	9dj4z+eyaazs0IOR/Wbs4k/H7UzjQ6oIGM7De2Ir9huOzE5vTmzHyoZIr5J8AJ+E6ZGi//qnd3kgh
	zvCOuOrBx6Q/iqiNwGv4zYoXznrYBWFC8U0DpAMAtIV4xZyRoDnkQtVEOTP3vDg3fiTS7wok/Ww4n
	86uXMLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa4o-00000009bll-37Bw;
	Wed, 09 Jul 2025 19:03:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUOr-00000008i80-2J8N;
	Wed, 09 Jul 2025 12:59:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD1C2613B2;
	Wed,  9 Jul 2025 12:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44CAC4CEEF;
	Wed,  9 Jul 2025 12:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065987;
	bh=ycNsgGVeVycZicAllgUYY8qE+864AV0icVjw8hF9IbU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=rEkQUPEE+PMftE6ooVo3j+a/qVNlBZ70AZ0RXxDR7+YgvvKswVDkdVvTCxj18Xnd9
	 3uNhd4XMgzPoy41Al45tUyoOmY+EUDTT8Kio3ugifbEYU6X0uAswgx1Ix12Lcm1j3V
	 O4940QibzqRMWmF+x0vw0F1JsGCqpv0NsuPOB04GZ8pmFdpFJbVZNh5fqHzrqH5gEG
	 WwpCGZC5qZlmWP42D7xV8c6RngJtV3zznU4sQtnCewlRQdqSjeC2ewEXTAJH3nTPNh
	 5d/GqTjx9onv7aVXHfJnTdjgS8u95/XjcZ1fnCl5X9du+H/5BqNF9E0PKTNWi51SWq
	 jDGSGgb8oUuTA==
Message-ID: <b5b8a7a1dec9e470d7c6f41ec5e23f25@kernel.org>
Date: Wed, 09 Jul 2025 12:59:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 09/10] clk: sunxi-ng: ccu_nkmp: convert from
 round_rate() to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-9-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-9-3a8da898367e@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, "Bjorn
 Andersson" <andersson@kernel.org>, "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Chen-Yu
 Tsai" <wens@csie.org>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Maxime
 Ripard" <mripard@redhat.com>, "Michael Turquette" <mturquette@baylibre.com>, "Ray
 Jui" <rjui@broadcom.com>, "Samuel Holland" <samuel@sholland.org>, "Scott
 Branden" <sbranden@broadcom.com>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
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

On Thu, 3 Jul 2025 19:22:33 -0400, Brian Masney wrote:
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

