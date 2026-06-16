Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625D0CD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=; b=inPhm41YRlaAyr0SVIJY+wiLbY
	raEJekwYV4ssPzamAoKqOC7yXSKvaTQLB2EbG1/laW99cNz7dHqnfg7QoEBuSfMoqKgxlloHrMxlZ
	FakfEvPvnZ2Sv3rboVwb8FIXzWE6yBV55NlqA7kQlzOnGmLIwP+N9cUCtPP/CrrJ31EwaTqFDE7Lv
	gcU58lgYHTx4vTtxAcWtGvR2RIy0J9oy0R0W3njGDT8wwWM++SnbOcLpTp1PuSli2CqpNNPHM+8hl
	qRma85WN205GzJ6YnGqi7SwuLTwgDAWJw5DUD4g9AdfuqkA3fh/n+239lUZj73aE+R+MzreyYBVH6
	M4iDdkiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVme-0000000G1OT-333G;
	Tue, 16 Jun 2026 15:33:00 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVmb-0000000G1Nf-30UL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:32:59 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so7953777a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781623975; cv=none;
        d=google.com; s=arc-20240605;
        b=ebJSFsQwwetNgzlxzSx7/VW9lluodyaIkeAR2QmtJb5z8Qu92xH9km1dcZHyGvoxnG
         XfaiKZEH9VErOlL+gEQmWPuAAA2G2AGqP5WNK1YpCOP1Eybb5qiPX2t3A2vNKZ3lkq23
         dPEMUw5bVa5MQFAhgQVKItLjczv0uLtvzBax++54uuC1hfXguDH1fbcYm7UbCJnH3IDA
         XIcWEweoi/UeXmZWeXloiOFwdEPFbAQ9rutt7I0XXhnCqqroxNetNrHu3ViwshyCGRPT
         O/pVoBkpMT4cwTd14k8SNel8FhOTtQb1Hd6vIRkI1INsiPIHHNu6jOrYyosankvuDndh
         LW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=;
        fh=3ZdX5p+WgFIgqllUioT9TQeeTcFUEIFN2XXLk1ZRMrQ=;
        b=ar3e5OebgetCMo9LzFNZo48+6Bp5q1Yr81FpHBXi3ZplwkhsdfZh430dsKpPh/zrUB
         DKWohmwb04kZJ587Xp/YGptYbPbPPavxRoDy8pnJS/ETuEhpL14DYxcnMCKSufVTY3dt
         OcVWRJjXFCmAum6x+HKJt9Wy5GuAuleUA4yb0DwAx7KGphr3dC6d6ujHuamhLEjiHX0P
         0oqe/5JyKE5p4tZlLO2NkPJMNSct5sZSq7e/EbP2L2A0cCo4fgGIDUxY40y0d1M12430
         81rmkvL72dqQP0fw831A8mvSwHzASpG1++pbNmFC6nGCdReaPsa98rz2tBWpQtxbjSkW
         451A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781623975; x=1782228775; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=;
        b=mN1qAJjIIsJynl9XPOlMKA6I3N/2NU+k3/xn3PztDCdYgaMqRF0jRNti5n3H93PM5/
         GnDmfY1dX8I6kxcbfxDfs/3KKaXcU8yip/ZGRg/iTBfYl01w7QftAMUJGU0sDOBzT6P9
         uuHvpdxMIjyTA+8mm0bi+rM0GfADpZE6dObgitAQ8jQ3qnew9jNtA19r5aQqbe0L4nep
         3qPQWtvmzOOLMTcBftH/WPRjs0RwBGkxq4CF05l+4P0PKsYpYHa51ajX61rlly7FGc7Q
         H3c28Yp3gXq5+QuWCMAtNAmcoJzpx7M9uYQYfxueoW+67bpPi3fQUL3AItdf/yVVuSWe
         0uJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623975; x=1782228775;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfw1ICkm7+kbiLyNwGHlM24bHrY+azb4TocUjKCxBR0=;
        b=jUXqC71YCA15Ti5CaB027F/C0pF+9iAwHkGkCxIzSXb20eZtYG+T4PoLvKexf2QVx9
         +KBhK/EVy2q6SpvEpJ6PRRlKO6Fv8GjKN1r8oMc4ogTAslWbF+RQZjH+jwxWjm5BRRwr
         pmnTm70kIWkIvDDGK2q5fOYwR9kW6+dk3PlmJlIwex+ZVvThrKOQrcchbizqPc1Ham1R
         kAW9VeJzKcUtJxv+JjLaiX8VycxNPRXbgTWuxxTxclnP79F4AQabBieFT3jrwAvBNRQC
         xJS0RH41n/pJDy2PFiMVERCZ0snU0YKdO8aWZ/W5VvRk9EpUlWsyIJJtQWIy5CQ/dswE
         8N5g==
