Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35504C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTjUpstyMWmWh63xl93wEo/cqGnhqyb8v67+pdwHUZE=; b=M41gwtZW+d2tboHCeHMlRU+ETZ
	ZOjdPzQ0y3dLul5MC+CByaT6p16ZYzwYw3fCcDWGbXDzpKnOQXBQGJ9iQQhLJoSM1Yy7VD4ihvF/I
	3/PXODmOxL01O8qGfS9lR5P7PE50yS96TLZYKEh9VUe7rCTpV0cIXIGY6ZhJRTd0uwo94EUiNlLrA
	E9SL8fGAML9G45bsekRi7IIIHU4aiBJlnQBtHEKq8xq/vXKz4RCWpHQ3QWPZ0Dkt2OhQHksuMHBR6
	gbaYtSCPsYDl3mJhbbkUWcaKWaL4J41U54pIjLAm2qV09DkiGwY4YznfZ4xJlSbxztpeQByE8Ttax
	9YOhIeNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0JX-00000008wyb-1DeA;
	Wed, 02 Jul 2025 16:28:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzHs-00000008lqE-2zdu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 15:22:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A93E1424;
	Wed,  2 Jul 2025 08:22:01 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5004C3F6A8;
	Wed,  2 Jul 2025 08:22:14 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:22:11 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] firmware: arm_scmi: imx: Support getting silicon
 info of MISC protocol
Message-ID: <20250702-sceptical-caracal-of-drama-3cbc63@sudeepholla>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-4-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082216_792645_3315B38C 
X-CRM114-Status: GOOD (  19.56  )
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

On Fri, Jun 27, 2025 at 02:03:47PM +0800, Peng Fan wrote:
> MISC protocol supports getting the silicon information including revision
> number, part number and etc. Add the API for user to retrieve the
> information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 34 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  8 +++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index 8ce4bf92e6535af2f30d72a34717678613b35049..d5b24bc4d4ca6c19f4cddfaea6e9d9b32a4c92f7 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> +	SCMI_IMX_MISC_SI_INFO = 0xB,

Again, this seem to have slipped through in my initial review. How is this
different from SMCCC SOC_ID interface. I am OK to have it as part of your
vendor extensions and be here in the kernel documentation. But I won't
accept any users of this within the kernel. Please provide justification
as why you can't use the standard SMCCC SOC_ID.

So, clear NACK for adding this support in the kernel for now.

It is pretty useless to push this to userspace with custom interface.
Use the existing interface with SOC_ID. Also the way I would think this
interface may be used is from SMCCC interface implementation which could
retrieve info via this interface but that would be just platform specific
code in the firmware.

-- 
Regards,
Sudeep

