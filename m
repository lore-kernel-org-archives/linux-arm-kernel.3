Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF79AE9B24E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 12:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPCdU8qlDnneQjdIWhtLLRjwYIcMnaxrk0b2pZgW4m4=; b=jeSMQ3Jn9jwI/mWw2KNEkgVBYF
	sXjVIbEUiez7becVImDa2yyXOfBjPUV0S+/1kAx1XB2rrX3fX64IKpNtVMZZ+CTdBiNzLx+B/G3XE
	wTkYukTzt5PnyuXJNXPzFaU4vT8ZKAJ/HwUZ1/HAYMeU1OjvWTELiAm01ZNeTG3qEe3BUpwV4RPid
	+AbByMhvyX8t8V2D0qdWTlJEMyWZrqao9PD77IB24YOmQJ/35yG+qAf4VgMTe6/TITzE2swfeB9Hr
	ojJKEQyVTg4hpFImeqg3DXwcvOHFeHG/rad+Ksflm3eR1nam9+ZUTGbV2wrfAoIlAVGzNGll1JQeW
	9l9eBimw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vur9u-0000000212R-1BI6;
	Tue, 24 Feb 2026 12:04:58 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vur9s-00000002124-2D3m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 12:04:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1EE5F43949;
	Tue, 24 Feb 2026 12:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBF3C19424;
	Tue, 24 Feb 2026 12:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771934695;
	bh=Qz9qdMX+vBbJV6Arts3WVnCOBY9g2cEaJRQR11r+cxw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=lZiR7AxqIghjBpkiiGPbBNU5t/SUaLyeoB/0nQt2fSrl1Beg4CgujW9KAO47LRyGB
	 gRMEnoLvxX/Sk1/OmRxBRu9b9fjgMF0N/JReEMBg52nVnVgyZONl7bJM1LU0wpbtof
	 BUwAM3slBbS+Og0xUMNsx7hI6+TsNz83haBAjl5Nf2JGdoQuzPbHVpF27vtd94qnup
	 ByA+2P/nqhdUIiANEa/jqtWGbg1TTOlE3p2hWNf/tlxsHQczMXoaO6+iR93fHSN90J
	 Da3VCwvil8CKtBctvBhguUvplmPGEMPP2AOfgoxBdFtoGRQGvRx/PfQ5zfTRdZBBLj
	 Hs6tAA3QVwr/A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 13:04:49 +0100
Message-Id: <DGN6FANOYD3K.AFFNS0QXPCQW@kernel.org>
Cc: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <daniel.baluta@oss.nxp.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <Frank.Li@nxp.com>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>
To: "Abel Vesa" <abel.vesa@oss.qualcomm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
References: <20260212235842.85934-1-dakr@kernel.org>
 <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
 <66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjhanx3bif@i5g62ziautwq>
In-Reply-To: <66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjhanx3bif@i5g62ziautwq>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_040456_619752_94DB7A96 
X-CRM114-Status: GOOD (  15.81  )
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

On Tue Feb 24, 2026 at 10:57 AM CET, Abel Vesa wrote:
> On 26-02-23 21:21:29, Danilo Krummrich wrote:
>> On Fri Feb 13, 2026 at 12:58 AM CET, Danilo Krummrich wrote:
>> > imx_clk_scu_init() registers the imx_clk_scu_driver while commonly bei=
ng
>> > called from IMX driver's probe() callbacks.
>> >
>> > However, it neither makes sense to register drivers from probe()
>> > callbacks of other drivers, nor does the driver core allow registering
>> > drivers with a device lock already being held.
>> >
>> > The latter was revealed by commit dc23806a7c47 ("driver core: enforce
>> > device_lock for driver_match_device()") leading to a deadlock conditio=
n
>> > described in [1].
>> >
>> > Besides that, nothing seems to unregister the imx_clk_scu_driver once
>> > the corresponding driver module is unloaded, which leaves the
>> > driver-core with a dangling pointer.
>> >
>> > Also, if there are multiple matching devices for the imx8qxp_clk_drive=
r,
>> > imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
>> > any subsequent call after the first one will fail, since the driver-co=
re
>> > does not allow to register the same struct platform_driver multiple
>> > times.
>> >
>> > Hence, register the imx_clk_scu_driver from module_init() and unregist=
er
>> > it in module_exit().
>> >
>> > Note that we first register the imx8qxp_clk_driver and then call
>> > imx_clk_scu_module_init() to avoid having to call
>> > imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
>> >
>> > Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_matc=
h_device()")
>> > Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as =
modules")
>> > Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> > Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
>> > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/=
MBa8x
>> > Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.o=
rg/ [1]
>> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> Acked-by: Abel Vesa <abelvesa@kernel.org>

Applied to driver-core-linus, thanks!

