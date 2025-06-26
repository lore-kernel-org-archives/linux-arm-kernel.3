Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B830C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 00:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g8X6fN/sy8ZyQiJgaNrcn1RVnKjXmkhrDdFBrAUFDbo=; b=Yk+CVAdvhFZeToECab+Gq65XEn
	IBqmQcg1iHdJtfLYbqUy5gjbz+9zYGpy+m2dXvPpKq+Qiea3ctvvMGUrHtjrESm60YBYE7SnJ0n+R
	IK0y3koxiA0M3tLbsob4BjtP6cn10LUCQ2/DudTdTWTkSJlsMtnFYYkVneGwaEzL2RmPyqmJUWeWA
	G1CrqI2WlFZ9KBPqzGTZ0dvNqG1bbz0nVNFxjyIoDniYpoCpwvqiKf3XbPZW8y6CzQJsaXqnjslH6
	c9YRazJvvbaMKyoXgAxnoyiZN88LwGky8nB7KKvqrnWW/v78nzRS70cLabcByF4mTkOTqceqk66oI
	d0N7fMkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaaF-0000000ALYi-3w0K;
	Thu, 26 Jun 2025 00:35:19 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUaXv-0000000ALKm-21nw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 00:32:56 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-72c14138668so73105a34.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 17:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750897974; x=1751502774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g8X6fN/sy8ZyQiJgaNrcn1RVnKjXmkhrDdFBrAUFDbo=;
        b=XCXbJH5AdVpC+jDsEFMP8q1immRtWnvdEuzt7DGraaPyP6HP58At5OVpK3lKV+LVgR
         WUgAqlrPWR1Pcfmbnld+cm81vSvJ+fX3w4U7f3oRCN2+/n6RR4W215x25EzGE3yobUvF
         voBQGy0xMqxZZlZzcI+17XLftLrjYZkW3vTlwGVZdlan9VaEY4hbYiQNnMCmrhUSDz5W
         5HGVkRE4DkZXvbO5kie/2DdELv61DRL5qnknOh+4W9G2tqTysuc3TNVGk3T22PI0I0XZ
         o3RvPLVWG995D0YaFEgbHKyD7VFrR8jlLIQ6/ubQczEXd3YoA6Mo/71V/JYljin7WvwJ
         uHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750897974; x=1751502774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g8X6fN/sy8ZyQiJgaNrcn1RVnKjXmkhrDdFBrAUFDbo=;
        b=jrO7yLhGs/OG2Rkb7IcQVMgeJcGTuOma9yUDACC5wMEwvT2RSgR5vAdsNNu2bdC5gO
         9d9ZcJu/XUbUUwW6xw6ziBqKZqc7HKakrdHNa/fO99XXxZezxZdF5ZkD5dEHu8gemymW
         kmSw79mkS4Ft35vUR2jxGcslC8vcO0dHWnwMg9swricvrA4mI9wjLmkO2ChN+zS6kgOS
         ddoNP/ftPCp+WTJfRXmcQZ9goNNOR6+Zjahrbw+1dpO7mgA7cGqD++LoTGaNJzhTeOUV
         QU7vVY8YTQE9rjOSYbc7wq6NPz2QUTYog53zurEEwQlFgTRv2/ptgDuhtTQsySkETr9X
         ai7g==
X-Forwarded-Encrypted: i=1; AJvYcCXOaeO75bi0xCSEtH7KDgd888EO2768OZkGZfFyl9+5n3K6ZGDNfKNlkpt6gag1IX5SkKSxbHoiR/ZJ/W48p9sR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1e79qqzS0lIrIm2thYEHBTsrKnqILlXI3RD3Qr1yfxBqgwQsR
	YNpnxLcKhoe7/59Fwu9h6AKVnsQEqytpqt9I4gWxVEcBebswuWnk1mxvnWfg8ENsavc=
X-Gm-Gg: ASbGnctls9xJGMLrfc06gk/y2lfhKSYUWVscREzvzWJzAB5lpZ1wbTEhSHhsRXZDqOS
	XGVAa1FMSzCRI2GCSzwPW26NVaDTR89qPFPPVHQqT93eHecqoHiHRAJRxBJdNrvXOUPxDWcOzMH
	xg26lmdmqOfE8FV4LIj28kaGfI6gxgiJPxtKjK73Rr+BJsoQe9nuT/pyu+fB/N4rslZQl7Cm1Vc
	WruSbTAOFELficcXyWM8gznYjaBN2ZlPzy/jrMgFgaB3s060v/G2jfFM5F8hbDKzHIA801vYM6A
	qiHYuGA1xcHU0hcBBc5zwR6v5gwF3L8so49hsIeM20Kb7sRj5dwrxizZW/fJGxrSvks=
X-Google-Smtp-Source: AGHT+IGgCT0aIt2Vk/6CBqJqabPF5GPEQRnBgXUMrXjo+VORvIfFnmUByQnjm3rxOduTuCu1c8Cv0g==
X-Received: by 2002:a05:6871:330e:b0:2c1:650b:fc86 with SMTP id 586e51a60fabf-2efb213638bmr3538638fac.1.1750897974327;
        Wed, 25 Jun 2025 17:32:54 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3ee4:904:206f:ad8])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50fbb67sm81975fac.41.2025.06.25.17.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 17:32:52 -0700 (PDT)
Date: Thu, 26 Jun 2025 03:32:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.Li@nxp.com>, Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: Fix error code in
 imx8mq_mipi_csi_parse_dt()
Message-ID: <473ad0ce-5180-40e9-b159-a6cfe77f792f@suswa.mountain>
References: <9b6c7925-c9c4-44bd-acd5-1ef0e698eb87@sabinyo.mountain>
 <20250626002053.GA12213@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626002053.GA12213@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_173255_551086_92346815 
X-CRM114-Status: GOOD (  13.98  )
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

On Thu, Jun 26, 2025 at 03:20:53AM +0300, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Wed, Jun 25, 2025 at 10:22:32AM -0500, Dan Carpenter wrote:
> > This was returning IS_ERR() where PTR_ERR() was intended.
> > 
> > Fixes: 642b70d526ab ("media: imx8mq-mipi-csi2: Add support for i.MX8QXP")
> 
> I'll add a
> 
> Cc: stable@vger.kernel.org
> 
> to obey the media subsystem CI rules.
> 

Wait, what?  The original commit hasn't hit Linus's tree and it's
not marked for stable either.

regards,
dan carpenter


