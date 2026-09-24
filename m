Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD585C98317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 11:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dvO1Qkk2Cc/fKI8T9OqiFoCZ+Xfk2+7b9EWzAp6ijiU=; b=IIcIGHW3MhN39mhJRo/zPe278K
	5JQUdEOxGYCk8c7NE6IPpf5yYi28NVNI+RFoRyrmK+Rb/gx0btVQkCGNND7T5EAVkEI3RfZEZ8pRm
	moOCJnTZuXm/un2H64MjlYZOTcxhA2GjDszTJbkmK11661er5CRHwCZ/SH18w1LV0D/uud87CnSAK
	Jt4qkxOY+AS+9vzSCoMGg/PMwWwezyxv1VRUHX8gpEjVXoiAz+NDm8Zt3q+EVAGKYn6CSMmSlgKwK
	AMnkj2JhIiLQSLD4aAFHmiVF7hdP6GNWSTIyZM4vlGrGRyKtsc+WEB6jFb49RQyKPAX/m6o+MU8lw
	KlqjC52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hYI-0000000Aqzp-1Hxm;
	Thu, 24 Sep 2026 11:23:46 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hYG-0000000AqyT-06Sz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 11:23:45 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso1007928a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249023; x=1790853823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dvO1Qkk2Cc/fKI8T9OqiFoCZ+Xfk2+7b9EWzAp6ijiU=;
        b=lYorjTvYXc+T+OsR63slPcjjG/y9S5ky7Ku8WFfTtxNdjj4LvafFGvr7B3LNuwnOPS
         0oRlK+Jt9G8lU++bzJ5O0S8EhRhwid1NOGi+nPp2PfiP3JyymEFnO2V3WlZx2d4cW/YB
         +I1J+TjQCaAcG/PF6u96MTezWsEvjtLd4ITAzFaif1NaCcU4zvTvFoW1Pa6Bt0sKXhJz
         j9GGUAsblwjwZTfnqlcR6tYNRHIpka/RfqjXFVMs5GFDP4G90M6iOebVGUQiyaFsOKLQ
         YjcUQA7X4OGvUFHswQyHSbR72zA3FZPvSEwa9gc7SqW0UH5t7qMqXD84iT5F5y81iw7N
         mi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249023; x=1790853823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvO1Qkk2Cc/fKI8T9OqiFoCZ+Xfk2+7b9EWzAp6ijiU=;
        b=GPA+thObRA2mQx1HzM1lTSM5JcOIBBuD98PWAgIRpuodvxty3aeGMog5qyYspPwU2y
         BToXZssuQQkRp7xprU3iVkvxV81urGUMuMJIAkJ2UpK1vZobu4kxH4qiqZ8gSZ86DS4V
         lMv5kQqNP0D5KgzlhsoDI5QFg3upf7VOY65nR9dJzByuwUbabgxOD8TSQEo5Avnj4JbD
         4GWWXAnFlLNJe2ejfPvoO9qrFgfT/Fz+s4n0WBc892MlazfJSoaDWutGdS/HgQC5/7B5
         lKeII+cor8Q90bkPbSdsJqyCcHoUACxfOY42RpOgdDh+J2mj4MF92zXoMQKonDKhU0PZ
         Z+Og==
X-Forwarded-Encrypted: i=1; AKwUvByjJ7eGEvA8i8zPnZ9DxHy2/K5WYgxJ6FO0OAHAKPRCLyjMjt0xFmb/JGmiVHOXAYi58go3X2wpBFCUEIyVj1kE@lists.infradead.org
X-Gm-Message-State: AFuF++nWAQbPSw5da3Vig3LjwGfaPySAaIDjt6MykhFqnPuVce2KBVym
	/MVkAOt8eVdjzsiUauYRMV3l48n0tzMl8EDYkhgY+9pJ3HJeb1q27ZO0
X-Gm-Gg: AYBFou3tPjesU4cU7nZYyHrOD9irXwO1yMuxa/7KJf6LxOqQHYA1atunnUdipjZprg2
	4HgPr+KV0n8cZ57ATE2KFVqhWa4RS8SetVTGHyYjjwlc+5Lo0JUss3LvChAbWYS2/utC38bJzDM
	3CMQD/+4FJX9wwQFiXOG7z7N2CJlIY4ygmZgC6wRsOOgtmBdyD8qBhC4/vCQTe/e7iR5v0QsyAg
	YelEESgDgcYYDsO43pm+QVOzKQlfrCAOWwb0JcFVi77C1GZVBKO/a1sRyouLriONPUTy0NU9s16
	C9l9Gb647Dlb+pTBcvAv+Xqa05I08neS6FkH8gfiRBZl/Siw8gY84SRKf/t/ahNrkfBgWrY2GIC
	I67Uy6kXgiaiqTh8RHTdsrlT/CYv8nPP77moWAB1zBu1WC9DTnEvb2YncIE1SO+TSD/jl00fhcA
	9/Gm5K2MDEYZbJG3q5bNn59cHNlWh64KZwTSq+TFGk06Hw4Ug10nNHvPjIAhomvqpR
X-Received: by 2002:a17:90b:524c:b0:39e:1310:cb36 with SMTP id 98e67ed59e1d1-3a0985bce17mr1718584a91.20.1790249018445;
        Thu, 24 Sep 2026 04:23:38 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0813318c1sm3586800a91.4.2026.09.24.04.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:23:37 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: broonie@kernel.org,
	heiko@sntech.de,
	william.zhang@broadcom.com,
	kursad.oney@broadcom.com,
	jonas.gorski@gmail.com
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	jon.lin@rock-chips.com,
	bcm-kernel-feedback-list@broadcom.com,
	noltari@gmail.com,
	lgs201920130244@gmail.com
Subject: [PATCH 0/3] spi: balance remove-path teardown in three drivers
Date: Thu, 24 Sep 2026 19:23:26 +0800
Message-ID: <20260924112329.1566051-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_042344_059545_EB046BBB 
X-CRM114-Status: UNSURE (   7.96  )
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

Several SPI drivers establish resources or runtime-PM state during probe
but do not perform the matching teardown after successful removal.

Add the missing unmap or runtime-PM cleanup in each driver's remove path,
following the cleanup already used by its probe error paths.

Guangshuo Li (3):
  spi: fsl: unmap immr_spi_cs on remove
  spi: rockchip-sfc: Clean up runtime PM on remove
  spi: bcm63xx-hsspi: Disable runtime PM on remove

 drivers/spi/spi-bcm63xx-hsspi.c | 1 +
 drivers/spi/spi-fsl-spi.c       | 8 ++++++++
 drivers/spi/spi-rockchip-sfc.c  | 6 ++++++
 3 files changed, 15 insertions(+)


base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0


