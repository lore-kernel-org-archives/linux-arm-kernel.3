Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F434EE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 17:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qssbt/bbx0G18Gq8nwNGS1ajPLY/jy/LgFu9hKnkJhs=; b=vw/vTrO/juG5avHODLCV6McZ7O
	Q59ZGfFv9BTi79pkYtgEMT3uUOBtRnZoqdhDHsDcdLwnHDNGViaLg6bIxiVV6ROk4SRxzCvQ41LFf
	xm5LZxZ0yFQKr+hTijtA5I+HAeITq42uxt/O+oCv+KoQq3FlSa1NSbY+Wuo9JRKORBf7k/aFqI/im
	Jfs3FtQ3j8wNfJ4+E0GcV5wqtZ7E0gSLfh1/w0BztKHggRpPMVfzBNSS3fn4j67bFidNQ9Hq5r2An
	gVXiSCeH7x5Gdliccv9oEipSjgwBkM+hav6DBTLtFBnOEQxl9v4Gj7r8oxbuGFuzUbWZ24oClrdo7
	p5OUhvDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaOq-00000002QuT-2Kro;
	Thu, 12 Feb 2026 17:22:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaOp-00000002QuB-2dAY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 17:22:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8503B6001A;
	Thu, 12 Feb 2026 17:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E756DC4CEF7;
	Thu, 12 Feb 2026 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770916962;
	bh=iJ0YRwN6PPvgdP4k/lovtQlvdW0CLzt86NfrNxQIu/8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ZkZ5cBQ3hyW23ADEtMnxvnYidWMgFpWd/qpO4NBEQdkN/Fpd4BTZTfxQFKmpv8xlU
	 lGN9WpLvgHpEyjuBBzuAd6U4x2dxvYoIH6QExSSRqEEcudovh5/wclWwTnXRlA32PE
	 7h73aXZBYBCzG4rQAiLn+wlAz7dN4fFuXr96aTjd85kPcscNzOdu0ZsaVhjdUiiw/3
	 yK3LxPopF9GJOtUefQ3gncnS1MiJXaCtvWTL7qn3Za5PkNWIJ1GhryEMSv7Y6ExMA0
	 Z/OwNJkIKqPbIYDN1IB3figktfMLyu2siT9IHPPZ2NBRGRgFMWZ7PzK/50QIJtzbuH
	 sYMLCC3h42Zxw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 18:22:37 +0100
Message-Id: <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
Cc: "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 <abelvesa@kernel.org>, <peng.fan@nxp.com>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <Frank.Li@nxp.com>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
To: "Daniel Baluta" <daniel.baluta@oss.nxp.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260211142321.55404-1-dakr@kernel.org>
 <10809444.nUPlyArG6x@steina-w>
 <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com>
In-Reply-To: <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com>
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

On Wed Feb 11, 2026 at 3:59 PM CET, Daniel Baluta wrote:
> On 2/11/26 16:43, Alexander Stein wrote:
>> Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
>>> +{
>>> +	int ret;
>>> +
>>> +	ret =3D platform_driver_register(&imx8qxp_clk_driver);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	ret =3D imx_clk_scu_module_init();
>>> +	if (ret)
>>> +		platform_driver_unregister(&imx8qxp_clk_driver);
>>> +
>>> +	return ret;
>>>
> Also, because the logical flow is that CLK driver is uing SCU for calls I=
 would first call
> imx_clk_scu_module_init and then register the imx8qxp_clk driver.=20
>
> But there is no functionality issues your your approach too, just a bette=
r logical flow.

I now remember why I kept it this way around. If we swap it we have to call
imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
Consequently, we'd have to drop __exit from imx_clk_scu_module_exit().

Please let me know what you prefer.

Thanks,
Danilo

