Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E18CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 08:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spS4amaSUghfoWNYKzXULKMkyw8l6kQ3ygu1F5jo+UI=; b=jwLA1UZeii4ecqzq5OemAJ3fYW
	xGGU7wPD8DhentppDDa61NLPWAajtXu3eRglAp4ZXMkmx5+d7q0hghNVjB3G5yrG5qEUvan2QYLc2
	kVl8jQ2dpP1moyYev1EA9oGnueSfk99LwXLO0FwNlKb41tIbw1CB6SGMxhU/dpY2jqLMVqIWplEZW
	oCQktHF9fGOiSwejDgW5nQYpS3UWisoJfrdXoHc5JfmZ+RYPiIORtCLZlhKHmuZgVS2vvk+d4NdL5
	Sijz/Sm50Gy4KmvkFWGAt02ONxwGpwmYYte4ci3VL8iZ88sawElJ6I5tszn7CtqM676QA0zCmTcm5
	FAyisfQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeWA-0000000FvAk-3Qet;
	Mon, 05 Oct 2026 08:57:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDeW9-0000000FvAa-1swu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 08:57:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B57960A64
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Oct 2026 08:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4546B1F00898
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Oct 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791190672;
	bh=spS4amaSUghfoWNYKzXULKMkyw8l6kQ3ygu1F5jo+UI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AJFklZvAYuO3wcG1bgghY0fve+Nn3UXIumMwC/7HczhV6TLIhrWip4V1Oz+G/qb8l
	 S2x4JdLpXyBRYiPNLidktohdQ52Ug8rahaAcHyIs6o/FemWl75ts4lSk5hRGjbWCq5
	 aPvAamnklx0KtRWOnUB5gYNAovHQ8fci9DyfCEwrZaUnXfKT9d/VwNQO+KqwGKmdlH
	 Qix1TTJ2CJuPSSyyKMBuy9nF1vX7R6eZ1oade4DuedaJcxGXmSONRy+tElslyubpQo
	 zoNFptN51mHNBUEntO7QkDIltnnVXi8NYfmLUfcwCdyVRbf+LPZLMSNdxKaW4RAkib
	 y7gLP+XyANzlA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5bcc6500a7dso97930e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 01:57:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwFn+GyzsfRGistirFFXO926fCFjQA3zpnRPcApiNIqpgA3d/rfQ+hqVOXtgVTlkhmW4Cq8A+Av+X+O4Bq6GGPd@lists.infradead.org
X-Gm-Message-State: AFq9FYIqLEwHZNFDKOz6gr99bh8l2agJsA7H1V/bqECik2E44PZvx1lz
	vbBurSNvpdlzoUtlN3bqtPWnzemc09g9aNtVai9EdEHAwXoH6pXZ9DOJvd/tX2bjtgHl2xXoplu
	e7O2xagpYLny5YhmfExAjARvSJJ4wCrU=
X-Received: by 2002:a05:651c:15c1:10b0:3a9:8546:ee13 with SMTP id
 38308e7fff4ca-3a98546efc0mr5211731fa.19.1791190671011; Mon, 05 Oct 2026
 01:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261004220258.401706-1-rosenp@gmail.com>
In-Reply-To: <20261004220258.401706-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 5 Oct 2026 10:57:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnMiTqjncmFLR8E4yE8NPcCCmi2sDOviePSLf+ugt_wAA@mail.gmail.com>
X-Gm-Features: AclHuK848ZkRY_JRmLDz5eE9XGs4RhJPpRikOgh1I8H5_6NBEypIA9x9lrT6SVA
Message-ID: <CAD++jLnMiTqjncmFLR8E4yE8NPcCCmi2sDOviePSLf+ugt_wAA@mail.gmail.com>
Subject: Re: [PATCH] rtc: ftrtc010: use devm_platform_ioremap_resource()
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-rtc@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	"moderated list:ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
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

On Mon, Oct 5, 2026 at 12:03=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> Replace the open-coded platform_get_resource() plus devm_ioremap()
> sequence with devm_platform_ioremap_resource(), and propagate its
> ERR_PTR() directly.
>
> This also reserves the MMIO region. The only user, gemini.dtsi,
> describes a single 0x100 window at 0x45000000 that no other node
> overlaps, so this introduces no conflict.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Looks good, thanks Rosen!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

