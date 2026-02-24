Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E67EFB819
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnhLem2XceV3pkuUOPOzNVK496IDuAS6Fz9EZZTLZDs=; b=zsg2v5lyrjK5N3fHqJNLWnMafD
	nn104OeTABYlJug+8HlRV9mRvviTRRpTqwlRweGQqUlNiLNG8+pcC/GtPLmYexeBS5rwilZrt9q+4
	J1L1pR24tpWeWA/XHlONhk2AV3Qfo+m9d0wWACbxhmwdq0aASPrjEAvLrYdPOKiM39z/a4ocZWfCA
	reFmimNm+FOG+4pSVTvt7DHe4yuNngsre07slt1xhUnEy8oFsapuE+GnksX+b6bFnjt3siktIV0S2
	hZBpgemG+IhOq0fNUY+/L3HDR+Wl1C09V6z0RtXlkPCn6pNBeVlMH+RU51PNGqV1Z0zKSCIj/lxl1
	VJU6hGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoGo-00000001hJd-0h4Q;
	Tue, 24 Feb 2026 08:59:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoGl-00000001hJ3-3Hlv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:59:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03C7144046
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7318C4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923590;
	bh=lnhLem2XceV3pkuUOPOzNVK496IDuAS6Fz9EZZTLZDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OGPg96sAODW7wqtA1uf+71Mk5aGsU9mJID4Vhqky/fq3t7dyRnKEejzEahlvF0kks
	 MwE2U9TbBg0plsvVss+faU5N9eS/irEtfP5XiyaQ+RuOiU86d1CLakBKi4WmtTPwVG
	 PDW8khAFXliQt0Y/o/dnjniaWha5/yarFbCzFR+aL9bmyOtPTGn5Ihj+tf2fcV3Wui
	 0PS6r6I2Uz+QbDCGgM4GPnQ5nYhAOClwQv5nmvxvqEXnasBKVvqcHiEMwDc6BOLmAb
	 5IRgSwEiFkc5KyUBLx7jdgKxgOwqwYypcymaPo7tezkrNul0u4ZK2MlfmeDIiav80p
	 mYnG7Fi2vnABg==
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79827d28fc4so27327757b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 00:59:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVa43yPFDsT9ldvDDy5yfJZ9jduDxRm4ygn50Xqk8SvH0CtCiBZ0fBtB0qg3k4zQKMd1xlRmdF8i7lXNoz/hsOU@lists.infradead.org
X-Gm-Message-State: AOJu0YwxOAPVBr35k7PuAIy0Tubb4/I9E/dH93cAJxqgEJRG3LQMlJUq
	ZLv+V/8Bk634K5ecaN6MHUX4VYHCa4VYfKZD+SHC/YneSsJO7C7doY+7iSvZ3CsCSWYWqfSonM8
	hsL/ZNNiZflWO0AHBHwQU/aLpeK1CoGw=
X-Received: by 2002:a05:690c:4806:b0:78f:a616:7b99 with SMTP id
 00721157ae682-798290172b5mr93654927b3.49.1771923590224; Tue, 24 Feb 2026
 00:59:50 -0800 (PST)
MIME-Version: 1.0
References: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
In-Reply-To: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:59:39 +0100
X-Gmail-Original-Message-ID: <CAD++jLm6ybwu3coyZfOh0BwvscGBp+B+oHp5bUR5rUp80cSjHQ@mail.gmail.com>
X-Gm-Features: AaiRm53Vb4IAD6Sp1D0WlxQIdn1apde_GXyUgxJPFAFGQfJTy6x8-4GGpF2nJHQ
Message-ID: <CAD++jLm6ybwu3coyZfOh0BwvscGBp+B+oHp5bUR5rUp80cSjHQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference
 leak in aml_dt_node_to_map_pinmux()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_005951_847203_148A7438 
X-CRM114-Status: GOOD (  10.78  )
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

On Wed, Feb 18, 2026 at 5:51=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> The of_get_parent() function returns a device_node with an incremented
> reference count.
>
> Use the __free(device_node) cleanup attribute to ensure of_node_put()
> is automatically called when pnode goes out of scope, fixing a
> reference leak.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied!

Yours,
Linus Walleij

