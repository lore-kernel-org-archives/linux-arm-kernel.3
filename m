Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40E9CF5386
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkWfUv09D9iUXWfVB7KgOzAtutIbQ7s0/zKVBfDXje8=; b=jhp9dshGGyNRbT+j4SRDvv55W4
	4Rg1LDgMcE7DmX970LBVW3zDSH+U7CoxJNNEA/ToVGLuxbgMFozkkAggj63VO7DIj4wzKls16tcIs
	HSdQIpL1WsOc+Ai1F0qXn3G1PNr3ncyEqapbou2660PRr3ESUxx8lDRW0liHgbn/qP2DX+14YEcs1
	pJp+Kw+ZDky1189PktbzBXBj1ruPuOVmRveQFyV6oPFVp9SyH6bK2sprBETiDInIt7eww6lxOgyNz
	lb7UoZZlfs77fUmMEaLyxZn9+oV5beSgCnPA2Kc/gNChu12ITpA4jfxfhNIVzAPcpNLrEXRH/qSCF
	DRF21yCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bJq-0000000EWf2-2or0;
	Wed, 23 Oct 2024 13:22:34 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3bIJ-0000000EWK8-1m4h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 13:21:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso72064455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 06:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729689657; x=1730294457; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UkWfUv09D9iUXWfVB7KgOzAtutIbQ7s0/zKVBfDXje8=;
        b=CkPJDWvLizlS+W9C6CMIWDbuvlGXvqGyy322ottxT0Ife7del7m7E5uip7miDFOtXK
         N2QK7136E+fjwtbqnMFQdjhTAg0nq4lbD0/W6w29JgGvuZNVQGI1XAteHOMHCqdPZOFk
         AVyTvmcnUl5mlWp22bs6N0mEBVQGk54Y99ChOp3qOHZz8jGaBIAo6wNInqZZvxxsZuda
         2ExVqhVuGYf5TLYd5fDIm1FhQkitPLOxqasg3UouS3CZ5k6himYt3Imho+w+hpAXu3GR
         vJxZDvU0Bt13osu1tnVkxpsFXMR2vkStlKnCdQNL7rIka4bK2N9tpGHUW748sBzm3Ke5
         Cf/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729689657; x=1730294457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkWfUv09D9iUXWfVB7KgOzAtutIbQ7s0/zKVBfDXje8=;
        b=KqdkttUCdeZ6DaOH9KACypvZMI30fMy3vDj2LrGkU6o96AsZ2Ijui9r9RnPtt87sly
         76CiHf5/LB0uSIx/BgTKeAIWguv/xKdnAj1SkkCs6M7giMrGZsXES24eyTXOInrPsSrY
         a11YOaN7oeJ7t4KXA6MW38h9ABzsjitsHwasjE/U74YbUz7elvO8Fee7TbTv3fxHb86F
         lF/yHD/Zqo7gCH9HD7IK14YpWsx3dikMZoZjTlrbrZg3EVpe3LU7tM5jHnBo4mX8Moyn
         WBsHFz0GBI9SW1Miq8gKF6nspqg9VDMPpmMTsTl9SWoeYOlwYNe9unwJZeboI2wrvzGP
         ivaA==
X-Forwarded-Encrypted: i=1; AJvYcCWpKkPMRjmTylE+0q7HjZqEifajQRmJ6Pi56UJMDwCYUqYs0MuM3sRGPwH4KSSLiS/IHKTTm9rIEREqAU5699HA@lists.infradead.org
X-Gm-Message-State: AOJu0YxsHk1wYbgr/hwd8idZnU4uV9mXqAAiEwirE86qKRwEbiKsEiA/
	0xpqK+6DM5GLSz7Y3xkDiJLYZfwl84EYcRlPmUtmqaGxGl7STcHSHaBsN2rIzgw=
X-Google-Smtp-Source: AGHT+IFkJC5LCeC/OCfK9E7SoXfc1mApx4rYBSl4BC0ZjGuuqRljVVpZPb0eEsRBT2XGEsXc1k04qg==
X-Received: by 2002:a05:600c:1ca4:b0:431:5f8c:ccb9 with SMTP id 5b1f17b1804b1-431842115ddmr29502525e9.17.1729689657368;
        Wed, 23 Oct 2024 06:20:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bfb2f5sm16424265e9.21.2024.10.23.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 06:20:56 -0700 (PDT)
Date: Wed, 23 Oct 2024 16:20:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	quic_nkela@quicinc.com
Subject: Re: [PATCH 5/5] firmware: arm_scmi: Relocate atomic_threshold to
 scmi_desc
Message-ID: <842a9844-ac89-4972-9024-72ed0e08c2d3@stanley.mountain>
References: <20241018080602.3952869-1-cristian.marussi@arm.com>
 <20241018080602.3952869-6-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018080602.3952869-6-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_062059_490812_ED945CFC 
X-CRM114-Status: GOOD (  10.78  )
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

On Fri, Oct 18, 2024 at 09:06:02AM +0100, Cristian Marussi wrote:
> @@ -2959,7 +2952,7 @@ static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
>  			   (char **)&dbg->name);
>  
>  	debugfs_create_u32("atomic_threshold_us", 0400, top_dentry,
> -			   &info->atomic_threshold);
> +			   (u32 *)&info->desc->atomic_threshold);

This cast is unnecessary.

>  
>  	debugfs_create_str("type", 0400, trans, (char **)&dbg->type);
>  
> @@ -3071,6 +3064,13 @@ static const struct scmi_desc *scmi_transport_setup(struct device *dev)
>  		 trans->desc->max_rx_timeout_ms, trans->desc->max_msg_size,
>  		 trans->desc->max_msg);
>  
> +	/* System wide atomic threshold for atomic ops .. if any */
> +	if (!of_property_read_u32(dev->of_node, "atomic-threshold-us",
> +				  &trans->desc->atomic_threshold))
> +		dev_info(dev,
> +			 "SCMI System wide atomic threshold set to %d us\n",
                                                                   ^^
%u for unsigned int.

> +			 trans->desc->atomic_threshold);
> +
>  	return trans->desc;
>  }

regards,
dan carpenter

