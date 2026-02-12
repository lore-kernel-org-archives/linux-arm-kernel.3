Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C52EB48F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRq1KBMHuWFpRbH1vR3X7AEScEe+bqwM6DDNGjCkCAg=; b=P6Eor+NWM1Db3PKhSbZy/qOEnI
	MCdkbdf58P8JFRogrYR5wj3mba6Znis5O0ol3pWmCAhmXj69Bd0i474M/5QM38+Bcia8Mw0L+v7zf
	yMogbfQklgVRyy3q7zO3iL9E1dM/CTtdBm5E6bKqxCPh5/0To58pg4t+ih6bWr1VlhD8/xDSM1DVn
	qFnYNsSNiVs22+yP2Sk55CdBJcHGsEh4lZbKVE+bt3wzhBkaTDir5iQrtT3VrQ54/mAUT2gxWhle/
	T+3ftterMJkiu2N3s3Cp1RjTMvse6DY+wvosGbu4ZhGVQrau4WUUYRXy3/epukOcSsRaRCtrESJGQ
	PWOmDSpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUOb-00000001xqU-3GHo;
	Thu, 12 Feb 2026 10:58:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUOZ-00000001xq9-0Rb8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 10:58:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6E19243347;
	Thu, 12 Feb 2026 10:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EF2C4CEF7;
	Thu, 12 Feb 2026 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770893882;
	bh=a10gybJK/rglyWHCmyBwBN8EflBOeOZkgZ5xBklxWGE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=GzKFBSxgykC0qt/3n9plxUDNDHJJHjV6L5z37PAXqjd/B7Ep1XKSfD1faRoke3gIY
	 Y4CRX1UbfJ59/w+AUfPT9nAKyCHmSGB9igBhNEsRULaAeYfDjYfZ4huGbHD71p4quE
	 yOdDZiwuK/yAQlP07y7wa4cOc50ejAe0FmyjEUwW8QrhQEg5FSy8EjS5+FW7fDKFh1
	 k8Kw81xtMrzmv7GdRhXd6kq4GymfZFiX+DeeTAkDrDwFUdmL76c5eBmMn8E0tJ+wMv
	 n02Cc1XYoMXu9f5RoenP84OkDyz+YQg3r8vWgw9Rz7Krw4RuQZIZgSS7Asyi7PtBxC
	 +Fmdop0DMe7qQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 11:57:56 +0100
Message-Id: <DGCXHJSE6HF8.1UVG9WV27XEK@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_025803_210289_0F8AD7CF 
X-CRM114-Status: GOOD (  14.71  )
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
>>> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly bein=
g
>>> called from IMX driver's probe() callbacks.
>>>
>>> However, it neither makes sense to register drivers from probe()
>>> callbacks of other drivers, nor does the driver core allow registering
>>> drivers with a device lock already being held.
>>>
>>> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
>>> device_lock for driver_match_device()") leading to a deadlock condition
>>> described in [1].
>>>
>>> Additionally, nothing seems to unregister the imx_clk_scu_driver once
>>> the corresponding driver module is unloaded, which leaves the
>>> driver-core with a dangling pointer.

Actually, this fixes a third bug: If there are multiple matching devices fo=
r the
imx8qxp_clk_driver, imx8qxp_clk_probe() calls imx_clk_scu_init() multiple t=
imes.
However, any subsequent call after the first one will fail, since the drive=
r
core does not allow to register the same struct platform_driver multiple ti=
mes.

>>> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qx=
p.c
>>> index 3ae162625bb1..d89a2f40771e 100644
>>> --- a/drivers/clk/imx/clk-imx8qxp.c
>>> +++ b/drivers/clk/imx/clk-imx8qxp.c
>>> @@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver =
=3D {
>>>  	},
>>>  	.probe =3D imx8qxp_clk_probe,
>>>  };
>>> -module_platform_driver(imx8qxp_clk_driver);
>>> +
>>> +static int __init imx8qxp_init(void)
>>>
>>>
> I would call this imx8qxp_clk_init. Same for=C2=A0imx8qxp_exit.

Sure.

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

Sure, I will send a v2 shortly, as it would be good to get this into an ear=
ly
-fixes PR.

Thanks,
Danilo

