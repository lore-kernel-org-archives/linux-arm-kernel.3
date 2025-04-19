Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5E8C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 09:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1smWoXBsF07yb0kdhSazKV5zZrD5jTCHEvASrG6ZXY=; b=LTClfVsatNfFNSEZBHnmeey4Z9
	OnD7SzvjFLX3kbwrSKtQCvrUHRUohYLrzsZofrKbE6+lPtvqpOKtuqgKtX+4MVaVpvQVhglOBma9o
	Qet5+jVs5Lf831QNGJOxBpvuz25WKTmpdOjakFnnI8NVJyyI1sDmk2tb0C0nP2AANCQBaZHPKA+7N
	Ki3SfTor/py8Hw0ZKOLacQSPh2RWweXd11RtSccnY0A66AYif0ms6+xiVPVEdlSPj/SNnzvbLxUbr
	g7kcFDDq46MJyaTSiwKBQMpReVSeyiyR2AinzpXtm90oLyQyasuLBT+qTRl016U6vAHEkWmwB/n0y
	6D41Qi+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64rq-0000000177T-2edN;
	Sat, 19 Apr 2025 09:52:10 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64pw-000000016xI-2HxG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 09:50:13 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-30863b48553so3059556a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Apr 2025 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745056211; x=1745661011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1smWoXBsF07yb0kdhSazKV5zZrD5jTCHEvASrG6ZXY=;
        b=Ib4493/yLTf0ZinJ7rTwkphBoDtdO2LT+KerqrBjUu2RwPLYgFuB67dS3l2hQpB5q1
         7aDsJ+01K1G5VQxMiOcDpiOnJd/aqbe+1+kGnaR8MT99vCOG3ssJmC1ltm4OAukoulTf
         ePu2Vqr2U7IcEdas3ciKzHaVExVsZ5xX+kZuGwDj8jI5453EO3sH5EHIuROM4INnIdWi
         iwxtEvCEKs95G3CU77E9zkc1smyZp/WoU6YRXSDFVaOEgHfZhkMHl7LaMy1e6vRDT2/F
         8QKqDGPGfKNI8Z7zZB/vTsC3Sjql54P/1eAMNXncn0msDZeicy99iKPTdaBCPIO11xIq
         krDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745056211; x=1745661011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1smWoXBsF07yb0kdhSazKV5zZrD5jTCHEvASrG6ZXY=;
        b=G7rl4MfXZvhDBfwFWtFz9vZupLTRox7hgfMoNHF2ERTqU5xLNV5KlMzLAHBj3ZDKiY
         QvVU0g5Sgca84HGNj4p6mZaxV9e/SxvD1e628vx4ekXQ/AAtd9WYz5NanPnB2JgAytYI
         R/2bq1fn8X41YBLDCVxSSkf2njEtTQWwsLMiC2AAe9LqXzP1RXpDjwjJw5RwhkQyWd5z
         Sa59khKFyG8H3PwLwgzmG6MAvIZAzM6Vo7EYiufRZGgKdde+j2VhSJ1LREAuuUEqoyv5
         LsUSKrKt9v+kApYna/c9OuohnVfmNiqI/o9mUaHanVyzPGRJ7piUNu0s6YkfTtImh+Ei
         2KSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlPrM+mchKRYxuP+jxVWw36Nvy1x9F2b6y730mcksiD6ug08GJFIHBjemEck3/jVy68uQngpSlQwnve2Uao88y@lists.infradead.org
X-Gm-Message-State: AOJu0YzLXpb6JCK3J7LGDZkNQ6FGLtA4tk2huUuffMSAinxnbQQbT2U/
	oRP1CtcFzvI4cH40Pny6U4a7pu3s8HAGtZ5uf5HEVkOpjT4L3N50oAJP++SXtg==
X-Gm-Gg: ASbGncsr4/L4x19zpI1vMpCWOe2qfDMW1/VXuvnpg4e30hfiD5Q86vxWc2jD3yGkehr
	jskz5dApkOVSr0yr7AnxhiIrGO4qx9GQzsj7X6ufo3pxxDngy9SdmAj4frsN4PqLWUc2Mz9XSGQ
	2aLM6PVBGJyPwsBnw+jdOl7BUNmI8mD3PKNwp0K55H/LDHOO+gfCCaB1IkKJQQgfesbOEDRpPbo
	Gc/xhEOt3ztaLRHNoMQ69P2a+trT87DKuojGdP9m8NZPoVYhVZii7VJfsTfl7MgkMX9qcbGsRQ7
	vqJvVZ05gM51ePDXFLC6S5WC7g4a98bfl8fNLNd5e6ehlXY7IqRECA==
X-Google-Smtp-Source: AGHT+IEq9phG3rDT0nEB9hkvWvaXKiYNwe1s5RXKu8uLzKTD8MFTWep3kqRGNKf8OTR2vRkuBkxE6g==
X-Received: by 2002:a17:90b:2705:b0:2ee:8cbb:de28 with SMTP id 98e67ed59e1d1-3087c2ca65fmr8403803a91.8.1745056211696;
        Sat, 19 Apr 2025 02:50:11 -0700 (PDT)
Received: from thinkpad.. ([36.255.17.167])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df4e12asm2697981a91.37.2025.04.19.02.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 02:50:11 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: heiko@sntech.de,
	Kever Yang <kever.yang@rock-chips.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	andersson@kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Simon Xue <xxm@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
Date: Sat, 19 Apr 2025 15:19:59 +0530
Message-ID: <174505612709.29229.7221551173436866910.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414145110.11275-2-kever.yang@rock-chips.com>
References: <20250414145110.11275-1-kever.yang@rock-chips.com> <20250414145110.11275-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_025012_600990_650472CF 
X-CRM114-Status: UNSURE (   9.17  )
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


On Mon, 14 Apr 2025 22:51:09 +0800, Kever Yang wrote:
> rk3576 is using DWC PCIe controller, with msi interrupt directly to GIC
> instead of using GIC ITS, so
> - no ITS support is required and the 'msi-map' is not required,
> - a new 'msi' interrupt is needed.
> 
> 

Applied to pci/dt-bindings, thanks!

[1/2] dt-bindings: PCI: dw: rockchip: Add rk3576 support
      commit: b5516efc1ec610e75f320385a3a2ecb5932a49d3

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

