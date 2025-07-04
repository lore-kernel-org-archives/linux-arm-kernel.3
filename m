Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62590C83F0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZEMGxoKdrNAgcSkkRm4dEcK26IjPUWMjfHqFG8aFDA=; b=ur+Lyh4kL/zCBl4qbdt7TRQt0O
	cq78hbXbsU9POQp9vKBRQBQ1UMTsl9FTLZBGLQH1xzBxYxuqHionZDLci5gRJXwESNYbFHiruTA8z
	PFrd+TKLeYrl4RxRx206+Njk7CDV6RT5SHhsvga/Sm4xxpUIBU7JXnQW50R0bl5Q9tbxnHRqqsiK9
	cV7LwVSgpyfD0UNxtMTFc9rvmgSH9wg8EAsAa3ZdMihboDLkCK+UgFSQR7AaR0yHDTW7+iaABRZwH
	Obed9UC8W6ERygmnmqMXmpx+bzBd/4KTvZWKj2DKqYMfahX0pI8Nz3e+7lcU2F7HyBgv2AFh2MDP4
	uC5nqIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXey1-0000000EHgW-3Jpy;
	Fri, 04 Jul 2025 11:52:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcJT-0000000Drft-3AGs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 09:02:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DAC1152B;
	Fri,  4 Jul 2025 02:02:17 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E8903F6A8;
	Fri,  4 Jul 2025 02:02:28 -0700 (PDT)
Date: Fri, 4 Jul 2025 10:02:26 +0100
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
Subject: Re: [PATCH 3/7] firmware: arm_scmi: imx: Support getting cfg info of
 MISC protocol
Message-ID: <aGeYomz9DmmAOSEw@bogus>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-3-2b99481fe825@nxp.com>
 <20250702-arrogant-jackdaw-of-skill-bb9fd3@sudeepholla>
 <20250704100741.GC4525@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704100741.GC4525@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_020231_842116_CFB1AFD8 
X-CRM114-Status: GOOD (  21.76  )
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

On Fri, Jul 04, 2025 at 06:07:41PM +0800, Peng Fan wrote:
> On Wed, Jul 02, 2025 at 04:21:58PM +0100, Sudeep Holla wrote:
> >On Fri, Jun 27, 2025 at 02:03:46PM +0800, Peng Fan wrote:
> >> MISC protocol supports getting the System Manager(SM) mode selection
> >> and configuration name. Add the API for user to retrieve the information
> >> from SM.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
> >>  include/linux/scmi_imx_protocol.h                  |  5 ++++
> >>  2 files changed, 35 insertions(+)
> >> 
> >> diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> index 1b24d070c6f4856b92f515fcdba5836fd6498ce6..8ce4bf92e6535af2f30d72a34717678613b35049 100644
> >> --- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> +++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
> >> @@ -26,6 +26,7 @@ enum scmi_imx_misc_protocol_cmd {
> >>  	SCMI_IMX_MISC_CTRL_SET	= 0x3,
> >>  	SCMI_IMX_MISC_CTRL_GET	= 0x4,
> >>  	SCMI_IMX_MISC_DISCOVER_BUILDINFO = 0x6,
> >> +	SCMI_IMX_MISC_CFG_INFO = 0xC,
> >>  	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
> >>  };
> >>  
> >> @@ -73,6 +74,11 @@ struct scmi_imx_misc_buildinfo_out {
> >>  	u8 buildtime[MISC_MAX_BUILDTIME];
> >>  };
> >>  
> >> +struct scmi_imx_misc_cfg_info_out {
> >> +	__le32 msel;
> >
> >Now, I realise, this mode select is not properly defined in the document.
> >Just 32-bit word. What are those values ? Any fixed list of values with
> >well defined modes or configurations ? If so, please add to the document.
> 
> The current used value are 0,1,2. It is used to decide the logic machine
> boot order, such as 0 means booting LM0, LM1, LM2, LM3...
> Regarding 0,1,2 using which LM order, it could be defined by user in
> i.MX9 System Manger cfg file. That means 1 could mean LM0, LM2, LM3, LM1
> or LM0, LM3, LM1, LM2.
> 

This sounds like this is not well defined and could change on a different
platform ? If so, how will you manage this extension across i.MX platforms ?

Or the above order is actually fixed and will remain same across the
platforms ?

-- 
Regards,
Sudeep

