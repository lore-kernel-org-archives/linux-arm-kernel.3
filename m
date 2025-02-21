Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E80C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auYo1q28WZyuHNh2pfR3G8yFEtkgsHI7ZygRzgYrpuw=; b=DOCDv4UMwtQgNSnZJ5rXRO2Rw6
	zYIAmY8co5bTBrYC2zcFvXX4fjf0Otggn/TEyG44A2hfYfyAF+UFOxBruaXglPla/G2hMWQ7GjIdt
	OSFg362ZUnKcBbw9JkOMVf/GIjlYu8IWGe4VR+Ss2whMAfM+1oImGxmF+ceaGSJhUfbqx4frWTbhS
	kLhyoFY7ekbqVOUbjmm9+KODgtQIc0djnGt+qgQ4bbzYMqU7gVJ13idQXRghGZK9E4Sijaj9A8nWq
	l1GYpht5CLwGSd2jFiDE6KoJzbrAbzfaVTGWXz3aQhVTg07Ux/SIEOm8QZtV5Xapy8/4p0meQB2wF
	ZnMSd0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVxs-00000006CGx-0P3N;
	Fri, 21 Feb 2025 16:33:24 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVtd-00000006BRw-4821;
	Fri, 21 Feb 2025 16:29:03 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220e989edb6so64033775ad.1;
        Fri, 21 Feb 2025 08:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740155341; x=1740760141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auYo1q28WZyuHNh2pfR3G8yFEtkgsHI7ZygRzgYrpuw=;
        b=rXNXuWdPXLrk1LBfRvUg4/6HHavrdNrWKlLWCPw/cEuOZlvTQFDNM0drsJZ/jg6AaR
         4FZ+mBdqOBuxBVWIYMoX17fKidGEGSeev5yOjcOQfT4JKtn0QRJwp9OTQ4FEJ6AmflR/
         7Wh7PkiBIUqmP4NmlDBl5nBt73DCBzZwoPuq0s7A3yBQztVWVIRwVeasrr/q/NgaSbdT
         WFvRbzhp5D/xJLL46n9AQI+/Vet13Cx2qWp7WgxJvz7Hnak4afNWL5B4Gok3mLxCZDvL
         rhjIf/UZvuuxd46yR1rAODW3IdaN585GTXO3YWtriFlYWrVYFXlETBRxnas04D1UaZiB
         jMbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYQ8TH3/tV8j/YvhLwf0T+WJu4Jw5qGUfV5Sr7flJADsVDC3/bSyw7y5L4arYyDpgHqo5B//H59HGzp3zyHvxG@lists.infradead.org, AJvYcCWfLSa/36/jrVXeZ6NnP6QBdjdLVbEntTRZaJFxbCRIQcL38kfHidJq/C+NgbRIjfxHJ8z2WZWg3lZgOonmaBgVlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYajLvGx0DlZANuQWaGeCthoySie6+UvvBXJjovhuMGTlqyBip
	YdrWEhT9eoVLxKvb2Rm7APyDjVoXl00W8j5OT1RZwy4j4MGiUAe7
X-Gm-Gg: ASbGncte2bWK6SbCEoiFVhLHBztBaHj/JVa1dRY+CdJG5Rv60s1bUiGgNwGxbOZU0ou
	kqFPeHgFEXsubkTU79saj5DGo1wPRuS8uJe9LfyeUdm3mmY96bnTf5rQtZl9nSVlZOpb+KB8zir
	yX4KcO9cvFSKx79aKG2W5VHrnNmzwCNmUL3fUZYfSWTxUGZde8Mo/kBxMt7by67BuEaq25VShSY
	8Usdk+J+tiVWJedTrs6sRjprYVenGPgVEJbCknZex/WjWlA5rZYa2FYiSaIrxUlzbOTbcX457xh
	1LIUKNgzCAlL9oEtCbv///9yvg87AE1yM8y0486wQwQKeybDxWZwQuoRCdog
X-Google-Smtp-Source: AGHT+IFnKdGjvlhZUCgvom/r84nNQnNYczGg1sVtsp3HGbrc13BuFoyVtD/Y/b8wcoZfazYzawaYOA==
X-Received: by 2002:a17:902:e5c2:b0:221:7b4a:475a with SMTP id d9443c01a7336-2219ffe1401mr54015415ad.52.1740155341168;
        Fri, 21 Feb 2025 08:29:01 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d5349061sm140095945ad.5.2025.02.21.08.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:29:00 -0800 (PST)
Date: Sat, 22 Feb 2025 01:28:58 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v5 -next 00/11] Add PCIe support for bcm2712
Message-ID: <20250221162858.GE3753638@rocinante>
References: <20250120130119.671119-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120130119.671119-1-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_082902_022311_FB194B11 
X-CRM114-Status: UNSURE (   9.47  )
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

Hello,

> Here is v5 of the series which aims to add support for PCIe on bcm2712 SoC
> used by RPi5. Previous v4 can be found at [1].
> 
> Based the series on linux-next because of vc4 gpu node in bcm2712.dtsi.

Applied to controller/brcmstb, thank you!

	Krzysztof

