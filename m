Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35D7CD98EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gwxdR1W6Z9v5pdo49avh6aIGBoyqUrm81Om04vpO0w8=; b=IJB4Yn1F4P5kIXF76ntcvS/XmM
	Zfhujry3FYz36MMDQkNx1Sb8H8+K/zeoOnucjDscS+3rkNF8wkbI3UPUq+0dGwMxCB6gFEEgvuykj
	gbfW1S4t/Dpcj9lED2z4y3XTpzy+o900O1L9553xvVxY7LdVoKTj/N4BEy/TZfH8miUgS56EDQiuT
	mzAH/T5aDkiwYgqoMcPaijj7a45r8jeWVMBnivdkbTngTRWGfkGlmE1zl0gi0UfPklpbUg3WIIAsQ
	P67CguFbxFw3bL16gwYN4U29epAofII8+5yTFPQ0J6/RU/BAzQfCwVk2eB7/phHWGlCVAB/EhbTCN
	3VSOCMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVf-0000000GnfI-3qMX;
	Wed, 17 Jun 2026 07:16:27 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVc-0000000GneP-2QPB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:25 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c858b5de728so3477609a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 00:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680583; x=1782285383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwxdR1W6Z9v5pdo49avh6aIGBoyqUrm81Om04vpO0w8=;
        b=HB09m+qIKIaz4ekzvzAizr+ZvWvF24oX8o+X4oRnDXMbF610KqBK0TVdQTKs9z9bxb
         yiqmpeaFZGLUGohWbuPTRKmvlByBUzqFZ5YNrKHFQC8/g/uDZB4pGcJX8KFm5cYMmHvW
         /bdRlb5mmdkOAvWOZvWrITnHST2HW24EPeTJ80tfuLHqUNLmegK2KaccPIxT1BlZUUUW
         7jenolJHNYswKEQd0PSHJHd8YyQ3ujGSl158uwH7eQjO28YVu+kSdq670WrV8uQXufnL
         7eucFFe2ieOzWYmWpMLGf6ST3+k58k/hzt+S9HY8yOT0A2AskfAVK0nTMxMBtEXTAgnC
         fPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680583; x=1782285383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwxdR1W6Z9v5pdo49avh6aIGBoyqUrm81Om04vpO0w8=;
        b=k6YF5u73Fflk2Xvg1ZmtCcnseKwd3y29G1mciUvNWiG+Ky2FL0ibS3U66TxcIsxQel
         o48U2my1KJHHWnEHyXw57OuIKQFl5bFr3O4P/4otLjvsk9NGcAQMit80J1+Fth3FDZpA
         NsV70QJp8Ez1lQKCPQpDriZSt12bS/QknvJ8skSPjz2o0eds5txkozbJh8KkaZpoc62t
         QtHCnhLXIqLp8cR3mPoKAyWbBpkd67ySFVndfqdbEqiqsysghjwV7G7iAptz8+i6vJt+
         IMyKIxpX2aRIm1BiZC+u5pVD5boKBDrdQBdzb1bDiw/SDqRQMmnW1Em0cvFlMFKsOCjw
         7yJw==
X-Forwarded-Encrypted: i=1; AFNElJ8y6YOFC/jHVGb8Xb6BloDf/Fin9EPy6trwjziKXs6u2OkfQNQLgWYwWVHRtt5ULZrXPdQOoeqjacViK+EOw+Ow@lists.infradead.org
X-Gm-Message-State: AOJu0Yybz5QTvQ+kmZtep0FI9N2MQ8oOR9VkPR6KOg0YmiNT0BJ6XfM2
	8V0p2vlFOuu3RvMlNXtB/fHalXjBN8Qssmw2yQQqkpv/6KFeAp1VtOT1
X-Gm-Gg: Acq92OFJtroCNKCB5eoW8iR6vWPgCht/7/sxHX6WjxI0EsRXMXm285YXl/q2UP/P9pM
	qaditse1CVORm9IzXGmOS2mpfrOQJdnZuCSHeQ4/9n48UE0jAAVfd/JpxAaEfM/FoogBceMG89x
	e/f/FPlegLOsgSiPmWs8m8pu3s2td5np5pbphNRMMNIRLyxHjeXjWAHsFwsBlf29vEzN5SonhDP
	PNxZxd3yCcatdzUXfNaKUl7xERXTPcmPN8KDnCuoVcUcMIIl1akyfgQbrjbPeFIUrjFL61x8jHw
	vGDmSztDApKUvr0ICnZz+wLRiqI5kpHgonbwbkVSJSyV4Hp5K6SPgZ5owX90w5MXFb+bH7Jd6+t
	OyOqKPx/sQujj3wIVt1dINgjOdgqYR8Gq8lx9Q/kDIFkc2OtuFx1MyonpN/XdDUMTjqGztUIjMC
	J3dOziI5fr/w==
X-Received: by 2002:a05:6300:189:b0:3ab:2fa:756c with SMTP id adf61e73a8af0-3b8b572f8bcmr2880117637.1.1781680582948;
        Wed, 17 Jun 2026 00:16:22 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:22 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Wed, 17 Jun 2026 15:15:55 +0800
Message-ID: <20260617071604.635627-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001624_646625_C29644FE 
X-CRM114-Status: UNSURE (   8.66  )
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

- Disable nfc node by default ahead of nand_rb0 pin addition.
- Add missing nand_rb0 pin to fix incomplete NAND pinctrl.
- Disable pcie_phy by default to suppress probe warning.
- Re-enable pcie_phy on S400 board to preserve PCIe functionality.

Changes in v2:
- Add patch to disable nfc node by default.
- Link to v1:
  https://lore.kernel.org/all/20260529140605.1070764-1-jerrysteve1101@gmail.com/

Jun Yan (4):
  arm64: dts: amlogic: meson-axg: Disable nfc node by default
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
  arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 5 ++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.54.0


