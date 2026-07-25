Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B62D3C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2GSUzCngCig5Gksii6QGO0WMCjtneUA3x53tYdJy33w=; b=pkyZrktdiXvELdJXmrLj6unbVt
	l93GwKtzzBMPjO+Jg1FlCV4HDdkUTeNYqjzwezHRIeTj31+glOSEZFqdmq/EQzGYnGBnOsj/RrfgR
	ra9eqyv4k+HpcWRLmPGLbATwUawsLhriPu3+r/N5nmnR9jF+UukGMWjLoiplQbKexGr3koXSkTvlF
	qPON3R8rJxFBg27Z7kAf+QTB4PmsPA5ih1SfZ+FdIrnefRS3K6/H1EmTE0vBqmpnFYv4ltvKMVmO2
	AGOtRUS0yb/Owz7Y/GhbOwYRw9OjoV8lyQMZ4g9r64B5wj6nihNNJ8uzqvWkleSFNqkLQUb1U3RuI
	P7Nft0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnc9X-00000000Me5-3ReU;
	Sat, 25 Jul 2026 13:10:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnc9W-00000000Mde-2AiU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 13:10:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EE896600B0
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 13:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 952211F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 13:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784985053;
	bh=2GSUzCngCig5Gksii6QGO0WMCjtneUA3x53tYdJy33w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PCQf/d4e2SBtkCRjS9+QR955rdYcLLds7FzgQFrXmMiH4zGRCcFeBhVu/YzJElY88
	 RRQsdRC3uEyRFCbry46WciKBWayGS4xKl4ny29jF0tnSH1FdG6YVVVuTEuzU/Cjoqy
	 lz1uocc0Cn1PK99rFwVIM0IOyQ7CdCx4FMfv/n7sBiOwem4BznxZxo4PHRJ28DtzrI
	 a+x49WTgY6r2/QdLBw+vsEff5n43nKb9imPw+IGE6zb1S3x3ho3feJESFQKK7sHJMr
	 mcBG7kH2qmSjyYQEns+gP/FwYj9RhWO6uL7perCcdkzipvxLmpWTOzcI/yk/t86ljV
	 HpNhVk3SVPOpA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so1328203e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 06:10:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RocxYbVVxWr32/4DUgVfqet/XDp2lHtC98CpR1igJaIjTWkiyeyTGhl5PryULnouuVJROdtw0BtcT7xYV4wgyEo@lists.infradead.org
X-Gm-Message-State: AOJu0YwkvUbx5vi1NCiPswgP+PsVWWZDI/Dvzb/49CCpSXnGMJ8wTfsL
	74UV4bjgip2PqdDmXNIYqIVkYP6eHYBUPozaj7PmpJnMPkQM/1FdF3NpznKf49UykG+ACXBEt24
	SCr9RMCEq7Vd1AS8Q/K27ktypoumDpTQ=
X-Received: by 2002:a05:6512:1387:b0:5b0:12e1:486c with SMTP id
 2adb3069b0e04-5b2c1b00ec2mr452374e87.24.1784985052312; Sat, 25 Jul 2026
 06:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260723035823.2041832-1-justin.yeh@mediatek.com> <CAD++jL=fy+0ZZhg_eH_BGLUZfpK69zCcOaTp_LQ93yvSxUiS3w@mail.gmail.com>
In-Reply-To: <CAD++jL=fy+0ZZhg_eH_BGLUZfpK69zCcOaTp_LQ93yvSxUiS3w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 15:10:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLmDKxCwSWZbKcpawjRotMgEFxaoCjcKiq8H87A39tnQqA@mail.gmail.com>
X-Gm-Features: AUfX_myFdmYZ_1tkX_Vbvdyksfd_YwdB8gn7IvzQ4zVRblVSLK3XQPFPscUKun0
Message-ID: <CAD++jLmDKxCwSWZbKcpawjRotMgEFxaoCjcKiq8H87A39tnQqA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] pinctrl: mediatek: Enable module build support
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
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

On Sat, Jul 25, 2026 at 3:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> All patches applied, I had to rebase patch 5/5, please check the
> result!

Notably I had to add some lines for MT6858.

Yours,
Linus Walleij

