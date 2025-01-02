Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C8CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 20:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B7aF1eq+bXcs38+fZolPr5Vr3auU0RoYJ0PNzi44nGA=; b=ruKldlImCwmJEN52Zqq9EGCNS9
	I3j6/mPMW+x0coLVuOa4EHV2LrSCXPfYMhgPv2SdmW08zbGYH4kZzHx9xjEYrGJM5ukBdldEE3z16
	mSPkZSLW2chxKg9u8Qa/1KYZdq9QQy+pgKeMfLwk7uAPdo3TVORdjw2XZDt5/4QDxmC6xlpUih9W1
	QNX4NYZquFvRxnOeScgAaVLmKUN/hAOvAaKulnlttbdWDlMxUf+2X2oPzJ8T2yOABdJwdYs0UEkO2
	RVHUuXqjvLJGO0CVDu5EpkLwiF3kQPjGLbvhy0gRicuIaxnBD8ui7Ju5A+IbN+JDAqFSz/hFzbztp
	LPasV8bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTS1B-0000000BPcR-2LAu;
	Thu, 02 Jan 2025 20:42:09 +0000
Received: from mail-ed1-f45.google.com ([209.85.208.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTRzv-0000000BPPA-10Db
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:40:52 +0000
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so16364436a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735850448; x=1736455248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B7aF1eq+bXcs38+fZolPr5Vr3auU0RoYJ0PNzi44nGA=;
        b=bPCzbYyTMKUWfeZJhvBhAkfBPIZvx3iP5R2NCnsy7iDVz1VvbBNJBoj7Dxa5z7Wfzz
         9SrkzIG2JY6QWZ4jwFx5YK7fBXBTUhQGf2phZ8JkRfwYVW6qCzY2vUstGdnS3DgQhGEi
         VVJKF9migsMi7PX05EDS0t/TmL/3Fi3w3c/6qQcKjioMjiZk0Env1oYWm95C9yGElGmM
         fcyIqdTkbjC9sw6NzRY75kcSHpHe1zegB2a9D6IAiFxZCAHb+8g6s5/OgaVvAHWQKsKl
         nE/WKfIDyahduaX+54vkGfbYmSWlx163Rmp+4GAC3OuuyDsJDkeiIntw+AUy74QIm4IE
         NpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735850448; x=1736455248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7aF1eq+bXcs38+fZolPr5Vr3auU0RoYJ0PNzi44nGA=;
        b=AF9t8UlaYxt3BHRdcuBnfOTpnw3tHYhyl+E6v3UlYW7DxzShgf8JHvQqoRd/BBQR9/
         ji/UQgbqf4nZoRB/euQ2Mva8x/J16wrB/T01neBrH4YQVi24bbYiQvo0N4u+80MDaYIw
         bha1IkqRDE3kWqYkycSbah3MBrgnH0ccV4L72IuMdiVUeqfmD2//OFUJDY5+MBGnWNqK
         YemTMhRb7p4m+ExiIhKjMwhrBnub6Te9EaWt4m+z8s1pXseiHnZNCopxlknscTI9OXLt
         r7rvbX/9ijiLKFN3e7P6X/76+B/ar963juFImmAKnz7p22GrH/KbI/b33yoQNdCKRWnn
         KjMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOXXGhkQHvIATjzNbhAiXiZMi90yzfLv+YNQOUW0DMo9+0F6K1DkBtzf4LlhRFWHFncxhZV9u10lae/ofefXrg@lists.infradead.org
X-Gm-Message-State: AOJu0YxUfX7i+668xtArFhPFTX9/uo1bXzhW0x3g7h8F0q4gh+B4wlqw
	U8duD10sMpfFWPj1+7DMwVUnRYT6XMwxNT1d6n/Hl32my7GjhuQ5
X-Gm-Gg: ASbGncv068M0Ha0NcbcOK6HxSkIuh1bjquzGOxI8DVxvYqMnhGokiaELXZ/NhTJXu0r
	l2OXmRXgV6HHOxLaR6xC6H4amTlTkmSMnVXJZdR8EEEJT5n2suBzECdwrvquKpLd6N06KfpVRfm
	jGglR5btjN/WsDtbeM3zN8Dv0vNUDsbg8/4fsAaHo+C9BzIp5MnUalGcqanGNFAxCOETg8hIVcQ
	md0GeVUFPZ0entI1bddrsOYXjJURHIfDdwTc9WfDoaFnNIfF1mAoYq88Q6xlsw5xVTJ8s5YDP8D
	By3yWywts9g=
X-Google-Smtp-Source: AGHT+IHPQtap3PTyufeAyVPFpllndA97AqbD6wvm55AJUubhHTVEkCnF9Y804Skp8NHZkaAiw2OgVQ==
X-Received: by 2002:a05:6402:5245:b0:5d3:ba42:e9fa with SMTP id 4fb4d7f45d1cf-5d81ddc01a0mr114968130a12.16.1735850448200;
        Thu, 02 Jan 2025 12:40:48 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe490asm1814251866b.98.2025.01.02.12.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:40:47 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sam Protsenko <semen.protsenko@linaro.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] soc: samsung: usi: implement support for USIv1
Date: Thu,  2 Jan 2025 22:40:12 +0200
Message-ID: <20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_124051_278927_8CCD6B69 
X-CRM114-Status: GOOD (  12.56  )
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

Hey folks,

This patch series adds support for USIv1 in the existing exynos-usi driver,
as well as dedicated sysreg compatibles for exynos8895.

The USIv1 IP-core is found on some ARM64 Exynos SoCs (like Exynos8895).
It provides selectable serial protocols (one of: HSI2C0, HSI2C1, HSI2C0_1,
SPI, UART, UART_HSI2C1). It's a bit different from USIv2 as it doesn't
have any known MMIO register map and the serial protocols that it
implements share the same register base, hence why the way of modelling it
in device trees will be with ranges, like so:

usi1: usi@10460000 {
  compatible = "samsung,exynos8895-usi";
  ranges = <0x0 0x10460000 0x11000>;
  clocks = <1>, <2>;
  clock-names = "pclk", "ipclk";
  #address-cells = <1>;
  #size-cells = <1>;
  samsung,sysreg = <&syscon_peric0 0x1004>;
  status = "disabled";

  hsi2c_5: i2c@0 {
    compatible = "samsung,exynos8895-hsi2c";
    reg = <0x0 0x1000>;
    ...
  };
};

This patchset also assumes that [1] has been merged before it.

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20241222145257.31451-1-krzysztof.kozlowski@linaro.org/

Ivaylo Ivanov (3):
  dt-bindings: soc: samsung: exynos-sysreg: add sysreg compatibles for
    exynos8895
  dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
  soc: samsung: usi: implement support for USIv1

 .../bindings/soc/samsung/exynos-usi.yaml      | 22 +++++--
 .../soc/samsung/samsung,exynos-sysreg.yaml    |  8 +++
 drivers/soc/samsung/exynos-usi.c              | 58 +++++++++++++++++--
 include/dt-bindings/soc/samsung,exynos-usi.h  |  8 +++
 4 files changed, 87 insertions(+), 9 deletions(-)

-- 
2.43.0


