Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16231D42BBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 18:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3TzAZ2wI/SsBv8e6rWIulIn9M+uufamHvYe7/o5Pmqo=; b=khHlrwndJeEonfVIiFPyjibBzN
	WEGEok75pYhwsmkyt+ifDTPGWg4Yb1IKKDjuKjCOHigVCDOzf7m2K/jlMmmioo6n6I9eGuNd7TY7Y
	YaPv8LPJHYKuC7rrqjQHSiszn3Ym6474XDoOHpzBSAyxSrWcP9EQOVGTvcwbQGVenMseFx5hDfecL
	gOmtF1u5uvyE366ZL5bkaLeOo5eCds/GlZAywECnXAg0du4HPPQ8hGGLzMK60fTOo8hXXs6PB7gHc
	k68ris4H21xJuFeXFTiKecEThPn0uHlaTqmdLaYf0tfPwvX/I8LFISO+BdhWCSQXPLuysQvhZn7N2
	ceLahqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAvF9-00000004U1d-3shM;
	Tue, 12 Nov 2024 18:04:00 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuJO-00000004HQi-0JgN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:04:19 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c767a9c50so58280275ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 09:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731431057; x=1732035857; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TzAZ2wI/SsBv8e6rWIulIn9M+uufamHvYe7/o5Pmqo=;
        b=XuZpSrivYIf9nyjdVFuRmS5gsWhCa59/XCJvhVb0F4/hdHpAJI9Xokgz8zyYRfAU7J
         mUhnPrmVVJ+kLogh9xq4akz2mubImrwEoaquoIgJMCFssOVQeMHKeXm0jyoUH+u9dxKC
         w2nxTNu0uMv5IZ7NZnggcTr1p/8iu0k1NNtamBcHchc5X2iukQbcuOJRibX28MNTZlfg
         gKjSOHLG+c92YdnldB+JJEfRaUdpPdfu3NLDChnmdDYJ3Nc8EyuzxT3dY17UfeXpRoR2
         p8g3YJratL3CSLAQHApKgldpXjLFzaklcZvqHuAngRl0N3cWtrPl09xMB6Ey/+e2EL8c
         6Exg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731431057; x=1732035857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TzAZ2wI/SsBv8e6rWIulIn9M+uufamHvYe7/o5Pmqo=;
        b=EoWBfp2SuDVy2VeYQb7PDjtWelTvF/lCOB2enc8DGL+JU+Ys5p1BmtTwa5rbaE7Vw9
         vcR7E47Uenscni5Hef8QWOkkyrHN6hLifUrgtnQ04ffPKtsYEwjsDgBwh8i9gN2bBPFG
         VBEXnsrUxEB+00BdUD4xrrtcFyoAP0dKNKfVWajM+iwzeVVnyVy5pR+lCdIDe38bj8vX
         uLhJ8Zpm/UBrmUTe5gtm9PqmDLOSM4RsClM8an+OPQ+ubHBoRRexGhlCzLRKufqlMQSY
         2EQMT4uGw/CGiim1JJ+eeN4xNKXWcXtmE17+qyZYX3xTl9Acl4aDNqakW57yFFsnXvC8
         L9kQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0U0WgfqjdSsN8TKLd5tMuEfAZc93q+UuMZMGgCgTeG8BotX2ohEXc/8JSI5cpuMZzxf4Q/5/VCn3T43VgJJQD@lists.infradead.org
X-Gm-Message-State: AOJu0YxOJ5B8wN2PnVxQj08GH/MB9Ckksc13c2r9Wnk6W0z0JmdIZeCd
	trOViB4+OgwmiBQ7TvGa/VL4AFlp1/HRLLsrR7yITNZeWBK1CuMN
X-Google-Smtp-Source: AGHT+IHRVCkPv69Giv9Ck6e8LALo+6Vd8jA6G0f2rPbTFybc2LxVw7NcogCrIEnD2UMIGigrnmpwQg==
X-Received: by 2002:a17:902:c405:b0:205:4721:19c with SMTP id d9443c01a7336-21183d55b03mr238707535ad.37.1731431056592;
        Tue, 12 Nov 2024 09:04:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e45839sm95869765ad.143.2024.11.12.09.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:04:15 -0800 (PST)
Date: Tue, 12 Nov 2024 09:04:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 1/3] hwmon: tmp108: Add helper function
 tmp108_common_probe() to prepare I3C support
Message-ID: <ec1a3a2c-e1b3-481a-aac6-e0826c570ce6@roeck-us.net>
References: <20241112-p3t1085-v4-0-a1334314b1e6@nxp.com>
 <20241112-p3t1085-v4-1-a1334314b1e6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-p3t1085-v4-1-a1334314b1e6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_090418_152191_4165FE51 
X-CRM114-Status: GOOD (  10.35  )
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

On Tue, Nov 12, 2024 at 11:51:59AM -0500, Frank Li wrote:
> Add help function tmp108_common_probe() to pave road to support i3c for
> P3T1085(NXP) chip.
> 
> Use dev_err_probe() to simple code.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter

