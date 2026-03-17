Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCD4FB5EAD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5F9q2Ra06tznmx/F5pEf3aEAtRQ3mACpkv9NtbBna50=; b=lZXEcVbRvzzp0q7517x5JkGDrv
	EAEZJFmzwjIl2NmHVAaqZcKA3IxRDipLSBDTHipp0NNTV5J+THTP3f+TdXANrYyi+l6JxB0GC+Z1u
	3YuTko8BvoFCqDfbY/N7wa3lGZ3S8+BGBZfC46oZjQB8TnIvA3mQySVOFY5rLP8YAIflm0FQPVP+1
	FbgOzi8bj1Nlc2aa6fKbx/PeA487f1b8Ghx74LtPMoKScpU25pot2pA+R6y98/EBQTmnphPPoiQ4m
	RlpK+85dJlgYlzI/Qp6hWggW7A0scvdASN3Hv2jkEmvQZmdknJMbdvkBmhTf8zqrSWRadN9vfugLt
	ysJ+bdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Vaq-00000006dVG-2RmR;
	Tue, 17 Mar 2026 14:40:24 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Van-00000006dTS-0JjO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:40:23 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-666ee394529so2225351a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758419; x=1774363219; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5F9q2Ra06tznmx/F5pEf3aEAtRQ3mACpkv9NtbBna50=;
        b=y/i3TW5LWvCcpBi2U4lpCfWSiuSZuiSpQvVo4Tlm3NjbJQr8cxMtvYdbiUnZCc6h14
         L3VAM/ndGzYZoSg1io9iSI3I9CSqErBljsq9QFDjgH720LpJ5Ey+czbBYEYhnuU0q6C4
         7S7lT5eiOxsNHzyTHrGBRPK97Aqyit+HEb661nXFCxvZJRH25ZKGMoyFzwO+jfS4xhIB
         9PXGa/4tXxkFHAWMZnmSNEchHmg0YNHsYsDzeA2YB/KvXIRsDNiQHRQikwWAjpuBy850
         xquNQRRXoozGkQ8QdHwHLeNfz83J52qCNshAJQQ3Ssqd488DyPfiZjuF+0dhzECoCltG
         IUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758419; x=1774363219;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5F9q2Ra06tznmx/F5pEf3aEAtRQ3mACpkv9NtbBna50=;
        b=hajjFi93HRDAthFPbg3ULHbJiGqsCP7pNybCwO3nkmBQR6msEJ7UAHdNUkiLxUUUFX
         /0UPhZDGUBMI4u7nxcDRVNlJbPXQ3abCEpUMrybD2vOKEo6Lt2//WBRXiCtFVo5WkD2P
         Hgg5pJ8DXx/ysafCzJdGz3TZOYNgpF+yM1/EralmhG3pDpqZ5VAoB/EGjCAB1BsLN488
         M0c7WUrA4yL2bq3rQo9Ctu7eCQU3DQYNBrQuvfddbkGPI2jEBIBwQmUEPH0XGYndZC/r
         D2N5Y04PXOudponsgOZ9WDZIGSdn3ReM9knOBceELN50+fE4bxfzNdu/ER2KE6rr7SfS
         yJug==
X-Forwarded-Encrypted: i=1; AJvYcCUf/NzmY8PNyCP2jV4EwGg48D1QqpCMF/f/ogRj4n1K8M3RjZumt3hZQbLF18g1x3gk8ySX58zMxHMdDZs9hlgb@lists.infradead.org
X-Gm-Message-State: AOJu0YyDPhIDIbKzTnUfQy+d7Vjkjt2hebhopqCty1T4nOo7uOGnPkSX
	NZmBUEHe4bb9yB3grYAuqDdaPfV4s+m+Kl2ynFKm6mLClVAQvzQStKyuo6AhDowg0MM=
X-Gm-Gg: ATEYQzyqC4ffBDtuH/rEZN6ppkoYo4cA3xy8zrzHziM19kLOChQrAQyIPLumAm1PBtq
	0GRQlhro4N2pOR4YKGxFZNr2Ty/4hS58m7vKC81wEkbDeqQK2/2Zf+BhwBZi8IAX88rCXAGjhfA
	yYM7ZU6mZ6mSqIH+yNdq9r5Iv3z/yg7/HuozJ3aj39/glcUBW1OhdszFSZ01QgiAi5eyBT7Bkcm
	/hyVjjG4X+Dybij1MG6sVtKs/GTJgqCRDQyT7c43zCuru1zDYI+MZWGwZ7coMKCnP4kJyaNw0O7
	p9tOxZa96tR3EchbHRl6td0khN7p8x68/GRU4MLPH9xPL/bTZlk5z0H5PifkePg6/BuQ3cTLFbo
	afQ7IhJCJCw6RbhPgPSwyy3kkENfB4wcC4MiXBo+PPrtVVil2tsQuhWuVZJVgesQNKa4iU0VcSe
	JF3PsJxJEX6426HIyxFDhMuz/mZZZY
X-Received: by 2002:a17:907:1b16:b0:b97:a1ca:e100 with SMTP id a640c23a62f3a-b97a1cb2212mr737298266b.32.1773758418455;
        Tue, 17 Mar 2026 07:40:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf380f2sm755059366b.53.2026.03.17.07.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:17 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.og>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 0/7] gpio: add pinctrl based generic gpio driver
Message-ID: <cover.1773757772.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_074021_145416_91EF04C8 
X-CRM114-Status: GOOD (  10.86  )
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

This basically abandons my earlier attempts and goes back to Takahiro
Akashi's driver.  Here is the link to Takahiro's patchset:

https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linaro.org/

v4: Addressed Andy's comments about kernel-doc
    Addressed Rob's comments on the spec file
v3: Forward ported Takahiro's patches and added some fixes ups to make
    it work on current kernels.

AKASHI Takahiro (3):
  pinctrl: introduce pinctrl_gpio_get_config()
  dt-bindings: gpio: Add bindings for pinctrl based generic gpio driver
  gpio: add pinctrl based generic gpio driver

Dan Carpenter (4):
  pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
  arm_scmi: pinctrl: allow PINCTRL_REQUEST to return EOPNOTSUPP

 .../bindings/gpio/pin-control-gpio.yaml       |  59 +++++++++
 drivers/firmware/arm_scmi/pinctrl.c           |   2 +
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-by-pinctrl.c                | 124 ++++++++++++++++++
 drivers/pinctrl/core.c                        |  31 +++++
 drivers/pinctrl/pinctrl-scmi.c                |  46 +++++--
 include/linux/pinctrl/consumer.h              |   9 ++
 8 files changed, 266 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.51.0


