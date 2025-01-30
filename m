Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D1DC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 23:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WQHn6edfgzFGCG4vfRDpC4aYK7sN8+4+UbMutzj7pZs=; b=JjiFB0tBcax4Lp6W9gCdM/loLt
	qwtFIp3BdAkfdRLnyVgCYWvYEAYP9rEWA7GkHaY3tIk6ACSH3Ly+bI9+MfVfSncCsHoy34oOrkoyg
	M2HaMkrG5tJju+ZCpV/7LslNy4+rtCXJXpbBAepRkfKExR/nOeoVVKERDPjc/ATv/PUPTMDmh00Fy
	m5xMwhDI2ulLcuMDNiYVix4hF01jCwfA76UESSeR9AQUV3n+zYfDZYvADf/J0xNH99v2l7L+G0ond
	E58wi6d4qWA/4X6K0AqOqwfgBJZhJcG404WKzgkh6tXz6YGMdahWZWezbM4koh0tifhr2ahp4c1F3
	iimH/KYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddqi-00000009m3d-29YV;
	Thu, 30 Jan 2025 23:21:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tddpP-00000009luk-1LRb;
	Thu, 30 Jan 2025 23:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4BD82A425B0;
	Thu, 30 Jan 2025 23:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62DBEC4CED2;
	Thu, 30 Jan 2025 23:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738279205;
	bh=KpU19pPWgjFCuwWnk0SmFXgxBVKLllJYcw36Fo9osrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ERqVUCNtbs+MzLdhNdvgBbEjriNPD+yPZlBdTguGqhpz6nhLt0Q1qEpzAz1NpSC+U
	 UJRC4z+qMWIPBsk+AkOOIm8AAYpM0t2iMy1oWJ3OisQC2mXpY2wDDNo7yMV5e5te0d
	 qjeh/puZLvAbfjwaYR+VQcPxIdPfDGSMakwFr6s5tWOGEYAvliMRWa3/burDmWPvc7
	 aWJsFVAKeOPJP3JgMiUv3mLaItpjObrdvpYggJrl1DzHKdWgxWFIST81ZsBDj5ZBo1
	 W7KIlck3OGfLXlCXHkzatU6xx1VGcNbZ0Nmx360SlZWcm1LWhyjcrTQcRMDnsD7Y7D
	 NJYRI+1Iq4ldg==
Date: Thu, 30 Jan 2025 17:20:04 -0600
From: Rob Herring <robh@kernel.org>
To: Florent Tomasin <florent.tomasin@arm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yong Wu <yong.wu@mediatek.com>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, nd@arm.com,
	Akash Goel <akash.goel@arm.com>
Subject: Re: [RFC PATCH 1/5] dt-bindings: dma: Add CMA Heap bindings
Message-ID: <20250130232004.GA1818629-robh@kernel.org>
References: <cover.1738228114.git.florent.tomasin@arm.com>
 <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <771534be8dfa2a3bdc3876502752f518224b9298.1738228114.git.florent.tomasin@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_152007_425943_D6179392 
X-CRM114-Status: GOOD (  12.59  )
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

On Thu, Jan 30, 2025 at 01:08:57PM +0000, Florent Tomasin wrote:
> Introduce a CMA Heap dt-binding allowing custom
> CMA heap registrations.
> 
> * Note to the reviewers:
> The patch was used for the development of the protected mode
> feature in Panthor CSF kernel driver and is not initially thought
> to land in the Linux kernel. It is mostly relevant if someone
> wants to reproduce the environment of testing. Please, raise
> interest if you think the patch has value in the Linux kernel.

Why would panthor need CMA, it has an MMU.

In any case, I agree with Maxime that this is redundant.

Rob


