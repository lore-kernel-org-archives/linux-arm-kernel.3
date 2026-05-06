Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B870CD343B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nIiyHD4R5oG9FPiv5BI4H9LmmIPziFbR2ju0A0ZxIi8=; b=QV6aUH4YT2CvxNUFYXQS+GRQs/
	v95+AwG2PdHbO6gS/i6u8IyliuAE6SvE7XMUfLI68sD46A9uri3hcCIrqdzHSegki1SjsN9txNnh1
	ilOSsEvrdA6TaWwIMkPzFFDhtVZ3cRmpg1/0kUDdPg5z6As5Oqj54eHO6H4FOyqj4kK0aQXhW8zBZ
	BMPhbkqabWO6pW1ZBThn05E6GqMh2cTJAQoxLdrbE/WneVhXJ8Xxnk7y9dlYu3DJKYEH20bf/WK86
	v8mHXQFNr7kwr72+LEa3hAiQStaVc85Ick8Hn9cVCL1ENkjqyxCk7j+BPDG31HNqVbAsVy0HZSKFa
	ABxcsJKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeF5-00000001LT1-2WOi;
	Wed, 06 May 2026 15:32:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeF4-00000001LRV-0bE1;
	Wed, 06 May 2026 15:32:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6BCF40BDA;
	Wed,  6 May 2026 15:32:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57EB1C2BCB0;
	Wed,  6 May 2026 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778081572;
	bh=zum1bFqqE6ET+3OdOi3NoPnuFsNs2Tr0kQTqHlVTzt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P8XGCe6gMwHVbCWcAz9IfUGA84Ywlch3e6oZInGSI/VOxy30IX2AGUvHGpGVSlx/4
	 COQjCrKt1bZ6ZDyDSXCqUA89htROrN9FPQ3Iwvc75rz8Xsg3YV9Q71ZU/LryusajXh
	 Cu5o6cNLesDic+osa8bTG7bAi3Pn4UV1he710HLCg1m2vkiMHC8u6V9rZH4RuE5aQx
	 rMhxNdEbSNhwOUHtxT2Vi/F6yGcJXRi5fd0GqOtQFBf3rKb1Zsum8T0Qiov48vP2ZK
	 7TRPhUjPGGoK0nPjgodOh6pa09n7QvM8Ix+/pKRvr29rUe6stlKhJxb6oe/2HTw4ef
	 /0G4v5Y3pFu4A==
Date: Wed, 6 May 2026 10:32:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	kernel@collabora.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Chen Zhong <chen.zhong@mediatek.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sen Chu <sen.chu@mediatek.com>,
	David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Macpaul Lin <macpaul.lin@mediatek.com>
Subject: Re: [PATCH 4/9] dt-bindings: iio: adc: mt6359: Add MT6365 PMIC AuxADC
Message-ID: <177808157001.2166222.1416480244789545684.robh@kernel.org>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
 <20260429-mediatek-genio-mt6365-cleanup-v1-4-6f43838be92f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-4-6f43838be92f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_083254_285762_7800CD9A 
X-CRM114-Status: GOOD (  10.58  )
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


On Wed, 29 Apr 2026 11:44:17 +0200, Louis-Alexis Eyraud wrote:
> Add compatible string for the AuxADC block found on the MT6365 PMIC,
> that is compatible with the one found in MT6359.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../bindings/iio/adc/mediatek,mt6359-auxadc.yaml        | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


