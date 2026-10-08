Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E2FCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=; b=TYd/e0vdhNVH+iq+qXeIzp1DPT
	c5QYkWQizAbALnYzKD2nm3tL053uY7wO7/kQr2cLIdpFZB9fEHM/Bx0zhNBeqXh/p9EZG3witn89H
	BDUyz5KalRcpJzP4vBh+REniDR+dXbFJdzfIGyjB0U/7w5LrC8OWgbd/a0LFAW0CW9lZol1E4+7oQ
	0DEf9XvKgJE65WM6/zvxtfAo33o6VSSvIFlcm/iPZvTZ0nXI5H2ekBo1URQI31SDQgErLv6e4BdGN
	/ffWfhRjvx3RgN9FSD1FRprkIkqWZioHwWvxYf1suhd3MFeHrgCQGC8qzvs4ZHWUQHTFwT1K5NTlZ
	h7EC5p5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElh4-00000004CBA-1Yib;
	Thu, 08 Oct 2026 10:49:46 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElh2-00000004CAG-20MH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 10:49:45 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6ae27f06c2fso8148886a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 03:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791456582; cv=none;
        d=google.com; s=arc-20260327;
        b=bxdMHZmn00GKGKfgvXC8KUjmWSiUJRHFnxvi6goek8RltLu62/rGB1mv5xWx4z3eZR
         IgMiEJkuuOvNnQoxCpfhUYZxwbF56KWQ/Fkl4DpjgxE6WI2j5BnEWsp9y/QXQSs2Qr27
         fDjYoA8XMbfcCT4IXYlf8HjJR3JlEu3JHiOrMgviGnn+EkkG8Cz+q4aMw7KJaLkudNxN
         Geb3Nw9r7off9s8wPU02FoLM4rw4aAWi/+8Y4ZX5BFI5Ix+1K3COCd0cgeMz3HpUkrpm
         x42qo7u38ZBkXdV92eO7XXM3KSreFMrKWuHb24aO2L7YQiVIb3oux6UJzl4cK0VlOT2i
         sWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        fh=moaK9CuiS3l45lwYF5BjRhJY/qbb0EeKnoPRCBJUdvk=;
        b=C3TI66kLHOwsHV8uV28INmYRXCBCIsKnJo727Iw3U/ojNsKM8/6QL1bDng1O0yd0vo
         +9btobuDR8hupe/Svgal9r9uOj36v4fSp1r3ReKoejPzXcMIKO4+OtXBROH01GfkS3UZ
         3kNrG+IxXgdIQsehbNkgTM/Ys+KzDymMf/vwXLY3fqoE/CSIXu1sal1Skk88A3WPs/3Q
         mXCNW7xe3nqa37rlh7FQuNiST/iXvQmEn1XmQCwTrXgrRtQfVn7z81uLEqsqUP64EPsp
         Yp7mdbPase4wJTIuDTnJkPFrYqCh2XiQSpArPM4rdN5u+vadtWhXoWSioMZ8M6G/iv2b
         66Gw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791456582; x=1792061382; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        b=dbwnyQFhtjQ5c8ZbvqkPdhp5wC7OCFX0Ripk8Horpeo3041b0wscL2TWkV9/oi2Tt8
         ule1AFKfuCr43Nq2lbeiA5+KH7LAQTOnMcWlB4j98caE9oIUtcUtB0a7i4gpYl60GW5p
         wpAxdhGThyGSdYjt0vnjifVRx4QAO00iK0QAK3tW/Mrfc3Bg/uGlRzMZzQHuWUnBDwTe
         1y8Zs6RfX+8wflv98hi0DR4tfXiMi7QT2Cnj68GZ9cxLiQKC+n4KPDFJvKW2Hf7C44Fp
         l213KsOxipW7r2wSbcns2f7ZowruMbpGS3LfST2hyr4R8dbbjCK7lg+AErw8SCk3J6Ff
         49hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456582; x=1792061382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a4OCygi/joWx6DjLuA9OUYrYHSJp+m8L1CHtdZMcIlE=;
        b=WdsaT2+Z+L1FrnIro57RQKMvCW+ELZeWkGdtasbNGx+R9UMXWVGGmdIhmtV/Z7cFUq
         qqk5yNFu+dlTZjQJPThbDiU9XP+fHygdNHvppujyYbwlbSACcm20pM3l01fNc9OeaAxW
         qGArZiPH1I0iTm0zRkruvB16fflmzh+17ui8TFFd9BBInOcVkPnXOeIYTw998qptLYxN
         QFQfMjolo5nE7pMdIEDDpUGZk2gwG2IvGJqiGTgwbivMN7OYhYHeh077IwQbMVgoH2sS
         uvMcCglwElyLyyfkii5TH+jxW0+Vxa9E7DDoMSGuZN4ZbO/nU4B1mJq40sh2tTgGtMIa
         mnaw==
