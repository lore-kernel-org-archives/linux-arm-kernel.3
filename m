Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D273CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 16:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9LI6s40pwmOAvNzLobzMUKZOm00biMObXADSvvCng4=; b=eUQzYSWc305OuqDnMyr0z65dWp
	k08BLbSVdZPUPJ3kzW87/HP2GWO3cHsx/QV2a0rrQv2+csizercGIWDUF0LMHzbg0K2dRPmsSBdTx
	MVJxbO6LMxtHYaZBqA7CYN9tvcjrxp8UM/4PUPwtmcep3Ufe8+vyGLEJ3Hudhtu0ldEbCtNEpurRX
	XUPinxjSTPjQDIHhoRdKzPfomBMEkjzqXlVG00snEa6OjSrctm5q+ZiwY+hNb22IUx+QhYRYbdJeB
	zIjT28FiUbVMYyt/qvpDzAgnFhHyH4xujWQlWQ5ksBziFs8kS55Ml6rY6Skd1vYz+uoW9JiPvmlAT
	wjNIqNZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNOg-0000000FN6J-0sKT;
	Wed, 10 Sep 2025 16:10:14 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwNOd-0000000FN5X-3W0C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 16:10:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3e537dc30f7so2738643f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 09:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757520610; x=1758125410; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I9LI6s40pwmOAvNzLobzMUKZOm00biMObXADSvvCng4=;
        b=xXDXhqSrjwPUjeoQDsw8kWngf0KSXZH2QZn7nhFyrM3nc3QACErDxV678eaotYR8GA
         cMWMnvawg0pij5n0akE9Y4U6nAIZkrIquSKTpgPMxnxhURsUgAKmm5400Sj4mCWzzkwi
         PrThpWt7BlA11r2WJzzE75uEEPCMdsNL4uzi76dCOiot3h4Y1680I9cyCiJI60D2e6DL
         OxrYcMC1Y63lb61ngcxnvGgxDMd1r1gfXOs1NseLW/0CJZ/hJ49MfhH4JiUtHFWWTwnJ
         imHDyVkSNamzeOsOPs8J1cSllP2SoOf2MVz89nNYvgg46piyQAtRMuWfaQblbA5FjOYK
         2Eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757520610; x=1758125410;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9LI6s40pwmOAvNzLobzMUKZOm00biMObXADSvvCng4=;
        b=ey6nmseBe5Tbzqk/oZ/rBX94rNtbWjGnreHh9tGaVyfj8dwOUwm04Y/1HZfTshUZgZ
         6fRBI8HQQ1KLhYoCzPBj4lya4Iz+zDR/GFhi6/RoKb5KG0sU/vwInoP0XNuES0NGN1gk
         rykb8TPqHyS28bhWUVlLfuUK9wAgdX1iKJCLjskCBoy7Z3cGI+DbFysvwx+i+DLB422n
         X6unG12afIGtgnkud4A/4nDTmOtB/MLetblKZ5h2N+zU/PfhajHqhQENNhAGms9J+9wF
         KpaUhOmDWRWsYMjf7x+q9bX0aIVAXYFHov0nFoQXGAJwkEbKORtkKpnaHmdsYjZlM74J
         X/nA==
X-Forwarded-Encrypted: i=1; AJvYcCVC3zFzo4HZnPeBFallKxE190fAawVNYEKyL9rMMd2OwVEXBDgatl9msHsdNpxpO1sJloBJpxXaMSWNyphU/29+@lists.infradead.org
X-Gm-Message-State: AOJu0YxjrDLihn3dXzKMOwyf+Bq30Aye2Drf//WzhsUCdlqhoRxqZjq0
	1PvrVwacglGPW7GFYj+G9Wupryyys7vBV/P/Wx+38x5iSI3J4aSMCTAgE2syzCL66EI=
X-Gm-Gg: ASbGncsWL6fFl4OPH9kfoZqpOpAowzX/RFIETFOCFcJ9x5HerZp0eJrZgGcKXGSxdcC
	AXvpusDp1uJglzCTOciXA5PZPRy2r5usfW5bLfj6C4Q8h9q3/LaqCTw1d37zvtodtOE1CRrin5h
	mUs907nl0CiHOJWpDM1/gOUCbva5qHO93BGNnPfsY71mAQdEoetJUe7QlM8ZXvOa9jJluJXU1fe
	2Q2ZK/tdlAMPQwtrUtZOvpSmYDvqEi78xWqV1DxIzcTDTujPSS85T44aUxbSXDXiD1YRqhUo5jf
	NcHSV8fvDA/PBqDrQBxPStylxHjwzWoghCjN/39TMhQ/MXTg7wE6mbSS6SLyWF9ZmQF3IGUFRhA
	BGUfQJpe+KML6BAjRkk7luX8aX1w=
X-Google-Smtp-Source: AGHT+IE9glpLlh0ZXr1YlFRw69nZiN7PdFZT9NC7CNgw6KEShDJ8T0VtMfBa/BEPa2F5bWBlMU4Tpw==
X-Received: by 2002:a5d:5d82:0:b0:3df:a0f4:abc1 with SMTP id ffacd0b85a97d-3e6438373acmr12643107f8f.29.1757520609607;
        Wed, 10 Sep 2025 09:10:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e75223885csm7320979f8f.36.2025.09.10.09.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 09:10:08 -0700 (PDT)
Date: Wed, 10 Sep 2025 19:10:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] firmware: imx: sm-misc: Dump syslog info
Message-ID: <aMGi3S2j_FHid3Sb@stanley.mountain>
References: <20250910-sm-syslog-v1-0-5b36f8f21da6@nxp.com>
 <20250910-sm-syslog-v1-2-5b36f8f21da6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910-sm-syslog-v1-2-5b36f8f21da6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_091011_890041_EA822BF8 
X-CRM114-Status: GOOD (  12.77  )
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

On Wed, Sep 10, 2025 at 10:28:18PM +0800, Peng Fan wrote:
>  static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>  {
>  	const struct scmi_handle *handle = sdev->handle;
>  	struct device_node *np = sdev->dev.of_node;
> +	struct dentry *scmi_imx_dentry;
>  	u32 src_id, flags;
>  	int ret, i, num;
>  
> @@ -98,6 +134,12 @@ static int scmi_imx_misc_ctrl_probe(struct scmi_device *sdev)
>  		}
>  	}
>  
> +	scmi_imx_dentry = debugfs_create_dir("scmi_imx", NULL);
> +	if (!IS_ERR(scmi_imx_dentry))
> +		debugfs_create_file("syslog", 0444, scmi_imx_dentry, &sdev->dev, &syslog_fops);

You don't need the IS_ERR() check.  If debugfs_create_dir() fails then
just pass the error pointer to debugfs_create_file(), it's fine.

regards,
dan carpenter

> +
> +	devm_add_action_or_reset(&sdev->dev, scmi_imx_misc_put, scmi_imx_dentry);
> +
>  	return 0;
>  }
>  
> 
> -- 
> 2.37.1
> 

