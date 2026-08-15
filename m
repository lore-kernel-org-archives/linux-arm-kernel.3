Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB444C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 12:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=; b=lDnqky0+IsOFkbM03Rzhj/z1Y3
	rMR5Dys+7x3FtswdNoCeFOcmknW1Xa7vTYhwbKdGzBI25MRPiHqJ2hGZjD8DW6gg5mnXTzVgRJZdS
	Pfz9Qg8WIVIvGZW8gdQQNRaAIVeocmoagtAeue9NL6+I2DwFUUszWYP+A+ZHG+SsNm4b/Isv7tTn2
	5vNt6TNDyiQJfwYvjSXl8tw/P9iU2VO0vfLq/BTPAbieSvbSUy33WYkpJ1QrzZQSvWkEKxBn2uXPY
	4AD/V1cX2h2NgCTKB4DMYRZEDQj49MZ6aQGSfewQiMFxe//mmmRrmO9aRROB3PFx5SWGVuYJko7OZ
	vOmf7aKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDPj-00000003odl-23qk;
	Sat, 15 Aug 2026 12:23:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDPb-00000003oVM-0YLo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 12:22:57 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4957952e0f8so1906345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 05:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796573; x=1787401373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=TirLXIkL7LnIScBUrSArng9CTkRR+rBC+k3EPl6uhAkoXN4Srlp+4dh6RCJxjKr8S8
         7oHpyjFTjvxVnG4Qr4TZCzvWtc3r7ijz5p9xMWHevoOfDxyaj+gJ91CyjAoQi5kLUitJ
         ISyQJfySEZQBQg/SZkuuE4Ac8Uz2BwEwJiIMyks4c83HJ3Y15rJ+g/u/hsYCrGxX6v7d
         R0ZHPXHrpznvFn9t5MvGaddeJ76ncgH+u3mXiCtWPogJvmZtc2CQiEKyglKhX2nqQYFQ
         WCXYVI4ZB4u8Qp7SjvfiPY2dxFM8MnUD7DWgg4yWyVVFDy/BRJNTbwmBXvFrEK/GzJgt
         5JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796573; x=1787401373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=P0PWWzZln+EtFvA63yPAzWX90alLvuwLGqVa4x7grEDA7su+a4tEIKWDyMTVHx/j2w
         jQuu+y6nLHH0YcfuCkqM8JYoymqGuwpKoG4oweVX74rIudC+88hjwcUCQOboR5yXBeaD
         ZgB415hHi2A1SgEwVmCqZVvbyST8fEEhteJebLFflgYjqkIZhttaCjRe5Chqm9xzJBme
         9BgtO8UTlRpqrOH7pBeb9cFx6wEt9zik1tWYRmEEak4IdFbT+8z0gFXK1dUHBbD+DRgg
         iTM8yA5r34zaFTX130J8ecNllFf4CFq3jPXSF0NtrrZAOYj+SFl6b8FKJWUFTYByO3Y6
         BfSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpH5OvTwC09B62N4GGtSYPMDN5BTgRX9h7WwZdh/jaNR7N+p0Wogtwk8KsJ8R3MOasHmLv47ghBWgkC8lOIcpx2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyj06JujaOa14KtwIfMuoqZOOG4lxCNoerrbqu6LHJnfc//j5id
	i873fZbsUA1/40HEkV9A0mwPRZSXIJa2AWWuYoT5nDCbny7aG8JpFV+q
X-Gm-Gg: AR+sD10NMEWiIC/rNWpLCtgnK1UhXfTMfCP9rhmwPJxfoZ1FwdWhIauDzjPEjpIPPoE
	RV52rkdrBrsS6XBFgrFwTU9zB2mfa8SzxeFh8OaPgigy/rkZ6HuSSv2+tk/swTbOCOpEYt8jpNn
	fZbJ6JluBBpXmkwuhFB2xLH/saeiSG6qDP0Kc9GJwceTYiIrv9H2zIlCpDQEsRM1lpJYX6z3PyS
	W/eDzdW6/7mHWlt5elEmYktCkAO6ab6ccWEZLbitGfC3SW5HOy2hPH0Ha7rkdMufGxxTz/mqvWo
	LwZjRdhPWGmv7GgcpEpesutVgUTM1wiCEn2iKdd/90LbFlb6o3WmRVwPD/1U4BegDXuqRm0r0Il
	gDMU9mstfIT6ZBHu6Qn253vvS1vnnrD6P4otCAY61X5Vi2ou6jmpzbFWuAoGD1njA0myuLGiKY0
	UO6eyhYC/TM3PBSthkjeiL4X0coLjWxA6s+ozRmsOb4Tn0MpTGbOKaEKGgUT5bjX9OEJxakwpdu
	RdQY1x1RX47QkmS3K5tTOLY5/HdK77MVwpEYzuZK+I3P6QPLqMkaFn7dUCWci0lHh0XZQ==
X-Received: by 2002:a05:6000:2585:b0:46f:7d90:8124 with SMTP id ffacd0b85a97d-481607738d1mr8826047f8f.2.1786796573266;
        Sat, 15 Aug 2026 05:22:53 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:52 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v14 31/38] usb: dwc3: rockchip: support PHY reset notifications
Date: Sat, 15 Aug 2026 14:22:34 +0200
Message-ID: <20260815122239.65405-4-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-31-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-31-b5ad9c68fa11@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_052255_184826_7372A653 
X-CRM114-Status: UNSURE (   6.02  )
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

Tested on Orange Pi 5 Plus (RK3588), 7.2.0-rc7 from rockchip-devel at
ea51774c5c42; details in my reply to the cover letter.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus

