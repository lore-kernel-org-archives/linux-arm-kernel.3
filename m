Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E329C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 06:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=; b=djrWv+8rtCSe+aaR2gXnDXfrTD
	xV4gu22GoS4fg78lChQLfsCgLZPvBYWAxwZVsZIuwH2GiAGFpa3GloAyRIxhD8Ccxe/Iw246ENdr/
	6gPuY3EZ1S4qgPMGDHZnrZKEzlEafaWbqVJmjf4dE7QAG2Y1Bmq60mkepyYmSeFBcr1aGZEi0IGY+
	3YikadlqosecUdSU6IzLkgF3SyMYVWwWowpTo0UPiGdXSikrLpzAF0i1gyNhn2JnqWwTWbyiTN3I2
	AvWLCPQeaFSBsFoxAKb4AtQzuORkAd5urVfQlzJcSsDOQsQdNJGzRgMKHjaIAOnXAYHBaE5438bhr
	CRu6SJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N4e-00000005OiD-3XOX;
	Tue, 15 Sep 2026 06:55:24 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6N4c-00000005OhV-1om5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 06:55:23 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2dd77300825so5603035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 23:55:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789455321; cv=none;
        d=google.com; s=arc-20260327;
        b=l69RuI94G1TZU1LMLMa6RfMpykWmq5QoBcLYy4MM9pE+qOyH4YEUd3MCJKUf1W1zCL
         nm1viEzerxUpjz2cgoVK2L6qyS+B5HTf7PbaTJKbQ5mD74uoe9l4mtWO0FRxNkoyQnsS
         vvIS2w0nOpoaDZV1CMqhIiVzcbPc+COtihvRZYi5X59aIIOnGVYR3NK4eR4O+lVVB7X+
         8TIwacM7Cvcp/Vmp+biGt+5upiakCDN56OiJRA6Be7CXaG+gMvLDQQQkjLXO2NffXf/c
         jR0490kPDG/3goutGcZE8f74plGmZVXysK9bYYbse3Rc5dP3P1eaZr5DVkNpBLYZE3el
         xgeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        fh=N4fh/xFeKXao04AokFA3ryRlY7XS6z1qzAjKsk2w1mE=;
        b=dMf8xbCGe1GEe8Va4shPHrdD6fZVzNSWQxz48YaRI7pWaM2/1AKMk4PZqXM2yENSwI
         r6FkXvH0MO+Fqr05aowfa+fh1NhSXRB4nqXydzAn+xLDYqT2oxdLSO5bKMZuciNXsfnP
         wk/+1TItcrVWQkB27hIogMT/wk4B3ri+yU9aLn7Ww+0D8SZEhMBB5nXBT8tlxfxeivOK
         R6P5+6wvc03eTC6+bRh/7FICvU0G7PkKLak0QZ48xJhVw29Y/espRJzT1PH+1y+Ns1z5
         sLes/oFbWxZjDGDiHIqPmfzVHjfFlPF8wenMgXhXYBxUEDsIOQhoXJyix419vG1WIIeK
         qahQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455321; x=1790060121; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        b=pcTbMpa37YN71C5B4OaCGxbO69lcIOBSvovhCN0a4GhMlH1Mp6bnb5KgJEdpoNAFoP
         RpgTewEm/r8XKXC2YZGqtbCXtxPbxIqfxveehAKtA1SS0wTl4f9ewbKLWSjivpoWszlF
         6m2TkcaxQ6XuRzo8/VVRGYPf6fkJZqkc/CkAVLG8/6WN7k2SjozIdlcJLT29tQeVGufq
         gKtU+sG3UrbueAIp9d2Fv9y1omeZwrfE9zvW4mCSqclQeiyXk2o+7FVauhmBeXHGowru
         H3ZOfcNxH6QlmNd9dF71K3Y1hkU6FwzwGKo9jtPqhtdGeKFjHu6/P/Ym3cdeu8oKUSPo
         basA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455321; x=1790060121;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uRse6mTJ7wbDyqaPOhujScHoJmlYUjJddn11gxGD2Rw=;
        b=kJ55n4jLga3K7a8/gRxXQgt86oMiYOXGfFkN3Flp7CreO23TE+vG47QVPD5yo8XtoR
         oNyajo0yE97zOFiGRE//bEWlcj8aQHfM+732p+DnwkgITERCENhVEjJg9L/kG521upiS
         HlWw5TsI9syXCJJjaIxIJVo+cTnPaW7R35rxPxpyxib/WJ/53BFSxv5AgVaI21Wxq+zA
         YPDaEIISIiKRXhVdoo0JgNBWGplvEFgSz2dptU01wlvJFMU+rd1BHBlE3PW1I3GHYQ3k
         iVsyZZm88XJOkl3HCI/6H0vkFUwUTIVHEQFsacG7OPlges4ZCZACwLt9lQAJN6lBTRIM
         WvFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzsut0wBinV8wXAvR/YFkT9r9WwOUsZDRRVqAZNJfSWheDGTbMdAN3swPiqNDUm4+fLLe00fcK1r98SGM1Sx/Us@lists.infradead.org
