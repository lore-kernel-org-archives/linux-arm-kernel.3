Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5E4C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 16:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fKYanQIfYCncszgpyLAY2Jfcp3L50T71jyYK0/4Yps0=; b=dAt8eN4B/+/iFP
	IhxeMWFtrUZkf7s0s6kxfZ4OnLNy1RGFKjPSs8c9pR5Nj9LmLeETz4N/NEufVF4Al9gm3bSzbfp8+
	jjEPX/Pcs4khRkL/b2WHRNjq63SWCxcZ06OtMK0kk8hDjritijQ+pG++bu9Z2qRCUl9pVrXMFPizY
	O7V6+S6enRWCtADwoVnB31qrDyeYZszJ+L+WTh9JoIdVQRAMCVXfiCZgey4iS6/iKb5QQupH3zm/t
	X3ub1Ia21O2zsZkzOPLvmtiiXCj9DKFeCFkpivRTJsv4Sp+S3uXa+bmlR5qli/tOBjKIROMPGbVHc
	qD3RZvE8YTfPwgGfLIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTZV-000000090av-1Kch;
	Wed, 26 Mar 2025 16:25:41 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txTXj-000000090Kj-3RFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 16:23:53 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-ac289147833so1041010866b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Mar 2025 09:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1743006229; x=1743611029; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fKYanQIfYCncszgpyLAY2Jfcp3L50T71jyYK0/4Yps0=;
        b=yJ4o9kFUH0s6E7p0zsnERumhYxGyN4AoFkHSJY/GMVqSB5AT+O1WfLGrqYv1kKNEQK
         jD6NjqX6PI1g4pNY+iOl0dMhnrGdGTVkqi0mY3u+f+LfJnGA7/QVy1I+fFPkiAAfClhn
         a0Ja5n3hMdIpa1F5zvX5+Ii0hIvmSLS5Kcwa+RUszhidbbiz1THCB1SJvI81hRXYq93F
         oV+N0HFOLsTnD8o0ned/mD7JkQU9PsjDfqSJjk8ZP7niN6d6BEFRoUvP+pGRlBa4Uja2
         tF/ZwWi1F3WAOBS0Y6ITFVNedFFtF0QBwoeWz54JD6CqOG4GrU1+xuKIWfBu8mtJlLO6
         wbSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743006229; x=1743611029;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKYanQIfYCncszgpyLAY2Jfcp3L50T71jyYK0/4Yps0=;
        b=aEGCyS/uVPXKw2LWNmMjifbHE3vNx362l1xeq65n6YwmhNYmMhYj7CL6CmDuBgxvUh
         kV6ZOFTxgxdLX2vv73W3gpDwc9Ts1r3Vd9P9yUcSfZ43AZTUdPgn89FNQNinnc06OUM7
         v7GJAP2q13QtsVI7nUZlh1OzV1eEfL1RsH35dwELf9BFxL97D084yUgZvmSmkNxQwPk0
         sb57v5a5waBmvNLZDhi5cM2g6Xb830V+jT4CTmL9sTTVJuITrn5IZoEU2KWZmVkVyaYI
         6d1/Pfgv0kkw2ndelGYy6Lj7+KWQJgFeQrMgIjSLFBHlutWIx0V7p7AjZJ0IYnhe+rpW
         Q8ig==
X-Forwarded-Encrypted: i=1; AJvYcCWGx2w/AD6XjgBbnIGufFprUF+p2vDHU/S77AlQoBIHkv9RJk6SJB0oggX7Fr7cWfHypGLInP3di765oG8jzj8h@lists.infradead.org
X-Gm-Message-State: AOJu0YxsNhqos2qZmcIE7Cej+gxDQqPjGfkUttDjGBBMAMwrIHUVbsNK
	9LicmM0Ot8U4y0uTUPBhPlCr+srfwEy4kkDQmAcTFyZR4uGGxXDRDSahmrLRerI=
