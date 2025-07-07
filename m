Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCABC83F12
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 12:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=buBZPYCny2eJnC/NXZvcO1EkV938DH9ybohufbHdkrg=; b=OvRP0AU59aUucHXWpJuihFOqzv
	JLaBYHUW9WfStCGTyIVinVqJbOivPrK5MVyjmdUaS4gmVT393/8mxt7nVBBiroAMhFhHW5qaZFRiB
	A5IR4i/YDanZSRVCyoPaCQphi3Va5KzTRXMGZrfQnSCIlkhnNfAzoIwk3Ulz4CGdbkhOokXUQd3T+
	gTNkqApywSkzzM7BTyTxtLfiJEfNXkexJsJMcdtRteT8e0A6qrrAcEZy+9F4YZYVoCGM1zvaqhWdP
	A0yS2ePUu4+dy7EbQxJJkz2fzPriuFJpxtNYpvX6T2+q+5N++cOGclZStprWJaKsf4oDjG7H63Mlf
	IdrmPM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYlRm-00000002TFw-2B37;
	Mon, 07 Jul 2025 12:59:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjyh-00000002GzD-3O4M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 11:25:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89BBD168F;
	Mon,  7 Jul 2025 04:25:29 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA1823F694;
	Mon,  7 Jul 2025 04:25:40 -0700 (PDT)
Date: Mon, 7 Jul 2025 12:25:37 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>
Subject: Re: [PATCH v2 1/2] firmware: arm_scmi: bus: Add pm ops
Message-ID: <20250707-rich-helpful-guppy-c5ea68@sudeepholla>
References: <20250704-scmi-pm-v2-0-9316cec2f9cc@nxp.com>
 <20250704-scmi-pm-v2-1-9316cec2f9cc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-scmi-pm-v2-1-9316cec2f9cc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_042543_891478_C656D6BD 
X-CRM114-Status: GOOD (  16.93  )
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

On Fri, Jul 04, 2025 at 11:09:35AM +0800, Peng Fan wrote:
> Take platform_pm_ops as reference. Add pm ops for scmi_bus_type,
> then the scmi devices under scmi bus could have their own hooks for
> suspend, resume function.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 1adef03894751dae9bb752b8c7f86e5d01c5d4fd..b6ade837ecea34f147fc1b734c55eafecca5ae0c 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -323,6 +323,38 @@ static struct attribute *scmi_device_attributes_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(scmi_device_attributes);
>  
> +#ifdef CONFIG_SUSPEND
> +static int scmi_pm_suspend(struct device *dev)
> +{
> +	const struct device_driver *drv = dev->driver;
> +
> +	if (drv && drv->pm && drv->pm->suspend)
> +		return drv->pm->suspend(dev);
> +
> +	return 0;
> +}
> +
> +static int scmi_pm_resume(struct device *dev)
> +{
> +	const struct device_driver *drv = dev->driver;
> +
> +	if (drv && drv->pm && drv->pm->resume)
> +		return drv->pm->resume(dev);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops scmi_dev_pm_ops = {
> +	.suspend = scmi_pm_suspend,

I have use pm_sleep_ptr() and removed the below NULL based struct.
Have a look at for-next/scmi/updates and let me know if you are happy
with that.

-- 
Regards,
Sudeep

