Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA526CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUbWCd4uA8L8ygZtERA+T3ccKTe/KW3JOZWQf6S5pFc=; b=u0vDojBih1XgS94llQ662qLbsW
	nlLvEx6bkWZiFWiqhcPslXBzucD544BrJrs7+yDVd+CuD+2zS58VzlKobfLXjOD4rT7MsqKo6OMG7
	mDcd9Y7TrCUcn3SCnHY+MR2kGrslVh/XAvT/rsAdllnyFHZq6Rom3GCOCmhhox1sS+QfFPisUXGPQ
	RfB+naaiBqEkSHeTB/MYQMqSoIuU7Lrals5uzlmwsA3jvAVWG/ZFefXrw/1X5JTbNwp25Gsj3hTf0
	oDfLOMh1JM/6/iaf8C+vu6Ikiu3wzK9Bqpx27xI+5ThBait1SqeDn0xGGeceBlTYEf5LhoZxTqD28
	+iKb6ElQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdtb-00000004y8A-3FAa;
	Mon, 22 Jun 2026 12:36:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbdta-00000004y83-0r3D
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 12:36:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 830CE444B2
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 12:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A881F000E9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 12:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782131817;
	bh=eUbWCd4uA8L8ygZtERA+T3ccKTe/KW3JOZWQf6S5pFc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Ed5RBPSrde6oG16TaYRw3tVUKs9SCnLtVL9wZBJaP/0BcZP4vP81dsAm+GeJNXEuj
	 uER6UzlgZg0hVsDxBRfJ7kq3WhrKxEF1J/SNW46qN4xHnE29H69evmlUlgADDUTJee
	 B1bQZNb2gMRJYQZbxrNyGN6FwW8VQzU1NiCDaG+PSgVAhxwc1Wo39jYheVuDSDFB2+
	 Q+Tr0HfGl5XrTc79n6t1wHwmZYl68+QlSuDpfs6cat8T63CoiGMCoAxqpJN+gLKtHn
	 8jtazVD+BwCMExjTf8XQsrWX8Oxrj4Sg8BRE+XAtQCHAJA157TgBTVyqQbVHAfbMTQ
	 +O6WU3oR/A+/w==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa68d9d56fso4936575e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 05:36:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+b4/91Au+WDL6Xu0QhtdXNIDSrlCxYUeqDDbui8g6wqsMMA8jINDSyISJDG6iWfAO5VXSZjDeuFTa26+Pc6kj8@lists.infradead.org
X-Gm-Message-State: AOJu0YwqfS7lcnFOooCDYeAy4HyPaqKem0kJAGycmKn+UKlqIBu2RPuT
	ye6Gtk/cWdgSxug6EPLJRJ/tPlRLQg0oLCFrRvPFLUzut1aHzWsifl/T/+Pu26DOrT0uaVLODgM
	huZ1Gs7Pn2pzbMen5JzyJ/Fzu/iWwsxc=
X-Received: by 2002:a05:6512:3ca6:b0:5aa:8824:1571 with SMTP id
 2adb3069b0e04-5ad58f5896bmr3300879e87.49.1782131811251; Mon, 22 Jun 2026
 05:36:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260622043015.643637-1-haoxiang_li2024@163.com>
In-Reply-To: <20260622043015.643637-1-haoxiang_li2024@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 22 Jun 2026 14:36:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLmEUnYXwm3VWMSZJW-rtQkQniyhcs_0J5ex9OxsP=2SxA@mail.gmail.com>
X-Gm-Features: AVVi8CdfcYAReKAYIfo8lQyvbhkLo8Uu4wjTfvGwWbMoKmleSl20UIG87a7HorA
Message-ID: <CAD++jLmEUnYXwm3VWMSZJW-rtQkQniyhcs_0J5ex9OxsP=2SxA@mail.gmail.com>
Subject: Re: [PATCH] net: ixp4xx_hss: fix duplicate HDLC netdev allocation
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: kaloz@openwrt.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	huangguangbin2@huawei.com, lipeng321@huawei.com, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
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

On Mon, Jun 22, 2026 at 6:30=E2=80=AFAM Haoxiang Li <haoxiang_li2024@163.co=
m> wrote:

> ixp4xx_hss_probe() allocates two HDLC netdevs. The first one is stored
> in ndev, initialized, and registered with register_hdlc_device(). The
> second one is stored in port->netdev and later used by the remove path
> for unregister_hdlc_device() and free_netdev().
>
> This means that the registered netdev is not the same object that is
> unregistered and freed on remove. It also leaks the first allocation if
> the second alloc_hdlcdev() call fails, and the first allocation is not
> checked before ndev is used.
>
> Older code allocated the HDLC netdev only once and stored the same object
> in both the local variable and port->netdev. The buggy conversion split
> this into two alloc_hdlcdev() calls. A later rename changed the local
> variable name to ndev, but the underlying mismatch remained.
>
> Fix this by allocating the HDLC netdev only once and assigning the same
> object to port->netdev.
>
> Fixes: 99ebe65eb9c0 ("net: ixp4xx_hss: move out assignment in if conditio=
n")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

