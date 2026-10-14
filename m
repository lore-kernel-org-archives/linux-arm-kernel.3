Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079DACC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=; b=yJm1mxMiA8YiNCaIF4ss0AUTVg
	2KX1kqkXUczIYDbkeQ0dRahqujpQuB/1Epn7bkNogYr+VlolipIgmUrHiUyNK9v4ZGppjRdTlI03N
	wmBHiKSxmhNl6XtL2zg2oWqT6ev/5HEQhRoiC8Es56TRPDI0WXzCEjH/0seO2kQyApNZutEwFEkKz
	P95tspbmQ2r60HyqYAnCcYSkDKD6pLNZWZNF65vXoTixW1rkkkrP1Hc0DW/oYS7unQl7JWIOGEnRf
	oR0ZRpQ2Olr3BwlIOaNTB+GfJK2LlUVVNwwnftZIH2onrJhxGKo1ilQKBC3KthUVRPX/k/tEGRGwD
	uUDfhA4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxEK-0000000FM6R-1njG;
	Wed, 14 Oct 2026 11:33:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxEJ-0000000FM5o-0yFf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=; b=O6HyFM++bJ+bemhBvc2CApXd8m
	ycCXpUUfk4nFQYUA+zGJsRELGbvVDmuG9Suy/cMm4ITvL7sjqGsTnVhzchfr/aaYbpuN5xpAFyEo5
	2otCqZ2OQl5vwDJky3uHuPnm2McRQdrYoe28LDPVfbg9GkwHLKYQxYwSCY9XQxTkIlRbLstbkEWaJ
	3jSMz+6hXBHQ+DjkRtqJMnakZUc08rSuMrmoKGf4nuMR5WhvblRkCl7uBOyliuZXPUBFLRuwcQPxV
	MdzSb6BJX68eJbsyHMGkhk3OBRSXaXmrIkGbWXbJLgcMgpe91e9dyelbo2io2IsH/Zbibo9Eu5q3l
	V7g/j10A==;
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxEG-0000000GhGK-0lRq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:33:06 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2db80fcdf8bso22746035ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 04:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977582; cv=none;
        d=google.com; s=arc-20260327;
        b=KyOzLEtw1o03xedaYadBtqCZ+3sBfeYd0yUFn1tXeDiG13glbMdPv+5W/ZErvmyH/h
         /uHJBJCW2q33ju/nOxdsHVinS/W/9EkEQKZZjg6JR9TSvGEPYt1hs5ELsB7ZkERJNPHe
         Gf5MTSzjUS0P/Fcplk5Mh5kAoLwb1xfqS9z5570qgU0b7+HxNnHhG6C6x0PBPqefPsna
         uTKjRjnRKCVNUlQBfA7usBkBlwYt4WbK21n5wO3CGHcNtkMBlAzLWzI5wILOYFhGiqPg
         mANdjqEQC/ypqoBhSjtuUvc6CKYe1olV1f0YOsww1MA88kmatH/kge5l6cXOWc1G8vdh
         LmgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        fh=G+XR1BgZzoExqgCcswPYO8F9MSz/le/L4z9gSSfrUSc=;
        b=URT921vWtaGtxZpV7zZURN+0rN++u3Mv+j61CtepvkDuZnYCCCVfm46kDcOMTjW/yC
         T6KUI4D/bw4BzdXViO8+p7vrUvlclgH03Wv+L6VBryxHAwfnKpXAAxgHzfKR10Sm5NJs
         qDqlx99KfRDEdgxbK7rkVExTmr7BrkyHM2gUzHw469EN53sUOnpbU3lVZLKFdnNJgtNJ
         gM7Qs6kjCpTJJWkbZznVj1deJXQU2C95P6ndZfJ8VXXE/CJl7GzaJMEGmUIQyZrSaqfP
         zSkX4wkhY7SWAwA6uA4Jb8srxWRKKLK6gN+/XPk7JpRJMAq2bimjOWE4rRgHPQd0BDUK
         5gWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977582; x=1792582382; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        b=KmeNsoqNah0C3Pc4Vv3WE+KtXpIyk9S4LwylTDeNptEudBa/uorhsxveWDvMIdjtqC
         DyXjz86jAyU40ocyIsTLDGJMjq1QloVeaBp1sFv56wgAUVqNUvWkgU/mg5hYt17CiuKH
         u/BIGTIq3JLqbq+K1zw7MCW6e4HM69lyxFB5u+fZ6qtCT4Om8HBT8ScWRkU+FzhgrZwz
         yCpr59T4TIFOoJkxo4iZ2uk21ZIP+CQA1e6EbX22+hqCbbo895pQfD+8J7I8K4pkkYva
         UD1Olkim5OtiBx2Y/B+UApL7xpdl1VCOPx32IU1vrk7gVdfUq+LTKUS40bkpVfknFy0b
         4/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977582; x=1792582382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xfoExJf5zT7NtUl6j7xed6XbyKrpOGVfx8PomIB2cRg=;
        b=Kf9Llss0XRFynIYy/g6TRQHTpQzXoZFCG+3tZBOTdlLb1q+nL8F7vlAFymkNocF6YB
         JGU6MYUZm17DajwDdmccl7uvbcgwQenEGANbub2y1wh9/yYakigUlGBV8DDR/lETYirC
         RJCT6h7RTqgUHb9bYN44GWZxwMsiVjTdd+d7TWimDfkyX/7ZAZUYLzqBz5jothLR9dU4
         VEsWWyvCq96XDjFMHEFZJyPVVo02U9m8YSHZTIdKBHjrInn01ZCRukE/cHxR4bpTRiCa
         oEyxs/3jWLDUsR2+zcvGz5gSFp5GA2hFxN+Idw72bbeXDpilMkZUOVQUdJij28UCHSFa
         B1Qg==
