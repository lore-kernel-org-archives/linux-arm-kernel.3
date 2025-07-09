Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE58CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUP0P94GqoiugjAnBGsGIBJfuvaxQsA/BUMLSkUAPL4=; b=HqNSFN1At/XdhybcjwWfh9zWEj
	Vm5AysNWZUw6cT6mEQXjLmynr3Y/SN8CihS2dqAydL6v3oOsvRQsThyJF4UPbx/PrZTGnpreN9sR9
	/teZ3TiwIuSCJJK6Qw2reh4+/yjhdhvFBk61M6Rzmdavr5aH3uiWTaxy6S/Ri1kswzc7r7FId9tTA
	qqDoc7bv96VrlAforo9eyCee38CvDKfnIvEsKLF/iw/G96EEFlWzBk1856EZ8t2xJLbkmGV5KjLjs
	OthswN7ud3opb6DQA2YBw9LcMx6zHhZqvBFCP1fqszb3MexNnIzwvnLbh0XUjzCZZqqp/we+hZ91i
	XwGNy6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa4p-00000009bmJ-1Na2;
	Wed, 09 Jul 2025 19:03:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUPP-00000008iTV-44tg;
	Wed, 09 Jul 2025 13:00:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17D98A54696;
	Wed,  9 Jul 2025 13:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64AAEC4CEEF;
	Wed,  9 Jul 2025 13:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752066022;
	bh=zjN1EqSs5feHJcr9hvhBaKcrFYs+69j1nCzHmIv8uzg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ZvXiYa6rJqLev/o0yZg+TY9cbsmCPtJJMP11X9Jgw7ypTIu09pi12WmKm/709Q88K
	 lwWVH/wf7rX2RR5P/eG9P0xIdM5E/4eoWjfjdJu3/k9ldQ4cQnXws19Z9TAbDnUiLt
	 vP94LkIIM6rmTv29DC5zqyUOwLymn4FU51ksCcDpPKqvyLrYBqmoezZfXQJuAL/+Ka
	 GpolKroKTkoJbW26qcugH5d7GGPZewiOHUw5EJ79ZRNdf/n/U1TMozosyc7qSI9B4M
	 lRtZfNDIWrT4W1G0YXFmwp99DJ7sRdMOFBkMADnjF4Cc0EMAh8IwI/oaBLiXdDimUi
	 RWPXgXHmyHlGw==
Message-ID: <dbe4b2308a70dfc86a89c65f518fdc69@kernel.org>
Date: Wed, 09 Jul 2025 13:00:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 10/10] clk: sunxi-ng: ccu_nm: convert from round_rate()
 to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-10-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-10-3a8da898367e@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, "Bjorn
 Andersson" <andersson@kernel.org>, "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Chen-Yu
 Tsai" <wens@csie.org>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Maxime
 Ripard" <mripard@redhat.com>, "Michael Turquette" <mturquette@baylibre.com>, "Ray
 Jui" <rjui@broadcom.com>, "Samuel Holland" <samuel@sholland.org>, "Scott
 Branden" <sbranden@broadcom.com>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_060024_079693_50021075 
X-CRM114-Status: UNSURE (   6.36  )
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

On Thu, 3 Jul 2025 19:22:34 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> I manually fixed up one minor formatting issue that occurred after
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

