Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31840C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 15:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qygdnn8/rGb3p7MtdeT/GcR8Vsv7irPMGDAbFAo9qWg=; b=an5+w1UK4LpHJZaQ6V/iZbFbdc
	J/OHQoVyfd0yoEuh9ou+WzujbL1QzCTUCWMRosYs93DuDMFdQHSpLeakK8Yr3RENfPQ0WSb9Ino7/
	+z+1ttZngyob++K7+poC/yFq6Ae0Si2GluRPxuOrSuQnShItqHwFG//aZDG1ZbIM45C11KfO7hyRn
	Du6IgBkt36eDcRM/S04ZLcjcLe/ix7bf1k0WvuxuSj5EygSeuMb90dkgwqSh/V3ILG4RTosoayS3m
	oNzc6SL2N11NmOqnwCY3LOvjtTCIGoiqvjbNZ/QROFD7rwl0KkqCDlsq+XRrPR7M+UbEAk/1yUluy
	4f/E7sBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJFO-00000004GUf-0EZ7;
	Wed, 26 Feb 2025 15:22:54 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIp4-00000004BUG-2vas
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 14:55:44 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220e989edb6so190928825ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 06:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581741; x=1741186541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qygdnn8/rGb3p7MtdeT/GcR8Vsv7irPMGDAbFAo9qWg=;
        b=X6YHdbyStXwWfpRfndOH8gzh+MI1GR1K0dCtk/8F/7fdC08g0j0zzkAsoZi32t+b1q
         27XDU2LdjLEq7hqI//tEkzjqpzuINS9QG13i8JmQdgPvoucGs+Eo8rpMRLSRN0UKkkmd
         R/428CL3UW+VGWls+FphTFPWAs9csDNoS9FdNMy3z6Pw5vEKefUI4qLNZKaf2Ctmhx/T
         0uq38khEt2NJzWqxGQU/uG9u9vlgrQlgkMz0s/b/IJxg5WJU9SHLToipohYVfILhDMEO
         iThtGFGS66s0elKpf8UXkPMkeFJ9EJnRPB4tCJ16I2j7L4hws65yFqw4s51ZhReXX9jg
         9FOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOiZbI/cBq6pr5oN58xkJODuL0Kn8VtPmrxoFQQDgcmJQ2Srclc1YB1f8o2qAl42eUqKOHRA6nYOh0pOlw0JFa@lists.infradead.org
X-Gm-Message-State: AOJu0YxNiJER/O7t4oZ2WTUnpk5X+2U8UYhwLTpBZX1A/oYv5EZEeEtT
	ufe8tC6JUQjjE86iMUpUJScOezL3WAiFixnH10+q0kUfas+JF71V
X-Gm-Gg: ASbGncvTDOZA66x8pv7jSKKMzickqWbUw7qfdppVypb5/Q1upn3R/jvPNwrNeHQvm9h
	kn3zWFJ46iHMXa3ZsBHEgecZ2Rfbk+xmxTT28dIwJs73JyIVhQILW6fDusDztSjHKg61NoezuWN
	pGVxF5aeaeDyF6Ue7ACRwjkPJShqdOErB2nDPlnsRp6lYpYOUgsvPj4wXzpHm6/79zfL+pAe7fM
	pVn55YlQ/MQWXl98wWRdIFDyq3KQIKLcDaVZtnlm9MH+iyJk9ln53hclHbGNF6LyLL14MoWhaKK
	/BowQI4cbDJhi4YOjQLhn2ZF2c4sSI6x9sWwJaZXP6e2BXnAyBh4ZIonD4G+
X-Google-Smtp-Source: AGHT+IHpReDZSPPm6VjjIZPy7MkI2n87DOyqv+KvtWFP7LuZsR9/Xzl8+SaiWZs9PmK6WFRJ4senxw==
X-Received: by 2002:a05:6a00:1709:b0:732:2967:400 with SMTP id d2e1a72fcca58-7347910977emr12444159b3a.12.1740581741225;
        Wed, 26 Feb 2025 06:55:41 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7347a6f761fsm3544593b3a.47.2025.02.26.06.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 06:55:40 -0800 (PST)
Date: Wed, 26 Feb 2025 23:55:39 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH 1/3] dt-bindings: PCI: fsl,imx6q-pcie: Add optional DMA
 interrupt
Message-ID: <20250226145539.GA3691935@rocinante>
References: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
 <20250225102726.654070-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225102726.654070-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_065542_736011_87D89F17 
X-CRM114-Status: UNSURE (   8.07  )
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

> i.MX8QM and i.MX8QXP/DXP have an additional interrupt for DMA.

Applied to dt-bindings, thank you!

	Krzysztof

