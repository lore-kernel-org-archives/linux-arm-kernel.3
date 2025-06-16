Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31608C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5Fh2IblBptlZ3vF3rnRWlEF+hFPfUIR1AemX0HSA00=; b=FaURbgb0HQkEf/nXEo5jbRejYA
	MIfBWQYseuA+YLuRoD3wCq2T1eZLBwslTLXNB+J0086+DjCfCUhb3iG2iiEgUPVdtdrp5bXs/o31P
	nA7g8FVQ923II17cCbvVNQ/GycFDPAYOowygAF6b3Fj7RLqTn32aVNPG5SapIsCzUsn/8MV01R5/u
	CPhqeDZQPwrjfOsX7Zh03k95Uq8fDrUQ6TvIwN5tf06vB+6VH+yxuk0p/u+icxJB6pU11OSQi/kIM
	QpOpBm3k9VbAgjLNoM8tQoSEBLHO+EvmnPgRISTTiP2D6o5qb6n6v1ttrCTYsEiVRbMfCTl0iCaTs
	2I6JAIxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRIVN-00000005if9-3woN;
	Mon, 16 Jun 2025 22:40:41 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI8a-00000005g7d-3CaZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:17:09 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-313cde344d4so4678876a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 15:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750112228; x=1750717028; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L5Fh2IblBptlZ3vF3rnRWlEF+hFPfUIR1AemX0HSA00=;
        b=kNXaUP29tqmfkTc9dbDhFXNpZkDHOS347Sf9Yt8qhyVXn38PHBft99oxfHXckdpoSY
         iv1TkbqdYgcoZks5puhmGV3FlFQvMwaW3thoUzh88xcSG9K9Us/FSsgnUO5YNU8SM8jQ
         Z/3e25VtWSJuMbAg/8MGMzngEo+6LVlFe29VjXQScNz6tLjXHkSQ7MHIy3uEwZfhb9Eo
         JFBQjzNaak8QTSLn6iIFWM+LEXo0NoFzWWZskKYfxdCZsXBjL82kuxXHpNQ5o/AlGl9m
         lSfgnYptejpz7tZHLjd18UuT9y2ntuwqP/vMbx4sffU2F4WVRN/z9J0H8E/Pnq0IlIUb
         9Y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750112228; x=1750717028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5Fh2IblBptlZ3vF3rnRWlEF+hFPfUIR1AemX0HSA00=;
        b=SuanOVHDvdTqzxJelgfZlBIjY4dAWPxZoBfzE7TLM21Xw3x6eD9FCgD+37nDs+5A1M
         k5WaFa+SUCipx2wxkP3NLWAVIRGHKggYsKmlIqlQk93e12DoHs+S0n4LY+ytjlXqUp5j
         Q6xXqRCHV8v1oxp47UJdZ7BMe3ATnbhX/3bBrjlUgpffgYOT7vpHvzOmn8myVbgGv/55
         1BOMIeDFSmZVG15xxxpvjLpDtrjGDzIa2q1EuGXwO8wqvbo2399aETng9bDNm8ySYOnN
         +SqaSFvn4YXfVUTsabI1YduIfltM1y6aTK1eegKSBqltwzEtF/px8xjIlXCKLKW2tCRY
         QONw==
X-Forwarded-Encrypted: i=1; AJvYcCUbiaS4Qun0N9y+49x5EMZ2+2fIzH170Q1HqHriVd55ZHFg3/vUGv+FwHjmfiJHv6GDFBUJzAx6SSYXpbrNd0UW@lists.infradead.org
X-Gm-Message-State: AOJu0YwbMVY3j7+KgWonelsfRPqX7YXQEpzHRgmgLWe7/5fc6LIDauKC
	KnAMiw9QLaLpuUcterOto7lwPcS3CPMYWtYgvg8TMe+x3RdFrdP/oaG/
X-Gm-Gg: ASbGncubpRM9vk5iEuzFgv1MDgsBwpeDfguC39ZOrOLlKNNQaxsSkqOPUv5mr5lB5y4
	PRDekQXfdWnr4bp3AsVzyujYJiw3ewryjvfjr1Luk7ZakLFEimv2suzlsrBOwSXx76vTQyy72Jh
	18ksiIkg2Q+a1x3+BiMaOlglLRt+KNHj5XJEfwL8uGc4LpF6w2Oev0XI54unLWS8m4lNVY3VquZ
	YFANeELjZBuA+fHfGKjmi4AyOy+PnmwJnVfVyFzVKzXtGncx6ZJUgeeuQgYPET2jnFIQ9jnlPzK
	XqrtFls3VUa/eqqQjZ2UzvVZ9lIMTun6W8vLOGducuqIMKb6SIm0pOr1NWnrVglxHc+6HpGVHmu
	VNOjggAWJbQ==
X-Google-Smtp-Source: AGHT+IH0R/kwqrtGK7vSfYsjfazrkbGVD0Jb0vrp0a0cSzfE6EUdfWb215kTnNr1aWjA7NvqBBDnog==
X-Received: by 2002:a17:90b:39c5:b0:312:1ac5:c7c7 with SMTP id 98e67ed59e1d1-313f1ca7855mr17965599a91.2.1750112228057;
        Mon, 16 Jun 2025 15:17:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19d1122sm9229246a91.13.2025.06.16.15.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 15:17:07 -0700 (PDT)
Date: Mon, 16 Jun 2025 15:17:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Jean Delvare <jdelvare@suse.com>,
	Florin Leotescu <florin.leotescu@nxp.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	viorel.suman@nxp.com, carlos.song@nxp.com, daniel.baluta@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com
Subject: Re: [PATCH 3/4] hwmon: emc2305: Enable PWM polarity and output
 configuration
Message-ID: <57210f02-ab4b-4bcc-87a6-7a41a239b569@roeck-us.net>
References: <20250603113125.3175103-1-florin.leotescu@oss.nxp.com>
 <20250603113125.3175103-4-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603113125.3175103-4-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_151708_799724_A0108276 
X-CRM114-Status: UNSURE (   7.49  )
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

On Tue, Jun 03, 2025 at 02:31:24PM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Enable configuration of PWM polarity and PWM output config
> based Device Tree properties.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Applied.

Thanks,
Guenter

