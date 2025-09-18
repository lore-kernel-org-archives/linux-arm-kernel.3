Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B51BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 05:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XoyqBQApAmmnvu4zkoApx4U/8ormdVXAKsPBgbJPU3k=; b=Y/MkvR870qsgN2I9Ox8J8gBkhi
	bv1smZdp/lmtfqEBJzy7c5P0CylexWiXYCOIf7rr6xlGyfUqOntTvQ6niNBtgTkPLmQB3PLZQfUMz
	sloNIlc78t/wQno8LYDVEoajFoR/g/8FR0oE6iyBIv96O/cUDsuYb08UUZM/oc5lZ0CQzAKmLHxT5
	8i0DrtrbFR4aRbzltfCG75TrcXct/WnPeuyDZeb8s1zm/PjHMPwGwoD2cmdLSzDYlL89DwpsLSknX
	nvKI61LcDYW94M8ZLhvAeOSCo6r/tPgSbeORkeSgdl+faKTIDpbaI6o6RnZ5ZNvFuwUza8smmpNQn
	RNdcaeNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7Mj-0000000GKk5-3tjr;
	Thu, 18 Sep 2025 05:39:33 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz7Mh-0000000GKjC-1szb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 05:39:32 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32e6f3ed54dso431023a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 22:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758173970; x=1758778770; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XoyqBQApAmmnvu4zkoApx4U/8ormdVXAKsPBgbJPU3k=;
        b=dJJ1cWU6qucaCgXUaHDFxzEegfDnHBG6ls1QpY26nmHXqxaFI+/QNXEauSWDt/OENx
         /+yomex5BCjZ4MiTCuBOMJXXuqUUtPuYdSmbtFB0Q2bd/rYu/qTitmpWTp3D7gHrm5Wl
         88Pw/hYxAenB8jIXB0CsKRilpRuxCmCYgAaJc/FRflvCWyejfmxR4xHYPiovfkIRuKOc
         k45tZT865dM11zedTFKifhtt4Phh1RuNCzvdC2ngxMWDXR1WRCPKgwpdyb9GD2HwdbRq
         evRZ7kFMGGRAx6Fgrynxm3sK9OUoAqCrXRbxuRKtZvnc1HsoNzJswHeAQ8eM5Sau0UI0
         w/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758173970; x=1758778770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoyqBQApAmmnvu4zkoApx4U/8ormdVXAKsPBgbJPU3k=;
        b=l3kOeheaAJs7ZpfbtJJIvCtc62ISwAGGTPUllGVwDA/rBRiQHVc9AJLlYt3xSTFe4y
         lSCoJf2lkSmpLKcW6nVEvtpbjWvEwf3ksyjLgIVHy9uX8vkELYZZ1DCS2cEPpKQbkQ8C
         f57BE8aHhMjMZ/IkzLwQsbsiKXkhsy3ppkbFFLX4tEP0PXGiHLxTwkDHCxE+5BnjsLY5
         oZ5/WX+nXIKRNsZ6qcjmBI6SrGybQjRQzku4efO9w/ikMUshlwXjoZpufEoASq+zsz1i
         XA+aKNLu3nSj/QBg5Pq20Fvl3/hAAp8uEUKCCQJ+eMwXBcQWOdceTOlr9q8flQIEqfsI
         NA/w==
X-Forwarded-Encrypted: i=1; AJvYcCUdQVb758dZ+Y0PgkZ3lDg5x40oCbI0Nsr46BmItK9Y3iRYEMIP4O0HsCx3ppklxp49DTScy/UYIEIaf6YAykwR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7fo4Kqw22DqRYMuw6jCl3Yem9ZrTm2NrNFcdmTzeGKUj6Q1Im
	uKwjsVJAGOqKJ7N9206xXRjygL0BB7HQmag4ndzNciaNmhVFxzoknnux
X-Gm-Gg: ASbGnctxOvFyRqyMyad960TeFyVftwm2oud8u9CZAeUD0nQGxx0hEg3K8Pge2KscU9v
	BWSdO6O4GaqU2kYlVtOu8FYKt1ZgAyh0AJ22jSluUdjYMxQyLmv3CKFBlEMOVQmiSO57uST/UWF
	q2yAg4O9uoT6K5dzjAXx6ntZ6XimykMgFNRwQ7pnGDvFe5SFBPbmtdAOJo48LL7UzAzTWYZNccY
	kkMVFEg7ZfQ0VKh822D+b7BeUh3RP/75p2ZyDmDlJY54I4pyKahOBSJfARQRibUS0oHU/VStMl8
	nxl0hhAyJ+Rh8yi/AzPNCheWr6ZvLuUj8B0zZEMhzYSYkX8rxn7vT8oJaSLKVorArmhrvN6P4jl
	8GfSNUxoKRVTOPHgqx2KGtDOtWD00cNrSdGDGY9nBRg==
X-Google-Smtp-Source: AGHT+IGxd0JzuVVJrw68h5tXFHmcZpcwVF2x8DkVRvbM3jhAsZwEYZxEhWmJuR/xbYRB7Jc2BkkC4w==
X-Received: by 2002:a17:90b:3b49:b0:32b:8b8d:c2c6 with SMTP id 98e67ed59e1d1-32ee3f008ddmr5384286a91.14.1758173970420;
        Wed, 17 Sep 2025 22:39:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:194b:8358:5c91:3d3d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfec3db38sm1130199b3a.73.2025.09.17.22.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 22:39:29 -0700 (PDT)
Date: Wed, 17 Sep 2025 22:39:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Frank Li <Frank.Li@nxp.com>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/6] Input: imx6ul_tsc - fix typo in register name
Message-ID: <z2kbkmqnvux2ys2mdghfbdwts5je4zkmmk3ctjaisno3kafqoh@xynqe4exjqzm>
References: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
 <20250917080534.1772202-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917080534.1772202-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_223931_485715_3BADE041 
X-CRM114-Status: UNSURE (   9.53  )
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

On Wed, Sep 17, 2025 at 10:05:06AM +0200, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
> 
> Replace 'SETING' with 'SETTING'.
> 
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 

Applied, thank you.

-- 
Dmitry

