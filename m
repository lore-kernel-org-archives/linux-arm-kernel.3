Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378A3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=; b=zNe2a4EtEZumke9TmXFZEpiWs1
	mRAN18Xbrpm3XVa3Uzr7+zyrDkqhruc9f+lPeCPX7HEwwIkDc0ZYbZJ8/EfPSw0ffko+q8XivbPAQ
	I/7eJRhMsHojDTOEc8odtWUFt8naXr0QiuAOwdC9a0uEYZsNesaENpsqqZY42ZnShunJMxL6wJqrj
	WlrqXCYaCLmKYo4Lc+6o7eqYDZW3KGaCXPF5FiJbSdfvqcZz1NnwwYcsrbphp1IcjiQ0n6TwbqU1o
	5jlvu/s3pcmoVypyVs4R0scfyH7aC9IkmcEbSuSZxwYFHYNVTzuEw98ATor/fes9JHYdG0WPJLiVb
	KnuGqGyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirMY-00000007M3t-1mcv;
	Sun, 12 Jul 2026 10:24:42 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirMW-00000007M2s-0DVl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:24:41 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-381ed661712so2718460a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783851879; cv=none;
        d=google.com; s=arc-20260327;
        b=aCEkbcWbppngkfz53iNDW42lCny28VKPoHmC9snyOse+E8F21Ug/bYpZRLaIskbjTr
         8geUdvnXMyqhiEjqftv2EReAD1rpOq1BLYIjz1E6XCRFiB1RlsDZjDddX/nFp0xk50Qi
         r7rk1INFCcymdBK8xZWar55szuTAz2FWgf2kZecVcegOHQlx8fAfuRPMNmOCnu7WgzzT
         jYS7YEy+zgN6VuCc/PWvJYTTjhCk8iNWGgQ3+F88EJCcWbw8sYL0vY/sQnvUyDyjzIda
         UU1PgZY0IZo3O2NXzB5dWd+7gf6RhSXqRgXdHT3xlgrAMrWeLejZ7ghg4WUQNNF/gdo1
         z7KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        fh=RFR/ihe7tnrZZqy1SfP0Yl5mrjNUOLmxCVv4zepxvo8=;
        b=Bll73m/W1IQkKyABHYhHvx5OH+mNhdcZOn/h5QlfEcWHZ7KCPl1Tx8Auy+wlhc+P+5
         Dj1LBo7lcbzMJs54jP50bI/0ckhsFlmSZA0BbyQx+E3tQqNBnPbYcygiVbbQ0tHBuVQj
         eX0lTX7V610fXcDmPZnq1vX45uPMCFSAjTRpA1UNZKN2OX2rcb1cloHOjmQ1pHOb+OPL
         MhCBQQqh0itvqGCITTeORSpA2BhRHVYksid1NY/TtoLkd1hUg8UHPeG11sEAiN/yY5sD
         kuZKwSq49aDpHzXpqrqNMRD8TF3ShFVmhubaADa8pTxvTU/XxfIFuCwES4fzKKN5HySP
         Yvlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783851879; x=1784456679; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        b=rFwZPx+nre97tQwDX2SpsoAO0+aCgyF5WCu0dLFo+9bh2dZ4iCtIY6swTI8dLssi/v
         Wp7GQXsBJfo3NQSv4D6/qNVxnZQ7mPlEDrmPMg3zgrlqHBFY05jC/eDX/9tszR/9/pkN
         4REbhnkxp1Gt/+M3QlKJbkNGnM7ppda5PuP+F0n0aYSx5J9RLulIo6clr1pNvMjg8ZEX
         t39+k9U+l7qbjVpmYrjpwigtyNU5fK7/Op0mWshmA3dhaDewnsWDYx2XGigTs4DXadWm
         jTeAuA/uLO4VxnFIoXDxDUqQNMUQi6g7c1+H65fligSeBP+0KHg8qfjLdXnglMgFoLVm
         MbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851879; x=1784456679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        b=VfO1nnUDeoAA4o67IuoVNJUEIk7QMZG9QG87JskHMU445swRxhp8vYBh95exSyFKVc
         rulcxbmz9+CUlF6ENxyM1dPCi/v9V5kVwWaUX0KWeg9+ve7a93dlnE2pt2Oatpn9tY0m
         z3XIk6WxyKKZssSs5iv4H8MK7ljvatQBrRXd0JsktOmBPVdfLc4Pvp5YgxAUDiF059n3
         yFdZdaSbos+3XukjZLOAFazouExh+9IHyadzP2ULiMw6J2QQvB3YQW3Kc9PBhTnZJM64
         JlWSdo7sFhl58JDYaFYXC0f8AyRWw9Z1x2LihG8DgIgozoo7Zdlqj8ZW4+84Nj1LT0IS
         h2KQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp3d99Y87j5sm5RDttr3AsP5qd1GRbMUg3ilh5lkwwsfqxxxuw9HU/VMMVPXFdZQnJCqekqvKy6+aF4Xxj1Vc5S@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2N14p3+OnxcIoQi15ApgDqzav7dYgeiB/GNskx5iNcNAQS+KL
	78E/u6GqHUvPGjQF6oGQDPedSfxqUqJ9aqHN6r/DilS1DYuWJPLkvDWksa1SiCyyyqokZ7HDexX
	80oy73yD/H0P0NnFLXY89n3iayaRaSjg=
