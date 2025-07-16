Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134B2C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 12:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsXEE1hISIb4cJAFw3dYr+DwstAQXXeJCNfdlxzLq1c=; b=zx9XPsBHqYvzctc4b/hbKMkJYg
	saXheHXZJkDcLcJ+FIIK4ZCTy8znP2VTGiK0WuwX08V02GuEIxIN0VQxFlTvKJywwGAda9cZnZ/Xw
	ngf5XzwioXCy2tb6uWjXWMW2ZRHQqfulJ+m/N6EGGMcHGFkUZTnc4INBzEtmVhzR/lbY89zOy9yrW
	bEyJ4ekCeLPgKKfJy8Ukm9sr1q+7+X5nrc4oEQ6ZNA1TZxKdoT8KQXrfk6uyXjITCjVJgTDUYVgO1
	olwI1Zf0PuM30KZmDaw67/nVdIOjNF5Rcx1rtAhr57BUGI8/+DDKnKNZhYvgjqXhXv1SdnoboVxs8
	v16rR2ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0uL-00000007d4J-2Qmc;
	Wed, 16 Jul 2025 12:06:45 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc0ru-00000007crX-1j7r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 12:04:15 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so10186307a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752667452; x=1753272252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsXEE1hISIb4cJAFw3dYr+DwstAQXXeJCNfdlxzLq1c=;
        b=kjsPQIy9e/iMIgiutT6Wg8tjojAOnF8QPCtT2QImKF2KAvoqArR7hMNlMMXURS+1sl
         4X2C5ENd5x5uddBn4K3RI8gwKogEXcUVtljwMfVgG8o9WhpMUKacHcTtke/LJ2lg0QEr
         qr/RtXd2Mof24cMb9RiQN/h0CS/j8muBGmvcbbSIki93VkWssJRNNh9mWLCa50VGvXmQ
         66LAwpb8LGm1P/RMp+Tomkbk0mvGPln9QHslYu3hBuUvcNysNMNaGtqh68UFiUnqHGE2
         934Mh2qOpAz3z2kazNn3a9oNiyg2Uhcl4mrFLR6it16U5AnhRvnRA69xQNo4mMUfvKbN
         azXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752667452; x=1753272252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsXEE1hISIb4cJAFw3dYr+DwstAQXXeJCNfdlxzLq1c=;
        b=MFKiR81I4ac4ii/50OQoMqdwS7dHlefn2hZEwMY4X4KgfiqhB46aS2m/izXzVXJfBZ
         FQL4shUYnBKustDaGMkSbzw+zuMvL8+RkCTobM1GBcHqY5ER27JMvBHqBlXAFd7q7X74
         8qrxstNUoT38rn+QMPT+sLgfnhBxh3rpXmSDpXObHOKSRS0JGG0HsnZrQOZVOWWr/A2N
         tPGBoQGxTAMA+l/RoYqYBXEWR0Iif82NmXUk7VXIuZ5V+NbPNVkwyybrOyNJeuL+Ljbn
         rjxOlCEjft5XCkFmEReyq8aFeTyErU1k/xJ2SNbCUIZlaLZUUViKstv8fQSkRjscih0E
         kBXw==
X-Forwarded-Encrypted: i=1; AJvYcCXdT3ePXOU0xEZxAFiIYUHnZwah9JMgRF2UoyxVcd84H+U3hhgRW4m411sF5E1rS6stXClwRWSMLJDYdUiC2whe@lists.infradead.org
X-Gm-Message-State: AOJu0YzI9vaqNvQZKR6zxqa/JIoNfNrRRHPSZW2FSPOjz0A+Zpk2B9/g
	JXi6xdbmLwB0JSWE83xu0DqFT9mV03he5EDpuUk4f0NfAoRiKzi44FDj+VjTFtVW1n8=
X-Gm-Gg: ASbGncsdqiOEd+Cc7jAhjpWKFZsomXOuK1XBEo+nzTe2krQtYuULrCVjVan90h4a0eF
	wTcXH+HGYIE1LYzes3eki0AVQuRjHWEfd0IAfcoqc0Jm9g1J8W33T5BNKu15tKcBZwIjKq1se++
	3RpCKjPmHluRZsRyJt8/4at2UqqnObvn9o1fDQ2fkMW8uEuytgeX+QXDktFxWQIkMd2FmPHIhGC
	cClESUUwUtBF4w/d78vo11EIA7AXORNiPR8a+CHNUCZsfYOFI/1E8cEQLChCfgsu2w0RPMtqQu0
	o7OBWocU2eG7qPabB5Jj3tDvULWUVFs2JVBvooS8rRr/9/+epK44CdmS4pJ4oh/0AdwNy2psuvv
	8TQ/CgIH3wWbg4RYDLe/fppDCKng2ew==
X-Google-Smtp-Source: AGHT+IEhSGvwKZCfWmTvLUG6dGYIJWTd4OdkmaI9VTlT7Ykv1sEpL5pIQSQFmLdV3hms4bc49wFnVQ==
X-Received: by 2002:a05:6402:348a:b0:606:df70:7aa2 with SMTP id 4fb4d7f45d1cf-61285bf41c5mr2186091a12.31.1752667451997;
        Wed, 16 Jul 2025 05:04:11 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976d9f7sm8622193a12.54.2025.07.16.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:04:11 -0700 (PDT)
Date: Wed, 16 Jul 2025 15:04:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] clk: imx95-blk-ctl: Save platform data in
 imx95_blk_ctl structure
Message-ID: <aHeVOYUhLu8uIhFe@linaro.org>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_050414_471262_DC15C7ED 
X-CRM114-Status: UNSURE (   9.17  )
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

On 25-07-16 11:15:05, Laurentiu Palcu wrote:
> Currently, besides probe(), the platform data is read in both suspend()
> and resume(). Let's avoid this by making pdata a member of imx95_blk_ctl
> structure.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

