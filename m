Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3297DC9831E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 04:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ez96NEwvtT1k9tGbEFCVRqt3OZGVg5le4zsDZGm02ag=; b=HZoxk38DZ0agdvn8gXFtVkktxW
	xw9pDsfTm3oZ+Z2FHrsZiNojFJcnpt4kvAKhZoF0FH2bHpM5rR/j0NpO3rxhsh3jJlV2qC4KPmC7P
	t7iCc9ZEBIyuxtJZXARXjT7BASfg8hs87pMQfziv6Itdh+/Kapp1eph3VVZalm6HvrSdXEooo69o1
	XClzinQErmfYBppXLAns9l6iNx2UFf3DubIxDiP8+/+uoZ4SB5fERM6oy8esyw+pLedhGsXEIfcbc
	u/xw2Y6qpWHJ9obgP+vz/LHu5fv0UaIT6BCskQDYkIsjZm8Xq4wj2Cx7HrVhFgZVAKCua+IycBjnY
	Ayzc6hFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJdc-0000000EvqP-3MfQ;
	Sat, 26 Sep 2026 04:03:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJda-0000000Evq1-3t7h;
	Sat, 26 Sep 2026 04:03:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B64243AA0;
	Sat, 26 Sep 2026 04:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB071F000FF;
	Sat, 26 Sep 2026 04:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790395425;
	bh=Ez96NEwvtT1k9tGbEFCVRqt3OZGVg5le4zsDZGm02ag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MJwntA0ZZjmKHhtCfYKPc1LdDWePisGyWu8LaXPwzLQ4Pfts2Xg//JV1tbCUu3BsV
	 qop38+KgeqO3AENA5+YDBY2UVXMb7iMwLCFaiyQlKE6EO2ZrR07dc4fkC1eZp+JH2v
	 pHaAZos4DE401O3IAgWfuidm7tqXPy8/aa+Bris7KcAYiuqn/saDuRnuqHs68iWnro
	 MfuSof7ZmnjBSVZww9WmbvKE2UWTSVwiWARhSVmPjQGDRwNU9pKFOTZzncjIG9oCo+
	 rQZWESHElx82csYwiw3KEFFE8IdJrEeERI4EJm2njWFBVjoN5HhZMT8yNraHiLaeH8
	 iXG1yAE6+ulRQ==
Date: Sat, 26 Sep 2026 06:03:25 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Yubing Zhang <yubing.zhang@rock-chips.com>, 
	Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v15 11/16] phy: rockchip: usbdp: Support single-lane DP
Message-ID: <2z4yirs6dzf34ajrc7u4gv62v466iusxt6lqam6zjmxmbutd6d@fwdwmcvtiv74>
References: <20260915-rockchip-usbdp-cleanup-v15-0-80e2c11d1ce8@collabora.com>
 <20260915-rockchip-usbdp-cleanup-v15-11-80e2c11d1ce8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-v15-11-80e2c11d1ce8@collabora.com>
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

On Tue, Sep 15, 2026 at 03:49:58PM +0200, Sebastian Reichel wrote:
> From: Zhang Yubing <yubing.zhang@rock-chips.com>
> 
> Implement support for using just a single DisplayPort line.
> 
> Signed-off-by: Zhang Yubing <yubing.zhang@rock-chips.com>
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

