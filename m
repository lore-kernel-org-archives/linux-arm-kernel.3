Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96ACC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JODog4W99P7CS8ZRV6Zf5jfAFaFc/53al1khJwbmT8A=; b=zcPidG17mUW6M40jLesUEFwazt
	t8eUZGLYPpUJqJqkM90Wy0EjNMx3nAHixQxqjyy/JlnwFs5A3vpUFJtYdiuOdlT1hamYKo6QBsf2Z
	maxCPAYx5pWFztxNI6h4TnM9p1M1SJiYhCdlJtuQZc2ISX8kN8aEXHDeB+TyNaIOiwf7JEWY3wo9p
	kEIAtrM0ZqTY92ZXtu/JzXQY2ZynCu/u32zV7U67fPb3w3hHv/NxuPNlPYFY89p5ErMpvGL43XBZJ
	kUn9ZeVeILfh6tUhOVwJAbLJ51y4Uinc3y4I7N+8pQOwIZAsU/KE4PRVAUYbLxwWpxxvN+9QjWzrJ
	W0VuwgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucody-0000000DBqH-3402;
	Fri, 18 Jul 2025 17:13:10 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoXL-0000000DB4B-2cBp;
	Fri, 18 Jul 2025 17:06:20 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso1102375241.2;
        Fri, 18 Jul 2025 10:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752858378; x=1753463178; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JODog4W99P7CS8ZRV6Zf5jfAFaFc/53al1khJwbmT8A=;
        b=hEwPO/DL/Y6N0SoBThj7egVVB3TGdaIpHrXeFuSkse9c1EMkRe3uh7Q/m7OlFTrWEO
         XqiKfUHubHZQzGV/p5oM4P5Y+lHF8SC0eeOIx3qficGVmfAWH6ALRrCOu1eUqaeTzMf7
         px5yQ+b7NVTU9QX7TnSx1Sk+LbMEYRrZmcxsJVPq8CyVGa7Aak+6b1ePXpaH2weGL9Me
         GE9tf6WDPDvYDkZFSIRE1qVkZUMZDnVoxylqjopw3P60kCXSHfExTE8be1iihVmtZxgX
         VnkAE3u3jfagKiffEQAuviqOVEBqslmTpeWUBhz0Ww++0OEVevW65gf2YrdDKUBTnr6F
         FyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752858378; x=1753463178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JODog4W99P7CS8ZRV6Zf5jfAFaFc/53al1khJwbmT8A=;
        b=f/aqgtCCr26pg4wgZHogzhwPqHkTFa/uI8XSWYnR88qZv/JbGRo2Wi21gQbOfqyfUM
         bwX67hUPtaTnse56oRUq9m43D6zqH1f65F6UBxZv0NcRGJ599WehBaVHUBwzJjeGeQH7
         Hcuh6qBelPlTXDiBMLmvyOD2fjjB8ZIYEaBaVoj/z83nxiE2TfOYQGq5GsLZx069tpjL
         h1jrxTkt4qGF7Hmp6VY3UaiC54G75qRdqPAXa+H34SiUibaHAAu0qzCQLtjxXYmla6ay
         uzqVvwlXarA8qbISGXZBxdAkPGCEEAYzTZ//OKJp644uXWFo4ZtOLKJ+1gIUjPGfoD6i
         vpog==
X-Forwarded-Encrypted: i=1; AJvYcCV788FKsPe2zRHocsGyKIFlrhWJxum8gKXI7XP+ysy2TO1ld+jsvzoXYMHNfB4qfPss/ER94IdgWIT+Vaiiq7g=@lists.infradead.org, AJvYcCVzWHWIOecxnYlX6cfQjWQ6Pwkn0dsHc+jOfLcEtWh+DE3h+xE4xkB1UuPD6n3PY35UGwqWJF8jDRE/0/rX9UrV@lists.infradead.org
X-Gm-Message-State: AOJu0YxNEefu4XYbQWroFCGe2cQkZfPdzmQcoYhFkwYBCiqj1zLbfsst
	Xt+wJ2aoQFTqen+0ddner9LtaqsmJ9P1kCIOLRg2hk7I5VdZjbTASZL1