X-Gm-Gg: ASbGnctxANqOv0d4PHXMrlj2e/qPIZLpjE/n/7p4u10FhjPtO4ssHiVfqknU3Y9HYmD
	XZpP7Cq7vkosv10g2y5zbw0G9YLW30BKZFSqm7GZsqZg0Y4ja2EGGZJL31/dnMwNbqV5wnCQ32A
	SLrL19knYozNAdMPBO+fJ7Owir3EvjkKIaonCxaN5i7Kz9CT6UUrfuEm9LBMnDT6hM8sCKYpyd7
	Lz05wBDoB/KuqlpSMLmLQPGrPrJN0zTB9GLBDzMf/YP3kajie9tAWiiQx6n8VcEDWF4rFXw5e40
	xONNJ/YDdx6mpTLvqGQ/dIl+ZaWYcrZg2uhdfEFKjPJ0WNue/at4nynjEw==
X-Google-Smtp-Source: AGHT+IHTxPRGm5mNkyz/LXIEUO2w8nqKfRSkk2yHl8zPEU3IqZLbPjnGdEzUK5cPc1Bb6wHgkTIrlA==
X-Received: by 2002:a17:906:7949:b0:abf:3cb2:1c04 with SMTP id a640c23a62f3a-ac6fae428c5mr5377966b.9.1743006229345;
        Wed, 26 Mar 2025 09:23:49 -0700 (PDT)
Received: from [127.0.1.1] ([91.90.172.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac6f0f498ecsm76678866b.135.2025.03.26.09.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:23:49 -0700 (PDT)
From: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
Subject: [PATCH 0/5] Fix onboard USB hub instability on RK3399 Puma SoM
Date: Wed, 26 Mar 2025 17:22:55 +0100
Message-Id: <20250326-onboard_usb_dev-v1-0-a4b0a5d1b32c@thaumatec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN8p5GcC/x3MQQqAIBBA0avIrBPUsKKrRMSUU81GY6QIorsnL
 d/i/wcyCVOGXj0gdHHmFAtspWDZMW6kORSDM86b2jU6xTmhhOnM8xTo0tgupqmxQ289lOoQWvn
 +j8P4vh/3hyZEYQAAAA==
To: Matthias Kaehlcke <mka@chromium.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Benjamin Bara <benjamin.bara@skidata.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Klaus Goger <klaus.goger@theobroma-systems.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Lukasz Czechowski <lukasz.czechowski@thaumatec.com>, 
 quentin.schulz@cherry.de, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_092352_130522_9B72A030 
X-CRM114-Status: GOOD (  13.37  )
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

The RK3399 Puma SoM contains the internal Cypress CYUSB3304 USB
hub, that shows instability due to improper reset pin configuration.
Currently reset pin is modeled as a vcc5v0_host regulator, that
might result in too short reset pulse duration.
Starting with the v6.6, the Onboard USB hub driver (later renamed
to Onboard USB dev) contains support for Cypress HX3 hub family.
It can be now used to correctly model the RK3399 Puma SoM hardware.

The first commits in this series fix the onboard USB dev driver to
support all HX3 hub variants, including the CYUSB3304 found in
the RK3399 Puma SoM. 
This allows to introduce fix for internal USB hub instability on
RK3399 Puma, by replacing the vcc5v0_host regulator with
cy3304_reset, used inside the hub node.
Please be aware that the patch that fixes USB hub instability in
arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi can me merged only
after updating the Onboard USB dev driver, otherwise the hub
will not work. 

Two last commits in the series disable unrouted USB controllers
and PHYs on RK3399 Puma SOM and Haikou carrier board, with no
intended functional changes.

Signed-off-by: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>
---
Lukasz Czechowski (3):
      usb: misc: onboard_usb_dev: fix support for Cypress HX3 hubs
      dt-bindings: usb: cypress,hx3: Add support for all variants
      arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma

Quentin Schulz (2):
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma with Haikou

 .../devicetree/bindings/usb/cypress,hx3.yaml       |  6 +++
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |  8 ----
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      | 43 ++++++++++------------
 drivers/usb/misc/onboard_usb_dev.c                 | 10 ++++-
 drivers/usb/misc/onboard_usb_dev.h                 |  6 +++
 5 files changed, 39 insertions(+), 34 deletions(-)
---
base-commit: 1e26c5e28ca5821a824e90dd359556f5e9e7b89f
change-id: 20250326-onboard_usb_dev-a7c063a8a515

Best regards,
-- 
Lukasz Czechowski <lukasz.czechowski@thaumatec.com>


