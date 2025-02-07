Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA96CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bQ7UzcBILiok8yPsKwu7aqylXDYRvrv0QMeB8LCUgk=; b=vUDMCVsUePTtHC5QFNFTDhGw8k
	+U3htOeGH/ua9/xA0i/xnFSokBtmngIoThI5LicWB6/twcLx+9ZqIq04DyrGA5FSM717I+nuXGZxV
	n1w0hx7/LI0k5TGzrEUddjakRPY1LMw9fQxJK8g4l1PuPmMt3x1akKCkYOOzDTZOqKZEEQXsGflPh
	0HQ3InsufJaebPlFcFfdmiD23y5wLcj2HsbZCQG5qAq3q7yE7/rMmLSKoQoWgniB3obJ5ULhmBw6B
	nP73/lGKlKzdiUHCid+Xk+tJMD5E5xmNUzn5HaSFwTv0G9YY9368jay4lNtrT+D+ntyUKITXjCWoH
	uiobdADw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEWS-000000088Nl-0aSW;
	Fri, 07 Feb 2025 02:55:16 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgEUs-000000088BE-1LS2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:53:39 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-54025432becso1623913e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738896817; x=1739501617; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4bQ7UzcBILiok8yPsKwu7aqylXDYRvrv0QMeB8LCUgk=;
        b=kbG3L4QaKLgIfE+QR9j0yGn+198kF5skZzrw9n+L73nR1OVj8HIzCQYuazhxU738vU
         V2y0LP/rerW7x9vVXwNXVDr5ElNZGLdw2K4jmxnZ9QKuhMLRmJ1pmKBzVbAjnkWW0CrS
         vb2NAsHNFCERSfy6eCNELYRXMlwOqOquUlP7xkqND1Tg5d+1tK6wt2aBOsJjtAHOPO4k
         93sbQ/yzTpGoQuC1fcxbNYVCjC2JfX6nSkNjsUP5AjCrr0DZfE2H2XWg7WoEqc3vRR0j
         leMkoP8gJdno5k9o6MPDObwcwY8OZqKppNq8tr3BqZVH6RTcxEhZLoErvoXcK4xvihxe
         L4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896817; x=1739501617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4bQ7UzcBILiok8yPsKwu7aqylXDYRvrv0QMeB8LCUgk=;
        b=N+uudI/41E9Sd62ylmIz8QR8T5LMn4OYJCWqM/l7f2/lamhQIe1zs0THOkOuoai8Pi
         TMpf+HMajCEKjWoiFTIX9BUtsA4n1DpJAfeKXc/FclnafSJOkfq+qBYtgzsv0LedWybZ
         uR4hFzJevoMQkalnSgCqxnh1VWt/F45xVdU7eEa1L4S4QApJRPnBetMZ2VLm1fg/BbwR
         0Q2Knr5dbiM4IvDuibyCLQmAjlPigVkFREGX2dSA4aUQWdSU4jBD4UScyZcjvDBlfXQk
         hDPLhV/UVQyTFFrCa+Sk5jhUCFR0KbOMFrerG+ZzFrxupaDkbP0FKsSpkwtOLRYxY7yh
         8C5w==
X-Forwarded-Encrypted: i=1; AJvYcCVjO6UdXOJacQ/DXOBwc+F7gD3RBL71V9loQFGU1DlnxV/xpAureiYPgyqlXP7LklC1oFl8v9gJVT5U5Db4DrD+@lists.infradead.org
X-Gm-Message-State: AOJu0YzjiQ8ARTBe+d7Il90RVCmMNHBNNO0kyek/7nblSS2zTIU/QUWG
	UiBZ/WeEpO3d2Fwd/B2QaqPIelHG/fYgMokFXj+NBsFK0Q9IUk5EKXqN5FmHxUA=
X-Gm-Gg: ASbGncuTktN6nxjmCoUd2uOurYaE+Mcou2nEX7YDkx7NMENdB7fbFt4KaEZvmjOsj5I
	DihqO6TDdikbmt41e43LGth1vOm5cSGTmhgK0oP85YWGcmYtLj8OeOUnn5bY5xhRUWfQcfgCsqi
	3cemIB7zF5to09AiMzgXCV+HyfICmxYHskm1GpZOw97ndapHXKLWhzH4qCV1UbfaMhaLi+Q5DpI
	HGYWCyQAzDN8OLlQDD6C/dsG6GqwSb7qdt/1saCKEQ00wix1XYBjZpEc2Ci3yaGTdMJiyz8RLtV
	RVh0RlNDZ6mMP+CtvD4rv3KsuREoADv6zt3PsNoLMt0potULWzjM4+07Agx8DpGoxKs+ukY=
X-Google-Smtp-Source: AGHT+IGImw4t66PXbBcvSoL+mAUZ3Fy9NEnPZ96ZWlrP0JGkhsvbwS8pOJeFaustkGSW8P8yeU5gjw==
X-Received: by 2002:a05:6512:3052:b0:542:21f5:b9cd with SMTP id 2adb3069b0e04-54414a9d1d0mr367128e87.17.1738896816663;
        Thu, 06 Feb 2025 18:53:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105558fbsm308903e87.76.2025.02.06.18.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:53:35 -0800 (PST)
Date: Fri, 7 Feb 2025 04:53:32 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
Message-ID: <5izgpfrkxrcbcbzr7w5lpm6tidwl4lj66tmnm6l6xmncu6t3uk@2mswjcmi34el>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_185338_363833_EDEE6194 
X-CRM114-Status: GOOD (  15.90  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 06, 2025 at 07:14:25PM +0100, Luca Ceresoli wrote:
> devm_drm_of_get_bridge(), which is based on graph links, is the recommended
> function to get a pointer to the following bridge.
> 
> This is valid even for panels, for which the recommended device tree
> description is via graph links and not (or not only) panel subnodes of a
> panel controller (e.g. "dsi@1234" controller node with a "panel@0"
> subnode).
> 
> However there are drivers supporting the panel subnode description in

I'd say, name them here (at least the one which we looked upon).

> addition to the graph links. For those drivers add a _by_node variant that
> takes the node of the target node.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 

-- 
With best wishes
Dmitry

