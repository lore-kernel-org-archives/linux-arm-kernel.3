Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B46C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 11:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=; b=XYWVrZP7spFchVciA2LMMvEE1I
	F02GyJhiAxbVMCJsqTe+Be771dbcyeZniIH2ttjv0soCACaQXAch0nOtQj8kSMO7WL+N+J90ylL46
	KQDqtTFeD8VOP7A3GkPQec3xlQMt7+pVKIXMbVeyYtJNj8GQ7OYUC2UAcG1y8RMyHYrUmWpDB+YKV
	jqjKq3Qw4sxO4OUnytTasgb+kkI91MOe1z3xdOWwpnPNwmO8jvwBIrpp43VjTi4PHeUH1sOvbs+nA
	HL9BqYihzOSBbxMs19SoGIeuu+Fe/F2WXfjgiOiK0RIZPAaT2LxN9i6GgZeRHCKhGQcngJJ+PDnmH
	ty8Okjhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHas-00000007nxY-1mwm;
	Tue, 18 Aug 2026 11:02:58 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHap-00000007nwp-2YB4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 11:02:57 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cc891373e0so58192535ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 04:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787050974; cv=none;
        d=google.com; s=arc-20260327;
        b=pXuSkZfFK2VduSU72YvE7wPs/F5Q02Z/Z6cvRuRHEapYppUtH8rPRAgjoUYps25/Df
         a7LM88Yy8sVwH5C/3t80XRgxAIa9S4Gr9aySPaFm5kKL+8uqj4cr/QN4naesB0JEPAQX
         iSPskXL2apBo4Vvb9rGsUqmr+zC+KCOsYMmbpkAj5xFsQcKsYYAoO87UXtVOuvTQcL8k
         WXqzxXaVe5MhKjp4v9sweeHGJK//yvY0jF3VD2cS4nDTUZ1J1Xx7dtTmS1qv7zgl78Lk
         7M37r97+eF6AtVQOaOlw8yiza9IPbnzxo420X0L6zHvJYhOU4ArqM8cSDwUVnPLsnYeF
         ITxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
        fh=zLvZx7CFgYtDGuvPV7GYQ1BSZ4G9F5kJ2N+uAJ4HUSc=;
        b=mxxJ1QbRh/QOO3UUwfLDPZVeALjg2cmMB0R6GrbZQ4ydyirgyjCLpFq02m0aLLRNxH
         Ks0EeZRM5z1wBNJlfYgzrjOeYmZHPeXp/seqItsdpjYKxY+tziIB6cgNsBqNt7R77czg
         XwOmh0TY8z4h6YjA83xgf4cPJdSAdBb4RW3VOeKzBL/ln9XuZsPXWlP7YGOhQUdbaFcH
         7YVppLm73fh79mbutVmyCQ/w/q8ClXordsJUaj+3EGSIKY/rj8YMxKd2unkF/Iofdkge
         0kgZJe/z/Z8hyRjUtNl1UiGlEeuLNOqv8mtDkGRcllOZMVJZNI+730KTHCY4g6ymrYgi
         +wbA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787050974; x=1787655774; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
        b=oa6gu+KLR9MiNJOZDqwJFQ4g0cbdPkkoZAJYZgib1pUaXDJwl4R1/JoGm/UKldCZsC
         DoKQelNfKUO8A1ZfrQvbYVQGfVW+x/hoonH0vEvYU23ClnvJ70uOAG6zuLOtWBgzHFpB
         m29s8OVZTH4eIHV7sqoRfSuns+Ex8kiGnogIMkonobw3DYdTeTrnF0rsxMe121c3dOwy
         OmRJm84zyJ5erTXG8qrnW/OfGdAGiykvsx4/3UgIPj7PfUq6Jstgj4DEccH38k+XUxx5
         crdPrEHjQ8OuxSprU7oGpXP2L12soh7VEGxsecEAkFmApwJ3znLCKfRiP6/7JZr/g5sk
         zkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050974; x=1787655774;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BPjS6YWQ/poakltSjvNSgNnRZjwLe6wcNcWXaxoAgLk=;
        b=MHY2uJ2uI8cQNTx3UADppqIMVuS0OkUXwsFR23NNQ/CxF4l6Ar4RNmytUnZjt15imG
         e531RZh9QmoX5TshAbLDO//Mj7ElZY1ulc8ZreDnLnfMtZCLDNv04b1AngdLwrpR7vT3
         XUXAPt9A9GgymR/qwAr+og4sOblCz3N3t+vKucHsnex5P68CpvAKbWD8jnQNthejOcRx
         MDXGrYcYsNeC42Jr/08R06MvDCsSGs4WLlfz3GjTMcMZhPxAKpaCEkh7JiaChrngZ3wL
         6KYaSTNT2TzmyNedM0zXGlTqwWKveqJdfoRlfiDg7NtEaGB6jx5CW4I+e7M4qpGRS3+Y
         f7bA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg4+3MM+adbarIfMVOn9Slq06FDKgecRkkznop4xAbsAbHTSwWfaj4WCVpZ6dt/JMBl4tLLwh2nMlF/gpVu2W8@lists.infradead.org
