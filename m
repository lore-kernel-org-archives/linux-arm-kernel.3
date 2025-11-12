Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3D5CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 08:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOQ8gbWYR/8pIKJHHt25CkEHl+HOhDt/PI+YYG3jAcU=; b=SR7NmkRTnEDuiXF94DiRB+6tKS
	9bFGm/YdHF+N5Ifftdy02NiTbXuCvVjYDTXhfgDwQxLklTFRd5U+RX4IpBv02lnnCjmwhNBi74YJ8
	mNLLb+aYduUFkH0PbV4vFZk8H2G1SZuYdzTXaWoBWgYlGdMYP2svB+PLuNF0EpwfoMT5d8H1YwSP3
	LCM8unRp5/TvVM+elixnJQatMZE1udde/e3TQl6sBpPlX/TLxq3fILqtlLFJi93wUk6mlixR8vSDu
	/oZ5eqXwbPgscmWbwAbi+Y3yK7vHD/7plA+4G58/o7IE2ZCA8QwwBR4xytgns6bkQeZtoPWFilFKc
	nqqnUP+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ5pH-00000008J3D-1xAd;
	Wed, 12 Nov 2025 08:03:35 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ5pF-00000008J2B-2IHr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 08:03:34 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso306830a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 00:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762934612; x=1763539412; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IOQ8gbWYR/8pIKJHHt25CkEHl+HOhDt/PI+YYG3jAcU=;
        b=Xm4uSmPIy67p50Q2BwF/nusZz5S3fT67DxnAq9AxUVQ2c+6aqrqHEBumLMk8miYCVa
         iPoaO3IYPRdvawxDC1rs9HY4W6oDdErfQld8pWsmb9uvFbIHlc9pP/Nu0ph8bV+r4rFr
         NL3QLXlsgAtcITCtm/Mh/EZ23GJrccuRLjbYThR2vExY9brX4ay4KgbWzjaNMXcv87Wo
         pJqCjd8PfMj+Em3oPTXQyfTiD68CxabPeSd6KN5fArsaYe55nD7tBe7a47cSgvkLFtZt
         CnmBhA8GmJhVIH/y7jmTkYJT1GIm8ozgDNG5UKUFXg5qkS+qRa6izxrC/uhKVHOAhe/E
         Nj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762934612; x=1763539412;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IOQ8gbWYR/8pIKJHHt25CkEHl+HOhDt/PI+YYG3jAcU=;
        b=luWZDnq7jP1F2Cajdb/ieoQ21+8igMoakk1zFqVR6C8rwA+RwOxGJvXakI9q4nDPGh
         LfXgX5kYTocCmDXego55SYMQzqKOTfgLsy9KpskvfZ+A5Igyis5iaPFjyFgP5OCkrU1V
         UpRYR6/RzIYdhMPZkraHE5aRwFmUw6BzgwZPzi+jVKbh4qOqUFX+zcrh4h6eJfFPb0QR
         2pa0oG14bk8gagtGE6DR6BdlBqKpCniycO0Z5liiQqjIbtGIV8BMfz2tNQrvXiPtzmYe
         Hlk+25Mu5AhXDkMNVY0G3JX3zahgWTGCDj3TnnnhlBPFrefh5QCx2Qk1v6g3ZHbgaHE7
         0gIA==
X-Forwarded-Encrypted: i=1; AJvYcCXCItudqoB3VTK1eT1h/96mp6+kIMyk544EP06bQrlVyq0DppvVBo4x37xH+jWvoXqNIgi8xr66mvlbv7L8VIfG@lists.infradead.org
X-Gm-Message-State: AOJu0YxcGWvbejMmLEqQi4iak1gegJTLSTDjE9U5qsIBj9U6xQgRL0r4
	+mAmVqL/YQMVJ9mT4vSUHRBg90tb7ZxtOziHHuK7wMxbrN47EOhHlnvK
