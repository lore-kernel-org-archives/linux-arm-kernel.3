Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E9FCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E6vrXIfkEbDyEonMRt8VdOA7WwkFXgauh+0mNdT27yA=; b=c58ru84mRWnwvlsVIk4ctg1ZTL
	lNZZzzJo384OVG0T8yTHXdUoxkzMNnflhkopNUglE2bFoo3G6vs0BybnsmosEbEWg06CXJfaseYyW
	PpRD2Jd0Wvx2WmSFgN3GsU37t68t7JYbRDgb/d8moIdxjlRnt3EYCnQm8mz8EfAZCpnjeqQN3Clbg
	bYOiYfLLC+yDo9ASkEwJW2WEb5NXsys3HYCODTQfg+8m6I4NAat2XE2wFumIsxMc5FiqUjbmk+Fzr
	fPLZOC44arqGbEc01NYccyXtl+DUYYZSZCyz/rc0Hh+vX/8h0O9j/xOxfJS0vJOGr4DUKs/ukd8/Q
	i4h7dePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeEq-00000001LKm-1w1j;
	Wed, 06 May 2026 15:32:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeEp-00000001LK2-3w97;
	Wed, 06 May 2026 15:32:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1BFBD60139;
	Wed,  6 May 2026 15:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF62C2BCB0;
	Wed,  6 May 2026 15:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778081558;
	bh=TAQ7q6fZ2Es2F6QydtbDwjXgS9QvCyHO2HaBQ4U9zyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVdMbrByrFoyEMQvoFfKztaQT74EbmaRe2J48gWWbWGy4yzlVQ+T9tqZu0LwOoQVr
	 Q2gZKN32j1DGz5qnhdwwEhtbh+WNAepP15TAq9IfY5Lz2K3leO3dh0i4fVdDyOfcSf
	 7pOd+6ATTY7vN6EI3XDkmoOqBONRBKPYRs9/SPa/dC8It1LcnTeWiEOiBdUhzvr1ZN
	 Sgc6zhN6SxLTIhDf4CfrJVhLYSfxSLjgLa1PIBk0qVT1pcbY1Qe5iQSI2TSjgXkbTV
	 UeC9ft2X12eYFjYi1s4+SDZXeD9rs6iiYd5OWQpynEoz4oB7E6ou2WOGMUJpmiEoOm
	 xd8y44OSB9ECg==
Date: Wed, 6 May 2026 10:32:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-iio@vger.kernel.org, Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Jonathan Cameron <jic23@kernel.org>, kernel@collabora.com,
	Lee Jones <lee@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-pm@vger.kernel.org,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Sen Chu <sen.chu@mediatek.com>, linux-mediatek@lists.infradead.org,
	Andy Shevchenko <andy@kernel.org>,
	Chen Zhong <chen.zhong@mediatek.com>
Subject: Re: [PATCH 3/9] dt-bindings: input: mediatek,pmic-keys: Add MT6365
 support
Message-ID: <177808155624.2165765.133568600366378462.robh@kernel.org>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
 <20260429-mediatek-genio-mt6365-cleanup-v1-3-6f43838be92f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-3-6f43838be92f@collabora.com>
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


On Wed, 29 Apr 2026 11:44:16 +0200, Louis-Alexis Eyraud wrote:
> Add compatible string for the pmic keys block found on the MT6365 PMIC,
> that is compatible with the one found in MT6359.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../bindings/input/mediatek,pmic-keys.yaml          | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


