Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D60E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 15:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bL3T+Fs+bH74d3/naEWqUYxBOE9ylMC4ULJhqo87sek=; b=b3rBAxD/4YOtYuczoITC5MAywb
	BQCy2bGAVEhnq5EUrfcxHzG8c5nJ7gyZ/EsJtN2MCXS7g7kTpprTkQlv6ThVnoWneU2Z0EC2wYtLX
	RMJ8Kr8m1p+MSDPUHtUHY9iWMaaG0g+eFrNgeZ3a8Dg/zUKBlCkdTZH0wUYkgV/2/AGO6e4Qx9rxR
	NMo2p8Wp4n/v0qKdzhIq5kICl7aMh85YO2rLJpW12pe7VqmQccNokcI9Tmxb0lvdEekZ97W3fn0MC
	rxHWBFqIUNoZHKV9OBgmTQsc+B/IhWGY8R5LHcKuelmGKnwiBzFXOyk04OnEsBMfejxVrc0/Qw3YF
	znbNM+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUokW-00000001iIb-0z4a;
	Mon, 06 Jan 2025 15:10:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUojL-00000001i8Z-21jq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 15:09:24 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4361f796586so149875315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 07:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736176161; x=1736780961; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bL3T+Fs+bH74d3/naEWqUYxBOE9ylMC4ULJhqo87sek=;
        b=ZICyq6wlNFJL2Ep2aNUV81bcMskMpD4mMlGfF/UpwxMx0fIsDAtg88UKB93w6x1IV4
         quogN+Nus4IqkN0ww+VyKYdfcig5enAuLRzApsAZd68mU3popWYuqWddkByY2e8erTUs
         J81lDEGL8nqcdEu7lcr2GXqBHUWqGM/BL3Kb9XjIXmDC4L79klzgax3CRI+JBq98RNhB
         z52ecvKkUzS+tXVHPinl/UVGyNCjCpXHow4ee9OTX/OF8kcvNMGbOIBHvY/ZXh/aaegr
         V16gXtJ7vOwJ7vsJ5khr1WWPSb1xthIE4n4SET+fCULpAorljL5dFjxkQnFTyzjsDbVW
         ByIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736176161; x=1736780961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bL3T+Fs+bH74d3/naEWqUYxBOE9ylMC4ULJhqo87sek=;
        b=JqPFP2omXxjInXNB57a5lsTMo4A2tA8TbkoUZdDVR8f0EddCHIzB0P7h4K8eRLMsal
         Kyjo4oxdC0pW6gETjZg3Pn4SL8KIIO6G3T0zt2vHnuRCQYy2bJfuesrlOavj/rpwak9W
         RyQdeEauNY4yE//NJ9a+edfLWOJTdoEQm34cejBF0VePjevOERPH2xxv+7UcWLsmwqJc
         psLUjBN+gsfjjNOeemEP4oKv/nWmolkPMlZ9jVddI68YMFxfSCiYpQ5i1gkhZylL3qXN
         a5aYgMa2eYEyKYsSgAudeGgY1OZGf5ddkdJCDFd52zkoOAsxGh7MyflgL+mGhx9Mt3Ap
         MELQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdQb0FXLkMWLZavfmKhepSJIN/qDnjTVteLrw6asQohidn/KFcyqtb3bg5wG17xSDSE3zVPuFM1lDpnL12fNWN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxlz3uxuT+LKqFqJMUBBuTwYNiCc9iQrbL+bfVeBdfmHbFqvFGl
	r/5ciWOSAD5hxptvDVsiqAGs4Js7fDyf/z5MK//bVi6wDN/lgEq9Vvox5Y3VNcU=
X-Gm-Gg: ASbGncsGUhg7xMgo0/O5MXwOkzCPxr2yvcHq71paYvQb7BwB5ex+cNbEkjshwUn17mY
	q/QbjA37/AX27suwOYCPnoHVexyLNQQQPmvsPf0cuX6IqM7J8C48ftLkfat3Eax6X+q/WS5FFyW
	o7Af64hTCUKZsTUs5bGqJ8aSIe2SiiKk7RY+mqI+mo9/X47wse416SZqJBnyTJ6e8IoD3ejeeMf
	ATfJCZALrMMEnrXhvvt3aagmrwzu5OQPWh6/y7itgEXFKlx07l3dlhRQGMEGQ==
X-Google-Smtp-Source: AGHT+IFYelyfnSD2yeDmiaHwuqRIu9gXypTjBqor/UZSJjgFrJJkIb6sEFAfDAMbDxcUvBHRw9qztA==
X-Received: by 2002:a5d:6d84:0:b0:382:46ea:113f with SMTP id ffacd0b85a97d-38a221e2799mr60383379f8f.10.1736176161213;
        Mon, 06 Jan 2025 07:09:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8475cesm47793698f8f.57.2025.01.06.07.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:09:20 -0800 (PST)
Date: Mon, 6 Jan 2025 18:09:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [RFC] firmware: arm_scmi: Optimize the iteration of
 scmi_requested_devices
Message-ID: <094fc69e-a7b3-41bc-b5a7-cdc8a8deeef2@stanley.mountain>
References: <20250106065724.3674510-1-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250106065724.3674510-1-peng.fan@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_070923_541491_523FA6D1 
X-CRM114-Status: GOOD (  21.42  )
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

On Mon, Jan 06, 2025 at 02:57:24PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> scmi_requested_devices is organized in IDR based link lists, so only
> need to search the link lists when there is a match protocol_id.
> 
> Back to search the next id with 'continue' to save cpu cycles, if
> protocol_id does not match.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> 
> RFC:
>  Tested on i.MX95.
> 
>  drivers/firmware/arm_scmi/bus.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 157172a5f2b5..42deab5903fb 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -79,6 +79,8 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  			if (rdev->id_table->protocol_id ==
>  			    id_table->protocol_id)
>  				phead = head;
> +			else
> +				continue;
>  		}
>  		list_for_each_entry(rdev, head, node) {
>  			if (!strcmp(rdev->id_table->name, id_table->name)) {
> @@ -89,6 +91,7 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
>  				goto out;
>  			}
>  		}
> +		break;
>  	}

I suspect your patch is correct but we could go further.  Removing the
test for if (!phead) really helps readability.

regards,
dan carpenter

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index a3386bf36de5..2c853c84b58f 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -72,14 +72,11 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 	 */
 	mutex_lock(&scmi_requested_devices_mtx);
 	idr_for_each_entry(&scmi_requested_devices, head, id) {
-		if (!phead) {
-			/* A list found registered in the IDR is never empty */
-			rdev = list_first_entry(head, struct scmi_requested_dev,
-						node);
-			if (rdev->id_table->protocol_id ==
-			    id_table->protocol_id)
-				phead = head;
-		}
+		/* A list found registered in the IDR is never empty */
+		rdev = list_first_entry(head, struct scmi_requested_dev, node);
+		if (rdev->id_table->protocol_id != id_table->protocol_id)
+			continue;
+
 		list_for_each_entry(rdev, head, node) {
 			if (!strcmp(rdev->id_table->name, id_table->name)) {
 				pr_err("Ignoring duplicate request [%d] %s\n",
@@ -89,6 +86,8 @@ static int scmi_protocol_device_request(const struct scmi_device_id *id_table)
 				goto out;
 			}
 		}
+		phead = head;
+		break;
 	}
 
 	/*

