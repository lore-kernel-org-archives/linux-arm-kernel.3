Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E467DD277C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 01:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7DHIbUC9kH5ID0D9IUKqXIWIzs+CamKmp3PsS5mVQKg=; b=jwd11JJKA1mET5wGAsvhfEHnOH
	pk90/fF2nnzIC6+lb6QzFQl0pKTwhJ2wiiR4yOKVOQqz0MDXfUgdl55LExL/7/Z8fVyul92V4hdel
	K1hW69+JPuCtXkCEME1VF9B5cPRH1/6u4NIr9iAVZybp6sP+fDSgDfusWP7UiBj74uyR9jV7mWpKb
	k5o+HceLFVCnKLRv2dmjFYM942+qBtLuADzx7N3bK6N2lucSZim63fwibjvgIa/AisW+ZIX4Ljtpc
	g1+aXHCneaRH6JdwLaHKlssmv/B1SZ6E983C/HA/Kl/3bQPR2K2Z1WTOYnHSe6yeyP06EDvOibSRY
	sunKNq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veNS1-0000000390u-1Ms5;
	Sat, 10 Jan 2026 01:07:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veNRz-000000038zE-0UIx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 01:07:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-47796a837c7so34706335e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 17:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768007248; x=1768612048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7DHIbUC9kH5ID0D9IUKqXIWIzs+CamKmp3PsS5mVQKg=;
        b=XGJpMlSoJ1jFcN8UyZwinzXQt54v0HgdP5Zal8XtYR33QQVY7UYvUPyvUtu0iC1JFO
         WBXMVYuagwbCpFs7Hq0mKCrXVK6nI2n9VRWqKwudBC0RCVQBP4BkIlhS4nazehrqwS3d
         Kc0CrYmD1RKD8kQGflHmDlfxz3MwLYMNcd2ltdqLZLvnKAq+eMkC8czn1SubnGVaTne0
         8GZf4GRYs192RIL8sxIVROV8xmk7L7JMUD2cGDFrTbkO+qdsrQfyx2sqNX0xzmc00DQk
         l86iN8q18pI6dY81co1qX5b63tnuyuWt9inwAOhx4HeOxPeKXwnH1Ra7ZtyWT1s611ET
         ok3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768007248; x=1768612048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DHIbUC9kH5ID0D9IUKqXIWIzs+CamKmp3PsS5mVQKg=;
        b=vxTSJB5N55IZjIlA7dzfoE/dHZk0PWfu8VPcJsex+lpq+/G2szf46OA3x0oly/Vmyr
         N9DyXiWaIscsJnoVTd6CdEBdZhMY5wLaJ+jYlWqGKCovX4ITHiyIO110/MEjiAtbXAVW
         /+uBY3ng/kIt15QEFarDrc4fiE7bKwKbFApTM68A8Y8nBGNoMb/kaZljhr4+G9/r1qjr
         /lCV/CBcNuHmMIahFZTxmq9QiGMMcelyg8xXGXAgZ9l38PKhhCY44aGjYUhPBppvvmPJ
         4TWf79vE6f9JANXdbwogEGhCNqW1bPd62kWKZ5+Sbyq2hkZTH48XtrrE8XhvVm8oFdCb
         pYBw==
X-Forwarded-Encrypted: i=1; AJvYcCUXkZFt7Hh5sa/NL5ndnOZL72Lqt88xiCm2Kfl35f+HT6DnykjdQlmUu/lu1Dogg+DIVbb5n9lTv0eoa/DQgX2A@lists.infradead.org
X-Gm-Message-State: AOJu0YyYuXCuJOJN9Wr5A3qJvUaG/6j54e+xomXAfe2Djb2JHqhMkaHB
	ulFp+4OTMOFI+wclDeDI6P8emiICA/2rdiZcBLBjgQncuj/8waABkv40
