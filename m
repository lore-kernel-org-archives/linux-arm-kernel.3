Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBF6CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IvxNpbDZSTuVJu5n94z7iJrbofTyan2ItN/2vmT2AiM=; b=pBRFbyDWtpd97Dk3ClluH2qhOW
	wbNJ0UzVUF7Nv7ZyZIBtZMBfqUKwUcOU4V0jr5yzg0FxmLxEOdGcayBHl0xXqVFCjG7Zu8RCONE7g
	FIuBYCP6YE6NmYXkEQvCuyxowzk2iuZbAYtwrUg1be7/quVLNkacUmIhpXbE0rCM6uz6HHISq5LiB
	rG6bUe6sQNsFrPeoU8bT21Q305INwgSqBQ7H3mqShYcnIKiVUPbTBnF6g7Ap3tpaJLlPXTIM8JRpE
	3gRHYXtCcU3ZCDXp6r19V3AmgB51zaPjAAmlIXmEfMTDxm400PJ6DDtZ8FW1zN/RPWYm8AucEe5Kv
	zdo5zQ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuB8-000000066mJ-46sE;
	Wed, 30 Sep 2026 13:16:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuAu-000000066iq-3xok
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:16:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3B17060252
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55D51F000FF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 13:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774203;
	bh=IvxNpbDZSTuVJu5n94z7iJrbofTyan2ItN/2vmT2AiM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=RentgNfCP5OC7+X/eUcuFMOjk00Jb3jhuw/iuAqcGJrp2778CNe9iia7cs5FBxA4l
	 r9U2RvTQxDbn9FfzbqRAZWLAZem9D9aVeqUqjU4AEatzSnTCmvdpO/x73E9OgUzoha
	 w5b2MJ+NS0ImR+++v6P5G2+Gd6GNScfrB6JSvXxAiCAjbMhySCSofMofXJYMuUPqFv
	 45eKjpiHxTYWLdsVQ2rAu0hRxwi7U6ySuxxYdkCim+pQuidX2VJht7DPt3YvDeS/5C
	 5cQl369bvhdk9CLHSf6xE8tYQcJ9jloyHpXp2zJAVIV5V5fmJncjR6JjvEssTo/LoQ
	 lp4Jlp0vsMHBw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3d84150dso590328e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:16:43 -0700 (PDT)
X-Gm-Message-State: AFq9FYJO5TuqtThzdZpj62hlP1WWJ1txWUKxioKbx2RlxOUCCkf18ksm
	ERyXToLAIrGADLSC/Irav8Uzgef3V5k62JySgtd83cPrhb4FvcXH8s88lZ/7JnzbkryShfth50P
	O0BHXhM7Ez8F67Q8dQ+/27NX8GKLpG/A=
X-Received: by 2002:ac2:554a:0:b0:5ba:3d18:39da with SMTP id
 2adb3069b0e04-5ba405e3180mr400071e87.45.1790774202749; Wed, 30 Sep 2026
 06:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260917134811.2153902-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917134811.2153902-1-vulab@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:16:30 +0200
X-Gmail-Original-Message-ID: <CAD++jLnpPgLS0ctWL6n7_293mmE0gzZbxGTE9y8A=O19-JVMhA@mail.gmail.com>
X-Gm-Features: AclHuK_4EsGObMTSoIffXJHHoNHOljACQDjIXC-QnuqdASt6KV0myUbfgssO338
Message-ID: <CAD++jLnpPgLS0ctWL6n7_293mmE0gzZbxGTE9y8A=O19-JVMhA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: Fix clock reference leak in ma35_get_bank_data()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, schung@nuvoton.com, ychuang3@nuvoton.com, 
	stable@vger.kernel.org
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

On Thu, Sep 17, 2026 at 3:48=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> wr=
ote:

> ma35_get_bank_data() obtains the bank clock with of_clk_get() and
> stores it in bank->clk, but returns clk_prepare_enable() directly.  If
> that call fails, the reference taken by of_clk_get() is never dropped,
> and the driver has no other clk_put() for it.
>
> Drop the reference when clk_prepare_enable() fails.
>
> Fixes: f805e356313b ("pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO drive=
r")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Patch applied. I dropped stable because it's not that serious.

Yours,
Linus Walleij

