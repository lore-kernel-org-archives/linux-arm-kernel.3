Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EBEC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 07:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=; b=W7OCIlHML91bSbiF+hxv0g3KVp
	QXQgN5DH8Ia2IhToVW+2UWwfvBggCCz4Do/5jaXw63Dh1eryCTT2Kag2ck9aKiOG6xoD9uFl7HB+b
	r7srGALryNv+WzLDvqemAwgt7YLKpawzi+/2Kuwqx3W9PT3mukGh/D70ZZXZ0QxVyeuEHmw71FUNY
	w7fpDf65bPOzDfgLPqHgqU1m64QqkmbVuXd7CLcOOemJFh7bsJYVxlD1G8HdmceLVcYGirx+0AnlL
	FrfdjvADpWZDIFLof4fFxry2OctJdW0RdTgfWikzEnBBR/L6lVqe96qaGpi/anZuQGJKb8RqLkf45
	fg2OGirg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6O0z-00000005Y9O-1tm6;
	Tue, 15 Sep 2026 07:55:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6O0w-00000005Y7x-1dI1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 07:55:39 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c20ce3c118aso82733666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789458935; cv=none;
        d=google.com; s=arc-20260327;
        b=oekn+iGvqfqi7tX/FL/bdjPNmlVJuewc8eGNBjjXt5bfMJ6xxTO9bH6J68E3m7/KuV
         KVUfXGtkxOAmGgnuc4/DYS26joH2PSMG/ZmJXr/tlPxYeA7NMWK/9JKETsOuYO/d2dtW
         XCnhUOYrFDcA81UbIDPW+0Fkdh5bGXXyL3WDuULM45+KfeVU73x940bgqxKnJpyISnEC
         noaP47MiTCr54AGMv2/AEodaDU6mCLequV13e+rF5omx++5WEWz/2CUmJDVsY4w0kILQ
         xuOvH0ixv8nSby+Lx58uuxTO01KDxFjda9gE6Dyth0datcSO+vDXjwlCxfe+X6aHUIzh
         4EiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        fh=M3OBqXa7xbkWTIN8Mh/77s2sRmk9e4g7YD4bHld8MNM=;
        b=kUvyF8lEaAEsQJTtZXHnh4wAUZhRsyUtOkC5F2VKi0vn+XIg8w7DAjnl6immYu4YZj
         q063eWd4bdjKqC7OUYBYHuAUkTh+yfghcI5lMyQsPAzClHJRZML62LgDnjd5zIxQVW58
         BLyHfSCzuV8jRs5p59BXqg1w2B/PDCuN+Jff984iaLbVXNyMco12Bp2FwP12mtR8aEW1
         Ytn+hpNiOw85IDvUZHGG6IfvMDKcZ4PRfkqTuaaqFtjQJsGnmAzmV8fpHuea+ZPZ7gZR
         FLX1eJPOxmI3SZaXa/En0lo5XSLF9OVPc9rJELNGOgwI/mzvBmhH8ZLhywPdn3aSSuRl
         kJLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789458935; x=1790063735; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        b=TOjBTqatGzF1UL+2xEMJLW7JyydVwHbcb/WmXu2TAdLZY50Bzj7udQFzJzlsSkT3WB
         pod1MWznXfDX6oQRg1olypGatT7ljtyXP1jyrghZEq7Xbre40jeV3fFyaZ0TupR22kAl
         07TrTDLx0P37cb9uTauE6tQOZd+76A2GoYDu+ynXxL2X95fdCYx1vPlmGSg7+WrOLfFq
         /GfTPCr+Voix92XAmEwvlV/A1ICs09bk3agdxK5f6O53cmVYDsYZxDtF+KhLLnnF3dOw
         RjE1OxESGOrZK2TEpyQBhAHx6zFhcqw9AOYICzP1BBXcR65QG6+tpAGHODo9NVFb/MC/
         95aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789458935; x=1790063735;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=goS4E7honEFOUt4mgD9dkwBiL9FCUu+3QHZSOMHuZ5E=;
        b=vNxP+WsgJvIgn899yvsWaJr6hXw98Av6SwGxBMQR2/3Q+G3tLIowFEavQVV1we3ZaC
         /JxYSt7Ve9/QOncSSBH/XOatWEdIrEY3l2Rlonb2Ma9Lwyf9PN98ywscnCfoPc5OHite
         xBKxIfnC6oMaQ9/gj4J1XAp00+CGvJc2PF/4OTzfBr2t8gtjUnFzdGiyhS+6pG4QA1xB
         674ndOnlJskyYxcgcWUobj5Joh0xIvhRjASQIzOZekcYMiN083zuULYkOYOn5Kfnt7/2
         p1Fj7ep5kHTFzRPvArTDlYCwwPFBwVMmcjbLhcc3g5e1dKCJpP+9X8RVid3TtV6eyhnI
         qrFg==
