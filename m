Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE222CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 19:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lk9iSSgZ0K7NUDTpfPogbBYuXleRT/4S8QKOKfm8Fo=; b=UFSrXjXCvwKmEMyYV+m2+iLpTM
	XtjGFtRFIpQXPZlAHBUdS7eSeb9iQ7PReXvAb6V4v86ZIBQagWaUYbUwAmX68LFksAskMWBiBbQPA
	wbNd1MI8vPx0Dg0kSmPhxbqTCp+m0i0+JX0lyItbhaQU56hJyFGG/su1evfX4IHdZwfE06oFEZ6bz
	68cB+T5Qa8fozW7FOHoNZXFXjOjseP9pl/p77Qy6a6rhzH3edQcmhDR/l/+sCJpDUI22utHAh0pHL
	7m9ZnxXYgvQQeSYg1k4lyXCJXXdImBYbLLz9XEKZP50AvJl0dAh6CbgylTu7Kz+O3MW3FVjfLqzVS
	wZBi/LPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNc5E-0000000CEXq-2l4E;
	Mon, 24 Nov 2025 19:18:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNc5E-0000000CEXj-0sM8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 19:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E2A360122;
	Mon, 24 Nov 2025 19:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E117BC4CEF1;
	Mon, 24 Nov 2025 19:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764011923;
	bh=Tx8AB1SA68OjpJGaBGshivP2neQNWcZSQoIkHV53Fdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dvE/K7+Yx5Mgd0+r3X5BUhZ5lArb5ERUn2RxDc4De0sYovnYUBB0PHGcv5PBQ1A1v
	 be1PUQOAI7nJ3fbWzIiTbl4p+AS74dLMl/1LBZ4tJgs6wJoYlxeFZoaniybyT8ZsgU
	 bylxn5id1LvzAKZWdnmLsWlziCk/FyEETRZWw0mTeHF4j42QfI549aSdqLmCknFZrK
	 NLeX46GbzfxfHj7cZg8lxmD5z4KHgr6DNB9oBAwi3flWUci0tvO83nf1ybL/fYFiMy
	 R4/YFrw2sXVxC+yBrtjXXzHbJl2Q/mN+TAeHLf32dFBpq0LU9K0/Nc/QXjD9kUVYxd
	 DK3W/w55oHGTw==
From: Will Deacon <will@kernel.org>
To: Frank Li <Frank.li@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Frank Li <frank.li@nxp.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joakim Zhang <qiangqing.zhang@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH v3 0/6] perf/imx_ddr: Add i.MX8QM and pmu in DB (system interconnects)
Date: Mon, 24 Nov 2025 19:18:30 +0000
Message-Id: <176399874665.521575.3051557105547982197.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251103-qm_dts-v3-0-2bfda8ee14c2@nxp.com>
References: <20251103-qm_dts-v3-0-2bfda8ee14c2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 03 Nov 2025 16:48:27 -0500, Frank Li wrote:
> dts: add soc specific compatible string for imx8qm, imx8qxp, imx8dxl in db.
> driver:
>  - did some cleanup
>  - add support for pmu in imx8dxl DB
> binding:
>  - add compatible string for imx8qm, imx8qxp, imx8dxl in db
> 
> [...]

Applied driver changes to will (for-next/perf), thanks!

[1/6] dt-bindings: perf: fsl-imx-ddr: Add compatible string for i.MX8QM, i.MX8QXP and i.MX8DXL
      https://git.kernel.org/will/c/de8209e55408
[2/6] perf/imx_ddr: Move ida_alloc() from ddr_perf_init() to ddr_perf_probe()
      https://git.kernel.org/will/c/66db99ffdfcb
[3/6] perf/imx_ddr: Get and enable optional clks
      https://git.kernel.org/will/c/037e8cf67178
[4/6] perf/imx_ddr: Add support for PMU in DB (system interconnects)
      https://git.kernel.org/will/c/11abb4e87b0e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

