Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B39C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 13:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbmSzYd2ryzojmmR5tmxApAUV88P2Dup5Q86ZV8c08M=; b=cZGiXOSnQBhqHwvT2INB7eQuCh
	WzOOJdcYJ/5G+Fh2ZqwL4DJiXSFp8ggKxxymfyOZeH2cLy7RI6jv4t0MVgqZw2ApK0XYBIdGet1fa
	2REo7bq3Fyeyq5/ZLUg8W2f3JSOJYsoKGQ1bG97+8GXpa51kaMYWbSt4mRPqBopXv504J8Q8DWi5h
	TPfzt4SJlRunRo997CSaUXmgx4+WlmWV1TRFTSHp9tb9nsNh0WF6B9SRwjqZnLaDkp6J+7EqPSUJ5
	s93toPAZmHVeBFz5gnM3e0KEKO2rGvs+Cj0qlOLexqWdgSv4GwOFNIhe0Pi8f48dCjhY3aWOb6Qay
	N18hE+fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncmL-00000000PQ3-1wQ2;
	Sat, 25 Jul 2026 13:51:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncmJ-00000000PPf-3o3Z
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Jul 2026 13:50:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D42D40F51
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 13:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE8C1F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784987459;
	bh=vbmSzYd2ryzojmmR5tmxApAUV88P2Dup5Q86ZV8c08M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ORLG+fWhZosGalSGWmyV3Kh++97/MDHrKaLPYfDJtWfoak36JOSML9k8SudIKrrp7
	 wubLUe56gXM8COgYywev6qjsm9UZDTBYS277roo1SLeT6iNgjdN2Z+QKLcpkgZtkNW
	 uHE0C8c3XpcS/RRzONKUC3CTxBZQm2g0V67rfNBAIjcsTEAdylfX/qIAaGoTV0TGtL
	 Mdu0hdJm5RTpFNtErkG3HBY3G0u83xcEnbZEOdlXMMm8TFrmZh/7simaAEcqrmif9X
	 kXaXnn0aBKcs2+twQpN7vZkPNcpI3zWOxZ+p8QRwnGqp80lqCRQqEeyq0rCDkLnzA9
	 Am7RbQGbgE/XQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2a44a3b66so1288615e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Jul 2026 06:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpMmU9aCfMP16hq9EUd5cfrO3d6OgQSP0+IbRddDRVx54JYfSUQ/bVQROYlHNwNkFXW5rkPD6bI2joTuj1+M9Ro@lists.infradead.org
X-Gm-Message-State: AOJu0YxBb5TBj5wlt6vL4K89jKmUW/+xbsZBhqGhM9YIY6sVORsnv4Ib
	lBqYM7rIMBJ8Rh23bFAEbDrpE2r1jnLHei7N5MV3bPPTxko+1UDsIYfFP5SD8BZqrtQvJr+Zcfu
	L8dV/PfkTKpdei0Gsqx5qcbvBAbLPcqg=
X-Received: by 2002:a05:6512:3c8e:b0:5ae:c239:f052 with SMTP id
 2adb3069b0e04-5b2c1b569bfmr442527e87.62.1784987457975; Sat, 25 Jul 2026
 06:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260723184538.3888637-1-ekffu200098@gmail.com> <20260723184538.3888637-25-ekffu200098@gmail.com>
In-Reply-To: <20260723184538.3888637-25-ekffu200098@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 15:50:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Zso=W-6hu56Jv_JPLLi09zXQVPdQnzDu+qjUNtai8zw@mail.gmail.com>
X-Gm-Features: AUfX_mxl0SbySY5a9lGPh5hdtT44cpsgYcs6gRZ2aF1kuTPcG7UsdR_1xQAGZMQ
Message-ID: <CAD++jL=Zso=W-6hu56Jv_JPLLi09zXQVPdQnzDu+qjUNtai8zw@mail.gmail.com>
Subject: Re: [PATCH 24/36] pinctrl: mediatek: remove conditional return with
 no effect
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Julia.Lawall@inria.fr, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, cocci@inria.fr, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
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

On Thu, Jul 23, 2026 at 8:47=E2=80=AFPM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:

> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
>
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Patch applied!

Yours,
Linus Walleij

