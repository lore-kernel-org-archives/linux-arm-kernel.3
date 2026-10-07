Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574C4CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=; b=d9pQYLGfIv3HKcv4QIBNfczHdz
	Q3stCYtcNOovS2Zog9IW336T1ZbT4TeWmJDhYqjDdHu3qbZvQ3LIhTE2vlzfQPDEdOIVeztwQFmuT
	pgdpET7YnC16a2mwWrTUlA6jSlFyiQrmCzK+RXfIa2lcjp3fq39JDQj1934RPgyCkmjEvcL8J9ZLD
	0HM4d6etEVH6mE20ooB+F0Cpuy+/H+lg5JgXvs8Lk9OYm5lNJicJovoWt9610Hv2Q00abZVyvVVE6
	sW/rHhRz6oxIXzJAYNq25mpGGNcVKuCHrOMw0mbMKCzrXTrOBFh2jqY+58xeDXBs0FBPbVQSKKpH7
	YhHBF6PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPw9-00000002L2S-30jr;
	Wed, 07 Oct 2026 11:35:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPw8-00000002L1y-0M3G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:35:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 704A560218
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291071F008A6
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372951;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O13lfC7fZI9543LnfkOM+QX7j9+aaHndmCvTCIC6h91hpGup8MzTEpnynKjXdoZxh
	 Usa68LauI/yxnM5kMkcteBMqM+dXJyfmA5iNFArfOTIGaxktgx+JDT07pZ4cyp5WCp
	 RJVU3xKj+9JPMuxHQCCgPctfFqtgJdyYPfgycRKoUPiNWsNlh4uQ3IXOrzsSr2RUuK
	 3HI5zD73WDuBep40/gojfCA+imj5MFVoCsI2sh8WGdTWCWUOHO7pb5TtDN+zHaZNQR
	 /dGFUvq1H0erUXpjM0bBkQy5vww9kWFZVltHMqqlncqPB2xX3EiQG9TBiebx1FKkWH
	 b+HOoRLWRCDGg==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4911df1e196so1882665fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwf8b2UEwj8NaX1midE7MiJdGEOHpS+7w9+QqpTLZZmmdpGHPz9FmoGDB56XfULMA1zZg7HjUoLECZQSLFDuzwy@lists.infradead.org
X-Gm-Message-State: AFuF++luRNABygPETPUQ/Ceqf8ldSDqHGMrLXQQXV0+lxW4Scj+tqQHu
	SJHVTSrYiywIj5aMOeRcm8YsWfjigpNOZ856B+rhBBr44Dtw4dGsWlBJL/fg3zKp48W1B65S1P3
	3KpTewsP0eibmR4c1k1XCPLz7Rfv+Evw=
X-Received: by 2002:a05:6870:d406:b0:49d:999d:c25a with SMTP id
 586e51a60fabf-4a25915bdc1mr1996175fac.6.1791372950531; Wed, 07 Oct 2026
 04:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:35:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
X-Gm-Features: AclHuK8iblHRTpngvxt6CuhsOQoecYGccKQlKm7R1bCu_zgHyfj-gKel07yiWEg
Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
Subject: Re: [PATCH v10 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 25, 2026 at 8:54=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Patch applied!

Yours,
Linus Walleij

