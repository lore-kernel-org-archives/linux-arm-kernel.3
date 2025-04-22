Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35368C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jd3xJuk6FST7n0S2TVkTNzsFUMjoZp3JZccjQ28WDhI=; b=RxJY11zVfxEA88PivKCIINgAGA
	B/fUPUJk4mSBzuRLEHXyG8sFnVIOx5XwspIwfljs1G/r2Ihw2skACiGRIx8LuKFuGiMgfMNDDSTEQ
	rA7GDdBYY4TP0uGO8umfOLGosXG4+lKKpgNL2uV74/f8fpNrcWykZjeeJFZX4DVb6ljtE2rDBeQBH
	JYADbL/NYb40vYxrJGZiuGcIsAapml1O7ZgR4uu8l7FnPkLpb6IC/fagX6LoHMtjAm37UShJFMCNt
	t0ncmf8EJoY1c3pf1CPKnhs0MNn8Aeovh1EwDdtBen9GD6nDyQvAgsFjzna+GODKlHKbAfOze1EBj
	+FjS80XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GNm-00000007svT-12F4;
	Tue, 22 Apr 2025 16:22:02 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EH4-00000007QZS-3i6i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 14:07:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso7098937a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 07:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745330817; x=1745935617; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jd3xJuk6FST7n0S2TVkTNzsFUMjoZp3JZccjQ28WDhI=;
        b=DFpfcN3TXj0833RVQo5ohlRjPtEKW2xFc2Qz0KRwuA5VYNRz25Hj2LFxfcLa95gNIC
         dqv/i2RVW764VGgey0X1BLccLF4GNiIEK2RAqtJOSsqrzMFsP5wBzcnAQRrz03MAXBjx
         UsbZy6nrzdvWHA2WNk2c5Rk0zW/ty+W52g15IJV9/COH5wYdzdcaWzi79S8azSQ/1zOe
         kKBrXIHv2FQa03jDTtO9YhklQosVPRxa4bdhfgK06S8HpwADavVhVidFGH5OcK8m9D6Y
         npeO0r1vBNR04pt3ZrEdvhmLa0SmhzVvvvBLtneilkZvvxCNn/oN93zAWpG7w2RFgZ2y
         zMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745330817; x=1745935617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jd3xJuk6FST7n0S2TVkTNzsFUMjoZp3JZccjQ28WDhI=;
        b=Vv4fPW6fhqXpgL73UpjcHiRn7QhtxEdJS38eehTMFAAjfz4R+gD8gndwyuaZ82J4a7
         sz3xPPfp3v+nA/wIXZEM3QfylzObhNK1l4IQ8y9bqazMVVPbwaqBNGo63yqu5pTtqwH8
         QdwaovqdbjzVBvNfnaNklUCjI85IY+xX/AKwy3LI6v5GJOe5lZops8h65sn0UQKw23C8
         CkZPLvmvdeewX2wgEiM9BVGR3r4bguL85MZ/2zcgnqpyv0VVnG0J/qpWMOlZ0TFObYDy
         hy2QQge6obsEior2oVoiPP4Zy2hp1ChOAzTsTyZsV+z4dG8ZcyNF6GF4fSeu+xIDVK6+
         WrjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxOoeG+8hO1CD7bFuJwSES+K1PvwuYzB7vELT1NxLhYicB8tPpGwEsBH9pknTbkdNDZ4eRtF+rO1EFuqV9p7Z9@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz8NshI5rfmShBLI6ZTP6knMbFCGaLBoTPwnlU2cfbh9IMLg1z
	SPA6MopHXXeyu/sWkYCYcpPaBngvkg1dh61HpilVix1e7YSIJZ7FtDL5VEOLPXw=
X-Gm-Gg: ASbGncvC1LIsc8j+G8ZtnvCGcuYsoSnPFl9fZrp6pl2AxOHdzvLxQ15g2FUdHZsE7WL
	vZVNppb7Ygb3gIAnjqiTGzLUUIsbg+y2WLsN0FpT8fbfpUO8h4YhKdQj9o5T+MvcYoUHVqqSb25
	ZbHzpEGV9XYO/R33KkNS8XKYR6MKC46jJ08BBPXNvnRUbOayhCK0n0f/5I2b9zMUxfLim9h9BFG
	zHX3PSff3XeDPKZHuPChWsrnCgBXsfBWDR7qQlJyiIkSgfaW0BOa4Kb/+kBtlwFdFVPIYkfHGyP
	i9qxyEXzZrO8VYHDt0srJD2ttClo6l67LdXPUA==
X-Google-Smtp-Source: AGHT+IE6qyTXes9SNmoJNFucgPGNq3S9gJF/Z5FLJA8q1EwlXstU/Kat+/34d9QRRlSBxR2b2iRPKQ==
X-Received: by 2002:a05:6402:13ce:b0:5e6:bba0:6778 with SMTP id 4fb4d7f45d1cf-5f6285ed3e0mr12811708a12.23.1745330816878;
        Tue, 22 Apr 2025 07:06:56 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f62583400csm5965159a12.59.2025.04.22.07.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:06:56 -0700 (PDT)
Date: Tue, 22 Apr 2025 17:06:54 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/11] pmdomain: core: Add the genpd->dev to the genpd
 provider bus
Message-ID: <aAeifr60sdT/AENz@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
 <20250417142513.312939-7-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417142513.312939-7-ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_070658_927330_F6E685A1 
X-CRM114-Status: GOOD (  11.19  )
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

On 25-04-17 16:25:04, Ulf Hansson wrote:
> To take the next step for a more common handling of the genpd providers,
> let's add the genpd->dev to the genpd provider bus when registering a genpd
> OF provider.
> 
> Beyond this, the corresponding genpd provider driver's ->probe(),
> ->remove() and ->sync_state() callbacks starts to be invoked. However,
> let's leave those callbacks as empty functions for now. Instead, subsequent
> changes will implement them.
> 
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

