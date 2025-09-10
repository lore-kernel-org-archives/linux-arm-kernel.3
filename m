Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8793FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZVm/deDTR4I7zgxqPdQwaIpbJb7N4tc5cNwrlaMAz50=; b=wKKQoDwe9m7MFU
	+2n+IQB+J43LReb9V7Nw3PEkzA30CGaTheGEFfHj1UjAXuhARMDe64lSsIDWYR/4IKa2o6jyd8s7H
	nTgAmjT8I5DPA6C95J13FHcD0y/AbW1djevn0kJEk01viVoql99/4eVg3PUqVCDcclnHhSgrgZUf/
	Aohcji2z5WoSOcF4OOmBS1w5yui9txktf1x9vyPwAtdw1Ivz91QQ53TWFKbyeZq5ZHFOsDXe7/gT9
	GGpmRvV0+n+MWtFc8zHM4cp2OwJfVv1fJEwasrkcLmnXCPygYpV+2CL6Cf49CTnod4BtYM1aDZmnC
	WkO1/i6tTmYCfXjYfWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFrp-0000000Cn2n-31tg;
	Wed, 10 Sep 2025 08:07:49 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFrm-0000000Cn1c-2O56
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:07:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45df7dc034cso3877825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 01:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757491665; x=1758096465; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVm/deDTR4I7zgxqPdQwaIpbJb7N4tc5cNwrlaMAz50=;
        b=FpVs+XuUHDmrq7vhMGhYO+mki7zqcOlfIrNNvdYIVP9ZpfJam8a8DYyueyU2WuKGgC
         pz+LHrF6/5X/YMDawdSRncUFwmQFTGbx7WUWcTe0mFm6v9FCjBFgwHY+6q6e/Doe8fTF
         2b+Ft8GG08xvLySecwUoA/FtNiHBAszHAtbnDUkY4cySB2Gy7hGy3esWJfldWW5+DTVp
         hJ6I5G9N5T9szOkUzIAvmqy8lY4oXMoxMNw2Rz+mr8Op3f3VSynAkmu42P8uDyOLIRTE
         VXh1JyJia9I6ZJ6ixFSMtWcZCJI+9uKj4osWV97geIXcnuXkNynKsrk3ON1rJdlVs7mS
         okXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491665; x=1758096465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVm/deDTR4I7zgxqPdQwaIpbJb7N4tc5cNwrlaMAz50=;
        b=EaD4ZndzJzitVR0xUeps++aDIOr6IEs1hS0gTG8BfridGvOp3szMcr/QJujhL0cW90
         NRaS8q4MwWw6gN0otXdr844+ct/yG6nWIf0VmV5KYil3//eo2L1G1JNhUXLPQf8+ejMJ
         Cbsa1G3P/Z8Pb05UFUrAplfQSk4DJLW43tTrniv5uUkr27bAmELRz97sVBOWhrYGFU2v
         c4NT1OhJiHpkeBtH1zw5Ilrbhct1vn/S/KThYQBBItE8Udfwn1q8hIDpiS/d3KOQDp3/
         Z6tWUwrrSC8M4r2w6kYrg8YOYMoOLimcEnvotHsXrMDwwhAgox3LzUv4QHTlx+j9demr
         zchQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5Gt89V4Y5QYAHT9itAhzI+qA/XQTNEq+QQQFbXsqVhFVQ+Op+c4CQyM3WNM3Y9mgBFP8Or+ASzM/i4KBz2F/p@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ3suKB5XwV7WQTbA6e0X97DiQuo1i/nTwkZ5HaArJCMHapGq1
	m5Xnt1tQUENuYMOdMPyU/+clBngDOd4CpTHUuVgA3oYs/4c5u/y3RAIhqK1oFb/aYSc=
