Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E62C88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=; b=frYM0zS2DnHfClOZ/YiM8M6N8Y
	RmlS5slQAqJeQk0cUN2Bmsryj83WB5OGkjZD1hf3m8kpXBtXyYX9c+QKEGGBlsAwWFSf6mhxPGmjc
	aNRDmPQjeLnnYJ0sTknN7TLWyQSKrKj6Aq4+h4kClWTjwY5TuCnkv0xIH6L3ZMi0MU3I+7gethwFg
	RDMSASgkpyiZZmadxX419ZQ2B78PBiS5z8nMTL0/+OhZPg2BzckRJQPUQZXy8J3GbsubOIGLssQTU
	lEUir5tfYmXyaf66yagenmQn+kmOmgVRdecBZrk5M/lcYoJGVsCKL7IQquvplV82ySG8oXHfhi+FU
	Q+kVY3aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vzS-0000000G45a-2tel;
	Fri, 11 Sep 2026 07:48:06 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4vzO-0000000G42q-0eVP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:48:03 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-86265451beeso396060b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 00:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789112881; cv=none;
        d=google.com; s=arc-20260327;
        b=sykmus8wkGl3JgrXnlkwyqxGftmcrN6R9zvrLtt/T0CUwPZd2s19wQV1PosSFRt7p5
         07iQmk3S3UjrTAGJphaNRGgnFIwM+3pAkWotLPwUsFtZ9nLdA93THdE4n5Ijaj0n52fT
         8B8latwe41NJgYlO9BFZ6w3sGK7JuZrmAMr6Hoyq2eM8lBTTzI5UxhPbz8UJOY7FSRWh
         VFWgY6W39cWdi5neqY88bOG1/5DRh/W/Lr7/Mg++b7n9xLP2IKEb6o6DNtQpG0yzdJCO
         ro5QG0DCm3HM6ua6nvxTdAg1Iq1gf+FjkLFxR6Vbs5cW+DWOym1gK1HFFsSSoU8WTclk
         WGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        fh=B8Fw0PLpSW/RJiBWBBY/azqp54q5cCHsuUUbBpVaNFQ=;
        b=FQO8chjs5R0+HPzSNxDNJnU3qB2zAkKGSyAHIuORC8FEwxdm4V7eUtALw2gP3C9WeS
         xVaCaN/Fz7RjNi5cE3l+D274UMevAdC1l6dGfAia5IMofGMEbmvYeYWdA5lBtvjU5tAG
         eB2dNvQv7NBnxnKKuqCB9r40b92NXAjr/iyEQtwOjn4EbR070bADVwiWfQ3Y9sjxgThw
         PCgkbOAnhLKg+ZQRbsOfcKP5fE2VEk42e9RrcM79rbf6vTNZde4y1D58yTF/2A7KDRQV
         SQrr2w1wigzg0uA5z7W1Ie3GmOCNDIYRhD5U8hLK0bQw/h3lwebIc2w0Z1xNFUHI+Cq9
         J+4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789112881; x=1789717681; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        b=g2csJUTe3Hel2HJHUkAkeOIIw/FAcAkWcpIUDqFVKKsrM5wnLXE32U/dzTCTs7zcws
         hvuiFdq2OlofkSKUN/uuryzvn3pxJpH758hPGo2PQhrWJIPwwp3RXtcTnR7DYrSygVIh
         INBK8vtvihGwcNgUKoFofnwNS0f2Nf6+BZ76BUx5/PHzZ9J8CgY+qI9EmY0NyFlccmcS
         Sm3g2M1wWNX5hZVx4dCBdRnEoWiJQlLeuHHoexhxPNsXQ7f2MIMGbru3/jdzREy05isl
         dDLU2kc9th9kIPTCO88fuhdzG8vxC2hnwihch6EfTNIGkyFSVZsWYbTc2lJCzz+Ma/kn
         fKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789112881; x=1789717681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nAbGJK1TfivU+OKkZxPlu+JsW/mWTytutOio68a70R4=;
        b=PIyTIk1nHbPI+zJB20mAqn31saPDQ9WyeclggChOAggkSux+yLHj8OdVpOTWueHalf
         9Q8uh/kRlKEHgjIagMxQ1lxbx9YhtDV/DwvIbImOdrz212VxTRzvMW+CKC1URDzGhdSL
         dcfZ7X2J7K7QX7GWt5jAYgJfsTJoLuqgEgAuF4GKhsivYFwyvMOpgsRkIeHWrjt7cV9w
         PDAx34KeTdH7fd0r0fQ8NOLSnNpFVQEZkNTT6ZAD3A4Co9j46s749xO+Ckb+zRmlESha
         MVX1zP9hRjUBGguBPQ97PQUhus0Z3FuyjcwYfmYwLFiy/qHykkFQfT4/TY7EmdG7Vg5W
         TB/g==
