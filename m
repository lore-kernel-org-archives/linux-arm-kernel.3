Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A47EC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lby868p6RW66d7wZAeSh798V7d6U5V3PYrj576BWJWA=; b=wFEujk20uhvcLg1dKosyQNlEk1
	BwlNy+tUN9sXvaR6G4B3evnn2KWJtZT1N1NiNafPtueyPbuvkG7lndJ7IpljF9/dnXWT7K7OOJbrB
	ybl6hPZf9Eaw/osP+JiXM1iRcd1UbmgJ/0P2HLD1wX6DJ08j/m0iaYzaiuOrSHMsuIUBd1T2qtBU3
	JESUAZJc5ueQl2CpFdt3oSPRzDJoYDmWG5CyuMuTbYVB1LC0bBiIXXTRsjxCs8wxPBfZeBqoqyQEA
	c5zr2puXF8dlQpFcxROC23u6SCXdTUkjNusovPLKZgJPFEcyP9U8Sd9cAnwoX4MQojn7TIRG8/n8+
	FP2zhH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tme3T-0000000ExWz-1qGh;
	Mon, 24 Feb 2025 19:23:51 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tme1z-0000000ExJ6-0SZi;
	Mon, 24 Feb 2025 19:22:20 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21c2f1b610dso141042585ad.0;
        Mon, 24 Feb 2025 11:22:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740424938; x=1741029738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lby868p6RW66d7wZAeSh798V7d6U5V3PYrj576BWJWA=;
        b=S/tWXCXIeO3hcEcY84Cm+iHruLgFMLbdvjNnifsvoPaj2o4eqZ1tGRU5BSrZdDSWTI
         RrY+e7T1BnD3Fpd/Maqyihq9fhexjr0CgyJXXW7ucm1Wu2uwmLZ3DIBL+qY8qjUrUaQ9
         i3nk0nJ4Om41lgow41e4ceNWEtZ4re6KbJf5GGd9KXmgJ3KS3Cywtlz2hOqEkX4WB07z
         97I5+SGK7V8u7Ic0Tgr/E+1DHCdmYxzQwNZ252SyAXpkvxa3XJJVXU13Rs7dW9t1YlJY
         XJM/xyNIvaaEwdn8b0vbHA3FIMWQs0RfadcPBbqIx96nVgKOMiacMkhuD+nyEnir3otu
         UVPg==
X-Forwarded-Encrypted: i=1; AJvYcCUfCEk3p0KKSYW9AXRqyN9CXx+bJGu0PTqFrz6jJn8k04JcIU2ssOGhNHNroro3pPKZGh/QtXvkvT2w6JVfXCpO@lists.infradead.org, AJvYcCViMhSUqSWpas9NqqFc8sBjiD5BA+cKKCOybzxA5R2D/ELv2xVFLIWVDKfxN6Eqh4EuPozCHcibHQxDnm/rO3rbPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH0BmxsaR/8FHaBIRx2XddvsMmOKy2dndvJdHVqt+VkpOufxjs
	8AViaJKv7QpspBN8+iv0fWWhhLTX7PlSgd+T/uIOcFNus8CTDh2w
X-Gm-Gg: ASbGnctoA/H1ZV72FSj5+Yf62gZAb5fXdqhsHB6zXZmxxhCDHAqFUIwp1f0/V0n1UE4
	3nDUuIV3lEgwnhY4awNie7P9pz98fYujo7BePyXUS3Uh3QUQcCc1PAKDICyefwhFYQzfB+3ZrYS
	4a4EOfMdvqyfXwg8AsLiHsE44gL/2WRz1U3utsCWofVcBPFa9R4akX2P1zJjYqp6BWObHsRTiBW
	loKHjAk2yYltP4Gwl6JWR674OLVOWXneJ8O659jfE03poOfLvyJ3DR/FfHkGI8CwCXAj2a1zRn7
	1kxOyiGrAohXIoyfkDaDUG5HtMsICbfgBlshMvQ067Zsfdj4AYqvPtrRC/zs
X-Google-Smtp-Source: AGHT+IGW8hzZAZs2veSCvxujXgQK7/b4vuAT5K3Ok0ANy534lraLQTko72fQX1bO4hQEcTr85MZIhw==
X-Received: by 2002:a17:902:c950:b0:21f:7a8b:d675 with SMTP id d9443c01a7336-22307b32c86mr6987075ad.4.1740424938111;
        Mon, 24 Feb 2025 11:22:18 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d5349226sm185329855ad.24.2025.02.24.11.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 11:22:17 -0800 (PST)
Date: Tue, 25 Feb 2025 04:22:15 +0900
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
Subject: Re: [PATCH v6 0/7] Add PCIe support for bcm2712
Message-ID: <20250224192215.GC2064156@rocinante>
References: <20250224083559.47645-1-svarbanov@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224083559.47645-1-svarbanov@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_112219_145317_73A4F8D9 
X-CRM114-Status: UNSURE (   8.51  )
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

> Hello, v6 is re-based version of controller/brcmstb branch of pci tree.

Applied to controller/brcmstb, thank you!

> v5 could be found at [1].
[...]

> [1] https://lore.kernel.org/lkml/20250120130119.671119-1-svarbanov@suse.de/

The v5 is now superseded.  Thank you for the fixes!

	Krzysztof

