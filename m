Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230A1CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2rqIr+LgGshncbO7xceBtAOju06mv+lbKaJwS0PE62M=; b=RUCZCHiX2vIyuIqNHy7jAPwKH6
	69f6HR0u6q6qvSCf6WnESK/j45WdJELhefDmwl0d4m6zxM9ZhC8F4OVKCeL77SLK80bMNfFVLwuHC
	LQOI2j2L0Xu+ug7z5jHz+gnhfW+r5T10NLo/2zE30mnmVaFm1s7rQzP8xLKF8cDoF/GXNoO9A04WT
	xxLWi4mG2+5v0Pw7u05F8692VXsg35lgWCfruOLOB2IQPNKK6hK/SEtCui4LemIP6Bqvn/TdLsYUX
	jkAhzOwlPfoAtU/1xJ/6mmm/kCqFWsvQfWaXyIBSQ5Y03xEd7RzHNpMTMg4CdvFYzh+xCaQe2Llyp
	39LcsDRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjTO-00000004KdR-0Jlo;
	Sat, 23 Aug 2025 08:19:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upXdg-00000003OSx-3fow
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 19:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 537226023F;
	Fri, 22 Aug 2025 19:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3053C4CEED;
	Fri, 22 Aug 2025 19:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755891688;
	bh=eVhTL55Cm/6jgWL3xyRWgpeQ5O3aDDaXksPPEMZoazg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYJUlVdBFQggbK3gCHZQDTQ8fxT/62u5/b0gxUqtbAQPqmsBxzbR6pok+E9S6CEq5
	 j9e/wZ3BNvumE1jzvZp/903YJMNqvdRUvunfyEiKM8rE92d6RJuRwdGHFAu0zSog0f
	 uq6ZMyWU1CgNbCjd75iA4gO6JW3XIbyAMSMVcwlw859GwPHsbDKY9E/qh8Gv9kkK7G
	 vEs2SRklIfM9kyITlDd5jAqMHxhRjd6uRoqh3JOdDVBzDnjvxV54KjwE0Mpr/qlv6H
	 rIy1e0plUs1zMEs1d844I/eGZYTlHEDaWU/QQaL3LE1MFV/9jxPrQ9/ocw9SLSN7yR
	 yjGz2ty31vNiQ==
Date: Fri, 22 Aug 2025 14:41:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ravi Patel <ravi.patel@samsung.com>
Cc: linus.walleij@linaro.org, mturquette@baylibre.com,
	cw00.choi@samsung.com, gwk1013@coasia.com, krzk@kernel.org,
	linux-arm-kernel@axis.com, kenkim@coasia.com, inbaraj.e@samsung.com,
	ksk4725@coasia.com, tomasz.figa@gmail.com, shradha.t@samsung.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, pankaj.dubey@samsung.com, arnd@arndb.de,
	dj76.yang@samsung.com, linux-samsung-soc@vger.kernel.org,
	conor+dt@kernel.org, jesper.nilsson@axis.com,
	mingyoungbo@coasia.com, hgkim05@coasia.com, smn1196@coasia.com,
	will@kernel.org, swathi.ks@samsung.com, krzk+dt@kernel.org,
	soc@lists.linux.dev, catalin.marinas@arm.com, pjsin865@coasia.com,
	s.nawrocki@samsung.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, hrishikesh.d@samsung.com,
	alim.akhtar@samsung.com, sboyd@kernel.org, hypmean.kim@samsung.com
Subject: Re: [PATCH v2 07/10] dt-bindings: arm: axis: Add ARTPEC-8 grizzly
 board
Message-ID: <175589168671.193824.7456670123807424853.robh@kernel.org>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250821123310.94089-1-ravi.patel@samsung.com>
 <CGME20250821124050epcas5p22b08f66c69633f10986b7c19b3cd8cb4@epcas5p2.samsung.com>
 <20250821123310.94089-8-ravi.patel@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821123310.94089-8-ravi.patel@samsung.com>
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


On Thu, 21 Aug 2025 18:02:51 +0530, Ravi Patel wrote:
> From: SungMin Park <smn1196@coasia.com>
> 
> Document the Axis ARTPEC-8 SoC binding and the grizzly board
> which uses ARTPEC-8 SoC.
> 
> Signed-off-by: SungMin Park <smn1196@coasia.com>
> Signed-off-by: SeonGu Kang <ksk4725@coasia.com>
> Signed-off-by: Ravi Patel <ravi.patel@samsung.com>
> ---
>  Documentation/devicetree/bindings/arm/axis.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


