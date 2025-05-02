Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F45C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 20:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PR3SQ2n/Joo4f0tjdIatGVPhytTBC5rTKfPKzKHMJpM=; b=iYU+c09RR3m6EfFWFBvOTBdsay
	VhEN6Ic7Vk2YiLmQy1I9FASLSaAggUFgN7NR5zQcVMBeZ7KOJyh1XZw/Te3Z2xpDcUMBd05C5/cg4
	wa+VZmefODwurWZRKU6tXnYr43BS+cNlPohsmGpw16V7BUMT3S7qbUdHPYmt+Q9a95aF5i6lLQRi4
	tRyUPI3CYIb/e1WlsPn5Z/d7EVuhKX082Hxt+ADGgSSWUGKgxBjnezsTYyC2qXSxW7k4KLu+Ppn8S
	DNbUzE11QYh6ZPrPQXDg3sN4P9bW/JwDiYrlUttNk6HAMr3N6XHJNIADcg8Q/m6wCpr4y5X/q7ueD
	NYjPUnkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxS0-0000000311z-3xO6;
	Fri, 02 May 2025 20:57:40 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAxQ3-000000030Ze-2fYv;
	Fri, 02 May 2025 20:55:40 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so43884666d6.0;
        Fri, 02 May 2025 13:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746219338; x=1746824138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PR3SQ2n/Joo4f0tjdIatGVPhytTBC5rTKfPKzKHMJpM=;
        b=QoDtbN/iR4o7zMBHhbVnQ3M5CeeX3WkazcCFzDqYW/5zCBaoQhH1FCLMuKOOtEhlLC
         12dOtmH6dAcAkv/V6Ym7jKppLVtnq8PJyhYpP29UA2uRuVHYk0d77xKLz1uB3utdnv5F
         koLvGZR+SD/ezz2+dGVOUps0UMpk/T/+om1iezJJatzEWr45ukMjbLV8atQrmmAT8+m5
         Ev4aaV5TT59FeS1Ju/bAszQjGRUk7yoOUqey/7LoRcqclLyQSu8lRxY2fMGo2eq+TgBe
         7whVhzIC1NUPAABzE30ZgQeAAB2hLEvKcjERZD3/CxaHfCRP/kMyAjpq2mqbMvS7ObWc
         xXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219338; x=1746824138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PR3SQ2n/Joo4f0tjdIatGVPhytTBC5rTKfPKzKHMJpM=;
        b=mW73tfmID4VGElaa9JiR6rj3PvVW3d1+8UN9pMuIQ32qtAWPS/1XSGEe+9rnjcaPRv
         2GIXyjNlbIXo0b9cbPo95mxGE+CLh7obvPSWqfKlvh3xHycbU+z6UBybGnEUvGWubp0t
         a2JG2kTfcua9YpYUIT5so9UR2UfLiPSwQMWkdz3QT9/sKjjzlPxWaXy1xk7O7oJLw/Cl
         7LuadfSB//MKUddpdZ8d+2Bzb2c01gDvMl4wLc9pfM5DHNMwHQSauYg+rzdeH1FmwXTA
         nqbL0VQH7KogyQ9dHBjAWI7fzV9nJEYsWuGrrz/Kk2Bn17vBji3gpwPyMSUIY1mzDWas
         r3gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIeYpRMmOJVFLgZ0vrpNPDlxbcUbh5Nv+STDq6APLS9hNH5DwB8oX4is2GiAFCYYYfsyziazJqbzA5Ifo0RTRT@lists.infradead.org, AJvYcCXwWTGfyL0Atxjk1PnxLD6quKiacZW75JqUngRQRsAc2sgvlbTpwHrT20JA9B1fZsfr4gSsJtBY6wQr2KNbqTU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzrzbjldbg6rRfj3o48XcbDr+HPiF9TofDHd4Ddvv01/MPllioz
	D7a/G32O98lj2eUzLovS+nzKib6JC8FR8lBZ9ZiUt1VawzDprNAZ
X-Gm-Gg: ASbGnctby6auMThab6GeLqvUCAQBragQlGeU52A0+iho2l46AKfbOfuoNgwHgIi7uuN
	RHWFnabPshyj/Jq0U3B7TVYjfd33l+sYeZlRddw2lUCsM1Lwjf/N1P8S5Xt+1C2CWb/aNMe6i1C
	nzhJcSgGQxaSsY0Gtm935FrKUzl5yxezT6gTiLx1WWG+ZFCUfmdcR3L5LwaW/dyd+a/I2ccmIIi
	xz8i8slyAkQLGjsTeING2gHBATdXBy6cpODqc7ksyCgcxX8PlAgsRjQeA3J67cHxnftFQo9bcdV
	uVfTKvwz+zQBjyj320ZXURAQDsZvbOnIuG9h5DWiSlb3usBi6K65
X-Google-Smtp-Source: AGHT+IGhSrEvyii3iCaUEnI1ury80sSSWAUDqJmSFWGySZCyG+UuPVblXaYsIftJReV0Y5/BXthobg==
X-Received: by 2002:a05:6214:20e6:b0:6f5:dad:5a60 with SMTP id 6a1803df08f44-6f515264f21mr72860706d6.3.1746219337829;
        Fri, 02 May 2025 13:55:37 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3d2844sm23129936d6.56.2025.05.02.13.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:55:37 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v1 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Fri,  2 May 2025 16:55:30 -0400
Message-Id: <20250502205533.51744-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_135539_674533_A803D782 
X-CRM114-Status: UNSURE (   8.45  )
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

This series adds device tree support for the Luckfox Omni3576 Carrier Board
with Core3576 Module, developed by Shenzhen Luckfox Technology Co., Ltd., based
on the Rockchip RK3576 SoC. The board supports various peripherals, with this
initial implementation enabling essential functionality for booting Linux and
basic connectivity.

Supported and tested features (on Linux 6.15-rc4):
- UART: Serial console operational.
- SD card: Mounts and reads/writes successfully.
- PCIe: NVMe SSD detected via lspci.
- Ethernet 0: Functional with RGMII PHY.
- USB: Host ports detect devices.
- RTC: Timekeeping and wake-up tested.
- LED: Heartbeat trigger works.

Disabled features:
- eMMC: Not populated on the tested board; believed to be functional but disabled.
- HDMI: Disabled due to mainline driver maturity issues (basic 1080p output works; audio and 4K untested).
- Ethernet 1: Disabled as it does not come up, possibly due to PHY configuration or driver issues.

Patch 1: Add luckfox vendor prefix for Shenzhen Luckfox Technology Co., Ltd.
Patch 2: Add luckfox,omni3576 binding to rockchip.yaml
Patch 3: Add rk3576-luckfox-omni3576.dts and Makefile update

The new DTS is covered by the existing ROCKCHIP ARCHITECTURE entry in MAINTAINERS.

I am aware of ongoing RK3576 upstreaming efforts (e.g., by Collabora) and
welcome feedback or collaboration to align with mainline driver development.

Signed-off-by: John Clark <inindev@gmail.com>

