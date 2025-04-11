Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58A1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 07:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErTbfgk4++UzzfQU2Tcn5izzwnAui7RchY5ANmXLCgY=; b=nwzdFBuMZet9MzdD5PIOq06wVU
	Bb0462jIj5fIRl+ujohmTfZrVCE4n1k4UpOecSwJ34LZBkDhX9VjL97K5t+qtAQc0oZjRrJ4mGyJH
	vDBtCRsYdYDzlwjwDXDodbUOyX/UPDr060bWfojWPJzJM7JGK0yuOOZlbsmb07dEc64hixScdO4dd
	edGcbksF2cYG4SbI96w9zrQs9AlJt7eE0oXVlc7G48JMVsxU2CnrxCmVxBBHGOOCQndKJK2Q667Jf
	P54yTaotiAk64GXyqEstFXk9r9hiXzLz/bbu2ol88dGaghSj9347sXhQJ1hqqQW/FqKUcHhHcCMmB
	FXSM1AOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38uY-0000000CtSY-39ol;
	Fri, 11 Apr 2025 07:34:50 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38mt-0000000Cr53-0SLW;
	Fri, 11 Apr 2025 07:26:56 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4304E4685C;
	Fri, 11 Apr 2025 09:26:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1744356410;
	bh=oHJGD3DokWMMFOM+gMK6+SM9h2XRccCtdD4g4aHqNRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dhz9SsFMPKWl5jEsp+m2UYPQM3kNyhFqbKE3vrWSUFMsNQlrSrLZ4mp2uaIPH4mF6
	 8wSoxJNJJoCmYIpkWcf+OkpIqMfVhKNdpEBR3aiJ2tgiel02mjj5D8RWGxvEl4DB/q
	 IDhJZG0qV+LKbRgSWh9PISbRbvQdBoVlZ8VXKsATnqd1mDaLTGDSfIZzd05snhbDOo
	 e7AXrhm0mdRuAE4cmm0zE+psiqEYWTgy29v/UTl3VQo/yk2CTpuUCQC0rgfkNP05Mg
	 d7cK2J8VPIup+M9B1jTn35pRM8o9or9ookpMLlbKnVP/7ZCYPHmdpmNYjsF8mWLsFV
	 46iSyf7xOfe1g==
Date: Fri, 11 Apr 2025 09:26:49 +0200
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
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] iommu/mediatek: Fix NULL pointer deference in
 mtk_iommu_device_group
Message-ID: <Z_jEOVDofe1P9f9d@8bytes.org>
References: <20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_002655_289721_18CD4A1D 
X-CRM114-Status: UNSURE (   7.32  )
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

On Thu, Mar 27, 2025 at 11:46:31AM +0100, Louis-Alexis Eyraud wrote:
>  drivers/iommu/mtk_iommu.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)

Applied, thanks.

