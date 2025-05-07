Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA41CC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 07:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jIOpltPILeInSwqFzp6wxXo2CyfMdnE8s6AQHz0yqWI=; b=Zgo7hEei57GwLS
	TNc9GEsGQztkvkCbzdugd6sDDBe8/gfFAxFzUl+L9yPQaWBj+r7+Ir1CcbxKB4WrCq3tvGwZ2EIBC
	B0IkQyzhOuyM25Bz+7TooRWnQd0Z5nARLD1S5eompvgl64sWQKoiR2W3bZuX53YAu9Z4ZCOvSfSKH
	3PVwDg7DDenfHzm3MgXvXEYa87OouekrQxiaFEuE8jPiDAS89lZZtWe0di4Mvb7nhteGgopMW8Ccp
	HrKdWNAODniXRa5Yq7AqkW6pFri6DY3E9Afggm0kiffA4xzlt5XNzyGipbRIsPMUSozgD6VIX8sN9
	ldMO8X/xPcutA4jIDzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYnm-0000000ESGb-3czY;
	Wed, 07 May 2025 07:02:46 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYk0-0000000ERXd-2jVu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 06:58:53 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4774d68c670so110732511cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746601131; x=1747205931; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jIOpltPILeInSwqFzp6wxXo2CyfMdnE8s6AQHz0yqWI=;
        b=hk3lkI1iH6ehJK5EJBwA/aUcnwsvQdUHuC6ZfXp3r4hf71U5g6sM0g7BTGc+YChz1x
         kw5V5bZ8xf1njU7+bIxoHMrl1KDPUzHKi4U9Zgo6pe/xprUpYcuEKPW2ghwsyEB5WJ3R
         bgBnmVAoX8b8K+UgXHSiHXGgOy+LXkFRI3cUsvbDlF1+2+0nS5hJoQlhE4GhTX2Slfcv
         xY6epiG6cQf5vHqGwMaiVsGlKhywfSRlsYGtH4VtpDkUq4DTJCoCNMX5XgWL1R/QsIhH
         gg0KL2U+8tOr01N334XU+OHrk/w7NaXDFfQ6VPRFZ5VfjuzXbxxhLU/wLXVViVmkPBRe
         dLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601131; x=1747205931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jIOpltPILeInSwqFzp6wxXo2CyfMdnE8s6AQHz0yqWI=;
        b=wsygyDSsIiw2pguZSd0b8D6CRgyG7u0zOn3ft5l0esDAFPaoNGLuL3D0U01TLSU9n1
         1eOiQMawQsmFCzUsZsZWfIwCbmKYVi9QhjKMMg4z1xaU9PsoPFC02tVT/vU9+z5JNjOH
         H0SwFh2EYKTQgXwjeztziozO5vrPCIYDTS3WVLfB6kqPscPXBCFab/VHCK4KqDgS+FaP
         +wTigfqpxTPxQyIYg7DWKqzG3d3Glg32nSZci0idEYVf/cHLEuZzu2JwZIlg6F0GxZ/h
         vnBIMTnZ8aU/lksLmWU1jc/oGwxRcVfpG/oLUZ/Rqlx7lydm0PpAWcDGQY9YdEM/jz7m
         kNKw==
X-Gm-Message-State: AOJu0YwYsP0TFILCAWpTa+qVIfaXwG3ESy/n05bGYv+RL9YLZBFrbiJ0
	qJ21bn1w66QSATeI8A3VLDDxtBzY6X4mX6lp1rC+M9ujgwhMGW8/RghEVrDDqjNgrg==
X-Gm-Gg: ASbGncscr+e+H0+g6//0+h29DxMlDQXiEl9KEt+3n+JGpepG1Ub8c7wMtspgvuo5Zxt
	IG+mU9Jaj3D2m2dBgdNRQxa5ptb6JOTvB4weHO3W3MxyNalUf3KxibDXXLGFDHYn3DxQ/DzisuO
	+vZeTqD308C+Xmse5J/s5mQbSJeiP6wkbxS7dcDsUyGyv7nvg3UcpCaz2MAdexi/mqfAWuNNG2y
	+Z//GQMfDshF3GyvIS1VTzkAO6Oi9YGnnTj7DPv4VM9/xmPObaTazMuL8Leucjx32IHACM702jd
	/MGQGZKb1Behp+v2Kf8l2Ac4txmthtRRP3s4+rZl8m3Cqc6AknAd
X-Google-Smtp-Source: AGHT+IEuH9gQXJVdRcbH2dTIbJ9oZxHTm9KD4cWN5untak0N55vRPUL7OXKYZ7KaeTcHEvqoW9uAlQ==
X-Received: by 2002:a17:90b:3945:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-30aac179364mr3888974a91.7.1746601120438;
        Tue, 06 May 2025 23:58:40 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aae525db4sm1315529a91.22.2025.05.06.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 23:58:40 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Wed, 07 May 2025 10:58:29 +0400
Message-Id: <20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJUEG2gC/22NywrCMBBFf6XM2pFpbBNx5X9IF7GZtgP2QRKDU
 vrvxoI7l+fAPXeFwF44wKVYwXOSIPOUQR0KaAc79YziMoMiVVNNGlM810QYZWSPz8XZyAGrypJ
 TqnVGEeTp4rmT1569NZkHCXH27/0llV/7C5r/wVQiob4b3ZnuVJHV13608ji28wjNtm0ftmOkx
 rgAAAA=
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746601114; l=2013;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=CJdFR5JtlDtikPD4OrMiZayMUaCskl6VAbLParxDykI=;
 b=vn6WIN2+S1/nDLbOVRpn67Dhf7fJCqQf3bu10iaHHYgZ2sWifYO/4cVgZ8GSSBKZWPk7w8dAq
 hgW+lOK4owGBqom9MxYcnK3dDD12j+gr5i56ZVJq2sGzhAr4Fmoi2M7
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_235852_697095_53A5B46D 
X-CRM114-Status: GOOD (  11.45  )
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

Add named defines for all registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Included the previously reviewed binding change that is directly related
  to this series as the first patch here (thanks Krzysztof)
- Created a separate config symbol for the watchdog function to let users
  build a kernel without forcing watchdog functionality upon them
  (thanks Krzysztof)
- Link to the previous binding submission: https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com/
- Link to v1: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com

---
Alexey Charkov (4):
      dt-bindings: timer: via,vt8500-timer: Convert to YAML
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Add watchdog functionality
      ARM: dts: vt8500: list all four timer interrupts

 .../devicetree/bindings/timer/via,vt8500-timer.txt |  15 ---
 .../bindings/timer/via,vt8500-timer.yaml           |  51 +++++++++
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/vt8500/vt8500.dtsi               |   2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi               |   2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi               |   2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi               |   2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi               |   2 +-
 drivers/clocksource/Kconfig                        |  11 ++
 drivers/clocksource/timer-vt8500.c                 | 118 ++++++++++++++++-----
 10 files changed, 162 insertions(+), 44 deletions(-)
---
base-commit: 0a00723f4c2d0b273edd0737f236f103164a08eb
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


