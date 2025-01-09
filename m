Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D584DE77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jSa8UzMvzUoVXnoAHj07r7u9fcSmFdWl/qcJ+OAdKWE=; b=sLj3HdcmR8M83Pl7aHrOqV1/5a
	aJfdGzq+G+PjPLoOM8HBsR4hl6CWpKD3h65IYGZpTyLw4FLISSoR27wA8OYOQrvBIJcYfzpUXg4ay
	DScBfkDNEUDifPdu/MwFFeZUu5LDuAst/odeiY71Eb0j83YcvTPT9L/dWbTt4MNncnuoobIKzulDz
	XAH9AXJi9cVvpV+qcZEqK7lMoArNusXl6gaeh6SJ1zvEWkmAl5IrwrdD9pFy0hMq5FyHk2oxO6n69
	AshkCWWpKfXsyr1zRnRNhqxYdvh5TI/M5ZhFvScr/7O1Yk56IZlx4rG5ZsIOawZ7VhylArdbZNWzx
	GyidzBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrt0-0000000BtC5-2eYL;
	Thu, 09 Jan 2025 12:43:42 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVrrb-0000000Bsvj-2Tat
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 12:42:17 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ffd6af012eso9473641fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 04:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736426533; x=1737031333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jSa8UzMvzUoVXnoAHj07r7u9fcSmFdWl/qcJ+OAdKWE=;
        b=buNDKL3IDNKNH/4B/iyLOWsBxka8cpsbemBJFsw3tUbo7T7UiJ0fHWHNWesZGmdmDK
         F17/oz6i7maSHYdSL7ST0G5OjDwHryWWYHi3foPtiAbTVTk6wWQRP6Nfnejng1koHViA
         wOomkIgl25LKLZAENP7QVO69FF+EnA8cn0Wh4artf1xh6oEIAw3IEtvB0K4RODJigz66
         UseKNXWTHi2nJSioGkCXy+YLFv9gvwk0a4DLU6PONmAuJgEtG0iHczSFtK4KDbuuQRmg
         OoVVWOiri4/uScQ34k5CnMx//DVKdEfa+b6CKFvdMudfqnc+HGt+cKAnSvT/IGtlUF7Z
         lB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736426533; x=1737031333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSa8UzMvzUoVXnoAHj07r7u9fcSmFdWl/qcJ+OAdKWE=;
        b=Ba4VYWPseNA3Whb9csn38EzA/bSqop5KflxGFojPMFBWpc4sS82jJbXDPNBeahD/1t
         n/ssTnysS5pNfNkv8lgbyWBNDtupdPbyuK2v2Gz89ntFRhQ0+DuZT/bdD9TazxA1sxWg
         hajpfERn0J14qnwlwb0p7qbav37EkYpGaJxBtZi2H44Y08gnTKqNuYpGnoGBLbn+lG2o
         dfbFJUSrTn8CY3sowf+6rVNqPJ8kMQcRWZ04EGEDLBjlTwip195dv87s7t8tWET6eVWo
         YYRfFmYzNOHSiOQY/Jt3apUAYoirAvZ/0g7LcDwoYf3YA63keL92A/kdL2HWpbjy75zT
         /IsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCyqopHEgCODCd+Jd2a9WcWxvfKLE2mdF1+mbP3MJj7rBp9ZC7PsZaHdQsLBKoRwjGX5MaryrxeElcxVAo8mgo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa/SuKgtvNz06dZtw9v3j9UQOT6olZClUG0eGKUDN42dkZDVVV
	POYTW/87MpAzehk1qnWkY3MWLkFEM2U5HHeRqUyyoeVNDwUiZ+DzNDZV9bcv0EI=
X-Gm-Gg: ASbGncv7Tx8PNb0y3woEXVtMyaU5t4cueN+79k3ve2Nhy80LIN1N6LOXRrEwH2Solgr
	BO6b3JhbCyKHVWWj0VBopvxXA/1LZrmDGJ5CM0aWFGbeFG9AtA6WZbdxLfS5FbdXLS6fKJ2Yseh
	qy/pK0IqHt4nKAYxVGO6YriNNk4rsuq9Dd3qepdFnho3ZWNytKjevL3rfFVmhS3t7sJs7ZvaZ/1
	fvKW0wStwJyZozts7n5IsgPz76p7GdfYa86Z55vIxGUjMIzzwfj1QpVn6HTesR/xvTDWt2IcgJV
	haWEDfzTAMOA4tsFBG3IOPRdJUJN0gVJWC1K
X-Google-Smtp-Source: AGHT+IE1P1UCOivFTvYWWTS/q4LjMLHD5zB9iByIGL1otwhnL6V5dvTRWi82T/q6jI3Oss5lknekTg==
X-Received: by 2002:a05:651c:50a:b0:302:1fce:392e with SMTP id 38308e7fff4ca-305f45e7f69mr24518741fa.25.1736426533394;
        Thu, 09 Jan 2025 04:42:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428becb309sm185975e87.253.2025.01.09.04.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:42:12 -0800 (PST)
Date: Thu, 9 Jan 2025 14:42:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
	sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com, l.stach@pengutronix.de, 
	andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
	kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 10/20] drm/bridge: analogix_dp: support to get
 &analogix_dp_device.plat_data and &analogix_dp_device.aux
Message-ID: <woyxxwpwuicp7enqkwbquuwpknftc4exkui3wlmkvjcohb3yhj@iv3adwzot534>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-11-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109032725.1102465-11-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_044215_631447_C282CD4B 
X-CRM114-Status: GOOD (  12.08  )
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

On Thu, Jan 09, 2025 at 11:27:15AM +0800, Damon Ding wrote:
> Add two new functions: one to find &analogix_dp_device.plat_data via
> &drm_dp_aux, and the other to get &analogix_dp_device.aux. Both of them
> serve for the function of getting panel from DP AUX bus, which is why
> they are included in a single commit.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 14 ++++++++++++++
>  include/drm/bridge/analogix_dp.h                   |  4 ++++
>  2 files changed, 18 insertions(+)
> 

-- 
With best wishes
Dmitry

