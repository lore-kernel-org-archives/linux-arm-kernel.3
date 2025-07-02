Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66CCC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 16:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kmc6rkZN+k/uoS83YvfwG7AsbWvnWQxv45QysOLqMdQ=; b=3akasTXW0YwCOrB/89UnBLn2M1
	lEd+20CBhwMIU8n09z9swPzXw8qpTDUZgCJVe3D6rtBRf66OAPWR2Hr/XXmkDukNXRsmuCoVXhd4u
	7eqp+a9G0EVRfA7wFsS7fYaFW+ym3fWOhp8HT3tgraBzmeYEPWDjHqlURElfLd/47U2cwww5rG3B5
	YNAjbEUFW+lHlYRAOHxNVCmTMIS+EA8bOfCRZeWjG0pvz0PR4tnIv1k5TJnMHKsNogfKpF2sLbseZ
	CDLtW1TkibmCB4PJvIFN7PEJU7R1xz8PZ+1FRkEEByMNHbJWT0dT6GUV0o7Z0+ncFL4j5gnbzJ/SO
	r7hAzhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Ev-00000008wNQ-219G;
	Wed, 02 Jul 2025 16:23:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzHO-00000008lii-27Sq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 15:21:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7C081424;
	Wed,  2 Jul 2025 08:21:30 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB59E3F6A8;
	Wed,  2 Jul 2025 08:21:43 -0700 (PDT)
Date: Wed, 2 Jul 2025 16:21:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] firmware: arm_scmi: imx: Support discovering
 buildinfo of MISC protocol
Message-ID: <aGVOhMr7vg9Sl7Z2@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627-sm-misc-api-v1-v1-2-2b99481fe825@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082146_586974_73306C30 
X-CRM114-Status: GOOD (  16.87  )
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

On Fri, Jun 27, 2025 at 02:03:45PM +0800, Peng Fan wrote:
> MISC protocol supports discovering the System Manager(SM) build
> information including build commit, build time and etc. Add the API
> for user to retrieve the information from SM.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 35 ++++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  | 12 ++++++++
>  2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> index a8915d3b4df518719d56bfff38922625ad9b70f6..1b24d070c6f4856b92f515fcdba5836fd6498ce6 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> @@ -25,6 +25,7 @@
>  enum scmi_imx_misc_protocol_cmd {
>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> +	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,

I clearly missed to raise this point when the documentation for this command
was added. Anyways I assume, you had explored all the options before adding
this as generic tools may not be able to pick this up. Instead, I would have
just stuck with vendor version in the standard protocol with build number
embedded into it. The date and other info must be implicit from the build.

I try to be more cautious and ask questions in the future as I don't want
vendor extensions to be dumping ground for really random things like this.

-- 
Regards,
Sudeep

