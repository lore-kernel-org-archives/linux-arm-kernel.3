Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EE1EC1126
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 20:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5Lj1pa/Z4T8fz9OF4N7pnd/XCOufbkh5Iws03u59xU=; b=qzlyJ598XReNikLKoto/6++Qct
	tvNTSKu/CtcoPm0mFZ6fJQdO7S3h8SLjXu1IdOYFYKCpaTpMZ2xNkbPOANorCq7NlzWNaZxcNCrOI
	LXiqgeAHv3VulN3LltNcah1aBHikPVjWzseO6hzAyU8m29/g8q4f0VB5WjKExvXlVG2m6KLs0WZjG
	cbTjGnUOT1yKYW8uNzEXLttnuuV27iiTxUY49njmhhAGi17WRvdM3SjKltXP8W42dq1pk2wpO2+SQ
	BT+rXJrmoFhT2Q4eHcPbXgzj8xbo6nheCFN9skkjQsfyCkDRlxqtpZbYeVziwGVFSHe6qrgKpB2/N
	WfSK4OyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucQz-00000000zn7-1A8e;
	Mon, 23 Feb 2026 20:21:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vucQx-00000000zmh-2Cq5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 20:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE962442A8;
	Mon, 23 Feb 2026 20:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB62C116C6;
	Mon, 23 Feb 2026 20:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771878094;
	bh=+Hpm57PQ6z66kTV3VzXaXYxWnyZULtnHD8/mYcKUJIg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TKqpdt9PHM4za72yOLzVtNwrZq5WJg2ASV3s6HMZ0oAmLepstc7UW+CAzK4CJSkuS
	 4vDMxhAiSEzVzQIFTYhbQ9CdREhpJ6KDgmCuiOEZHZK4bSwbWr9tlKEnMfUPyRQM4W
	 tH+P1HG1QUcTfvMYhBmICuPntIehwXtXIZ8U80osgKPN9GipQR/TUKvQr+qgH8VltC
	 oUk1kaL8Ay+grNYXrH5B8AT7TNUFw9xEUU0SK4meGBIumiw/c8u4R1+lToYRVb/j4/
	 hay6pn6QB0eXFPV4MxwfLw0GMEs97n6F5DBjH5BYPAEUOUMOUxuyBLTIfKli5wqHQQ
	 MRe1jukhUyB8g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Feb 2026 21:21:29 +0100
Message-Id: <DGMMD195G9VX.245Z0JMIYO9HV@kernel.org>
Subject: Re: [PATCH v2] clk: scu/imx8qxp: do not register driver in probe()
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, "Alexander Stein"
 <alexander.stein@ew.tq-group.com>
To: <abelvesa@kernel.org>, <peng.fan@nxp.com>, <daniel.baluta@oss.nxp.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>, <Frank.Li@nxp.com>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <hanguidong02@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260212235842.85934-1-dakr@kernel.org>
In-Reply-To: <20260212235842.85934-1-dakr@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_122135_652309_4C03AF2A 
X-CRM114-Status: GOOD (  17.14  )
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

On Fri Feb 13, 2026 at 12:58 AM CET, Danilo Krummrich wrote:
> imx_clk_scu_init() registers the imx_clk_scu_driver while commonly being
> called from IMX driver's probe() callbacks.
>
> However, it neither makes sense to register drivers from probe()
> callbacks of other drivers, nor does the driver core allow registering
> drivers with a device lock already being held.
>
> The latter was revealed by commit dc23806a7c47 ("driver core: enforce
> device_lock for driver_match_device()") leading to a deadlock condition
> described in [1].
>
> Besides that, nothing seems to unregister the imx_clk_scu_driver once
> the corresponding driver module is unloaded, which leaves the
> driver-core with a dangling pointer.
>
> Also, if there are multiple matching devices for the imx8qxp_clk_driver,
> imx8qxp_clk_probe() calls imx_clk_scu_init() multiple times.  However,
> any subsequent call after the first one will fail, since the driver-core
> does not allow to register the same struct platform_driver multiple
> times.
>
> Hence, register the imx_clk_scu_driver from module_init() and unregister
> it in module_exit().
>
> Note that we first register the imx8qxp_clk_driver and then call
> imx_clk_scu_module_init() to avoid having to call
> imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
>
> Fixes: dc23806a7c47 ("driver core: enforce device_lock for driver_match_d=
evice()")
> Fixes: 220175cd3979 ("clk: imx: scu: fix build break when compiled as mod=
ules")
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Closes: https://lore.kernel.org/lkml/13955113.uLZWGnKmhe@steina-w/
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # TQMa8x/MBa=
8x
> Link: https://lore.kernel.org/lkml/DFU7CEPUSG9A.1KKGVW4HIPMSH@kernel.org/=
 [1]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Just a quick reminder now that -rc1 is out; I think it would be good if thi=
s
could go to Linus for -rc2.

(Just in case it helps, please let me know if you want me to take it throug=
h the
driver-core tree for this purpose.)

Thanks,
Danilo

