Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59B44C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 07:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=chG+U92YJTb/06zPnc4uKR/tZueFYP4V4J7hoK/qdXo=; b=lRPxXfsTz8RJYy+inaLHbIre41
	iruhYoDr4yAxX51f4WnRfz8iugmeSmc7y2j0R8AElezB0NZWV6w9D8RbPZ0XcfxFUSIl9uj8WmZgu
	Gg6MnktoUBEP1YsjfIxALITXy6tiStTnqmSXb+jhJAZtr6qBYtA1sKLKs3BamVfsYMVgEyuOE5Bqi
	1pzeUUwXz1vMEZGWE1CXJlQt2SpTj3WAf/pT4d4ksv07M82c6IZImFCoj5fEdDzNUJzXWFoV6RPkn
	hGOxP5nmwHLlfWZjzZeh41gvfXxmv80MIT12y5OiIujgbvGOoH22k7r+1XvfnDS3r0rRAEyfTGQWW
	Zziimazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1VD-00000000ubL-47oX;
	Wed, 30 Jul 2025 07:45:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh1Sk-00000000uHM-1aPr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 07:42:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3b790dbb112so939469f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861377; x=1754466177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=chG+U92YJTb/06zPnc4uKR/tZueFYP4V4J7hoK/qdXo=;
        b=g1t3RXezzzECe/R0O8gPk5cnEebyAF/XddXPz2+bqcAjHf4YUAonVFBHaKPstF3JIC
         x/NSApilCCJTpxtsiIkdtJAW+w8u9Lbt7ESWc53+am5OBR/x+Cc/38SxH/Wmlt7upaI7
         Fhm6qvjoInu01yYn7xzRt2k6nQbANVfGpIG37ZTCzckkQPk4YNo5OQaYypffXejIvMzO
         2V7pG9f7lB+0+49F4uRTlgcvYBKXqig4rBXJPXN1lNedUrmcoCcosgYhlQO7/qbxzYeZ
         8EJduRH5zSWg7ERguEa7KK9Cqsx3izrVopAJ0hy8BXmjn7eqQC0xbHcFmeBjWpji9rRS
         23Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861377; x=1754466177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chG+U92YJTb/06zPnc4uKR/tZueFYP4V4J7hoK/qdXo=;
        b=JI4oqK4qwnkqwZuGeMpptT8xNtJU/P+qq2laLWDw00i0pQ2tKFPaxuHuYQ8e0jr9cC
         lxjlX83/XGd163wx5BDS7X0SR6ZmlqjJiNKODssYMw2z+7FLv019rqVDhGW0bnFZsXbf
         VvdeK/fSddwZRWk6+pxthczgNV8vIBzpW+uAZ/xWiPD+lH10wynr8g1SpPm1x6tqtyKw
         Gwlwj6TGZr91+Bm6oQkoiZJKea8+WATtfx/VcT+d7ydUroT/vyyvy97AZYejpcRhO1MY
         MY6Sijz+TPCf0iFJoAkpaV65AjnnO+oMmZf8M8sKm/y5nsb2VoNrhkWzXcixYIxpKJb7
         KmBg==
X-Forwarded-Encrypted: i=1; AJvYcCU8RCPsi20lRjx2GM3FTpcTn/FTN1xX8JJJD+lUYfoLE0jKezM0X09NPSslGc4HPkhHft+wSkiWjHb5VwR8BZzn@lists.infradead.org
X-Gm-Message-State: AOJu0YxgDxIm51ppmM4a9lJjMWmbysKkPch9TUnEBbEYGqndhbppLJOV
	pxSKC8a772qJS4VbwiQ7QsUD29tX3pjVFP5ARzMlZxQtSTeFkTkkks8p
X-Gm-Gg: ASbGnctD2stU+poOhTtu0LrzblSxZSM10KEcn7yHmB91UWkFcCKvSKBWCPB7+a3Gr1r
	VGeAUsuGZLtzWdj56LulZFXboCGMnm2lRZBliuHvgvxMst3qcLkkmCIdY6gdpZVId1if3dM7dFP
	nN/SXw2zzw3A1R1CxRgyTuwBNvl0G7pZ6XuOA5c/r/j1pL+6WwEeG18jL9G3mASYQLa8WkmdGmP
	fCJNhLnz5y1TZh9xu8804HQ5vD64C/NdF+Y2UFuVYXR22VcQXm/Vk4xzuxDlsKe3aw3li/6d4B5
	0NmLJe1XR/wLbHZYkI+BoAqk3TCpuVDNQzq47jcvxJJjVwt91E4Or4loC9lrQVM+PSqQzIOHwYA
	JcvQYGt76D3NWWhwoixb1wzlSdFCbXoJCd+7BMtV0786iSuNNMwigg9xdazjkx9K8+5fIlw0Ou1
	usZd1Lxzji
X-Google-Smtp-Source: AGHT+IGL8/AcxTOI0rdRbKser4vIAzAAFwvdC4/eIKFajFt1OS3n+7CpNkbdjokahJIUyITvnfm8Ug==
X-Received: by 2002:a05:6000:2212:b0:3a4:e841:b236 with SMTP id ffacd0b85a97d-3b794ff34f3mr1712839f8f.33.1753861376651;
        Wed, 30 Jul 2025 00:42:56 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:42:56 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] arm64: dts: exynos2200: introduce serial busses, except spi
Date: Wed, 30 Jul 2025 10:42:48 +0300
Message-ID: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_004258_416387_BA3A0F51 
X-CRM114-Status: UNSURE (   9.93  )
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

Hey, folks!

Before anything, this patchset only has binding dependencies, without
which it will have undocumented compatibles. They are the following:

[1] - https://lore.kernel.org/all/20250730072730.1882549-1-ivo.ivanov.ivanov1@gmail.com/

This patchset adds serial busses, implemented in usi, as well as serial_0
and serial_1 for exynos2200. It's missing spi, due to me having troubles
with reads when testing.

Best regards,
Ivaylo

Changes in v2:
- add a patch that switches address and size cells to 1 in /soc
- adjust all new nodes to define reg props with 2 cells in total instead of 4

Ivaylo Ivanov (5):
  arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
  arm64: dts: exynos2200: use 32-bit address space for /soc
  arm64: dts: exynos2200: increase peric1 and cmgp syscon sizes
  arm64: dts: exynos2200: add serial_0/1 nodes
  arm64: dts: exynos2200: define all usi nodes

 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1459 ++++++++++++++++-
 2 files changed, 1424 insertions(+), 37 deletions(-)

-- 
2.43.0


