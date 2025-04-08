Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857DDC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+9PU6RaqZLEW0CeiqDaSWQKAtYrOqL2T0FLR0/1tl5g=; b=fuX0t2gcem9CWpWn3vXAGJrLdJ
	eYpKnnEX3ZLr4ZB9/pvZ42ZdfM4YCWyNc01Up+EbBy7qDxVvtgIOyNtG67qiJqpkAIBo7bzyQfwfQ
	wu0DhcLbH6bjgywBCgXgp099RkGoJA29VyOGfSjgKwzZ2xz3x7lWT8XIlUk37UFYRkMGul9yUHFGU
	+hI7mr9RgLVlXwD3rTEa7yGQ4eMp3i7wLAPnEP6hv54eSLTNMlbdCieqeFgSoaenZY5UNjcM/Uc3x
	lqaPxRReW35x8Xn8hv/pVTnw/ivdmOQWiXvEqtPiEeMjNGxue/L8VDW0gUWVi9+I5L+7Y5JE4lKmW
	4+eZyHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26qv-00000003oDK-16cP;
	Tue, 08 Apr 2025 11:10:49 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26K6-00000003h7U-26kL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:36:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso4737995f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 03:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744108613; x=1744713413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+9PU6RaqZLEW0CeiqDaSWQKAtYrOqL2T0FLR0/1tl5g=;
        b=KfN6eUldshfucpNfyoLXvu25+cC1XTo6i8Gz87DkfXuqDI+UsNbCPEjmxI+3yLi0DJ
         p2U6SjL1Hi72cyemI2jXC7mU5kDq1WFP4lBRBUAxixsINfl8AqWuNz/pZIfyFcpZrHbw
         X40LDhw58ZXl7G7QwkHNFXf5G3i4yTWn1XxoPDXG2X4unSFkYqTlPEOs1W+aUfl5gwEU
         7HPQd6r2UBsJg6aquAzZ+9ofgzRjFrjCzQn7nPoGN/7OFoCcJNWAt36bvkoV8xZWecE9
         qhNURUC/6NkhgTOiLLnlEZgiSI2PHrKZjlYqShZVRUXSEwcEoiRfMWzzAY2OCqKRiStH
         zF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744108613; x=1744713413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9PU6RaqZLEW0CeiqDaSWQKAtYrOqL2T0FLR0/1tl5g=;
        b=OrXC1Kl/Nr7z/ymbBg1iDl8Z6DMFv6W/jMIVpxVANjDTn24Hjb0qSecvgbmN/7hVui
         de5jEfGIQXc6TZx7P7OCSghlGRAINakVmVmopv1/6x2mzfa87cUYRq7sixZl/JO8DoRq
         qD9tjLc+HXFkxaVgxvtvPP+MPcWF8eSWXe+iVDdVv2SEfpb7ghXWrSyS3iqkS2wWGnZ3
         N6lfqcgwA7PrybeB2kTxjbZpOySYL3r0mM3mgFnn+LsfAcYqW2AnnQxv9QwLx0YkqyvD
         npzEGSW5m/IzM9hyk2AfO9nuPv2EWGlwQWS2pPCbOEQwpx0xWK5vX9Qz0MOiqvuelHiO
         kElg==
X-Forwarded-Encrypted: i=1; AJvYcCVKUwbp5I+uNIqUr6BZLrlcXBfcEjqE9Lbb2lwX6SgvhBNXO3b3k3w4yFc2OjyZhl5PCxm2KinCuNdPUNIw1NaC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywum07PiruYf67p90NOtH/7aQ89vCOjRhmJ1xPUyKRvskdjb/Z9
	wX3vdpyljfTB/HLj0cvS+IpWYzz0w0WD9nXwWZ6zUBxFhAYuerF3giLktw7V1oI=
X-Gm-Gg: ASbGncvjwf0K7omWXjhjg1XgAUVYuEpvB22WlL7XjT7TAPLtbvrW/x+w8B/wSkMCzyH
	VDLNe2fDPyhv3IcMjxHDu9KTypj3Gmmj9JNZAeHx5BMLvVqaNXpfXY9LcgiX6lW5STulmU3r3/P
	Fq856k3zHES8DKbxx/Co6zirLtwcpxdsCjspCxtJ7//GfwckeKY1RloS37AIfmog7+1TU+TYJjl
	IQgUa+RQ/T9EXXRPFTQiLjEBEQNpVgD9d3Yuqvwfl9xYQN900/2YB+zBPATS0YzlkqnrxFw7D8W
	Bj3yvGD/U9Xhl9Bvo0XzY/0dC/IOXjB2Cr+7xLdWl/QVUhgI5g==
X-Google-Smtp-Source: AGHT+IE5t903o03RamYyBBOUOtT0lEmSesMlodjULwqDkGqsFvnjjqyphRtizxEDeFR7TGxXwDEjLA==
X-Received: by 2002:a05:6000:1863:b0:38d:e6b6:508b with SMTP id ffacd0b85a97d-39d07ad4e86mr13874685f8f.9.1744108612851;
        Tue, 08 Apr 2025 03:36:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec3429f67sm163443095e9.7.2025.04.08.03.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:36:52 -0700 (PDT)
Date: Tue, 8 Apr 2025 12:21:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v4 3/7] firmware: arm_scmi: imx: Add i.MX95 LMM protocol
Message-ID: <b85cd7c9-1747-4f8d-82e5-5bf734263566@stanley.mountain>
References: <20250408-imx-lmm-cpu-v4-0-4c5f4a456e49@nxp.com>
 <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408-imx-lmm-cpu-v4-3-4c5f4a456e49@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_033654_539587_27645A25 
X-CRM114-Status: GOOD (  18.97  )
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

On Tue, Apr 08, 2025 at 04:44:27PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Add Logical Machine Management(LMM) protocol which is intended for boot,
> shutdown, and reset of other logical machines (LM). It is usually used to
> allow one LM to manager another used as an offload or accelerator engine.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/firmware/arm_scmi/vendors/imx/Kconfig      |  11 +
>  drivers/firmware/arm_scmi/vendors/imx/Makefile     |   1 +
>  drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c | 262 +++++++++++++++++++++
>  include/linux/scmi_imx_protocol.h                  |  32 +++
>  4 files changed, 306 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/vendors/imx/Kconfig b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> index a01bf5e47301d2f93c9bfc7eebc77e083ea4ed75..1a936fc87d2350e2a21bccd45dfbeebfa3b90286 100644
> --- a/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> +++ b/drivers/firmware/arm_scmi/vendors/imx/Kconfig
> @@ -12,6 +12,17 @@ config IMX_SCMI_BBM_EXT
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx-sm-bbm.
>  
> +config IMX_SCMI_LMM_EXT
> +	tristate "i.MX SCMI LMM EXTENSION"
> +	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
> +	default y if ARCH_MXC
> +	help
> +	  This enables i.MX System Logical Machine Protocol to
> +	  manage Logical Machines boot, shutdown and etc.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx-sm-lmm.
> +

Remind me again what happens if you have both the default and the
extension modules enabled?

regards,
dan carpenter


