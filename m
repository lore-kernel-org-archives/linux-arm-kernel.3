Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BDDC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 15:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKvAnDiPrNZOEp5sF2uVhQltDC0NC6u38XtrenWgLJo=; b=qYTdYMWtiE/KlUjulTYolwaBTT
	VwEp309cRkwNO+KrSq8je/hgxm/AziE3r3bg82fe7lblkD3aA0RhpVkfkiCujzjZmv7Z1bXI+8xzo
	X7xlINdB3zVT4C77REBFtfwq5ZFcBxHquI3VyG59oQahbNUisvz9LWF/vrsvY/LWo5bwLGwwdnudI
	jkN4kEErJz9KPsBkm1HLmi+0DRDVxruaCXjax6NsmnDlXxnF5V5GOB+grp+g+67yIcKa09q5glyX+
	NMKU58/lxcy3JgXLFfokOKb8N/fWVUAM9HFPer8kIJ3DbqgOcSVfO2+aeXBARXkk+isohcBVXwZg2
	JQvqggAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWeI-000000099Z6-1kfJ;
	Wed, 09 Jul 2025 15:23:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUKa-00000008hFA-1Aoq;
	Wed, 09 Jul 2025 12:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 892505C68A8;
	Wed,  9 Jul 2025 12:55:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEC35C4CEEF;
	Wed,  9 Jul 2025 12:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752065723;
	bh=Zh8LvONHdmGvRE4Yc4ww2qFIsqRlv00+9BzFh1Du8ig=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=l/vc0fqB0pDvdv2oHRma7pF8ljkaepoQK96Vw0Nro6kSZq4CFQT8aSJIXj5onFI/2
	 HMGg8fVQNUlDMsmKXU8AtbKHtmOyoExKr6yTE9eYUkfoP4BC+KHApx7YjkZBhzbP5j
	 qERNKlPKSBtmwjd6KQ793pR4F7Dyg97XAjf7pRMZPLqXD1CNgm4btk2h5SGS6EGUWY
	 BOiYRsJomBp7DtzmBTAui0C8qrQ93d8vRJkaBdT4E6rc2RvH9lS7rcbyOrROEsKg3U
	 o7iHH4mxYuXbxgq0BD/O32Nre6aH02zsVpS9+Q2F/pYsAalja3ofF2zjTjc4ckSbvF
	 +pdr2pNGm+QRw==
Message-ID: <b1bd9768ffec3f6f5d48e9148e8872ba@kernel.org>
Date: Wed, 09 Jul 2025 12:55:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH 02/10] clk: qcom: gcc-ipq4019: convert from round_rate()
 to determine_rate()
In-Reply-To: <20250703-clk-cocci-drop-round-rate-v1-2-3a8da898367e@redhat.com>
References: <20250703-clk-cocci-drop-round-rate-v1-2-3a8da898367e@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, "Bjorn
 Andersson" <andersson@kernel.org>, "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Chen-Yu
 Tsai" <wens@csie.org>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Maxime
 Ripard" <mripard@redhat.com>, "Michael Turquette" <mturquette@baylibre.com>, "Ray
 Jui" <rjui@broadcom.com>, "Samuel Holland" <samuel@sholland.org>, "Scott
 Branden" <sbranden@broadcom.com>, "Stephen Boyd" <sboyd@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_055524_367234_D7495A54 
X-CRM114-Status: UNSURE (   5.95  )
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

On Thu, 3 Jul 2025 19:22:26 -0400, Brian Masney wrote:
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