X-Forwarded-Encrypted: i=1; AKwUvBwsL+2fxI7AvjxZFa2gvegBK94uvnG/ApH0zECx6+03FDjCpcCma40JaQNA7SBa8u7LNavx1QtcxGk8STUzMOwN@lists.infradead.org
X-Gm-Message-State: AFq9FYL913MY9b2MigoD1qTl2GW7inRFYDQlrZhoRBevMLLQZrLQbjFb
	6luiVqiru2ANBIICA80advQ7jyEgev8ZdLyF3sGBXsBcC5jxCSo91ejELM+2vQ+ncKVkC63AGDL
	LXJKIl8rwwjFTAla0PudEsrcf+c+gfD8=
X-Gm-Gg: AYBFou0HBmvRbKpMUvZykDpJl591y1KfuuLbzdaOHDixCpZGqAhm7Sao8meS2VogqQ8
	PnM8q3+0v6NCCz0GtigDI8kPO8v8h1C9xldtK9H2Ck0PVecW6kBKIt61DxPpk4/Vn+j8JIDNfcm
	tY6Gp/Y1YdA7VELB9xZni6o+mLV5BA5Y8oeGKBS6QayO5zMwLQQ8RuP3xa+C0X7Wi/Fg3d5ncF+
	FlpJGFa8nc2d+2e/fP8/uXecJ5WeU6dsnQwdk086o15y3sI7OeBsmVg2OfjbVg6UwoTQbAm9sie
	aiuoR8Up2/dlbMO2il2WkIhdfq6hOgqh/PnbqO5savG4WuZWUoqEi9m+ZjF4Lx+tM4oer8T9VBY
	Eqg9Kr71ybAegkvDsWw4nCswmJhCKDuORyhN7dD7XTQkBQZJTwHpNG3T9a683/Wdgk5U=
X-Received: by 2002:a17:903:1b63:b0:2e7:ff72:203f with SMTP id
 d9443c01a7336-2e842bd0f74mr119079465ad.61.1791977581942; Wed, 14 Oct 2026
 04:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <20261006101606.54079-1-phucduc.bui@gmail.com> <179192410143.1606900.17860222773161459120.b4-ty@b4>
In-Reply-To: <179192410143.1606900.17860222773161459120.b4-ty@b4>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:32:50 +0700
X-Gm-Features: AclHuK_s2zGX3VihBvP-h606hGOl6LIyL74TJwbiVFCd2fpUtb4C574mAt5YBhc
Message-ID: <CAABR9nHZ2+AD=-SoAbXSuCMD4UU3VVEQJNEF4w57Z_c6Q1a5vA@mail.gmail.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on success
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Trevor Wu <trevor.wu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, cassiogabrielcontato@gmail.com, 
	Haotian Zhang <vulab@iscas.ac.cn>, Christian Marangi <ansuelsmth@gmail.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Tuo Li <islituo@gmail.com>, Rosen Penev <rosenp@gmail.com>, 
	Garlic Tseng <garlic.tseng@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_123304_269775_D1D250D1 
X-CRM114-Status: UNSURE (   9.37  )
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

Hi Mark,

>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4
>

it looks like v2 has already been applied, hasn't it?

https://lore.kernel.org/all/179138999054.2423942.10212092263791353501.b4-ty@b4/

Best regards,
Phuc