X-Gm-Message-State: AOJu0YyStkDW6rDsxSh5sFUn17z4lBN/ZUK+wLcMl2HSnH86QyWPe8Mp
	+ftUhD9qXW7GvuZL5KWxCuWa5mAHa+hz1Eyy8XCtrx6ck6PDmrcsbclRByK51qH6AvMi8yBm86+
	GWlcQCPihAb0g8XmlBvIsig5htSZfsRw=
X-Gm-Gg: AR+sD1313mjGLX9WC+D+AcxCmFxy7oi+G+RUA2aDoJWnrKdZpFsRsOpmediWnIiQl4r
	R4wLDdSRdGNPWV5eq++2HxEnVFwqXa1UDE5gwfD0a+OOWJz1jl7L+Hcb+0BIMCClDD4+6zt9S+W
	Xb49DXa91G52AbEOAj6uA1TxquSvHk6/EwylDmlh5Eb+QwyQv6sAUimGs/LOWE4DO8W8snVK6Iy
	glKpiTncu3XqB3HMhTTe23Iep209ktmhXQkzeWXT+qlW3pD2ltIoGosFmGSgTNs1l4hC1wnBl/q
	auQqPnVpGzcYZwcP5iFBbDvTRfIeHjcVhPCzPKHIMLEGPmwzuYLkIAYSlZrJsSKJEkwwn7+FNkG
	dPFGIjT6150oBJiwrfLYxeQHYZT/SAQhEBCFJ8e1G/GvL3NqYRacjTksP4sSoV7dzreM=
X-Received: by 2002:a17:903:3c44:b0:2d0:8b28:517c with SMTP id
 d9443c01a7336-2d3b0d78141mr373925525ad.3.1787050973910; Tue, 18 Aug 2026
 04:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260817104929.63152-1-phucduc.bui@gmail.com> <b3dad816-469b-478a-b6a8-a08ac8610ac9@intel.com>
In-Reply-To: <b3dad816-469b-478a-b6a8-a08ac8610ac9@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 18 Aug 2026 18:02:42 +0700
X-Gm-Features: AcwNN1U_fcSxMy9R21C80tITgSmylcf4dSivVK9nzajAgmmuEsH3ejkqOedKKGQ
Message-ID: <CAABR9nFME5kYrLZUMn86sT1RaJiqzJeC7QJzqqxedL1NkZUYwA@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: mediatek: mt2701: Use devm_clk_get_optional()
 for audio_mrgif_pd
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Rosen Penev <rosenp@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_040255_641557_22F696A1 
X-CRM114-Status: GOOD (  17.73  )
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

Hi Cezary,

Thank you for your review.


> > The audio_mrgif_pd clock is optional as some platforms may support the
> > BT path while others do not. Use devm_clk_get_optional() to reflect
> > this.
> >
> > Propagate other errors to the caller.
>
> What does that mean? Did the functional path change?
>

Previously, the code only returned an error for -EPROBE_DEFER and
ignored other errors.
After switching to devm_clk_get_optional(), all other errors are
propagated to the caller as well.

Regarding the functional path, I don't think it changes on platforms
where the clock is present.
The change only allows platforms without this optional clock to
continue probing.


> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> This should be part of a mediatek-patch-series with a cover letter.
> Yeah, the mt6797 changes should be here too.

Currently, the MediaTek ASoC drivers are split into multiple groups by SoC.
I am handling them one group at a time to make the review easier.

I will send each group once it is completed, rather than waiting for the entire
MediaTek cleanup, which would take quite a long time. A single series
covering all
MediaTek SoCs would also be very long and harder to follow,
especially if changes are requested during review.

I hope this approach works for you.

Best regards,
Phuc

