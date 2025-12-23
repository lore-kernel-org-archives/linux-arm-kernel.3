Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4911BE6F086
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCEMd+08qlcTwYGsBzmPt/QJyj049nOc8KwWWiyvk7I=; b=uBMiM440fU7GrvKYr/ITaxz/2H
	EFn1JBvrj0RM2wYVOj6gc3Sdj9faSwQ0Z9a374pzFrSY+SLdvOzSrec2L8uq9PDCdH4+E3XnDpP/r
	VSPl25JbGogypgRadvMM0tTEKH94KkTqQTStIPvkjKSlFSfuGwzR6JFdZrgq7ZizuNqN7f9E4HaO2
	ew7wEDo0p8kFjMSOfvRxjlRr6vw0oddr5PEyc5lQZ+67DLsZZ70OHRTS+lNbiAYwSLJqLBAuAL1Mn
	qxTrZVePhtxZQbBJtkCZMnWwSLbzIqnToH/2Yn9SsvxCMR8aHQ9TulwHB4m/DwnO2SSoTQVM25JkD
	/d8Ipr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6MP-0000000FqOx-162G;
	Tue, 23 Dec 2025 17:39:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6MM-0000000FqNy-2uDu;
	Tue, 23 Dec 2025 17:39:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B62C42E23;
	Tue, 23 Dec 2025 17:39:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D560C113D0;
	Tue, 23 Dec 2025 17:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511586;
	bh=WPIIbHhicQ4q0GfMB7fVvQcBaHETS4fW+aGWxz9VUuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLoULeoDl0jWzW9UgdeJyBBc0qLT/4rRqsjFYSqDo+AfDoSREU+PQxuqcS3VE2wxN
	 3A/pKf51i56JXCA9jt36TqfXQqcHVVpFIPZMx+Y9zPrTWxocb87FrU6/33m36VJ//7
	 hm3x3qM7wZx5dn9KMaUArGIRyB6rMiJa9BoadNwjS8Yr+6POlFYsayswKvc/ZvymbR
	 fbG73cVWu10I5zX+57VHql0rOSp9eFnxUzFWDCZxrkoCi3EQT6raPj5g1oKropzaOR
	 yaXin8Lh4SqAMEV7TH/urOnyUer9RK12dO36BvdeC/7/PllKuVdwtH+l6VGnBYzwb3
	 yoVcTBfUbFAeg==
Date: Tue, 23 Dec 2025 23:09:42 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Peter Wang <peter.wang@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Chaotian Jing <Chaotian.Jing@mediatek.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	kernel@collabora.com, linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 03/25] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
Message-ID: <aUrT3pd_rCp_7CQI@vaman>
References: <20251218-mt8196-ufs-v4-0-ddec7a369dd2@collabora.com>
 <20251218-mt8196-ufs-v4-3-ddec7a369dd2@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-mt8196-ufs-v4-3-ddec7a369dd2@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_093946_751967_C3A3437D 
X-CRM114-Status: GOOD (  12.49  )
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

On 18-12-25, 13:54, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC's UFS controller uses three additional clocks
> compared to the MT8195, and a different set of supplies. It is therefore
> not compatible with the MT8195.
> 
> While it does have a AVDD09_UFS_1 pin in addition to the AVDD09_UFS pin,
> it appears that these two pins are commoned together, as the board
> schematic I have access to uses the same supply for both, and the
> downstream driver does not distinguish between the two supplies either.
> 
> Add a compatible for it, and modify the binding correspondingly.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod

