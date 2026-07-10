Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D7CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 20:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1RZDUi7dmfHqz7HG7N5VHozu1EUFuTkNzT7Y8iTCjk=; b=oR1eJZptK63E8duLJmJYxOhaIc
	qLByy+OYAfJ34JRYnhMwt+mWjbYWwzTHzS2b/RcKPbmHRnrIBukbU5HJlHFGJ7dfDX9nzhBCaaRM+
	teaJsKm52z1wnhgK9cPe6vfBRg8+rhrmRmHilKPknF0g4J3uJsQnDYa0QSLcNvnoaCD/y6X/8y6sv
	GTmuieubtRuASa0SuTdKv2hPrMzG1bWV58TjU+i+++J4frH5VMhfOpC3lXE4ll82FGI3nm2iWXOSk
	kSSQ8SKvnQw/HMPWXrxaQBlI/EYYWKxjNIhPY8szMZ0nCyUoluu/gVQAEhr5lTNvlu3NQO2GUxKl1
	rJp7gj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHrN-00000005i36-20BF;
	Fri, 10 Jul 2026 20:30:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHrM-00000005i2p-2vTo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 20:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29F2F6136B
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 20:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D24A61F00A3F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783715407;
	bh=g1RZDUi7dmfHqz7HG7N5VHozu1EUFuTkNzT7Y8iTCjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gUBrtBlkVBehkmSrXfeUeRGqq84rmT48nO0J25GHh5VJZwzIxzZjNse13ScMGc+gJ
	 m8qa4RITtEa/6PUV38mhmyauB8nPYsfzeT/Llqg1eoqLlLPyD+MORlaTlPgFJtXeHD
	 3d0oG7nMw1mDRCBRJ+7L/mSU/5KgH9xob0BSugNBkj6B5DBx9aHRvL04FBukxvve93
	 9HQfTBtOMD1VGNdP/9+BwOHDY7526Q1dnO2ph2XEuKqjKwpbwQWw3szHTSo5WBNKlp
	 MlWPVMIY9R62tpeuPblEIlzGMQxZL6WZ1yZ7CuOGm9quRe+9HmduM/pYXPcsG6R7+W
	 vXLgPTG9o4BkA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aec201b582so1094400e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 13:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqSLL7oxKlPDLNyYXT97WaaEkIb/wf6I6ywgxfpLSoap0yW4plzo/nZyo0qRTfn4PsIW2BHH6aTsiA38blMnLNR@lists.infradead.org
X-Gm-Message-State: AOJu0YwEOi+xgRTxDA07WQvg/TkqMvIlNnGvlh30cUUpPHg++KwhvBKU
	EPoYWsRx8UygsSR4F3qbsDGva4CAOfUdYn742W8hiPwTMcQiQVb4bNcFSCAIF673v243czRkh+l
	OjBGAZccLTxtNrlr4XRTxRVWaQpVpkIM=
X-Received: by 2002:a05:6512:2529:b0:5b0:1b78:4962 with SMTP id
 2adb3069b0e04-5b0236bb5c4mr137507e87.50.1783715406670; Fri, 10 Jul 2026
 13:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-1-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 22:29:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLn00-Qdy=uerGkBJUT5gsTjr685HYe9hcnc3ubxbcDgdQ@mail.gmail.com>
X-Gm-Features: AUfX_myXqmF5Z9qSM89g-I7i4RZgYi-3UQwo4ZzGGQsHH7hMMjQ_teIFD1NMZKM
Message-ID: <CAD++jLn00-Qdy=uerGkBJUT5gsTjr685HYe9hcnc3ubxbcDgdQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] pinctrl: mediatek: Enable module build support
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

Hi Justin,

thanks for your patches!

On Thu, Jul 9, 2026 at 8:35=E2=80=AFAM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:

> This series lets the MediaTek pinctrl drivers be built as loadable
> kernel modules. This is required for Android GKI + vendor_dlkm
> deployments, where vendor-specific drivers must be kept separate from
> the GKI vmlinux and loaded as modules from the vendor partition.

Nice series, I see Chen-Yu has some more comments and a
separare cleanup patch may be needed for mtk_eint IIUC,
but definitely getting there!

Yours,
Linus Walleij

