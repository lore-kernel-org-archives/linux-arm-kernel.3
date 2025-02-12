Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F70C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 23:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CVcFsp2axQVfidtPs1ObjaNf4Nt0uTp1iDy8yRGKHwk=; b=SiG8qwwH82+XU6/LzLW2a25ADU
	a1kGAAhEAaIbRftAS6y275ZIaBuIVZ4EToi2MQUep0yV1Hl509AULSxFDGLMlfJg/ZJ7EKTTL3+cQ
	hl4oEKgXbk7OmBWaHehWqTaExkuzgm2wMLpxWSJ5H7AoOk62wNhk8U64rhpMHPa3wLNnX2k5kcLtb
	bfVmvbFvbmzhgilHq+oiNXtw6oW288pp3wZOux+S/1VyLe6xAOzPJwMX1dKk6kNQVkflOZkf7WgV2
	G4Amhic6+lt1L9GHhR5BbhQlqcJctKodPXyLJF9Rkkq9WmiAxITcRskFteysREcBEerOBb8RBfL1D
	NlELj+LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMN2-00000009CKK-02De;
	Wed, 12 Feb 2025 23:42:20 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMLa-00000009Bz5-1YD5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 23:40:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21f5660c2fdso4218425ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 15:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739403649; x=1740008449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CVcFsp2axQVfidtPs1ObjaNf4Nt0uTp1iDy8yRGKHwk=;
        b=QdIQUuD8ZiWWM5aJnp/n12LtRoq9+YsEREdF9W8d3RonfLMo6iyEzg1wthCPrEF2xC
         MfVq6xt5lVrbaaQj79FtsXWcz9UE7htCbw7G8y62pLjFUvXZxldUifwDmS8tLNOzRy6S
         ltiGfz1hbZ6e8gbRYi/sLgwQ18LVeWNmm1UA2zaj3Z4nTO/04T+TJoZ9m7NHGUGm/G5s
         c9RxK/fLmcNHWh9HL/ZyOgzAi8u5nYm472jwmKj6HuX8X6OdMPUEtxpaUcyMYSsOT1MC
         8RJ8Cj4wYzZ23sCeMSB1qeS/h/be+F5G0FmFrniLHPE4e8ZDRXCgERWBOKxIsbaNbi++
         lddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739403649; x=1740008449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CVcFsp2axQVfidtPs1ObjaNf4Nt0uTp1iDy8yRGKHwk=;
        b=bMHTmWyj+6rX0DGVAXLlSMiNQZkuPSuTFWjr4So1UM8fBzlIr3rfWaSU3eOkB/7CPK
         QapxOf/5drTDfrJSO1urWl6Y4e35/kDfr0S5mUoxb3ZiQlDsjRz2Ul8nkiGa5+yj8h0x
         WC+u/TePC3jBxI7ZRVooFQEPRdqt+pCSj/IxZckMFU02AUS9q/4sP2j00rEH82/sOyBw
         vmeXjS8HIS5okAES1N8LUzT0t+PF08fLzYQ0dct4o8FSqCO+YC6He3pIX8rPoVre1T7w
         4jY8ngR4k7ERxIRo5OJf2qThvI2sP8MnMB5p3EItRMOb4RNiW3AhZRA4yDBRk7DirJQO
         d62A==
X-Forwarded-Encrypted: i=1; AJvYcCVBaSMhr0PX2BKbm3VMpASH/4vzHtKJjC0YuKah5hCdntNslI8qZYx+A+JJtozqF0vwupP92wn2fR8/bwotxc2o@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm4J+5Jv3d41iICW34iQAm5wU4/enEHtjyk2tos11PZ5Wr/FGN
	XsKSndjBFuxL42mDVOL8GuV+exggIibLQsSKvd1MCGG03SjW+R1d
X-Gm-Gg: ASbGncv4JFgF0RPLSemJ9J90tLruz/Yaq7JJOw9hvNebo3pzBkRFswKpsfPuvnWs6VN
	WNA80R8r4WI7umZxBaqZKXREgP5mvmSWzHR0tKPvbud2A22mLx4rAhVHxbHRyMzsWPIYuJFiy1b
	VS2ZPSezKM5CrMAxBVn5PPwLU1smxLEU9hWjIBn0gqSZSjAsG2uXl0xJyOWU87bk203fo0foiCz
	vZ+2P4yRzUhODTmw3OJRmMG2PLfe0b8IbxqycgAJwCwtURveMtteTTE4JWu9LuG18lZHonhbsgf
	+DmXEWuq3sM5PBRUJ3DgF/asRJquMq8QmoA3/aEoLhYzdiGPc+YqaRsT/VaeYKOojlyQwC8DVGA
	McQ==
X-Google-Smtp-Source: AGHT+IH/zoQ0cDlj82q0vi/Ewd3EwjOZ35/p6rjGR2yDCOP9SHDBIMXEqqGWFjjKaJ5OGXOOAn+nFw==
X-Received: by 2002:a17:902:e74d:b0:220:c94b:83a7 with SMTP id d9443c01a7336-220d20e9098mr14481345ad.29.1739403649333;
        Wed, 12 Feb 2025 15:40:49 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d021sm964155ad.157.2025.02.12.15.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:40:49 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	semen.protsenko@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 0/3] arm64: dts: exynos990: define all PERIC0/1 USI nodes
Date: Wed, 12 Feb 2025 23:40:31 +0000
Message-Id: <20250212234034.284-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_154050_405331_A783B5E6 
X-CRM114-Status: UNSURE (   8.00  )
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

This series adds device tree bindings and nodes for the
Universal Serial Interface (USI) and UART controllers on
Samsung Exynos990 SoC.

The Exynos990 USI block supports multiple protocols (UART, SPI, I2C)
through shared hardware resources.

And also add dt-schema for USI and UART compatibility.

Denzeel Oliva (3):
  dt-bindings: samsung: usi: add exynos990-usi compatible
  dt-bindings: serial: samsung: add Exynos990 compatible
  arm64: dts: exynos990: define all PERIC USI nodes

 .../bindings/serial/samsung_uart.yaml         |    6 +
 .../bindings/soc/samsung/exynos-usi.yaml      |    1 +
 arch/arm64/boot/dts/exynos/exynos990.dtsi     | 1693 +++++++++++++++++
 3 files changed, 1700 insertions(+)

-- 
2.48.1


