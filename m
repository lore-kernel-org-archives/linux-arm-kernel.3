Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16161C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pW77Oks0DmStB3RhQ+Zqom030xkJ3DGvFIDhxb6Oa34=; b=IfpgBTl6faM0H0ZVJunrZICV8c
	m8qRmzAI82Dqa7jij5qQr95ZRPsDTatyp3PK2P8B0BKT8iD13RLUCuB1ZG7ybJD9YwlOs+E8RBm/b
	MP85iWog8Ew4Ugs0a58O0SyXPsc4BOuwpe3Z85ycLi2R6WSQ7Stq29iHxBlU+Z6yguVppdqcSkEG6
	iC7kyIn1uiN+4KiOv+BNBo3SZC13U1aiq6pcO0XNIthvPhFocZegX+YHAKXLDjvKErWhullLkgFEF
	efLRblUHOwz9ZZYZztgBjXKYroJPIvbEsaaOBg5YNVy0n3yH4EYv5rUIR3GekeLtWUMUjivUgJHJT
	+dqO/qMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnQT-0000000GYlW-2i5M;
	Mon, 03 Aug 2026 07:49:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnQP-0000000GYl5-3vdl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:49:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cea3004256so32655855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785743369; x=1786348169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pW77Oks0DmStB3RhQ+Zqom030xkJ3DGvFIDhxb6Oa34=;
        b=mqcEBAZ9dc3nHRImsYByCQ/6LJuN4TUxO/EnXltQHnDrJRG1j15IamYCLO2Usm7MbL
         VIfy0KvyjhpgzzIeAc0SAwppGnwvliW9Z62aFHOnT/N+W0PZtkqFDLsZrblUIT9wmV79
         HVnYPQHtAMN30JeivsOiiaa9IVg6znq7npt1LEKniVtqh5jB55kobsljVq05rXdpVI0i
         i7/mrcgCukc6DOqhHLaKlOr4aL/Mr3to65kR2P/aGiEyVgBv1ecGuMG/+v6rrIUhnVW3
         O6DULesAD/ADfH6nCIjswB/ebvnToe9gyG0mwQColimpWy01KdvXP5DCNh5I7imG6PKT
         QrQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743369; x=1786348169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pW77Oks0DmStB3RhQ+Zqom030xkJ3DGvFIDhxb6Oa34=;
        b=jBpTagJQ0xPDLTcevCP99WGtFeEqbl9Otl3ltEWp49HNvEP/7xTyMRPN0ay50buOLJ
         Gd+yZ/j2m4/O2+nTvNvFraSOMPPDhHfyLlG+8jptj7Z+DgZRfw1fes4Otf4//wufmazz
         Fr4tvHOPYB2VtT7kvyXzHCMq6IfFNseUXpSna0xZcGGKtw5xMEleGuiubKlz+o0Qmgnr
         VPlCxgPN77qWlu+BKadh5cd/OiFK4YyayZqXHVDHyxK40U+KyL6aNTesawarmj/8CLH/
         s8nj5+M9ywnY56+bbVVQv3g/6fnpV8dRgIuw/rszALmokZo5XSUzrE47Wata9PcFgOfW
         /GCw==
X-Gm-Message-State: AOJu0Yx1mjNfyEgUVN1LxuZw8aBBoJ0+MOscxjxZJ75MU1RUhAWjqpAP
	lv2f/RWk0OSaHE4HizfMYToXGaygqpm4z/35sBfKtIZ96dNu/EboDUc2
X-Gm-Gg: AR+sD114cZBoK5nCztH5/oSBCilo14lOdRkAkyDZ9hwZnpZ+VJj6f6nMqeS7XX7A5P5
	rEKEL0lRV9gUNUVrAPJFblOOm9n7zVAxrAjQya7QgxgIXrsENXV9Y7ILzgl2kcmjcwUjhIJ2RVB
	LyKaZEp3JcL6++EZRrylC7DcLRiBSfQFZK65ggo/FtdtFM80qmUCK+Cl2J8ZTn9F7WLNwMw6FOG
	+ufH5LeTpkq4mI3KUTZ4Gnl3b9s2WPMDr2f1q5cmthbEt+GwAETibvHD0AowY4oIj7Q1n64EQtm
	aQwrwNcUA7bDveCiNpGZOXduTdzEmr8b2VG06jqKvZI3J2r5TzP9LFk4PrlV56p1BqgJLHxJjPz
	qo7iA/QmxxJ9SON2ZSFtvJBMiJA/n6smo6yiFoG0He50tzFC75qYgyihp2FOLdCx/gzLf9oVkie
	XJSEi7l0hkiRfnrME1fwfmjBUzoepaY1MXcEQdYIU6mtVsj49RuVGa0vaoMtoZjF56RlxSbo0En
	FWG9N1+kXUxLl/wSOJB2xu9T5P0sPrM+MGzh+VdFePp6hYU3dbZu6ceop0Yu2M=
X-Received: by 2002:a17:903:184e:b0:2d0:401c:2ebb with SMTP id d9443c01a7336-2d0521e93a3mr93702125ad.4.1785743368712;
        Mon, 03 Aug 2026 00:49:28 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b120f2fsm33679845ad.64.2026.08.03.00.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:49:27 -0700 (PDT)
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
	cwweng.linux@gmail.com
Subject: [PATCH v3 0/2] spi: ma35d1-qspi: Enable GPIO chip-select support
Date: Mon,  3 Aug 2026 15:49:11 +0800
Message-Id: <20260803074913.1656675-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004929_983327_F840700B 
X-CRM114-Status: GOOD (  12.50  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

The generic SPI controller binding allows GPIO-based chip selects, but
the MA35D1 QSPI driver currently supports only the controller's two
native chip selects.

This series enables GPIO descriptor-based chip-select handling in the
driver and updates the binding so that num-cs can describe the total
number of native and GPIO chip selects.

Patch 1 removes the native hardware limit from the binding's num-cs
property.

Patch 2 enables GPIO chip selects in the driver while retaining the
hardware limit of two native chip selects.

Changes in v3:

* Split the binding and driver changes into a two-patch series.
* Allow num-cs to exceed the two native chip selects when GPIO chip
  selects are present.
* Remove the driver's upper limit of two from num-cs.
* Rename the native chip-select limit for clarity.
* Reject out-of-range native chip-select indices in the setup callback.
* Retain active-high support for GPIO chip selects only.

Changes in v2:

* Enable GPIO descriptor-based chip-select handling in the driver
  instead of disallowing cs-gpios in the binding.
* Set the maximum number of native chip selects to two.
* Reject active-high polarity only for native chip selects.

Chi-Wen Weng (2):
  dt-bindings: spi: nuvoton,ma35d1-qspi: Allow additional GPIO chip
    selects
  spi: ma35d1-qspi: Enable GPIO chip selects

 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     |  1 -
 drivers/spi/spi-ma35d1-qspi.c                 | 32 ++++++++++++++++---
 2 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.25.1