X-Gm-Gg: AfdE7ckPW4yf9sEzq6oM0SnGZSI+ljC94e4tjKfivEeSZk5WDmIJhbIHGspe3h3ulRE
	XKEoP8KaJAV0PvppkH0TXcF9/jEIaDTDBqoRUUqUlLB49EvTcEQ/gv+jKWgewYFhEfOqiF+KYvV
	UfHUQG4ivVK8Hi36XlyYCtMm+k/gmnRa7HPHqqlkam2pOLwhCpExEi5ep7+xqcHnkNfedh581nP
	6RXTvgp5QDhoikibgKlEqksQSC6a22FhvWNEe5rDZRYf/Yf2xQ1VTxde1UB+bZ9Wle0I898tKh/
	wFjNl5mi0CT0/MYxzthZUqAQqIf52RZM+Kps5vFqTF7HZGZRdXSoa07hiWVRTw==
X-Received: by 2002:a17:90b:3846:b0:381:1fd3:e4ef with SMTP id
 98e67ed59e1d1-38dc774cd1bmr4524877a91.25.1783851878641; Sun, 12 Jul 2026
 03:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
In-Reply-To: <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 12 Jul 2026 17:24:27 +0700
X-Gm-Features: AVVi8Cca40gsSncc4EvdD5aUN3fJc8X0TaVsh-jOUWXPUjZCZtF3SWItFvK7afQ
Message-ID: <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_032440_095220_5747FC4A 
X-CRM114-Status: GOOD (  11.78  )
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

Hi all,

While looking into removing the goto label in rt712_sdca_dev_resume(),
I dug a bit deeper into regcache_sync() and how it manages the
cache_dirty flag. I'd like to share the analysis and propose a small patch
for review.

1. cache_dirty state before the out: label in regcache_sync()
Before the out: block, cache_dirty can only be in one of two states:
+ true: if writing the patch or the sync itself failed partway through.
+ false: either it was already false from the start, or =E2=80=94 after the=
 patch
   has been applied successfully (i.e. the patch loop didn't jump to goto
   out) =E2=80=94 the subsequent sync() call also returns success (ret =3D=
=3D 0).
=E2=86=92 The logic here is sound and consistent.

2. cache_dirty state after the out: label in regcache_sync()
If _regmap_write() fails when re-pushing the paging register here,
none of its three error paths (-EIO, regcache_write() failure,
or map->reg_write() failure) touch cache_dirty.
Only the cache_only success path touches cache_dirty.
So cache_dirty simply keeps whatever value it already had before out:
(as described above), even though this write genuinely failed.

3. Proposed patch
-------------
ret =3D _regmap_write(map, this->selector_reg, i);
if (ret !=3D 0) {
        dev_err(map->dev, "Failed to write %x =3D %x: %d\n",
                      this->selector_reg, i, ret);
+      map->cache_dirty =3D true;
        break;
}
--------------
This ensures cache_dirty correctly reflects a real cache/hardware
mismatch whenever this write fails.

Feedback welcome before I submit the formal patch.

Best regards,
Phuc

