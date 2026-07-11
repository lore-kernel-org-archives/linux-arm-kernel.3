Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F288CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 00:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=; b=qxDRtF9AXr3G53fJ+72Lqwj+Pw
	Eob8vlTS3N10mm9fYmsxN1efhG9VZbt/gUm+iaPiRhU9J9/EhU3Cs2HvE3M82dJqEeKyYdoCK/YLd
	p0Jjajr/vAuT65mgfFgKIX43/bCXsbR69KKySE3sUfeC1nNnp8L36gIfyVtNiWKJNgRaYKzaEs8o+
	q4q7czuFC8ZdHLNHSrABkcT3YYUgGvv6S55I78p/ueE3Jw6/vdc700sv7vcyyAdjMJ/zuCCZr57Pi
	/laKqwKJtW7G0jDWWCVOC5AoNX/Zyoq6ZBN6C0n92P7ybDao2OsBgaeQDmvCxpYZp+9TcKxZa+8vK
	8bjKl3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLGs-0000000629B-3zDQ;
	Sat, 11 Jul 2026 00:08:42 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLGq-0000000628P-2jzE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 00:08:42 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8487088510aso1554503b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 17:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783728520; cv=none;
        d=google.com; s=arc-20260327;
        b=Gy7SfSoI8b7BEZv29jBejWfYOOXwAGz9RkG/prxunhZL96bTsAgtEC9D+6MWK0Oerh
         dQTFou1ktbOyoQegCM3UlUTP9EMmFQtYRmHEZ/dI6sh/+0vBJTpypcgP8OkpKdMKiIAC
         zLCzl8Cc9tWMNgw4OyEa+EBuFZwaypaXVl8kP9Uknq5+GBsTJi51wr2Bsc6vFiLRlA7H
         yXssSusGNLrlbJSvIIIV4MjGpGJgGPt6o2S1cbHaFoDxq38Q01EaGycrl0axa7Anz3QZ
         eG9zW2DJrHG3USN7xzbD4vniZFtnjPHGocrSAe1l0tGP+2h1ozIOxGr3navNxV1C5XUF
         wobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        fh=g6TtZIZmcCgKchXoNxEPDAtk1lJtwPxJsuM7RpftO3M=;
        b=QUrKFQe6QDOQGd0uN9WMMfNb/BF65mopvf8SRJ8AYscTHf1EAtmOYi3bpXXYoLcAzy
         wNiRk2+KpBPYJvLq1/REG59dseaGRB/GzCQClHo+6dkl79dUDUOTdCWVe3NB6/dsruL7
         CrGw1/r8z5Giw1gt23L7oNrxhNoKkW0U+b43RcQGOSnC668bHflsy4KaWtgXqw2+Xk4X
         Gh8Zt2dmmrkKzLMcjf8HJeft+JyxLLWuxNfUFN+qF3HeUMgvJulrUT1wikSZKIKFhn19
         WbCYkjrPBvpMFLd9g83BzTpjg7zL/oZwMAeyI6ANBtmwV6Qqc11M/nsVVEH0MVZIKt5B
         6Ivg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783728520; x=1784333320; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        b=qFwslczf58/ip59yfPexdPUR3JEnR4p4NTTGuzDU/YbIgVZF/CKM0NXvQngCviAOh+
         lNOW1XzobOk5NQMdp39b3Vn7JOAw9UzTjpD3NiIjOBH+hxST2LmhjUq+XudmxL1QEK+m
         +toMyhQsx9y3OfBdr8FkX008JHaFfsgMLa4w7LfFkNrnn1MJSPWG6PVNnNnvQPhEedqO
         rOOSTiRy58Dzr6tm1gS+05P8Q9/IDdRwDpx2PblarNqmUcKdvAYUg8/sd/sSTISSyuSh
         l7tX6IRYOVBSMRyZIcFutm9gjp6v1U7e0puHLp+uVxxSijYwSkBEDuq89pnMEbEh3dHs
         4xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783728520; x=1784333320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        b=ZT1B8OsKIng6oQMyWeK/Vp7Gk/dp3JSK8/UAmzRzDT8lCvapFRTVRFt9qVM4DiJ9aX
         y2rBp3ABw1vgKq1MiBvhE7ZrLQnFB/UKd77C/b7VUfq1KaJV9sivIir395yQBc+kq6di
         uAo8H2BbFUF6o+xZR0LBj8FD3HMtW/zMTpDaNgj7XArgEDqsVyVTgizZulZBFvOyvVcZ
         EeDXZ85oGTbR91iRJP3bsT0dSvQqcc+MIIyjW0XEgLEZO/YsAAI7Nc/jLDLlbSkcM2Od
         TBtQVm7fTuW0/EbCyZ2tvcyWTVijAUKewmOz7+RkD4DKTsg9l0EHobYc3R0Jm0Wauz16
         7fhA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5GpUg3HsvNzl13R4N2vRI9US6J6jFcH73evMSZ5iVZsfHqCoXaIfI37shkLm8xryDaJH3jcUx8P2xpixgQ+Jv@lists.infradead.org
