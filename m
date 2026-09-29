Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BC9CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pnfU324HArntK/V5m555W6h2CudfIeZPIQ4Ghrx/YkA=; b=jHE70yL2Nl7jsiM3LdU7eT7O3F
	wwl68XFHBV/RzK7yTXlUk+4Ham3e0ntGXK3z+6bWDbVBwKaOut0yFhHkRsRTBiI6KnELhB7KYzzjP
	8pxokgB59zxuIOSsuRJ+o4P7ZepKWXRKfNMouhbB8xsWKHCXcGhbcTZslJiPiUgvMwMymaCMXPKkp
	LkK2+NzBZkojtB+dB/PKlNVsp2mHSe6XV4hZrV/GkmeYCOMBNpIhlXBFpdI4aE68FnNdVZ9u9KiTB
	CtNBEY1rZf7dab8cn6/MxL+KUMQrZp8O6VpE9LA7a5+3EE8uCg90Dt3ahxKW7dAfDgHTMXjAh8OPC
	c4mFMF5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXPo-00000003brZ-2eIW;
	Tue, 29 Sep 2026 12:58:36 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXPm-00000003bpu-1XFR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:58:35 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ffe817151so16287465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790686712; x=1791291512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnfU324HArntK/V5m555W6h2CudfIeZPIQ4Ghrx/YkA=;
        b=AZttZKw0fMj6Ss45OTIoc1DtRefeMGW2XXtFyaEFN+WjnSmVw/jBD+rLp4K4Q+rU+g
         GdwNvbv5MyJ+nA+mzG1ffFNudNNotXjEQ5axiLDWUjpJ95qb2s6d+8mPPZ3m51LteMjo
         MqaCi0x/ynvenU0Xqf2KnqS8lLr4m8RwPTsdr19M0RTpPuUq5/mzJHnqwMP+j9T/YL3P
         //ieSubV21Q9IdB/IFmnSOIN35htjBAR9c8IQTCFJGmjTtKyoiqKQbNpM9gPuM8fTV6p
         Wai3cFJNxUeNYv7vIdCy3GR3BZOOSpg6nOI2OmwZbT5rclsNCQxSgf1SYoVnErzKmdZT
         EeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686712; x=1791291512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pnfU324HArntK/V5m555W6h2CudfIeZPIQ4Ghrx/YkA=;
        b=r9n4GBk5re08UJ+cCZGJjn/WdptglUnM266SkiwgcpNe94n/kblgsGsqLhkK4EE6s5
         DI4erJYZtTSPyw0+MDLMBPucvKYuB/T+b+i/NjIwokWZUbhOGW8pP5QLBnbRSTJoVocB
         J4cmK623EqaJpNDF1E0lWQL9jFgGTbmi+7HYPskx064X8m2qLJhgwaHbFfmxZqAEfmSg
         UkPId/RImtmojkYvnLPomXthATXP6s48XcvyH2SBIpF9hFnVWbvZSJhWt0jWB/ZtrAJ8
         pRBqnipaTn9qYFAY1E4nikjQmXSGPVJVgNzzVLyceDmn9X2nAcQ7QsLdf1dEpau66HNz
         DDyQ==
X-Forwarded-Encrypted: i=1; AKwUvBztRMfKM7E8IGtm2sLbqJJDcpozEw70CeqxBlNkzHSRPgiX1PSu2udx+PG9sQgO6Sr7fMVprcR7RwjW62ErnkdS@lists.infradead.org
X-Gm-Message-State: AFuF++kH7mfh/L59ziNtRthSr6VIGfpLBXbot6huUEOKS6/89zAN5QUj
	C3fKtsThrriobHfaYvNL0kuzDsKit4b2HB1tSZoh/4/sSg/Z9mq/iApQMbySt6Kzhbk=
X-Gm-Gg: AYBFou35BXmitgo3+hgxpM5XLpZ9No0scAVvRXtJqQJdUoG0UjzKa2Xl+tA/Dkr42rm
	cuqsHOngiP0BCgRB/AbhZ5B2tbK15PYAGUUnTcomQT24OEK43baenPDvglcn2HvCo8v2lwYWs/+
	hIqgaNpBB/RYmHMO8H2gpEKJXzs6c/rLnZ9nEjw156H4MW1X/XzyTltHEVWD5whyEgix5heA6KL
	7Kl3e068h8wxpqAiNt+StT9tECUviIa5zjAS5aWFo3XO5evKcamWLqoUBW8dW81ZsYwghlw/kRW
	JZ80a1+FDtdCD/yweOS8mfeuxCf8eCLF+9h3GGhrmS4erM+cZ7uSh9IUkdxeblGzkJIgD7L6ffd
	KyVrV4RBX2pByYpHRQktJTHnIAKGsfyJHGBB+SEBi5dJTJkRcre6OoMDvHM1DIZFokPOF05GXzY
	k4DGdKe5/pycAzTl5spszim2B3w3cuce+RVx8cN6iGTnD50nyLc4A4wDTDd0ybukCBPNLfqN8=
X-Received: by 2002:a05:600c:1d19:b0:49f:e427:e88f with SMTP id 5b1f17b1804b1-49fe66f1486mr272629675e9.21.1790686712414;
        Tue, 29 Sep 2026 05:58:32 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50a65f4sm3682296f8f.35.2026.09.29.05.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:58:31 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v12 0/2] Add RP1 PWM controller support
Date: Tue, 29 Sep 2026 15:02:10 +0200
Message-ID: <cover.1790686331.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_055834_423896_19CC87FD 
X-CRM114-Status: GOOD (  18.37  )
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

This patchset adds support for the PWM controller found on the
Raspberry Pi RP1 southbridge. This is necessary to operate the
cooling fan connected to one of the PWM channels.

The tachometer pin for the fan speed is managed by the firmware 
running on the RP1's M-core. It uses the PHASE2 register
to report the RPM, which will be exported by this driver via
a function. A subsequent patch will add the function to read the
speed to this driver and a new device and driver to read the RPM
and export this value via hwmon.
 
Subsequent patches will also add the CPU thermal zone, which
acts as a consumer of the PWM device.

Best regards,
Andrea


CHANGES in V12:

- added a comment to better explain why we don't need to save and
  restore config registers upon suspend/resume, hopefully Sashiko
  will stop complaining about that.
- the RMW access to teh global control register is not synchronized
  via spinlock.
- patch 3 from previous release:
  "arm64: dts: broadcom: rpi-5: Add RP1 PWM node"
  has been dropped from this patchset since it's already applied
  to Florian's devicetre-arm64/next branch.

Link to V11:
https://lore.kernel.org/all/cover.1790606188.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 drivers/pwm/Kconfig                           |   7 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 428 ++++++++++++++++++
 4 files changed, 502 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


