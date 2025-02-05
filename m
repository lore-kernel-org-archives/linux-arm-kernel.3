Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6D0C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 12:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TsGJ3UalQzSxFZb2gU0XPD2QXXPZcrt6eLZRxDHYdww=; b=1sgE6CWFL/wNxdJpAtCm9AlI5x
	yDASV6sPwVjH1H8XNXD7XqR37bn7qQQKN6D7+Hr+iKFR1rZ1/nh5cWKGLs+s1Q+TB/YARvI7K5xj0
	003ecbabbgCy/lLmuyCI+0nIY1eap2+n13dKYXflZjjlTu57uqGx+99SaEuWpml5eVh67O4HRiuU/
	1LxVo2QA7pvtyd+gDQvRpcoN1ceTF3WU0Xp71Y5BIG7cPxti8LKoocw/bIScYc5a5skRS3NNzdQzp
	ZWDQXfo/s/S8hwKVT8hcWXE7DiGrpOotC9iQAB4tTLsaI4HvuaiPstJFUJlSFRoFOKMKgcy0HO537
	zLS2xdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfewC-00000003IcP-0vNP;
	Wed, 05 Feb 2025 12:55:28 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfemA-00000003GKG-12Rn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 12:45:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4361f664af5so76890035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 04:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738759504; x=1739364304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TsGJ3UalQzSxFZb2gU0XPD2QXXPZcrt6eLZRxDHYdww=;
        b=hHRNvBrky3xEnvewzbhGVHUwI+I/8oBzNjZ6s42dZVato1WH8k5az17k1bryr3M6hX
         qj04M4jFWryDWYm33lPm65qQkBkfm43cZNXbe+jysiMWNIrLnxiUhLwo0M6rFH3RIQB/
         OXWNG6crcjOg3IXI/cNTOxKZU/mlbiEOvFBaY/ltA2JMtJjD3G2H9x5xjBad7spDkPeb
         B1weNwLx3Zgre8YCxoewRJ1GJZyPV3ylttlx81wLJUYZjMvahX3B3JTTolnLXdCunBHL
         p5jYND9KQTz/8u6+jF5Ca5ItQN/F+f05ujpct39X6O2Q9xUGzu+c3DTGJotzmZZyRO8Q
         xBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759504; x=1739364304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TsGJ3UalQzSxFZb2gU0XPD2QXXPZcrt6eLZRxDHYdww=;
        b=AwM96CYg0mBK1Ri8ZzmxG8NbgEHtvBjjhUOFokItZVbtudF1ZREUuVfVeWrtzjRoY1
         lBVSUMcZMBA5pSgYDbpmuXlFa2fE30MzDf8kBjs+CX/xfG11Fk/nWCyeoHNT4c7dfrvI
         UIxJDLLtiwDFxJRwWWSbIsaB/ZSsFvyMxmvUDO41Txnim5409SCUCU/BUdCG6TSm+znY
         Hx2JgETNJQsxk4qQFMKLB2ql/7HICzryU8EIsW12hWLlEV/s1LaqYF/GI/uHI0+ge2zV
         9wPmUqlsdsKeHKW3d9Qfa7175e2kE5cgUlwTF4fQp5VOtLJyvxHB0v/ZnVC2byZuJ5w4
         6u1g==
X-Forwarded-Encrypted: i=1; AJvYcCW3627dULif/RnQWQlQQgbSQoWTzaPtD/ti77zLysfg8VMRBs0Ir0MRbCgc6aq3mVhprYfrE3buRvCLDLodehlz@lists.infradead.org
X-Gm-Message-State: AOJu0YyhqOwOHvh1kPPjdHn92vLZIxc8yiTd58kDtvaQNE4RB7i7c4Z1
	A8HksTSvoZ2dso6AGEXjK8ofZRiS+//eHKJsbjJmwrD4S5liMMrZ4CKQ4ijpg/eH5uTFD4sDxt+
	6
X-Gm-Gg: ASbGncvfagBBYDwiSbns81TSAdMBVITh92xsV6p70vExj/84UjiQpgz0l7LX92oLpkp
	gpyL/raKs1Z2PWWRq4o1fHNw5hFAdLo0PTuswLcmnd7HntZ7tZ3p1hQ9YP9WoT7inFg/0LEPt+J
	UMyXy9GZbYsbv0WiQmyI4doVhEpQfxfhJrqx0y+72I7uVkmF7a07faBjmlXm2sAYylM7wQCXTTd
	y91bJONMkRiYvV/ujbc9bYTME7nN7MOaFqunOOXYroHuHNsUyHXRIhUV5d61GiYBXVCrYu1UaP2
	Y9Aj5rDnW/d4x6zbEa60
X-Google-Smtp-Source: AGHT+IFCvzDOHTxQpe1wyNcbveuClBOWo7xzohLO9c/UKcth1SBw5nvlvVBDYrxutdBTH8HCumBZ9g==
X-Received: by 2002:a05:600c:3511:b0:434:a202:7a0d with SMTP id 5b1f17b1804b1-4390d569890mr18220445e9.22.1738759504528;
        Wed, 05 Feb 2025 04:45:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38db0e2f479sm3524769f8f.57.2025.02.05.04.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 04:45:04 -0800 (PST)
Date: Wed, 5 Feb 2025 15:45:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
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
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_044506_313149_8B47E31E 
X-CRM114-Status: GOOD (  14.10  )
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

On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> --- a/drivers/firmware/arm_scmi/bus.c
> +++ b/drivers/firmware/arm_scmi/bus.c
> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
>  	device_unregister(&scmi_dev->dev);
>  }
>  
> +static int
> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> +		       int protocol, const char *name)
> +{
> +	/* cpufreq device does not need to be supplier from devlink perspective */
> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {

I don't love this...  It seems like an hack.  Could we put a flag
somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
because that's what we're passing to this function).

regards,
dan carpenter


