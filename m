Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942CAE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 11:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nwph7eonXv9FvAIAPWUAen7H5AAgYZRILX4Lj5GM0pg=; b=ihzm9jA6VOKL1OxnMGMhbiiZgt
	XHVzHMG3y9sKPtRVUwKlkSWpqzkbmBm/vx58ZXJLTUAYeBlKzkRL6eyz2A75dQry10cZQKgWfa/XK
	VvY7mw4bmpgF06YFN2t0eJwwXIKYRW+/N9O1z8Q9a9/madCsBjMxzYC7f5CZOk1DgAatzZ7PkvKe1
	kHO7dy9saXJq3p+1EhPkMl4067a/UOIsZDDO2GzDV+QXIQyEtEj3iDJWFDncrsPBXxNzdOHQp0mnd
	EPcprZCa5tolLfUFDMibFyfY/qVoxZ3rV9Sac3HkOO7+nd2ivzNRRwMr9Ewk+Fvfu+rTUPJT18E3O
	d4Ua8RjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRUo5-00000001mAP-20s9;
	Sat, 28 Dec 2024 11:16:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRUmt-00000001m03-2C2s
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 11:15:20 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43624b2d453so83002175e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Dec 2024 03:15:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735384517; x=1735989317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nwph7eonXv9FvAIAPWUAen7H5AAgYZRILX4Lj5GM0pg=;
        b=F8Qq8NmMTfF92VrnOHatklFWNYivXOGtxwN6vOwBdUNy9iGyv219cK9NRAL1rsFECl
         hiuNCvqAW5kKAetNVR/o16wBg6IZwQm57jkPpM1a7EOZ8NkNRzgxhapVS1lp/o1ulUGQ
         RShkwp19jdX2dgZA00ZYoEhtAfigKKn5bV0RyU/6gr3o7C85GNlbO3WuhJRxipqaAo3l
         nPSEYrlipQWezwcOU/YWLYf/2P9B6OsGN3/rRbo8/4xFZbFhwN0PPB/axy9Dny7k0a8u
         Zwt3lmG5mTu4+Ko7Q//4NNHKIpvlcSIopmISUo/WaZTkuCLHH0I88FWyKWVwKAWCx1k5
         02jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735384517; x=1735989317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nwph7eonXv9FvAIAPWUAen7H5AAgYZRILX4Lj5GM0pg=;
        b=C1AFEaNFloGCpXh1mSvq7ZdITJ5zpx4/4wvdqDhi70juD4OT1ikE1Deuovh8Sz1pCx
         D9Fu5WRY0f/50Tr7DBxz2M8NdaZUKYwBmstbu7MDWoRBeuTqKqS4H2TknsZGHMVMhJeE
         QcU3LtwLp+SoBrQMniL6KSol7W78S9gXTmP+1DljDXByptxvfmPferqTNP93xFgnMF+C
         dkEMZ+zFnx/YcVCEOvgidh3jSUuvSZ/6VSIEcM+KSUPtOWuVfBt+xhhKtQpCikMz8Nzz
         L3j2Fva/8mBbJcu2+PfZkd65Z3yq/ZuPz8p66MipsI2E9ijql447A+Tw9Vr3/2Zd3+ue
         H+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXn/NA/I/O17JmQ/kmmU3NkTv4rmx6qhmKUgrCJtwa3vzrwCFSZ+QYYPHYbVTTr0DpzEiOyZfLiAzpSQ6bvYBUZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzjKToj7QdXEpbLyaeP/+41b4ksdhcgOGxLpUyIRHs6LSjeedxL
	DIA1fJGWD8UGBBMfGhL7JyMhXRniqSc4XePpgqT3tMehIn6zTAG9gR0YNg==
X-Gm-Gg: ASbGnctrjE6LjAqNUsHKF9lQ3WUhooD6el6h2eSG8v6zKTVhk4FM8Fp3fbiNZVlNsWa
	Qw2/1eQ0ZsPIUKQ2lPGIHp6ojVYpg3jLSwYEPddX/aS83y91GehtHMFmzDiI8M2oRJiumep5Zpv
	s1djv2I0EmiBQpLOj8StzTPvhGD7Kz2vd50iTh+SWZVaMmXVF8vVV/TEqP1rWcnXMyF7xy+L58/
	p2JnSfzJWevJs7TFF/hQMRVTAVhJTEvfubwwcpD+Gwd1WJa7glDVe5rNxNebT4D25N47abzqOLd
	6bbQqur4PuVJInNA4lFWOMl6++BIxHG3
X-Google-Smtp-Source: AGHT+IHvVyZqzFj4ExfeiMiH77fTmGWeHyD6C7RnVNZMQurDRHi8gE06T2nib6+5L0iUhRLvmSOaDQ==
X-Received: by 2002:a05:600c:35c9:b0:434:f753:6012 with SMTP id 5b1f17b1804b1-436686440bemr274132635e9.17.1735384517012;
        Sat, 28 Dec 2024 03:15:17 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6c25sm326226075e9.8.2024.12.28.03.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:15:16 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] i2c: exynos5: Add support for Exynos8895 SoC
Date: Sat, 28 Dec 2024 13:15:07 +0200
Message-ID: <20241228111509.896502-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241228_031519_568627_A7322586 
X-CRM114-Status: GOOD (  11.76  )
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

This series adds HSI2C support for Exynos8895 to i2c-exynos5. HSI2C
buses here are mostly available implemented in USIv1 blocks, with 5
available externally - hsi2c_0 to 4. hsi2c_0 is available for PMIC
(although I've never seen it used) and it uses BUSC clocks, which are
still not implemented in the current clock driver, so I've decided to
leave it out for now.

In the next few patchsets support for USIv1 will be added to the
exynos-usi driver and with that the rest of the I2C buses will be made
available in the device tree.

Kind regards,
Ivo

Changes in v3:
 - Added a r-b tag from Krzysztof Kozlowski.
 - Changed the temp calculation for better clarity while also fixing
   an oversight (I2C_TYPE_EXYNOS8895 shouldn't -= t_ftl_cycle).
 - Changed the driver patch commit message as suggested.

Changes in v2:
 - Dropped nested-if in the binding, keeping in mind we'll always
   provide only a single clock.

Ivaylo Ivanov (2):
  dt-bindings: i2c: exynos5: Add samsung,exynos8895-hsi2c compatible
  i2c: exynos5: Add support for Exynos8895 SoC

 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |  1 +
 drivers/i2c/busses/i2c-exynos5.c              | 35 ++++++++++++++++---
 2 files changed, 32 insertions(+), 4 deletions(-)

-- 
2.43.0


