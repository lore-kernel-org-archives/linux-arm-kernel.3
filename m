Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39ABC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 21:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxFAXLLxjyqKQdbtoQhUNjIrKVDfJGCLmEBnzEYlBI0=; b=ugJUCkH76tcCg2G/5mXG2Zt7bY
	CBkR49IfaduLtFmTLVtq0CFlY8brMfPONyctWSuUxN0lIqKZJqQpv3eQB0rS1BFyKWTXgRuAQTVO3
	7ACy2+NbgH8aAeyIHlltxoa704UP+Lqvs5m2ztOF/bsKjiKV1noWc9JxSCE0iVTD+gZw6/z5y81mo
	7ytyQyfIu8zmDSaiTAfTdlz6fw2koDueTPX9jpBy8i7Jm+blOGRtfe07JerMX4w+WV5eiX9YTWWq6
	H1ufp4Vam+I5p1mO5HcqiaIzrPYiiUAXTXer2W68d4sEtbRCJmH6SPP0Oh9UicpN82eml7+8thlhA
	PtrsmByA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGtm-0000000FslM-2n95;
	Fri, 27 Jun 2025 21:46:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGoj-0000000Fs8M-1ipp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 21:41:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB6E843A4C;
	Fri, 27 Jun 2025 21:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AF9C4CEE3;
	Fri, 27 Jun 2025 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751060464;
	bh=3oXq16alLr2nxtGsTFfoEGRR7gxgyYoWYgqZxLOZzs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dN9mwFeZPT7JwxGHE4dWUQZAF4GxPqyzFm6eryAnlLNFZfVVNmi5QK5zjzBA+Th5d
	 g8o++TJeOe0lEoTkudPKFxP56TyZhhOZzukJM2aKk9x+DswgJkBhwdQ9B11aba7Cn/
	 +u5ifsFlNcp5adThOkEIEtfjxVQzC+xR0979KalprhiA81vf09dK4ZFhQkR5+CKObq
	 SIZOV0orxaK+5EfL0Moe5tQJgH41RsGfAuw6lEOlYRA4qAJYT20xMOmmaUGu6LW3rA
	 RM6Zi5c1orSB3VPQCpNW7Bj5DvLK2ujsGgRYfs7KeQDDJIaa9e8HGDOV3ya1mn9BSX
	 pFawy5P3w3uvw==
Date: Fri, 27 Jun 2025 16:41:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Inki Dae <inki.dae@samsung.com>, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	David Airlie <airlied@gmail.com>
Subject: Re: [PATCH v2 11/13] dt-bindings: samsung,mipi-dsim: document
 exynos7870 DSIM compatible
Message-ID: <175106045083.188354.11616800580280221197.robh@kernel.org>
References: <20250627-exynos7870-dsim-v2-0-1433b67378d3@disroot.org>
 <20250627-exynos7870-dsim-v2-11-1433b67378d3@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-exynos7870-dsim-v2-11-1433b67378d3@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_144105_468828_274C0BED 
X-CRM114-Status: UNSURE (   9.31  )
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


On Fri, 27 Jun 2025 01:09:00 +0530, Kaustabh Chakraborty wrote:
> Add compatible string for Exynos7870 DSIM bridge controller. The
> device requires four clock sources, in schema they're named as "bus",
> "pll", "byte", and "esc".
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/bridge/samsung,mipi-dsim.yaml | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