X-Gm-Gg: ASbGncs+rcWz+Wj/U5UdvNwTk+kTv1G8PPgnsvCh0chXc1UBl4n9X4CiXY4Md5pMzew
	xThBf4v7YQqE+ngMvVFjMXKoxspPcgXnDkZnOa5wQ601WF5swZ5jR9ay7lMyR5mUvN01oaeGZud
	E9vY2YAVh4ZDTDDCHjYJTiALxelQEreaykNxYw1PnBpzj6Zbi46Ldn1OaEdEZoxB5U0NH6Bb0Fd
	itgq6R0DXxhNNImeExR9+DbgNITbdp+kiUwASJ3e+BJYo3Y8rikZsTDDEk+Dv3wfGUBRk1gAMfE
	TNkWz38nM9cEqdAlCqUN9I886F1omkgqTJDJ2s9gocxhI2EM9lkU17+1Hby2eNrwQzA/Dvlq6tc
	Qy256EjnQXdxmcw9QomtMX5iD7BDf
X-Google-Smtp-Source: AGHT+IFBs8UXGxgkaSg80fNb2XLa7R8prdLQ6TRj1KMntX+P6s5LJFVMk2sAxSEGFFCGhjD2XvI0jw==
X-Received: by 2002:a05:600c:5493:b0:45d:98be:ee9e with SMTP id 5b1f17b1804b1-45ddde6a3f0mr115055345e9.1.1757491663893;
        Wed, 10 Sep 2025 01:07:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8247cc6sm17813605e9.12.2025.09.10.01.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:07:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/9] net: stmmac: qcom-ethqos: add support for SCMI power
 domains
Date: Wed, 10 Sep 2025 10:07:37 +0200
Message-Id: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMkxwWgC/x3MMQqAMAxA0auUzAZqNCpeRRxKjZpBrS2IIN7d4
 viG/x9IElUS9OaBKJcmPfaMsjDgV7cvgjplA1li29oaT39smFxHzAFlcx67urFUsfNcEuQuRJn
 1/p/D+L4fffhoTmMAAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1820;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=dSk6AGhrmnQiBMVkm4iUfkoi5uR3VSQpSwlqk/H1gAg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowTHMa0WXc9aZw47LWizXetwGI4lOfCYN4Ubg/
 S0JYjTkmO2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMExzAAKCRARpy6gFHHX
 cuN7EACjo0XR4wFpMDKfJ5JkLwH6gCaoqJ2aZHjkmrd16YbueY63wBPoyxG9WXQv0Pf1CaStyXl
 EgOiXcb0+VDPxR3B91vaK9IMbRiGNPYTMQdKA4yfwEsQE5v4Zkad+jyKkw/LKTklVjgk7SLWsCF
 GdZDPsOv3Ql1EjwsdolRyF+lV1G97YwOrgnh5I8Xcpdj5FZ7cdPyaG0jX2D0mAjUHLn5qQjeuaY
 LF1eOrWKp+jEO7c72nmCpUYiSoOYfms0RZf0ehpTDsivB6ZjRpE3ovGKQc818SKermDhNho1jhk
 J0up1Qexbsfn2ijnAtEPz6n01wuFc6kr24DVj4bwvM+X1GwezbR3Ta86Pb5T7CQdkiSCOUwhZX/
 c73JWNRheNuYte3uRpGaDwLHAKPfZfMAMIUFXN5yGUUCQbCcIYEu1DQbgv/SPE8sef+5v9zE1xN
 lngurd+guGXjCYXBBp2iLx6LL2WDHR5oe6FmXMbwo/3J4/+790ec4uy/xAPpVJiGZ26dnu8MNd3
 PrJgMyP8CUQLYrX6pDmy2ZcoXy0B2DR1cVZBsN+nFarBqZpwS/8F6dO2UkWhs5tun5ukzTs77mY
 j+/QSI9gT93gh018RqOXMK8DG+UWcl6UZ7cK69n4R/hqhgpU1szBSSzLSDOco8Hxfi8He9Lvjzb
 TCgZ4/r96lqxrVQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_010746_628009_F0B27390 
X-CRM114-Status: GOOD (  12.37  )
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

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings, new DTS
nodes and driver changes required to support the MAC in the STMMAC
driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (9):
      arm64: dts: qcom: sa8255: add ethernet nodes
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: improve typing in devres callback
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 ++++++
 .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts          | 201 ++++++++++++
 arch/arm64/boot/dts/qcom/sa8255p.dtsi              |  44 +++
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 345 +++++++++++++++++----
 7 files changed, 633 insertions(+), 65 deletions(-)
---
base-commit: b6a291a76ecaef3b49d8a9760865abb3d8480dff
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


