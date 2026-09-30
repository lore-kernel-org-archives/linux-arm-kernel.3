Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DFCCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGmye4k+YlaE682WwEkiugdda8o32numJuLT15EPQAk=; b=lNgdi4KlFpIPwFtqGurw8uEdSA
	HRplV26cs3VBlnN9/+xJAGBssXsTJT7fdNqyH6s2xxv6YPKjxW0C68SpjgCaRlAN3YBvzxaq+ktED
	3fkJt4d27VT7dhHu3nuJhXkQePJrQQbGJkZnyORT5w0Mq41lMAIv64GrD05YhmMt7xcPP/mDq5knR
	gHsWobkuw4EWYWztQDU4kCvlMkTOpYDq4vzZkZuU1CG5FmMKBM+prozAQqaHECyg8Mq2yHZTr3ozh
	rPcZQt9bMZrnfv4VHo+l5TzLTz0tO8alw8pL9B0BXyIMDdJ5l+R2cfmCb2j4FKvtIjJ/yC23ra0pH
	UH2OuSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuPG-000000068cA-2pDs;
	Wed, 30 Sep 2026 13:31:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuPB-000000068aw-1CMA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:31:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1164043D02
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0731F00899
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775089;
	bh=ZGmye4k+YlaE682WwEkiugdda8o32numJuLT15EPQAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DYOfnDeg98pIK7T/72t2R+Avlri5Dv1BeOAYrCAWC/Kf9a0liTJhpC2zQQ0Dvv2s8
	 KxixrrzeIjOuEl4GJZO51qVSw+MSq5SOvLt9ZT8rQoVf7Yc5AtyLqagZUKg8/JTf2A
	 xx24H+7iNKa3AAI57N4ZeqhH2eMp/LoIbNiCT1jfCR2dfJ3BPMnd7f8v4URTlpqsNd
	 Ypgtieg6HMVK8m5oWoV9QCG8sU2AakPUGhqzqO4YsNU/+70MjrdepxGslcntjGJeUz
	 VwBRt+AzX4jHVlZD29p2ReRzJ7MFQw80JuTEWpKClMLRd7MFrOgS680Ne5r+xuvlIi
	 hhWPE2PIZLzbA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a76ac0bdafso10590591fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwU2DtnQ6iWCMo/4jnGug0L6OKP+z+S9Vk9E1MVN6WCjVYzsvbNXEDE74ofjvVwfL0BZTLpkg6+ss/Hl/gXGR+c@lists.infradead.org
X-Gm-Message-State: AFq9FYJThrkNlAIocZrjs/NQTeMWGAV4pvZLZDn/N1EvFUqu1GE/UI9I
	K5UJkJOucPzJRwxoQAQXvxL1q21JzKKoEQVcbN4ovHGqqKJ50bubmEsYpFHxNtVBwSegp+PG5Jm
	ohZUM71tiBToHjlIYHMnK1vQP/buoIro=
X-Received: by 2002:a05:651c:2121:b0:3a5:a1f1:ac2e with SMTP id
 38308e7fff4ca-3a77920036fmr5378151fa.11.1790775087724; Wed, 30 Sep 2026
 06:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260918143846.30458-1-linux@fw-web.de> <20260918143846.30458-2-linux@fw-web.de>
In-Reply-To: <20260918143846.30458-2-linux@fw-web.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:31:15 +0200
X-Gmail-Original-Message-ID: <CAD++jL=vfpwSv+HORuqjcC1y5-dUZAK+6Fex-=an7voV73X3Jw@mail.gmail.com>
X-Gm-Features: AclHuK9hmbqqQ-iAhBFOSqKzQS-M6vgJ1tGQehJYCcgvkhZw-sBpo6gT2urSL00
Message-ID: <CAD++jL=vfpwSv+HORuqjcC1y5-dUZAK+6Fex-=an7voV73X3Jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: add names
 for i2c-to-gpio chip
To: Frank Wunderlich <linux@fw-web.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Frank Wunderlich <frank-w@public-files.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
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

On Fri, Sep 18, 2026 at 4:39=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Add line-names for the PCA9555 i2c to gpio expander to have more
> information in debugfs.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

