Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3A8C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 22:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9BX78DlPHt8S8INWN4bId3HyR/nFnQd4eQA2gbdEJU=; b=L8UIgER0J/Z4katUdRSf/I+4pu
	LCD5DAzIWBUsnIoPCBSBtvH0sUt0GZ5m37WeOowA42NgUJP+zesSEK8l+Wy7F56CfJLFz47ODP3mb
	0MoNZSJwvpm//fpToaJCGKLztUpgTUtugS0rCOjKoXHKATW51DI1nJEHl+smB4SXsqRRXKkNS0W9s
	SQ/K5fSAT4lQt6l95jVs9SbgpemjAyvv5izeuD4L1w7UrxYx++Qe1A9MuJ0MdaQBA+k0Nh2y7s2JY
	UmMO1H6bXwLnnh9JmyGFKAKYu460g8U4UIuDuTHo+EUB2yUNm4u3JYMw49f9HT1pMi+0AEA2DSdVr
	x88rdckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtBnp-0000000AmwX-31sx;
	Sun, 09 Aug 2026 22:15:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtBnn-0000000AmwI-0gKQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 22:15:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB211600BC
	for <linux-arm-kernel@lists.infradead.org>; Sun,  9 Aug 2026 22:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F741F00A3E
	for <linux-arm-kernel@lists.infradead.org>; Sun,  9 Aug 2026 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786313729;
	bh=S9BX78DlPHt8S8INWN4bId3HyR/nFnQd4eQA2gbdEJU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=alJpLY4vqBtVvsJ20rrROXR1V2lNUYYMAd/pt4XYILZKuMrQDIKpT0/lh3yypHeRw
	 6IXRP9qzg+iDmho06W3EvNbSOsYhi4g6cYvxBn621aDFqNLSuTbxq247uEKT7atRos
	 G9fmrH3DMUyhlvQqNOrjcC+bqeDbFPeevy4UAKICv5rAQloavQpHQr2Vu1cz8czyf8
	 yonPW3+GfjCo0cAQivRa/wkH7Z1WqCwFovG0C/vrof01C5NnpydYFkUgJEv2SmOdPQ
	 2NBw7O8hvw9xkPSiQPqaYDKjo2n7+QY6KjBygeG8NyPjhZsF5Xe61XQomabpivnCjJ
	 OU74rSF9XKxeg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so951023e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 15:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrAtAuXUrDLR6m03nI2xtWFjEsvK0dWeiUmTT8m9M2x8hMtzUh5HH2VaLmqydOTg5Eurq0CB1qX6LwTCDM+A7Li@lists.infradead.org
X-Gm-Message-State: AOJu0YxKJIha49fiIctZBcZ8RR4D0wxnIYGq5urnWRb2dE8IRjjb8oMw
	ydQxtpnjpW0cWNFi7V8Cjd++P+XqewKFVnbq/LJWmF2kK+V4FQo29xAkmBtUuqnuIoIEiTk2Kg/
	sz8iHDwQhdLJJgrmajbP7OxfVj8uni1E=
X-Received: by 2002:a05:6512:3257:b0:5b0:165f:17fd with SMTP id
 2adb3069b0e04-5b2f4b885d3mr3739706e87.14.1786313728379; Sun, 09 Aug 2026
 15:15:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260808092634.2734292-1-lgs201920130244@gmail.com>
In-Reply-To: <20260808092634.2734292-1-lgs201920130244@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 00:15:16 +0200
X-Gmail-Original-Message-ID: <CAD++jLkcpHW-YKscKfMYRdD_T483jcUBYjz4gbP3EbV0fVLATg@mail.gmail.com>
X-Gm-Features: AUfX_mxLzMOnoTQp5mJwejOlPlhyNTugg8h4U8BlsHNCbaahLgre1Sqq4KSyD6U
Message-ID: <CAD++jLkcpHW-YKscKfMYRdD_T483jcUBYjz4gbP3EbV0fVLATg@mail.gmail.com>
Subject: Re: [PATCH] crypto: sl3516: fix autosuspend cleanup during teardown
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
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

On Sat, Aug 8, 2026 at 11:26=E2=80=AFAM Guangshuo Li <lgs201920130244@gmail=
.com> wrote:

> sl3516_ce_pm_init() calls pm_runtime_use_autosuspend(), but the
> autosuspend setting is not undone if pm_runtime_set_suspended() fails
> or when runtime PM is later torn down by sl3516_ce_pm_exit().
>
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during cleanup, this reference is not dropped and usage_count remains
> unbalanced.
>
> Undo the autosuspend setting when pm_runtime_set_suspended() fails and
> in sl3516_ce_pm_exit() before disabling runtime PM.
>
> This issue was found by manual code inspection.
>
> Fixes: 46c5338db7bd ("crypto: sl3516 - Add sl3516 crypto engine")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Looks right to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

