Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DB04C71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 11:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6xWMsAWZYmxQCQIsCXgEHzm6wGct00ke2bZk96Vt4g=; b=KHlmOX2zJtqem51z5YoM5eFTKl
	dW0TJ3PKGeqLRolgt86moMRdyf3pb4XtofM2HIk32ytqzMxC48ggsAKPz1uAQ1TgfRcQqWKS4P9os
	R6nehnTe3i/Ag3vv3KWFx3Eox36tilZWOLPWQzK66NRnKtH1dbu87Qe9Kd24I85T3gDrV7+mHY+Ic
	Y1YaqUFBFU9/3fju2b/OqcxXUSKpaH9buBsQSIR+YOuOlHGuk/uSZkb/LITEFxYx4jslloX60nyKi
	Tmg6wquzdtOZXhpE7dvLCwkKQVy+e27JQyRjyg1EWvynMpEKibIrkmgWg2R+JG3Z8Mz6dkR88x3SP
	sbGD10Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSwVN-0000000HOw7-3lmG;
	Sat, 21 Jun 2025 11:35:29 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSwT7-0000000HOiZ-2al4;
	Sat, 21 Jun 2025 11:33:10 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so2508911a91.1;
        Sat, 21 Jun 2025 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750505589; x=1751110389; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m6xWMsAWZYmxQCQIsCXgEHzm6wGct00ke2bZk96Vt4g=;
        b=aAm00aO3K1j4pxTDQ0eXslvdtK3okBena4R1Zlb9qEsQI4+88KaHbQVpcutAaSILHz
         U8p3hiZ6H+LyxkVi6QQHaLV9JnAF6x+HCm75FX9eDfx4qNa85UofOnpJV1hru7B7J4VR
         627gIR5LxAJ7c1pKJTJN5XWQK4r+iDr8yWQpJGENYYeLOeGB0a9E5XIDZPVTrXR7OhS8
         cp2IEGVr6jqy63PK55R6NUPcpMUGhKPi10Ot7P5dDvm9MoO8ijxYy34o6rz70GZSaiiC
         QLsi3f5MPoO6m1z2mQS+65l3BkLPLerg1S1OCq37bxKtrRuwN9crq5NbrKDp+SVstGe1
         OEgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750505589; x=1751110389;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6xWMsAWZYmxQCQIsCXgEHzm6wGct00ke2bZk96Vt4g=;
        b=hoBPwFYN2EJ+AZjH+usXJpgbdLb3IMDUs8sr1mWyMGzUCHOGbdOQwg4WmoS7eXk1ge
         +V39s+gxnjA1QL2uM661b/YtyTZYpzPXQs3dSLO6cmnlK1thIeBZO5cqG59wKfjRvpmP
         3+Qsyq/31zhHnA6zFP8kDzdctZlbJcczbWDAg7qW3L7VddrW3DovhBn3ghsIHuvqo8d8
         VhDgypjHdGVVyN+N2+gZ2R+33wtM8KQVNdJSsFQgcbx0L4A0MIbobKiuq6Y5H5sPHCN/
         ypONDAWzIzvlDEL2xUFdZ6XXFPo41cdwcTT3+XQmxWHeosLHMr1iEajo39Ez1I5mUncE
         4SkA==
X-Forwarded-Encrypted: i=1; AJvYcCU9UsHEA8dQryTmqU7Oile0zzCo2BkVHJGQMCKy1/vUSpZiITFq4Vk1umczdca+CMDH0Yrx4eP0XCRqNdtUgkVE@lists.infradead.org, AJvYcCWJkZmKajZO5iz7ErCeg+gDz6p9jMDrjXK7fLQyUJHkpAQKGq+UFY5NAI4z21ArmJKo2TS3+VrqNm8Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxrVyMQQ9sOtmHSffFPMG0gE/1jUw/9O8tLevCFeNKaWh3wc6WY
	kuVscBWnFnvtV9zO29tZwmol6ZdgUcjSuP5CnR/oPsaqSflJRvA1arHg
X-Gm-Gg: ASbGncuHbQFuk3TYCiYVSGK6tf5hww8qCN8bSSI7ZSaar/j67xVvJ9R2K1A/2g+6U7W
	Zh1h1u5RmaASzYIHfST51QIrT2r9LmFi4VrPaLOYvIbY0TQso0LFp+ED8vR38+oYf3jpz4/6U1R
	BD4Ai7VniT10apdTJ8l7UjDMp95EEy+swZUAc/Bs6cqByG2J3LceTiAgj9griMt2N498Gx+b9xf
	kEEtXoBVNxqGS/R/oshuRUhUi2+7XxcEvJKep53XZ2a5eUTZGD9Qbm1FYkKv9sSkgdR1FZGB1sJ
	+3AsiTgcv+4c0mWDIbwMPqhcxwaSLEktZL5oq0Jmtha/RTrFiA==
X-Google-Smtp-Source: AGHT+IH6gtQnon9pj6eccRXS/FbkW5+UypmNMlcvNoE6c4fJcgUCpR3GPt9papU67FN/24ZcWA6t+g==
X-Received: by 2002:a17:90b:1f89:b0:313:176b:3d4b with SMTP id 98e67ed59e1d1-3159d7c8fb2mr7713377a91.22.1750505588733;
        Sat, 21 Jun 2025 04:33:08 -0700 (PDT)
Received: from geday ([2804:7f2:800b:d58e::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3158a226f7asm6301825a91.10.2025.06.21.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 04:33:08 -0700 (PDT)
Date: Sat, 21 Jun 2025 08:33:02 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rick wertenbroek <rick.wertenbroek@gmail.com>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 0/4] PCI: rockchip: Improve driver quality
Message-ID: <aFaYbqRRV2l7nPcr@geday>
References: <cover.1750470187.git.geraldogabriel@gmail.com>
 <4760493.mogB4TqSGs@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4760493.mogB4TqSGs@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_043309_656979_CD1B3379 
X-CRM114-Status: GOOD (  14.25  )
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

On Sat, Jun 21, 2025 at 09:39:08AM +0200, Heiko Stuebner wrote:
> Hi Geraldo,
> 
> Am Samstag, 21. Juni 2025, 03:47:51 Mitteleuropäische Sommerzeit schrieb Geraldo Nascimento:
> > During a 30-day debugging-run fighting quirky PCIe devices on RK3399
> > some quality improvements began to take form and this is my attempt
> > at upstreaming it. It will ensure maximum chance of retraining to Gen2
> > 5.0GT/s, on all four lanes and fix async strobe TEST_WRITE disablement.
> 
> just a driver by comment, you might want to drop the RFC element from
> the patch subjects.
> 
> It does look like things take form nicely and how people read those
> RFC marks varies wildly. Some may even read it as "this is unfinished"
> or something and spent review time on other things.
> 
> So if you're mostly happy with your changes, just drop the RFC part :-)
>

Hi Heiko,

thanks for heads-up, we really don't want people to ignore patches so
I'll drop RFC tag for next iteration. The cover letter needs some love
too.

Thanks,
Geraldo Nascimento

