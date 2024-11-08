Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF60DD64065
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3nRrHRNzWgiqRAcf2PxLYCbf9f86cIHpwPVgaarow8=; b=ILBHUYZUuQgN4HztbmKHZ7Ceoa
	i1K4o2JjGt1GDUs7U2hxPP/dh4sxiA2NQph/ZeszwyWLHXrirk4fGlMkDM7qQeeYcQ6E0EF99vtOi
	XmRmHUGg97sKL7GjFD2KrrccTp+uf1Ly+0+neg8qx0YRqN8XXL5SsJ83+ihWvaPDXCcQBoDPeMaZ/
	nFaeAOT9AS6X2LuvJVwDvd3FdFQwvxzFR9LTql1Tu6bla1aOk0CuQmsdagyXc6zPOhKMdWW5mWP8X
	fqXdXvKHJInJD8zdtT8qUwXnolSjzJd9a+OeYnLTuoGmlTTJBJF1ZTYP2GB5KlqnehjeSNj9dMPIb
	5+dWC9Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Rtp-0000000BDHz-1T2q;
	Fri, 08 Nov 2024 16:31:53 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QvC-0000000B1a1-003Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 15:29:16 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XlNBs1hWmz6J7gR;
	Fri,  8 Nov 2024 23:28:53 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id CBC7B140133;
	Fri,  8 Nov 2024 23:28:58 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 8 Nov
 2024 16:28:57 +0100
Date: Fri, 8 Nov 2024 15:28:56 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Frank Li <Frank.Li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-iio@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Carlos Song <carlos.song@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>, Jean Delvare <jdelvare@suse.com>, Guenter
 Roeck <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 0/3] iio: temperature: Add support for P3T1085
Message-ID: <20241108152856.000042ed@huawei.com>
In-Reply-To: <20241107-p3t1085-v1-0-9a76cb85673f@nxp.com>
References: <20241107-p3t1085-v1-0-9a76cb85673f@nxp.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_072914_218813_4EE557ED 
X-CRM114-Status: GOOD (  10.60  )
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

On Thu, 07 Nov 2024 18:02:26 -0500
Frank Li <Frank.Li@nxp.com> wrote:

> Add basic function support for P3T1085 temperature sensor.
> - Add binding doc trivial.yaml
> - Add basic read temperature driver
Hi Frank,

For a simple temperature sensor the usual question is why IIO rather
than hwmon?

Previous reasons have been:
- Very high performmance / accuracy part (i.e. expensive)
- Remote temperature so not typically hw monitoring.
- Same silicon with a more complex sensor (typically humidity or similar).

Any of those apply?  Or some other reason?

+CC hwmon maintainers and list.

Jonathan

> - Update imx93-9x9-qsb.dts
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Carlos Song (1):
>       iio: temperature: Add support for P3T1085
> 
> Frank Li (2):
>       dt-bindings: trivial-devices: Add NXP P3T1085UK I3C/I2C temperature sensor
>       arm64: dts: imx93-9x9-qsb: add temp-sensor nxp,p3t1085
> 
>  .../devicetree/bindings/trivial-devices.yaml       |  2 +
>  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  5 ++
>  drivers/iio/temperature/Kconfig                    |  1 +
>  drivers/iio/temperature/Makefile                   |  2 +
>  drivers/iio/temperature/p3t/Kconfig                | 29 ++++++++
>  drivers/iio/temperature/p3t/Makefile               |  5 ++
>  drivers/iio/temperature/p3t/p3t1085.h              | 31 +++++++++
>  drivers/iio/temperature/p3t/p3t1085_core.c         | 79 ++++++++++++++++++++++
>  drivers/iio/temperature/p3t/p3t1085_i2c.c          | 68 +++++++++++++++++++
>  drivers/iio/temperature/p3t/p3t1085_i3c.c          | 59 ++++++++++++++++
>  10 files changed, 281 insertions(+)
> ---
> base-commit: 74741a050b79d31d8d2eeee12c77736596d0a6b2
> change-id: 20241107-p3t1085-fbd8726cbc0e
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
> 
> 


