Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B4DC369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9q1NBR20RdtEJv8ykkYuXpJV8gE5og1ezdr6jbBl9lI=; b=kqGpYOtjH24XhvQhpoxhnEW4LJ
	IwzhD4B4502oQDSN2SLl1wd5EepiFa4nxxBsOQOOJZlX4T+B45a2EgXIN6LI3yqSGu25ejs/CRU9Z
	T/+5IkLbNGGj73ZqEhsu0qM2Sq+zXw2fkB7rVmNEaJeC8IxeDshLgwQLzOfk1SAJOubekN9J1td7V
	fCgDutHYEOjO8BKES57T9ajR77s8mSKRnmKpD/lt9MfV8SeonmZ7dSrfmhtCkxYkIau5copA9hUR+
	y9H9H0mVcrkgMmSkM7ORM94QPEQNzXTaDkXuCMFH7lhQWYd0QxDkmQ9rw+gOeboO+iNrges7D/U0q
	3bXPQbkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69h9-00000001RGx-3vHZ;
	Sat, 19 Apr 2025 15:01:27 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u69fI-00000001Qxr-1ZfE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 14:59:33 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso3158140b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 07:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745074771; x=1745679571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9q1NBR20RdtEJv8ykkYuXpJV8gE5og1ezdr6jbBl9lI=;
        b=wU5nza5l2aYrkyqESjfNARogAAV7vnXcYIVqEATG0W3iOWI3eBo0ifjJ7fXNz5wIJT
         +OHCL/rzveXMFqRw6wJwYVemUtq7N/bu9p/25Wn5O4uA9Ju3cuUp8kaWV2Mt+bmBILhZ
         LyI3w/2aVwohJFAPM46vzBAl69x6HczhUwzyfaHfrQr4FRsA3TFhMf4Glxbbpk4aaFVL
         QwZEddipnN23af8x//CkzyZBEKSPjzwIEXvNWpyFKxrun9OQ8VzejoaxVmCsw8lhpr4k
         CEciQxaKYrXIXQ2/+FhBEyfkCJKtdbpZm7wqUSYD2ENTul03c45woL7lbsWzZ+kdXLWG
         C9/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745074771; x=1745679571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9q1NBR20RdtEJv8ykkYuXpJV8gE5og1ezdr6jbBl9lI=;
        b=rzsonfogbkHEteIvfo9ypOc5nwp6occusMPz7Zbz3QhRWvQUSeQp/M075wK+FBlelG
         1Hs3D7gk2CR+xhpHQLIFpl8Z+yiDB9eSVjXhsfVQlPOmvPPEejoD23NQTwlI9GaX7TPy
         nrjtKeEGmRwj97ParkXXdyYySGY5kqbcLO9ZQ2zxGXXY7+HvnzD6pCGxTH+RsWiMN4Ys
         F0/8oQc6fLpE3E1dbJkwuiGHVM9wA73TZ8ClAnUTtUOUF6dTBk40Cm1dtrgZSH7NmYTk
         8BRaMuDerEJMDxsWKpubswABYMYF2HFTgRhrZhrfE6Nfjk/dEzEF1oCi1n8mTNvuSeSr
         KFsg==
X-Gm-Message-State: AOJu0Yx/4jGOyFxITpM7BueTqHd6xoaYyjg6y12SyylIZeX7XTnAPopC
	KhIQwGXnx6IhwDpVcANbQyRcmSchxqGwsNCKGF+SVOW54nV3AutFpp9FzBNfOHg4ROn7Xj91aL4
	=
X-Gm-Gg: ASbGncsG0QnqWwatgs+MHs71bOl3fVf8Foc+ssm7fThOaSE/DxeTwm2YKiuby4Pm+hT
	68rT1jNuCsQoF0axBWZkQSc7k3UVgxVFgNL0rPz6GsGYzYlTdM8g7aT1W3cVaOq182Rkli6dII3
	6X2mSUuc0zTZsBL8MnsS60qosHCKqILsF99RMfgwr/HtOUFZwhfv/AGCCQ2jjz/3pPIqm4CywMg
	NYptdIz9X8Kn76uRv79TKQ781QMwzrinSx4mDJ3akWRM20t7OHlUrKTTgGHoZZTX2Vax8w5EG5D
	NG6tOz1t1baTRT6LPUvOkpsmO8Pf/xA+xW/xGLACKx2LCoew4Fx/EQ==
