Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5DBE77184
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 02:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWBTHFNbhUAO2tJHYtLJkSARvPMYrKVes0xn2BSQkPc=; b=NSKTd851DI6TKXFgT7+Wtk3A6d
	WM+3xeazZftzfaUUc5XiwxvH52Tx1GQv4FHpgYSp9ZH4PXl0B6TiPnjeRgC+dH5KQKyJOg/JRMaR5
	lTEsF8WzFdHqlkS1CINotShJRJNEUwoqteu3Ub+duGjVXSBBC0eT1/kA7dycK21rXM88D87PD0laC
	82D9KU8Esm3n6X7GuJj+y09NqkpE+SmCRrQbjtUBPKHSm0PYIK30D3Wbv6QbVUo9k2ofSpniCUVEG
	Xvznb0yqdgIPt/uIiP/XHZlLojcVHj0puB/I3m/0YbYEPKMWBIWyEyfjBnvYq1ak/8vHpquR7p9gy
	25N9Ldgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOSLX-00000003gui-0WSD;
	Fri, 20 Dec 2024 02:02:31 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOSKM-00000003gh9-3xSD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 02:01:20 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-303489e8775so15169951fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 18:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734660077; x=1735264877; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EWBTHFNbhUAO2tJHYtLJkSARvPMYrKVes0xn2BSQkPc=;
        b=v/QZOvTEeOyhX7cHWi6imOhuCp0J3z1C15iB/zsEEOu3UokQq3mSCx4Xc7M5HYe7Q3
         T5RYjes88uaanC+I+VTMwL7t2AZYWTUGi++gku/8CBpb0MQkx45oP129nAo2o84kys9q
         f3qh2C8jV3/4w7cr77D4wjE3lPbiLmmoyXLw+JLAJLDUF/WiWMDIGEEOJlI7xcP45oW+
         1Akq7+0KwperdbDZJTUR7VqyJ1AtHPNsn4rKH8GU31EY6nUVdYxrJvvVCzemJYkFuTP/
         +SJ1ARBmRZAv2eNmMjumJQuf1uLlphkX2bNXtTPz3jZYe2AmYwr07h/Z4OLJAqHUFIeh
         QJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734660077; x=1735264877;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWBTHFNbhUAO2tJHYtLJkSARvPMYrKVes0xn2BSQkPc=;
        b=hOL/fl9/Er2psKGrNY3F+ynS2fOg+2SF4p6PXdeTSUwye9bogYeCbBH8juuMUFfQBo
         ADZebY6o4Aub1Ua/8Ad+qdvGi0pg8NsrN/kwmAZpIWVHkDsN692+cm1kXVTZLEZIplif
         opzPNqOwVtPmLm0FmKAZNDsnyLsVMpoU528aT3NUPUVXrRYxgKmirCnbEi9WFfN4LZvt
         d+FCi8+tXWesEzZF8W4NjCMckygHjc88Z2TSrwyKcVS9ahGHLu+UH+GaO39ugCiMnFmJ
         Edwtesw/LeHVA73PiVDQXVYjJrtiRsr6T8xqaApNcUBluFKprPQ61Ld2oi049wQhLNqt
         09Og==
X-Forwarded-Encrypted: i=1; AJvYcCVzohg6zTLvgN0wqEimjJhPNSHAByAYMmY8Ks++h7vOtnpJUITyKUEj81crw2eXfzLQfBeIH3Q5GZZFvaUEWYn1@lists.infradead.org
X-Gm-Message-State: AOJu0YwRSZCyY2HdoMHy8nTHw3jcWdX24PVxAo/RssgfA2Dt0nN7L2EP
	Y2GNN3EHa7wmIvPuip4L5LxftW2stt9WPxcWaDjK2VdQHxEXFpz0sd5+wEYn8cM=
X-Gm-Gg: ASbGncvR5LvBE42S2mETS2P1oz6ip+YdJxFWWvDhpba2qsKXTUuuwhulBNgrRPsObbu
	eF5BF4E1OGKBXCfiyfRmucKBzOi8V3SSUoMAxslkeIlLYzUGnlXd6mjea0CyheEcpTDAeOZ65qU
	qNBkfPfmwSqgs3CxL4M+6gGTK1/ou7HWvKkysRbZT4AphDwv6uRzeE+ad64h+9QBxHIXs/DqqeW
	Z3+EB34V1X8rmSGq0GqK4zlPljWtcy385roKz5ol2lQUF2pRxfITL1cuJj8jNbaQriiDUi+AXp+
	ZjtUiiTy3aO+ywZy3b7iHLUhgWzwI6pZKcR3
X-Google-Smtp-Source: AGHT+IHhyKDZ3R905U4863Iiit2Hr7nBV4qFueikwh/HiT57AnESraqkbGPykNmkeBs/b1aNdwU6wQ==
X-Received: by 2002:a05:6512:118e:b0:540:22e0:1f80 with SMTP id 2adb3069b0e04-54229530295mr201261e87.20.1734660077002;
        Thu, 19 Dec 2024 18:01:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223600724sm344911e87.90.2024.12.19.18.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 18:01:16 -0800 (PST)
Date: Fri, 20 Dec 2024 04:01:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 04/15] phy: phy-rockchip-samsung-hdptx: Rename some
 register names related to DP
Message-ID: <pb5ds6pyugndyfttqeyy2czumaltagbuns5zfclvqpwcp5gdez@tfsgukr6irzh>
References: <20241219080604.1423600-1-damon.ding@rock-chips.com>
 <20241219080604.1423600-5-damon.ding@rock-chips.com>
 <rkdp44csph6stq2e7emhgjziiwypcas7uqsvcdo7i6ypvg64uz@gnqikl5fzxqd>
 <20d95d18-ddbc-423e-ab15-d246dc605527@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20d95d18-ddbc-423e-ab15-d246dc605527@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_180118_975821_4EE4D60B 
X-CRM114-Status: GOOD (  21.22  )
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

On Fri, Dec 20, 2024 at 09:46:24AM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 2024/12/20 8:22, Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 04:05:53PM +0800, Damon Ding wrote:
> > > The modifications of DP register names are as follows:
> > > - Add the '_MASK' suffix to some registers to ensure consistency.
> > > - Complete the names of some register to their full names.
> > > - Swap the definitions of LCPLL_REF and ROPLL_REF.
> > 
> > Three unrelated changes, ideally means three commits (I won't insist on
> > that though). Also please mention that LCPLL_REF and ROPLL_REF were not
> > used by the existing driver, so it's not a bug and there is no need to
> > backport it.
> > 
> 
> Indeed, it would be better to split this patch into three different commits.
> However, I still want to keep the fixes for LCPLL_REF and ROPLL_REF because,
> according to the datasheet, they are indeed incorrect. And I will describe
> the suggestions you mentioned in the commit message.

I meant that the issue with those defines doesn't affect existing code,
so there is no need for Fixes:, etc.


-- 
With best wishes
Dmitry

