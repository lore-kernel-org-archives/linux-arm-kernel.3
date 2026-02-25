Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6045AFCEE8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7A1eLw+7b6dkbCfQgjn56Gvh4XYw2P5ftCD6D/koio0=; b=BZfGfZ5x+3IHIUnmQTPBnhx6W7
	pCemFhKDzDW1bcJhVM7dYaIlqLvfHmbvUzeCSTH1nyZy56RmPn48gwVt6zOVb9LTwXUd+VCNqmNUb
	3KoEC6WNXmManbx/2D2PvCn2CV+5dhjLr6ZoIdRUCnYTYjg+bWdSxSgsTMgk4ECq3ES29l+XaREX3
	GPUIfbeyngyE5iWYCtak0VdlOLGmoGzKHoXC3I7kbFnFEHQ97iod9INXjPFLyAEFCZ7CDFZ0IbM8K
	j6/+FUtbGn1k7ZKdKQL2dl/hQzAkfuCRkQMLgErnG7ojwGvnvs2SrMqBVKi1b9EfTLvydv4OSPUNv
	ivNMVmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvD7d-00000003v65-2cD4;
	Wed, 25 Feb 2026 11:32:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvD7c-00000003v5w-0vTk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:32:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4079760097;
	Wed, 25 Feb 2026 11:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F2CC116D0;
	Wed, 25 Feb 2026 11:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772019122;
	bh=R2R2eDsHNuLYonyIEqSGhS8TL0yxK8Vj+BchHJl6enM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=emLrXzOzIHkj73jPXqP5z/ClWb4ngKCuVpLtI/zq3qecEphzbfOh3OOO9tPizFNOD
	 v5hjw5WiL+lRsFyWr8UI74e19Q4P7zNBfUowrrznunrbREFRW8V/XhsauGtG/y7QbG
	 G8yxXXqAFVObQ56jwLIAOIsyxDYP25smMBr9GqcqkoboMLHRpqFhQMFbmrGfXmjKam
	 p8FX8/hXnBxJ3ojQs2jFA98XxohlcZRHPOuJIf0ZQyZn+0KAqcdKpZ/pj5PeXE/7XG
	 KYyO5YSMmtSOYknhvBcTww1ejLRGmbmdCSW5h+NiCtT4m/NZqQtGL/fZ3o/WJKsRes
	 MQW0bdPG0+6Bg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Feb 2026 12:31:57 +0100
Message-Id: <DGO0COF2NCJ0.GFYKM4L9KTP0@kernel.org>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Cc: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <daniel.baluta@oss.nxp.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <Frank.Li@nxp.com>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>, "Alexander
 Stein" <alexander.stein@ew.tq-group.com>
To: "Peng Fan" <peng.fan@oss.nxp.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260212235842.85934-1-dakr@kernel.org>
 <aZ6vyQw5a5LhSCaT@shlinux89>
In-Reply-To: <aZ6vyQw5a5LhSCaT@shlinux89>
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

On Wed Feb 25, 2026 at 9:16 AM CET, Peng Fan wrote:
>>diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.=
c
>>index 3ae162625bb1..c781425a005e 100644
>>--- a/drivers/clk/imx/clk-imx8qxp.c
>>+++ b/drivers/clk/imx/clk-imx8qxp.c
>>@@ -346,7 +346,29 @@ static struct platform_driver imx8qxp_clk_driver =3D=
 {
>> 	},
>> 	.probe =3D imx8qxp_clk_probe,
>> };
>>-module_platform_driver(imx8qxp_clk_driver);
>>+
>>+static int __init imx8qxp_clk_init(void)
>>+{
>>+	int ret;
>>+
>>+	ret =3D platform_driver_register(&imx8qxp_clk_driver);
>>+	if (ret)
>>+		return ret;
>>+
>>+	ret =3D imx_clk_scu_module_init();
>>+	if (ret)
>>+		platform_driver_unregister(&imx8qxp_clk_driver);
>>+
>>+	return ret;
>>+}
>>+module_init(imx8qxp_clk_init);
>>+
>>+static void __exit imx8qxp_clk_exit(void)
>>+{
>>+	imx_clk_scu_module_exit();
>>+	platform_driver_unregister(&imx8qxp_clk_driver);
>>+}
>>+module_exit(imx8qxp_clk_exit);
>
> The clk driver is critical for the system to work, removing this driver w=
ill
> make the system not work properly I think, so it may not make too much
> value to add an exit function here.

The exit function was there before, just hidden by the module_platform_driv=
er()
macro.

If a driver can be built as module, then we have to unregister the driver, =
when
the module is unloaded.

If this driver should always be builtin, that is a separate change, indepen=
dent
from this fix.

