Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E265CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNOgVXs7S8GJ9Sg1bq8BaYnTVZCTG+kvEqG5BQlDdGU=; b=Wysj9MCcOmZR3u/sldWqfeqk+J
	QIKztEqlicTRPirC8MLuf0qvcuXXgkIHF31XhsfQwe9KpWdEiiSejNEQ5/T9iZJVZ44OKbx/zCNgd
	hoBhfBdn07agrOETRTbT6qFyTpn82jXmdtj6SjJvB8jQP01WJmggTpe1Llsr7woE/TP9AEmercg0n
	k7HrJXN8Bt4KvQYF8oZFcE23KqjcWWpUvVTO87PsQ/mI5SO6hG+vNu5Zx6Fhqe3bU4+QOFZQpS5pJ
	MeB3aAeDhzOky3oWD5+LYP01CQocg2EhFXSMioUQsv5yJwULYPe7fjTm/c9gOF6yzLrCvxR63kmaC
	+I6nQapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcbd-000000042T1-3RYg;
	Mon, 08 Jun 2026 16:13:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcbc-000000042Sl-2ZBC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:13:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C9C4404B5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 16:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32BF1F0089E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780935220;
	bh=PNOgVXs7S8GJ9Sg1bq8BaYnTVZCTG+kvEqG5BQlDdGU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XaE54YLLzd7R03D6vdNV93jF1Ra0VKj8Dg0BKxZllW+ZAy1zYkrzotCFTFRVck86c
	 yUvzU24/H3nR53EGBQbX+Gs7rY7YjySOXlfx5zOseeCnWIzYjvCdinCmIDD3LDzLoS
	 lsNzgfWLeXgYDoKKO9S9cVjfPeoOISMcRqbmM3cZ37WzGr5Bhz6RQi7/ezT71kOmHG
	 nlEHZseBqQkw+hZhtDZl86NaAQRJgpuhh3RQM4QicLZpteO/cdPGWwy2eln1q7EDeA
	 KnsL4hwkMdIdHTSJDr82JwiAO5uAngS0+jLtYsS+nyBbRvH9BwSPGNnwpYjH3Lupil
	 OcJWPv3FBqcTg==
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1382533d428so491862c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:13:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8ZdkTD2ShBQcYr40wbpfvyjYWycS9DYbDSi1nHSROIrHrJrdFpA13UfgOK9smKenJdUxWwVeYgMunj3pe/KTd8@lists.infradead.org
X-Gm-Message-State: AOJu0YwYcBAV13psHZQYEHctMQkSZTJYEGGqnk97xX4PyX80Hrl8tyGb
	EY3L4eHG+yt5n8TkrYNgwj0XPWGrCGaJHXQEdyD17IEFZ81bwvJbHogKKAYP2Y97m4JcYsE1HPz
	Kz1POrAutgq/Xg3rG2Q5cnd952SWi9KketVlBN64WVg==
X-Received: by 2002:a05:7022:6988:b0:137:feeb:3fc9 with SMTP id
 a92af1059eb24-138066db0e4mr7852243c88.18.1780935219351; Mon, 08 Jun 2026
 09:13:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:13:35 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:13:35 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-7-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-7-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 11:13:35 -0500
X-Gmail-Original-Message-ID: <CAMRc=McXE5uVFchzK1eLEY=a47W9MExbXqEPW_8L-tL0v+t_xg@mail.gmail.com>
X-Gm-Features: AVVi8Cfr03TF-ZZw5uesCgNwFbbmqiX4FozcVhH_SMCH6F9qaiCx29XYm-wRAiE
Message-ID: <CAMRc=McXE5uVFchzK1eLEY=a47W9MExbXqEPW_8L-tL0v+t_xg@mail.gmail.com>
Subject: Re: [PATCH 06/18] pinctrl: airoha: an7583: fix incorrect led mapping
 in phy4_led1 pin function
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:42 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> phy4_led1 pin function maps led incorrectly. It uses the same map as
> phy3_led1. PHY{X} should map to LAN{N}_PHY_LED_MAP(X-1).
>
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

