Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8B1E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eg8b6Xt4hTeFaUWaulbB4qSRTysVhEe5TEtb9iz/l9E=; b=eOxdHZRwCx7W0bLrDGbQcLIvv/
	ew8wHYcfw2N7HOwAmCmULELnGngLWnPwCyWwWacHgDxYlD5TkxHPXPX+ikvu5u0g0FGUg+drehAA4
	t8LebryySCDtXbfXgpSl2gMq9YiDjCsRtyZwgpqfQnR2YMCMdti3e/iueSTmHwhlGMU2qnhyLdLUe
	nAytcEjnGJMg5d3kPRbw4T04iclO0kSMXRN5/06mLmJrTlDPG5R/gm+Q02YmU12CWK8B2A+Guv5oT
	KmeZPoxebwKMgrox4T0Dn4lMAlXZpJdnXZMkrnXHNPV3kc02x+TdYSYNnzTDj6Dsvab2ssjIVJmnS
	7lca1Wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6WV-00000009P6k-1QTu;
	Mon, 16 Dec 2024 08:32:15 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN6VO-00000009P1l-0hZv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 08:31:07 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso6954372a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 00:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734337864; x=1734942664; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eg8b6Xt4hTeFaUWaulbB4qSRTysVhEe5TEtb9iz/l9E=;
        b=bkOIj+jqRb8eo72zkMvv33jw0drWUtCG2bYjemOF8yRJg3Zqnfm/M3BLqsfBknSJ3L
         ucwFarxWEMQL+zWo29aYsgK/aKnuGt+Re2VsMUtbLd0YbN+gLW//cJaZ6uuZFCOLVhuK
         ElC4yy7fxP0YoAPpwXk1zDqGQQgyARDp1LRRKBSP53EjFHl9RCXYb1sd9iEo3DPPEQ6F
         0w1xykPkdtQRxSEB6RUVChnO92QrddFl7HKCfzdS0VYMzD29QtqW+LdeIgPwKOVRN8H1
         fZ6lAyZzkR/vAwQ1wK53BBT3CkYQJilyq/7h7jndGj6n/zP63inx0dOuFfjGl+jjnpwn
         6d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734337864; x=1734942664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eg8b6Xt4hTeFaUWaulbB4qSRTysVhEe5TEtb9iz/l9E=;
        b=Ay/hTA/cbTpvXr6eTMMG6VXIDaUDAHP4rEw4xmpDonIGDuDd9iyV0RPxF/xvkfQNnW
         6XlmeasWx0833qXJOYT9WPyfCwuqRu36tFe7ztplGleTlGUWO0Y+XVdGIXoOY7XIqMwz
         +lDT+5DMvkfDcwNjmn900kv0kOVFZOmwzhn8dXaZpcrw23yRagW+JG6TRDRqAMPvDEXm
         8cp4QELzq7M0LfZ+dH96S7hY6EP88uS1TcQyvNchO8Dth93aNRq3asqnmRt9ryjC4D0q
         Nu+71AqYxTLGhAVT0bP9+xucpy+BXumjZs0FpqV0ZtCBwoQ90G7VLd7TIE4Vu81EuODs
         STpg==
X-Forwarded-Encrypted: i=1; AJvYcCWnGR2AOo3GMh04gim2SqLyNzBLcASca9KQfo+hi6forEBrW8iJWvB1usU0FyeCn660I6jRK+PV4I4fBmspQJKC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7JXrY++tSSm5fxdMs1sPN5PrDTXXXY54/N5W0WLb1gS1CRNrY
	qxg6kyyvJ/7kbTUfyMEBpFyi439bF0lhIpOG55z1gf768DeyGKbloRGoHBHXPZI=
X-Gm-Gg: ASbGncvfrMLnwCZTPRchXR3vCol531JbSzZVKjw+Cr9XsRcOmQvXgfNpkWi4g2xYAYC
	qbhrI6J/xALY5wHoT6DZI0r1l/vTc/K69k4hZ3w2NHGRD5ZOzLqueGD5EF1q8i+x1l/KWpTHk4f
	UHJ2OFS2amYxb2g2se8mECns4xkXpVRkzwK517CmY/t7R8if6KrYoAq4106Ykf2Wa/58k8Ry89z
	W5b8Gy+U2wJU2SWB9TLDmQU8CGudVgOvI2Wex30mGZ0Ti64q/EOvkySU7ypPA==
X-Google-Smtp-Source: AGHT+IGNDvyG/JdW7IDGZpKsOjZ/Wrlo8Nc6f3yVtNxAi01ShD06b6XzDRRMyvFAPX/5jinEtDuY0w==
X-Received: by 2002:a05:6402:5383:b0:5cf:ba23:3e44 with SMTP id 4fb4d7f45d1cf-5d632317925mr13436968a12.7.1734337864039;
        Mon, 16 Dec 2024 00:31:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae1210sm2899769a12.47.2024.12.16.00.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 00:31:03 -0800 (PST)
