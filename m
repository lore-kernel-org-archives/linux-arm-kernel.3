Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B619C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXLHhSC3baWFHNZu1Qcd0OlNW50IsuJlgqvgKTVshG0=; b=lq1WRBsT6igVuTGKlEvvVqnwpt
	IbkKyAKq71M+3ySOUQF5vEa4jtG09T2YUxQMHIZmFRSgwgzIPBodzJTFfDiV45XpAxznq5Sl+Ris7
	0YjxUs14RDHqt/0bxoYnmdZIb1CXD+E/PsP2PuPndLvxbHgA1lcN3BejpaXrcDBk4WlCG7cbqqX27
	oAVSAJDL9+q7/dRxE7IUq8y9/2oWVZNYyTZuzqhOuQVYDc3D3LDrbZezQgIM0KRtCTYWU9VY16GjT
	iA2drClZLTrRQyLRntnb1ehZUzrwZe9GzlxZP/GZfvBELPKek1yjFEWjlGCCOKf2YDetuLEDun69Q
	FixdhFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkUm-0000000EU5M-3boF;
	Tue, 27 Jan 2026 14:56:44 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkUi-0000000EU4f-0tRq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:56:43 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=KXLHhSC3baWFHNZu1Qcd0OlNW50IsuJlgqvgKTVshG0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769525777;
 b=Rq6I+Lb8znXr+RkyMMwkde4YtuZUfetoWL0YoBf2u3yz6yMfHMLc7AKKfV++FsDSxSosFTh8
 z/V7A+i6uJ3Y/wvhuGShFLzfRfG+V7Ie+NxAtQ9UWg1oLn9u2bEl7K9fyn7cR8cDqvr9wKPyaRb
 Bv70GsTnO4tn23ReTPhQIlYM2BnqToqmlydlYXojKjle+GYfupsjz2qE4YYW1y4EWwRMySH7aRT
 nd54/yLAQYe9955u9rPwei45uKItOI6JSi1q/M0WefG1Ca2nLvHDBND8raWcgdgFZqF3RQZnlp5
 wZEyaU9KiytKyFtyXmVrv6ZXkxEuASlEq/sAHQdL8Oa9A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769525777;
 b=U86LKEX1tuNxqqTNmfs8KSu6wkUHIQg4vW6UKANH5+YdjZzWXx2eblAuZ0732RcJJH9JM1DF
 WMU/0AKqKex0iOApehUGi3i87EeHSu+qVvpZ+DrSgMiXM9k9zM0v0Pk/kq8FNOu62tVMbwXQxyd
 0TH+lGCjyvWsyip2nuaVtsPQ3ooW36ZZcl5QceSAczwfiNJcRysqb57B7bXldutKbkvzsvsUOWX
 DkvuRERsqIH/V8EQTxXnmwdt/jjqAqAZ558jCuiGvr/0rX5CYQQWxs+ITqC/yqDSCmxomx53MiO
 vUDBtLN+p3S/OjLlMLrO3zhXDSBl1DnGS6iN9Eo3qyPOQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 27 Jan 2026 15:56:17 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9FBF6CC0A1D;
	Tue, 27 Jan 2026 15:56:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?ISO-8859-1?Q?N=EDcolas_F=2E__R=2E__A=2E?= Prado <nfraprado@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH RESEND v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Tue, 27 Jan 2026 15:55:29 +0100
Message-ID: <6239343.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <176913273374.4027.10690199843699119944@lazor>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
 <20251215-mtk-pll-rpm-v3-1-5afb3191e869@collabora.com>
 <176913273374.4027.10690199843699119944@lazor>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f0pPf56qSz3yXl8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 488e984b4919a202955d5ac62586d299
X-cloud-security: scantime:1.885
DKIM-Signature: a=rsa-sha256;
 bh=KXLHhSC3baWFHNZu1Qcd0OlNW50IsuJlgqvgKTVshG0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769525776; v=1;
 b=gr8AcmwHBtlT9PYa3uNjVwYapGAyfd7tBN1LfjWuu7R2x85FmSye9fxsjWdqAFO0MnP8doQK
 yOV6vgluCVPgZl2pPxBxgKx+YfegcxGdprU0j37k95mafJDZq4X2Sd0x/9quLRXEpJTSE+WshWC
 M9eJRmr3B9Y78sSIBJ7nQr1AVM/g5ZDvb7kkWHesQlYxsuJgNUO/83+Rxsd76uWuTz9Ct9r/nlG
 hvnjBgOjz5SXdw7KA96L9wOatwhb17D5wsCGHrkQEsNGCO91jT/hIOdDyuD6c6LhxbWe9F6qRi4
 mh6uzqy/anZI/8/02JFy9vOb5NinlVhs7nYk5+Cw2ce1Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_065640_505127_8D3D277A 
X-CRM114-Status: GOOD (  12.86  )
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

Hello,

Am Freitag, 23. Januar 2026, 02:45:33 CET schrieb Stephen Boyd:
> Quoting Nicolas Frattaroli (2025-12-15 03:23:58)
> > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > operations, such as setting the rate or switching parents. However,
> > another operation that can and often does touch actual hardware state is
> > recalc_rate, which may also be affected by such a dependency.
> >=20
> > Add parent enables/disables where the recalc_rate op is called directly.
> >=20
> > Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents =
enable (part 2)")
> > Fixes: a4b3518d146f ("clk: core: support clocks which requires parents =
enable (part 1)")
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
>=20
> Applied to clk-next

Unfortunately this breaks my board TQMa8MPxL+MBa8MPxL on next-20260126.
Last lines on bootlog (earlycon is necessary)
> [    1.175639] Initialise system trusted keyrings
> [    1.178907] workingset: timestamp_bits=3D42 max_order=3D19 bucket_orde=
r=3D0
> [    1.185822] NFS: Registering the id_resolver key type
> [    1.190295] Key type id_resolver registered
> [    1.194473] Key type id_legacy registered
> [    1.198515] nfs4filelayout_init: NFSv4 File Layout Driver Registering.=
=2E.
> [    1.205235] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
> Registering... [    1.213235] cryptd: max_cpu_qlen set to 1000
> [    1.274689] Key type asymmetric registered
> [    1.275939] Asymmetric key parser 'x509' registered
> [    1.280896] Block layer SCSI generic (bsg) driver version 0.4 loaded
> (major 242) [    1.288278] io scheduler mq-deadline registered
> [    1.292840] io scheduler kyber registered
> [    1.299245] ledtrig-cpu: registered to indicate activity on CPUs

Reverting commit 669917676e93fca5ea3c66fc9539830312bec58e fixes the problem.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



