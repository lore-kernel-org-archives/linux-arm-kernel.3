Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D33CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 10:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=; b=JP8bKcrBrVJzh3Lp6lCoRH3ria
	kTW+U8LGrGIjo9Vzl6zdXM787PxYX3LH2iFkqIyWH/WGjOA0vbaddr3rwkZDVw8Frr67bEEmTICxw
	ionrVUItyQHuPklG4sAFgq7LmMtMMCJM/aKhjJrwa2TsQzfIKEbF0LZ6tYSo1J8Kp+FXezI/NwtRG
	5RkyR7HBfZJ1IrwUpFgXwXG3Qu02zRiW/2m2kTyinGxUs0iad5z882j+CvEEr6hWYhwA2eX9S6x63
	R/ePciygjqvty8C95DYda6FAIkQoIwY6x3IaKTCodpRCMl7CwY0pc2y04oq3RsiWoxJjxCM0Wm3wW
	XRlPuWFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDg2D-0000000GC7d-0nFy;
	Mon, 05 Oct 2026 10:35:05 +0000
Received: from mail-pj2-x12.google.com ([2607:f8b0:4864:39::12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDg2A-0000000GC6j-0FpG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 10:35:03 +0000
Received: by mail-pj2-x12.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so5578015ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 03:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791196501; cv=none;
        d=google.com; s=arc-20260327;
        b=WkCn64kuZz0xZ7vnh5aICTRI6gopoOwBjGeiU9R39eu4XKHxmy9omXFyxZ569J4KSX
         t/HeQKaEK9t6OvQv5peKbmVZNa14nwzSwmADQq7Fzmq7ENaqIogOGIQw3PAtEqpdkorA
         kFHuMfbM6QIjJd3eD46vtvs06ow7Mpso9vGqeFnPioRyDevkHjpuknQeiTSyMfe1GOY/
         SMgYFaAAKm1DVqVJKveSD3u0Dyv74oHw3J3n4bQ/vnTixTUsij97zvutGgN/BPewgwW/
         7YdGrMAeAIZGZE0C1WPACbxUBGrM8ENVhFhR0jxd0KG9qCPb+SeNm744TieKK0cALPmV
         /zpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        fh=BgST8wL1syDz7Dn96zTG4Hk+RLDZJrYPXBMhzVsZqYQ=;
        b=gUf0OBDBPbkTsuKQPSB9hGyJpMyRVxrEzJUnpAxT9qdSBe2cCotjAeu2ERBG/1qWk+
         uQJcWDG5JREahp68L5xvXiWaxDv2UaN7UemZFug2ti/sJDKrZRMXvzAUdT8NDdSQeR4k
         ModLqF7JM3Ise1TVBJKf3TOgOv+1j1TlHTZpt1X4LaZZtnWyjycOngebMbIOoE2y5EWH
         KyXGLfZqmidMNpsSJsJATrlNS2rQ98UCjN/U5CuirgyplgNkRHYgGfvGg7FyImhhj1rN
         6HUtaa3DDq6mSjGt1GrIcrACIT95vMPqfr6jqJdzbJJCY7dn/BtUwUvkN8stHyQxojWP
         PqmA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196501; x=1791801301; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        b=rOY1LzQgLj9X/LZhcZZBkklG5HglyiSNRKvAr891npWbxrFJOMiirO6DK2PG0z95lW
         1Att/BzgPHmZUmkkBhQ6TTvzqIDt25lMs1I1vgGN5NGEWU0rcumuXYk5re53dIxFZgZT
         NsF87a37gkLhfPWUn8tzmmAx66e+09Hfc4KSS4zqMHEaEnsh+bInTfeqMnrelrrc17wO
         kX0DPoamZippHOjIwihDz7jtU7MrepJ33HdPNilV3rlTzp7hOnMDXky17pjc+c1o9Yv0
         iagd3Cu6jWNnL/oWq+3StG+f7lRz7pYPURU7m3YIVr/b5Gh7IwYlmbT96h5c8A6iWV3X
         Q6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196501; x=1791801301;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kvK039c+ndNZqYLtVZw/RUvQrQGmrUovg0Lat0BxvJw=;
        b=YhI2f3DtzZ4Fj8KY9RAjoi3Il8jbly5Of7xdH27x2IU2vFHMp9hfzHOHkRtEJCCM5l
         YxBrj2Uo55mOq4/W5N5vfoRIwwr6oAZaarv/5zwUIBvim1oHyIgdWix94ODtZXLv7NvR
         gGubE+KX0kGIpE2yCQ7KyfCR4nUNU251qPutZcZub2vaq58KOFozoUU0XpBleCtAjoM4
         jh7UP3ZVSn+QofD/FbAL8LgVxilAvTFLgYGkQjRee/kHSW75++6xvd0h+DxVnddufKjr
         Do1SlQUb49gSq31Fk797Fgj4TzeypsyqjdE9AgzjmpB1nXxnH7LxEbo/eNzdJrNHa8gP
         Ne5g==
X-Forwarded-Encrypted: i=1; AKwUvBwg7aIZnDc5jJjyBTSLbwpaL1GHqSX9wXe/13hqD7azh4z0rxPHt8ZczbnqeEMi1K3zJWf1H6MQFN6bkkzbEmkx@lists.infradead.org
X-Gm-Message-State: AFq9FYJvzSKh52dxTV9l1E3PpEAWlYCP6nnwtx2ekNrCALbmfxMR5ZOY
	NCDgg1Rm4puCSMr7PYQZe6OnF/FfwkBpvfZ8YLzXbl6geVwlsA9MC+xFurVoVxBTIWDGyj1iH/7
	8NOytFKwCT/d7Ox6aVAvv4aPFvp7TNO4=
X-Gm-Gg: AYBFou2hZKQTq4dyP1CJk17aT3OvFIxsRqQqjON2M09Nzs9JNfkweXbGWFKw/nwAm1i
	+nPUjTjabv95ZxkSviuKeIQX5IWee0QzXV/gAD72GrHWnuovbWmS2d2kKsGE2FmNCYXLpvU5/2N
	kZQTWrVx5Stw3N3OrDshDBruY2qaadYFPaLaFEm6JwbCPVoW2pG+WDsalEai2RMqHk0cdAB4YJ5
	dIsJEPDUKyy7kDOroWyoQCwB1wCSGH/LSzvo8W8Hd5wxHOyXH+zrce8oKm1jlfPRWAi1TXTNXSU
	D7qOtsWXqxhTe34pH+eN5+CnYeWJ6ITmA9ySiJhAowDNm+fX1qnabBbkSdf581DYBrScyr20hZu
	PLYsrgM07PPawwiyUPgcDxXqi1YkLRaJa/jK/d4mF60UHAlElAYYSxpyQORH/C27ypUE=
X-Received: by 2002:a17:902:ccc2:b0:2df:8aea:7d92 with SMTP id
 d9443c01a7336-2e49b7f79c5mr90908515ad.47.1791196501061; Mon, 05 Oct 2026
 03:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
 <20260925044908.450775-7-phucduc.bui@gmail.com> <asKt42FgsbhSbQUP@sirena.org.uk>
 <CAABR9nFyEJBwXP=4SjuGNfGQJub2y_DPE87c6j6BPmqMBgjESA@mail.gmail.com>
 <asNbjSrPYVbeqSae@sirena.co.uk> <CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com>
 <asN8HzfxSHmBjfu1@sirena.co.uk>
In-Reply-To: <asN8HzfxSHmBjfu1@sirena.co.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 5 Oct 2026 17:34:49 +0700
X-Gm-Features: AclHuK8Ugc5AChxqexu-mkihhLXhmwiRf4SISUAZ4NMYY9zRq0-VJGBtciRXzWY
Message-ID: <CAABR9nFg2mPOA65Q-9SEDwmEoJ+-YUQqOi=c2nspSYF=UBejYA@mail.gmail.com>
Subject: Re: [PATCH 06/14] ASoC: mediatek: mt8195: Fix FE startup error handling
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Haotian Zhang <vulab@iscas.ac.cn>, HariKrishna Sagala <hariconscious@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_033502_110106_4D7E0850 
X-CRM114-Status: GOOD (  10.21  )
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

>
> > On the core side, snd_soc_dai_startup() only treats ret == 0 as success:
> > it calls soc_dai_mark_push() only in that case.
>
> > Is a positive return from startup intentional/allowed?
>
> It shouldn't be, no.

Thanks for clarifying. I'll send v2 soon.

Best regards,
Phuc

