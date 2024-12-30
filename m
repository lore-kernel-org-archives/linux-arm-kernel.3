Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71D2E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 12:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCO6CXWnoZCq053HJEmMFJxQhQ579FC0ggfho/ODq8Q=; b=1319C9TCwe90LZPorPOnZ7T/Cy
	VFf/cPwNWvOf/j67FZCnGB753yoWMH3XkGjjFx1fVwHnitVI2MY1Wu1N0QRL4mcd9Og15PhIrpXuQ
	9diGOP55xmehBuPcz+KhUl/ihEUWU3D0wrHpsbZ6m2hPvq6XesXtFi/wiqAsoOP2i1lxdtO8q84RH
	eN2x2Xe2LW1PBAjUXTxqdusrylTeB9enkYWYWDO4QRlZBaGEuqTUccjg6xJ9oAYqLLGb05S/Iah/e
	2kb9tbEDRZQkIPGIp0nkY59qYX54rtfCHGX7In2Zc5Eg3+gjSzx8HyjqjnO4OXuMeR6FpBBTo0Brq
	iEW9BSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFCl-00000005Djn-3EVp;
	Mon, 30 Dec 2024 12:49:07 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSFAn-00000005D6F-3hif
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 12:47:06 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30167f4c1deso89006941fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 04:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735562824; x=1736167624; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uCO6CXWnoZCq053HJEmMFJxQhQ579FC0ggfho/ODq8Q=;
        b=NsS/Pt3WDh+sDFuFMqZUJiLv57Hn+om2lZdwu1nOXexgHHfLTqvEWz+G5Xvlqu9VRS
         udLGh8wlEoNYvL2foUlSvCpCgpFX0cEYtn98kZCwKHMXYyDk61+P2q8A8V9E/a7hkcmo
         xOEhjt6svGG4r4c2mZOXhPyS+HYrv3EKJHDyV+jhokeFUaPo5RRXsNy9MBirpEn18cxB
         Nc3qjCDC/uq+71THOICMIXxG/NDVl0agMa0iWIWVQ/vVZLz3t+VaY7JD7uE+8aAtwhkZ
         wceazpTsycb26XtX/rH3EDnbUhnv3W4Q6gksQkYbggYk6DqgOoVqVLNc4ZOFxaRhjPu5
         euNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735562824; x=1736167624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCO6CXWnoZCq053HJEmMFJxQhQ579FC0ggfho/ODq8Q=;
        b=wouOPW/jbJpMmk7y2R7Fgi7kvYXwJe2LP9rsuUI4yfObwxnTjoZ+Ku7Rv97djwxem6
         k/5l74YlZTOowAQ7nD5mr+gjrF5K+AfW9Zh6iC/kPWBxiM2dev0nYOEfRZLRtixqvVOL
         p7X4lMg5XwS+gBxyYZHrqkOpaOkn09oGKPvVXmJzee6miE9dEsNO5JHvsr/it1QABlMV
         zJltqMaZ2DWSrwrtFd9RLO2crhHbYpBBorCzL2U5D/8y/ebjiXRTIgq095nU0M8SvF6X
         9kb/UPFmxrq9+apf4lm9VoB6Z2GJbMVjKU1PRLKrX0l2b2E+17dTRa700gk0V8yeg0N9
         AWug==
X-Forwarded-Encrypted: i=1; AJvYcCWsPLxv6INw9hoCEYZmsSepFVLkhQ3GiSz2Immk8/ONgo4VNTxWhfvfkF69R+H2nNpCGuvAOXDN1zMiiZBaVxVo@lists.infradead.org
X-Gm-Message-State: AOJu0YwJEJgTRfIBDImHM59iAVOIyPB+dMk2yYq1Fjkdpw14l9m+phwN
	jtlvIRr+JeyEajnWm+uU9P7A//FSJSRSkA8PPGG67P6gO4EwqiPv8p/DMKI8Xgw=
X-Gm-Gg: ASbGncvLF7sG94/9ugURmTwwnd3gD2SCU2pI97ng6Jfk7NvRK48xqJoTTMimzMmZzEk
	WgvMRXGP+IxisP3T/hLOtDS7NaI1pG0C3ZfWuPJ9Xi5xulHlmxG3V4VBNFXP3TDdWw/fk3N9Wmg
	5/YOk08LnYyo1NNZcbgjItCWcH0lNcfhsIPeQycXU2LlBzDW4IN/u/ae5m0Et9HBT5umxph0Qb2
	extFAya38PZE14v5mBhK3S0s8g7qKic5eeURYn1o9hesC/dn2gYuAuP9AdhTbxwI54Z4WpWCa94
	qN/I/2KQEWL0sKpM2P2V1/ROYvghafmxgO59
X-Google-Smtp-Source: AGHT+IGVpxl0k9hRIyiBC+nX9q01hRzKPekN79eTtXLIY4DaSMy9S0MrmJK/hCW8fezYBdyI4HazOA==
X-Received: by 2002:a05:6512:3b0b:b0:540:2a92:7dac with SMTP id 2adb3069b0e04-54229532e69mr12026183e87.17.1735562823897;
        Mon, 30 Dec 2024 04:47:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f5f1asm3126558e87.35.2024.12.30.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 04:47:02 -0800 (PST)
Date: Mon, 30 Dec 2024 14:47:00 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 09/17] drm/bridge: analogix_dp: Add support for phy
 configuration.
Message-ID: <hfqoxolgga3t4fmdeo5dmqvqiiptraqwmzwdpfhzmmw2cnsail@yamn7ms2tp6x>
References: <20241226063313.3267515-1-damon.ding@rock-chips.com>
 <20241226063313.3267515-10-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226063313.3267515-10-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_044705_921426_501FE288 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Thu, Dec 26, 2024 at 02:33:05PM +0800, Damon Ding wrote:
> Add support to configurate link rate, lane count, voltage swing and
> pre-emphasis with phy_configure(). It is helpful in application scenarios
> where analogix controller is mixed with the phy of other vendors.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

