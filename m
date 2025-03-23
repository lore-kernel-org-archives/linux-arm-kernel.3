Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627B8C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmJXFLNkM2XetW7ou46ftOkw1Op0ucyZVdPTRQQOb6Y=; b=e/ZZtQ+N6R7rr5HtqvqmqxgeQQ
	6RTe0U/Gh77p4jL2uptzoZPd2sMjhedixTAmdi/MBjO4ajFI4cSOK6maBluEQW0OQrGPtV6mZnZUY
	7XCgYFyfe2JnFSC2C6gb2VD3hG8IROXybelIjmTbDal1pUNQWocW4oltTighnFkFKYRaoEyrGppT1
	L1bvga/zeQehyTuQDZ/v9SeU2ujEHAYR20tWToM64Y8Wy8/QyX+Nd/pQZ36wDSXnWFpg5qU9zPrAC
	KY0eUnZyxW7/z5qW6BZv9iBhbHhJ/6LeCeq93G4GRDy9C997XqqC2l2dAJoZ15d8tH5OPLP34+Spk
	TBYl4VyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twJrZ-000000018Dn-1xPr;
	Sun, 23 Mar 2025 11:51:33 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twJps-000000017xO-0QHi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Mar 2025 11:49:49 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22398e09e39so68218165ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Mar 2025 04:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742730587; x=1743335387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmJXFLNkM2XetW7ou46ftOkw1Op0ucyZVdPTRQQOb6Y=;
        b=dm5GbetkBdDKMPUJXEblpcI38yjWH4F97Ob0/M/KzcPccHEgjSyWtjLRI4OU2ZbkTJ
         QJa3XCGqii9QaJuumu5obEKZ/cqKo//3s0cFyFSYBo5Zvn4XPWgG2gC7j79UM/GVOznz
         2mjLgnsd2LB5JqD74XS2Z8JF6Dw1stvmaVjWzq6iOsAlSrpSrbW72ZqHskPcIwI7sz2q
         ikLZiyznq89NHKf5/m2ZjThgiRxJnPEHfNu7oet1++N1EYTquQJhLJO/sKapBPpY7YBJ
         yjzAx5FCrrg7XYM3InzVVfdjLP3mA+F4SpwkV4pjrLDT+ZyTJfT4k1Xq1ohf2AHLjdFi
         KSPA==
X-Forwarded-Encrypted: i=1; AJvYcCXTtU56aXSGoAGHPuJwl/BRqZU/40yZzYNoTz+F2ZVRUjQeSCi1wy1x7uxgKM6ixUnS+SnK0oIQO7l1mjpwWSXY@lists.infradead.org
X-Gm-Message-State: AOJu0YwGGWi5yN5OyeFyfjQ1T8vGrVhKS3/pjZWHy4gJVv89Dg7vteDe
	TnKt2zI754zmEaKS6cbyL4BWh7CBdcAseRml03fJxGQWEF09x71n
X-Gm-Gg: ASbGncu150yt6272RXUCMFkcKbd0Pl8Bz2znW/scGjAmdemzugaeYWPszm8RQrpY/va
	/a906efKRwaHwwKsJ18DgVtn02QIGa+V3Sr7mNO28hYyVpGsi1oJvsRZdhXmOgKi3PzdfENx93w
	nRvTR+IthOmeiRXHCyjyPIE722dZwJEAzUn67q+NFl2pxpiaSN+PzVjFAuTcMS86gCqZCzGD6mY
	NE4t2bxLIbAJGzkjq1wwfBbIbJm3acW/5pjCi8dtP/xlvMAoOpKoD2o+urUYb9vwzcTRakCPUed
	MOHbdpgHXN3Tf8a+rW4/qC3Jr2ZCGrsM2Jl0AP/wXVRmTrEKpq9qqeZJGe2lRlixjTWCTGulH/q
	cwkM=
X-Google-Smtp-Source: AGHT+IE4ThMcsy7oxi3rcVpcYm41RZ76CPSZHVHzFr7nfmNqjPHyOOvhsItW38diRfaAUmga7P2CHg==
X-Received: by 2002:a17:903:1aac:b0:220:df73:b639 with SMTP id d9443c01a7336-22780e0b2efmr142097715ad.36.1742730587110;
        Sun, 23 Mar 2025 04:49:47 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-22780f4bccesm50036495ad.102.2025.03.23.04.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 04:49:46 -0700 (PDT)
Date: Sun, 23 Mar 2025 20:49:45 +0900
From: Krzysztof Wilczynski <kw@linux.com>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 08/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <20250323114945.GD1902347@rocinante>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <3fbc487bc0e4b855ffbee8ed62cfb6bf3b0592e8.1742418429.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fbc487bc0e4b855ffbee8ed62cfb6bf3b0592e8.1742418429.git.andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_044948_139924_08497282 
X-CRM114-Status: UNSURE (   9.86  )
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

Thank you for sending new version.  Appreciated.

> +	case IRQ_TYPE_LEVEL_HIGH:
> +		dev_dbg(&rp1->pdev->dev, "MSIX IACK EN for irq %u\n", hwirq);
> +		msix_cfg_set(rp1, hwirq, MSIX_CFG_IACK_EN);
> +		rp1->level_triggered_irq[hwirq] = true;

[...]
> +		if (!irq) {
> +			dev_err(&pdev->dev, "Failed to create irq mapping\n");
> +			err = -EINVAL;
> +			goto err_unregister_interrupts;
> +		}

A small nitpick: "IRQ" in both of the above.  Not a blocker, though, so
feel free to ignore this feedback.

	Krzysztof

