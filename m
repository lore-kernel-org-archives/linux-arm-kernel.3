Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD4BCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 12:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAymcYhA/pn5tMA7pJa1pR2I6ummX8iuTLSj3q3nLbw=; b=zbYa9yW0CBqV+VBLnd1y1mJGny
	rW9vpfbRoGe92JhIf6/+AWjE16fAu6DLJiOZkRpMNwWERRtJ/Q4LJmI7W9ZYGrrW6qJZ76aLCt4Q+
	rKgftJzdjFDn81xzMFSWjKFd6BsgEukV19fFUAYXP8hm5cLHT3NEo0bluUiDZrv2T8+MY2vAmKyOM
	rcVeM5BreHjwUtsEMOO/V9na/+1vEEbArhZpGeAKZ2C3pGecfOsZ2RwtoVO+YIIKWjYpldk1Ogm/5
	YSTi5FX4SgIJBBLTpUw+azmheR6X+6JwwYJ/HMg5Snzlm3xLOznI8hDGzHPvQIJbGkDf/fUJJaIjr
	rptStOSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMZZ-0000000DvNu-0SAE;
	Mon, 27 Oct 2025 12:43:41 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDMZX-0000000DvNX-0rKa;
	Mon, 27 Oct 2025 12:43:40 +0000
Received: from 8bytes.org (p549214ac.dip0.t-ipconnect.de [84.146.20.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id F096A59903;
	Mon, 27 Oct 2025 13:43:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1761569018;
	bh=2G56BnpRGoI+NqEwEfPETIyrfVpN7iBlb7p/Lhy7kEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqiODjdGsHG3QIPyv6y1hgH1SJBEBvJAVuF70t2w19PW6FTBU5dU93uaxknOuuwLz
	 RU6wFENh+OpdEZVTCQYR1I9XWND1eCvmyb10IMWv+SzYrlSCz3y5kFxn8yxAo13lmu
	 0yRdaolADOmUlLnAD8JSluajl8waz2SU09xjOH/BBYfRyHhyXAos2MGe1hrJRbM6lj
	 Yw0TDAle0xRyf3PQzlAj1ypSSUZL0B3f7ANpqkwqdkiJ5/T3etsTD9dPlAm+kAYzl3
	 FvZgArL5YYo5kIbY+mdvOLVxvqbcD7kqF086FzrfJ8Yk1bEovxZCHqv609Ojk9KjcI
	 a1ZZnCQiPaFiw==
Date: Mon, 27 Oct 2025 13:43:36 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Zhengnan Chen <zhengnan.chen@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4 0/5] MT8189 IOMMU SUPPORT
Message-ID: <b4jjrpqu4pqu6nm3nohye57eauqvlqny7xtesnelhj4kcnwc6w@cohioft65alz>
References: <20251018132625.14428-1-zhengnan.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018132625.14428-1-zhengnan.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_054339_387976_34E0E2DC 
X-CRM114-Status: GOOD (  10.64  )
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

On Sat, Oct 18, 2025 at 09:26:09PM +0800, Zhengnan Chen wrote:
> Zhengnan Chen (5):
>   dt-bindings: mediatek: mt8189: Add bindings for MM & APU & INFRA IOMMU
>   iommu/mediatek: Add a flag DL_WITH_MULTI_LARB
>   iommu/mediatek: mt8189: Add APU IOMMUs support
>   iommu/mediatek: mt8189: Add INFRA IOMMUs support
>   iommu/mediatek: mt8189: Add MM IOMMUs support
> 
>  .../bindings/iommu/mediatek,iommu.yaml        |   8 +
>  drivers/iommu/mtk_iommu.c                     | 132 +++++++-
>  .../memory/mediatek,mt8189-memory-port.h      | 283 ++++++++++++++++++
>  3 files changed, 410 insertions(+), 13 deletions(-)
>  create mode 100644 include/dt-bindings/memory/mediatek,mt8189-memory-port.h

Just realized this newer version, removed v1 and applied this. Sorry for the
confusion.

