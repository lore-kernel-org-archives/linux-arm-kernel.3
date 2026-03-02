Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52724D58E43
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 02:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DDgIClsU9tFXtpNwdi4WbXldTo4bd/zYzYnfaln1CME=; b=G9r5aon+x9egjVgLXog9OPFKqp
	cF7aIyNTI+P87V1P3OSKYQNPjWJxyC/m6Jk5Q7MuqEnszlEEMCD6+xdzNgmD4CmBNXe48MinAbfJw
	WggxrxPKX08rskPpiMRWpuuFHHmZzMWkfuJRKNnbORi4CmRMRhykFqyjcioobP+/vHZ0GbSGkc/tK
	wJcRg6ik+8cvt4SjISwohWtBDE1voPSbc/VLdz09SRE1gjmEQWe3xaN0ssHyjOe4EAdwc2ZDJ0LWX
	JFqzB51uk6xRxAEN8GbxzNnaylbal5SWvndp61HF+36SSAyH+Dt3LiTs+qjIJQF2UE01OdYu4dJrn
	/GqwOp1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsjw-0000000C6F6-1Knx;
	Mon, 02 Mar 2026 02:10:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwsjt-0000000C6Ea-46l8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 02:10:31 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4837584120eso27291325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 18:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772417428; x=1773022228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DDgIClsU9tFXtpNwdi4WbXldTo4bd/zYzYnfaln1CME=;
        b=CQaIzm+NnP1K+thEWwtQumrqMC33xC4E7mYuXlnBgNoAkeoGwW3axhuOWwdjy0ggSY
         JHIH4Hzj0fycQf/l0SNs4jXHMo56xQ5L0zcZHxD8pOXZzky8pFlQULbWLRqjvGhevdT3
         e2xi+oPzQ0jPkoN29OPOYKL6QkzpsvzFttGoeDA1tgFV/FYsUElkRa3pKFFeTfbXb5vz
         WzYkQQGCSZQaPKpuXnSz0wYKMNf6c8Kj+nvgst70UqnKidqdcyEw1m7ZHuIkTb0SPT0Y
         qozlwZYxKwT8fYBbZId/B5iipDuiB8a0sTX1NWFAw50IXgvoOwo2H3/gxHrRDYJ/a3l0
         ZIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772417428; x=1773022228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDgIClsU9tFXtpNwdi4WbXldTo4bd/zYzYnfaln1CME=;
        b=BdyJnfSoK0qr05HsLcmuN2ziPsRv7R0SLGvPHnVvYt7LvR/Kr1u7ex6x+8dfjD0HLe
         knebwtNxPrNsWcTBLruX2qLUcIKyP4AfkrL+4ul6bP91cN76DIX66TdNFOlpM1+yHXn5
         myo3AbWh4jZyUFQZ7+mzyj/CY11jEvQIaCMf5cHhhbRyBV6Zc16oTAZiyJfzvjDAyg5F
         5nLrYAy42I7RPu4IqeYiBz1tLDz2NsjqUhjg1PB/YiMXY1KxcpM61nP1vjTJdCfN5X+E
         IlbLZwzo9lrRtvt+zv28a/+AkEEsJSzsLgZ35fF8xqvcQbrEIcGcLmXoZeUW9Jof7FNj
         z2lw==
X-Forwarded-Encrypted: i=1; AJvYcCU+z/jkRZbF6lOZd3lC5xxCGuczILG+LXz8Z4w9xDU42Q0w+U/scWRwCKt7pnooGZMdJBFVOM0+SZgrv27jI2wb@lists.infradead.org
X-Gm-Message-State: AOJu0Yztw8RcTB8UuNtqkBcXZ7WG/zZIWydbSxz9Q1x2AcymWW1wPk81
	TsVLnn+3po507YjwQYH5iKlu/LEng5Vx3jrscg+gAlIV24dMChTFknYx
X-Gm-Gg: ATEYQzynP5XJLUovgPlcfbNQqZAHv9hIJVwya0i2Kmh/5stYwqxxt9mv5Nv5jdCWxFZ
	eLYmCp9WBSqTJPA3GDph7vwqNe5KT/wrsJFnqz2Qbqer7/ysr8bpdcv8vP3wmMiU+0IsidmKDVs
	CYH38ajq+1xDSz95vumO3AU3tRwhbjpH7hq25c5F1EnTpfoLZOPngqbx/jW/TsBT55Ug0hfYEZP
	EbOUqZj+fLDBp0JWDWStgmThhO71EIB1TGOlAb2ODU6AosuNyswvm/gEHP+55tOCMfzTsT4OEpp
	DROf1a3yslTQtSsvUt5O/mAL3JIN5IA65yyQNNTsZSD4DbYU2w4MSCgQCeN6VkIEGU6zpYFN/uB
	VGSM7LQY4R/rZGHP6zxHcyys08+jYW8jBOjfhytg8RVE7E7DdWRIKfHzKeKC/syY4J7wCa+tMnx
	zaDx+TOkdq9ri3oNImnPrl
X-Received: by 2002:a05:600c:a085:b0:483:badb:618f with SMTP id 5b1f17b1804b1-483c9bc5b7dmr176920225e9.25.1772417427953;
        Sun, 01 Mar 2026 18:10:27 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcb9b97sm194451105e9.7.2026.03.01.18.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 18:10:27 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	andre.przywara@arm.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v3 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Date: Mon,  2 Mar 2026 10:09:53 +0800
Message-ID: <20260302020956.96424-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_181030_025259_43ED87BD 
X-CRM114-Status: GOOD (  10.82  )
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

This series adds support for the TaiqiCat (TQC) A01 — 
a set-top box based on the Allwinner H6 SoC. 
Originally released by Ultrapower(UQSoft) as a blockchain terminal, 
the device has been discontinued and is no longer officially
supported.
  
  https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

Changes in v3:
- Drop the serial1 alias.
- Add an ethernet0 alias for WiFi.
- Link to v2: https://lore.kernel.org/all/20260227155801.211376-1-jerrysteve1101@gmail.com

Changes in v2:                                                              
- Replace "UQSoft" with "Ultrapower", and add relevant explanations.
- Link to v1: https://lore.kernel.org/all/20260226084850.417731-1-jerrysteve1101@gmail.com

Jun Yan (3):
  dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co.,
    Ltd.
  dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
  arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
 4 files changed, 369 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts

-- 
2.53.0