X-Forwarded-Encrypted: i=1; AKwUvBy/+VsEL8lTGh7LPy3A6D8EqL3GgyfsqJiORX/bUC8McaQsoUib7fFHzODZ2WJiNbZoUfPxRV3qRSpGURAb/GGC@lists.infradead.org
X-Gm-Message-State: AFq9FYKKz+sp57iarMCCWFBzFEj9FdtClOvQtk0MgeEhA3/FzADxZeIF
	R9n6HZ0b4LlApEWcQqQGd2uEdeTMLqPsNATULbyvTfhwawWyS6D9BCukwrZVQUFCuFMMCuzR6Di
	xDcz27XKFj4ezH9wqA3qY4DIva4MaNE0=
X-Gm-Gg: AYBFou1SH8j3aiGod4HApt99Dhwgs/YF3ZgCoJ8oFUONlviu1XE+jjQsN4fGZE3TgX6
	5SudUTiF5UasXaJCE4Fi1kzMwNGSD5uzOvn/Q3Ad8oaxJp2Rh/o5ydyUtu1gHJPcDyD+gvKtArc
	UU8vP5RztCup6N38c0lMWC1x4vV9+UjmsEaSI9+h5RtQF6IVUR2VFSu15kRx8AszGG64fkO1f6V
	r3ad6alhdBkVk4ombXRd5NLOsqPn6WHeKPTGjpU6/YhpfyublRhReLUeSZoC8rMC6aLV6+/Cqg9
	MV8TGG+q3QF4xhseC4GVKg6Gm+g1hiIBjdSOpCoRH08YfiEU66ytvxCZcy0fcR8pc97dTwk+Czd
	VHsElIpwhQh0ys77ASL+XRl0yLltblY4DCYQH6DeDIZ0PXNT7Q8NhTPGd7hsr0up5s2M=
X-Received: by 2002:a05:6402:4019:b0:6ac:afa3:6f72 with SMTP id
 4fb4d7f45d1cf-6aff3756d74mr4800849a12.5.1791456582185; Thu, 08 Oct 2026
 03:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20261007110858.509341-1-phucduc.bui@gmail.com> <d00880e3-01b6-476a-93f5-79ea6e536a1c@intel.com>
In-Reply-To: <d00880e3-01b6-476a-93f5-79ea6e536a1c@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 17:49:28 +0700
X-Gm-Features: AclHuK_fTTXIpKAwLFkuMWapY1wvxwZhKpPugkOpZYUioKYV77e-gJQAnEgFPDk
Message-ID: <CAABR9nEOBf18aC3yUx9-d4TdUYdpdoxuXeNSu76Y3B1HYXytJg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value in
 FE startup
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
	Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_034944_532973_2E038451 
X-CRM114-Status: GOOD (  10.53  )
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

Hi Cezary.

Thank you for the review.

> Thank you for the update. The snd_pcm_hw_constraint_xxx() finding is a
> good catch.
>
> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>

I actually found this issue thanks to Mark's review in another thread,
where he pointed out a subtle issue with the return value.

Best regards,
Phuc

