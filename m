Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72C5C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 22:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qciZZcm9ZhGrH66JTdpjaM1ur/fzC7K8oAKg3h0lmsU=; b=ZykZKgSXpEnDH6dV8i++XqWzRP
	o5jze0VsjVR4Ut2FezNC2nuKVqk0FRFD3/XSfMvWYZwXGlCnxe3MU2+21R9NRLGLQNg7/LwTyaYJb
	rVjmks72qElpl2OKB4JdGZOmn1JVYZXpccTpGh3p3teOP0LZTRWGhzKnb6me62ccxGj3LAhFypblq
	IfHqRIzPkBvwJnDDa/3LRVtvdNIOUO/CNvDaBqdRrpO7QNbVcLBk4l+DpoxGEodk624m495qwvaCm
	hAm1ydqdYncu6bJYteOIS9FinUcB/pSfPjrBtQpvu3tIW2W2XXgfYKajzjhYkaEqxS5U1Z/0C1VPe
	XUdfyi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjwH-0000000GgWL-0WS5;
	Fri, 20 Jun 2025 22:10:25 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSjdl-0000000Gejh-3k2w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 21:51:19 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-40aa391ce1aso622646b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 14:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750456277; x=1751061077; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qciZZcm9ZhGrH66JTdpjaM1ur/fzC7K8oAKg3h0lmsU=;
        b=xPixvMyuTGAMcS0Oz5FhQuSmaJURrl8m3X0NzKFDdP8Viea1tloD1+RNST0R2hDH0x
         Vi8iq6F91HMAIhwuMyrOs//0Y+j3E7+ShRVUm2zAfQVniwLfHIM5p8eBZ7sX/7/570BN
         o73xa1ghz+o5RxTSNPhypMpZDjxqDRw3fkHyC6yYJbGtvTxbBFjEKA0/kW11Q+uyDkz0
         fUo61pk7vJpV/XYe7Qpht24aXZ/yGnTxy+e17UFR63tzM7zfBZsCTRYeWK/urflkkqen
         4nhqGwOQ7S5fYSveollgzGO6MFxcOwxFeNycLa6R8zbNeSlRr+KDbFDgtfD5/vCAnpj8
         JDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750456277; x=1751061077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qciZZcm9ZhGrH66JTdpjaM1ur/fzC7K8oAKg3h0lmsU=;
        b=qHTHfghhgFCAWmMaY96ZT6mS2kjxH4r5i3kgsenEWqzw9G5Xwl72YEFjTSM0zYVEOX
         bRbcEupnHgQSA6De0iM+VaUUpmOPW9o7ERbadx17VlJ+lSjZSgfcqfo++ljrNiGDRQgf
         SfcTd2dERnyxa09xGJoAe456uxm+YAMAIT+pY50oBuT9YM7xWVn7z0tO8ZhG4NbsE7VI
         MtBkcHTp9cFYBEPl4IPDdjJz/tGuBWTFeRuwtvK+dnqve3hDowtuTHi3f380s0InuAZx
         xZIhpn+dqABszxs84MsZb6LHP6/Q2KiDC8gyBfnQaTE04F26U/EyOiHp+rvB1ioTy53B
         0hHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVITcAQspKaNsST5lIFvQzl3oxNgwxLws4UMf0DYe5z9kkGfNYHPHmlBhFvd/jI39Vk1GkUpgI+vTLMwMBy1vzh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8NBtV9IGbd/lebR0oYPE26n5mS91GIEh63PvbcjDY7FFzJoxO
	rYPPYo105UBaHjw/FlWNETgakCgXTrS9cl9N94xqg53RF9Ycw34vXVC27tuvGi2a7J8=
X-Gm-Gg: ASbGncvaZOOJ/9+6rVNCGqAHDR1SDgMze6HY92xU8raOQZendP33xyWmebxla0bc8iX
	zSM7G7fcdFNbPUsqnyIxwRGgbXPDtefHee4yTY+65KCe37Wo+xppMkpixZY32ulXbiyOHuAbjh1
	TYVcOBXX5bf0kolh7KLS1ksQ21DuyXvFrV7HofUkHghBnPTWHF7szg0wSorhz3FHXxxXio7k7Y2
	Sfa4rpoGq1it5DmZsY9tu5593qbRMAW+amPKWsFngevkF6+B18IIYpDhNbIyuY6yfRbZ+oSEE00
	TEYjJfWusp+zgMRDQMd1IVwwDYW5G23J8R3P5mj/QocHwntJSGM0BMFpN30PmYssqTS2OA==
X-Google-Smtp-Source: AGHT+IEUKt2T8NPo19dPeOycUEZfJIdPu2BwWVzJ6tGEwvl4xQ4AjLwthY3jfBkPvwEIgCaF/ro8vQ==
X-Received: by 2002:a05:6870:af42:b0:2d5:2955:aa66 with SMTP id 586e51a60fabf-2eeda4e114emr3105643fac.1.1750456276972;
        Fri, 20 Jun 2025 14:51:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:35a7:a70f:9610:a99b])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6115b7c909esm342923eaf.27.2025.06.20.14.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 14:51:15 -0700 (PDT)
Date: Sat, 21 Jun 2025 00:51:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 5/7] firmware: arm_scmi: Add System Telemetry
 chardev/ioctls API
Message-ID: <6fa26a61-1f61-4ab0-8b7d-caeae7eb801e@suswa.mountain>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250620192813.2463367-6-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620192813.2463367-6-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_145117_933341_DCEB891F 
X-CRM114-Status: GOOD (  11.07  )
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

On Fri, Jun 20, 2025 at 08:28:11PM +0100, Cristian Marussi wrote:
> +static long scmi_tlm_des_read_ioctl(struct scmi_tlm_instance *ti,
> +				    unsigned long arg, bool single)
> +{
> +	void * __user uptr = (void * __user)arg;
> +	struct scmi_tlm_setup *tsp = ti->tsp;
> +	struct scmi_tlm_bulk_read bulk, *bulk_ptr;
> +	int ret;
> +
> +	if (copy_from_user(&bulk, uptr, sizeof(bulk)))
> +		return -EFAULT;
> +
> +	bulk_ptr = kzalloc(sizeof(*bulk_ptr) +
> +			     bulk.num_samples * sizeof(bulk_ptr->samples[0]),

This should be struct_size(bulk_ptr, samples, bulk.num_samples) to
avoid an integer overflow on 32bit systems.

regards,
dan carpenter

> +			     GFP_KERNEL);
> +	if (!bulk_ptr)
> +		return -ENOMEM;
> +
> +	bulk_ptr->grp_id = bulk.grp_id;
> +	bulk_ptr->num_samples = bulk.num_samples;
> +	if (!single)
> +		ret = tsp->ops->des_bulk_read(tsp->ph, bulk_ptr->grp_id,
> +					      &bulk_ptr->num_samples,
> +			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
> +	else
> +		ret = tsp->ops->des_sample_get(tsp->ph, bulk_ptr->grp_id,
> +					       &bulk_ptr->num_samples,
> +			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
> +	if (ret)
> +		goto out;
> +
> +	if (copy_to_user(uptr, bulk_ptr, sizeof(*bulk_ptr) +
> +			 bulk_ptr->num_samples * sizeof(bulk_ptr->samples[0])))
> +		ret = -EFAULT;
> +
> +out:
> +	kfree(bulk_ptr);
> +
> +	return ret;
> +}


