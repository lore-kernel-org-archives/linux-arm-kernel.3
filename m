Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E51D103E198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZcTCvDWNYhwL5aIva1TcnYFhkqSUso57heTWNGgxto=; b=eOzn7k+IusifZJXwL5EuM9Wsch
	QDLClmSTwCs9ERe2sRQjJ0kzRzpn6xEVdbYYaJ+7KXDOAx+SXx0sL5c114bzBMf+9q2ej7RZXtmmb
	fzL2R8YtgSyRVuoXFauSBX8bld2dtRSbrUThtkFk9yCRJc2SDWjCwRQZdc9Ye9FT7wyAVCvKSrr7F
	acvDj5yo50fDYwPiLgx4RYrdLW+pJi9T0KuaI+xVTDUEjlDch2KqfCotsigxfqY95EA630T9V3TTZ
	EkV9TSQ6nDKA80DvNxuc0HA2iWmMt+JGiJRo14jmdFkdfsAvX+IuyJHazO30VK5TB506tCuuwq8ds
	nfq4DL7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t2v-00000008kWb-3ka0;
	Wed, 18 Mar 2026 15:42:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2t2u-00000008kWV-22Xx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:42:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DA7560097;
	Wed, 18 Mar 2026 15:42:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AA4C19421;
	Wed, 18 Mar 2026 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773848575;
	bh=2x4oVweRq+GVYi6zSzJwmZ8lBsQqyfo4azqIWus+kl8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=r+4Kp5J/s/rGrmhmwHSop9Jokx/zvQ/SWVDm3h64t/HvP+WU59UDgPQxsMlJa9AJL
	 bdfRHtFrCeZQQ7xCT6H3O1+a9SuCS0PdF7ACfr8Bt3njOA+bycJ57EMBXDDSfadGo0
	 8yYrztyi8PR3Uf9pLCS2UDDVI/KdLx5m+kCrb043Pc9ZfJOBb/sCq2q4sHS49SaU8I
	 5vJo6b55AtLIER2Vcj0mxQ4VJcTtDweOhmUrVMqdvaMJv2sQ49RVDafHbeXerV/LK4
	 JrpCV6iFD4rrPZWQPt1EsELmYmuL1pcWPYnFnFJHYll4f+DTZrJ7JbetFfffxs4jqP
	 OnUKOHdLXb15w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Mar 2026 16:42:49 +0100
Message-Id: <DH60U76GPPWN.1UJJ89FKSXOWL@kernel.org>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
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
References: <20260212235842.85934-1-dakr@kernel.org>
 <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
In-Reply-To: <177384710701.3709943.608237959975537642.b4-ty@oss.qualcomm.com>
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

On Wed Mar 18, 2026 at 4:39 PM CET, Abel Vesa wrote:
>
> On Fri, 13 Feb 2026 00:58:11 +0100, Danilo Krummrich wrote:
>> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
>> called from IMX driver's probe() callbacks.
>>=20
>> However, it neither makes sense to register drivers from probe()
>> callbacks of other drivers, nor does the driver core allow registering
>> drivers with a device lock already being held.
>>=20
>> [...]
>
> Applied, thanks!
>
> [1/1] clk: scu/imx8qxp: do not register driver in probe()
>       commit: 93a6d39e78bfa78b2160621aafbb490e063f12d9

This is already in Linus' tree, you gave your ACK in [1] for me to take it
through the driver-core tree.

[1] https://lore.kernel.org/all/66i6cgh5zmz32ikwjvrz3gtezjotltqmfzdai7ybwjh=
anx3bif@i5g62ziautwq/

