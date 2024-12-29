Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2B3E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 04:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vkoVwSLPI1coIX/JA0W8yclcKQGo59oXgI/Yfces/4=; b=lMt77MHzvrZ+7aoC8ATcD1ulwC
	qbRB66KD4wbW//xM1TOdV+rZXGk9sNRK5cfEElGdyk/PKk6Lwa3CZ2LmBB0ODwKP7SZl3mIjLH7V5
	Pb+aY0WvmJ7gSrmeKOrpKkzi7Emx0zqXJVwgVpz5OVjs8neDL7UQzrpWuMYvxdweEUh4Pyna9C3ol
	X7srUNRq46FVGCVn9oMXFCgnWIv3L5J2p2bEnQaNXwYR3axm5friRKN7EYqdfLYQ34oMalclkO8x4
	EGU3qjkvQqRbn6o/NVEiqhl/rmtHa8uTLFu8xx41mqI9J72uHvxQFqNg1Bd+DfbxAM1nGZ/d9SA5/
	o5lTXcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRlHZ-00000002qlh-2M9x;
	Sun, 29 Dec 2024 04:52:05 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRlGO-00000002qeW-1GQy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 04:50:53 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so9045082e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Dec 2024 20:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735447850; x=1736052650; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vkoVwSLPI1coIX/JA0W8yclcKQGo59oXgI/Yfces/4=;
        b=YqKFnnBTzGtGJqQvjLUgFlVrDONWdOkwYDJB5D2nH9wASkSMEDU27G90K2JcWkiOPo
         CuUxZYHZnm2ghEx4H54P52BarHnKjY5wFbcqDl+CKDjIl4LqIA/vChn2FLGR/nd78PuS
         rDNNfwdLUWR1TJ+vMwUZDA8zzyNRaqDujMaqpiG8U7oAvLwHKywKztqOuG2pfKP5YMjB
         Gf2MTX00uDY6Ytz3IVd7tNbRotasZ6ML8TTW1zAXGrXo8dN3BILvXjJhCP6Rni1Mj26w
         xEidXW5HH0gu/SZN+i02qEuXRaHCrb0vJ/QYuRbDzI/B3iciWaPq41F0boIFEW3GfPh5
         TF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735447850; x=1736052650;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vkoVwSLPI1coIX/JA0W8yclcKQGo59oXgI/Yfces/4=;
        b=uCGMCQQLmTIcDcgyWJl+zi487jsOs+JeX5uWoJECsXe7y6EFqcgSm8KpLQAvGS4P5r
         fXBQGpW6rdasOsN+mr+4vpBcUUzafpSeT/oWcgbTDlfedQB5Ti9hWvD43Rs10niBzvCG
         1BwGi2RKYAOnh4tcMdatvBvSPcXapBDBsHGDMGm52j3PNy+XQrdnpISHHKdk/5IX9xyn
         VRw7+C0j6c0WwZCRXFqqzFjfjC2v+uwx7k3G88ZpCsNqJU6fmIEWKAjOykAHszeG3vog
         iv1cLeAR1P8wgzljjEpG4IETEzcNdfEKx7CS1sQe5/dzlJk/zZlftBaXFYSf/NnydsUT
         wk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPuzxUqaPkifw463Zzc5j3uleYXUwpPwjhXxHV4olWqFqBH+Fnns5xgWYk6XKvADIOxCzophSEFjid/8iV3SFq@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1Mq/bwsbfxMX4gvaKGnft03E70Eq6AWg3c1z/7BVZscgxVTmS
	m4dV/yRgflRCnfiPXr4dpIACSpb19lTthrqqbPa6P11qxkfpaixFBQ4nxVggRFs=
X-Gm-Gg: ASbGnctCsyg+AgL1zXM9nlfIBwKZFi8qlXEU9JUvib+pvBk3Wvn7rDvdlJQBEcZtkU/
	0tQ7xdjqo3xUAaqCyuz++2x8419ecA6SAAyzZG5Yc9yPW57kM2ZywDogzfSaDgejZzqO1s/mh55
	z02U1WufxXvQyyvkhU5bxyOCCDXT8lY4jqU14wRIWft8DdHJAQZXiClF2sMESMYIP7J+WWbmKsp
	38Q/GLKPmYIZBRytB25kK5Vsq8VyTrmXbZNIbYQUDE0bpLkR2tV+aquyVGkjCdlIzv04zC3FBAt
	ebQkazq4+Dkj7Y+EH2RFSjxp63TiWz1guWFI
X-Google-Smtp-Source: AGHT+IEsNXGZt2QOXuXj9OJSqWCxJoh9IxQNwSFDjV5JTFWQrndLXIX8JMTwPgrw564c1ha9VHBhRw==
X-Received: by 2002:a05:6512:1114:b0:540:2567:469b with SMTP id 2adb3069b0e04-54229533e5amr11323899e87.16.1735447850491;
        Sat, 28 Dec 2024 20:50:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542236024c7sm2833143e87.110.2024.12.28.20.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 20:50:49 -0800 (PST)
Date: Sun, 29 Dec 2024 06:50:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: linux@treblig.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	deller@gmx.de, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Message-ID: <gugwtvw6qqknstlscr4hxfrvcgfa4gfwwgxdosr24mf7huk433@oh7axkbesrjs>
References: <20241226022752.219399-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_205052_355698_379932A9 
X-CRM114-Status: GOOD (  10.24  )
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

On Thu, Dec 26, 2024 at 02:27:45AM +0000, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> Hi,
>   This set removes a bunch of functions in ipu-v3 that
> have been unused for a long time (since 2012-2017).
> 
>   No changes to functions are made, just full deletions.
> 
>   Build tested only.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 


For the series:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

