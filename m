Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1592C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nijyer/7Y6vD7zp8i11o3bIcjsjcxjMUKY6PIdhJnoI=; b=Tuosbi/6x0BdjPAJHmayNJCuk/
	/aIlDSJBqytGCe46L76oYcIadPyIjj8A1sjDop8FHmAj+eDFHrB927O7FF6Ljt8+hKwGVcyovv4Y+
	INp6a4xLQogqhnLBT/r187rh2RfjOMJLus7BzdigK7qjj7pe/eu1ORiHCRqYRH+TfAIlIcNYkICfL
	InLHcaJkU4aSKIVmiLPwW1CkoGcMku9JBOq+2A7ajrv6SHRU4cJHVO6BEugJQrsUyMPolVRm+qCpH
	sxGUSouw0yzrfLdKbtZJwwR3uLSGXuFjp3lGxRG61Cw9VwYSRbGoNeZRaD7TVsv385WeZwWpi23lp
	KqD/HHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXe3e-0000000E7xq-0Fjq;
	Fri, 04 Jul 2025 10:54:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcmd-0000000DwTS-3F3Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 09:32:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29715152B;
	Fri,  4 Jul 2025 02:32:25 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EAEA3F6A8;
	Fri,  4 Jul 2025 02:32:37 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:32:34 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] firmware: arm_scmi: imx: Support getting silicon
 info of MISC protocol
Message-ID: <aGefsqOfnzhlj5Jn@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>
 <20250702-sceptical-caracal-of-drama-3cbc63@sudeepholla>
 <20250704102057.GD4525@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704102057.GD4525@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_023239_898549_6F734C40 
X-CRM114-Status: GOOD (  23.58  )
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

On Fri, Jul 04, 2025 at 06:20:57PM +0800, Peng Fan wrote:
> On Wed, Jul 02, 2025 at 04:22:11PM +0100, Sudeep Holla wrote:
> >On Fri, Jun 27, 2025 at 02:03:47PM +0800, Peng Fan wrote:
> >> MISC protocol supports getting the silicon information including revision
> >> number, part number and etc. Add the API for user to retrieve the
> >> information from SM.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 34 ++++++++++++++++++++++
> >>  include/linux/scmi_imx_protocol.h                  |  8 +++++
> >>  2 files changed, 42 insertions(+)
> >> 
> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> index 8ce4bf92e6535af2f30d72a34717678613b35049..d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7 100644
> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
> >>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
> >>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> >>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> >> +	SCMI_IMX_MISC_SI_INFO = 0xB,
> >
> >Again, this seem to have slipped through in my initial review. How is this
> >different from SMCCC SOC_ID interface. I am OK to have it as part of your
> >vendor extensions and be here in the kernel documentation. But I won't
> >accept any users of this within the kernel. Please provide justification
> >as why you can't use the standard SMCCC SOC_ID.
> >
> >So, clear NACK for adding this support in the kernel for now.
> 
> What I do here is just wanna to let
> linux could print similar information as what SM shows in its console:
> 

Sure you can dump whatever you want on the console. The main concern is
another user interface for very similar information that can be obtained
by SOC_ID or soc_device in the kernel. Just kernel internal use should
be fine.

> >$ info
> SM Version    = Build 677, Commit 49a36aaf
> SM Config     = mx95evk, mSel=0
> Board         = i.MX95 EVK, attr=0x00000000
> Silicon       = i.MX95 B0
> Boot mode     = normal
> Boot device   = SD2
> Boot stage    = primary
> Boot set      = 1
> ECID          = 0x7BADEECC000001D40001300963E636F1
> PMIC 0 (0x08) = 0x20, 0x09, 0x20, 0x00, 0x01
> PMIC 1 (0x2A) = 0x54, 0x22, 0x00, 0x0B
> PMIC 2 (0x29) = 0x55, 0x22, 0x00, 0x0A
> Compiler      = gcc 14.2.1 20241119
> 
> With soc_device_register, dumping the silicon information needs use the
> other sysfs interface.

So what ?

> Here with this patchset, reading one sysfs file could dump all the information.
> 

That goes completely again the sysfs policy. Single file single value.
Convince Greg otherwise, I will consider elsewhere not for this SOC_ID
for sure.

> But anyway, ok to drop this patch.
>  

Thanks!

-- 
Regards,
Sudeep

