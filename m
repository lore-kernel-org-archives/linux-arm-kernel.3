Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA69C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 03:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9ygpRy1yhhvPXt3ON6IStdleo1cb/x/nqaI0QI7Xp8=; b=C1eyZO9B0iXZjmHAcy9v5iSsEG
	uS8cG544am1vbrBzUe+AmDPgm5Ene4jYXxj/3IZPmSo77aY4pu+v5guRR9gGct8JJcErXuEp5J6n/
	LfF7ylpSW/2gLAw7NhSsYVz0Md99rtnXq6T/yPIw/vYrFejHpZSUgKBQC4Z/iNjRBA+MfrmKB590O
	gwRk+CE4HMLtJkbbHZ3j7sT6why+qYfdO4BO21KcLsvGLC5ywOquVAqoTzafg6vnsuko1FmqQVe8B
	ArmceUUcKTRgnjF+2p67S7rVqg4doZojS8lD5S8WLeX5B+xkaTs7wdEQYT0WhVJ4BJB1Y10aWkIo0
	GocxnGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSStE-0000000Eh0i-1nx8;
	Fri, 20 Jun 2025 03:58:08 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSr0-0000000EgwJ-0ouC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 03:55:51 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4066a0d0256so908521b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 20:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750391749; x=1750996549; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9ygpRy1yhhvPXt3ON6IStdleo1cb/x/nqaI0QI7Xp8=;
        b=NPPz/V3RJNjXKqHezf7o2Q1SQXWumkqNtRQ2zKbBnoGXD5qWH3uFJB1rHrmWUbmO8J
         /TU7Jz3imHxdepL9bY3uMK1cO8+r1uhlFSFbL8xnPUGhwZKkGADPlIRz+VWbft4WraVT
         YA+kBl4chJo/I/kdvq/IoaRwerFNFo5DANiHYCpd/GESApAFv4yvO8U0T2fu7wOSmTDg
         BgnyNpIIUzpKouXYBOCxbCSTjM0jQ7LUbf103gtMxiDxA5Wwtp0V9f9t5g5EexFTC2JA
         Cm2ka1UaXF3HYU600Kt4YwFjzKdtFj/pOlw+TAdnVATJkOiDGvVN61J1Kedq/UzcKh8w
         oYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750391749; x=1750996549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9ygpRy1yhhvPXt3ON6IStdleo1cb/x/nqaI0QI7Xp8=;
        b=StUjVHcsOk164DxQHhAZV7pCTKaoNg18E99iayH5UxzSQiT0MDfjfzc2ltNKM9H+lw
         hrDZbHkQ7zm3+Wgf8QvR9+OwU20miRuoWoEIAfXU0OpUSEdv1gemYmvUZUBjehQ/9GRQ
         rIk+asOYBO78NTIM/aeGocN1mT8sAlvq28gRyr4gbs+wCAANXEhRo9w4BKZHMoDa/jMj
         UZE4+NO5gCxZCqzmM5ed9IHm0MifjVbQwGZxKkkDZXrt7OPY4DTS0ZwPtyXwV4nsKgCC
         y0GTJE+rFN8EqmBXVCdcyzO5g+FKjEJ7uTL+SDG+qYs+brIFlf0klK0jigecftryTFQi
         hmOA==
X-Forwarded-Encrypted: i=1; AJvYcCUR9ZiA0p1n23gFI2nnlPiwbX0Eu6t1HY5mz6KptCIIpRn1lXSw5H1qlAXDVr3D4JrTYBCI1Uj+RbRCLOkZhPo0@lists.infradead.org
X-Gm-Message-State: AOJu0YxvTqdxhRDx1tg75pV4aotHnxi2+MIf3u1dM4X7iPK5n4q13dMk
	kCwOX9OFLfpBXRceJ5SbyEZRZSX7VLRRg3MORUwvR30G4y0nN0kY2UnwxcblgGWWDkc=
X-Gm-Gg: ASbGncuJ08Pbu2FwYXILAcHyAdsMGqB+Fgu/4ySKGvxPES7e45vx+wE4JMIm1CdAF/P
	7x5fD3wv2byu+mmdfX9DnlMHTOyy3HWmEPNG4hXGd1fBnjc5O/Cnu9YNjAyXADPc2f0dWAQqEkB
	s5BIQDyvhrEbJZzgNoe0g28QOPCCxaso/bd41i6lYhBnEWF/+/F3NEYQZYWQhrYOIKMkOY72oVu
	25EXc/qO+QQPWTgj7S8GJtgn7DUQLmnow0ltmXgi5iJqHknOe+/FnWEFpehPD8uzJDKZ7gnKIFB
	ySIq8Cp/Fpqq2AwjfaI9mze6l1s/6ROI+ARhPyX4RxpSD6+oW1Uc7XC1cgefjiAMIp0kxg==
X-Google-Smtp-Source: AGHT+IFpMqMfL10VDeZnAPZWqzBUfFVLrNCqWwvVeY7CBAKdJ4F2IHl6lMhC8ceeQFXXdaQcmdLn7w==
X-Received: by 2002:a05:6808:19a7:b0:406:6d79:49d2 with SMTP id 5614622812f47-40ac6fccb21mr1032511b6e.26.1750391748683;
        Thu, 19 Jun 2025 20:55:48 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:67e2:ece8:b2f5:738f])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a908bc982sm193555a34.0.2025.06.19.20.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 20:55:47 -0700 (PDT)
Date: Fri, 20 Jun 2025 06:55:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
	Chuck Cannon <chuck.cannon@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/2] firmware: arm_scmi: bus: Add pm ops
Message-ID: <8a7e6e24-5ab2-434a-ba71-7b1b4f74e9f3@suswa.mountain>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-1-c2f02cae5122@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-scmi-pm-v1-1-c2f02cae5122@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_205550_238845_350DC081 
X-CRM114-Status: GOOD (  19.61  )
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

On Fri, Jun 20, 2025 at 11:37:13AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Take platform_pm_ops as reference. Add pm ops for scmi_bus_type,
> then the scmi devices under scmi bus could have their own hooks for
> suspend, resume function.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/bus.c | 45 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 1adef03894751dae9bb752b8c7f86e5d01c5d4fd..2d1ef73cb6d39ac611afa5d0008c46515e297b93 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -323,6 +323,50 @@ static struct attribute *scmi_device_attributes_attrs[] = {
>  };
>  ATTRIBUTE_GROUPS(scmi_device_attributes);
>  
> +#ifdef CONFIG_SUSPEND
> +static int scmi_pm_suspend(struct device *dev)
> +{
> +	const struct device_driver *drv = dev->driver;
> +	int ret = 0;
> +
> +	if (!drv)
> +		return 0;
> +
> +	if (drv->pm) {
> +		if (drv->pm->suspend)
> +			ret = drv->pm->suspend(dev);
> +	}
> +
> +	return ret;
> +}

These could be done on one line:

static int scmi_pm_suspend(struct device *dev)
{
	const struct device_driver *drv = dev->driver;

	if (drv && drv->pm && drv->pm->suspend)
		return drv->pm->suspend(dev);

	return 0;
}

regards,
dan carpenter


