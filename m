Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C180D41D52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 05:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MaIHE/alJNdCEm+B0Rt5E8wgvLMuusJFryUQsYRdIFo=; b=wegOp5Jg87b6dY4Bq8K2+Sq3Ky
	MLNZNgwlr7az9qBw+yL8pe5ib834RNq/myzRVRPF2zvHxzxVewULnURD9iSGTa9UU+q6P9LIx/u1O
	rgBHAGZ1fQb+OySf4CqZ67UneQ+bSe+QvmI3dS20plD5FZIsWfwXvossWzzFWqjyqvLw/P12QGiGO
	LQczJcVY78pIk3uI9j94YbUKkUhVGMOLaCZpvGCsQ/cFA9OJDUHso7/Zxg/9pbzm5eNklu/dFv3JA
	cdrN6ru/PkQ0kCrmBCXOdk0d57nzsxSLkZTiMYq5lHdYD1TWsFsoc4fEG6tnGZ2bQCDYtumJuda6B
	PjWZYtjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjWi-00000002GJM-2PfY;
	Tue, 12 Nov 2024 05:33:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAjUv-00000002G2E-3QMJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 05:31:31 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2118dfe6042so20300725ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 21:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731389488; x=1731994288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaIHE/alJNdCEm+B0Rt5E8wgvLMuusJFryUQsYRdIFo=;
        b=ebXmhtfI5AHHlr7HJBTscS0O5IU44OawbnfZNme34/UfCjxfpP7ZW+ET8XhEmJ4480
         sbt2Nv2WVAwaktICXMEByJKG1ig5kjKYQ+fGkwQEFChJd7B6SbE9n97iAp/PisXiseWm
         Mzhbktq2NrRa7xZGPcDL4FyvxaMcDflGJX91xY9IqCnAqyl2SjSqfOHkOSBq7+KZTSaR
         +3/m2OIE+6XR843QhvAjdC5Illy/FmktoH7Iz7IEo9KJXt/CWUEtu+XWz5OWoUFUdidB
         6cFRiGwmvUz5nyEOZsuJoOeoyb9Pa91IIaBK/tvPPJIfmrPCanUr4M8jdoiE1IrdSvui
         Cc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731389488; x=1731994288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MaIHE/alJNdCEm+B0Rt5E8wgvLMuusJFryUQsYRdIFo=;
        b=CJYpKU0Xts8rCgbzs4lghTt9mgE2ura3Fn373nNzCn0Le5mciR+Xgt+UZj/v8Xabnk
         TxKap0DCOQTYWqpp6RuUJS4rY/i2fRAxRD/40+6jRUXlRHIzMGPxizYZ2mzecZjFt5E9
         fE41xoZialRtch/FhwJKrnT3H0uqpj4Nj2B/B8w0aJHcg44efnD0YVnOMUtKprQtRiE7
         5FiKUb7KcIxRsxY5dDCJbdS1jwJWMB/VI3Q540wErVFdEsObPrGb/VEsvelOnmMaSOdc
         j+7/QqChoWU2pPJBiAxJcds0JhQyt52J2QYHo80DbaYnHCftjFZRsq8hjc1fTnjTpBLe
         lezw==
X-Forwarded-Encrypted: i=1; AJvYcCVt3LAYlcBa+tpGrs/VIhRBdlNtuzKetU+8mZxlHxnEqZEjjW5uqGJuEvZnNuUfBOeSogAR1lW2ix3Z6xNj1iji@lists.infradead.org
X-Gm-Message-State: AOJu0YwNBEqRzd/aXTHQ/cdW+9YpjBKcxuTR7AQaeaDh6r8RcQYVHb/P
	Zhu/2IoZo256BsunQ/TmTCYjMLwH6H+V2R6U1RtEHDXpoOCZYeie
X-Google-Smtp-Source: AGHT+IFYV/HkU5vKmvN9DeHIWDv9WwtrlICSMfN6c3n88t9hMHe86wslFyujjptm9OyAiEzxvztnBA==
X-Received: by 2002:a17:902:ea05:b0:20c:d5d9:95dc with SMTP id d9443c01a7336-211ab9c4a9amr16506285ad.40.1731389488377;
        Mon, 11 Nov 2024 21:31:28 -0800 (PST)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177ddf19esm85815505ad.92.2024.11.11.21.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 21:31:27 -0800 (PST)
From: mjchen <mjchen0829@gmail.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sudeep.holla@arm.com,
	peng.fan@nxp.com,
	arnd@arndb.de,
	mjchen0829@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mjchen@nuvoton.com
Subject: [PATCH v2 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Tue, 12 Nov 2024 05:30:57 +0000
Message-Id: <20241112053059.3361-1-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_213129_880388_C3AC5675 
X-CRM114-Status: GOOD (  15.94  )
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

This patch series adds keypad driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 keypad driver.

v2:
  - Update nuvoton,ma35d1-keypad.yaml
    - Fixed warnings and errors generated by running checkpatch.pl
    - Removed the previous version's properties and rewrote the
      properties in the Device Tree schema.
    - Renamed the Device Tree binding file to nuvoton,ma35d1-keypad.yaml
  - Update Kconfig
    - Added COMPILE_TEST to the depends on line in the Kconfig
  - Update ma35d1_keypad.c
    - Refactored error handling within the probe function.
    - Fixed the mixed use of devm and non-devm resource management.
    - Corrected alignment issues in the code.
    - Updated suspend and resume handling methods.
    - Fixed variable naming to remove camel casing.
    - Used for_each_set_bit() to check key states.
    - Modified the code to align with updates in the device tree binding

mjchen (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad
  input: keypad: add new keypad driver for MA35D1

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  89 +++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 308 ++++++++++++++++++
 4 files changed, 408 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