X-Gm-Gg: AY/fxX7e+b3WDzLrxpET0yTyI6qN0srJ7oaVHn6W5ZbzTxLnxsLEg3X+NyCm9WF3EZ6
	0dmQRtrZtaz31gDgiWip/Ztf6TMqqdiQx7Anc6nIdl46qj+9kLCV1jZXrsKHN+TSiATJmx/7v+F
	8i96KpDkCJtDrXIZ6sN4B5MVoJkSi/GjoYey6RcPGPJZW5FpPxRpR3bUlasQbDJ0B5/KxDPbH/5
	cJcRgt6sNGlYIdEP6k0pfE5GtVEmRV4qCi7/6kB15iOiMdTUg+wWmJqMLI9VUY6m8llkVNhtwNq
	5Zc7JTZm4udgEuCDUUPyKZAp4S7QkF14B8hHsGnp+m4oND3Y1kbu8BMsg09MKK0EjtszgEmd+O1
	/7B+BMQt4U1EGU2jZK/zOsygC1rQ+Mte3ou4K+7SanU5ErMrnOqbDkSER35h3rCsJRwRSZJlP1U
	n2mUj12SWE7MmEyyA21/dWSTY/LGJad2TopOEyF3HwSYznlfJWS6RVoR3HPkFWh8JH3VrKuNi9Q
	2z0OWo=
X-Google-Smtp-Source: AGHT+IEEsvTH07Jlq4vwgEsug+8S14LvBK1JHllAkePtf6I0e5EhJvagWLbuktY7BlslZdmsV7k6Dw==
X-Received: by 2002:a05:600c:4e86:b0:46f:b32e:5094 with SMTP id 5b1f17b1804b1-47d84b5b4fcmr123965385e9.32.1768007248471;
        Fri, 09 Jan 2026 17:07:28 -0800 (PST)
Received: from stor1.home.marco.cx (ip-178-202-227-016.um47.pools.vodafone-ip.de. [178.202.227.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8717d9e7sm71779475e9.8.2026.01.09.17.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 17:07:27 -0800 (PST)
From: Marco Schirrmeister <mschirrmeister@gmail.com>
To: heiko@sntech.de,
	ulf.hansson@linaro.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Marco Schirrmeister <mschirrmeister@gmail.com>
Subject: [PATCH v1 0/3] mmc: dw_mmc-rockchip: Add stability quirk for NanoPi R76S
Date: Sat, 10 Jan 2026 02:07:12 +0100
Message-ID: <20260110010715.1610159-1-mschirrmeister@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_170731_201033_F7F6DB34 
X-CRM114-Status: GOOD (  12.03  )
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

This series addresses a microSD stability issue on the FriendlyElec 
NanoPi R76S (RK3576). The board currently suffers from a 400kHz 
retuning loop when the controller attempts to enter runtime-suspend 
during idle periods.

Evidence of the failure in dmesg:
[Fri Jan  2 01:28:02 2026] mmc_host mmc1: Bus speed (slot 0) = 400000Hz 
[Fri Jan  2 01:28:03 2026] mmc_host mmc1: Bus speed (slot 0) = 198000000Hz
[Fri Jan  2 01:28:03 2026] dwmmc_rockchip 2a310000.mmc: Successfully tuned phase to 233
[Fri Jan  2 01:28:04 2026] mmc_host mmc1: Bus speed (slot 0) = 400000Hz

Testing confirmed that the issue can be manually addressed by 
disabling runtime PM via sysfs:
echo on > /sys/devices/platform/soc/2a310000.mmc/power/control

I experimented with various changes in the Device Tree, including 
lowering the bus frequency and attempting to keep the power domains 
active, but nothing stopped the retuning loop.
The issue only went away when I forced the controller to stay active 
by disabling the runtime power management.

This quirk is the only way I have found to keep the SDR104 link from 
crashing on the NanoPi R76S, I am open to suggestions if there is 
a better way to handle this in the driver or the DTS.

Marco Schirrmeister (3):
  dt-bindings: mmc: rockchip-dw-mshc: add rockchip,disable-runtime-pm
  mmc: host: dw_mmc-rockchip: add rockchip,disable-runtime-pm quirk
  arm64: dts: rockchip: add stability quirk to NanoPi R76S

 .../bindings/mmc/rockchip-dw-mshc.yaml        |  8 ++++++
 .../boot/dts/rockchip/rk3576-nanopi-r76s.dts  |  1 +
 drivers/mmc/host/dw_mmc-rockchip.c            | 25 ++++++++++++++++---
 3 files changed, 31 insertions(+), 3 deletions(-)

-- 
2.52.0