X-Gm-Gg: ASbGnculs79YASso/oVmhRviR1Q0kMkGQdIkJ1pgfG35GH0SMXbQpAIt6F6nbLvP6x9
	1xS9kU3KwpdzJL0P7HD/DQNvkriN8YlilTW+voOTYIkNbhivOdOIiioCHxGPQ7qtasu+OGa/pSN
	jSJIWULwE63t3Pd+YwKx1cHVOdPHXVA+0d15sl2jr3or7JUAmMJrgYY83O4L6oVZ2xN9DcrtHrI
	9K3N6LI1nuTIc4InCONiO//6tuPaYJ748ou9cH9/xg54g5wbof96kJCOMrKLYXKnpJp7NpY3XnB
	CWYnItjwM0+BU4Efw1JdsaK8KY5OyLFQx30DSs44AcJnZtZjFqJv14xLLiRtCPLYeYagCy2JLlL
	mTwOMK0KDLg==
X-Google-Smtp-Source: AGHT+IHLlDQix1yjP8AWd2tUqC/hSHZ26YyE8eCcJfbFHbJgwOfqTSR7MAKzgkxm2sVR4SNzi9k28Q==
X-Received: by 2002:a05:6102:8027:b0:4e7:c14c:9e30 with SMTP id ada2fe7eead31-4f998126d21mr4372502137.21.1752858377696;
        Fri, 18 Jul 2025 10:06:17 -0700 (PDT)
Received: from geday ([2804:7f2:800b:45e8::dead:c001])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f9acdbb99bsm608794137.2.2025.07.18.10.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:06:17 -0700 (PDT)
Date: Fri, 18 Jul 2025 14:06:08 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Hugh Cole-Baker <sigmaris@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [RFC PATCH v3 2/3] PCI: rockchip-host: Retry link training on
 failure without PERST#
Message-ID: <aHp_APHDTFqc7wOL@geday>
References: <cover.1749582046.git.geraldogabriel@gmail.com>
 <b7c09279b4a7dbdba92543db9b9af169776bd90c.1749582046.git.geraldogabriel@gmail.com>
 <ac48d142-7aec-4fdd-92a4-6f9bc10a7928@rock-chips.com>
 <aHnAcbXuFqcMXy_5@geday>
 <067e1833-8527-4c66-90f5-d284f7d2ca5c@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <067e1833-8527-4c66-90f5-d284f7d2ca5c@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_100619_659360_71087B4D 
X-CRM114-Status: GOOD (  18.69  )
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

On Fri, Jul 18, 2025 at 11:46:33AM +0800, Shawn Lin wrote:
> 在 2025/07/18 星期五 11:33, Geraldo Nascimento 写道:
> > On Fri, Jul 18, 2025 at 09:55:42AM +0800, Shawn Lin wrote:
> >> Could you help tried this?
> >> [1] apply your patch 3 first
> > 
> > Sure, I'm always open for testing, but could you clarify the patch 3
> > part? AFAIK this series of mine only has 2 patches, so I'm a little
> > confused about exactly which patch to apply as a preliminary step.
> 
> Patch 3 refers to "arm64: dts: rockchip: drop PCIe 3v3 always-on and
> boot-on" which let kernel fully controller the power in case firmware
> did it in advanced.

Hi Shawn,

I tested your patch but unfortunately it does not work, PM981a SSD "plays
dead" and 2.5 GT/s training never completes, even with the bigger
timeout.

I hope you get the chance to test my patch soon, because once you share
your results there could be two possible scenarios:

1) Patch does not alleviate problem for you:
   If this is the case, then there's little I can do further and this
   becomes a wild goose chase, so no chance of upstreaming anything and
   I'll just move on to more useful work and leave everybody else to do
   their useful work too.

2) Patch works and previously non-working SSD is now working:
   In this case there's something serious going on and it is our mission
   to find a way to correctly upstream a fix.

Thanks,
Geraldo Nascimento

