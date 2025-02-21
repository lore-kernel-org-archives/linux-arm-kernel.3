Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21A1C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtzdmLHWgF7iyekmReF4eZfVX/GiXF6V9kKExFtIjGQ=; b=Ujo7vKjEN9QziEAb3NU+sMGMFy
	dFMejvk/g1t+GghbeHqZCaWbRUPGdwpHvVHvUtpQdzMszUdCuIp/1B/at+0k4biE0cmr+YJGB/psH
	B9VtGvAxnleGmPfKMlW9vAcXbddWPrDkTo/GCVacaGJedqH7/M2AeeWRn+M90ofr0YXbw2frNEzjz
	ikIOclIQi4fwZ/nlQDeBtznwz3Bd6DHH5i4hHsf1E45PILauu3vR03vzkY1TpPiBDZbxaxXZagVzm
	+eFqUwIYnXYC/6qLj7BC7VObkNI6c6+Jqcf7CitvcHiz4SyZd4p6tFeWW6tFlG6l15cA+Smx/1O40
	lDBg+QQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWnF-00000006N8V-3zxG;
	Fri, 21 Feb 2025 17:26:29 +0000
Received: from mail-pj1-f46.google.com ([209.85.216.46])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVho-0000000683U-2fta;
	Fri, 21 Feb 2025 16:16:49 +0000
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fc042c9290so3818746a91.0;
        Fri, 21 Feb 2025 08:16:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740154607; x=1740759407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtzdmLHWgF7iyekmReF4eZfVX/GiXF6V9kKExFtIjGQ=;
        b=QNuQuCPLJeM1ZD/9KtZqBINV3K/++BKWQoVT+n3pV4WKj5cxFa87kE/RYBkiU8NLs8
         YG4HmjWtLGNaxoMWFBFkr8z9F8V8TIHfoeSm5FnPJd7oM6H4A593OLOpufZFzOJtHMa1
         i5FeURbTSgtC40vfVy6HYlkc5fqpj8HUTobTeMwTZy25Jd7tRj+hmt31/Ds7grpKz2Wr
         9+wsieZq+lpDrgPR/8K4AfkZpwP5tp/jCuLQEbSnkVh8zo43s/5RCv7+IX5J0Il5G1wX
         PKiJC0eByuof+YulKB1GUg1LPxtLbvn8u2FG2bW8H0ftOr+6lCkAkHiv0AadhtpiB4ka
         RrLg==
X-Forwarded-Encrypted: i=1; AJvYcCXRPg7r7Anz/E8c1om+tUDu1y8AxDucmnEO/7RwALJ0d9F5igaRbSOkAaVtDA5L4ka/zEZYqUdfzzVAmTVMVHvTeg==@lists.infradead.org, AJvYcCXZD4X/A6B4E5XwEk0q63izT/lf3BBTJLaDpSX9aizszTjo+5SPDEdt94bCrZ78Z0Tp7ipCo80V2XcQPyuTGELe@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv10UNcBKmk4cd8kWXyRjWzLQ8sd7gDskczd1ThLcrlqeJMH0x
	1fCWfyNi5ZDwaFSqvZAsEeOVtRS3Mgg47WoKrBtcl8o6PX2yxx0p
X-Gm-Gg: ASbGncvqMmp1uWCYVSJRK//KRi+oI1HtpWMZ6O6i1qB8x34IXGvfiwmjZlcvSlsoOog
	mhZce46jQw3EFfpg6DYOafyB8BncKlZWlu1qaWqh7YMElzDAxFsS4M//OVErGUhjPJkeJDasXCH
	+QQxVrFI2tg8XPJ9sqMwQTqcAWHkUnbcUc8w4qNQ0XiMZG3uPTzwO/7JoUO2YD8ve8qqwhlXwOQ
	X6T1/eFmf/XGKBzVqXTXjKKL+xIgc26mSk6JwqLxiSW30GcPzc1l3pULapPOLziuDyLY2X1tVI1
	GPakbs84nG40NRbotdoKhkCRNPPpFAXJO5gF0xYSoeRZv20uLggO+I3t7Wi0
X-Google-Smtp-Source: AGHT+IEDUawQ7p9G7A8dpF66pDVzseghqUjomgJNjmCvXMcR3CS02dZrBRorlwXIR837s2Xy/Uu6aw==
X-Received: by 2002:a17:90b:5292:b0:2ee:7c65:ae8e with SMTP id 98e67ed59e1d1-2fce77a638fmr6700136a91.11.1740154607259;
        Fri, 21 Feb 2025 08:16:47 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fceb05f715sm1586207a91.24.2025.02.21.08.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 08:16:46 -0800 (PST)
Date: Sat, 22 Feb 2025 01:16:44 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
Subject: Re: [PATCH v5 -next 06/11] PCI: brcmstb: Add bcm2712 support
Message-ID: <20250221161644.GA3753638@rocinante>
References: <20250120130119.671119-7-svarbanov@suse.de>
 <20250212180237.GA85622@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212180237.GA85622@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_081648_672348_DBFAC31B 
X-CRM114-Status: UNSURE (   8.95  )
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

> > Add bare minimum amount of changes in order to support PCIe RC hardware
> > IP found on RPi5. The PCIe controller on bcm2712 is based on bcm7712 and
> > as such it inherits register offsets, perst, bridge_reset ops and inbound
> > windows count.
> 
> Add blank line between paragraphs.  We can fix when merging if you
> don't repost for other reasons.

Updated directly on the branch.  Thank you!

	Krzysztof

