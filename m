Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B521C54755
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=orMYHSP5ssuSjH/hleG580PAr5anMD7LK5PDBxTlud4=; b=IdM4FmwWRtOasRBBph1PR3ZJ6c
	zDNE+PLWh5aCeXrObkm403DjQFhHEaWJRftPkNTv6FEKkG3fRrpss8+CI8vuu/Zv3XdSQkuHj4fvQ
	cxsBbBH4Kp62M5p5LBWpxlPWu5qp6ee5d9yp4TNGu+Bznlk90Nsah3CInSGIViHD/yrVwjKKe8UfZ
	qLyts+fg6PQ7gltd6jdK1XuqBdfdmtvCmOKOfCr9t3pwxjoJbScrkDmepUlakf9J3Jfv2Gxh8XHhP
	Q2evoqB78bZ5ZpMjTPGsmEGMKAYiHigX3EKhvKC4ITgVk18L2cjz9ybUS3zYVhp7f29ZOsC+jG+yu
	p1VNGf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBU-0000000Ftoq-3EYy;
	Wed, 14 May 2025 17:46:24 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEOP-0000000FeHY-3E1O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:51:40 +0000
Received: from [127.0.0.1] (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 9891B1F91E;
	Wed, 14 May 2025 17:51:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1747237888;
	bh=orMYHSP5ssuSjH/hleG580PAr5anMD7LK5PDBxTlud4=; h=From:To:Subject;
	b=dh3coW4lpuAUBquC4TUhoOP6ncC52bSE3nyZgB9wUZ8JgoTeM4NA0O9X36z3/vtmo
	 vJClLHwHAToxJZFfYU/405c0DDZZbhU9mSwRqzpVEp8VZwvI1zjmesY82h8ldUHTVI
	 0wIUaBu8yYLgGehvIysDjZPsiyOxxy5xFMkItZH14Jo3Cj0dembW6Sv7d/fx7V9A+d
	 7fUrmnOWc+DJt4Btqe44v2qQ9R9yteHA32eRWCGL2bRcP5ywsTphx4dY0Os6xZLWih
	 mETPsXNNgc5LqtDk7sxrELvXasMoWYwud3y50B7RKwsrR3J52QgstRnAxNhIjl/UBg
	 U4Hq3Tw7DYKvg==
Date: Wed, 14 May 2025 17:51:27 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
User-Agent: K-9 Mail for Android
In-Reply-To: <tds5osuthulo4bnlck6dgx3g3aoanca3my2uczdhcipcfcxgpp@opzseflynjar>
References: <20250319145114.50771-1-francesco@dolcini.it> <tds5osuthulo4bnlck6dgx3g3aoanca3my2uczdhcipcfcxgpp@opzseflynjar>
Message-ID: <3C1EEBEB-E691-4EB7-A008-A1FE9CEE7238@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_085138_855004_5E66323C 
X-CRM114-Status: GOOD (  10.31  )
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

Il 14 maggio 2025 17:14:32 CEST, Andi Shyti <andi=2Eshyti@kernel=2Eorg> ha =
scritto:
>Hi Francesco and Emanuele,
>
>On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
>> From: Emanuele Ghidoli <emanuele=2Eghidoli@toradex=2Ecom>
>>=20
>> Rework the read and write code paths in the driver to support operation
>> in atomic contexts=2E To achieve this, the driver must not rely on IRQs
>> or perform any scheduling, e=2Eg=2E, via a sleep or schedule routine=2E=
 Even
>> jiffies do not advance in atomic contexts, so timeouts based on them
>> are substituted with delays=2E
>>=20
>> Implement atomic, sleep-free, and IRQ-less operation=2E This increases
>> complexity but is necessary for atomic I2C transfers required by some
>> hardware configurations, e=2Eg=2E, to trigger reboots on an external PM=
IC chip=2E
>>=20
>> Signed-off-by: Emanuele Ghidoli <emanuele=2Eghidoli@toradex=2Ecom>
>> Signed-off-by: Francesco Dolcini <francesco=2Edolcini@toradex=2Ecom>
>
>this patch is causing a build regression=2E I'm going to revert it,
>please check the test report that has been reported and you are
>cc'ed=2E
>
>Andi

I am looking at it, it's a warning with W=3D1, not a build error=2E I woul=
d not revert this patch, just wait for a follow up patch or comment that wi=
ll address that warning=2E

Francesco=20

