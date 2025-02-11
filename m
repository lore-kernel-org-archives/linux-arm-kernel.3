Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5198C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2O1znRR7ERQnBPBoysZW8HswMPTx/2zdOOCTc19lGg=; b=chBIgpdNMeNK0mygljAfPNuinP
	1M0io2lihdu1g34HcQFQlwINUPSv5H4m0O8PrYEO3kupBeKnvDAYZBWZp1jiEatUjS8IX6AS8qugM
	0icyXrSzPi9gxLQfGLIFVDG304s7jbmGIamNwyr74rAe1J2kSfTRFMsYiq44m5DPZtVQWl4zFECQ3
	AIpTlyYFKyasCla2RBmYv3Dc4xwg+42bQSoKs609HCzZrpv5OWRt8lGBrM32Ns9QLxjo/u722PNz0
	V4M5lJt9lcEgsVtPbUNpC3bS4uM9AvoYA1A0Ddgcm+Cu72ls/SNp5+WmtMhV0GIfsxjdnMijo0pOC
	OQkSP1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtgx-00000004cOO-0qx8;
	Tue, 11 Feb 2025 17:04:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thtdN-00000004bnV-462g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 17:01:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E682113D5;
	Tue, 11 Feb 2025 09:01:38 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 637FA3F5A1;
	Tue, 11 Feb 2025 09:01:15 -0800 (PST)
Date: Tue, 11 Feb 2025 17:01:12 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/4] rtc: imx-sm-bbm: Support multiple RTCs
Message-ID: <Z6uCWK8jMTP7wInM@bogus>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-4-08c50830bac9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-rtc-v1-4-08c50830bac9@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_090118_055216_9FBCF0CC 
X-CRM114-Status: GOOD (  17.12  )
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

On Mon, Jan 20, 2025 at 10:25:36AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX95 EVK has two RTCs exported by SCMI BBM protocol. Current driver
> only enables the 1st RTC inside BBNSM module, leaving the board RTC
> not used by Linux.
> 
> To use the 2nd RTC, use 'bbm_info' to get the number of RTCs, register
> them all, and set 'bbnsm' as private info for rtc device to know which
> RTC it is when using rtc_class_ops to access rtc device.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/rtc/rtc-imx-sm-bbm.c | 69 +++++++++++++++++++++++++++-----------------
>  1 file changed, 43 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
> index daa472be7c80697aa3cd3432eccef0c877e4c378..a29b30555d0c0581ecaa8b79760209dc780d2f0e 100644
> --- a/drivers/rtc/rtc-imx-sm-bbm.c
> +++ b/drivers/rtc/rtc-imx-sm-bbm.c
> @@ -15,16 +15,18 @@ struct scmi_imx_bbm {
>  	struct rtc_device *rtc_dev;
>  	struct scmi_protocol_handle *ph;
>  	struct notifier_block nb;
> +	u32 bbm_rtc_id;

Is it not same as rtc_dev->id ? Why do you need a copy in this wrapper/
container structure ?

-- 
Regards,
Sudeep

