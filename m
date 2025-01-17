Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91922C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 08:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qre+3WgH7qyxey/adp9pn5sVdyzkbxz0RGZWNda4QHM=; b=WUbFmgaNUw2rjHvX4NazZKXxF+
	ME0RW/pM0sHTnudYmdvRTjTP4FkniCOfD87gqOlpFBEDPLsrB1/J2xdi5PS1Gi8f/3CTLkYemkwnB
	qgAGf+9dBrw3/at9/VQcid8pRpiQMS/UceldkmSvENRiorLOzeWzPCxSKSWrVzPw2oInFCsM+dZr5
	NDzlhfidDXhVxzlO+svRN+Ye5N1tm3RJ5r2nV0t/LjH/5S2RWVtAOfd0X5RlRJ1snrF5QYtVcOQ6m
	9Aj6tN8UjIuHJRkQvb0fv7d4DEqJ8L0au9M0Kl/SY2CM/PsOAZ6CKKlWPPztOCd5l9yyKr4dEXtDV
	HCycLWAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhJd-0000000HHLC-2enq;
	Fri, 17 Jan 2025 08:02:53 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhID-0000000HGwv-2Dgf;
	Fri, 17 Jan 2025 08:01:26 +0000
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id DFE572E002E;
	Fri, 17 Jan 2025 09:01:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1737100884;
	bh=YniXUGeOea5s0/pHgde64c+kqGE6B07oghaN1d950FE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W3r5Fu9OKGEPvfivVZEcb8f/DZi2mMF12MYvsqFYcM/juUAXw3Y2YS25JF2WFEE6F
	 e5MetfHYzk1jJWs0CTSBtphPsGgg6WXLly0vEomNkBGA9Y8ll46bFwazPpuFT7g0+T
	 /lV9NCAGnL93FGazDxHRiBisggDo/Fq6buYGhP/R6HaNDM9b+rcKHd2vgO3ZrQW1qi
	 PoEzBJEwXIFOKeW7gGQexDOZxqh9AUD102OjODMa6YfkOS68HrgyEV3pQJq8j95186
	 8fmf2s10D+hqI/BLfwQhQM7mYVvFWF1nX8DC2nfM9zKVPAZYn/orbWLRMQvSjWsYNS
	 ktSDE0O44nizw==
Date: Fri, 17 Jan 2025 09:01:22 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] iommu: Use str_enable_disable-like helpers
Message-ID: <Z4oOUvs-IicjGs66@8bytes.org>
References: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114192642.912331-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_000125_806054_0B40E25D 
X-CRM114-Status: GOOD (  11.80  )
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

On Tue, Jan 14, 2025 at 08:26:42PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ++-
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 3 ++-
>  drivers/iommu/mtk_iommu.c                   | 9 +++++----
>  drivers/iommu/mtk_iommu_v1.c                | 3 ++-
>  drivers/iommu/rockchip-iommu.c              | 3 ++-
>  5 files changed, 13 insertions(+), 8 deletions(-)

Applied, thanks.

