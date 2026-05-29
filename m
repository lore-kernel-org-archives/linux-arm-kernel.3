Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893E6CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YeqM+miLLQz/iilbW/aMNZ8W2aMIAVim2TI81LDeOXw=; b=Indwga3v2M9pqNb7AddNig2Yhk
	sgCAaS8bgvnqlgqXvvgpVxINgik6CnvMdvk4TYFt4s2GsilNRqKGJPZ0qaKD9NbugJ61G55ebfpuM
	xZi+KtYwLfM9f39MPKWUq8b5TR9ERforhs6XoGaFP+ooCKp9iwUCD+liaRLuHIRbw2VyuwndM4Tt/
	GVdta6Bj/RlnIs7Vv2pW0Iw7yii8SOIRr6Nezqa/eY5TyNt1h/yF+IfXjUPg84Rp+kYv5Sr0gbD6B
	vMIGAyCl6D45r3H6gOethjRWDuCY7CxFb+qPPXVR9gMVBbmZwz6yg74OuHNTW/92ZC/IkXZaV8cTk
	uaj1CjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqr-00000007UFF-1tjg;
	Fri, 29 May 2026 14:06:17 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSxqp-00000007UEV-0Auh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:06:16 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2bf237e1433so6328465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780063574; x=1780668374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YeqM+miLLQz/iilbW/aMNZ8W2aMIAVim2TI81LDeOXw=;
        b=q1lKa4+l1Iit05ocZgxRNbcAotoSMoitCrN7dsAfxjs0AHaWred7xASsmxBDkwhBEc
         fR0uPODhs5RR01Qj4085qA8ZVPuq3nR4AfAxYbT+cPJXO8V2aQqzsgUoMHG6St0gfjl3
         TF7Tde7Ld9pE7MK+uY2tZYhzVUonvEj+jCDxWm4d8SzZ7gPsY8g+8Nkx9x880lbGWBQ9
         mG0F/rblfrfcPlnGpQkvA39Ew13K+norfwcVyVJR5I6OXwQPDASWhTFcHtvu+0rMDAG6
         0+N/732mwMYzChdHuQr/ThX8NDwliejI5EvRnHYCyLGr1Btt2FzOqMVqWZE+y8NUk2iG
         UuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063574; x=1780668374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YeqM+miLLQz/iilbW/aMNZ8W2aMIAVim2TI81LDeOXw=;
        b=PPINTj5DaWf//Z/5dwGN0AftcqdHGhHQIe6+H7qtDh9GQ6gRUHtSncOdrExKj0s48S
         E8589vP2Haj7y/SO7uMx7SBYGg3Kjd5vKTxHsi8gZ7U8NQAKlFe3sNCx2N9jH8BMiFmo
         CO2FBbhPldYgA6/v/VsM8qjv049i8rhLMawNjNEL87o6Wl+RJ+4mINs11XII53qYTGh/
         79AGdUSxXcUzL+NZdj22zBUyiIu5F7Ejn5LsAKuMdyFbBwMsQdDyyxfSghcqlAoThuBx
         oXTWFeuRxA/RcAERC39kLox6Yvxum870RnUhwDGjHCBaW6QwdXHEAn7MZTEkaXzYHWrE
         UyeQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Lq7r1feI836zD5mtRrgafZpVbx8r3x4AZYV8DFKa90wW32PEesYSL7b//BbAmXrzCeCEsdakgfJsnH5lJhh2A@lists.infradead.org
X-Gm-Message-State: AOJu0YxdzSMAKtsKTMYiTFRx4ZQmw9we7cdin9uOPeJ28gzHCwoPhVAL
	rHMWO/96gFWwBBwtKNyk2mhI/0YMs3jgD55duJF/GgJEHyeNA2pr8cBL
X-Gm-Gg: Acq92OFggh1Jb0yFVijgOWej8Gmlxb4hN6yH8wHgEpNHFfkE1SUaWlS4k33oelF15wp
	JIFo5IAgz53KZD0BVRQ9IP+OTMXv7LVl5lEswk7O8gPxeUNi5bUMklSGzOzwSyIXqzTPyHnT2mM
	l9R+PK9p5KUFv75rD64LOoyLrmoWekfg+Bz4uhJToo3LVBhsArdjo00aagoxGN830En6dng3gA7
	7OYzJkcXlMReHzTZ3x6Gs5YQFtgWxfKENgb1/9my+4FTgbaZpH32vwIAZ3qIFwCic2MKf+rFyN1
	fPQRzL0FsulJmnhzRjyQl7FSPWu+JhmifqafdvcDUhqKJoo2gk+Ts4dTm9mm4hshPAv+YirU6WX
	EqqEZ0g/IxpDXtLh5kkJMM6iYeuMGCAmPJaQS4ffPNW8G7yGNOKCUS4nsys9QFP1frfBmPrEGKc
	Qa/BEts4f0qBGARpgvKvbP9EX6g092rw6IV8sPGp3lu6zkrQKQng==
X-Received: by 2002:a17:903:9cc:b0:2b0:c59f:3b58 with SMTP id d9443c01a7336-2bf204fd8f7mr40348705ad.9.1780063573773;
        Fri, 29 May 2026 07:06:13 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c51f80sm22926645ad.80.2026.05.29.07.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:06:13 -0700 (PDT)
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
Subject: [PATCH 0/3] arm64: dts: amlogic: meson-axg: NAND fix and PCIe PHY adjustment
Date: Fri, 29 May 2026 22:05:56 +0800
Message-ID: <20260529140605.1070764-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_070615_079644_A3E54086 
X-CRM114-Status: UNSURE (   9.20  )
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

- Fix NAND pinctrl by adding missing nand_rb0 pin.
- Disable unused pcie_phy to suppress probe warning.
- Re-enable pcie_phy on S400 board to keep PCIe working.

All changes have been tested on real hardware.

Jun Yan (3):
  arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to
    nand_all_pins
  arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
  arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy

 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi     | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.54.0


