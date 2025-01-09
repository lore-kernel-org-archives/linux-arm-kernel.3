Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A627E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R7tMXX4qdRYGFciUc1sdwNNpuk6x7gkAmHud+GC2Ng4=; b=k3Mze1ho0oBloNZ4O66OZbajKX
	fx92gehO1IAnZ0oIvE72F95PsIwTulYAMQzg0wHZKrD13bhjoarc5zQQIxJYPs2VTfVZiNCIihL0U
	16oyYEV7A6G5C7/02cp6/eHj+S1dvTnHRtRiMfyxHDJkqEa4UDYdqyNK2AU1OZGg1yh1xa1JU4YtV
	D8yPSGrL+QBdK4kXuenaI/XEtJiDvAlWtme1QrkmWL+hy0Ao3j+25sZL9rx4ff9GFVz1hieBeqcmC
	SM3+w/SyTmoZUhXvir8mowoAIpYDhApWRMJuCmC8u8QHjYkybppYOwGigxGYnET3Sj7FKyh7HtQDg
	sPP/sLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrrp-0000000BszH-32ky;
	Thu, 09 Jan 2025 12:42:29 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrqb-0000000Bsfa-3eM1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:41:15 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so868938e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736426472; x=1737031272; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R7tMXX4qdRYGFciUc1sdwNNpuk6x7gkAmHud+GC2Ng4=;
        b=r9mIU88AMnog87UGjUbk4bqQO+L41qmnvduh9ZJ8pC5yHyrVYSQ6AsJclptsjb72LO
         JkeafHkGis0Q0dPf4V9il/6KVlm+dpMmLOqV0U45UNzBTWcvk/UC5tZGoZKlLtQ+Xogr
         r3d9aXzZhfn7WjaQGln9Uu9XSHkqDWTzvFZL0EZPdR0M5vAUfZZMdjOSIPVX5qhJkPhQ
         9dncs3A1NYk9OCZMJ3en86jV5RMy6QfGGzmsGkD4cs/z0fwnrEJDRFXbDlt/sheNMS2d
         Wy5SKgtbrHwtaTH+cbYvjH6Or8CzY9+Zlv+RkmA2+dL7BZyrVSMlzSEGV5nXTiAsmWZO
         nBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736426472; x=1737031272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7tMXX4qdRYGFciUc1sdwNNpuk6x7gkAmHud+GC2Ng4=;
        b=iTnxv2wifpYebPQ3B7QVRpvXoZWl3dkWtVYhpwZCrtayLxVlMz7yFVYzZ+cMVEaa51
         xcVhD/O4a40LnTNMpZS+OfmFVbTpdPIisdgb/iTa729wmBJn9LoR18brqhjJCKO6al2x
         1L84dxLFGks6IbJJUJmSsCF/aKC98PmXdN8852FcXyPzKIBwQacmiWhPEbISrn8ioRTk
         XhGPIPfLZYZ6oRF73crBDfEdfzjWmyk44n9DnbvhGALIy1kMuHoW1ZJ6nilSrKFAS7mH
         KyryxQw9k/9RDgrs1K6iRZDMC8hdtEWbAelrwRHY6WU6u1cZ3zZ5ErdBkNLEunmG2Mi3
         i3Fw==
X-Forwarded-Encrypted: i=1; AJvYcCV+iXwh1XxK/HqrkXx9kYyBqewxW3VzXo071YCMUPXRYTr5v3gEouJPOf/IoWpz4lE1/OUA/Izc6W6Wq4S1Qvzo@lists.infradead.org
X-Gm-Message-State: AOJu0YwGWlXeKwvIZ5Lit3NrI0cmKNGz7ZZgfZtQlt9643Lm0VZQrj+K
	E+KJxAmqNDej51VmA3y5653uPHVMbkRZI3puJDw5Q3GQ1uX8UmPw6K1Ic2TJ2MQ=
X-Gm-Gg: ASbGncu+ZrLjbTmh+DyWL2r898PJfCeyIdzyQ1oEfcYpS6y758YoCfwF38IFK2iHhW8
	f/51gL2emKYrVlM/AM57r7HjuKvqxZnGP+vORWCAvntYQ8RsnOUjM3iHIwdWrtX+BkasCfe8FLI
	7SdAFYp+7yhegVvkFXeNFmA97ANMTPg/MHf1kAabOxUDktnP9sG84BMSF5xkGxwkAnTz/+V4w3m
	4uV7PFkznmtI/Qhbefn/Dh+watUnafuG+wewlZOazDvZ6yBrR6YeV7G98y1i0n9NxHJMTiEPMeD
	u76yBLeYl78U88Sju48tBTqhID6P3dUboB+b
X-Google-Smtp-Source: AGHT+IEwvFACO52C3ryh5S7HnArGMLvYQPYGuxGvrDUpjWDgL5Aq/3itURjeK26UKQyFNf6mWWqB1A==
X-Received: by 2002:a05:6512:3d27:b0:542:2388:3f09 with SMTP id 2adb3069b0e04-542845b20bdmr1837748e87.37.1736426471690;
        Thu, 09 Jan 2025 04:41:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bea6a72sm185201e87.151.2025.01.09.04.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:41:11 -0800 (PST)
Date: Thu, 9 Jan 2025 14:41:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 08/20] drm/bridge: analogix_dp: Add support for phy
 configuration.
Message-ID: <7tvoipnypxzkzu235vc2n4jehcxgfkmgd5op5j6cqibqwmnlkg@vpftfenswtrq>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-9-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-9-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_044113_907402_F4538D8C 
X-CRM114-Status: GOOD (  14.13  )
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

On Thu, Jan 09, 2025 at 11:27:13AM +0800, Damon Ding wrote:
> Add support to configurate link rate, lane count, voltage swing and
> pre-emphasis with phy_configure(). It is helpful in application scenarios
> where analogix controller is mixed with the phy of other vendors.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 
> ---
> 
> Changes in v2:
> - remove needless assignments for phy_configure()
> - remove unnecessary changes for phy_power_on()/phy_power_off()
> 
> Changes in v4:
> - remove unnecessary &phy_configure_opts_dp.lanes assignments in
>   analogix_dp_set_link_bandwidth()
> - remove needless &phy_configure_opts_dp.lanes and
>   &phy_configure_opts_dp.link_rate assignments in
>   analogix_dp_set_lane_link_training()
> 
> Changes in v5:
> - include <drm/drm_print.h> for dev_err()
> - use drm_err() instead of dev_err()
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    |  1 +
>  .../drm/bridge/analogix/analogix_dp_core.h    |  1 +
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 52 +++++++++++++++++++
>  3 files changed, 54 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

