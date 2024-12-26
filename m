Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9A1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 17:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZq8gTOhd/HrF2N/ypBV//FltCA9lQr1B5nofEk6FbE=; b=ecoMbXj+FyS9CpcJUizQhERl6O
	+S6j5Wl4Yk3wERKN0GrGZMTiicwHOeCpikmpzQRicOawbtMVHnKgIfIspwGHo650FrD6NX/y0OCzP
	xm/k4lrTvIuJ1kA3cRM4izURq3uFWjT9awWkomCxRXw8jBBpai7kaReOdepcJW8id5D1j9Ff/ndf8
	GfwvA5JKctbABRPg4hOFzWn5CjyOqscbhaapt4edSphgmdC4FZKiZOK2glMRZXuk8LiXvvpuq+b4X
	cUtB1sgNQw//r0V2IFO0TvUpWaYFU/4nVxylpXz43cw/0PKqJd5X0JSOEBy4rtjLM4i1TPsyKPnis
	ytVB0ApQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQrmB-0000000G9Xa-1Te2;
	Thu, 26 Dec 2024 17:35:59 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQriL-0000000G90Y-18mF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 17:32:02 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21661be2c2dso69266185ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Dec 2024 09:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735234321; x=1735839121; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fZq8gTOhd/HrF2N/ypBV//FltCA9lQr1B5nofEk6FbE=;
        b=xX2YhLR+ryZk1U/wJ3pSgeriV60bYAU0nHT0kI/G1ZE0E7hCfvvpBRG9yjOkiMRHjW
         XNCrSVz1x95m1RhPm6FA1xj679fgNS+eN3u+3Xo773z4pQf8LW8MHXu0ZiuMZkHH53eY
         B2g6wTE64xkXCXxsdxvHWwKfI0sWmDeCnt6NLl1ulvvkugGEalHxz5Uvv/9f2OTpE0ly
         UxK4FByxewn3rl59Z/iV8QXlsQLkuaRs7AST2tv0SSVmCBsJtoh11pFy0GHvHWeUYvIZ
         zuR8gRfDil5kIctVNohLxnvi2rxO+zjrYxQCcGqHt0ru2fLz4wdC1LbYcLEwZsCYKu3k
         IcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735234321; x=1735839121;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fZq8gTOhd/HrF2N/ypBV//FltCA9lQr1B5nofEk6FbE=;
        b=f8y8p+vpeYInZm4bAsCViaACO79/nRO8BUY8WTlxWHWE3FoiVInCt0GLeMcascNNqx
         5p76pZLYR6lZmPlHhpTT2EXWrzSIiMIk43HcZVwFLAt5zwxwn3P+GcTJmr0tRyP9sf3/
         cqE8SXLvH5wvIRHx5HBXRAP6NhMM/AonILeONniKGWHMARrFDuj6IuVAbcBP0ryV2h2Y
         tDuUdvDVob4fv70pe8QFmi15MI5Iv44cXYvxENQSikMDQmp20FlLFhqEiolRI9Q0gDwK
         Pycm9HB7CjaqDOBPDXTD3Vs+GeteiPG1g1TLmTd1N2a3lOi67TkbxQXKMzMsqDQQEM+r
         uUBw==
X-Forwarded-Encrypted: i=1; AJvYcCVBnkE8HSTZdMQxmVHeDKY6ogIHc/YDgFmyxlyjCAJdrMeSEk6cFAcYhcfonBXNUxnvIRUEUhlLDxT2KiTuTag2@lists.infradead.org
X-Gm-Message-State: AOJu0YyiR/ff8qKL80mYMDmpNrv81DvJAxoiQ2gtl4qBtEl0qceqcx9H
	uZmMC4g1FZV6QDU1qSsduYKGrQNeRqsZCHlqMrto4nb5/N+tbuxcS9jFbF+cRQ==
X-Gm-Gg: ASbGnct5x/axDgw/bUNxGjQetDYq1HPn0izY7IfBuEbyshdmt7qDOKH0NSUiiu+Coh0
	2f3gRP2AaADGn8fKv2h2zg3nsKoQ4JLWE8VPWWd3wZMA0sUSifzVwHLkzCeKOtE2H0AsFLIdmZT
	yYNMgCvBGEZn6T+2ZkFJNdUXlLXCMaO31mUzl1V4YSfyB38ZoIw3Sn5mse2qJ/ZwLTkLkyZJChs
	AmwGlT1A6Hx0DMVbkoRMywyiSKvCagPXv6fRxfb9o8MLMaxTsDITMDnhZ07sl6qHwBvJDCbLtBC
	voEQG77dBhGItgEOJTPsUdH/
X-Google-Smtp-Source: AGHT+IGMiawar/mU5KvWb2BzVuABUtr4oiv5toBR6JEErmfnPl/aBnhoZzQMhDzJD2wfGufTegEhmw==
X-Received: by 2002:a17:902:e802:b0:216:5e6b:e23 with SMTP id d9443c01a7336-219e6eb6305mr303933895ad.30.1735234320475;
        Thu, 26 Dec 2024 09:32:00 -0800 (PST)
Received: from google.com (123.65.230.35.bc.googleusercontent.com. [35.230.65.123])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e94dsm122897285ad.67.2024.12.26.09.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 09:32:00 -0800 (PST)
Date: Thu, 26 Dec 2024 09:31:57 -0800
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Sam Protsenko <semen.protsenko@linaro.org>,
	Roy Luo <royluo@google.com>, kernel-team@android.com,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 5/7] phy: exynos5-usbdrd: gs101: configure SS lanes
 based on orientation
Message-ID: <Z22TDXvD3AKdhr-S@google.com>
References: <20241206-gs101-phy-lanes-orientation-phy-v4-0-f5961268b149@linaro.org>
 <20241206-gs101-phy-lanes-orientation-phy-v4-5-f5961268b149@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241206-gs101-phy-lanes-orientation-phy-v4-5-f5961268b149@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_093201_313499_78F25DD6 
X-CRM114-Status: GOOD (  15.77  )
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

On 12/06/2024, André Draszik wrote:
> USB SS lanes need to be configured based on the connector orientation -
> at most two lanes will be in use for USB (and the remaining two for
> alternate modes like DP).
> 
> For the USB link to come up in SS, the lane configuration registers
> have to be programmed accordingly.
> 
> While we still need a way to be notified of the actual connector
> orientation and then reprogram the registers accordingly (at the moment
> the configuration happens just once during phy_init() and never again),
> we can prepare the code doing the configuration to take the orientation
> into account.
> 
> Do so.
> 
> Note: the mutex is needed to synchronize this with the upcoming
> connector orientation callback.
> 
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Tested-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

Verified on my Pixel 6 Pro.

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

<snip>

