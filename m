Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F082BEDEC1E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 07:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R7iFL26EEL+uhHsr6lC8kD5Eo0jyC6G0H13gfofhU64=; b=RNKeMlSGtWqp4Q1hvdIrfk7Gmq
	owDLkDu81ky5wLdtkoAiA3vMMOLHytvPFxpWY2VBzs34lyYtCOXwQO6tca1bfTFpmagP5z9dF7UOZ
	hFgNuLpVc+ql3BQmq+JFNmbtEfmawBFiusnZizZ6VXErVLSe38QPTVqhT3FA7B/z9nafhO9rAMCFi
	eB2/TIPjFzj90PVdgsC5K7H/bus3cu++7WU0ZXzJ+vbeCn564q0azx85x9AzK6x+KPQ107NxD5BCk
	icQi4vMTbbtSMz0iL/EUbdaDsgUS+auL8/38qp8TLjULP5XPo5HompG5EgQwgYUp0e61HUesVLOW6
	DBjJ7J/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgkk-0000000GbUj-30yl;
	Wed, 04 Mar 2026 07:34:42 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxgki-0000000GbU7-07nw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 07:34:41 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2bdecd00ebdso1508101eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 23:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772609679; x=1773214479; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R7iFL26EEL+uhHsr6lC8kD5Eo0jyC6G0H13gfofhU64=;
        b=gt+xFh0Ji47tifw2kKEPEMQpzp1wxYH7xzH4QlY7lVp9I01ehbrgKyDoXrGr8JyU1L
         C8hCVaVQZyPovf1Stqc6xKTy1xq6kOHc1tLuiT+llqgc0r4vcYVLOlQkhFhVmi3MyeeG
         ZWuaZ0O3ojSs2qNTjZ8hK4TLWEyIm7ZBS/WIX1mtJ7ykH1UTw2zyFx0vukW26reCo1BL
         hVuu1l0HiFupU+eGxysWoLQj8UBdydEoJcxo+Izc3bsxXZ0hFnbgEmh8SOWm7ADfMKJ6
         Ke7Q/a/YkueAARTQECZJeUJETrlt6EGO1dC7QfkgFwXM4SpcMYD5HUCEDE3snKll0BCu
         qIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772609679; x=1773214479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7iFL26EEL+uhHsr6lC8kD5Eo0jyC6G0H13gfofhU64=;
        b=p6WNRgg9ZCL7Np35kZPMEDs6DS3M2KzFLXBx0mfkx/dqxAsYAxqesvASC1HBPFdDTz
         fNOGHeECeY5MCFbX+j7/FEFSrsOlYwntgiutzhapl8T0p6ziFGDFbgl48EjAQYjlYEHK
         JH/EEHy0o9XKjkHaJimvGkKi9x04ixkh/t0pePxSTe0vmX/v+s80WVFOwX0R8PX+G4vB
         nvWohWeKHJtU/6Pub0tQ2Be9lQRcKCj+S4ZWyBEl9hhnXgappT9h/ZqX7HouLiuCFUOY
         m0aLKosPedZcU0k/Jns+0b7t7HxZl8dhQuymYhNWlg2IK3CBoh7o9d4QoYtAm4wUg4ID
         3qKA==
X-Forwarded-Encrypted: i=1; AJvYcCXhtN19jcOo60vrZArwt+yrOKjOerx3MkKjvx8YKobH9VMgHSY81baGSuRXjQu9K8y9XtwWRIdS/r3sIVZm0jQN@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf+Gdw962pFZbY5g1vWVykeBo/PmWQOio1VbfFNgI+/qLbhE69
	gFRixwZnZXxvR4jDGFPgB2pOGY6W4/L8HhCejaRS7f026vA41nHHUTAz
X-Gm-Gg: ATEYQzwb3aoII26/PuI2JepXzaTUP3GPCoVgS3kIy7+AV9CkhBnTG69releMQQaLTyo
	QkqR+yHZOKiXr6ER9AwDKZ6bY81FWGsXEBLc6pkqo0H2/xWABEsZUgB8FOBkRLcES9bgijs9XTG
	8rK4HDKjcH6JjYMlkrkn1lzQFB5j9+RTBfafUT/LUOHZWcVT1z6ZwnH9at6iOYeGTYhphjRt4Cb
	xfisyuwV9LrP9tt/zEDQHXZONDZHpyPE5Xq5tXBbBIY77cl39f3YGjgvX3/M0/bRx2xXFZ2RzDC
	wakoZfgqyIzBTnvRHa+iPZU5N+8nffEyqRAueI+Z+XJlTc0ELLLPDvyacSyDXLrQdqDMQLI+T7P
	Xp/OmSgWRI0SawyUbdyJFOEfC20/Rwnbs6uKv+HSQFske1rJiD94Sr/yT6KN8xIZ0CXoz08Tqnx
	ZD9p8NJNwhZzyAy72W3dRb
X-Received: by 2002:a05:7300:e61a:b0:2a4:3593:645b with SMTP id 5a478bee46e88-2be30ff3b4amr448852eec.11.1772609679022;
        Tue, 03 Mar 2026 23:34:39 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a55:9af1::1002])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be2056acd1sm3457123eec.22.2026.03.03.23.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 23:34:38 -0800 (PST)
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
Subject: [PATCH v4 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Date: Wed,  4 Mar 2026 15:34:27 +0800
Message-ID: <20260304073430.438835-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_233440_070485_C47645E2 
X-CRM114-Status: GOOD (  10.78  )
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

Changes in v4:
- Rename Wifi ethernet0 to ethernet1.
- Link to v3: https://lore.kernel.org/all/20260302020956.96424-1-jerrysteve1101@gmail.com/

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


