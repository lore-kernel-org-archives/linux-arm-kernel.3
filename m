Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3352DC71148
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 16:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KF3cFtJQTcMBQy4lM7jXXcjLVtEEtKJIoATzivLkWQQ=; b=E0FMaW3phMMtf7dRYxw4qktePu
	vYgvj+yiBEzczWdeuhEYHAYty7yXP2QpRNxtt2nNXApxGHRxsZKZ2PnUze/azLKtno95Rl+jPkMX/
	eoAlrTXH7/Qc8/6FXDV3/3tLjXXyexZSj/WCUKbJKfTC4mhZ4G9tt/ugwBnUjqtyx6I2C2tVUD38e
	hZHb7U5bdoWwymu3SJu6TPijltlJUb0g5LzyEUELb+kh1ovvzvWIQ+FWKr6THaXF+MCwFBIzLsMFV
	+P/5cSeNlEANo2TZifIYF7OjxMBgbcFXRGzNnq08uYcjLd97U35UZ2DvXIgJqYTfcGRxRCWvTR3RJ
	vQCUDS4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ7G2-0000000H3BS-2Xfk;
	Fri, 13 Jun 2025 16:27:58 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5y6-0000000Gogq-1ZpH;
	Fri, 13 Jun 2025 15:05:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-312028c644bso1959739a91.0;
        Fri, 13 Jun 2025 08:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749827122; x=1750431922; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KF3cFtJQTcMBQy4lM7jXXcjLVtEEtKJIoATzivLkWQQ=;
        b=ZrOxTTGDwVapBm7gAdowEhHSsMzFMSocpLPW1IPs/8AQw0S+sAIpL2wV/jRmMZ5U13
         LwVQCmL5AVJYxDsRbgHrBBH2CsETF0KgBGRaRMcSHAO62FeF6TF4NgHGbxz9TX0RpstK
         P9158iCZR5sNH9PkpzHZEKl6ox3uOOZ7co2EshvmqBZXCz3iji9xaHR+2YVFD97pxFmF
         azZ6nnumo/Rg9hnb5JyBEuZ6fP+IHo2Wt9VCqHMLJ4kJzbdhE+/fO7N6csb1TdzWRcXM
         F/odtrTU5LS3/XrQVg/gfNJquWpw0KF7iEe2jaCp6x45Dr3FgaoQ31810WjjzBjj/e6e
         CWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749827122; x=1750431922;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF3cFtJQTcMBQy4lM7jXXcjLVtEEtKJIoATzivLkWQQ=;
        b=p9EvcFYqfJGubiMoWpkXClfi26ugqMn2mcX2iLplksh7I6pmHes7R3AJl0hKM/88Cg
         0ryLC3i8FchsEuqAaqPIkxulbfkCFGK+aUwrNX8bvq+joe33laXLo7SOHL2qmyANA/mV
         poR1NmHNv8b3EkswzI/V1XCEERPwUzXLSA4nWk2CnO6M2GIpf+vCtBhqQKiU1SDoFyYe
         7vnAsjj8troR7anbd7fJamJAEm8nZKl+q4I5Xin3cDdubWtTX8LTp8GPM3NOrDfBa+Vf
         gkSAr0NUtVVD0GMF0+rDWU3n7KlIiSQUmqXr/3OBBRp5OF1wmG3OowfVNJLLYxqepphg
         pVYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8qZk/ISePqZUl98+Oqm3ageoyOzpINOPPXfDf/GeXxHWUJ0jscSShaLZnS64gbWdhLLW61/YocpZN@lists.infradead.org, AJvYcCWWvEiJD2dGmbw+8nVTGZ/dR9Tzlc+p6iz46MraJ+ZIefhRVOOYEPu0yZk8/JPVx/RLfxwOPztDwV5EQF/mcLaN@lists.infradead.org
X-Gm-Message-State: AOJu0YymzyOXXQZEkzp6o7gSzp9ETDUcPTK9u8yYPd8Qzq7Ddj/fkOyY
	V6XPsaUZOasek9vSXihPoucHrrauqjO2uA1M5OrTUbUPyRwaUi4q9ebzuF5MVrRx
X-Gm-Gg: ASbGncsiVqGqgm7uTsA9TVQ7WoytFy/Tyv6s7+dVmT/blCD6xjre8+QDHBg7qG7syaW
	UUoQfZcb4gY0J34qQxHmUpWGacSIZu75+cnIIhxW3loq6LCren8KBoH7ZBiruySZNmBwAuRoC2k
	yxDZSzxYcehOf8AEEP2bkvad+rSfq4eQasFgsc+tLCvs863KWsFUDqe5PaqJ8WhPVCQO5F6XXoM
	jWfl5/GwK/NuJ7OIKJ+VuhzluxHvKF0ug8fElJbdr4GDcPoIxfiBjm42T/UH1gZNDHgaApRFUIK
	f78++Ar4LsazwAf2o+5Eb2orCQn9B1ZxddabtznoOzp+RwyS0A==
X-Google-Smtp-Source: AGHT+IHdK8qQo3ZG3V7b3Hz4SJ4IVpLiY2VBl4h1vhl+f3MfcXfp7Rgjw/llpCTAemK6u+3no+kgZA==
X-Received: by 2002:a17:90b:582d:b0:312:f0d0:bc4 with SMTP id 98e67ed59e1d1-313f1be5b9dmr93821a91.5.1749827121457;
        Fri, 13 Jun 2025 08:05:21 -0700 (PDT)
Received: from geday ([2804:7f2:800b:838f::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca008sm15308325ad.193.2025.06.13.08.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:05:20 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:05:15 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v4 0/5] PCI: rockchip: Improve driver quality
Message-ID: <cover.1749827015.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_080522_419334_DD9777D3 
X-CRM114-Status: UNSURE (   7.17  )
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

During a 30-day debugging-run fighting quirky PCIe devices on RK3399
some quality improvements began to take form and this is my attempt
at upstreaming it. It will ensure maximum chance of retraining to Gen2
5.0GT/s, on all four lanes and plus if anybody is debugging the PHY
they'll now get real values from TEST_I[3:0] for every TEST_ADDR[4:0]
without risk of locking up kernel like with present broken async
strobe TEST_WRITE.

---
V3 -> V4: fix setting-up of TLS in Link Control and Status Register 2,
also adjust commit titles
V2 -> V3: correctly clean-up with standard PCIe defines as per Bjorn's
suggestion
V1 -> V2: use standard PCIe defines as suggested by Bjorn

Geraldo Nascimento (5):
  PCI: rockchip: Use standard PCIe defines
  PCI: rockchip: Drop unused custom registers and bitfields
  PCI: rockchip: Set Target Link Speed before retraining
  phy: rockchip-pcie: Enable all four lanes
  phy: rockchip-pcie: Adjust read mask and write

 drivers/pci/controller/pcie-rockchip-host.c | 48 +++++++++++----------
 drivers/pci/controller/pcie-rockchip.h      | 11 +----
 drivers/phy/rockchip/phy-rockchip-pcie.c    | 16 ++++---
 3 files changed, 36 insertions(+), 39 deletions(-)

-- 
2.49.0


