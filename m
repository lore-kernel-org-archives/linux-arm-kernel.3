Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472C0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/rGtdlYc+3NGXJ5SThG5OuFaIxnpLuVSU21ppHeeTyo=; b=sJfqWv3OrldhawORGJjwrzc4zx
	MXM7ywn3+r7DBVmQ/Y82c6eUzJfBGWaLNV+ASux/TFFSkzYauhmV+apHKdkC3d+idAmAoZe9yTuXY
	UUk9asZung705BViyI4IXrAmiiKjMpO2X6fTdKtcbxYce19jg9j8vrwONo7AedjGbkPgxprKkp0au
	SBmbmS3CBt2vxX/0BeDs/n3dMvOgksv3uxsAx75tP3/FevWIHk68+YZAO3uaz7vgNbEZbs3Wb3acn
	BURkenEZpZb1SAnz2ihcEooTwNun5Fl7Uxo83SzUqz8zmprunoB0Lb1WJ3G7iJmTX5hVagBN51U2+
	AWLMy3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8vp-0000000EJ5u-3xCP;
	Mon, 29 Jun 2026 10:09:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8vo-0000000EJ5j-2LMv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:09:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2740041844;
	Mon, 29 Jun 2026 10:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE3F1F000E9;
	Mon, 29 Jun 2026 10:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727776;
	bh=/rGtdlYc+3NGXJ5SThG5OuFaIxnpLuVSU21ppHeeTyo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DmfFTYWsg9uqWg3J06bzxHu6cgNgUnuIr3vjYwhAVGmpFfqFBEAlt9JdQuM8KFlj1
	 cq0lkfwjsqa3vVqZZSHI68xV4mCiu9YFx3wuTC7FclG51B9X3zyOHWK1DXkst9WHdO
	 OELYb5/bLD7gQe9WUs2DL0cyhIUYNcyhRsLG1JUzskm0lB5PA5tAFipOrqY0Y1GPLm
	 wZq2tgiBUQXOa/vhwVqeFdWn/xVzQubraEc8ED5zF62/dIZJTggmBpw0BEUKLpTi7x
	 PNSwg+Ncc/7lRBB0VZSUe+b3SgjE+RoCr9c2ay8pd4fiblVnjU8Z4QDtiPvZC2z6vK
	 nGoLI4S8ELxDQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Weigang He <geoffreyhe2@gmail.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Tomasz Figa <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260609143852.1783558-1-geoffreyhe2@gmail.com>
References: <20260609143852.1783558-1-geoffreyhe2@gmail.com>
Subject: Re: [PATCH v3] soc: samsung: exynos-pmu: fix of_node refcount leak
 in exynos_get_pmu_regmap()
Message-Id: <178272777301.113362.3372893178879769060.b4-ty@b4>
Date: Mon, 29 Jun 2026 12:09:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Wed, 10 Jun 2026 00:38:52 +1000, Weigang He wrote:
> exynos_get_pmu_regmap() obtains a device_node via of_find_matching_node()
> and passes it to exynos_get_pmu_regmap_by_phandle(np, NULL). With
> propname == NULL the callee uses np directly and does not drop a
> reference, so the reference taken by of_find_matching_node() is leaked on
> every call -- including on each -EPROBE_DEFER retry of the only in-tree
> caller, exynos_retention_init() in the Exynos pinctrl driver.
> 
> [...]

Applied, thanks!

[1/1] soc: samsung: exynos-pmu: fix of_node refcount leak in exynos_get_pmu_regmap()
      https://git.kernel.org/krzk/linux/c/fa476d53edd24e8105faace04e881b9c4179738f

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