X-Gm-Message-State: AOJu0YzSxvve4WTaTCcNdfLctM93kPglgVF5ioA1sJEzgHspcJ57SCLp
	57HweW0JVhnm2AoixrnRbmknbtbvesvTbTKvSLFvVbb4B4ckNuZ7dDEYHu2cVUaC2jZKjdieAiT
	OwQGpvn9+ny4W1KlQ5NP0FqYjm++ZaXM=
X-Gm-Gg: AfdE7cmOBC4qxcNhvF8fAg1GCkN3GO/j9KF5YJ0i4MzUMwTGmNux1/CiY4+IGHo+sJZ
	rQBHhpnSTvn51B53pUn9xcHkCCIKpdvUjeXFWBdoqiGtmD1httf94KnLj5UHmNg8R9hx4M9wVNB
	ijAKOI007L+vF5H40OqUh+UnFEtx5PF2U/ifu431emNRfg66XKPlXh9TGPaoNaeKHMXBjmnjfQ7
	+odOtCf3zBkPUNaSzSmc/EVH8tWt0cU5JDPAea//Svfjg0XzkcGjH6op7r84Tr5w5Gi/cVbX2dG
	rng6qW2fbRjyqLiZhqA2mIXNM71dAAmgjhRcMXjQeneKUpJYQ6TYV1KiUExGWFcp46dxkLUY
X-Received: by 2002:a05:6a00:cc1:b0:847:9e62:24b with SMTP id
 d2e1a72fcca58-8488961c11emr1089390b3a.9.1783728519714; Fri, 10 Jul 2026
 17:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
In-Reply-To: <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 11 Jul 2026 07:08:28 +0700
X-Gm-Features: AVVi8Cfyiwxnu7eGIzA6KyPzlQ6PObhKgfr4WFgILFEbEKhBTf8y3pJA57dwTdg
Message-ID: <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_170840_748275_A1136AED 
X-CRM114-Status: GOOD (  14.09  )
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

Hi Mark,

One more note on this:

> It seems this goto block was added recently, and I missed it after rebasing.
> Sorry for the inconvenience.
> However, looking at the goto path, it seems we might need to unwind the
> states more completely. What do you think about rewriting it like this?
>
> ------------------
> regcache_cache_only(rt712->regmap, false);
>     ret = regcache_sync(rt712->regmap);
>     if (ret) {
>         regcache_cache_only(rt712->regmap, true);
>         regcache_mark_dirty(rt712->regmap);
>         return ret;
>     }
>
>     regcache_cache_only(rt712->mbq_regmap, false);
>     ret = regcache_sync(rt712->mbq_regmap);
>     if (ret) {
>         regcache_cache_only(rt712->regmap, true);
>         regcache_cache_only(rt712->mbq_regmap, true);
>         regcache_mark_dirty(rt712->mbq_regmap);
>         return ret;
>     }
>
>     return 0;
> --------------------
>

Since regmap was already synced successfully, marking it dirty again
would be redundant and could cause the next regcache_sync() to
needlessly rewrite cached registers that are already known to be in sync.

Also, in my understanding, any register write that happens afterwards
while cache_only=true should automatically set cache_dirty=true again
(see _regmap_write(), _regmap_raw_write_impl(),
regmap_noinc_readwrite(), and _regmap_multi_reg_write() in regmap.c),
so there may be no need to defensively mark it dirty here in case of
a later write. Reads aren't a concern here, since a read never
changes any state - it's only writes that can make the cache diverge
from the hardware while cache_only is set.
 Please correct me if I'm missing something here.
Best regards,
Phuc

