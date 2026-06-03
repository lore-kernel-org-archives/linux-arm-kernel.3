Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77162CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iQaGls+cCUTlqsfODIVaPJ5QJAcFj3/QMHEsorpgOH4=; b=Hj1Bonojt1sf9vMABcP8zA+b4f
	91aHT+iFhhNOEJBY6EhRjbEB1i8hC7grOSIKvCAhF0p9t4gofNFa5+IHLnU4PN4+QeKNwQzRsa9vo
	u3DsF4uhnzT6sae77BpEHT4SxR8/HAj9GhQyYWtcGnfyGJuebUV9VlXnDpz+/ECMvCFi1tISfhXmm
	xKgH1xM9Gn24iWfy81XiWdlnODxYRb82sfIoDm9DJ1NJ82gn/CJcQvCW/FJBiIqJN+0xaihUeePtW
	ib2I9Xn+AhcNESbv+zKSeUtOMuyQJGR8qSvUnnr1L1yp9OGyQ8YMMG+M36GG9Y014zPHHO9u9VqRL
	jwyWSMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdKl-0000000EFI4-1i7l;
	Wed, 03 Jun 2026 04:36:03 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUdKi-0000000EFHc-0kxy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 04:36:01 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8423f52af13so2161068b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 21:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780461359; x=1781066159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iQaGls+cCUTlqsfODIVaPJ5QJAcFj3/QMHEsorpgOH4=;
        b=i2qVNfm9AO+Hz0KyAU3dJhZRKeLm9J1OeR0hz0wU/YwmwdhKBE16qJCUsJXCd2ISbR
         73FHompxO2elJjDfK+FBb0CIgzjz4yg9IC6slflof70Bb/RFL+rBDkcSyj7YEzTFx9HE
         5tw9y8hNPwu21Pgqdg2k/pVE10tPOBsWpD1Np5BuTPuAWBKAmVaH+7aCnWcVvb3vLaxi
         K4k0WVTUvzSJpjV62JXNrSGFFpKDgUcuCvT2qpCih+TlqdB0e5kE6FXp5dI6yvkTsfXk
         Gy/dOFjNrTZBHVKt3ahluftJhRw5FuiLXExWgZx/7N0Il3zEP11RcGjaMafdbBfwe/7x
         HCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780461359; x=1781066159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQaGls+cCUTlqsfODIVaPJ5QJAcFj3/QMHEsorpgOH4=;
        b=kJTPMc1QbNXFrVZipCb2DuL6ubD+zVijSs0IVtdFMMr5N16sfmQqzO/XI4CzFI3pi3
         CIeg0JxFMfWMaKPxyqdP4FnZZ3xsPAaTvAPpGFeVFUz9piBK3N9cBJFFDhCqgFzJae48
         hPEbjUhI8HWK0a7r5mzksG/EfMXQ9D+5H4cpTCW7AmPg6T7GW5vSPmMC7/XhdIm9EeHX
         sW13PQ/Bc3SyLTnmkcktUwBVy4DjFc6GRecaSWZVffKRgWEG8IaOFDk/GUtO4/Q7T6Qr
         xp37gRzZCWoOeMB8FytbYRWCTymaRftyl+KCmdL5Tzl/l9sV+xWdzcrQVxUi1alIosmJ
         snTQ==
X-Gm-Message-State: AOJu0YwW2QFAo1xJ/kSwlXvyWxF3JPQWEH8LhGkyCn6KzdnRmMwIAdKp
	8DiZgyFeSKWQITUSx+XuxWgQ2nrO+H+y2oyPZJ1l2wySWqV9lD9H7Zo6
X-Gm-Gg: Acq92OF13wjTaXqXrSf6D6+TRL1qFgD9GjSeFnlagDrfZ4djiNiMe+qc4WF838f93Gu
	QRgLobO0UHzq8hU6ncA8zJqCWMiG2mkx66IkG/9tEOkL0mHYskIKlAGSZsBkOduE+7VU3lpV+s/
	pkgrkP/DFeA7l21nyZg8NVnAR61k1Z5zrcFKMOC0ntkoWuBPBZzNoqyGMX5hjpbmxesDFR/psEm
	nVcxXsbcmscunRIqmxva4kuvh25/NgZsRQ4dsKIUI521suAxRCk7RG2emLUdC7XGbN7gI4nu++S
	6++zaZhUvOHIMMJ0ygt7qXul0LveHQ+F259X1kuBspdJbu65TjkSza93ySPqDD6qikSyRVvXGvi
	4m4W3znGkITjpzgcz1kvWZ++bfYwJzJhZcJ5PumGEKgMrbo8G6+KDG1S/NKGhRD/G0uwYHYa9lo
	Y97n4sM+sFQ5mVA4U+FURpM3MK/DAo7F0BFpOuBgSpnmJl0ouQXzxRTRfStwJ6xANu6EDXap3Rm
	QOnvzEMRRbGcbuppAb+3W25
X-Received: by 2002:a05:6a00:4085:b0:835:443e:4bc7 with SMTP id d2e1a72fcca58-84284da6fd5mr1639543b3a.13.1780461358687;
        Tue, 02 Jun 2026 21:35:58 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282904889sm1478742b3a.55.2026.06.02.21.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 21:35:58 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	Chi-Wen Weng <cwweng.linux@gmail.com>
Subject: [PATCH 0/2] Add support for nuvoton ma35d1 qspi controller
Date: Wed,  3 Jun 2026 12:35:49 +0800
Message-Id: <20260603043551.1062112-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_213600_250174_74D05B27 
X-CRM114-Status: GOOD (  10.95  )
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

This patch series adds qspi driver for the nuvoton ma35 ARMv8 SoC.
It includes DT binding documentation and the ma35d1 qspi driver.

Chi-Wen Weng (2):
  dt-bindings: spi: Add for Nuvoton MA35D1 SoC QSPI Controller
  spi: Add Nuvoton MA35D1 QSPI controller support

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  61 ++
 drivers/spi/Kconfig                           |   6 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-ma35d1-qspi.c                 | 579 ++++++++++++++++++
 4 files changed, 647 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
 create mode 100644 drivers/spi/spi-ma35d1-qspi.c

-- 
2.25.1