X-Gm-Gg: ASbGncu+9fRLREIEBWjDonEgksVdXCMoXewRyBzVBI0gDrW388Tck4397rxCQu7NlHo
	2llbph9jKxx659clCRacNj62/WPn1rSxtNmios7s7362loNWvAU8q1QgzCEmzKnrGh1l2s+Yg0Q
	PWZEgUqggydugVIkaqEcRLxeoPPK2kZf/elDht/aI6u99ZC4+Ldedd8vHjZkuzSTAfZnFESVqsg
	FkNT6DoM9xwAzjaikHPm27XKflht9Rp07AEoAEXgFpKK3/XHi5lIlyCvpcQPp1qO2YxEIWGo3gU
	9fcwe3jzPd6LT8Y9hZerQPAGPrwBFeJ5KxBNIcwNfX47LX/AIdnvh4hyWN1ifrasX3lIOhex58N
	MvnnvPeEQnZRIYuRWbu46Lu34HTnejZeCONwS9US1B7+2wfUdrPG0tSZxauip5X/ocicYC+lsBA
	==
X-Google-Smtp-Source: AGHT+IH+DPJMbQNSOGKgtCR72ZONR0AxugfjM0MLXwjdzOTvsq+YFq9t1EqGEJ/mZYCDIKH8bOXU0g==
X-Received: by 2002:a17:902:e78b:b0:269:8d1b:40c3 with SMTP id d9443c01a7336-2984ed2b619mr28705965ad.12.1762934611984;
        Wed, 12 Nov 2025 00:03:31 -0800 (PST)
Received: from geday ([2804:7f2:800b:7c80::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbdac10sm21286815ad.22.2025.11.12.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:03:31 -0800 (PST)
Date: Wed, 12 Nov 2025 05:03:19 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: =?utf-8?B?5byg54Oo?= <ye.zhang@rock-chips.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-pci <linux-pci@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: rockchip: align bindings to PCIe spec
Message-ID: <aRQ_R90S8T82th45@geday>
References: <4b5ffcccfef2a61838aa563521672a171acb27b2.1762321976.git.geraldogabriel@gmail.com>
 <ba120577-42da-424d-8102-9d085c1494c8@rock-chips.com>
 <aQsIXcQzeYop6a0B@geday>
 <67b605b0-7046-448a-bc9b-d3ac56333809@rock-chips.com>
 <aQ1c7ZDycxiOIy8Y@geday>
 <d9e257bd-806c-48b4-bb22-f1342e9fc15a@rock-chips.com>
 <aRLEbfsmXnGwyigS@geday>
 <AGsAmwCFJj0ZQ4vKzrqC84rs.3.1762847224180.Hmail.ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AGsAmwCFJj0ZQ4vKzrqC84rs.3.1762847224180.Hmail.ye.zhang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_000333_594442_22A27FE2 
X-CRM114-Status: GOOD (  17.75  )
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

On Tue, Nov 11, 2025 at 03:47:04PM +0800, 张烨 wrote:
> Hi Geraldo,
> 
> In standard GPIO operations, the typical practice is to set the output level first before configuring the direction as output. This approach helps avoid outputting an uncertain voltage level at the instant when the direction switches from input to output.

Thanks for the explanation Ye Zhang, it makes sense to me. It avoids the
pin to not be floating so to speak. I kept hammering at this problem, by
the way is PCIe PERST# side-band signal refusing to co-operate and
failing PCIe initial link-training.

You're not going to like this:

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 47174eb3ba76..fea2c55992e8 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -183,11 +183,13 @@ static int rockchip_gpio_set(struct gpio_chip *gc, unsigned int offset,
 	struct rockchip_pin_bank *bank = gpiochip_get_data(gc);
 	unsigned long flags;
 
+	rockchip_gpio_set_direction(gc, offset, true);
+
 	raw_spin_lock_irqsave(&bank->slock, flags);
 	rockchip_gpio_writel_bit(bank, offset, value, bank->gpio_regs->port_dr);
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
-	return 0;
+	return rockchip_gpio_set_direction(gc, offset, false);
 }
 
 static int rockchip_gpio_get(struct gpio_chip *gc, unsigned int offset)

By setting direction INPUT, then writing out, then setting OUTPUT again
miraculously it doesn't fail initial link training, with no other
changes that already have been rejected by PCI folks and Shawn Lin.

Everything works as expected. Is this an explainable behaviour by
Rockchip GPIO core?

The problem I am observing is that once I set PERST# it becomes
unsettable again. So that's why those open-drain/open-source hacks
worked (gpiolib will hack the pull polarity to INPUT).

Thanks,
Geraldo Nascimento

> 
> Additionally, for Rockchip's GPIO controller specifically, setting the level value should not be affected by the direction setting - the data register write should be effective regardless of whether the pin is configured as input or output.

