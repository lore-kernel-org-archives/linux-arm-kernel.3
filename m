Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6899CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 04:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2Qun1bQqiWmbsCdLidcBgRBaZIl/bKSHtUSQ4Sosrk=; b=uJE0rgLQ2qNq48Hiverm75xeOI
	BAWE24CpKh1Av0AVhQYrNrnVT9INSpkBjqSxDZhRvyLmpFMKtntumn8qUmyN/vMHPlbbfcBXJ30nh
	BkfFwjDV3N8hkAHyw6y7FWMlOEcyWVIoDT59au7vM+PA4v1s0TSU7nRplRYREbJFpMetHRljV5GHU
	XZf1eKTrFxTbp/X/rx+7lNlj6ntCeATnClCMz0HxVbca8GJwMXThAM2i4ErGIlFFsHvXUyxY8HcEJ
	CQOZ9Vukq75GSPkewu93lST6uyTQl+jfNV7Sqjkc7GyQxetAKVrPUaTYob30Guboh0HK9adSBfE75
	6wqn4IGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa40G-00000000b4K-0Lct;
	Thu, 18 Jun 2026 04:05:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa40F-00000000b49-1Mfh;
	Thu, 18 Jun 2026 04:05:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 70C7660008;
	Thu, 18 Jun 2026 04:05:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75A301F000E9;
	Thu, 18 Jun 2026 04:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781755518;
	bh=+2Qun1bQqiWmbsCdLidcBgRBaZIl/bKSHtUSQ4Sosrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nHa3LKTmp6EcoZSSPPyY9beWT+AUiaQsjlrqIgRylTGlWxHTEry1bxnQF4Yx/Epcd
	 YcmBcMGzm1FE5Tgnzyt3AHvbJN/2BG7GXWUJ0z/kyMoj5L449zdPwJ9rv3oYthUqSG
	 cwtPsVbhaxDiXABZZiIbPq/33KcXhoXAA539CF1s46LDfVjia3rqhjOaEq34mlxnLT
	 JPGUnrngD3algxLms1Q1sO74Rm3n1373jy1tDQjL+MegLskUzv/QVvb3Ie8aqWaPLh
	 m2O4/RA0BMBYjIE2di692CdD13sDQCzEpbakTnM3dFKVEJSQxziFebWa/2iefZSz4t
	 GPpyyyXBFQlxg==
Date: Thu, 18 Jun 2026 04:05:11 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com, chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 11/78] ASoC: codecs: cros_ec_codec: Use guard() for mutex
 locks
Message-ID: <ajNud7QkwF369lBY@google.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260617103235.449609-12-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617103235.449609-12-phucduc.bui@gmail.com>
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

On Wed, Jun 17, 2026 at 05:31:28PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

