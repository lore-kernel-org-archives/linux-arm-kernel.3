Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A02AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kxirebw5kDkF1+wRXCoNpE/6TwpkidGg4t4NyZVsJ/w=; b=l6488BH/tQe+yPbu9h+QvjtuRy
	RVkzY6UZv1Hcoq1SYKZRQbmuX+9CPbez5mBnBSI3l99btlKs1XxFJ8DFY7Ex6y/2dK0WRlIfuC/6U
	fi3El71K2PkUN20P/twKUFHPQmqDlv4FrrPpSUWjQhNbmG19FSUAo7NOGTrkJS/DpAMtiREGtJ0T5
	9VK3e6p+MGtaqSYkyQnqSGRNtzH+yogEL0BMpzfnt1K3OHOJZPk/8jm1bX0nIF+f3svY5kneZ5TzK
	MAUweqm2N9QtAOpy/hflzP/UBw7K1lV5WFq/7GsjKOFAe9TwQhkaBJZ4Lrg1T8hJURTZpAAd9MYh+
	lBRBCWIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toOAO-0000000EW6d-2fd0;
	Sat, 01 Mar 2025 14:50:12 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toO8p-0000000EW1I-03rF;
	Sat, 01 Mar 2025 14:48:36 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2230c74c8b6so17625595ad.0;
        Sat, 01 Mar 2025 06:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740840513; x=1741445313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kxirebw5kDkF1+wRXCoNpE/6TwpkidGg4t4NyZVsJ/w=;
        b=EcbpHiMQw0/iHeoL8hZ8fuJHmQPBNlvEjT9jd5zm3pas5Y6XWovIOJQn8/EpkhycFF
         kFmmTEdGhMptqHBDIh7Dy+jadnUgG4pl6iUaS4tUfytBGC6je4MMukaeZSoR0563zEAx
         AtxQPWANLtcbqwuZeF0jgpiAPSNe5770JGYY8pfIaTWJ/HQsVB9UFkUchesBQXhlU4z5
         PeBQwDtO5c+OxzBhBsLdhqkKPsRRRM2Afiz/ApjY61t+sjeC45j9GrOY79dSSpXatHn0
         hGWHRTNX8tCp7ibH4r9F84DoMbamM5Oxox316tpZyteGQ1TgNWNPBarG9qZcmuqaiifO
         bgug==
X-Forwarded-Encrypted: i=1; AJvYcCVbk4pAi4gCKsQ1RjxD6q8FgVCE2OTVxB5FuHRJ109sDIbLBDtpz1NB7U7EgeByjNOcD+FmwzcvD6CeQTUXjrPS@lists.infradead.org, AJvYcCWbCKTeA9dBHB/5eOxIO6f9z0xJJXr/fBEBU8LkYuuKkk5WF/uHKkLi/LPKumH9zB4ErW330BKnviX/6jlhWTvp/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YymLk810LaLrtD2yqxB2RyrTUgomxpewWy6YVbwYGuSHctZo1Zj
	nmZLPn+3pWpDo5BME2L0wKsit0sDA7Tjl4lFt7qavX7FaXVNomDH
X-Gm-Gg: ASbGncup9CVLuC21Pf4eK3Wz2wU8nfYyBJwIyfOAVsNe6Hd3jWaEOjMp0jV/xpQOqlr
	rmEcMztnVSx6bs3wspxlokmDq3ub3BB466ADyKQDZw+/xuxBCaEjLjccZzApLNqvIAOjq/PBeH2
	Zo6tkM1oUlaAnA6qJBZNOamxGVGnGDSvOqjmCbFXDe2++9Vvw75TLLRjKt+/Ow1nEVqTPYAaji6
	7MZibCjp2/fVkUeN9utfi68dFs0kQu8F2JsbRnB9qzRKJ3ElM+yR91BRHP8JCNuBD7xqLcHfhUN
	XBHTAeMPRHsBa9kTABOlxKZi6ctkh69zzi9fOy/9+clEGqMW0jSDgnP+hvGe7qIuG1sP70nY0iV
	x6FE=
X-Google-Smtp-Source: AGHT+IHG4g0PEDW0krzlx5kdodp+yvsIBSjDMcx+eciBkPw4wgN7QvM+HqAQBJgdzNXvy+rEnV1R2w==
X-Received: by 2002:a17:902:fc84:b0:220:d28a:c5c7 with SMTP id d9443c01a7336-22368fc267emr124814875ad.21.1740840513441;
        Sat, 01 Mar 2025 06:48:33 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-223501f9d8bsm49585955ad.81.2025.03.01.06.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 06:48:32 -0800 (PST)
Date: Sat, 1 Mar 2025 23:48:31 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/8] PCI: brcmstb: Misc small tweaks and fixes
Message-ID: <20250301144831.GA846783@rocinante>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214173944.47506-1-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_064835_056413_95840302 
X-CRM114-Status: UNSURE (   6.76  )
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

[...]
>   Six small fixes and improvements for the driver.  This may be applied
>   before or after Stan's V5 [1] on pci-next (they should not conflict).

Applied to controller/brcmstb, thank you!

	Krzysztof

