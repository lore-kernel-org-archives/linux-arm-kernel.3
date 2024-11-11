Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01367D12D6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 03:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cyBoacIe/beqOmXqqDNGWcJXEOI0SPSE7QTB0nEVwZQ=; b=wuaGYdsdvI/L9UAQA2oOZvRDaE
	OeNwxDMIIwwpZoCceCWCIM2+Cz39bm3GETcCFMhO9hC5VQmO1Ffl/HYFCT0mR3WYRIXOhoKCe/KDV
	DdLBpwA7lbBEM8HgHwViRBXkMYjoT0OwPmxv6BBiBvRqvYYAzQ2PvHAWoubKhkI4kC/tbuq8vpZTf
	7tRxrNW4bpJjFrrahvppC0OiYQzVUBrd+y/71tdUCERpvlRTYM1TpkBef4jPuGNGHAekb0V6Xo1N3
	yfKmTpvt98AtF+qLcrMXt823SDGKb9p6e9nqZNX2SJRfdpsir4kxZDHbkhnAJ2oJusywdTAEOEK7b
	ipvVv3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tALSY-0000000GFzn-3uvu;
	Mon, 11 Nov 2024 03:51:26 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tALQ5-0000000GFjh-0nmt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 03:48:55 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2e2e2d09decso3807174a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 10 Nov 2024 19:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731296931; x=1731901731; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cyBoacIe/beqOmXqqDNGWcJXEOI0SPSE7QTB0nEVwZQ=;
        b=LdCHfxI8w3aEIdnP2+2FJBgjEhr9p/2SjjfCcWJXMROorDuPgiVu170BrDr4A6SEFI
         llzGMapLg4knFcOSikm1ccKaw98w3qgFgVyFzSuR67bnRu/w/kvXRocd5Nn/cw0ceW2Y
         fng5u/OkLAf7YJM2Zdm5fsItDRk6MB01IGJNl1RNF0POosBmjUUmNrhNrqB2d9aRDN8N
         VbjjycgP2e5E1hD1mSpuXWhXVD2SWoX1EAcaoIWqyJt7lTEKofHu94a5xSbARsY/Z9rK
         x6F8r0L4yuzmBBm0/AXo9HJJl7UTKxxfk6+KKqGWPzdRzGd0b+gcc/WS/o9GqjEe4zMl
         TUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731296931; x=1731901731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyBoacIe/beqOmXqqDNGWcJXEOI0SPSE7QTB0nEVwZQ=;
        b=CLqq022cneZoUPLrqUSA6PAMx67bZ36I2iLUdD/1UfFnXeB5lywP510FGnqqhfowEQ
         w2BC/1qPbKzrarpLs6xMM6wWcrsCY5WXbdXWbH4BEHxSDXaVsbUEeELEQk0C6ssenSJT
         V/dwAwqdIoH6/qhniV0rcsBdKNPc4skERr1mWPnhF6ZnUXgzmhBDTDvLAp8TlH5n4ieT
         Bos17NbaFD16ClidJ/08F/odc7lBazSrVL0IZPWw9Ytc69qqkv5PLzet+zUU0zavCbTs
         X6wifMsHM2iwgwsCEEk+tyf5T1fxs1LIIv7M+a6TQfYZG+R5TgNOzsQ4LVNxtlYBpexx
         7gbg==
X-Forwarded-Encrypted: i=1; AJvYcCUfrhw66gjungU0BTA/59+NjJZu9OTM4XP8tEyh1HgoVSUCLYnmRp2O4OAvtQ/qJhF9Rd+Tn7JDEl3OkAtEJbEA@lists.infradead.org
X-Gm-Message-State: AOJu0YyRffkC76logpTfbT1r2Tm4U4oveDuDOeX4rLhpm2TrwfoaojHu
	dS02NSgBuSzlcdjJGBeIDhtQ9I7VVqjbmoe86M2fRrb2DsF7otWudqlGJYG3CvI=
X-Google-Smtp-Source: AGHT+IGYrXj9oPlPSmY8T67CTPIqdUFk8LRkxz3VZqL+QyxxAM/tx5DxSPFaPEc+Y36IKUhOf2R9rw==
X-Received: by 2002:a17:90b:39c5:b0:2d8:b043:9414 with SMTP id 98e67ed59e1d1-2e9b1f8e54emr14638700a91.18.1731296931268;
        Sun, 10 Nov 2024 19:48:51 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5fd180fsm7451733a91.33.2024.11.10.19.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 19:48:50 -0800 (PST)
Date: Mon, 11 Nov 2024 09:18:48 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, rafael@kernel.org,
	morten.rasmussen@arm.com, dietmar.eggemann@arm.com,
	lukasz.luba@arm.com, pierre.gondois@arm.com,
	vincent.guittot@linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_mdtipton@quicinc.com, linux-arm-msm@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH V7 1/2] cpufreq: scmi: Fix cleanup path when boost
 enablement fails
Message-ID: <20241111034848.wyryvgeqvu33jilm@vireshk-i7>
References: <20241031132745.3765612-1-quic_sibis@quicinc.com>
 <20241031132745.3765612-2-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031132745.3765612-2-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_194853_274667_4CBCE873 
X-CRM114-Status: GOOD (  10.29  )
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

On 31-10-24, 18:57, Sibi Sankar wrote:
> Include free_cpufreq_table in the cleanup path when boost enablement fails.
> 
> cc: stable@vger.kernel.org
> Fixes: a8e949d41c72 ("cpufreq: scmi: Enable boost support")
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
>  drivers/cpufreq/scmi-cpufreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

