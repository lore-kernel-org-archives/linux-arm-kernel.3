Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E9CC369AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsX5XljV6QePI6cGVpSn9hJGeAJrXJQSLw/JiJg/tm8=; b=HtRZxJdJGoSUuUXJ7uVHeHnJRH
	QU5oTbT37ah3UibnelGtBh1ctnj7k/mXpINWgRryiOWuNzdFXwOLGBndORpucyBVRTCK5OloWboO0
	dYTZ3tqDthwDnXQCt6/QYJLpx0qmN9JZTFL+IhxyS60skcxS9uEcTFGHoLA8qPU5I55g4sBnCURsG
	4ZbppB9OfgpvzBsIRnEdct2uhQR6rnNK6aRkRCKO5eeS1O2Ijl5pNa9lQ66FxpLYA0GGiOILHSzUj
	J6KDSRJ9CqdZmywpeDv8DOtuWqQguRxRlTH86qNfkfis8ooxwuGZsFhB/1KcF9Q+EueGB2pKvnP2u
	HT30Iz9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3CPj-0000000DV3y-1YiT;
	Fri, 11 Apr 2025 11:19:15 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Bp8-0000000DPza-2FNA;
	Fri, 11 Apr 2025 10:41:28 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8F47F47AD4;
	Fri, 11 Apr 2025 12:41:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744368084;
	bh=70nnKZkKDKtDgnl0C06+b7gMrrVZkXvMJyhTaYQG0kQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DWi5QG7ej+qLvmgNEz+7skZ+UgpGFhKZo4QUJHJR47RLZtnYRe2KX8rah5lHuGl75
	 eKjc8TR17twq+klB7ik3z6QbgHXqDHIEulq1gMzYDoDFAxJ1hwapmpI70mg0CX3atL
	 /G4Kr4jc79mTq8dqsYJmmaKoQRjKkRnH10zJosJ3groxjVukSgQfd2X/5/ZJLbPdL1
	 6zBP7nBgKfH/+cKfgmYzelDSF98eefKtzWq5vU+oBB0rYyljIw8Dyn1XvPm+e7u3WJ
	 KLiDw4yZGDLhdA5Tqwt4piV5+nXFmvgDYWFTaxHmphu9j30+oMOlr7E43fEfqSFvqP
	 4Ojaodk6vvonQ==
Date: Fri, 11 Apr 2025 12:41:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>, kernel@collabora.com,
	Joerg Roedel <jroedel@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>,
	iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2] iommu/mediatek: Fix NULL pointer deference in
 mtk_iommu_device_group
Message-ID: <Z_jx07MlkOf8E2zj@8bytes.org>
References: <20250403-fix-mtk-iommu-error-v2-1-fe8b18f8b0a8@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-fix-mtk-iommu-error-v2-1-fe8b18f8b0a8@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_034126_802177_CC4FDE07 
X-CRM114-Status: UNSURE (   8.73  )
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

On Thu, Apr 03, 2025 at 12:22:12PM +0200, Louis-Alexis Eyraud wrote:
> ---
> Changes in v2:
> - Fix goto label usage in device registration error case
> - Add review and test trailers
> - Link to v1: https://lore.kernel.org/r/20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com
> ---
>  drivers/iommu/mtk_iommu.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Replaced the previously applied patch with this one.

