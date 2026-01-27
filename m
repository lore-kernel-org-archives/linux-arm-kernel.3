Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BF5D2FED4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 18:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1O10nq57uF2yonMLHejTJonR3kk2tYwvSO30+vtuA7Q=; b=o96vh9UVDjkDdgLCvupxeCmtVk
	ev14NCFnb0Y1a95T5ZOsZJ7NCkWRBjkQupH6H8E1bm7cZdCxhsYN1USkpPfTyg11PJkjS15AZcEf4
	MdIZEl3xBh7yS9A7u7SJc4DrgNPd3mRzd4Ly7r8o8/EzPHb35uPpXHbJoYl9Pp8K1gJl15silIaz0
	wp2mxJ9C6z/8N+xinBn354dfia1cGHGLTjRMNS8bysr3hfElFHpsstBVztGeXXHOI1K+F7e49Mcoe
	dY/QguhfUp//2vBT4cVFYfwQ7n/3u/WtErb5TXCBHT8QhoBc4s3ZFXuu+t7MyjFiZPEwrm9rMPA8N
	liZwyUvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkneA-0000000EnjJ-43oT;
	Tue, 27 Jan 2026 18:18:38 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkne8-0000000Enim-3pLV;
	Tue, 27 Jan 2026 18:18:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769537891; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fEb0Cw0/fBkS8pB0EZvsd01qretjQhA9PdmsjDAZ2GyHqlsAwojf9WvigoKbhEdpZFndyMkv+fPCTQAtVFxTEEMO3W9tNaxKQTXWaEzvhZtn2INA42ZQaitNZYDILx7m+TnXWk+2m0wzyW4G/7T0yYs8xFQ4UlCF6HXkjyvNwBk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769537891; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1O10nq57uF2yonMLHejTJonR3kk2tYwvSO30+vtuA7Q=; 
	b=Udg8Byuy82YLS3nLoyIU67KXzJ9Jo2n15L1LIv0ZbWZmijGKUbK0KWSI26REhRRnhVTtfm+58TLJArSSxVokMMBfXtrpaoOIkLmv/x0BhwEX3bBL2nuGSdNjA8ca4jSOwUn9ucBWNRZyvJy6OKVlnL1U8FC5jW4zj3ZfUr641b0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769537891;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=1O10nq57uF2yonMLHejTJonR3kk2tYwvSO30+vtuA7Q=;
	b=cgyGGkiipdrS15+YkTQU3VtWMDwt3STN5bYx656tenyNtnVtPXA4PeTjgpF9qlEt
	EJNKoG8RiZZfemBiNic0WN4pLV3I6hcyOWJNHY0lLzOxLzt4idbPvN+sK4VO9xZFJ5J
	ZzI/VI4v1vHHGbBPzIGp6xh61Vw48cb+FWkJ6jgQ=
Received: by mx.zohomail.com with SMTPS id 1769537889900300.4354081160377;
	Tue, 27 Jan 2026 10:18:09 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Tue, 27 Jan 2026 19:18:02 +0100
Message-ID: <6800096.lOV4Wx5bFT@workhorse>
In-Reply-To: <4ea31b0d-af6e-44f7-86e4-35a43b8c71e7@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk>
 <4ea31b0d-af6e-44f7-86e4-35a43b8c71e7@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_101837_017181_11690EFF 
X-CRM114-Status: GOOD (  20.10  )
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

On Tuesday, 27 January 2026 18:25:04 Central European Standard Time Mark Brown wrote:
> On Tue, Jan 27, 2026 at 05:01:35PM +0000, Mark Brown wrote:
> > On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> > > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > > operations, such as setting the rate or switching parents. However,
> > > another operation that can and often does touch actual hardware state is
> > > recalc_rate, which may also be affected by such a dependency.
> > 
> > I'm seeing boot regressions in -next on the Avenger96 which bisect to
> > this patch in -next.  The board resets during startup:
> 
> I am also seeing some similar regressions even earlier on i.MX8MP
> platforms, though they're resetting even earlier before any output is
> produced (even with earlycon).  Didn't confirm yet with a revert or
> anything though.
> 

Someone else seemingly bisected to this commit on i.MX8MP as well
and replied to the RESEND of the series, and confirmed with a
revert[1].

I'm somewhat surprised by this, because to me it doesn't make intuitive
sense that some platforms would rely on CLK_OPS_PARENT_ENABLE to not
enable the parent clock during a recalc.

Can someone let me know which clocks (with which parent) in those
affected devices is causing this? I'm wondering if this change
unmasked some undeclared dependency that it's now stumbling over
because it's enabling the parent earlier than ever.

Would appreciate if we could fix up the affected platforms rather
than revert this, because the platform I added this for was
definitely using a parent-child relationship, and definitely
needed to have the parent clock on during recalc.

I can always bring back the RPM model I went for previously, but
that feels like more of a hack around this caveat than a proper
description of the clock relationship.

To not have me break everyone's -next for days on end, feel free
to drop this patch. MT8196, which this was added for, doesn't boot
with mainline yet anyway.

Kind regards,
Nicolas Frattaroli

https://lore.kernel.org/all/6239343.lOV4Wx5bFT@steina-w/ [1]





