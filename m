Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ABDCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Whsf0EdL6Ez55mFSbFEjlueW7+J+D+gO7NqGXLZD2kA=; b=NO0H35exi4eBqgOyvvI5NNLBqc
	ttcqtgdzb3usrSwqoUj6cZrpfp1kwG221Yqq7Qgnge73OCoBkUtlRbHM2lLy6Gj63dtKaIha36UDV
	jvGSE0JKLPqv1jzNC0F1L1UibuQaxdVWfuASYuRs2CGKcoAJmk1bqMWcGw6Ia5QlRTf0XjvtJi0du
	yhhjyCZLmfLnPTGTP8EgLVCuirnzqeXP0UvdRCg2zSo6OvlGjw0t68hS38cqWfqaJlZLZVYKc9p5r
	c+xCrwzEQjHPKKe2kZFm5sC5NT/DraUC2MBTvRjPiNCjTKn+1cinzZsM90CSeJqdtynbkZbf+GGWg
	nOoHEKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBpX-000000085e0-2wN8;
	Thu, 01 Oct 2026 08:07:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBpW-000000085dh-3sAu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:07:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DD986022C
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 08:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA3271F0089A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 08:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790842069;
	bh=Whsf0EdL6Ez55mFSbFEjlueW7+J+D+gO7NqGXLZD2kA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BJRpI2gEiSwWeWCCAgrIim0T4Sv0VjnqMJmVp57DD4uyXq3aTE3eWSPlD554Y2KbN
	 rmuC8E1VzFqzHtwiko4YJyIhMYClIwcnQe6mGEJCU3LB10bF9gJ3AV0LQKfJKVfjdp
	 fDIJStHTp2DAX9FBjOmkItm+y2Y6PHTpvBh7ZWEY1zLx/DAwsPfxibNqZxYREs8qug
	 XeDR0jaZRTvGBJ6deMOXHdcv78VFVjj+/R9sWTGBc24io0Oxmz3wqwfZB8VaGL2QTC
	 11htZX/YS0OeAwa8m2gSPwyZl8IuljwnDTNJU3Fd5vC5wjGkz5UWBgo5K+Ms23opHP
	 bOzK7REYtPvyQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8cbb7b9cfso5041546e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:07:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz/YQ2Pwd8d6g20uJm4IsM2JT1BluXpwBw5N549+qUjrFh53pMVdiLAU/dOnqc0+3yn6e6DO+0ncmdyqRTNm4Lm@lists.infradead.org
X-Gm-Message-State: AFq9FYL76btyPOw/gx8FeIeJre0IKXAGLP+d3gy/XyGhkGT9g7esuj29
	6TO5D8vTOOT80AHr7NWOZi4NrlJWFoLd2hVLRbxUrVCZdHUVzvaGaNNKJz58OBLOVY6rzbzDNoN
	e/NPf65mQWar5NusFw/20WroIU6m5PJg=
X-Received: by 2002:a05:6512:2527:b0:5b8:c763:67f7 with SMTP id
 2adb3069b0e04-5ba405d9cd5mr1752355e87.24.1790842068511; Thu, 01 Oct 2026
 01:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 10:07:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLnJZBqQVkh51QGWuv0SQVNoxdy4fw3xOSOdCVSpSkkXww@mail.gmail.com>
X-Gm-Features: AclHuK-0NQ14ujL6Tmqh9QRuhM6uLtSq2NayK5UcJdRP46UImYU4EzJh14NaMY0
Message-ID: <CAD++jLnJZBqQVkh51QGWuv0SQVNoxdy4fw3xOSOdCVSpSkkXww@mail.gmail.com>
Subject: Re: [PATCH v9 0/6] MediaTek pinctrl DT binding cleanup and MT6735
 pinctrl support
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

On Fri, Sep 25, 2026 at 5:46=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> These patches are part of a larger effort to support the MT6735 SoC famil=
y in
> mainline Linux. More patches (unsent or sent and pending review or revisi=
on) can
> be found here[1].

Waiting for a DT maintainer ACK on patch 3 otherwise this looks good.

Yours,
Linus Walleij

