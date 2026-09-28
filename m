Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E9FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CYnbwqydTxC4isV4u5FZ/6TQfllzQH22GNqJnusLCoQ=; b=iQIQLJ+MCUy0waWJnWSulU/xgQ
	qXJTe1kglb6eAMcIw+xzshb0TOLi8cU6YTomDgZpfpY19Qqtig50zbvrflippjTbU9mhVucs+IpBB
	4bsvpvwbAYSlrgvJcV8WnWUsMsGb/XsggD1VrTBx0SX4HKexuQP5kKwy7UeIDLRrs1UXSer0Bp0rR
	Y2jNNZAe8jL4bVSeN/O5ipuPtmvujA61Q9tg7L/L0XEnPfgYBtYEoooJg9l3STzwcOiQQ3RXC0XS7
	Hkv9bpLJgDCIjLUOtRK/xF0Q6VhShgG77q20zXiULDRpEgynuPlwdIS/O7q1N457YENbdPduSdUTb
	LMWZxbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBpO-00000000iQu-1KR8;
	Mon, 28 Sep 2026 13:55:34 +0000
Received: from mail-ej2-x0e.google.com ([2a00:1450:4864:34::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBpJ-00000000iNS-3yJB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 13:55:33 +0000
Received: by mail-ej2-x0e.google.com with SMTP id a640c23a62f3a-c2c570a3030so237257666b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 06:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790603727; x=1791208527; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYnbwqydTxC4isV4u5FZ/6TQfllzQH22GNqJnusLCoQ=;
        b=Lw1w48lBGD/b+E58B1GpXQrd8yK5wIZRFxgaGnDiu8X7AN7r0mrCuf+tHOAJwsiJTY
         KEGd7DyDa5z2KGbfyehLQhyfqh3TqLrEKyHG3MSAe2m37uR7m5jdoe7D/WHRo0jEtrrY
         QApuhdryjmT6x4xpxhnGJDyCAAHCAqIPkvQfcPBrLsoi0qsEicr+OzqEzB3fjl+kAEv+
         /nUfoCw/LcClLGMJYjvpWxh9uU0SduUoSkEd2VdP6AqLNgICOYOlIbIjV4sfbszbQW97
         lf6Dl2JAvfzk77z7rLeUx712utPoDRJttcaMg2TSdLiztL7X4cLqlSe/8W2ZgfA1MWky
         dwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603727; x=1791208527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CYnbwqydTxC4isV4u5FZ/6TQfllzQH22GNqJnusLCoQ=;
        b=SCx0/Ojw58/va6c5xJdqP5Bz+jZ+HtPsNbryEcoDSVEU6ml3fzPGAc45kYBaFQBsz2
         eq7r2vo3i7nhR2dATHR6VWvWytEqzvGhQ/myHSNTCU+qM24kUPQl3mY5puIqdf5xKXD0
         vS1JUcb+08+MwGFFJP3hUzxAvH3YN6a4vFFb7O7gzPhc5z/2YJF/5/ZOkiiWS0G0vHoe
         ZB6ZxPcoMDyTf3YmYAjhfTb9fWqjsPLdOiRN5n3OanfLuRylo4MlJ/MXOYZbKzccPB8l
         5hi15cKLp3odDiXzzgm6r96d7acSO5d4eECn2x5suy+b4se1zRhm6ppABdIJFa+TquHD
         iwjw==
X-Forwarded-Encrypted: i=1; AKwUvBwEy7MGDSHlMFBMvEAF6RuRgjvi99QtM/JbNLjVgZrqJiBmskWqcz2ZbiPqo4ZBVIdcN/G/U/wgRyVMBtGu3iEy@lists.infradead.org
X-Gm-Message-State: AFuF++m1MTUxeol6Yf3YJRgXF2zDagAIz6p/ZDvfB7tAVtJQQuzFUFtS
	+jtwIVBHXuG40FjceIMMdt6jswIviCUcwQD1hY803ngHctKdeU4q2jb7ERHcyl4ElPw=
X-Gm-Gg: AYBFou2R+SBoJYow7c2cDVv3O7VKgXwAJJm4MDteORVzGVTJBbjNl+o/Jt1TAmkDzYF
	My4rX/j6b5YjcxP5tWCb4sM3/PkiqUnUfRkWdVmA50Stq5ZaA7+5Y0WvVS8SKhQtBbcyOBZ4STm
	L2acOP4YRM6KX4uGqlSP9e6HaQbxC4Ns5yVp8p2Mxerz8mJ7n30cc2HRul7+AY+fqrnhcQlHf4I
	DAGyow5rTWK94oJGOicOqTV2k26hyBNQHrHkxilmDZBOXlnoWRtH+gMU+6QqF3nZn+FWtIk5DFq
	Ia3UYWdvGgYN1GujbJEXFnZpBpfh6HWrpOh+SsITGcujXNwzKoM8cvQOCnfx0Sjg4yh0RwX3rrV
	UElRK+De9mEWfVQM2lxdTyUTcNVKC1TdD/2FK/yXfc0TtCH1mZc2Afolgfogr2HGLGYdQhh/R5d
	/cI+Dop+JBIJWc50K08t7Z0K2QzWb+P8B/PVRsvNb0/PoXyL5NDsM+qRj1IAeDs7ldFFP0Ow==
X-Received: by 2002:a17:907:9689:b0:c26:19de:9ae1 with SMTP id a640c23a62f3a-c2ac25ec42amr1055522866b.32.1790603727000;
        Mon, 28 Sep 2026 06:55:27 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2afe8dbcf5sm366494066b.53.2026.09.28.06.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:55:25 -0700 (PDT)
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
Subject: [PATCH v10 0/3] Add RP1 PWM controller support
Date: Mon, 28 Sep 2026 15:58:59 +0200
Message-ID: <cover.1790603500.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_065530_014593_E26C25F1 
X-CRM114-Status: GOOD (  19.20  )
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


CHANGES in V10:

- regmap reworked in favor of writel/readl, since no syscon is needed
  anymore.
- removed the read_tachometer function, it will be reintroduced again
  if a future patchset dealing also with the consumer driver. As a
  result, get rid of the common header file with the function prototype.
- dropped the mutex and locking mechanism since it's no longer needed.
- Makefile: removed dependency from REGMAP_MMIO

Link to V9:
https://lore.kernel.org/all/cover.1789724999.git.andrea.porta@suse.com/


Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

Stanimir Varbanov (1):
  arm64: dts: broadcom: rpi-5: Add RP1 PWM node

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 .../boot/dts/broadcom/bcm2712-rpi-5-b.dts     |  12 +
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi  |   9 +
 drivers/pwm/Kconfig                           |   7 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 417 ++++++++++++++++++
 6 files changed, 512 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c

-- 
2.35.3