X-Google-Smtp-Source: AGHT+IE8xaP7gnD8F/5xNGraXuOjC5ioTqc6szU4p31LKem0A/5JV3SxYxZJSVmaL3fJhJ5WcSXIAg==
X-Received: by 2002:a05:6a00:884:b0:730:97a6:f04 with SMTP id d2e1a72fcca58-73dc1494019mr9292391b3a.7.1745074771096;
        Sat, 19 Apr 2025 07:59:31 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf90bd8csm3411547b3a.79.2025.04.19.07.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 07:59:30 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 00/13] PCI: apple: Add support for t6020
Date: Sat, 19 Apr 2025 20:29:18 +0530
Message-ID: <174507447951.53343.12422475035572217541.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401091713.2765724-1-maz@kernel.org>
References: <20250401091713.2765724-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_075932_428893_F4AD1D35 
X-CRM114-Status: GOOD (  12.94  )
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


On Tue, 01 Apr 2025 10:17:00 +0100, Marc Zyngier wrote:
> As Alyssa didn't have the bandwidth to deal with this series, I have
> taken it over. All bugs are therefore mine.
> 
> The initial series [1] stated:
> 
> "This series adds T6020 support to the Apple PCIe controller. Mostly
>  Apple shuffled registers around (presumably to accommodate the larger
>  configurations on those machines). So there's a bit of churn here but
>  not too much in the way of functional changes."
> 
> [...]

Applied, thanks! 

[01/13] PCI: apple: Set only available ports up
        commit: 751bec089c4eed486578994abd2c5395f08d0302
[02/13] dt-bindings: pci: apple,pcie: Add t6020 compatible string
        commit: 6b7f49be74758a60b760d6c19a48f65a23511dbe
[03/13] PCI: host-generic: Extract an ecam bridge creation helper from pci_host_common_probe()
        commit: 03d6077605a24f6097681f7938820ac93068115e
[04/13] PCI: ecam: Allow cfg->priv to be pre-populated from the root port device
        commit: f998e79b80da3d4f1756d3289f63289fb833f860
[05/13] PCI: apple: Move over to standalone probing
        commit: cf3120fe852f5a5ff896aa3b2b6a0dfd9676ac31
[06/13] PCI: apple: Dynamically allocate RID-to_SID bitmap
        commit: d5d64a71ec55235810b4ef8256c7f400b24d7ce8
[07/13] PCI: apple: Move away from INTMSK{SET,CLR} for INTx and private interrupts
        commit: 0dcb32f3e12e56f5f3bc659195e5691acbfb299d
[08/13] PCI: apple: Fix missing OF node reference in apple_pcie_setup_port
        commit: 02a982baee109180da03bb8e7e89cf63f0232f93
[09/13] PCI: apple: Move port PHY registers to their own reg items
        commit: 5da38e665ad59b15e4b8788d4c695c64f13a53e7
[10/13] PCI: apple: Drop poll for CORE_RC_PHYIF_STAT_REFCLK
        commit: 3add0420d2574344fc2b29d70cfde25bd9d67d47
[11/13] PCI: apple: Use gpiod_set_value_cansleep in probe flow
        commit: 484af093984c35773ee01067b8cea440c5d7e78c
[12/13] PCI: apple: Abstract register offsets via a SoC-specific structure
        commit: 0643c963ed0f902e94b813fdcbf97cbea48a6d1a
[13/13] PCI: apple: Add T602x PCIe support
        commit: f80bfbf4f11758c9e1817f543cd97e66c449d1b4

I've fixed some trivial conflicts while applying. But please check the end
result to make sure I didn't mess up:

https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/log/?h=controller/apple

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