X-Gm-Message-State: AFuF++lsujXUBuPOJ0Pb3+rnKJBCAoHWX6xeY2kgyWugiUkxGMRbkqG3
	qrgyj19oOfPANP4bWk83s6qoq0UYWqqjTh4NKQdFAdGfMSDV4FLXX3UkDwlBWTnNr6dM11aWbyn
	hcWqQQegC/ezJWYe7CjA/QJMGAEHGPMk=
X-Gm-Gg: AYBFou38CFqY85yO4I9qLLR4ivZhZZL6IB1z4vUUJ6XvHWXXWL/DpKlxpCYOGmmQCvW
	53bXk3mLhgeqsDR3XQBHNbFFBxM03FR5f78zzOY9lWbfyIMdG4jovwXVdm8PVeOPLIEU2jf9gSq
	RevKekcQUBjCzvCxzhxYyAwYBDjrF+MRTUJF4bCdbj8OkYB3T5V/y0EveVkPBE2jy3/h4erJMex
	hR9DF+qtyG/e5cUutf14pAxLCK6HYQEYDbPyMve2ozHIApl5HOeYS2D8YesmaU4bsOz+mr121JH
	7LX+Z4l9wZWKC8o4JRWbNDZPy2jpRtRMhMGf0hg6Ny7a7buNSas3zw6uwIxPFFZ5VIkKtpu3s64
	fByR6fyjP2pofdcs8SxhFEfnn5+UDc0rV6vaHZfPjFJ6yuTOYC6Bijd4a+ZKH4V034Uk=
X-Received: by 2002:a17:90b:564d:b0:39e:53a:c8d4 with SMTP id
 98e67ed59e1d1-39e053ace02mr2555146a91.12.1789455321539; Mon, 14 Sep 2026
 23:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260914072842.24420-1-phucduc.bui@gmail.com> <20260914072842.24420-3-phucduc.bui@gmail.com>
 <07add31d-5622-40eb-9bcf-f7cb2396fee3@collabora.com> <aqf7B_E7_Gv5iK2A@sirena.co.uk>
 <8f1ea5c4-d85a-43eb-8b10-3f80f8343b27@collabora.com> <aqf-pqvBNQ21EQZx@sirena.co.uk>
In-Reply-To: <aqf-pqvBNQ21EQZx@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 15 Sep 2026 13:55:09 +0700
X-Gm-Features: AcwNN1UCqK6sMPrqlCVGrE3bLZ2b-s0RCmlO_dC6IX4VPS5lJPfQdNqJWmpr8_U
Message-ID: <CAABR9nEB16gANTVf-B+sud0+11XhjCjqiCRY3hP_rnaFstB0tw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ASoC: mediatek: mt8189: Propagate APLL enable errors
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Dan Carpenter <error27@gmail.com>, 
	cassiogabrielcontato@gmail.com, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_235522_498397_D4438B9C 
X-CRM114-Status: GOOD (  20.43  )
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

Hi Mark , Angelo

Thanks both for the review.

>
> > >  Though practically speaking the error
> > > handling ends up being the same as if they couldn't fail since if
> > > something goes wrong it's generally catastrophic stuff like locking the
> > > core up completely so the end result is the same.
>
> > That was also an implicit point (that should've been explicit from me): if anything
> > goes horribly wrong here, it means that it already went horribly wrong "some
> > function calls ago", and the platform likely already locked up as you suggested.
>
> > In any case, I'm not against doing error checking, it's just about not doing it
> > when it's really useless (I'm sure you understand my reasons), and I believe this
> > specific case is one of those.
>
> > That said, should you prefer having error checks in such places... it's not a
> > performance path, so I don't really have strong opinions really.
>
> Yeah, I think it's fine and sensible to skip the error checks in cases
> where we can't really do anything constructive about the error.

As far as I understand it, regmap_update_bits() doesn't go straight to MMIO.
It first passes through the regmap core, which has checks independent of
the underlying bus:

https://elixir.bootlin.com/linux/v7.3-rc2/source/drivers/base/regmap/regmap.c#L2834

----------------------------------------------
if (map->cache_only)
        return -EBUSY;

if (!regmap_readable(map, reg))
        return -EIO;
----------------------------------------------

So, in my understanding, checking ret here isn't just unnecessary
defensive programming
for an MMIO write, it guards an assumption about PM/cache ordering, namely that
the regmap is already out of cache_only mode by the time this runs.
If that assumption were ever violated by a bug elsewhere (a PM race,
wrong resume ordering,
a register missing from readable_reg, etc.), this is where it would
get caught and reported,
rather than the driver silently assuming the enable succeeded when it didn't.

Best regards,
Phuc

