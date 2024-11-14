Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C05D6A22F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 20:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkKa0UC9NnJxDCNd5n0CnVfMEOJpPjjfOMw26wn6Vhw=; b=wLeSwwMpAsLGd6SMkvEA4LVUXo
	e6x8zXWEpKtVB15XrCLigDD5qWDjUdgFubBBOtSdWnbFYQ4oLEXpIOF4HdWyKbqqt/CsJtskNbvvM
	oeJ0D5UU6bfL31TkEDprVlivjpBDkd0D7xbjyaWP864zzUQXALOOXYR1ggSl7+vg/joxCzFRPcx6u
	VEqI6iNr1k364lWOcLb7IBFha7Vx0CoQTumLb0HAiUU/baGxtvCo1/HpdpDSqLQRPCWrOJSZ22FNC
	T3c4mGDgzScYEbh4r9OgsqAl9SQ8e+aOk75Dn0+uYdAflLMFo9LBTt1OTLXyInr3KQBNlZAIzmVfY
	pcOG2KAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgpg-00000000nuH-2qTr;
	Thu, 14 Nov 2024 20:52:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBgok-00000000nnK-1zmk;
	Thu, 14 Nov 2024 20:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9E70AA419F9;
	Thu, 14 Nov 2024 20:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2D5C4CECD;
	Thu, 14 Nov 2024 20:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731617513;
	bh=hkKa0UC9NnJxDCNd5n0CnVfMEOJpPjjfOMw26wn6Vhw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BDbQGtm0WeAvVnAzLRV1Ix+gPEb5jGN7UcnFuLOTK/bTYCxRTehoH08ARVilP9jb3
	 ueOk7RtrmEcSd2zHCbFty/RfiGwC0+gsMsF6RykmSqLaniKWDsELecF3MuQUpgmdcJ
	 DOnWSokngHLLHbYHjqWqlK2qi/0mv9Wip2q5BC7jz0vyGis9l1ofE6/uDSDKf5HNI8
	 Uc7CSJhlihBuFpPkpOgvUbY64h+5d4KmE2dQPmm9xdb1H7J3g+RhQ8EJcsUyM1kHHX
	 Zk3uQ8bXLJayhLNGQwB2kkpqlNRQpIGdmLAxRe+7BsPEdqzcGkA678KTarXvA9MnTU
	 /aeDfKdaKFULw==
Message-ID: <6c4bdf9e5a09aa8c2c49c69a6ccdac99.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <89ad840e7a484eaf4727470824acfe0fdc60fcef.1729871146.git.christophe.jaillet@wanadoo.fr>
References: <89ad840e7a484eaf4727470824acfe0fdc60fcef.1729871146.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] clk: mediatek: mt6735-apmixedsys: Fix an error handling path in clk_mt6735_apmixed_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Yassine Oudjana <y.oudjana@protonmail.com>
Date: Thu, 14 Nov 2024 12:51:51 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_125154_578966_4B5DF7F9 
X-CRM114-Status: UNSURE (   8.02  )
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

Quoting Christophe JAILLET (2024-10-25 08:46:08)
> If an error occurs after a successful mtk_alloc_clk_data(),
> mtk_free_clk_data() should be called, as already done in the .remove()
> function.
>=20
> Switch to mtk_devm_alloc_clk_data() in order to fix the memory leak in the
> probe function, and simplify the remove function.
>=20
> Fixes: 43c04ed79189 ("clk: mediatek: Add drivers for MediaTek MT6735 main=
 clock and reset drivers")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied to clk-next

