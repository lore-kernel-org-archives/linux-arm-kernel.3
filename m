Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4221AE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piU99QaqIRlepw2j3J6RWSNCiXNAfG7MBvklaCvgYco=; b=hSZvW27SjySuO/pUomD6UUsQO/
	7TVZGXleUkLPtNLrjlXNN2dV8HDrJWRMV03ilxoxjiQ+I3XRWcf3SXRtHwNkAV6JJOoqkTahicYvK
	Tl04tZ+rbIRcDZ9zQgKrE52jFizzKxqrJ1reGq0LmMzzHDplKd67xB0Fn1nkZ1Ex9hVvI77blYPuo
	5KEVhP02eHNojqKCrIAuxifXyzoGdkp97IHWbq5Ki6BRGEIB61GS/gVh1/ULd4gf5konGCKKoHhYM
	/3/c/LuHvB8UZfopIVDckyodAYOm0ft0iBRR2NNedIqIihTW1fvrQvZF6ro+n8m4laXgE6/t7jkwt
	SPOPxgDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRC33-00000000Uvc-0bQ9;
	Fri, 27 Dec 2024 15:14:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRC1r-00000000UgN-2S9U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 15:13:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E01BB15A1;
	Fri, 27 Dec 2024 07:13:55 -0800 (PST)
Received: from bogus (unknown [10.57.92.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC023F673;
	Fri, 27 Dec 2024 07:13:23 -0800 (PST)
Date: Fri, 27 Dec 2024 15:13:06 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <20241227151306.jh2oabc64xd54dms@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_071331_672727_81B251B9 
X-CRM114-Status: GOOD (  23.81  )
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

On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> SCMI_PROTCOL_PERF protocol, but with different name, so two scmi devices
> will be created. But the fwnode->dev could only point to one device.
>
> If scmi cpufreq device created earlier, the fwnode->dev will point to
> the scmi cpufreq device. Then the fw_devlink will link performance
> domain user device(consumer) to the scmi cpufreq device(supplier).
> But actually the performance domain user device, such as GPU, should use
> the scmi perf device as supplier. Also if 'cpufreq.off=1' in bootargs,
> the GPU driver will defer probe always, because of the scmi cpufreq
> device not ready.
>
> Because for cpufreq, no need use fw_devlink. So bypass setting fwnode
> for scmi cpufreq device.
>
> Fixes: 96da4a99ce50 ("firmware: arm_scmi: Set fwnode for the scmi_device")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 157172a5f2b577ce4f04425f967f548230c1ebed..12190d4dabb65484543044b4424fbe3b67245466 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -345,6 +345,19 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	device_unregister(&scmi_dev->dev);
>  }
>
> +static int
> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> +		       int protocol, const char *name)
> +{
> +	/* cpufreq device does not need to be supplier from devlink perspective */
> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq"))
> +		return 0;
>

This is just a assumption based on current implementation. What happens
if this is needed. Infact, it is used in the current implementation to
create a dummy clock provider, so for sure with this change that will
break IMO.

--
Regards,
Sudeep