X-Forwarded-Encrypted: i=1; AFNElJ+3Zmpj3CFme38aPcYKqXKTr1PeAycDin64g6vz1zgzBOBQialGslFEMXOmLoAwka/pzW08SoXFsnJ+iI9dWomp@lists.infradead.org
X-Gm-Message-State: AOJu0YxalVQ1ZTJr0zUZ3s53DVbfy9zUH9MwS5Qi5zP9QCnOKdXZfijW
	+kM/E2b6Sq0QfT+4GYUvQEJnCkcwqpufltl8weWv3NzwxIxO2tVaHxjZiWnD6mYfdO7k3bcIrPh
	oCQ9zU1VFzOJUaKlzdlzA5Orcy+p8Ji8=
X-Gm-Gg: Acq92OG3jW2BQ2X7B5DDyseEK1wihTWFgCK/QDeavXhvbA9A6GqLnbORq426doHKBTB
	jdKtClZZCP5ROtOVjpRWwNZ3/fUipXIyJke2IdQEUxmr34IhOr2hhBLxoD/21CzuB7EySKlEJTb
	FMSQwj23eGWXTAfyC3bJ1mKUiWz5IoZsI8dA31NXMzbehkq2dMFDO7ZE//PEXXplCQv8X+rQLVm
	MH0Mqb41F3HrYDzUZJH7wb5HPe/9uv9gR2C6NwP00rzWpFSs7RjcPc2VLGSYwCMoIjF778YUvzz
	Vw1riQ==
X-Received: by 2002:a05:6402:3488:b0:68a:c8c8:bf70 with SMTP id
 4fb4d7f45d1cf-6950875d069mr2423072a12.26.1781623973864; Tue, 16 Jun 2026
 08:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260615071836.362883-1-l.scorcia@gmail.com> <20260615071836.362883-10-l.scorcia@gmail.com>
 <20260616133918.GA2335264-robh@kernel.org>
In-Reply-To: <20260616133918.GA2335264-robh@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 16 Jun 2026 17:32:43 +0200
X-Gm-Features: AVVi8CcxGgSJDcwyWDi8AM7eUTYUD6802ufCx2_1yb4EtV-skFio6HexhMd5f18
Message-ID: <CAORyz2LiMHnaTK6QnsLxJDtw0fZ_N9LELw0iCorOZwHuWXus0g@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
To: Rob Herring <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Julien Massot <julien.massot@collabora.com>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_083257_774990_ACAAEB72 
X-CRM114-Status: GOOD (  13.35  )
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

> >  arch/arm64/boot/dts/mediatek/mt6392.dtsi | 75 ++++++++++++++++++++++++
>
> Nothing is using this so it is a dead file that doesn't get tested.

Hi, it's not referenced as the dtsi inclusion was removed in the
original patch from 2019 for an easier merging of support for mt8516
pumpkin boards [1][2].
If you prefer in the next revision I can add another patch to readd it
to the existing pumpkin board.

I am working on a few boards with MT8167 (Xiaomi Mi Smart Clock,
Lenovo Smart Clock 2, Sony Playstation Classic) that reference it and
these have been used to test it locally too.

[1] https://lore.kernel.org/linux-mediatek/20190323211612.860-25-fparent@baylibre.com/
[2] https://lore.kernel.org/linux-mediatek/20200229170401.1287324-2-fparent@baylibre.com/

Thank you
Luca

