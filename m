Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0313ACC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10KcGlhH+sxjQwKLfJ38UlR5MoVIIqV+dyNBJmZ6BDw=; b=Hvf6cNKYW1K/EEyrosKPAgbC93
	PKkweaT4Y1DyRMKxxSXwD/Se9n/y1ogsD3kgF4maWJFaW6OHfsa1/GT/2e3ShLp30fGSqJxFA0lP0
	I/bvSIqPVqpla0hyGEwHRtCkPELk8XTvPmT76/21KZDiYG0f2IKLvNrGg/xSrV0KtGktrA3xOYjcs
	Z4LEaYLaOeJ/ghG2kjpgkWfPbklhUvOmAQHdsy0O3qAQkMMn+inSWTZmYsyP0psL/KPKoFe2qrpCy
	kb6q+TQRE2r2pBgOc5W+REwT5460DL6ZZ50ioum6y4mQ5s+pXCQd98rIHV6dxstY/A3KrQoKBSAV6
	gZX17KvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKgQ-0000000086I-3y8j;
	Thu, 15 Oct 2026 12:35:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKgO-00000000864-1yrM;
	Thu, 15 Oct 2026 12:35:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D445D60120;
	Thu, 15 Oct 2026 12:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7B91F000C4;
	Thu, 15 Oct 2026 12:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792067738;
	bh=10KcGlhH+sxjQwKLfJ38UlR5MoVIIqV+dyNBJmZ6BDw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=D+QJGHWZbpckHr726CHantgd1VlHyyrYohh2Jt7jth1cLZ0NAB53nJYmda4thNt58
	 BDvhy/RlnZq15T5hrg02FSexSr+qHMv+LbeMT0O6PzY4gJJgcT633lRscigKHH8CXT
	 vea+GZ7pLCfK/w7MJKiUZ9bm4L/ByNXAI0zNjBHVsy6N70QC/zVixd6cwIKz2amMhJ
	 MY9ZpwYnjU25Nzd3qdk1gWK1RixRnGjiVwPg6rOXN+1p8o6s5qts4sbWWHp2MQ2L5P
	 QZMidd+Zn+4fXmLDxD/pfzjz65MAxidh/vhp0yeufYN4HjVj6B6P9G2van7NFPPd0m
	 A7blbHhDKMb1A==
From: Thomas Gleixner <tglx@kernel.org>
To: Radu Rendec <radu@rendec.net>, Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Daniel
 Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei
 <houlong.wei@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, "tip-bot2 for GUO Ren (XuanTie)"
 <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it consistently
In-Reply-To: <6a4202752078c5f55882d3a4f5113829201dfb7b.camel@rendec.net>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
 <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
 <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
 <6a4202752078c5f55882d3a4f5113829201dfb7b.camel@rendec.net>
Date: Thu, 15 Oct 2026 14:35:35 +0200
Message-ID: <87o6cvdtuw.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Sep 17 2026 at 21:38, Radu Rendec wrote:
> I now realize that patch 1 (which introduces the conflicting change)
> was picked up by Thomas via the irq/drivers tip branch, but patch 6 is
> strictly a media subsystem patch, so I guess normally it should be
> picked up by a different maintainer via a different tree.
>
> Thomas, are you willing to pick this up too? I'm thinking it could
> avoid some pain if irq/drivers gets merged into mainline first, before
> patch 6 makes it there through the media subsystem. Also, it's a pretty
> "innocent" patch, it just renames an enum value, and it's contained
> within that driver.

The media folks picked it up already.

