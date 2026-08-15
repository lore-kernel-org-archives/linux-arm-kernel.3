Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46086C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 12:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=; b=tX60soQ5Oy2vLZ6Qz6QHZYlROW
	G6I7GMuwMWUGj3WDtrLt3g8Pblid5SMlnTiiqtp1kfgrr/avKy8+eL/M+3Md7AQSHR3RyYDi3UIYZ
	+h8Zg2t8cMtt6TUSVZeI7lM7+fnWbybwO89fitwokw0REmZFI9gCRbfnldrflFTtupmukYXYGksui
	z/XRAovyjV53wf5U8z00kfr/9QfpF111K8UhW0s+RXiNJHGtX3Lg9L+y9zatLXSVVVOK6Z2lIiy9N
	yKThUeloFBcmbLxerSCBj3OSiST/sEHIAnkQjQIWnG2LmAF98lbZYwZMT4hafXXP/oUuTOR73hFW3
	pV37gs8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDPe-00000003oXU-0HII;
	Sat, 15 Aug 2026 12:22:58 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDPX-00000003oSf-3HMb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 12:22:52 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4956d1d9fb2so2634825e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796570; x=1787401370; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=NiqxqjXGFjmfvb6j4DVCwcOlyNHkI4Fceni/OlgHQyWmP1MrvnByXzNz2SvpB+TV15
         8fr9rzvaBxIplq2CJ2F6BdJNp8ZKrDd0ieDmgkmC5aemFqjiU6GuC1rOts34PnIFpW2E
         PlmUhK2vZgTrzgeyscm5i7Ocz5g/X1l4Pw27uFeBMT6qcgiPwyQoAZUGjyCoRTigU92h
         nNG3FEKnLMnu1dxrlBeYURU2Xu3sTZ7Q3YHFw/TldhFmhEEYwn7owolF31fynv6koBKT
         0Z1KTyhkfeWDHge5+UNm1YkJAlpfRqPafCx6ymI7/Bn88+ZJAhP+RSxzcLL2mv9phRV+
         qkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796570; x=1787401370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=V7LnsJQW/+B4TeG/UaKjDuounZ0bdcbh+tk8196igm4hpBTLqG0eVLXzdXQgi5gW59
         cmLRbmzOi1ODx82JeDPoMtomlcBwZhELI9STi4SgjcCsFzJOP6uYGbfPgE3RTKBZCmjW
         KqOldcV/e8rD85JI2oqdUCagInWxvPd10qLZYeZZ8JG8wuc0v4cMhM2cCU+03QAgUS9l
         3Ba0RoNNg6625kMCt9qgsmluoay6x1BPnUrv9w/6/YWcfdXks6ahuNoW1PaEhnVwzzsR
         KYNFfPeJj1TpqT3PaZ77IpjRdBhYdkz9KDRz/wbi5UN0fd4yIJTYjgjPm5b3rVYQw/8l
         DS3A==
X-Forwarded-Encrypted: i=1; AHgh+RoPVOYVH1Sukz98JyZlOZ93RaJfSEdkooXcnWnDd+jnKsimLmZqMFJLr+GeKofIna0WnRGzMzjgAoAtWGDy5IaM@lists.infradead.org
X-Gm-Message-State: AOJu0YztJLVYcGcExwSjHZM2taj3rwJHQLY4wm2Pe1ld9ejtP/OVo+ms
	ugt/Hz8Uh4bzeTDdrVRyD39N1odZ3cd5j2MdJyPsf2B/aaZato/nbyNJ
X-Gm-Gg: AR+sD12/w+xAEd+518oycutGXoKPPF2RS6nq/6fD4T9UAooGHs8iiOHBR0UMLvoN9yh
	XfTc0SFzVgvQJ7zVxdz7p0TrfElRghvTYGXbwp9WMVHHk261hcfj0l5CrPLn1eF5x+G4lwjZh36
	scVQkmxmu0MVIkZFD8FXmfych+IrKSzGgjnvjadq3TJvc90wnu3O+e2FNb2Z5BqS68XuUCzl1Fl
	sh+mEmf5WUsuxJ/kNqvu+Umiv9QbovOtH3iYs1qAzuyD1KaAtaT/sFjV+td+tM8wx6M5RVCQaf5
	7Jv0+8viSp0Ka5YPkHDcasP0Xgfa1ZD1jQt5IPye3K1T/NjVKloAhmZVgL1KqEguCOE+/LNZ5xD
	gt8LJEWI4TAIzUND4uml9LpSc84tPBlhMeMEyagQs0WT3GfHUUO+gGMzOpDT2q19TgIucJJqI4J
	xrYCMb17GDMNGu7HKrrTSPqJY10YCYWhDCit4P10e/RE3pgZt4pNiGuH3KDYeIBfSSfydT/O8PE
	MvPA82szXMoCKEldAPx+Cy8Y7m0d6uNnCVdrxaXRFIitKU6zNDPoft9WRUvCpP10QxWJQ==
X-Received: by 2002:a05:600c:a47:b0:496:bbce:ef with SMTP id 5b1f17b1804b1-4998796ca48mr90983305e9.3.1786796569782;
        Sat, 15 Aug 2026 05:22:49 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:49 -0700 (PDT)
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
Subject: Re: [PATCH v14 29/38] usb: dwc3: rockchip: introduce glue driver
Date: Sat, 15 Aug 2026 14:22:32 +0200
Message-ID: <20260815122239.65405-2-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-29-b5ad9c68fa11@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_052251_849161_922FCAC9 
X-CRM114-Status: UNSURE (   5.94  )
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