X-Forwarded-Encrypted: i=1; AKwUvBzIh3ClLaAtQGLB9IUj4bqYykZAsV9ya+K1Gcx1muF4EdaU3aiM9nPUojhdzaDapAGGoCaviQPyupqezp3CqqXC@lists.infradead.org
X-Gm-Message-State: AFuF++kYqHKZBrFYqKW0UHvHT3WRDS3pRvX4doioDmJmtbePAY0Kql6c
	qsskA6kD187yWHzhrab328f57g6HQXFBQ0KT9144Zicxpw7FP0T4+D/1Q+7vrjITC7S31BwIguu
	4OSlQyty6zAaKzU1VvHGTIsRGOs+DM+w=
X-Gm-Gg: AYBFou1ZZ5qVFMvCIpJ2p9BwAhu09D9cwM5NDBp9rXRSUlYGNYzsTuDJFT/uGPr0gk1
	iG5Aek0xnEwwIjKAOAP7WbMAaWc0QEltnOb/aESwyhLr5LH22gQMbxFNTqtEH/94Jbwizz5iZBb
	pad/fYvDV+xMeKNBOeiNrvSUg8ceDBuSIo7uuuJr3tw5tTO3hww7rgrkuiz6Sn0UFZHG/HTgd5q
	SLQr79QpUFmL1ouxy1q8bCDse9o29PiqNOk8GpADPBYAPkcgfCwIKi52l2IjUwmLS5TtH+08K7N
	dzSiOA/nqxSFFzGQarfMboLSlbTWNdDXg37/IPZ4A/eHk+i+7a18+/5M0Ai5aEwSF4xZfG8dxOk
	UGfgVAunqa37m8tj8hR6YUfr3vs017pu7qao3NLnPi/HKBToGoWGmMUal63FFy0EUYvU=
X-Received: by 2002:a05:6a20:a103:b0:3d3:adbf:7779 with SMTP id
 adf61e73a8af0-3daed3b7ec5mr5165165637.21.1789112880724; Fri, 11 Sep 2026
 00:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
 <20260910125742.150902-12-phucduc.bui@gmail.com> <aqKwGQDkB_HruLyQ@stanley.mountain>
In-Reply-To: <aqKwGQDkB_HruLyQ@stanley.mountain>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 14:47:48 +0700
X-Gm-Features: AcwNN1U0HOa6yp6q-cu6PKO_-PEzbPG32NAKnqHP9l3WjK-sZPO65dMRXGkz238
Message-ID: <CAABR9nE+NYF23XqXCZiHaK7CXhcmVKLznB5Xz3eDr03NCM2dtQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] ASoC: mediatek: mt8189: Validate sysclk frequency
To: Dan Carpenter <error27@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_004802_250509_A28CDEE6 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

Hi Dan


> > mtk_dai_i2s_set_sysclk() accepts zero or negative frequencies.
>                                            ^^^^^^^^^^^^^^^^^^^^
> It's unsigned int so it can't be negative.
>

You're right, thanks for catching that. I'll fix it.

Best regards,
Phuc

