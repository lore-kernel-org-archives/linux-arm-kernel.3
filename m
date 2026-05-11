Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAD8CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lTrWXUpjsMBBWpS2gSQWCp6gw+QRYwM+oHQqfF71dnw=; b=qBynONhtGgnnCgfKLs2Ac/kpuZ
	385FyAmMgFmsBgp9EUx28dsvjoJqbpyX3qkU4kK+zkIe8K41HbYNxzGUINAbwuEKAP3v4gu+RA/IJ
	XS2TvfVb6PIiKAt781iY1isFCiVQP01u1YariZAxBpnjKru6OmIEKDSE6tA2RISR+y+vT25IKbjF/
	Q21pJb7tZZviHskZ6u7DxAqsLQk8WHln/O+Ljfpk9x/qx3a46G8fQkZ4E7+V1okmZQjpWLOuoauN2
	Ehs78W9RyLCW0Zi7bUYoQOk0GIA+qMEeV/9JeMzMqSX07FFGN98Q60nw0HWN/fFBzv34PBgR2VYt7
	Gf3d7Sbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWxg-0000000EfsJ-0AIb;
	Mon, 11 May 2026 20:10:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWxd-0000000EfrF-1Tn8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:10:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF9FA44173
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA55CC2BCFF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778530239;
	bh=lTrWXUpjsMBBWpS2gSQWCp6gw+QRYwM+oHQqfF71dnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PYMGQ5SICzh6TMtYZllVYQ8mBoIBVyiWE6JyluRB+fj637AkoKx+rg9N8OVu6yBXd
	 2SCyWuajfyCbsIHOpZmp/sHCjqcSv56Bjr0Uvs7c3q6lTkY8f8mJuW+2K61WOB1ry7
	 piTykdQYp8a1vNDiN+OY/JQqhmlxRSBUa5lsOZET5UK2mWVb3o5n7+MeMtJx0GF0nI
	 TJhqHBpyOcoBv9yAgW/ts+hGEvg7CsBvZM8OEM8iA62u7O9NEgOr6RJJyWz0Je3QlW
	 5WMvLYHulsJKdEMtfcDcT4e4yQsOLwPa3zOvlYIEUR71RXH8PDFxjZp9Q9II8I89Yw
	 9o6hmQccGnPsQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a525aedb24so4739329e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:10:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ93s0lQgJJQb1XboD6GctT/fq7P6Se5UpPF9dfUm0UOKQKcU7GQlaXoaLhYqZy9XL6Ox3TjPYjs8HtIs/a7a26k@lists.infradead.org
X-Gm-Message-State: AOJu0YylMEcnYmiS+WERgpG+YEMSDcbFv0crSxI8gOEywsApG3XRoqtC
	Y0V6fR79dOfhr+fo52mBA/oJ4aN/5XMbGMwiNoO61+9fYJtVOb6BhJtxkCwn75oFT3SMT48PKWk
	3E10Z6IsNDNnscwrAswdDx0HRqe1z7Cg=
X-Received: by 2002:a05:6512:1149:b0:5a8:757b:80ff with SMTP id
 2adb3069b0e04-5a8e30cf5abmr22518e87.12.1778530238394; Mon, 11 May 2026
 13:10:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
In-Reply-To: <20260504072748.2580172-1-zhengxingda@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:10:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=-9-Oq56WEsBgTJsS3WR=wn4-utawnkNoq__rCSff-eg@mail.gmail.com>
X-Gm-Features: AVHnY4LZZFweJ9DX23kB3j5AOHEOM6q-LmnCTtTxpeyXfj6_HN_B5gNoCZt9TLE
Message-ID: <CAD++jL=-9-Oq56WEsBgTJsS3WR=wn4-utawnkNoq__rCSff-eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: mt8188: allow gpio hogs
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Liu <hui.liu@mediatek.com>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_131041_417479_30173E68 
X-CRM114-Status: UNSURE (   9.62  )
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

On Mon, May 4, 2026 at 9:28=E2=80=AFAM Icenowy Zheng <zhengxingda@iscas.ac.=
cn> wrote:

> Add gpio hogs subnode rules to the MT8188 pinctrl binding.
>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

This patch 1/2 applied to the pinctrl tree.

Please funnel patch 2/2 through the SoC tree.

Yours,
Linus Walleij

