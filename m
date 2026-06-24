Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE86CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 19:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v+PwF4a1s0EJXEB4ndcrlb4iQvdb5MCqq0tTCy0yBg=; b=Plu50aKVU1H5B7PBYtE2Ps2CQB
	/ZfX71Hd4oyXVdzf37Oa6Na1cCuyKGgoKPLP5cSorp946nwgNsYEqQysinrlFCMTB59VxR+91gNDT
	MtSl3hwewH4q115L40LyadeFl2ddnT5Ju+w3/LUrVfxiiexqTtY831MlnrkACrp8T/IxpNwM7Gbnk
	ciMQi192rrBMKKaHjtManJs9Y4gUK5ij5WHL5+YfoipYITL8O3kZLwv8RyNw3L7+7VuAAwya3e7s8
	8I5dSvzY7OYUco5o4N/6cbYc/twSif2u9E2ZZ7mddcxFRoc1m1k38oBHOCUKkjaK7B90KFn+uKV/W
	TqO4kZ8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcT8P-00000008GMK-3eYv;
	Wed, 24 Jun 2026 19:19:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcT8M-00000008GLx-3UHs;
	Wed, 24 Jun 2026 19:19:40 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56D7E1049;
	Wed, 24 Jun 2026 21:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782328737;
	bh=SygbhfMsHBXymcem7e6Zd0nKKWVHq2pp7wmjCrhnj44=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9iPS6IL6p0/dDAwuFkL5icB0WAA7/VF1Z2f8Muhz3zenEk89jfcpVogCPF9xqqsm
	 QPxnlkhw7Ug6s2tpdrYSAD+ZWecr8sCsX3hYxbY51skwWfYFAI00vNswoaiCKIZj+k
	 0HxXfhmL6kVxPTzsYM4hCVIu8p8C42YQ/DqNXn+k=
Date: Wed, 24 Jun 2026 22:19:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank.Li@oss.nxp.com
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v2 0/4] media: add and use
 fwnode_graph_for_each_endpoint_scoped()
Message-ID: <20260624191935.GG851255@killaraus.ideasonboard.com>
References: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624-fw_scoped-v2-0-0a8db472af4a@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_121939_019598_56ABC649 
X-CRM114-Status: GOOD (  15.21  )
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

Hi Frank,

On Wed, Jun 24, 2026 at 01:00:08PM -0400, Frank.Li@oss.nxp.com wrote:
> Add new helper macro fwnode_graph_for_each_endpoint_scoped() and use it
> simplify media code.
> 
> Typical example should qualcomm's driver (camss.c), the v4l2_mc.c and
> rkisp1-dev.c only silience improvement.
> 
> Anyways, *_for_each_*_scoped() already use widely and make code clean.
> 
> Build test only.
> 
> Sakari Ailus:
> 	when I try to improve the patch
> "Add common helper library for 1-to-1 subdev registration", I found need
> camss.c pattern, so I create this small improvement firstly.

Those are nice cleanups, thank you.

After applying this series, the only left users of the
fwnode_graph_for_each_endpoint() macro are in drivers/base/property.c.
They can all be trivially replaced with the scoped variant. Should we
add a patch to use fwnode_graph_for_each_endpoint_scoped() everywhere,
and drop fwnode_graph_for_each_endpoint() ?

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - colllect review by tags
> - fix typo and indent.
> - see each patch's change log.
> - Link to v1: https://patch.msgid.link/20260622-fw_scoped-v1-0-a37d0aac0a68@nxp.com
> 
> ---
> Frank Li (4):
>       device property: Introduce fwnode_graph_for_each_endpoint_scoped()
>       media: mc: use fwnode_graph_for_each_endpoint_scoped() to simpilfy code
>       media: rkisp1: use fwnode_graph_for_each_endpoint_scoped() to simplify code
>       media: qcom: camss: use fwnode_graph_for_each_endpoint_scoped() to simplify code
> 
>  drivers/media/platform/qcom/camss/camss.c           | 17 +++++------------
>  drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c |  4 +---
>  drivers/media/v4l2-core/v4l2-mc.c                   |  5 +----
>  include/linux/property.h                            |  5 +++++
>  4 files changed, 12 insertions(+), 19 deletions(-)
> ---
> base-commit: 3ce97bd3c4f18608335e709c24d6a40e7036cab8
> change-id: 20260620-fw_scoped-5dab644510a1

-- 
Regards,

Laurent Pinchart