Date: Mon, 16 Dec 2024 11:31:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: guomin_chen@sina.com
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Xinqi Zhang <quic_xinqzhan@quicinc.com>,
	guomin chen <gchen.guomin@gmail.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] firmware: arm_scmi: Delete the meaningless
 scmi_bus_id.
Message-ID: <e6a19d60-8e39-406a-8426-5fbec50c4b3c@stanley.mountain>
References: <20241216073745.2973317-1-guomin_chen@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216073745.2973317-1-guomin_chen@sina.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_003106_208339_03A6413C 
X-CRM114-Status: GOOD (  22.95  )
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

On Mon, Dec 16, 2024 at 03:37:45PM +0800, guomin_chen@sina.com wrote:
> From: guomin chen <guomin_chen@sina.com>
> 
> Currently, scmi_bus_id is only used to set scmi_dev.id,
> which in turn sets the SCMI device name. After removing
> scmi_bus_id, it is clearer and more meaningful to directly
> use the unique tuple [Parent name,device name, protocol] to 
> set the SCMI device name.
> 
> Signed-off-by: guomin chen <guomin_chen@sina.com>
> ---
>  drivers/firmware/arm_scmi/bus.c    | 17 +++--------------
>  drivers/firmware/arm_scmi/driver.c |  4 ++--
>  2 files changed, 5 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 157172a5f2b5..800e8ec9357c 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -20,7 +20,6 @@
>  BLOCKING_NOTIFIER_HEAD(scmi_requested_devices_nh);
>  EXPORT_SYMBOL_GPL(scmi_requested_devices_nh);
>  
> -static DEFINE_IDA(scmi_bus_id);
>  

You'll want to delet the blank line to avoid a checkpatch warning.
(checkpatch doesn't warn about the patch, but if you re-run it on
the file later, it will warn).

>  static DEFINE_IDR(scmi_requested_devices);
>  /* Protect access to scmi_requested_devices */
> @@ -341,7 +340,6 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	if (scmi_dev->protocol_id == SCMI_PROTOCOL_SYSTEM)
>  		atomic_set(&scmi_syspower_registered, 0);
>  
> -	ida_free(&scmi_bus_id, scmi_dev->id);
>  	device_unregister(&scmi_dev->dev);
>  }
>  
> @@ -349,7 +347,7 @@ static struct scmi_device *
>  __scmi_device_create(struct device_node *np, struct device *parent,
>  		     int protocol, const char *name)
>  {
> -	int id, retval;
> +	int retval;
>  	struct scmi_device *scmi_dev;
>  
>  	/*
> @@ -387,20 +385,13 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  		return NULL;
>  	}
>  
> -	id = ida_alloc_min(&scmi_bus_id, 1, GFP_KERNEL);
> -	if (id < 0) {
> -		kfree_const(scmi_dev->name);
> -		kfree(scmi_dev);
> -		return NULL;
> -	}
> -
> -	scmi_dev->id = id;
>  	scmi_dev->protocol_id = protocol;
>  	scmi_dev->dev.parent = parent;
>  	device_set_node(&scmi_dev->dev, of_fwnode_handle(np));
>  	scmi_dev->dev.bus = &scmi_bus_type;
>  	scmi_dev->dev.release = scmi_device_release;
> -	dev_set_name(&scmi_dev->dev, "scmi_dev.%d", id);
> +	dev_set_name(&scmi_dev->dev, "scmi_dev.%s.%s.%d", dev_name(parent),
> +			scmi_dev->name, protocol);
>  
>  	retval = device_register(&scmi_dev->dev);
>  	if (retval)
> @@ -413,7 +404,6 @@ __scmi_device_create(struct device_node *np, struct device *parent,
>  	return scmi_dev;
>  put_dev:
>  	put_device(&scmi_dev->dev);
> -	ida_free(&scmi_bus_id, id);
>  	return NULL;
>  }
>  
> @@ -526,7 +516,6 @@ static void __exit scmi_bus_exit(void)
>  	 */
>  	scmi_devices_unregister();
>  	bus_unregister(&scmi_bus_type);
> -	ida_destroy(&scmi_bus_id);
>  }
>  module_exit(scmi_bus_exit);
>  
> diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> index 1b5fb2c4ce86..bbf1f05f2be3 100644
> --- a/drivers/firmware/arm_scmi/driver.c
> +++ b/drivers/firmware/arm_scmi/driver.c
> @@ -2641,8 +2641,8 @@ static int scmi_chan_setup(struct scmi_info *info, struct device_node *of_node,
>  	cinfo->max_msg_size = info->desc->max_msg_size;
>  
>  	/* Create a unique name for this transport device */

This comment should be updated.

> -	snprintf(name, 32, "__scmi_transport_device_%s_%02X",
> -		 idx ? "rx" : "tx", prot_id);
> +	snprintf(name, 32, "__scmi_transport_device_%s",
> +		 idx ? "rx" : "tx");

We used to create new transport devices for each port, but now we
only we only create one for recieve and one for transmit.  This is
unrelated to the commit message and needs to be done in separate commit
if at all.

regards,
dan carpenter


