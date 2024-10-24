Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7632D2C56C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h7HjZCPn22R/d/6vCRTZ9B7oHF5tk/EK1K6/sj2ocw8=; b=jFFnrmbDsIWdh+ArA1EJbpWBqM
	8wzSG3WaJVzmqBZWdipL+4pELUe1QbViNK6zR8yIn0uzlPbeUaWIQMQBjK94rOAv0dkcAFI3P1Qos
	xamnj0LpkodUBn+Kvjc2yFrra8gcqe9tCC8NdjuhQwkBkZMuwRHCh/pMX9ZGF9kFsfdQZ9T32L1tE
	eckKjaoCRPQ1rKDsVOWCFC2Er61zzFcjSUuobIV+9xvhJyxSZI+L9S0XyI2yq0iI6e6Beh5tysTT3
	Siw6Eycl3RzaMEV56zXUKv9MYroq49X7ZsaibRM6WyqBCxAvrVPA37pKzaGrk/kRrm838O1skDef0
	0Rdu75gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vSz-000000008JZ-0nN9;
	Thu, 24 Oct 2024 10:53:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vJF-000000006WA-19hE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:43:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20c70abba48so5854465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729766596; x=1730371396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7HjZCPn22R/d/6vCRTZ9B7oHF5tk/EK1K6/sj2ocw8=;
        b=DWGiIewvMPLS2EyePcXksYqdZzuxErfKtMhj52TjlY2HVDVTSZGyPVvbEx9loPCGgK
         aoKTZl8VMisviGnIH7iv+Mo6FBaiUCP2tmbFs3+tyHTvRCDnUFO3DKtKdi91W6fy06Qb
         8be/LEnB3fma+lPNFyw5etXXutJWM/7hmIe8c9spKmKkKN1w1VRG3vuQMJyego6PWO4c
         sm/lhLCevUOwASvHVi7QnHJUsZqUQPWsLcMA4FEKjpsEUBv/2locC0b2BeB+7kUvVvQN
         WESDy2NWtF23tpDyRYIqK3SF6GP1ADSHWLiC0+8bCawpZZQqaoU8QveJ9C69PFFxLU7a
         rLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729766596; x=1730371396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h7HjZCPn22R/d/6vCRTZ9B7oHF5tk/EK1K6/sj2ocw8=;
        b=TrV6CI5PjjVZwthLoc0A0IjnL2oK1NftQzfWVuKPidZ909wpj4zk75Kmi3Z5vWVXCs
         PdCQt7AxnJaBcOaeNKfzvUMF+vPO8ahJ4WDPpv5P9Re/dHYkr4bJXSV9fCC+55sYEw+X
         QhyuNcF1bVONZUnfg/I8/DbmxC960TRJLkSF/Maz2xiLPajyIgiiiBK8HSzXiar+9aFX
         CfoW0PpOCFjHemhoXjGaMuKmYTzH7u9SlGuI61syT5nPZivcZc3iMwgOCj2UGehU0C8j
         1THR+1o1GLLXh2yexOpaGi+TU+J721rqPxC0uiRnNppycpt19bvKbfPmNmMQeBdpU7dl
         nzKQ==
X-Gm-Message-State: AOJu0YzweuIzTVQdp+u88X8Q104Ch5H5u/k/2QVNzyRCDUyw9+xZ7fyg
	njkAWRRvkDrCeZGTJnXVZyXvtGPclOkCzRxvxVZ3T0kUIAoTjdt7U3QEkr9u
X-Google-Smtp-Source: AGHT+IERBF7N68rMaekUR1OZVbMc0yUseUnfhYs1PSJUJ7bL/4xEUyW/oQnjzLjfkeUypihI4zwOZQ==
X-Received: by 2002:a17:902:e845:b0:20c:853a:52a7 with SMTP id d9443c01a7336-20fa9e9bb64mr68534735ad.36.1729766596164;
        Thu, 24 Oct 2024 03:43:16 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e48ed34sm1252785a91.9.2024.10.24.03.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 03:43:15 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH RESEND v2 0/2] Add support for nuvoton ma35d1 pwm controller
Date: Thu, 24 Oct 2024 18:43:07 +0800
Message-Id: <20241024104309.169510-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_034317_344902_FE6199A5 
X-CRM114-Status: GOOD (  12.08  )
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

This patch series adds pwm driver for the nuvoton ma35d1 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 pwm driver.

v2 resend:
  - Remove wrong 'Reviewed-by' tags.

v2:
  - Update nuvoton,ma35d1-pwm.yaml
    - Fix 'maxItems' of 'reg' to 1.
    - Remove unused label
  - Update ma35d1 pwm driver
    - Remove MODULE_ALIAS()
    - Add chip->atomic = true



Chi-Wen Weng (2):
  dt-bindings: pwm: nuvoton: Add MA35D1 pwm
  pwm: Add Nuvoton MA35D1 PWM controller support

 .../bindings/pwm/nuvoton,ma35d1-pwm.yaml      |  45 +++++
 drivers/pwm/Kconfig                           |   9 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-ma35d1.c                      | 169 ++++++++++++++++++
 4 files changed, 224 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/nuvoton,ma35d1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-ma35d1.c

-- 
2.25.1


