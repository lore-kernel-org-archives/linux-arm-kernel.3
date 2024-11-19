Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B486FD60D0D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 03:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J1hOThp0u4KkIhCVtLoJEiqxjdPOsJLC7BccGXL9jCE=; b=HH5rF1rV2EvRe4FduhPsc6wMHw
	VLHEugypdCLQwDgPZKd1IuPMoSu8lhr8PNCEB3CnuZQZkxXZ61h0muzSK+WELvsF3+tQMJf0Yv+CC
	6Q83bthXYEvHUeTMRMlOvypKLTjXnXLgBX3U6FrOxmuBNck/GAS877vJUn6bCrg8eHrFcnd+2Gy/s
	QUnPk+qxLaRkZ7lrvEgFhL/k6QCAF3c7txZX1tYJm60Ns39q37uevKNwzVUEdhwcMxizV1NwgxBin
	iUCJDdFPuutavzxcLCeqK7sJOcWfX0Ak0FGX+psC/nTei0ifNy/25nv+iHWlW4yRRFjgG33BcvuDS
	w4HNJGkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDEUi-0000000BEpf-0YDN;
	Tue, 19 Nov 2024 03:01:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDETk-0000000BEaq-3kKA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 03:00:38 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20ce65c8e13so39989905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 19:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731985236; x=1732590036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1hOThp0u4KkIhCVtLoJEiqxjdPOsJLC7BccGXL9jCE=;
        b=T4TUmXwcZwSIxOWRguRS/qBZFCwEJxnB+pxxTxRJHqyBTtIV8VubTAsqqh9c+TP/sM
         lR8LDBtVwssVb6pDMtdZUfvxcgEH7dhDefBbDuDC6M50r6yGpWljAwidSXeexiVomRsK
         fxB45dH9nKnQRTqsiwrX7lRPH8TouRRGCmMkczkzpptL9PZOJDfAAIvVkReHdYdyIfsE
         2Ynl6q4ISOH3sR5KCGuyx2XwPR1XjBBuowVrUL56BEUP0iU4hR9y8CE0LEw1YDTwEgBH
         C275OzIu5jruFwIcsqyly1tVZcSTeyYsaKjilbZLwDb4mALz6vj0us2OSqxQYLq6pARf
         WD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731985236; x=1732590036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J1hOThp0u4KkIhCVtLoJEiqxjdPOsJLC7BccGXL9jCE=;
        b=YFHu1yZr2nT/8W9sS7ou4Tdhzcs0LMLHzshqJNO28NAwalNaNdOJ8t4MMt6mr8LDTA
         UQ3DZ5+pnHQoiwG0NLRiYyHLKY5ClV85UR/bOkSMqKm8tt3kGAvdqVo2BovVYp4UyuMt
         o81kV+UTGF8TppAboMl+k/n9oO99oatuQMhs4IqB3qLqf4rBa196pbd8FokUARHO62lx
         SaNtXY2iH47iREye7dEavwyiCTHXzy+8NNmwp+ksLiUVko1iCibCAxFMQsCe3Af6dQnl
         916iDIVLiqD2zZnlIfSs93u/VVoZ25Lh9//oKZVJOj3tt1KktcD5N8iGhHrixACbpiHu
         +U4A==
X-Forwarded-Encrypted: i=1; AJvYcCWM/cTu0nzFOgmdcupu4RHBKtHWZWyeQm/jbiAFnHwWEaBCSbXC1pNmvSFb8IPgGLJZILUe/H/yeTk42Al1KIHk@lists.infradead.org
X-Gm-Message-State: AOJu0YwEq053cicdZqjiu8ydTv0FwKaGBDmSgXVetqaMYj75SY1RSEUb
	K1cfMW5wNsfz51RR5vQZ42R2plnDMxI7tcFUAyumF2NssMllGxSN
X-Google-Smtp-Source: AGHT+IGKlIRFA/JCEBusSyrc7OfG6NQ5YDS4enGmbxctQfmlSsnccIVXGFL1ug5k6eDj8VaeOzV7bA==
X-Received: by 2002:a17:902:d4ca:b0:20c:f3cf:50eb with SMTP id d9443c01a7336-211d0ebd3e9mr222502395ad.44.1731985235603;
        Mon, 18 Nov 2024 19:00:35 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21210fe87f8sm32760785ad.29.2024.11.18.19.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 19:00:35 -0800 (PST)
From: Ming-Jen Chen <mjchen0829@gmail.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	mjchen0829@gmail.com,
	sudeep.holla@arm.com,
	arnd@arndb.de,
	peng.fan@nxp.com,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	dmitry.torokhov@gmail.com
Subject: [PATCH v3 0/2] Add support for nuvoton ma35d1 keypad controller
Date: Tue, 19 Nov 2024 02:59:52 +0000
Message-Id: <20241119025954.4161-1-mjchen0829@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_190036_930284_7F0E9C6C 
X-CRM114-Status: GOOD (  16.61  )
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

v3:
  - Update nuvoton,ma35d1-keypad.yaml
    - Removed vendor-specific properties and replaced them with common properties
  - Update ma35d1_keypad.c
    - Modified the driver to reflect changes in the YAML properties
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

Ming-Jen Chen (2):
  dt-bindings: input: Add Nuvoton MA35D1 keypad
  input: keypad: add new keypad driver for MA35D1

 .../bindings/input/nuvoton,ma35d1-keypad.yaml |  69 ++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/ma35d1_keypad.c        | 386 ++++++++++++++++++
 4 files changed, 466 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/nuvoton,ma35d1-keypad.yaml
 create mode 100644 drivers/input/keyboard/ma35d1_keypad.c

-- 
2.25.1


