Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482EBCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K9tn9Kq4tpdLI9N9hz49uapAKWylQwew2NPmVkeW/GA=; b=1o+OVeIaP4vlTbPN4Qhfxg/2MP
	sJYoqS44AtA6uWKy4rl8hZNEigs0OeGo2Mu8LTjQh+qRLDcejCqHtHeA3RJ9i62IENhusFjpLMOHj
	JUKgbJdG0hpOzM5XjiAv5/KTDvEy/C+zErKiteuW+6WOx1thdyWN9LPus6SgCh6/XOL/QEnFxWg5A
	kM6+Kik6Rv3yrDsZfT7fp8Y++dm+4759c++xBV2VznXVEw9Fx319eRpEF7l36V5kP6Q5WsqP6lWPk
	saVeLADZP2UwHvZJfETQUpVKzo6j4d3VtG+sq5pF5cvQlKCf1Uw5WZjDaSRd7XqdgAers6OCnd9qP
	ePRuWCwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeEZ-00000001LCK-1Dgo;
	Wed, 06 May 2026 15:32:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeEY-00000001LBc-05z3;
	Wed, 06 May 2026 15:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9D1D6013B;
	Wed,  6 May 2026 15:32:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690D3C2BCB0;
	Wed,  6 May 2026 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778081540;
	bh=Z8nEPenX4TJdhrXgJ7ghrwizbjBvQ1xCIwn0oI8yavA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=URVdJszvdIFFyTDuQUlwecaT++vnVVLr0/BQkIc8MD8H2nfKf8gxdYHZbiNHA9Ylk
	 Y8cR0+NjDS5HhyPC+/gwBvbz/dsnXwYh35XLDyio9uIAPxP2YVQ2hUrfoVzFSPjVYB
	 Z7cF09xM7rdK6DhzPETQnq1K/1Q4zw611gAIaF0rV/x4LWgPes/1N1csPAhWdXglIL
	 GVhb2UVOFR/N6MuaPgG0pSmsvq55R7Pu1k2X7UMHS894+L5cW1uQbkhIu4H7g6lW/A
	 /sKevocI26B6gL9hj3xnZ5Er4zySpmEihZHCHxaxH0w6z7aGpCo/vBFtOCGeTTrFl8
	 33/ZbPuCbBHHQ==
Date: Wed, 6 May 2026 10:32:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, kernel@collabora.com,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, linux-iio@vger.kernel.org,
	linux-pm@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>, Sen Chu <sen.chu@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org, Chen Zhong <chen.zhong@mediatek.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: mfd: mediatek: mt6397: Add MT6365 PMIC
 support
Message-ID: <177808153813.2165238.1499393868566610666.robh@kernel.org>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
 <20260429-mediatek-genio-mt6365-cleanup-v1-2-6f43838be92f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-2-6f43838be92f@collabora.com>
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


On Wed, 29 Apr 2026 11:44:15 +0200, Louis-Alexis Eyraud wrote:
> MT6365 PMIC is compatible with MT6359, so add the compatible strings
> for the main and sub devices (regulator, rtc, audio codec).
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