X-Forwarded-Encrypted: i=1; AKwUvBxabZ32cvg8tGqznQqcednfA+UbKfp88rNZ71IxV+IlRttEeSuJjcNDjEMWForuEUzfwAI1nA6u4q/ZdaZsufVV@lists.infradead.org
X-Gm-Message-State: AFuF++nSA3CMTs2ThSZTPEDq5U/66Fq+NnO4HRkQVynVj4rEyu7Ub9IF
	HlDk4Q2EDFJ6N616+J1zhHTZLwJw2qVmzYmkmqV79XEthgfDv9K/kUGvYlAEc8CLDwA9oOPqIZX
	ocuZIpjHAZ2Qxm1aPhYf0PMZANWm22iI=
X-Gm-Gg: AYBFou3YDt2XSa5J0ieV9+OfI+OGV2CBzVu24tomdTGxXnk7Ho00kp+hGgHS99P0rpm
	rDrVCctw226xgIaTTxfFSglcLvzn1+Kl6EU3jKUFvrqErL1eL9iwYZ/UZrzHEiRLQ26PJLfnkAJ
	8MTqNCQhBXlC6VNtXv9Ek4EPSoaWM2DbKd83pkehq3Ek02/FqQUaGDNueSEZI+mhLf6EfnJT+Yw
	t2YOA2EDDWTFqS3abHRjvwzQGA8GelciHofbHT9nK8Uc97Kq1Ohk7Wv+A9CHph9iebQipAhdaO3
	vlq8X+JhaRfkdGCZE0koMdIYSoRWoE4QDH5SX7URQTWIs/jjJq/tTtJL4sQi7iKSZh5252W4sRJ
	+2RANj5IkiCQ5LGR1D1lx+HxKk+iO7nT2Xgn5EJMdzrvLE8SlyUvVqFFRWsD6Ea54xis=
X-Received: by 2002:a17:906:6a06:b0:c26:1f8f:ed53 with SMTP id
 a640c23a62f3a-c29c896c418mr191111266b.12.1789458935020; Tue, 15 Sep 2026
 00:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-8-phucduc.bui@gmail.com>
 <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
In-Reply-To: <693fea96-1905-49c9-b1c5-3fa1ceb4874a@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 14:55:20 +0700
X-Gm-Features: AcwNN1XHHQHyucAHdm0EW7r7ZxJRYduxWbuLcSKyAsTdoDPrrcNWVh8BQ68F-UQ
Message-ID: <CAABR9nH5e=kKRsHQYx7u3HtWgA3C897d9dH4h+wQTpZNGaTRHQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] ASoC: mediatek: mt8189: Propagate runtime resume errors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_005538_438852_4DE3564B 
X-CRM114-Status: GOOD (  14.84  )
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

Hi Angelo,

Thank you for your reviews.


> >       if (!afe->regmap) {
> >               dev_warn(afe->dev, "skip regmap\n");
>
> In the probe function, there's a call to devm_regmap_init_mmio(), and that's being
> correctly checked for error as in, if any, probe will fail.
>
> So... during suspend or resume or anywhere else in this driver really, the regmap
> pointer can't be NULL.
> The right thing to do here would be to just remove the useless check.
>
> Mind you, this comment applies to some other commits in this series as well.
>

You are right. devm_regmap_init_mmio() returns an ERR_PTR() on error
or a valid pointer to a struct regmap on success,
so checking for NULL here is not correct.

Also, if devm_regmap_init_mmio() fails, the probe will already fail.
Therefore, I will remove the if (!afe->regmap) check here.


Best regards,
Phuc

